Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E94C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FuNUljzoEpl0oR8lWC1KESdUs/Gb6Cdd9PNArMkRTaE=; b=WboK/lOGq3Ky1dy0iE6dKwZx6/
	cP3jGuc6Y/GRpDUFO5V+hZrDo48q5yMiUuacIkcJ/0JxooFl+6TmnHxa3PSLHxoypmdtugedJLdt1
	TMMmE9lW5zvM47eHWtVklWGSd34fyrCeitw1c0TkM2bO69e0GYIPO3WrAoaHnqtQnw0QoIPyljT55
	ksA0nV3ZG6AsoO6S5TpVU4gIVJHpNsQ2lSay2GUwHyrBnQG1FTirENJ6eId8G61RRZaZViEylEsm3
	4+MAUOXVKCV4tJWsSlBy0YZYbTI7lbpVjPTBaJ02eZjkKU7t0bGr3mUWjmR0JY9GsRSEk7FyKJXcC
	XsYcvvpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxv-0000000BX9R-1QLm;
	Thu, 24 Sep 2026 16:06:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lxn-0000000BX3g-3XT8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:06:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDFD01E8D;
	Thu, 24 Sep 2026 09:06:18 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 34F253F86C;
	Thu, 24 Sep 2026 09:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265982; bh=WsjSAf7iPMA/K8mPP8RhduMdKhLRQFgtRTlAA6Oernw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pU5ymd75t/CsfpLogXNdcKPi6/IkzjunVpNkSNjU+ftoujdOrGrACqvP69o+M6ac+
	 um4onCJbRh8aczQEMbtQSNjCYHd2ujS9M06fe1S+T3jKJNIHKJ6dveCrxCvHkHkTCs
	 7FlWfo8P4z5mDotM95yfp6eRbdPk17QbNI4JNMV8=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v20 14/22] KVM: arm64: CCA: Add a new mode for supporting Realm guests
Date: Thu, 24 Sep 2026 17:04:56 +0100
Message-ID: <20260924160504.853911-15-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090623_944123_C8FD40BA 
X-CRM114-Status: GOOD (  11.24  )
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

Add an explicit mode to support Arm CCA guests.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/include/asm/kvm_host.h               | 1 +
 arch/arm64/kvm/arm.c                            | 5 +++++
 3 files changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 68647ff4bdd24..1afe3df3b923e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3256,6 +3256,9 @@ Kernel parameters
 			nested: VHE-based mode with support for nested
 				virtualization. Requires at least ARMv8.4
 				hardware (with FEAT_NV2).
+			rmm: Support for running confidential guests in Realm
+			     world using RMM, as defined by Arm Confidential
+			     Compute Architecture (CCA)
 
 			Defaults to VHE/nVHE based on hardware support. Setting
 			mode to "protected" will disable kexec and hibernation
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 4d75b8e6797bb..4516594d90462 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -69,6 +69,7 @@ enum kvm_mode {
 	KVM_MODE_DEFAULT,
 	KVM_MODE_PROTECTED,
 	KVM_MODE_NV,
+	KVM_MODE_RMM,
 	KVM_MODE_NONE,
 };
 #ifdef CONFIG_KVM
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index bcb78fc7676c5..3ab722f2af7c8 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -3277,6 +3277,11 @@ static int __init early_kvm_mode_cfg(char *arg)
 		return 0;
 	}
 
+	if (strcmp(arg, "rmm") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
+		kvm_mode = KVM_MODE_RMM;
+		return 0;
+	}
+
 	return -EINVAL;
 }
 early_param("kvm-arm.mode", early_kvm_mode_cfg);
-- 
2.43.0


