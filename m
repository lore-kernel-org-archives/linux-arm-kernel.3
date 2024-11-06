Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D182D29FB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AsoJeQT7lIbORupJmPx8o8UcNDx1QgoC4+ZDQJoGnSc=; b=qdAF6aOuA4e9u4GlFFLtG5HdKF
	hZ/DUdBQapIMmjTg25zdTWKrbjVhBHvsk2Hy1t+zbgQQTM96gwBJIffWsDPz3kE11g4nExxyh9q60
	HSJjB6X8j4A1MLmi3lncR1nezVNTj3CPvP7xEEds6hOiREyDvWpTjsR/wwmAjjEWccdugqsw7jh6g
	AdydLclOk7MLeE4Q9/u3WjRLJ9X+ETnGLOH5sA4/mvGoMNv7LbP24F93L/CFmx8C5BoIEhZTKT9u0
	tUx1hp9nvmfEXc0hoYGCYjPYZcgW3UckuhoErg5ckI2ifhkKGQl8a7i6KFu9Z7+HBErMZpFw3pyHH
	SBBp9Ypg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bSr-00000002IjW-2fxP;
	Wed, 06 Nov 2024 08:32:33 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bR4-00000002IQz-280Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 08:30:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e35a643200so115608687b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 00:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730881840; x=1731486640; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AsoJeQT7lIbORupJmPx8o8UcNDx1QgoC4+ZDQJoGnSc=;
        b=T6sB2CBcivToGByChNrIIuTHalPT0CMa/i2DBh9HISAPWiQo/Vgyc+Ludfml3oxz4t
         UgLGIkBH4lT8ZjYwOF+hOtbdxU7baJiQZCXzxBIEQ91j+j1wPUQIboUR8/91Zzba8DM/
         XA2JAdjsip9JoxojK0VCTE7upUMQ8PbxiHChAk1ffurYYYuWpuRA10N1qRoRLSY8HoKf
         Y7kES7+s2EBdTlxYUcl5+P74pRIDQrXWN2XZ2H/DLRJ88hGY10ON/qWzH2ulwib7dAkP
         IpP6OshOlj0OUYveOctPLZ2basKSodUcYNcBi27bj3s7fgJ+Y7Vaekb3UxakzlE8ZEKQ
         1f2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730881840; x=1731486640;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AsoJeQT7lIbORupJmPx8o8UcNDx1QgoC4+ZDQJoGnSc=;
        b=EUdVYDiHKvzDwaBu8Tjq68JMgJf75vC9Qj+t3ghJKeuCSGUVl4Yi/JvF1dy0CVRnSJ
         q/WUQtsbcIHRZsUWAFDSEygB7C1CdUTsGoOCs9WwH0sZI0S5ecd+ujFmziUzld7KJ8W2
         wWPQUcfMVlUlzxlQjxgt59cbtFmxZO04eW+Y+SQ/3EgT3ZpqsikMoDlCKIGvM56PX8VN
         SqR4HJWZZKCgbtWq1YmWL/U935jZfsRO3q59NyiL4P8abi5kHjRzP9xRCFxsedApjpO5
         u/jPAunpZVEpNjwR7IdDOvNhh1HPZiOOWuy70FVZ9Rr0S6U4sVeoMu6a6nzawwcaePdU
         lvLw==
X-Forwarded-Encrypted: i=1; AJvYcCUhvfs418BJxD4YOSjXgk62O/gPPlt6aYY6RrG8X1LK8IedsxhDL/YSxUyGhg5BYbFAu2l1GEKxRzVK87dOR8DX@lists.infradead.org
X-Gm-Message-State: AOJu0YxqMocRmm/rtX+8DN5mlicIKz76O0eVkOHxdqjkYhymHHGdpG0c
	HLXqGrtIpi33EnKigDue4KKzns8qxiWHDq1kuzcj1Sh+xBkseJsPD/XyqAj+tW2wyDGQBKBU7AF
	exl4uiINrK+U404xgex9naA==
X-Google-Smtp-Source: AGHT+IFnO97LH4M7nakwImn7GhWO3dwEBs9GkzFartsysl46F+6jkXxf6aVj3MHFmDdtMe6k2kDQQQH6u4FDvb/Y/Q==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a81:c745:0:b0:6e3:f32:5fc8 with SMTP
 id 00721157ae682-6ea52319152mr944207b3.1.1730881839861; Wed, 06 Nov 2024
 00:30:39 -0800 (PST)
Date: Wed,  6 Nov 2024 00:30:31 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241106083035.2813799-1-jingzhangos@google.com>
Subject: [PATCH v3 0/4] Some fixes about vgic-its
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Kunkun Jiang <jiangkunkun@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_003042_572360_0668933B 
X-CRM114-Status: GOOD (  11.74  )
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

This patch series addresses a critical issue in the VGIC ITS tables'
save/restore mechanism, accompanied by a comprehensive selftest for bug
reproduction and verification.

The fix is from Kunkun Jiang at [1]. Only a few typos are addressed.

The identified bug manifests as a failure in VM suspend/resume operations.
The root cause lies in the repeated suspend attempts often required for
successful VM suspension, coupled with concurrent device interrupt registration
and freeing. This concurrency leads to inconsistencies in ITS mappings before
the save operation, potentially leaving orphaned Device Translation Entries
(DTEs) and Interrupt Translation Entries (ITEs) in the respective tables.

During the subsequent restore operation, encountering these orphaned entries
can result in two error scenarios:
* EINVAL Error: If an orphaned entry lacks a corresponding collection ID, the
  restore operation fails with an EINVAL error.
* Mapping Corruption: If an orphaned entry possesses a valid collection ID, the
  restore operation may succeed but with incorrect or lost mappings,
  compromising system integrity.

The provided selftest facilitates the reproduction of both error scenarios:
* EINVAL Reproduction: Execute ./vgic_its_tables without any options.
* Mapping Corruption Reproduction: Execute ./vgic_its_tables -s
  The -s option enforces identical collection IDs for all mappings.
* A workaround within the selftest involves clearing the tables before the save
  operation using the command ./vgic_its_tables -c. With this, we can run the
  the selftest successfully on host w/o the fix.

---

* v2 -> v3:
  - Rebased to v6.12-rc6
  - Fixed some typos
  - Added a selftest for bug reproduction and verification

* v1 -> v2:
  - Replaced BUG_ON() with KVM_BUG_ON()

[1] https://lore.kernel.org/linux-arm-kernel/20240704142319.728-1-jiangkunkun@huawei.com

---

Jing Zhang (1):
  KVM: selftests: aarch64: Test VGIC ITS tables save/restore

Kunkun Jiang (3):
  KVM: arm64: vgic-its: Add a data length check in vgic_its_save_*
  KVM: arm64: vgic-its: Clear DTE when MAPD unmaps a device
  KVM: arm64: vgic-its: Clear ITE when DISCARD frees an ITE

 arch/arm64/kvm/vgic/vgic-its.c                |  44 +-
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/vgic_its_tables.c   | 566 ++++++++++++++++++
 .../kvm/include/aarch64/gic_v3_its.h          |   3 +-
 .../testing/selftests/kvm/include/kvm_util.h  |   4 +-
 .../selftests/kvm/lib/aarch64/gic_v3_its.c    |  24 +-
 6 files changed, 632 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/aarch64/vgic_its_tables.c


base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
-- 
2.47.0.277.g8800431eea-goog


