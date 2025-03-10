Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E09C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L31iUG/a3tw/F/ljQU4KmJSUE1J7RURW2CRT2EDYCqg=; b=OoPaCxXFB3Q1omyWskA2CofAO2
	YgwTEymv0SIQYDnx0bi8r9M6T6mh53qm7H04Gvyk3HELGMN/VDZ+fwvIrDao0I9v+ZLFmDqmRRCaB
	TyvqWwrurqj+Hm4SQm/sUe5YrrNt3o42SclgSFn5faymE0DQj84zu3QyxQTv92WY3t5S43ZrWLcbO
	fLeGs6UbFlkls7hJ1TOFvo9w4NjnNTBo/EMXnHt0j5mdBFnDT1Jiqe/OpwwW6cNyRNMtGkNryXVMs
	zcmtFSnWGHiGhEIKh59WipfPBYhW2WWHnEMFgjC0E6Z2ANCzXgDJ4ZxT+RPGrboGfRA07Im3WCQex
	dsG1Ha5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgdD-00000003SLT-35Bv;
	Mon, 10 Mar 2025 17:09:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgNQ-00000003PP8-0e9G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:53:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3FDB4A46087;
	Mon, 10 Mar 2025 16:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D301C4CEE5;
	Mon, 10 Mar 2025 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741625595;
	bh=1BgaCQUGjQAOFM2D533osL0JWW3ihZoxHt/01NLC7o4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T90BZrzKkMaFjQSN1Wg9F/kJ/P0/1qgdM5YfI/PPzUXluWCl/0lAsIuPt4k3EisEJ
	 6g5WBqtRXrh0DztHQE16HokVpCRvdv3gXBFYJEc1ns+kyMsYAoTvsHv+1DZtP/RdZK
	 iuXuFB+zwH89BPHlDjijaLla71syZ8n+Dhhg9qViTmcScJY3zpkZgooDXLykJTZvck
	 IB/uTUXesE9e/kJZQ8MyRb42iANVgt2fbt2+PwNNAnqiFW7G13vJiylJEqlqXH8H1J
	 HULez/bKqe48z/oNYxTLZbiVWDg8EQAQ9JvQOhkAgn3WUw6tdm8nLLlLRV8IMJvME5
	 6IA/VEFHVgVhw==
Date: Mon, 10 Mar 2025 16:53:13 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>, arnd@arndb.de, bhelgaas@google.com,
	bp@alien8.de, catalin.marinas@arm.com, conor+dt@kernel.org,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, joey.gouly@arm.com,
	krzk+dt@kernel.org, kw@linux.com, kys@microsoft.com,
	lenb@kernel.org, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, mark.rutland@arm.com,
	maz@kernel.org, mingo@redhat.com, oliver.upton@linux.dev,
	rafael@kernel.org, robh@kernel.org, ssengar@linux.microsoft.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, tglx@linutronix.de,
	will@kernel.org, yuzenghui@huawei.com, devicetree@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, x86@kernel.org, apais@microsoft.com,
	benhill@microsoft.com, bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v5 06/11] arm64, x86: hyperv: Report the VTL
 the system boots in
Message-ID: <Z88Y-R7BnXa4Xi3I@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-7-romank@linux.microsoft.com>
 <Z84yyAqkqJ2ZyAd-@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
 <2342dda1-2976-4506-ab68-640739a1bd5b@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2342dda1-2976-4506-ab68-640739a1bd5b@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_095316_316564_91B91710 
X-CRM114-Status: GOOD (  26.44  )
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

On Mon, Mar 10, 2025 at 09:42:15AM -0700, Roman Kisel wrote:
> 
> 
> On 3/9/2025 5:31 PM, Wei Liu wrote:
> > On Fri, Mar 07, 2025 at 02:02:58PM -0800, Roman Kisel wrote:
> > > The hyperv guest code might run in various Virtual Trust Levels.
> > > 
> > > Report the level when the kernel boots in the non-default (0)
> > > one.
> > > 
> > > Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> > > ---
> > >   arch/arm64/hyperv/mshyperv.c | 2 ++
> > >   arch/x86/hyperv/hv_vtl.c     | 2 +-
> > >   2 files changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
> > > index a7db03f5413d..3bc16dbee758 100644
> > > --- a/arch/arm64/hyperv/mshyperv.c
> > > +++ b/arch/arm64/hyperv/mshyperv.c
> > > @@ -108,6 +108,8 @@ static int __init hyperv_init(void)
> > >   	if (ms_hyperv.priv_high & HV_ACCESS_PARTITION_ID)
> > >   		hv_get_partition_id();
> > >   	ms_hyperv.vtl = get_vtl();
> > > +	if (ms_hyperv.vtl > 0) /* non default VTL */
> > 
> > "non-default".
> > 
> 
> Thanks, will fix that!
> 
> > > +		pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
> > >   	ms_hyperv_late_init();
> > > diff --git a/arch/x86/hyperv/hv_vtl.c b/arch/x86/hyperv/hv_vtl.c
> > > index 4e1b1e3b5658..c21bee7e8ff3 100644
> > > --- a/arch/x86/hyperv/hv_vtl.c
> > > +++ b/arch/x86/hyperv/hv_vtl.c
> > > @@ -24,7 +24,7 @@ static bool __init hv_vtl_msi_ext_dest_id(void)
> > >   void __init hv_vtl_init_platform(void)
> > >   {
> > > -	pr_info("Linux runs in Hyper-V Virtual Trust Level\n");
> > > +	pr_info("Linux runs in Hyper-V Virtual Trust Level %d\n", ms_hyperv.vtl);
> > 
> > Where isn't there a check for ms_hyperv.vtl > 0 here?
> > 
> 
> On x86, there is
> 
> #ifdef CONFIG_HYPERV_VTL_MODE
> void __init hv_vtl_init_platform(void);
> int __init hv_vtl_early_init(void);
> #else
> static inline void __init hv_vtl_init_platform(void) {}
> static inline int __init hv_vtl_early_init(void) { return 0; }
> #endif
> 
> > Please be consistent across different architectures.
> > 
> 
> In the earlier versions of the patch series, I had that piece
> from the above mirrored in the arm64, and there was advice on
> removing the function as it contained just one statement.
> I'll revisit the approach, thanks for your help!

As long as the output is consistent across different architectures, I'm
good.

Wei.

> 
> > >   	x86_platform.realmode_reserve = x86_init_noop;
> > >   	x86_platform.realmode_init = x86_init_noop;
> > > -- 
> > > 2.43.0
> > > 
> > > 
> 
> -- 
> Thank you,
> Roman
> 

