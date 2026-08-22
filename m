Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0C6C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KmdKERRlZ3s8gh9GxjWOTYWpaFpAZrnfexg7i/lEpyM=; b=vGTFdWbP9HDlKPqCxNAjo51xCb
	qwBFFJ/PZGSTHPRM4u98B0RThGvlviough4R/bSyaJr3CPIqrNeQqhjHmGAhh2bbR6MWcmzajFvtV
	5guh9QSGQnnyMnK+hlnwnyc6IkbTxdvhwijACvcEr8C6zbk3WzeJxkkjAIqlC8q8iWQ9G6McKfVf9
	DoopQJTxqPX8Z3ASliLxA+PsPDXS8NN6zKxCfqSz5QbybMTwic3smOQ6uDN5BODrlmvxRjOf63g5q
	OKOl3Hqo3/FHVaVel06OeCy0zCqeYne5SdOYAjXx0gUAEFIjWlUbXJAdcBFxQM8sh/nhSBd742r40
	wGDW3XvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQH-0000000ERLe-2p9n;
	Sat, 22 Aug 2026 09:53:57 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQF-0000000ERKu-0263
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:53:56 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso3256117a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392433; x=1787997233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmdKERRlZ3s8gh9GxjWOTYWpaFpAZrnfexg7i/lEpyM=;
        b=nKGSUNCGK2bxac4EqbuPP6I/L/9ikcMhWqY7Xienm0d17u9DrXYv3MMe10r62Nh9MF
         p9nUMZTU0WSftUOglyzbzvFKJXb8KEw9+n43iH964mAdSNWPAryqv4a8N8nVJY9sgxnl
         BobOuETktDOahvC6I2XBxjgqEGBYcK+1ZxssZO3IWaMhiFf8fO5eAtboo8vKPEcoyQSL
         r+S7QxSzuCBer3aOfX9sh8E/zaBlQaqGMAza1OrVLWMyw7eSQYjtcqKvriywXqG3Zi/D
         ALSGCfBrUQiesrzvXGFRBdrYBBLzVC2j5Pme7NAwNQ8m/S9WT7jkOXH+S9WGjPSDk2H1
         TEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392433; x=1787997233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmdKERRlZ3s8gh9GxjWOTYWpaFpAZrnfexg7i/lEpyM=;
        b=nV7eDqMDMm5EgxIr0A8RGDmYUPTKssLcoo6dsJbMpeyEpMiOnsTCOQFL36kZYSejEi
         xezybTEDBGlPWO0W0pvalNMRdv0GeHuRN3bF6W34KgO+l6Bt7g0qeHXhgm1m25FNtQdk
         zmsC507jd+zLjNt7csXVqUhRLCPzLDiJriQdQqyRY69fCjQJW8RfrtQlcfUBnl2wojxT
         yZYkdkWQLMETu4wh+6rvJOOUEjRhAJd4+Vglu4sKSd4FS8ktju/LnPQYJqkPVTVz0M0n
         mY/Am9+qxo/purH2paqxLCXiSn26xVkUnq7tHXM0IJtC2FihYlRftKmW4wHRyv39dclA
         7YRA==
X-Forwarded-Encrypted: i=1; AHgh+Ro0VQFD60b6R9NaXvbIVdXAQaxsGBjNexfaKuokgqjuaDsTV4B21KHkKyvsqWGVfQyoFkU9GF8dEmlX2XzhVLt4@lists.infradead.org
X-Gm-Message-State: AFuF++lhhrtwSgMXu3pitSYZ/euYnGVODrxSZhVs8oEBJSdZtxagCUr+
	8sqLjnUgkH04DhSApvm7HU45uQhU9ODx0c3cTpRNVpoAotDc6aHkdS4i
X-Gm-Gg: AR+sD12McUxjTmL889pfYGtnAr2QaSogro+Sho4c2koPXZRS8b0yT4fRsT3izFpTynm
	uWrqENuACDSmT2ph89AHvzuSP5EKNtm3Z9l7cMfE+1df64V2vO2DIQwxd8p2rA41KOHSfaSorKE
	9zttsBOpGaNU44BQaLlyfYVq+PTOKhPMDSBw96BPCWz12KfBclkjwYektPQ6Hp0VNTstIGQvF3d
	RxOwTg/hh8sgDYBCeyVElyF5oQ/srNtKON6XnPsZU7kJSIomIKdTNot7AqsOxQkyzIMtaJK8Vgo
	2VPSThwIidjrfcNRnS0kznvIX2diTjfk+28BYs044c1ZZO8vAlqfNaEMBLM/QkU0LHPLuQ7VMS/
	u7/loEa/QJRg4spKxY72Z78pYPURzsBPTswmKyH39gVoLPQNiaKUBZsAzNFYgvdPBnMbgwJ5avn
	zdgUXucNGleOT5tNvVv7+bjCiyBapQOEQxnfljQ53IBmnWVGZxUfSmxUmp+p5u3CbJD6kMGqbH4
	3AVJf5qD5KGx+LGLP0EvUy8USV+2MzuakHFnW9aK/AnNMmeRxpX68WTe11EEh3YI/n8Gax+PNvE
	Ht8EzvEN5sf74a6UFI2pCkbNlNqSe0ISJfr9FZgeR9T8KhyFhQcbVmFt7Zh5DB3TM9lquPE74k6
	SLDHBEiCxTiLwf2U=
