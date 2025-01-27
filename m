Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D67C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VGVx2inDcPb4kyuc5g9Cp41GlSlePFgSKTBuQPtRjD4=; b=ZXSWUpsK9bPSXrKPbi33VEkmGj
	UPurbTuDBwduu/O56mWQHJBktuEa6g06VZI2sq0dsDgiA4nj2x7efW4o7YyVZPS1w6BzigiYqeLIB
	/56lb3Olmhc8/VKzocVszSBa1qYCjIpxTcseeuGUsAhhtBqQF58iDZt3Aft0xi57gxcKqYTJ1ZV20
	GV7Bx5Yzq2EBghPinj0Yk2JgKiDEC9lOIlTpuUZvslXNE7fpt+iMvJHpENuGLNT9C+A68UbCnfeD4
	HBxJSBkQg3/VzGNUihgI2gvT+63oouBbGt09I0RRjOv4QjLwWAyDSpHizDb/AzJ+wMLPjFFYexYQo
	zWJDhyMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXXD-00000003Ogc-0KpC;
	Mon, 27 Jan 2025 22:24:47 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXTQ-00000003Ncn-37BV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:20:54 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-29f9dcd1235so2933131fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 14:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738016451; x=1738621251; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VGVx2inDcPb4kyuc5g9Cp41GlSlePFgSKTBuQPtRjD4=;
        b=mQ+IsD4J2K70vwNZZyIsxdHPLAx6DXA2LxzIjjjcH07yrFLh0U4aPp1QP72rVRgHT3
         E9/guVjHgD1VM1FbRuVAHFA4txFl/nHdvyK86NUcM9TCydY00TLESKvEQ/RikmwTz+p9
         Q6+50fEKa6/s3+Yocn2K3MqG23Q0UcX5fJXywr79BLAgTCkZ28/jRg3tWKcFQMMWpM0Z
         hpUewqKFsPa1KtHEAcKGtWyofor4eTYv7t3j8Ysswd/rqi1j9ORNwygBtCrrXQWOhuRW
         WiEitSLFppEbnnvDqJSBZh+uXuDPjERABhbCTaiHe13JWAiZMOgQlgra/d5o0bOs+cWt
         xk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738016451; x=1738621251;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VGVx2inDcPb4kyuc5g9Cp41GlSlePFgSKTBuQPtRjD4=;
        b=Qzjyew/O0Ld0dSxi6S/gJV+gEzIohkfsXcdE9gNb23AIGEJaRS1fPzRmWGCn/Tjmgx
         j/4NWYMtANglF2dnBL5rDKz3Fr+jKHMd6e6jMMl9f5Jx6rWNnYxi/cOlPf/copX5Hf67
         dOqb9USJWr2VSdVqg0RiFLUSq03adxgAstG5Wp0bel+rcpZMVbo5SRhzTtcQM4Gh4GVC
         splbp9XBuzgY3bR08hpvpuyc+C/bDGwNWA/I9qLi5cZXW2LWOmBIK58A/9oV+AONdSRb
         7yH5QgqeIQfY5dTiFAcTAwixLvtTH5LESebJ3XYhAO0LPCW1Wdc5PMdYzErUlVuG6N4k
         7Q5A==
X-Forwarded-Encrypted: i=1; AJvYcCWlY+CJmPk9EiJlx9gohJMgdJXFummNQquhSICzc3QVLnDeJbjJ21lk+OK5WXPR0xXmGGjKILUZmaXl3NQx9vk7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx87KDuE0H1uqC669/lEICyVsp48/suneBCL3rDD8jV2ycfHInQ
	PanuHT5fFaZt3OZpHpkTEAjp9G81kT5pzOMPVFwaQGVFCZsEWNpvPeFdUNHfetqXyf31iMU5Ubo
	bhki4F5E6ecI7n++AH1juTQ==
X-Google-Smtp-Source: AGHT+IEyp+zn4K8xvMBme9w+olqOdC2WoYBUbvWUqnKRlZMr1gAx+eFOYXOnePYqDL8MpO28ip3SYaynWBZeMCj6Qg==
X-Received: from oabnw13.prod.google.com ([2002:a05:6870:bb0d:b0:2b2:2b44:5abb])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:3a88:b0:29e:2422:49f9 with SMTP id 586e51a60fabf-2b1c0aee5efmr22900341fac.25.1738016450898;
 Mon, 27 Jan 2025 14:20:50 -0800 (PST)
Date: Mon, 27 Jan 2025 22:20:26 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127222031.3078945-1-coltonlewis@google.com>
Subject: [RFC PATCH 0/4] PMU partitioning driver support
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_142052_785952_066E4990 
X-CRM114-Status: GOOD (  14.20  )
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

This series introduces support in the ARM PMUv3 driver for
partitioning PMU counters into two separate ranges by taking advantage
of the MDCR_EL2.HPMN register field.

The advantage of a partitioned PMU would be to allow KVM guests direct
access to a subset of PMU functionality, greatly reducing the overhead
of performance monitoring in guests.

While this series could be accepted on its own merits, practically
there is a lot more to be done before it will be fully useful, so I'm
sending as an RFC for now.

This patch is based on v6.13-rc7. It needs a small additional change
after Oliver's Debug cleanups series going into 6.14, specifically
this patch [1], because it changes kvm_arm_setup_mdcr_el2() to
initialize HPMN from a cached value read early in the boot process
instead of reading from the register. The only sensible way I can see
to deal with this is returning to reading the register.

[1] https://lore.kernel.org/kvmarm/20241219224116.3941496-3-oliver.upton@linux.dev/

Colton Lewis (4):
  perf: arm_pmuv3: Introduce module param to partition the PMU
  KVM: arm64: Make guests see only counters they can access
  perf: arm_pmuv3: Generalize counter bitmasks
  perf: arm_pmuv3: Keep out of guest counter partition

 arch/arm/include/asm/arm_pmuv3.h              |  10 ++
 arch/arm64/include/asm/arm_pmuv3.h            |  10 ++
 arch/arm64/kvm/pmu-emul.c                     |   8 +-
 drivers/perf/arm_pmuv3.c                      | 113 ++++++++++++++++--
 include/linux/perf/arm_pmu.h                  |   2 +
 include/linux/perf/arm_pmuv3.h                |  34 +++++-
 .../kvm/aarch64/vpmu_counter_access.c         |   2 +-
 7 files changed, 160 insertions(+), 19 deletions(-)


base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
--
2.48.1.262.g85cc9f2d1e-goog

