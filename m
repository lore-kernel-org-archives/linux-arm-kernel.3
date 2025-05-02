Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122F1C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEb2WXdqSuNuZnOWzK9BqXNW49TsqffkG//W6uk6Ljg=; b=AKd7Tbl2I/oGa4S5YBp0hTVzWv
	Hb+HNb2Bnu/7tUIITesI/PEknZIoaSmIHyF9JUwJSc3gTwXke/4/OTKtmOsW1FghKyoeXhc/Eqbsq
	cRB12Y1QeumyWNTU437ylVYG9rWLRJSR173K9RPjdRaRuCPMC3SDR699vwn1cyZMbpgFK6eyAVCeG
	5qvTB/S0IUcwGACllcnWvJOOO8gYZfjLrFLJcnm0H5JhPPY/g2d0bOBfGoQuoVxtQd04ry5RCBxqK
	otELiL37A4DeqbxPQA7jNoXRVeUIAXT6lgdTIfVMtTD+y+FU199AsybIDFGfiOaih+XnwrBvBnIWO
	Q7qrIm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6R-00000002e3E-1d6v;
	Fri, 02 May 2025 17:23:11 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtbS-00000002Zi7-1zxm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1746204142;
	bh=mJseQM4e940ZC+UI+S/KGZQbAf1JWqMo50qReiY9IO4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gWGsNIyzDi264sy/by+Q+afF1WXzomrn2/+MHKOv05VJT5nXJaYH4iLcmaUeVPMvS
	 6HB9K4T24iTRveE1mK03GkTsooA5cZ0p0x2Yc8GF6Y9nBukcfXxTJoFB1RZlqO31uI
	 DNHmdNbebq+E2INdiVT0Wj4dD9cMbEg10V32ywpI=
Received: by gentwo.org (Postfix, from userid 1003)
	id E39D9401E4; Fri,  2 May 2025 09:42:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id E0CE8401E1;
	Fri,  2 May 2025 09:42:22 -0700 (PDT)
Date: Fri, 2 May 2025 09:42:22 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, arnd@arndb.de, 
    catalin.marinas@arm.com, will@kernel.org, peterz@infradead.org, 
    akpm@linux-foundation.org, mark.rutland@arm.com, harisokn@amazon.com, 
    ast@kernel.org, memxor@gmail.com, zhenglifeng1@huawei.com, 
    xueshuai@linux.alibaba.com, joao.m.martins@oracle.com, 
    boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: Re: [PATCH v2 0/7] barrier: introduce smp_cond_load_*_timewait()
In-Reply-To: <20250502085223.1316925-1-ankur.a.arora@oracle.com>
Message-ID: <a85fbebe-aa44-5ca0-f8ad-f997ea7e6622@gentwo.org>
References: <20250502085223.1316925-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_095110_563278_6BA12FAE 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, 2 May 2025, Ankur Arora wrote:

> smp_cond_load_relaxed_spinwait(ptr, cond_expr, time_expr_ns, time_limit_ns)
> took four arguments, with ptr and cond_expr doing the usual smp_cond_load()
> things and time_expr_ns and time_limit_ns being used to decide the
> terminating condition.
>
> There were some problems in the timekeeping:
>
> 1. How often do we do the (relatively expensive) time-check?

Is this really important? We have instructions that wait on an event and
terminate at cycle counter values like WFET on arm64

The case were we need to perform time checks is only needed if the
processor does not support WFET but must use a event stream or does not
even have that available.

So the best approach is to have a simple interface were we specify the
cycle count when the wait is to be terminated and where we can cover that
with one WFET instruction.

The other cases then are degenerate forms of that. If only WFE is
available then only use that if the timeout is larger than the event
stream granularity. Or if both are not available them do the relax /
loop thing.

So the interface could be much simpler:

   __smp_cond_load_relaxed_wait(ptr, timeout_cycle_count)

with a wrapper

   smp_cond_relaxed_wait_expr(ptr, expr, timeout cycle count)

where we check the expression too and retry if the expression is not true.

The fallbacks with the spins and relax logic would be architecture
specific.

