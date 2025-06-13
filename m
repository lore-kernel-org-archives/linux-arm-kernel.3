Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDC2C71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=npODHkhgO8HUf/TrEhpf2O2lbg1BmEemgLQdrUWSQ3w=; b=F0GyKUbEQjzTqm0MPr5SjvyqKA
	X59nVTlUBxZ7VZowaetC0EnKEeABZS77/3Y+RvvtjYHChe2jc9W25Eo80ZrKGHsLn8l954lwP1jVb
	HGKL5oseFzXdrBwvvQ/pebgmYz2T7o0vLHyRE4P6CMiYRQ7nHVqqyl3dxs2JDoELhiFPWgeFgqSOF
	Z9Aakc7bGq9X3satbl0UmyIYmnxPovJFlB3gow/byQOpuVgP7NzohD1aYavL8yq4ZT4Z/L2Vos/Ei
	jo8SM/2aJnvdDHEP1nMuZi4+7rtwyFQpPtNRoSgfsx9nSTCYP+Bo+cxTfR36pLaxginBJRaCpIh24
	pQuFhjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8x9-0000000HFSj-0PTT;
	Fri, 13 Jun 2025 18:16:35 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6hw-0000000Gxl2-3MOD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:52:46 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-86d54e66cefso203321339f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 08:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749829963; x=1750434763; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=npODHkhgO8HUf/TrEhpf2O2lbg1BmEemgLQdrUWSQ3w=;
        b=2vXMh9u3GiD3CyRLXpP/A7qV1DOuvMPRCkCYhczGGgLRXO9Jag+wT8o8ee5vU5faxq
         fS+iIpGjbDl4OiMOPAiSqDuczLSZyarFrJWSqq8BWqaf22QnDd6jCSyJg11p+sdAob4l
         xkO9pRC386Su8mN46zLEiKL0R8AcMCYVJHhwIT+qo9t2MUp7F22TufO6DGS7Gsct+Qao
         UtSnhp4++rtl/HvGX4qwnhF5Y0h0E7HRT5l784bVKwfO07csDK94cvep/Ue3aikaVrrh
         w1kZW1jsMDOnL2yMKmzDCfDFdtsk+8It/sGvTlNjNaTMv1t0Jx+vi4006OPb0o1S1hZz
         LOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829963; x=1750434763;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=npODHkhgO8HUf/TrEhpf2O2lbg1BmEemgLQdrUWSQ3w=;
        b=J4EAYCIV/TOCst5NKjJnqJbsVyPmV/m3OG+gE9PaJtdH1qwSEGpxmdApX67+UmRL3i
         KJavcPd8Z8AggZb2IP/R8IvTgLVVUSmMNc1OEumfyVxR+NRT2mJvcgyz/vO538b0imd3
         iNGU/Y9QjwI8tcyuJ97ZJoZa3zXI8U0+NjOGYH9oqh9YeDa6TkT77zlxRwYPKlU4QWRa
         AJjGoqy7xqbNo9E5ttSgysJtjkSexQT6Bs/col3mVnJ2+0xvnFkrdQAeHU/YPK21BHDT
         QUpiGGX0gsAsyKPu9NnfF9HcQmSoTFBB9/QQJR1M6aiqKSv84BFfpX6l3gRGHSo6/bx6
         hZsw==
X-Forwarded-Encrypted: i=1; AJvYcCUdcgmjhc/KF26gzmnxbNYRW8vM5XinXjr2XQCGvbuQ/LrT84F57HWA5Xsc3HfQzwjTTBsjlJfqtrtbrGxtt87j@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4TpmoD/m+tJh6bGPof1xb00bh2zlxt03EPEvGbuJpLRvk5xeu
	nGfNZSpZKMEanZeTDx0FbjbFbLEu5ms335Wicp2b1Io2YuOJGaxb7eLVdScLgiJc1KV1uuaHYrH
	ZNEhcurelzA==
X-Google-Smtp-Source: AGHT+IE/scb/Nv+7qkIju6i+DJdpAZR1xpyikSby5hJxXtJQQBp8fzkrPzsEKKxna1nAOeTY0IfW56wNZKrb
X-Received: from iovg22.prod.google.com ([2002:a05:6602:3d6:b0:875:c65d:8b3])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3811:b0:861:7d39:d4d3
 with SMTP id ca18e2360f4ac-875d3c31a6fmr486593739f.3.1749829963134; Fri, 13
 Jun 2025 08:52:43 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:52:34 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613155239.2029059-1-rananta@google.com>
Subject: [PATCH v3 0/4] KVM: arm64: Add attribute to control GICD_TYPER2.nASSGIcap
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085244_867198_A684894F 
X-CRM114-Status: GOOD (  11.05  )
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

A shortcoming of the GIC architecture is that there's an absolute limit on
the number of vPEs that can be tracked by the ITS. It is possible that
an operator is running a mix of VMs on a system, only wanting to provide
a specific class of VMs with hardware interrupt injection support.

The series introduces KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap vGIC attribute to allow
the userspace to control GICD_TYPER2.nASSGIcap (GICv4.1) on a per-VM basis.

v1: https://lore.kernel.org/kvmarm/20250514192159.1751538-1-rananta@google.com/

v1 -> v2: https://lore.kernel.org/all/20250531012545.709887-1-oliver.upton@linux.dev/
 - Drop all use of GICv4 in the UAPI and KVM-internal helpers in favor
   of nASSGIcap. This changes things around to model a guest feature,
   not a host feature.

 - Consolidate UAPI into a single attribute and expect userspace to use
   to read the attribute for discovery, much like we do with the ID
   registers

 - Squash documentation together with implementation

 - Clean up maintenance IRQ attribute handling, which I ran into as part
   of reviewing this series

v2 -> v3:
 - Update checks in vgic-v3.c and vgic-v4.c to also include nASSGIcap (via
   vgic_supports_direct_sgis()) that's configured by the userspace. (Oliver)

Oliver Upton (2):
  KVM: arm64: Disambiguate support for vSGIs v. vLPIs
  KVM: arm64: vgic-v3: Consolidate MAINT_IRQ handling

Raghavendra Rao Ananta (2):
  KVM: arm64: Introduce attribute to control GICD_TYPER2.nASSGIcap
  KVM: arm64: selftests: Add test for nASSGIcap attribute

 .../virt/kvm/devices/arm-vgic-v3.rst          | 29 ++++++
 arch/arm64/include/uapi/asm/kvm.h             |  3 +
 arch/arm64/kvm/vgic/vgic-init.c               |  7 +-
 arch/arm64/kvm/vgic/vgic-kvm-device.c         | 88 +++++++++++++------
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            | 24 +++--
 arch/arm64/kvm/vgic/vgic-v3.c                 |  5 +-
 arch/arm64/kvm/vgic/vgic-v4.c                 |  6 +-
 arch/arm64/kvm/vgic/vgic.c                    |  4 +-
 arch/arm64/kvm/vgic/vgic.h                    |  7 ++
 include/kvm/arm_vgic.h                        |  3 +
 tools/testing/selftests/kvm/arm64/vgic_init.c | 41 +++++++++
 11 files changed, 176 insertions(+), 41 deletions(-)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
--
2.50.0.rc2.692.g299adb8693-goog


