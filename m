Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EE1CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 23:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuES2tRdn46g0s92fHQIzXo4I4Ih16RMQ2lK1dYSBWU=; b=g1ESSq5s10wJfcoMsdc0/0/0jj
	BU+VP6HhVeDhKh6G1ex/p4nJKSU1YzJ8ocrSn32/TwON9gA/upPQgFP+sY8Zs2XIEBELvgkzHtxrL
	CXs+mrCeJJpk3DUNCF/3C1dZ8qHOv6udUUKMzvgeKNfkDwrZXW8qZg2j1Yrrz+MdxaX85Qk18mOOi
	1p3+qY2nCcrK+1ANcq3FkIzD1ttR3dnVvapdgkhyIcS06o/45F2DXGjGy7M3MbM/5X5CX438OXscv
	gFntH/90yeExZCPMV8OSFF2pnt9d5t5XZTCkfY657MEAEqrc8Mi7UrDopiLOtxTxQwz3jED75V34G
	uoftYtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHUTB-00000001Vrf-40ZO;
	Thu, 15 Oct 2026 23:02:41 +0000
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHUT8-00000001VrI-38Jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 23:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1792105364; x=1823641364;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DKF5cq/VsYFkoapTDKuX27Bdb1xfZ2g6cxZ3EO61jFc=;
  b=eSY5Ss4fo4wU7zJK7gSXFUr1F5geEJKTBrkkMB9w7veM7+LMZvBaz8DW
   oBKwvGzTJAyu/4R3fIHaHdzaRJnfjT3RSfYxeByjeKAOYYnEMs1feuJvh
   zSOzyr9l2Xu5YScxwKuJ0JsFub/9p+0MmKJrHUyJ2+iYgKxSih3CPf5Cd
   9Ih/dLhwCMNYhqfieibahefiXP84sXuCxNlX8b2RofwHztGBkfevuSEzM
   UO2JLqvjGtBjsqbdZm7xXGV+SUd4tJvTDFvjZ6e3aIApbSiFRLtX7JHee
   mIRSYRTL5XyM4K3NUpmR4D2gWuBkPHnU8Emjq1xPUOphYiepBWbyexANq
   w==;
X-CSE-ConnectionGUID: QbbtE4GIQyCfdaoH9dbLow==
X-CSE-MsgGUID: Mvageg+lTlu+X7TRHKToKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="245874462"
X-IronPort-AV: E=Sophos;i="6.27,160,1786978800"; 
   d="scan'208";a="245874462"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 08:02:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2E731100282A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:02:33 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D948F926774
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 23:02:32 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id E18E91004B0A;
	Thu, 15 Oct 2026 23:02:28 +0000 (UTC)
Date: Fri, 16 Oct 2026 08:02:25 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: Re: [PATCH 0/2] KVM: arm64: Cleanup the HCR_xyz macros
Message-ID: <atFbgc76lPx44Psn@sm-arm-grace07>
References: <20261015173605.1072963-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015173605.1072963-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_160239_277467_5F533285 
X-CRM114-Status: GOOD (  15.35  )
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

On Thu, Oct 15, 2026 at 06:36:03PM +0100, Marc Zyngier wrote:
> I've been postponing this for some time, but it finally happened: no
> more HCR_xyz macros.
> 
> This series converts the whole thing in one go, using the script
> fragment contained in the first patch. No AI agent involved, all bugs
> are mine! I intend to take this in for 7.4-rc1.
> 
> Patches on top of kvmarm-7.4.

I've applied this series on top of kvmarm-7.4 and it builds with my
.config. The kernel boots fine with QEMU in TCG mode, some vgic_*
kselftests ran without failure.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.

> 
> Marc Zyngier (2):
>   KVM: arm64: Convert HCR_xyz to HCR_EL2_xyz
>   KVM: arm64: Get rid of compatibility HCR_EL2 aliases
> 
>  arch/arm64/include/asm/el2_setup.h      |   4 +-
>  arch/arm64/include/asm/hardirq.h        |   6 +-
>  arch/arm64/include/asm/kvm_arm.h        |  79 ++--------------
>  arch/arm64/include/asm/kvm_emulate.h    |  18 ++--
>  arch/arm64/include/asm/kvm_mte.h        |   4 +-
>  arch/arm64/include/asm/kvm_ptrauth.h    |   4 +-
>  arch/arm64/kernel/head.S                |   4 +-
>  arch/arm64/kvm/arm.c                    |  28 +++---
>  arch/arm64/kvm/at.c                     |  18 ++--
>  arch/arm64/kvm/emulate-nested.c         | 116 ++++++++++++------------
>  arch/arm64/kvm/guest.c                  |   2 +-
>  arch/arm64/kvm/handle_exit.c            |   2 +-
>  arch/arm64/kvm/hyp/include/hyp/switch.h |  14 +--
>  arch/arm64/kvm/hyp/nvhe/host.S          |   2 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S      |   2 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c      |  20 ++--
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c   |   6 +-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c          |  32 +++----
>  arch/arm64/kvm/hyp/vgic-v3-sr.c         |   4 +-
>  arch/arm64/kvm/hyp/vhe/switch.c         |  12 +--
>  arch/arm64/kvm/hyp/vhe/tlb.c            |   2 +-
>  arch/arm64/kvm/inject_fault.c           |   6 +-
>  arch/arm64/kvm/mmu.c                    |   8 +-
>  arch/arm64/kvm/nested.c                 |   8 +-
>  arch/arm64/kvm/sys_regs.c               |  24 ++---
>  arch/arm64/kvm/vgic/vgic-v3-nested.c    |   4 +-
>  26 files changed, 182 insertions(+), 247 deletions(-)
> 
> -- 
> 2.47.3
> 

