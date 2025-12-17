Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B3D65528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayc7Y/LDhOrGp7HTEz0hRFUoiQKWERKnD5ZN9LctHBg=; b=qbDWXN0Ser7DgQHb02XTBs1zAU
	BzxQ2R8T3WtXBtjUZIkX1/2MPvHivSDli0XMMWtFLZ/3WxcoVJmfvg2ByTAHTj0CifrlH9nVMuzdx
	7VbMUGoaVIy/TIVaCsL9dMlOR8/9vIDzN6p4vS8/Q3BKv/R++aXbyL7sLe+f4IfvdofObAWjDCBMD
	hnRwDG5V+Z5YMtRFRxkQschROf4PYNCUwMPuZA0FOerql8/e+rvcsagsOM5YqGLvels5xSiFMW/Wj
	EHkbKSjUyRtAfxwjeDRSPSh6GA/6dBHR1HVwOQrsqS41eIcICtEx+KJeGKPhpUItopLO1ktecXwLk
	feMjGbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVf-00000006Vo1-0D3z;
	Wed, 17 Dec 2025 10:11:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoVd-00000006VnG-270Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:11:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FEE31516;
	Wed, 17 Dec 2025 02:11:44 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.45.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 69A643F73B;
	Wed, 17 Dec 2025 02:11:46 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
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
	Steven Price <steven.price@arm.com>
Subject: [PATCH v12 01/46] kvm: arm64: Include kvm_emulate.h in kvm/arm_psci.h
Date: Wed, 17 Dec 2025 10:10:38 +0000
Message-ID: <20251217101125.91098-2-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217101125.91098-1-steven.price@arm.com>
References: <20251217101125.91098-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021153_590654_8932FDF7 
X-CRM114-Status: UNSURE (   8.54  )
X-CRM114-Notice: Please train this message.
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

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Fix a potential build error (like below, when asm/kvm_emulate.h gets
included after the kvm/arm_psci.h) by including the missing header file
in kvm/arm_psci.h:

./include/kvm/arm_psci.h: In function ‘kvm_psci_version’:
./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
   ‘vcpu_has_feature’; did you mean ‘cpu_have_feature’? [-Werror=implicit-function-declaration]
   29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
	         |             ^~~~~~~~~~~~~~~~
			       |             cpu_have_feature

Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 include/kvm/arm_psci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
index cbaec804eb83..38dab7add79b 100644
--- a/include/kvm/arm_psci.h
+++ b/include/kvm/arm_psci.h
@@ -10,6 +10,8 @@
 #include <linux/kvm_host.h>
 #include <uapi/linux/psci.h>
 
+#include <asm/kvm_emulate.h>
+
 #define KVM_ARM_PSCI_0_1	PSCI_VERSION(0, 1)
 #define KVM_ARM_PSCI_0_2	PSCI_VERSION(0, 2)
 #define KVM_ARM_PSCI_1_0	PSCI_VERSION(1, 0)
-- 
2.43.0


