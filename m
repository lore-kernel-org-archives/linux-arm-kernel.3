Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFBFC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 23:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlGugjIjh0Uin30y0vRf9Yhg7ImbBQ/avTfyP3eHlGc=; b=2HQm+ik7UWYl4D3xYVjFuAooiK
	PX6k3EV7udH84LA5CHEzH2MCGJTteXM1XI8/Z+bGneCTC1lVPv0GtEgxnV99BjjjfdwmXS5cyQhjc
	BXENDWClv84kIKXrLIa8Kp2CvhjsN8X8QIu8KJoit5vqAkacMsTW4/LaRupXrGQBdcA/CdpS+spEo
	cPODoZ2kUxZWyqkwXykXO4ddbW1LInQWHJLP6KobqRY4EM3M69XglBjw7XJl+D3rXaQJQ3XKGLtmY
	nh96TAHefEECZPODI1QdSUJzV/1E8XMUZ3YeHNgr+Srn8kn2AkX5sUQvCxtRlDoH7Ab5gCaxT1IpG
	pJsumFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5tbd-0000000260B-0rXE;
	Sun, 13 Sep 2026 23:27:29 +0000
Received: from esa5.hc1455-7.c3s2.iphmx.com ([68.232.139.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5tbY-000000025zZ-3kCB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 23:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789342045; x=1820878045;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ul+cr0z2BcSymh+TpscLFzMcdP7+m+oZ1R/UwzI1UOc=;
  b=GF0+6pnAa4qzn2OMIpphv+z3dFDhF+uO8vIW7zkec4JjBPlfk4DyP4Y8
   2hNBoSnWpu4Xf94KCc80rAP7D9zj1TxgJkLcbBgREHg42AwRTdodORu+t
   qv8ZMxE2C8/OeiFgtTC4TV2DOtJNmLjmr2k51vW2BsO+aPdM722ZliAj6
   zBL01sp3aotJmLIuzxxUHe1OwWPjahXUyIC9f6zBmlwbSnlaWz8xA4iT/
   oOKuEjelOLnoL9uoCRb4HwCUWfkKV8v5Mu4ROy7tLlZIpo+N5TDXBaBFh
   WcaMMAqp3fpmGQ/eNbgVp2IriTlOcoUYqpGgWDe9ku37hpv4WRPg7Lgjy
   Q==;
X-CSE-ConnectionGUID: NMr7YHlWQ+C4rIIzCTpmmA==
X-CSE-MsgGUID: qbTOPAH/QGqXQrSh00j4XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="253060388"
X-IronPort-AV: E=Sophos;i="6.27,100,1786978800"; 
   d="scan'208";a="253060388"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:27:20 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D649E1C000A9
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:27:19 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 81FF310001FD
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:27:19 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 0032B404329;
	Sun, 13 Sep 2026 23:27:14 +0000 (UTC)
Date: Mon, 14 Sep 2026 08:27:12 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 0/4] KVM: arm64: Reduce overhead of full S2 teardown
Message-ID: <aqcxUCr9828o1W8V@sm-arm-grace07>
References: <20260912104834.3093878-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260912104834.3093878-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_162725_427508_E1BD3E98 
X-CRM114-Status: GOOD (  21.30  )
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

On Sat, Sep 12, 2026 at 11:48:30AM +0100, Marc Zyngier wrote:
> Tearing down a full S2 is a pretty involved process, resulting in a
> lot of TLB invalidation. These TLBIs are either on a per leaf basis if
> the HW doesn't support range invalidation, or by top-level range if it
> does. Amusingly, the latter occurs even when nothing has been
> unmapped.
> 
> Things are made worse with NV, as we have a bucket-load of shadow S2s,
> and the need to invalidate them all on the back of an MMU notifier.
> The latter will eventually be solved by the reverse-map tracking that
> Wei-Lin is working on, but we need to be better at full-S2 teardown.
> 
> This small series adds a "no TLBI" unmapping primitive, which allows
> the caller to then whack the TLBs using a VMID-wide invalidation. This
> results in far fewer TLBIs, and a better recursive virtualisation as
> we get far fewer traps as a consequence.
> 
> This applies on top of my shadow-s2 lifetime fixes, and is expected to
> be a prefix to Wei-Lin's series.

I've tested this series on QEMU with TCG mode, and it boots.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> Marc Zyngier (4):
>   KVM: arm64: pgtable: Add Stage-2 unmap without TLBI primitive
>   KVM: arm64: MMU: Add kvm_stage2_unmap_all() helper
>   KVM: arm64: nv: Move full s2_mmu unmap over to kvm_stage2_unmap_all()
>   KVM: arm64: nv: Move TLBI VMALLS12E1* emulation over to
>     kvm_stage2_unmap_all()
> 
>  arch/arm64/include/asm/kvm_mmu.h     |  1 +
>  arch/arm64/include/asm/kvm_pgtable.h | 17 +++++++++++++
>  arch/arm64/include/asm/kvm_pkvm.h    |  1 +
>  arch/arm64/kvm/hyp/pgtable.c         | 38 +++++++++++++++++++++-------
>  arch/arm64/kvm/mmu.c                 | 15 +++++++++++
>  arch/arm64/kvm/nested.c              |  4 +--
>  arch/arm64/kvm/pkvm.c                |  2 ++
>  arch/arm64/kvm/sys_regs.c            | 18 ++++++-------
>  8 files changed, 75 insertions(+), 21 deletions(-)
> 
> -- 
> 2.47.3
> 
> 

