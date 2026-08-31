Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E23C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=seMt61JR8WO02xp6SOLRxCCG0tr+MAwwqiFyhbMBI5g=; b=NWPc2rs1gmsb2htpGkCyUdBfch
	bmezIYngUf/uVhFtZ1/qtt36Q5FqS2YdXIxQ+byMRL2Tgqoo7qll8k5JV/WHSA0YbAr56nf0A3Vlv
	UORdeLUDpbXmFR5yrUO2h7hQIwwPeN+9WBhC5zuLJzse3Op75RWZo0aBxDiWx5KQIPI4kzR0f2+6D
	WzQiehsdSqcmgz8Vop/T8Agv2XmEMJQoEkQvY4sUPI1MwjWEoRGRjnS3qZaOIkVXV32ukPfD5pnIA
	H6hmyz9WizRGd8yVtk8tlg9Ny2/+DNbwbLA2CAGyY1W2cR8cQAiPN99vDUSDtB+Yd6OD4ygdQ+Rg/
	H5v03Bdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x5z-00000008nep-36xf;
	Mon, 31 Aug 2026 08:10:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x5w-00000008ndt-2j6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:10:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so6946925e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163819; x=1788768619; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=seMt61JR8WO02xp6SOLRxCCG0tr+MAwwqiFyhbMBI5g=;
        b=i0eh7u6riolsvBAhBHz/3Z66CEYAwDIQoiAkvuLwbyy9sdSdFv0bBdT3UEkS7Gibi1
         qVEOvznysOgRQBP/k/RK2VNSDJEpYpzP49XQ8t8Da1djyrfOaSgQcYfIIFqxJcMt1VaW
         wyoJ31+EWfU7pvvrHcPChUlc4KhjTNnRvn2l3QWVUiAuIe5m/mpDzlie47Dkmv/lUQM/
         bHu0Rid8J9OHYyEujomUsxj21Nq8s7xrCqWtshcwUK/EIuM1gzhCyJdIxTkxUw9j4zLc
         fJ0AJbXsvuje6mjNtc/k6JlZEr5pNKHybK1FgIGXBvKFyIn9UOWdKZ82o3l4kZS3ERSd
         iXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163819; x=1788768619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=seMt61JR8WO02xp6SOLRxCCG0tr+MAwwqiFyhbMBI5g=;
        b=GnBgx9nWY1P8K4XBlGe4IXQwJZngw00V16fK27Rhzv3dxYmiwXd45JrkvyNClMqzaI
         PyI8cOmG77MzGfzVdAZ114GE5YYep8kkK2OSFjBJXOMaIOqVT4wKjRjlq11K2isq9BuU
         dBmpiHOxTT4S4dFynnFv6rqBKYBU9SqCEeT47v/zyEe89NTlhjow+wDnZj5Nr/d7dlsM
         Kk6PASDg9w3VX4uCCigSPUpZ3/2MO7n+gA+sZbWxzNJajXaAGdNZCnSMjibC2BzrhLr5
         EDP2kahKNH8XW2D9u+xi79RE13RsxcRy+9fudcDJeHH2tRzEiMAki11EvlR3SWIYSiI7
         w5NA==
X-Forwarded-Encrypted: i=1; AHgh+RoxMxFBMVOPNQVph3XIkrt94iitCnwD3qhyqW1EEI9U9bJwQdcZR7j3VH4yRyAPdPI+RWAhqvRKs3esVsDYxq1W@lists.infradead.org
X-Gm-Message-State: AFuF++mBKk3SksFej4bxcCoXb22jLQHjb6cpJRGLxO5V1Ve6v16ASuEH
	8i0BwDNahEsyA1evwb3jAjzhxB9QKJqfr9BmEyiPmVRMaMEgKlDYRHdE
