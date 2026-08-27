Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA85DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36/tSxlvJSnTtT72QDlzCF2fbgza0CguY6MLkS5buvc=; b=g4Tp5I3Tq3AwYJlhIyfxrtacHH
	Dq6MrqAiiItF17o3CO3FPH31hObzHCnYDBC+oeG+Zy9S/Vwm5l4mJrEUZGQRlVj0cY18GAVAjZsYZ
	yo49LVcBShXw8XDM+Q/ffEPLgYHxpWqExaN+VIqcQR1DF70hprBoAbfFwx+G6yT3zsgjPLc3iRvXZ
	TEKO9R+vJiQrTGHj1V994WEuEW698nYXLgK+qZfDimdDDsYBuGp/2xtj9aDU/NNtnMd4w3qy5XxDZ
	kmAOW9H2O+Qmwl0zHe0OPHiCSj8BNC9C2UggA+VgRnaXrIebdtTZa/360wdC71v3PW+cRwzddGoW2
	VoCfYGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYvR-00000003vhE-266w;
	Thu, 27 Aug 2026 12:09:45 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzYvP-00000003vgp-0Hwa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 12:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787832583; x=1819368583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JRvlOElT6TmzC89Oveb4gR0vmINpmjM3tG5TOYB0KaU=;
  b=YuuDHXpudLRHAVi/qzW5I59jAySW/bJy9uMcOeDPCjXSyWm+BgF4XQ8j
   caSgfTpS5N67pzeqZ3rmhgdN6fi+nd/LSLEe2MAutJWuEYzfhyR+yCbAe
   eXXuY/gxvcmDXjBE9fBkUPMSOxHEUWqYwm73BCIMcc3wb5wPMPEPNkzCE
   hJgz0TzQBMHeIVBw0SPl5MAJ7/VZziuvEjEUGlmNQ7dkjICB4ajLXEcpE
   BmXRpVdQY9y0D5mq6cxQEWy5DE8HoaIEGEYugiq74GUamiQ171DdvkZdk
   auCffQ2sf/T9QKOqq9ZD6C2+5cj0O8l6BDnIhO/sAOxNEO+G1POiG8RhM
   w==;
X-CSE-ConnectionGUID: uhF3zRXBQiOsXN1WCIZ/bQ==
X-CSE-MsgGUID: 5X6VPmNLSyOlPGAu89ViHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="252902925"
X-IronPort-AV: E=Sophos;i="6.25,246,1779116400"; 
   d="scan'208";a="252902925"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 21:09:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AF7B21014D
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 12:09:38 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 61B5E1802AD1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 12:09:38 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.202.6])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with SMTP id 6A37710001F0;
	Thu, 27 Aug 2026 12:09:30 +0000 (UTC)
Date: Thu, 27 Aug 2026 21:09:28 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v16 44/45] KVM: arm64: CCA: Require ICH_HCR_EL2.TDIR for
 realms
Message-ID: <apAn76fFvpDZ_eBF@FCCLS0092175.localdomain>
References: <20260803134403.80630-1-steven.price@arm.com>
 <20260803134403.80630-45-steven.price@arm.com>
 <anlZCIauOq4Lvv0I@FCCLS0092175.localdomain>
 <86wlty1fds.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86wlty1fds.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_050943_792379_3139AB66 
X-CRM114-Status: GOOD (  38.27  )
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

