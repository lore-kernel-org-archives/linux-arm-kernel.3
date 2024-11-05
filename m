Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA47DD36113
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 19:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1kDemeRRcfLF2O+g89Ve347OTeAjaVFT/WyHCeg28DI=; b=U20AcAAQmyqonahzRGGkDRpy6X
	ZVhPuqA1qbK+RfF2I4+NA48zlxN2V3+0pDagTJ5G05Kl37pCQQEprXyrXuvaWIobm/xhfikqaIJZx
	u4IVPTyskJOd4H2K4v5EpobeRExDRcLcOjwVn2NNgBbJ3rLXIJNCAUhTRneH3puMo3piNffKCUz25
	kkB8fU+kqVk8zBOLYBbyEfbKC4zirFVDm1sVXovmBdKNkbilwmG28B1i9CtAYPu2Eagp5XLpnkh/G
	2bYPqWRiu8XTUH21IkG/D2/bSRjvPt/+GfztAwi1rqMaH6gDUjnNQv0JXd2TpaG0l5zmxLi85w2kb
	VRdacOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PLm-00000000ZHg-1cR4;
	Tue, 05 Nov 2024 19:36:26 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8PK0-00000000Ynx-2j0l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 19:34:38 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e02b5792baaso9335080276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 11:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730835274; x=1731440074; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1kDemeRRcfLF2O+g89Ve347OTeAjaVFT/WyHCeg28DI=;
        b=fKYS/e4Fce6SF6uIkfALaoLWhm9SHRXpfi8JlfWianPybKSvnwZQDinVe13EQnBoPF
         4U8m4b+s4y7LzbZ3Q/EnzpSdUfeY4MId17meYUkGhtG1pQiHKl54Gh5QkML91mL6Wt1F
         kDyvSB5KpErEkhzGFWW6OQW7nUjilRawVuIcgZexq4vkKvhF+AyOohJezk9nRQVAz3ed
         uCrv1q6tdf+MGsGVOUAsSW1lgtnAP/96vz6IX41sQpAHzTZnYB6NtzJ3/ieVjc0A3ywJ
         NK9xz4fwOEVoUFSjMVjNUlOEzVVZQ2y3WIq/Jl+jeYLEHpL0+t//nyY4DKmkw/ExFqkf
         8fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730835274; x=1731440074;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1kDemeRRcfLF2O+g89Ve347OTeAjaVFT/WyHCeg28DI=;
        b=rd37HHRfue2ONEOd1LPb4x5162My7oNm9PHUadU8tKxpZTf2mp9XWUlRw5DZ0jSZnU
         X11wBgkeNLLcjA97ujYcSW/nzzCTUpoehApTbmHXh+BWyOQS4G9GioL3b432rn3ZAqrv
         vsM7WI+s1kEpB/FKngGuwj2q/tfVUMo0CKPNrqCWSdEhZ4J71HPtczcewAJjEykvbh7f
         vGKXm7bcTJlYnRR2V5fEbRtVR+KFgzYkNnRPM1KsvXfI5xjlDjSZWT0qooR4KrPMxMUR
         tZsX+36GUy8cB84EoD1QiCVz0hE/VdxNMWW93gE04/Lrn6/me7rtw8WHYcvqrefNtEc1
         rKyA==
X-Forwarded-Encrypted: i=1; AJvYcCUVzhAZjMYiGDpknBBhD+u8A4ysbgxSkl09x8FugDs7mRzPgxAurzeBVK3WHC9hFuHPWUPt6qx+wa74qeFtArKV@lists.infradead.org
X-Gm-Message-State: AOJu0YxC77KJFIJ6sxZB3t8t3ngG4wqPB1YvJ2b6hHMY12DpHRBnTzdw
	HPXk70v85/UZ+lhVvyuOXz+dFtiIu4FT56jh/sB3nAgigKElPgKidx+6pQqZXV2SVl3xYLGGINA
	4vjp7itCo7sgpDWuUXyC+/A==
