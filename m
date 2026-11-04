Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8012606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Su9P7k17;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3l6P79K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=N/SsdHu+Po4v4WPdkAdXaeFtGaJ5FCa56QFJpxcXNro=; b=Su9P7k17Lu0SCYJq5a0pmnbLNJ
	qHqALfnwHjxSvl0c1ZMP1q6+T1i6JXlqhTOUpuZCHWLyCn06Z8kYmsFPSGoi36Ierc6KeCBfOurJz
	2t0IZnbCjtRwsODIOXgx8hIaou3bXAaUg2YUTzRt3DCIOMj05PKbD46LBucbMcCWbzeIMLzA546ql
	jy9kzQAUAj2V6IYneHpZcoOb7wkqFxdX8nRqYEdgm6TdwfpAvurjd/FngLZG+f+Gz8yaLu89/icSV
	9GNNDGmkiUvBpW+S1IbehOac4h5q1BhtiMtPH0OYHVjWW3lq84jcZp/gxn8H0nyQplrPKCJxGv6Ah
	KKK9+99g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdG-00000005Yj3-2t6R;
	Wed, 04 Nov 2026 14:06:30 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdD-00000005Yhz-17to
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:06:28 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4afef353dd2so12561625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793801184; x=1794405984; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/SsdHu+Po4v4WPdkAdXaeFtGaJ5FCa56QFJpxcXNro=;
        b=l3l6P79KfyYNhy4ciwe107s5vUF7taDyDgFhswzsmKL32Bq187PGO723EWlUgVXdP1
         wCGHn6kl3CKQAIWj5OnU3UiDfXEzVg4ctxyG5FkFAO9DU1VrX9Gqc8oYIU43KTSJwC4q
         NXtyKSVKzyHq18l735wF4IcGVSkME5gCJP4U79JKYzG/wX9XTWmqLy0A0919MK/nZdiX
         Qtm6GERIRNdxRVSv5oA3lhS8hTh/mjVCcvKNTLeGQ/1wiQ4Qc450ISkWDQgV+EFb0UOD
         atyPz5IEYpzuonTdesfbU7tr9ELslLxL7CJ7xJFfk1bFQAzqsqFv3Z35SHT6+ElgWSy+
         JYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801184; x=1794405984;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N/SsdHu+Po4v4WPdkAdXaeFtGaJ5FCa56QFJpxcXNro=;
        b=tfcBsue2JLmPfMOuQ1rwWFaBB5nS8O8Xr/hPmomhUfNO5HEksSUhFeG4PIcT4EN346
         IfqGXapkpPVRbJYXZ0akKP3Y9IxFfznjDAMteD/Iiurp9nM87XQByN9b+O55JeIqqLA3
         A4mYBlM0M1uCW7Al56hMgPxF0InOr4EL1AVLqtCFER3nNRbVSKpCU77jdtTC+vy33jhi
         93JOF3QGvOiLzy6KqzsPBnq09Nx4N1LcVXYAw4GLg+kebbvEkYKgJIJCDebXS3lzo8bX
         ZdxuiiLdawpy+6aJcl5e6JQzCuLlMn6rSqohsLr/7aGl1/ISZY4LYhHIowTc3tXaw2SV
         0fsA==
X-Forwarded-Encrypted: i=1; AKwUvBwdDGx5mGJ98rZsmqz+3hq4AVRyykehHqvBwYuKGiLtChIliY32h1Z0l0rpYyGom5RDuMticVZx5chSTwvd5bnG@lists.infradead.org
X-Gm-Message-State: APuU4Z90EdXa5N50A3+a/y3frWeevhI38K6HMAth0zuBFYK7e7fKDzXf
	XZ1fApQEN1WDBORavaKUlclusjmzY75FOQQq5VOis4XBVmkwJQtZudFcq1YldbyUJ5Jm5mUjSgW
	R/NywGtlmU/8RLNvz/n/Rbw==
X-Received: from wmpo23.prod.google.com ([2002:a05:600c:3397:b0:4a2:c25:d91a])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4ac17e10ac3mr382089215e9.19.1793801184306;
 Wed, 04 Nov 2026 06:06:24 -0800 (PST)
Date: Wed,  4 Nov 2026 14:06:07 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104140612.137869-1-vdonnefort@google.com>
Subject: [PATCH v2 0/5] KVM: arm64: pkvm: Extend hypervisor entering tracing reasons
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060627_352496_7DD2439B 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series makes the hyp_enter event more detailed by adding a "from="
field and by using the ESR class when relevant. This is interesting for
example to know when the guest has exited for an HVC.

Speaking of HVCs, protected VMs issue an HVC to share memory with the
host. Without this memory sharing, it is impossible to get logs. So if
for any reason it fails, debugging is quite cumbersome. Add a specific
guest_hvc event that will give even more details than hyp_enter
provides.

Also, add a host_hvc event, so that the host gets similar coverage to a
protected VM.

Changelog:

v2:
  * Add missing exception classes to kvm_arm_exception_class (Fuad)
  * Split the HYP_REASON_PSCI -> HYP_REASON_ERET_HOST fix in
    __kvm_host_psci_cpu_entry() into a separate patch.
  * Add missing <asm/esr.h> (Fuad)
  * Read ESR_EL2 only when hyp_enter is enabled (Fuad)
  * Drop the handled field from guest_hvc and trace only
    hypervisor-handled HVCs.
  * Rename ret to x1 in host_hvc (Fuad) and val to x0 in guest_hvc.
  * Log the SMCCC function ID in host_hvc instead of the host_hcall[]
    index. (Fuad)
  * remote_event_format_show() field alignment fixed
    separately (https://lore.kernel.org/all/20261009132848.709379-1-vdonnefort@google.com/). (Fuad)
  * Rebased on top of v7.4-rc1.

v1 (https://lore.kernel.org/all/20261009084529.462577-1-vdonnefort@google.com/)

Vincent Donnefort (5):
  KVM: arm64: Add missing exception classes to kvm_arm_exception_class
  KVM: arm64: Use HYP_REASON_ERET_HOST on trace_hyp_exit from
    PSCI_CPU_ON
  KVM: arm64: Add ESR class to the hyp_enter hyp event
  KVM: arm64: Add guest_hvc hyp event
  KVM: arm64: Add host_hvc hyp event

 arch/arm64/include/asm/kvm_arm.h       | 13 +++---
 arch/arm64/include/asm/kvm_hypevents.h | 55 ++++++++++++++++++++------
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  9 ++---
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 12 +++++-
 arch/arm64/kvm/hyp/nvhe/psci-relay.c   |  2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c       |  6 ++-
 arch/arm64/kvm/hyp_trace.c             | 52 ++++++++++++++++++------
 7 files changed, 111 insertions(+), 38 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.455.g6c5a503b38-goog