X-Gm-Gg: AR+sD11Zl7Ai4WPECa18Fa33VXE7dpPtI67sGugUi4yZvCh5MbG/Uo2VcGeBOBuZkLz
	3MU8DVENH/4kkUWWXkS4bzKrRQV82sKIMJ3I+UDLbyysHnNLXNnuM2O6sUnCwtZ7F2KMY7WabmP
	HDb288HDzqHg6IO/i8RiH4rHqeENRwv5sS4+FKHzlaveDqUhdHCJkckJKEhuUjG2Xhw2aIuxsm5
	vB1uk2BUuGTmhm76L5IuIkNr/GvxOT1bfK9B/+ztCat4YkypwIurFDGCtTREqYbtIA9COnLxbsu
	D1+qB0+Q0huw6J5QEF/hs43htn2WNMc4LxitPRbrh2h2vbtZghS7ktZIIfUsk3XzBqV4CpGBGVp
	8JcaSU1GKtERh4JpvlBWBEFRTaMTctHTM3hd15Mg2dasQmgVKBnGUR7tOr0NPboR5zDWC3NUIgG
	oUCaBrOwGeOSNF2TKc4Kb5RUodRsL4ixM2KD/WD8t6QvxzoB5aL7gBtZM41xXpQ9nL+wabDKq5n
	+ck6kgrhPH793hiQDG17h4R+cu/32FlaraTbKbvykvmX46xU7bJb3UaQ2vat/dxDZfdMUsTf+R8
	qpDwnfcjn+fG+hU/F8FUqOR/c3V5OuynMvQXuWjRb9G5V2JlWZEUcB1BxAFW2zuhWTqyuJr6usK
	Nl8vjxA==
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr396116665e9.9.1788163818374;
        Mon, 31 Aug 2026 01:10:18 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 0/4] KVM: arm64: fix VGICv3 redistributor rollback
Date: Mon, 31 Aug 2026 10:10:00 +0200
Message-Id: <20260831081005.41346-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011020_707533_70A2DDCE 
X-CRM114-Status: GOOD (  11.89  )
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

A failed REDIST_REGION write can unregister redistributor iodevs while
leaving their assignments cached. A retry then skips those vCPUs and leaves
their iodevs missing.

Patch 1 fixes the accounting when an individual MMIO-bus registration
fails. It reserves the selected region slot before registration and undoes
that assignment on failure.

Patch 2 limits rollback to assignments from the new region. Resetting
assignments from an older region can miss one held by a vCPU that is not
yet visible to kvm_for_each_vcpu() and move free_index behind that live
assignment.
slots_lock prevents a concurrent vCPU from acquiring an assignment from the
new region before a failed write removes it.

Patches 3 and 4 add regression coverage for an overlapping region, retry,
and final GICR_TYPER accesses to all four redistributors.

Testing:
- Built the modified arm64 KVM objects with W=1 and the arm64 vgic_init
  selftest using GCC 13.3.0.
- On an Arm Base RevC AEMvA FVP with GICv3, vgic_init passed with nVHE,
  VHE and protected hVHE. A VHE kernel with PROVE_LOCKING and KASAN also
  passed without lockdep or KASAN reports. A control kernel containing
  only patches 3 and 4 failed at the first GICR_TYPER access, 0x8030008.
- Under QEMU 11.0.2 TCG, test-only instrumentation paused vCPU creation
  after assigning a redistributor but before kvm_for_each_vcpu() could see
  it. An MMIO-bus registration failure was injected after one vCPU was
  assigned to the new region.
  Rollback preserved the old assignment before and after the vCPU became
  visible. A valid retry succeeded and guest GICR_TYPER accesses found all
  four redistributors.
- An adapted Linux 5.10.268 backport of patches 1 and 2, on top of
  8542a8f95a67 ("KVM: arm64: vgic-v3: Fix error handling in
  vgic_v3_set_redist_base()"), passed the isolated retry test. The
  prerequisite-only control failed at the same GICR_TYPER access.

---
Changes since v3:
- Dropped the REDIST/REDIST_REGION serialization and VGIC init/destroy
  rework, keeping the fix close to v2. (Marc)
- Limited rollback to assignments from the new region so an older-region
  assignment cannot be missed during concurrent vCPU creation.
- Added Fuad's Reviewed-by tags to patches 1, 3 and 4. These are otherwise
  unchanged from v3 (formerly patches 1, 4 and 5).

Previous version:
v3: https://lore.kernel.org/r/20260822095346.53882-1-kmehltretter@gmail.com

Karl Mehltretter (4):
  KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
  KVM: arm64: vgic-v3: Roll back assignments from the new region
  KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
  KVM: arm64: selftests: Test VGICv3 redistributor region retry

 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  54 ++++++--
 tools/testing/selftests/kvm/arm64/vgic_init.c | 116 ++++++++++++++++--
 2 files changed, 151 insertions(+), 19 deletions(-)

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.39.5 (Apple Git-154)

