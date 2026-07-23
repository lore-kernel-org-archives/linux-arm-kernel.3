Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FCAC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuWB0XBTK0DWXxl2CncklGRX/XRUiTbswOLSigD3iWA=; b=jCK/+NHehAS38kY1hySqOKHRg+
	1DK0GHDtCUZJNHVHgv5WtTfzz5nvZSWRA4fNqdMU/2iYDmUhYkz0yKmeERMFMfYro4ZUN/+63Rab5
	gDYo5G6TJJUqec0hwiRAkIfyFEzxpjhVnfUc8I3HvWtln5+Jh4KL7lm9p6qQUiifSPkhBMLytt2DM
	8/XoZio8tQ04bh1ur+QJ6a27JXYCjX1f0FBM21Y3BK8d2TAkC5WUtb0nKx1A21WYSfPn7uDP2ZCH8
	+GJYVEAYNL/646Dgl667bwpf+S9LPzukvraDf7q1aW94hJYUwLwgkWQm7r00l+YzTaj5cb4/sYD2N
	wD/sUuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnMq-0000000Dapq-0eNW;
	Thu, 23 Jul 2026 06:57:16 +0000
Received: from esa7.hc1455-7.c3s2.iphmx.com ([139.138.61.252])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnMm-0000000Daoz-13hu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784789832; x=1816325832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qZw/Mpb9yuRHoHUWT2a56q40bog3XvEKC61lCecinxQ=;
  b=T58fdBeEHhDBX3B1m+dbRf6BF5s1RIPpLWpgQDvjYYNKr5ZhtF4A4l5E
   03Lq5c2T7qUSO5c3g16FrvXt19cOeiwME3ZwfTqgF7hrXVZzHITJ0V77f
   zvxQ89MBBoA9VaeytEqCbtKcdCkogpvNyEnEsiFzGcVTs4gWi+wj0I4Gl
   GfvgKpjC60DMynjIuucHSk4eelAxXErBRYun4RbmF6mH1sUFD9fg/BSKt
   dszst8SG+R9EE0zDR0NIqmMswmYjPADeT2uZQeeBuKRKGXBikZqXrdyH/
   YHkgaA7yibUYb432FNgNprVAI62TkWIO7XM53UQ+D9EH0pghmYkdDtur/
   A==;
X-CSE-ConnectionGUID: 2055E1f+TY2mhbrzRXLybg==
X-CSE-MsgGUID: 5tbRohu9Qdu4c4+WC9uGrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="227215314"
X-IronPort-AV: E=Sophos;i="6.25,180,1779116400"; 
   d="scan'208";a="227215314"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 15:57:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 206FE7336
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:57:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C5CB7C02E69
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:57:09 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.10.80.137])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with SMTP id 817491801C29;
	Thu, 23 Jul 2026 06:57:01 +0000 (UTC)
Date: Thu, 23 Jul 2026 15:56:54 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v15 12/37] KVM: arm64: CCA: Support the VGIC in realms
Message-ID: <amG3KHE4Tdd_Nvuz@FCCLS0092175.localdomain>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-13-steven.price@arm.com>
 <amB-opawGgF6jNHB@FCCLS0092175.localdomain>
 <b71e81ee-372c-4963-a1f7-bd301aee89cb@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b71e81ee-372c-4963-a1f7-bd301aee89cb@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_235712_707343_C23E2D35 
X-CRM114-Status: GOOD (  29.66  )
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

On 07/22 14:31, Steven Price wrote:
> On 22/07/2026 09:27, Kohei Enju wrote:
> > On 07/15 15:28, Steven Price wrote:
> >> The RMM provides emulation of a VGIC to the realm guest. With RMM v2.0
> >> the registers are passed in the system registers so this works similar
> >> to a normal guest, but kvm_arch_vcpu_put() need reordering to early out,
> >> and realm guests don't support GICv2 even if the host does.
> >>
> >> Signed-off-by: Steven Price <steven.price@arm.com>
> > 
> > Hi Steven,
> 
> Hi Kohei,
> 
> > I've been testing this series and found that when the host CPU doesn't have
> > ARM64_HAS_ICH_HCR_EL2_TDIR this series doesn't work as expected.
> 
> Thanks for testing!
> 
> > Since commit 2a28810cbb8b ("KVM: arm64: GICv3: Detect and work around the lack
> > of ICV_DIR_EL1 trapping"), when the host CPU doesn't support this feature, KVM
> > traps all GIC sysreg accesses in the common group. However, currently trap
> > handlers for ICC_{PMR,RPR,CTLR}_EL1 registers are missing [0]. So when Realm
> > guests try to access those registers, KVM traps them but just emits the warning
> > shown in [1], and Realm guests fail to boot.
> > 
> > As far as I can tell, the CCA requirements don't require the
> > ARM64_HAS_ICH_HCR_EL2_TDIR feature. If that's the case, this seems to be a
> > problem. Is there any workaround for this issue, or should we implement trap
> > handlers for those registers?
> 
> As Marc has already said in his reply, I'm really surprised you have a
> CPU which implements CCA but doesn't have ARM64_HAS_ICH_HCR_EL2_TDIR.
> Can you give some more details about the platform you are testing on?

Thank you for taking a look, Steve.

Unfortunately, due to the company's policy, I can't share any details
about the platform I'm currently testing on. When the time is right,
I'll be happy to do so.

> 
> Ultimately there are two options here - either don't support CCA (so
> detect the lack of ARM64_HAS_ICH_HCR_EL2_TDIR and bail out early), or
> plumb in the trap handlers - as commit 2a28810cbb8b points out this
> isn't something we really want to support if we can avoid it.

Yes, the former makes perfect sense if there would be no systems that
supports CCA without TDIR. However, if such systems do exist, I'd be
interested in exploring the latter approach.

> 
> Hence I'm interested to know where this sits between "hacked up test
> system" and "production hardware". E.g. if this is an emulator it might
> be possible to just enable the CPU feature.

Again, I can't share that right now, but I'd like to share more when the
time comes.

Thanks,
Kohei

> 
> Thanks,
> Steve
> 

