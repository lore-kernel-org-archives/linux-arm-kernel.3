Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F5CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvi6puQA0J0hA9rYePYBkk/sQ0USpeIPJk0WcZ47PBs=; b=k2IlmqvXHG3G7fAVM7TUVoi28Q
	4QjtZRJbTbI6EMyPv1aHp/e5WbRm5dVFH3ivaB8Kr7N0XApcKIohA0UYsKX01p0P3EU6nYjyAnkiF
	oLEx2R3lyfSp3RDA7/1QJ4sNybtJiMTpBm8+1my30N0Xm53Tbw4gs4w1vVqv5c8Ve/eE2VySLUom4
	OnkQcpWW24r7OGPg0wgxU8OG2BpdHMzG3uecsH1z+WpOmPMXxmY79xlwtw5jCLJg+ViIp4pf2oenK
	RBk0BX1655y9bQnvEPLXFwv4c2e5Y/lLdY+Z2k8Fs/JdM3yP74eCNvdVQlBNyoFlqnghfIVtSpQTb
	af3axGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2JA-00000000UXr-24iH;
	Tue, 06 Oct 2026 10:22:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2J9-00000000UXi-3ED3;
	Tue, 06 Oct 2026 10:22:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8D342E12;
	Tue,  6 Oct 2026 10:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC6B1F000FF;
	Tue,  6 Oct 2026 10:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791282122;
	bh=tvi6puQA0J0hA9rYePYBkk/sQ0USpeIPJk0WcZ47PBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=J1U5RfrKVeP+O4jqaKDHgViRN05qb9EM9Ow1h1Wq3zq++FQwMjOceD42csp5T2HCP
	 i4SQN58VQayxBkq/PLuKIXLU+KdLNU9LT0f6v3i5OyTx3dwvfYPKAgq1fvXfLrF0bM
	 /QcMGDDxqEEv/AaEnXTMVA5Z2b19XuC+aLAR6Bnw9DJxQT36qn3BCzvnXP3mkPMC49
	 Rqi68kedr200C4HRCqsVLWgsyVU0VK6suF3v8YaykyMc4wf5GKLPSdbWX8zBA7gKqX
	 HoBRJ3r01WmcEZLIAyF5w1Uzxv8mxRmPnxv1ODiOYAx/mqEnviAm2uzXFHPcXoI7yz
	 qkeItwitvc/sA==
Date: Tue, 6 Oct 2026 04:21:53 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
    Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>, 
    =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, 
    Yunhui Cui <cuiyunhui@bytedance.com>, Atish Patra <atish.patra@linux.dev>, 
    Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
    Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>, 
    James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
    Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
    Randy Dunlap <rdunlap@infradead.org>, 
    Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
    Yuanzhu <yuanzhu@bytedance.com>, Yicong Yang <yang.yicong@picoheart.com>, 
    Susheng Yang <yang.susheng@zte.com.cn>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 0/9] riscv: add SBI Supervisor Software Events
 support
In-Reply-To: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
Message-ID: <29e631f0-c135-bea4-0a3b-81dd715cef54@kernel.org>
References: <20260911121456.33223-1-zhangzhanpeng.jasper@bytedance.com>
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

Hi Zhanpeng Zhang,

On Fri, 11 Sep 2026, Zhanpeng Zhang wrote:

> RISC-V does not architecturally define a supervisor-mode non-maskable
> interrupt (NMI). An interrupt that arrives while Linux has cleared SIE stays
> pending and is not observed until interrupts are enabled again. That is
> correct for ordinary interrupt handling, but some kernel work needs an
> NMI-like notification that can run even inside an interrupt-disabled region:
> sampling a PMU overflow at the instruction that caused it, or taking a
> high-priority RAS report promptly, cannot wait for the next unmask boundary.
> 
> The SBI Supervisor Software Events (SSE) extension [1] fills this gap. It lets
> Linux register handlers for events that the SBI implementation can deliver
> ahead of ordinary traps and interrupts, giving RISC-V the NMI-like supervisor
> notification mechanism it otherwise lacks.

Thanks for taking this series forward.  Could you please rebase this 
series against the current riscv/for-next branch and repost?  I tried 
pulling the series in, but it needs quite a few updates since we've 
queued up quite a few patches that touch SBI.

thanks,


- Paul

