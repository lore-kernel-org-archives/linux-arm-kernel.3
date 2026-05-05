Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32AECD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oa0vija6Wr2d2xrVA4sFWjriOFulAsPTIPzBUTYGj74=; b=vJcpolADKfKHbcnGYLRKAci1Gl
	6I9QyVh2PWtfEjObImRZmLUsgdEKNUdi23GR5HGJX7MWkcGC57GMzwYjFentoTLDRAVDehxxdz47C
	E4Bnrsj68ghnxqQ8OCx6Ymo4dBSTyb7nPPRudb0uBEvUF2ZPOq/4D5rg+ylHJpjg2y6FmeJkgPcH5
	RKwMDpHpsYVhbWxNgWzzQPnuZ6D5018PbZd8SqokGKPwGKABzfEKMuILOPnO/FO2YK5P+1PY42C03
	rKxx5J6dwHeGYmqtfe0Zm0Hb/nszuuU1g7k326fXZxkJH7RtWF9RAERpnQzxKYjmMzSgPs8UVTP19
	fSVhX4Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCTu-0000000FjBP-0gah;
	Tue, 05 May 2026 09:54:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCTr-0000000Fj8e-0FN4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:54:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BF8C293B;
	Tue,  5 May 2026 02:54:13 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2B4373F836;
	Tue,  5 May 2026 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777974858; bh=Uc19ZfCIAh0nPkICzdLt7MNyyqOESbRbbejxWvSRJWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yh7SOAi6kX06Dnx9lbc1gJXI1mfeiNmN1SZ4WwL/IXyj1tx7/AFx48IO8kH5YvkLB
	 ABMje3EqrqQMbVUst6/Q9oehZgRy6pmgWlK5Ctf8WdQMFJgJLmSi44Sdqsjg2xc9iQ
	 s/MgKSa5UGEQuubPn7t/ghbwqytP4mevTJZhcNyw=
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: jarkko@kernel.org,
	zohar@linux.ibm.com,
	roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	sudeep.holla@kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [RFC PATCH 1/3] arm64: KVM: defer kvm_init() to finalise_pkvm() when pKVM is enabled
Date: Tue,  5 May 2026 10:54:07 +0100
Message-Id: <20260505095409.1948371-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505095409.1948371-1-yeoreum.yun@arm.com>
References: <20260505095409.1948371-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_025419_227951_664C712E 
X-CRM114-Status: GOOD (  14.28  )
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

This patch is a preparatory change to address dependency issues
between the FF-A driver and pKVM.

kvm_init() should be invoked from finalise_pkvm(),
as this is the point where pKVM initialisation is finalised and
the system transitions into the protected mode.

Deferring kvm_init() ensures that KVM is initialised only after pKVM has
fully established its protected environment.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/arm.c  |  8 +++++---
 arch/arm64/kvm/pkvm.c | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 8bb2c7422cc8..663b1d447a9b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -3025,9 +3025,11 @@ static __init int kvm_arm_init(void)
 	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
 	 * hypervisor protection is finalized.
 	 */
-	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-	if (err)
-		goto out_subs;
+	if (!is_protected_kvm_enabled()) {
+		err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+		if (err)
+			goto out_subs;
+	}
 
 	/*
 	 * This should be called after initialization is done and failure isn't
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 053e4f733e4b..48b06d384570 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -17,6 +17,7 @@
 #include "hyp_constants.h"
 
 DEFINE_STATIC_KEY_FALSE(kvm_protected_mode_initialized);
+EXPORT_SYMBOL_GPL(kvm_protected_mode_initialized);
 
 static struct memblock_region *hyp_memory = kvm_nvhe_sym(hyp_memory);
 static unsigned int *hyp_memblock_nr_ptr = &kvm_nvhe_sym(hyp_memblock_nr);
@@ -289,10 +290,22 @@ static int __init finalize_pkvm(void)
 	kmemleak_free_part(__hyp_rodata_start, __hyp_rodata_end - __hyp_rodata_start);
 	kmemleak_free_part_phys(hyp_mem_base, hyp_mem_size);
 
-	ret = pkvm_drop_host_privileges();
+	ret = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (ret)
+		goto out_err;
+
+	ret = pkvm_drop_host_privileges();
+	if (ret) {
 		pr_err("Failed to finalize Hyp protection: %d\n", ret);
+		kvm_exit();
+		goto out_err;
+	}
+
+	return 0;
 
+out_err:
+	kvm_unregister_perf_callbacks();
+	kvm_arm_vmid_alloc_free();
 	return ret;
 }
 device_initcall_sync(finalize_pkvm);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