X-Google-Smtp-Source: AGHT+IEfQN1GX0nvXB8mRoHxNkSjhHGvcGwolBcEqfNEKCNyhhGmJmIBlngJwnRFkHrfsc5HAiabELF0rMUBpWgruw==
X-Received: from jgzg.c.googlers.com ([fda3:e722:ac3:cc00:36:e7b8:ac13:c96f])
 (user=jingzhangos job=sendgmr) by 2002:a25:ff19:0:b0:e2b:d0e9:1cdc with SMTP
 id 3f1490d57ef6-e33110bc767mr17266276.10.1730835274324; Tue, 05 Nov 2024
 11:34:34 -0800 (PST)
Date: Tue,  5 Nov 2024 11:34:18 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241105193422.1094875-1-jingzhangos@google.com>
Subject: [PATCH v1 0/4] Fix a bug in VGIC ITS tables' save/restore
From: Jing Zhang <jingzhangos@google.com>
To: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.coma>, Raghavendra Rao Ananta <rananta@google.com>, 
	Jing Zhang <jingzhangos@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_113436_739061_2C510A5C 
X-CRM114-Status: GOOD (  16.95  )
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

The core issue stems from the static linked list implementation of DTEs/ITEs,
requiring a full table scan to locate the list head during restoration. This
scan increases the likelihood of encountering orphaned entries.  To rectify
this, the patch series introduces a dummy head to the list, enabling immediate
access to the list head and bypassing the scan. This optimization not only
resolves the bug but also significantly enhances restore performance,
particularly in edge cases where valid entries reside at the end of the table.

Result from the test demonstrates a remarkable 1000x performance improvement in
such edge cases. For instance, with a single L2 device table (64KB) and 8192
mappings (one event per device at the table's end), the restore time is reduced
from 6 seconds to 6 milliseconds.

Importantly, these modifications maintain compatibility with the existing ITS
TABLE ABI REV0.
The table entry was a valid DTE/ITE, or an orphaned DTE/ITE, or an entry of 0.
The dummy entry added in this patch series presents a fourth kind, which is an
invalid entry w/ an offset field pointing to the first valid entry in the table.
The dummy head entry is always the first entry in the table if it exists.

An alternative solution, proposed in patch series [1], involves clearing
DTEs/ITEs during MAPD/DISCARD commands. While this approach requires fewer code
changes, it lacks the performance benefits offered by the dummy head solution
presented in this patch series.

---

* v1:
  - Based on v6.12-rc6

[1] https://lore.kernel.org/linux-arm-kernel/20240704142319.728-1-jiangkunkun@huawei.com

---

Jing Zhang (4):
  KVM: selftests: aarch64: Test VGIC ITS tables save/restore
  KVM: arm64: vgic-its: Add a dummy DTE/ITE if necessary in ITS tables
    save operation
  KVM: arm64: vgic-its: Return device/event id instead of offset in ITS
    tables restore
  KVM: arm64: vgic-its: Utilize the dummy entry in ITS tables restoring

 arch/arm64/kvm/vgic/vgic-its.c                | 154 +++--
 arch/arm64/kvm/vgic/vgic.h                    |   6 +
 tools/testing/selftests/kvm/Makefile          |   1 +
 .../selftests/kvm/aarch64/vgic_its_tables.c   | 562 ++++++++++++++++++
 .../kvm/include/aarch64/gic_v3_its.h          |   3 +-
 .../testing/selftests/kvm/include/kvm_util.h  |   4 +-
 .../selftests/kvm/lib/aarch64/gic_v3_its.c    |  24 +-
 7 files changed, 713 insertions(+), 41 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/aarch64/vgic_its_tables.c


base-commit: 59b723cd2adbac2a34fc8e12c74ae26ae45bf230
-- 
2.47.0.199.ga7371fff76-goog


