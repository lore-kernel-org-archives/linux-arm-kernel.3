Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F5D606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 07:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qmq6STOd;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=a0DPpKqq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z58+V1LgFPW+j6akovhxZv60ektir/LOJatWFadIMFw=; b=qmq6STOdhBu80a
	qufgwflH3aTR23wukQrgE/YJLXqECEuMgCXA9+oy7St4/8iO9G3YF074inI3aAdx+dGXYNVT0f+x2
	wbGPAOEJ8GW5ujy7sPFI39ICNPc0H+4n14mJEoM22s+S1ku8CT37pU5sUcscec5OYfqAuF4UymCM5
	16ZjLEQuzWvktUcJlvkACy0dmtfnYLd+eIzOagrLiLFTlSaMvwCDBDqzMp7p8sJl85tMs3a/rUcln
	WDCiQeJdQs0IzskLKRa9/UkBQUAyfD+vhyFwyD+Rz4XKF/0pfe+wuYNW1xl6NIdBNod3vBXLzJ2Kq
	gd9bYTL2DBhyiZGQRXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmwP-0000000FoKw-49UT;
	Mon, 02 Nov 2026 07:58:53 +0000
Received: from out-226.mta1.migadu.com ([2001:41d0:203:375::e2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmwN-0000000FoK2-205e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 07:58:52 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=E+yNN660ZSvNAcxzl1biL8JK8VlI5gYHahRxIDWZ1l4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793606329; v=1; x=1794211129;
 b=a0DPpKqqdE39iZynjDq4nwTpgkIP3QqfmtbeYZJHXrl5DfT9kvVRcmYbyltl5ncZtL8Z7ZyM
 tzWmjc6Nh2e7Frx+sERoyChDcCA/2NCCwBXJ5qhqTBtacqIW9NX61nODjv+I4kvkjqwoT0rrnBI
 HOnd7vRXi32EPLCIwHGpJnjU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id af6687c61325397b;
	Mon, 02 Nov 2026 07:58:49 +0000
X-Mizu-Trace-ID: af6687c61325397b
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Jack Thomson <jackabt@amazon.com>,
	Congkai Tan <congkai@amazon.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v4 2/2] KVM: arm64: Clear the default PMU when kvm_setup_vcpu() fails
Date: Mon,  2 Nov 2026 07:58:43 +0000
Message-ID: <20261102075843.2556018-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102075843.2556018-1-fuad.tabba@linux.dev>
References: <20261102075843.2556018-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_235851_657816_29B67074 
X-CRM114-Status: GOOD (  13.92  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Under KVM_ARM_VCPU_PMU_V3_STRICT, the VM has no PMU until userspace
selects one, and initializing the PMU fails with -ENXIO until then.
However, without STRICT, kvm_setup_vcpu() selects the default PMU
before it prepares the vCPU for nested virtualization, and leaves it
set when that preparation fails. After a retry with STRICT,
initializing the PMU succeeds and the guest gets the PMU of the CPU
the failed INIT ran on.

Drop the PMU and its number of counters along with the VM's feature
bitmap. While KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED is clear, no vCPU
has been initialized and the PMU attributes return -ENODEV, so only
such a failure can have set them. Once the flag is set, every INIT has the
features of the first one that succeeded, which either selected a PMU
or had none to select, so kvm_setup_vcpu() doesn't select another.

Fixes: ad220e275c398 ("KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_STRICT vCPU feature")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/arm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 3e91e01b032c4..65194e02cdbc2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1857,9 +1857,12 @@ static int __kvm_vcpu_set_target(struct kvm_vcpu *vcpu,
 
 	ret = kvm_setup_vcpu(vcpu);
 	if (ret) {
-		/* Clear the bitmap if setup fails on the first vCPU to be initialized. */
-		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags))
+		/* Clear the bitmap and PMU if setup fails on the first vCPU to be initialized. */
+		if (!test_bit(KVM_ARCH_FLAG_VCPU_FEATURES_CONFIGURED, &kvm->arch.flags)) {
 			bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
+			kvm->arch.arm_pmu = NULL;
+			kvm->arch.nr_pmu_counters = 0;
+		}
 
 		goto out_unlock;
 	}
-- 
2.47.3


