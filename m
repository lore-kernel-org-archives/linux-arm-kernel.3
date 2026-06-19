Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AF9CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2NuC61jQhkLZlTPdr5bUtoaoRRTUEJ6wbF953eCit8=; b=LBf9TD8ZHAdrA9fA2SBBQ6N4L4
	GIV1n6Q2h96F0zavpOy9vP4Y7d3g5IaEAgvsTECswDB8ZnoV3WfLnFCOXDAN3TttrI+Mae6AxjVqe
	CpKvAMaPzTVhipHAbTBYZUNi2tsy2B947Tec86tdQJTEBUPbrRHhrQQDPttIBkp7lnLZb1OFq4FJI
	eqKX8A1AeIkqKfFCuLBA0OyYlrYW/HiH4iXOVkRqIqwixvECv453yDvKv6oZpcFTlN4jL2E2J4R01
	rQ434HjxVSXtLbI8Xy8WGouJC4bDlEtR3q3pPXz7CEQ3+nR3VGEuKY6W/NmYOYX0AI+TzJoqfs7sc
	OyDtTg0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVjH-00000002Emt-2ATx;
	Fri, 19 Jun 2026 09:41:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVjG-00000002Emi-38eK;
	Fri, 19 Jun 2026 09:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=t2NuC61jQhkLZlTPdr5bUtoaoRRTUEJ6wbF953eCit8=; b=dxCpgYGotPMuA2p6gEibYEHVV3
	8SYC4JMjwV+Fla0Xbzblgh7OCk7snf4aoCvaL5fNDG1m4tQ79ZMZwNdPBvHgv8y6ajbc5f4/YGSBe
	S+O32/eTHR97OKvqdgmMKFQkz9w9zmr2vicnDrlCXPgw4ny9YEgreZAUVptOUKQRahCKBiWhDqhKf
	DSydSwO1kiClKiV4gxdwM4tbiPbercmFalG6w05YvAdx8SRHtNtjt7KI06YAtlWP/SWqW+Fkeb+lY
	X11FaOOKvHvtRfRMcwjrTl8Wgp2VigJeehKMWCaxutPrahrO+YGN+skUyaUbsvocqspsIA7etIWC5
	Izg8KwdA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1waVjA-0000000EM2X-2Lb1;
	Fri, 19 Jun 2026 09:41:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 795F6300CB5; Fri, 19 Jun 2026 11:41:30 +0200 (CEST)
Date: Fri, 19 Jun 2026 11:41:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
	will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, kees@kernel.org, nathan@kernel.org,
	linusw@kernel.org, ojeda@kernel.org, david.kaplan@amd.com,
	lukas.bulwahn@redhat.com, ryan.roberts@arm.com, maz@kernel.org,
	timothy.hayes@arm.com, lpieralisi@kernel.org, thuth@redhat.com,
	oupton@kernel.org, yeoreum.yun@arm.com, miko.lenczewski@arm.com,
	broonie@kernel.org, kevin.brodsky@arm.com, james.clark@linaro.org,
	tabba@google.com, mrigendra.chaubey@gmail.com, arnd@arndb.de,
	anshuman.khandual@arm.com, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC 1/3] cpu/hotplug: Introduce
 CONFIG_PARALLEL_SMT_PRIMARY_FIRST
Message-ID: <20260619094130.GU49951@noisy.programming.kicks-ass.net>
References: <20260611133809.3854977-1-ruanjinjie@huawei.com>
 <20260611133809.3854977-2-ruanjinjie@huawei.com>
 <87a4srdgk0.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4srdgk0.ffs@fw13>
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

On Thu, Jun 18, 2026 at 05:17:03PM +0200, Thomas Gleixner wrote:

> Something simple like the uncompiled below should just work, no?
> 
> ---
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -102,6 +102,10 @@ config HOTPLUG_PARALLEL
>  	bool
>  	select HOTPLUG_SPLIT_STARTUP
>  
> +config HOTPLUG_PARALLEL_SMT
> +	bool
> +	select HOTPLUG_PARALLEL

	depends on ARCH_SUPPORTS_SCHED_SMT ?

