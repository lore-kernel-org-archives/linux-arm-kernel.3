Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92F0CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqN60BuPJ3IrOHfbBCAENpTxaEXAkkkwVCSec+5Hnw0=; b=LfIz7xbxEEoERxvBNDKwW/VjU1
	CCbJEl3LxoZ0cuowChCXTBTir5Itb43Pg4a+jRLc9xynHoG60DC5l9q24ANuON87DGIc3VAhK6vX6
	E0FL68Ys1NcFDA1B7ztdmDdtyWaPtF6vfuKTdboA1ROzvybuL22eRX+2C/ty5VkE5VNWkvzQO2f1N
	/MxsAKRQ6Hb7wztfuysYUl0rcvBbIVNUFMvI+xM9wZLWIUwpyE2sqmPXRFbt1noKtNGN3a/1zwHoa
	Eps9d52scNGeJI4tpgQwZLRG8YUX+zuKwOZElSZ9xAS8FFvgkfb3Cc0yUgiztX5lIoFaJdijBr7lO
	Z3pr2wMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETZv-00000002hlS-2awT;
	Wed, 07 Oct 2026 15:29:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xETZv-00000002hlG-0eyy;
	Wed, 07 Oct 2026 15:29:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 47B8460219;
	Wed,  7 Oct 2026 15:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA991F000FF;
	Wed,  7 Oct 2026 15:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386950;
	bh=LqN60BuPJ3IrOHfbBCAENpTxaEXAkkkwVCSec+5Hnw0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=MTxUV4JO/OyZ8FpkpRpFW7BCTaGXKSVyT5L8zuhfruHSmwE6wVUOj3rC7bf4hG8wg
	 eneBfutJBjkWkn23+L3F0bzueMh23Usv2pN4hzBKCE+wTmeoZzu7nqoV6UkScr5PpO
	 A0rxq8Opa2Fe96e34C8NQtaIX+ssrKqnG5iirmoyfzbU+yu0S9qNbMLwvrNVY0K4q3
	 oNELiSeEDkFCCqWZzDqgdYZ6MYxE0+vJI6Z7h/aTGMFdNMRGAlYJ3+WwUrKAM55Hx3
	 pmn6swzsxt31nTyj0RpXJBt3HD/LEBtUutIYZ8/Z0Npyev6ol8jsNAAgxeeXLEy/mU
	 oPXRBdIOycnwA==
Date: Wed, 7 Oct 2026 09:28:59 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: acme@kernel.org, peterz@infradead.org, mingo@redhat.com, 
    namhyung@kernel.org, mark.rutland@arm.com, 
    alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
    adrian.hunter@intel.com, james.clark@linaro.org, leo.yan@linux.dev, 
    john.g.garry@oracle.com, will@kernel.org, mike.leach@arm.com, 
    pjw@kernel.org, palmer@dabbelt.com, guoren@kernel.org, 
    linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 1/2] perf riscv: Implement rdtsc()
In-Reply-To: <20260929034133.2153-2-cp0613@linux.alibaba.com>
Message-ID: <7a32beb7-27e9-1805-d23a-590ad7fa05b3@kernel.org>
References: <20260929034133.2153-1-cp0613@linux.alibaba.com> <20260929034133.2153-2-cp0613@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, 29 Sep 2026, Chen Pei wrote:

> Perf has no riscv implementation of rdtsc(), so it links against the weak
> stub in util/tsc.c and every caller reads a constant 0 that cannot be
> told apart from a counter standing still.
> 
> Implement rdtsc() over the time CSR with rdtime.  The time CSR is a TSC
> equivalent on riscv: readable from user mode, constant frequency, and the
> same counter riscv's arch_perf_update_userpage() builds the user page
> conversion fields from, so the counter and perf time share a timebase.
> 
> Define it for RV64 only.  Reading the counter whole on RV32 takes time and
> timeh in a loop, and no RV32 user in tools/perf needs it that much, so
> RV32 keeps the weak stub.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>

Acked-by: Paul Walmsley <pjw@kernel.org> # arch/riscv


- Paul