On 08/10 10:41, Marc Zyngier wrote:
> On Mon, 10 Aug 2026 05:58:10 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> > 
> > On 08/03 14:44, Steven Price wrote:
> > > KVM advertises realm support when the RMM is available, and allows
> > > userspace to create a VM with KVM_VM_TYPE_ARM_REALM on that basis.
> > > 
> > > On CPUs that lack ICH_HCR_EL2.TDIR, KVM uses ICH_HCR_EL2.TC for
> > > normal guests so that ICC_DIR_EL1 is still trapped via the common GICv3
> > > CPU interface trap. Realms cannot rely on the normal hyp-side trap
> > > handling for that fallback, so advertising RMI support on such systems
> > > lets userspace create a realm that cannot safely run.
> > > 
> > > Require the finalized ARM64_HAS_ICH_HCR_EL2_TDIR capability when
> > > reporting KVM_CAP_ARM_RMI and when accepting KVM_VM_TYPE_ARM_REALM.
> > > This leaves normal VM creation unchanged on systems that need the TC
> > > workaround.
> > 
> > Hi Steven,
> > 
> > Thanks for your work on upstreaming CCA.
> > 
> > In the v15 discussion [0], you asked whether the system I was testing was a
> > "hacked up test system" or closer to "production hardware", and I said I would
> > share more when the time came. I can now say that this is not a hacked-up test
> > system. At Fujitsu, we have real hardware (FUJITSU-MONAKA) which implements CCA
> > (FEAT_RME) but does not implement FEAT_GICv3_TDIR. The hardware details are as
> > follows:
> > 
> >   - GICv4.2 compliant implementation
> >   - Supports FEAT_GICv3, FEAT_GICv3p1, FEAT_GICv4, FEAT_GICv4p1, and FEAT_GICv3_NMI
> >   - Does not support FEAT_GICv3_LEGACY (deprecated)
> >   - Does not support FEAT_GICv3_TDIR (ICH_VTR_EL2.TDS == 0)
> > 
> > For reference, compared with Arm Neoverse V3, the virtual GIC configuration is
> > largely equivalent. The only missing non-deprecated architectural feature is
> > FEAT_GICv3_TDIR.
> 
> A *very* significant difference. Given the cost of trapping between
> R-EL1 and NS-EL2, something as simple as accesses to ICV_PMR_EL1
> result in an extremely expensive trap.
> 
> > 
> > The issue I see is that the CCA KVM code currently does not support a
> > configuration (non-TDIR/common-trap) that normal KVM already supports. For
> > normal guests, KVM handles systems without TDIR by using ICH_HCR_EL2.TC and the
> > existing GICv3 CPU interface emulation path. However, Realm guests currently
> > fail because the CCA path bypasses that existing emulation path, as Marc also
> > pointed out in [1].
> 
> Plugging CCA in the emulation code will solve the *functional* aspect.
> The performance aspect is still there, unfortunately, and there isn't
> much KVM can do about that.
> 
> > 
> > Also, this is not limited to systems that actually lack TDIR. The same failure
> > can be reproduced on a TDIR-capable system by booting with:
> >   kvm-arm.vgic_v3_common_trap=1
> 
> This is a *debug* option for broken hardware. ThunderX, for
> example. You really are in good company when this bit is set.
> 
> > 
> > So it seems that the current CCA KVM implementation does not yet cover a
> > configuration that normal KVM already supports today, rather than this being a
> > limitation of the RMM specification or the underlying hardware.
> > 
> > I've included a patch below which reuses the existing GICv3 early emulation
> > path for Realm sysreg exits. This patch does not add any new vGIC emulation
> > code, and leaves the existing vGIC emulation code unchanged. So I believe this
> > is in line with Marc's request in [1]. With this patch, Realm guests can run
> > when the common CPU interface trap path is enabled.
> > 
> > I tested the exact patch both on our real silicon and on QEMU, and
> > confirmed that all Realm-related tests in kvm-unit-tests-cca passed.
> 
> KUTs are unfortunately not something that people run in production. I
> wonder why...
> 
> Please run a Linux guest compiled with CONFIG_ARM64_PSEUDO_NMI=y and
> irqchip.gicv3_pseudo_nmi=1 on the command line. Run any significant
> workload (hackbench, for example), and report the overhead. This will
> give you the expected impact introduced by the lack of TDIR.

Sorry for the delayed response.

Understood. I will run a Linux guest with CONFIG_ARM64_PSEUDO_NMI=y and
irqchip.gicv3_pseudo_nmi=1, measure a representative workload such as
hackbench, and report the overhead.

Thanks,
Kohei

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

