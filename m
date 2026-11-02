Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2117F60A2624
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JetCHqET;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=u8uArIKx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=76K72pEWdfxOay4+O36IImo/Yc4P30Q+GZluQh4Ft3o=; b=JetCHqETQPRjQB
	XzbkZ52G+XuuSBRd/nei8i4OEHkTBEnVMdiNAyNZd8evnHrm48/pOC8BogeC2z50YMOySdSEGwFcg
	QHni0bagshIQh7wj3M+Q/+Kf96xUVHmNt6ydb2yH+IyWs1F0JzkwXcshJLqmJxDdSqoFYhUo6WQeq
	N/AZB9ss6aCa0RxRMYdZO7URLFwuSB1YbeN+dUbSL/b0as9NFsYfHiMqo+uqqhTRDIxCfBC8ppOuC
	bzCztH7F5VWejgjc5FdbeYehtY4UyGxPSFd/snkyuf6ofWYCr9kkEDUZk1H6jFCI9ljf/l1pfdA+Z
	uadjzErL5tfGLX8Ht8Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnF-0000000GjlT-0kZo;
	Mon, 02 Nov 2026 14:13:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnC-0000000GjkE-1vY7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:13:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE71319F0;
	Mon,  2 Nov 2026 06:13:41 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8FB63F59E;
	Mon,  2 Nov 2026 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628825; bh=Z1wTMEkKoVCrv8XQGReu1ie2hkH7sv7V4AiWMZvW4Q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u8uArIKxLShS1Pf1Vmb9ibDtl0ljwY3IMeQUjp1R0YwjTq2C38pI0mDDuzgYlP3ht
	 TIHiOon/DFe/T9I9C+3q/Qu6tiCg1RWEpScfn+pxSdHxl7NBoQ8LPV++jCdO/Hhnb/
	 wbilikk0OQ6vmbAFxKJyCH9WRPXVBMZqwOJRtHwk=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 03/11] KVM: arm64: CCA: Check for RMI support at KVM init
Date: Mon,  2 Nov 2026 14:12:54 +0000
Message-ID: <20261102141304.126883-4-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141304.126883-1-steven.price@arm.com>
References: <20261102141304.126883-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061346_543730_6669BBF6 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -4.4 (----)
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

Check if the RMI support is sufficient for using in KVM. Specifically, we
will only support creating realm VMs when KVM is set to 'rmm' mode.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 arch/arm64/kvm/rmi.c   | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index cecea0820e52..d067063a3686 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -34,6 +34,7 @@ menuconfig KVM
 	select GUEST_PERF_EVENTS if PERF_EVENTS
 	select KVM_GUEST_MEMFD
 	select KVM_GENERIC_PRE_FAULT_MEMORY
+	select ARM_RMM_RMI
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/rmi.c b/arch/arm64/kvm/rmi.c
index 5ecc8b349869..9d118768550d 100644
--- a/arch/arm64/kvm/rmi.c
+++ b/arch/arm64/kvm/rmi.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023-2026 ARM Ltd.
  */
 
+#include <linux/arm-rmi-cmds.h>
 #include <linux/kvm_host.h>
 
 #include <asm/virt.h>
@@ -12,7 +13,8 @@ void kvm_init_rmi(void)
 	if (kvm_get_mode() != KVM_MODE_RMM)
 		return;
 
-	/* TODO: Check if the RMI is available */
+	if (!is_rmi_available())
+		return;
 
 	/* Future patch will enable static branch kvm_rmi_is_available */
 }
-- 
2.43.0


