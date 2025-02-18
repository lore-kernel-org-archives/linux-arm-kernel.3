Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9DAC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKGHIbwrgfIoVdKmmj35YqUQ1WX5fO+UqEAUC1C7rcI=; b=AZpf75O4ndqZQXyUj8X8xkSQ75
	2PaevkdFAQqD8lOWkVrYm71BWcI/r35k5+gYlKJju576nvQIPWARmnatMZuOOfvUEp5zdrbhw3M2y
	C2zkU7jZoNY/9F85sAtxtirssE40pitPPGly3Dpxb2cWu0VMjlDqeG/LbslJtQXkZrgaAMypn0Mfy
	4CzBphHmfKdBYChXeu1dsbye+SSl4NsNIMOL2nzRFX6uNmWxublZbq9i4VrUSZf9UnfgWwCzJjFuL
	5GOk2r97oqds0LPAmumeK9pJT7faTgvc1XHYEqLLbmEXD1xrARVMOzNFSYt5SWipNph5Hu2gDCl7P
	Yfm8BL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJpd-00000007Utc-3RoZ;
	Tue, 18 Feb 2025 09:23:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJkH-00000007TQD-1aYo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 09:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 849B15C597C;
	Tue, 18 Feb 2025 09:17:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC84C4CEE4;
	Tue, 18 Feb 2025 09:18:20 +0000 (UTC)
Date: Tue, 18 Feb 2025 09:18:18 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, rafael@kernel.org,
	viresh.kumar@linaro.org, sumitg@nvidia.com,
	yang@os.amperecomputing.com, vanshikonda@os.amperecomputing.com,
	lihuisong@huawei.com, zhanjie9@hisilicon.com,
	ptsm@linux.microsoft.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 0/4] Add support for AArch64 AMUv1-based average freq
Message-ID: <Z7RQWgLksl4bBksr@arm.com>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <173982791748.4020779.2848639862581042284.b4-ty@arm.com>
 <Z7PNlFv2995pDARQ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7PNlFv2995pDARQ@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_011825_462732_64F92E5E 
X-CRM114-Status: GOOD (  25.68  )
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

On Tue, Feb 18, 2025 at 01:00:20AM +0100, Beata Michalska wrote:
> On Mon, Feb 17, 2025 at 09:32:06PM +0000, Catalin Marinas wrote:
> > On Fri, 31 Jan 2025 16:24:35 +0000, Beata Michalska wrote:
> > > This series adds support for obtaining an average CPU frequency based on
> > > a hardware provided feedback. The average frequency is being exposed via
> > > dedicated yet optional cpufreq sysfs attribute - cpuinfo_avg_freq.
> > > The architecture specific bits are being provided for AArch64, caching on
> > > existing implementation for FIE and AMUv1 support: the frequency scale
> > > factor, updated on each sched tick, serving as a base for retrieving
> > > the frequency for a given CPU, representing an average frequency
> > > reported between the ticks.
> > > 
> > > [...]
> >
> Thank you for that.
> 
> There is still a (not so) small issue with patch
> [3/4] arm64: Provide an AMU-based version of arch_freq_get_on_cpu.
> It did not come up while testing, sadly.
> No idea how I could have missed that, nor why I made the mistake
> in the first place.
> 
> The fix is pretty straightforward:
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index 6f0cab8e746b..4bac26d8e29c 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -268,7 +268,7 @@ int arch_freq_get_on_cpu(int cpu)
>  
>                         do {
>                                 ref_cpu = cpumask_next_wrap(ref_cpu, policy->cpus,
> -                                                           start_cpu, false);
> +                                                           start_cpu, true);
> 
> Please let me know if you want me to send new version with the fix applied.

Usually we apply another patch on top with a Fixes tag or just fold it
in if no-one relies on this branch being stable. I'll do the latter, no
need to resend.

Thanks.

-- 
Catalin

