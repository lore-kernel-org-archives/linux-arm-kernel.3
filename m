Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A613C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 04:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/kFkA8ZtlPHl7dirXaXl3pjvcX+bythjEf3lFKdsys=; b=rvgvrO1VfNJGnV6iZiPASqo+A9
	rFTUUlzzol/gRQ6Prqr0JarZ4PHEzeY2MIEsxqXsZJD5Xqm6H9v5rUxEMIItlHntkuY6eIedld9BR
	wgUJRh4nlgSzZlhuyZKN4SOTc73E4KegAL8ws8L0TQDY861Rd4GPQ/x0zxAwtHyR+8LktdX7NwQ9M
	8m0hrshcUmOOCr1tofVozbbL/eAEv8BEOOKPNcBp92nDGNye6sE2ynsyrF43iClaKLG3OaR2Et5vG
	ouv0fL4L0jNKYE52zFlyqng1QglKU6Ueh/TO5/xt839UbWWVA/jm1C9K2L/pxAZ53wNBiOoQ2AlIZ
	L2DCalRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Wja-0000000DOeb-0QEW;
	Thu, 10 Sep 2026 04:50:02 +0000
Received: from esa3.hc1455-7.c3s2.iphmx.com ([207.54.90.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4WjX-0000000DOdd-22hR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 04:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789015803; x=1820551803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xk47tdIucK/5Zzi/z/QsVNoFQM47eXx+3YilT3u56PI=;
  b=S8bWev4FeP73hYK+aS8TV5c8EToZFJPvUthiF3Zi8bAZZoZR9dro9Qxo
   7TdnCtKsCSLEpj1V/NQ+zCJXfxoOs5Lvo6gzlwVTrhtAW1z+8bLCI2ZAB
   cuuPfGWV7w2dQbccGIEckZ9y6d+iYgrPxwoqFwwse6w7d6rlYY+s02TF6
   IzJL8NjChIrgXAA18a/4DbPBtpx8Xsm5wwfY02gxE68XyEB0AIIl6QJuZ
   ZmSZO8PtgHDJ5g+g62eKb6rB3CmdX47ChTKR0QdOR6e6dAxNMW1/1Pq3E
   xrQDJYm/ctbunQSlpws7KNHyUJkgdwj3BrqieBUZS2E5Nrh3umRzn6yt8
   A==;
X-CSE-ConnectionGUID: R2PQFJeKQV6fc4iPbWhbfQ==
X-CSE-MsgGUID: X7vOI74bQHqZiE3Ok8d8Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="254488097"
X-IronPort-AV: E=Sophos;i="6.25,271,1779116400"; 
   d="scan'208";a="254488097"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 13:49:59 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6766633FB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:49:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1367318019B2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:49:55 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.22.105])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id 0379A14000ED;
	Thu, 10 Sep 2026 04:49:47 +0000 (UTC)
Date: Thu, 10 Sep 2026 13:49:44 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, joey.gouly@arm.com, 
	tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, alpergun@google.com, 
	fj0570is@fujitsu.com, WeiLin.Chang@arm.com, lpieralisi@kernel.org
Subject: Re: [PATCH v17 06/20] KVM: arm64: CCA: Add a new mode for supporting
 Realm guests
Message-ID: <aqI2eI8IbCJQMx5d@FCCLS0092175.localdomain>
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-7-suzuki.poulose@arm.com>
 <aqDFcgzXOTWUkPtp@FCCLS0092175.localdomain>
 <86zexq3dk5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86zexq3dk5.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_214959_825700_DB51D3FA 
X-CRM114-Status: GOOD (  28.06  )
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

Hi Marc,

On 09/09 11:48, Marc Zyngier wrote:
> On Wed, 09 Sep 2026 04:26:41 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> > 
> > Hi Suzuki,
> > 
> > On 09/08 17:22, Suzuki K Poulose wrote:
> > > Add an explicit mode to support Arm CCA guests.
> > > 
> > > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > > ---
> > >  Documentation/admin-guide/kernel-parameters.txt | 3 +++
> > >  arch/arm64/include/asm/kvm_host.h               | 1 +
> > >  arch/arm64/kvm/arm.c                            | 5 +++++
> > >  3 files changed, 9 insertions(+)
> > > 
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index 68647ff4bdd24..1afe3df3b923e 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -3256,6 +3256,9 @@ Kernel parameters
> > >  			nested: VHE-based mode with support for nested
> > >  				virtualization. Requires at least ARMv8.4
> > >  				hardware (with FEAT_NV2).
> > > +			rmm: Support for running confidential guests in Realm
> > > +			     world using RMM, as defined by Arm Confidential
> > > +			     Compute Architecture (CCA)
> > >  
> > >  			Defaults to VHE/nVHE based on hardware support. Setting
> > >  			mode to "protected" will disable kexec and hibernation
> > > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > > index b2e99c5cb1cd3..31ae9d8d8e92f 100644
> > > --- a/arch/arm64/include/asm/kvm_host.h
> > > +++ b/arch/arm64/include/asm/kvm_host.h
> > > @@ -69,6 +69,7 @@ enum kvm_mode {
> > >  	KVM_MODE_DEFAULT,
> > >  	KVM_MODE_PROTECTED,
> > >  	KVM_MODE_NV,
> > > +	KVM_MODE_RMM,
> > >  	KVM_MODE_NONE,
> > >  };
> > >  #ifdef CONFIG_KVM
> > > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > > index 9af3bbb2f8c24..50f0adfadab38 100644
> > > --- a/arch/arm64/kvm/arm.c
> > > +++ b/arch/arm64/kvm/arm.c
> > > @@ -3264,6 +3264,11 @@ static int __init early_kvm_mode_cfg(char *arg)
> > >  		return 0;
> > >  	}
> > >  
> > > +	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
> > > +		kvm_mode = KVM_MODE_RMM;
> > > +		return 0;
> > > +	}
> > 
> > Does this make NV support and CCA Realm VM support mutually exclusive?
> > 
> > Until the v16 series, we could run Realm VMs with:
> >   'kvm-arm.mode=nested'
> > 
> > As far as the AArch64 architecture is concerned, there does not seem to
> > be a reason to make them mutually exclusive. I am therefore wondering
> > whether this restriction is intentional.
> 
> I have a hack somewhere that will allow this, but this requires to
> change the above to be a capability mask rather than a simple
> enumeration. I'll see if I can spin that as a separate series.

Ack. Thank you for the clarification.
Looking forward to seeing the series.

Thanks,
Kohei

> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