X-Received: by 2002:a05:6402:24a1:b0:6a3:f74d:6a20 with SMTP id 4fb4d7f45d1cf-6a582b0c6aamr5531353a12.4.1787392432720;
        Sat, 22 Aug 2026 02:53:52 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.53.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:53:52 -0700 (PDT)
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
Subject: [PATCH v3 0/5] KVM: arm64: fix VGICv3 redistributor rollback
Date: Sat, 22 Aug 2026 11:53:41 +0200
Message-Id: <20260822095346.53882-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025355_104738_283DEA28 
X-CRM114-Status: GOOD (  10.83  )
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

A failed REDIST_REGION write can remove redistributor iodevs from
KVM_MMIO_BUS while leaving their cached vCPU assignments intact. A
corrected retry then skips those redistributors.

Userspace should instead see a failed region update atomically: no prior
redistributor assignment survives the failure, and the next successful
update rebuilds all possible assignments in region-index order.

Patch 1 fixes a separate accounting bug when an individual MMIO-bus
registration fails. It reserves the selected region slot before
registration and undoes that known-latest assignment if registration fails.

Patch 2 implements the atomic failed-region behavior. It unregisters every
redistributor iodev, clears every cached assignment, resets the region
counters, and frees the newly inserted region. An in-flight vCPU can have
an RD iodev before kvm_for_each_vcpu() can see it, so REDIST and
REDIST_REGION writes are serialized with vCPU creation and return -EBUSY
while the created_vcpus/online_vcpus counts differ.

Patch 3 is independent teardown cleanup. It separates MMIO-bus teardown
from config-locked assignment cleanup, preserves the cleanup required
before a late failed vCPU creation frees the vCPU, and removes the special
conditional from the common vCPU destructor.

Patch 4 keeps the selftest helper aligned with vm_create_with_vcpus(), and
patch 5 adds regression coverage for an overlapping region, retry, and
final GICR_TYPER accesses to all four redistributors. The test exercises
patch 2's final-state behavior; patch 1's MMIO-bus allocation failure is
not fault-injected.

Testing: built the patched kernel and the arm64 vgic_init selftest with
GCC 13.3.0 in an arm64 Linux container. The selftest passed under QEMU
11.0.2 TCG with -machine virt,virtualization=on,gic-version=3 and -cpu max.

---
Changes since v2:
- Patch 1: limit free_index rollback to the immediate registration failure
  under slots_lock instead of generic unregistration. (Sashiko)
- Patch 2: reset all assignments and region counters after a failed region
  update (Marc), and serialize REDIST and REDIST_REGION writes with vCPU
  creation so rollback cannot miss an unpublished assignment.
- Patch 3: add an already-locked unassignment primitive, move failed-vCPU
  cleanup to kvm_vgic_vcpu_destroy(), and remove the redundant base_addr
  reset. (Marc)
- Patch 4: match vm_create_with_vcpus() by using void * for the guest-code
  argument. (Sashiko)
- Patch 5: document how the first three redistributors span regions 0
  and 1; no functional change.

Previous version:
v2: https://lore.kernel.org/r/20260819224229.82948-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  KVM: arm64: vgic-v3: Undo assignment on iodev registration failure
  KVM: arm64: vgic-v3: Reset redistributors after failed region setup
  KVM: arm64: vgic-v3: Separate redistributor teardown from unassignment
  KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
  KVM: arm64: selftests: Test VGICv3 redistributor region retry

 arch/arm64/kvm/vgic/vgic-init.c               |  46 +++----
 arch/arm64/kvm/vgic/vgic-kvm-device.c         |  20 +++
 arch/arm64/kvm/vgic/vgic-mmio-v3.c            |  83 ++++++++-----
 arch/arm64/kvm/vgic/vgic.h                    |   1 +
 tools/testing/selftests/kvm/arm64/vgic_init.c | 116 ++++++++++++++++--
 5 files changed, 200 insertions(+), 66 deletions(-)


base-commit: 57e7cf13ac26bf1a3dba6cfa601f7b2481811575
-- 
2.39.5 (Apple Git-154)

