Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B07C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/wo5qkTiWPE5WEbPdgXRwQ9wzzCE47c7pf8Jdna6Xw=; b=dXP9JuXp0lXCFMmSimrJYps5Xd
	5qppLL3P8e6pOjBosDdWt2NQjDFYO284JmKSeFzXrrr9iBTSpaj/bzt3tY4nHPnXXVU9J7Xbpax5V
	NzOFQos6mY2gqj/snjg+J/UJOJWlg4S0/IGG27NxN+ty1fkMe/V/On5+P7HEetjrng1CF0hU0k7AP
	YPiEoEhO3ZEdlnSEGu1t1Z54KNWkBIFHlla2JeTmzGI/njlBXZLFmpzHsHP6a4zYBZM84tVnva4aO
	yt15wjerBLMw4X9FoyN0Vd1Pf9rQjI96ZbR9gmYVMF0W84UaAzjBpxL8dUg9UlrPO9qLkNKLtj2rU
	NaaPLx9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmn4t-0000000DYlZ-0CSN;
	Thu, 23 Jul 2026 06:38:43 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmn4n-0000000DYkD-3Ica
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:38:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784788718; x=1816324718;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=payJ3POf8Eo8bsLxE8/JrwlXF6UVj18G9W8zHieXETk=;
  b=D2KE4HqxUsu2v//Rf2h9wyuwB6/AWkR0qDl9FqQ2g3dxtKANpQnQeh2p
   gR0Az8ZcmVB0Gc/WvnDvYnekD1bmjw5aWkUrlziMPaXcV4MqsKVCWVJm8
   CuNEKbG2GC5nSfLXPaYk+HeJE5VEd17G/gtxDNhwcnmJMl+WWsn6IhU9G
   pTkTsUxfzhiC74D7VWAjU8lH1sEYRuAsOpzFAjLSPMKxKsamcuX0Gny7s
   XOLdrxKu/RtKRe8YLREhykeBJE/kKwDh0Bm4h3j2nUvAw53SqnThyyvIT
   i6dT/YEPpdRUcCyFrB6cmh7aI7cXQdc1EfgnmVjFSoBPp3geT59i/lZs6
   g==;
X-CSE-ConnectionGUID: m7jv8G+AQvirKOWdjrVU5w==
X-CSE-MsgGUID: W7laQu/6TECKdpTCGpc9Aw==
X-Ironport-Invalid-End-Of-Message: True
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="248334440"
X-IronPort-AV: E=Sophos;i="6.25,180,1779116400"; 
   d="scan'208";a="248334440"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 15:38:33 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B7EEF10000C0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:38:32 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 62E8B1002995
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 06:38:32 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.10.80.137])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with SMTP id C57BB1802ED6;
	Thu, 23 Jul 2026 06:38:23 +0000 (UTC)
Date: Thu, 23 Jul 2026 15:38:16 +0900
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
Subject: Re: [PATCH v15 12/37] KVM: arm64: CCA: Support the VGIC in realms
Message-ID: <amGwgAfHWX2P9pZx@FCCLS0092175.localdomain>
References: <20260715142841.80544-1-steven.price@arm.com>
 <20260715142841.80544-13-steven.price@arm.com>
 <amB-opawGgF6jNHB@FCCLS0092175.localdomain>
 <86cxwfe5m8.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <86cxwfe5m8.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_233839_211952_74A45DCE 
X-CRM114-Status: GOOD (  31.00  )
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

On 07/22 10:27, Marc Zyngier wrote:
> On Wed, 22 Jul 2026 09:27:29 +0100,
> Kohei Enju <enju.kohei@fujitsu.com> wrote:
> > 
> > On 07/15 15:28, Steven Price wrote:
> > > The RMM provides emulation of a VGIC to the realm guest. With RMM v2.0
> > > the registers are passed in the system registers so this works similar
> > > to a normal guest, but kvm_arch_vcpu_put() need reordering to early out,
> > > and realm guests don't support GICv2 even if the host does.
> > > 
> > > Signed-off-by: Steven Price <steven.price@arm.com>
> > 
> > Hi Steven,
> > 
> > I've been testing this series and found that when the host CPU doesn't have
> > ARM64_HAS_ICH_HCR_EL2_TDIR this series doesn't work as expected.
> 
> What modern CPU doesn't support TDIR? The only CPUs I know of that are
> stuck in this mode are old ARMv8.0 CPUs, and anything else was fixed.

Hi Marc, thank you for the response.

I'm afraid I can't share the details due to my company's policy, but at
least I happen to be testing on such a system.

> 
> > 
> > Since commit 2a28810cbb8b ("KVM: arm64: GICv3: Detect and work around the lack
> > of ICV_DIR_EL1 trapping"), when the host CPU doesn't support this feature, KVM
> > traps all GIC sysreg accesses in the common group. However, currently trap
> > handlers for ICC_{PMR,RPR,CTLR}_EL1 registers are missing [0]. So when Realm
> > guests try to access those registers, KVM traps them but just emits the warning
> > shown in [1], and Realm guests fail to boot.
> 
> This isn't missing. This is handled by the early emulation in
> vgic-v3-sr.c, which of course CCA completely bypasses. Too bad.

That makes sense.

> 
> > 
> > As far as I can tell, the CCA requirements don't require the
> > ARM64_HAS_ICH_HCR_EL2_TDIR feature. If that's the case, this seems to be a
> > problem. Is there any workaround for this issue, or should we implement trap
> > handlers for those registers?
> 
> No. Either you support TDIR, like any modern CPU, or you don't run
> CCA. I'm not adding yet another level of emulation for this.

However, I'm still not aware of any requirement in the CCA architecture,
or in Armv8-A/Armv9-A, that mandates TDIR support.

When you say "you don't run CCA", is that because the architecture
requires it, or because that's the current KVM policy? If it's the
latter, we'd be interested in adding the required emulation to make it
work.

Thanks,
Kohei

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
> 

