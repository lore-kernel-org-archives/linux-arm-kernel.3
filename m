Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5A9C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayc7Y/LDhOrGp7HTEz0hRFUoiQKWERKnD5ZN9LctHBg=; b=wTc6WMLgsN4xSXunnz0Om3059A
	jam7wZsFnx4VfcdAA56l5ABYju1GtrEBcZkOKI5cVRdYO2ZqiI1w2nt+RxclhEQgi/dHWetJjO4jd
	uxEkDHJHCB4kJ+cdpJtRkXlEXQ/yRvt6zByDQ59z6/RTj523ctPpArHrFnTvUehsKR52gCJ5k0rM1
	H2Ia97EjRxUIWk+JbKTycl9I6AtzPUXTF8voQF8qxcO83dM+b/fe/CHq7kDsMl8KDwG3zjWTgH2+m
	OTsSax1D7jyGVYSd3Mj9oa6fuK2fuoFf1Yl5UST8A5yQ2r3vbdMGDJoWSsnIaRD2uIBJCXgAn+Syk
	jbp9EsxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnk-0000000AELW-1yv1;
	Wed, 11 Jun 2025 14:51:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ15-00000009f8Z-3oUt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ayc7Y/LDhOrGp7HTEz0hRFUoiQKWERKnD5ZN9LctHBg=; b=cWh9xELCJ0RyysSIpKAYB3hKVD
	4woHW9wwiMmZ+Q8SLIaFBl5+ypkLM9ChnMG8fxDheXWkiOvnMZVdwdLE6Kp8slwmfuMjbjQZmDOLq
	CJ88lwxJS5NTSW5RLegW95Ed1tvO5AiFcAaiJXrjrGEYoz3Qmv37QwO76hcirJEXjijfK7yysBmM8
	h5QgBSQXB+nfhgFrpmRnWVPCTdmJNT4IM9TMZiXnaD1amWqETns8WRIhkTMorDyNACRlYhAQZ5xSj
	9ciUFNJOkiq8UGIBfPYNBFFpEBPtKN+2Gc2gwHYdXwiGK8xPorxeYLUl4yfx7YHosSRSwCPIoIa3t
	ufo8PNOg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJ13-00000002I7O-3u7o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:49:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 114001655;
	Wed, 11 Jun 2025 03:48:47 -0700 (PDT)
Received: from e122027.arm.com (unknown [10.57.67.107])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2A033F673;
	Wed, 11 Jun 2025 03:49:02 -0700 (PDT)
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
	Steven Price <steven.price@arm.com>
Subject: [PATCH v9 01/43] kvm: arm64: Include kvm_emulate.h in kvm/arm_psci.h
Date: Wed, 11 Jun 2025 11:47:58 +0100
Message-ID: <20250611104844.245235-2-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611104844.245235-1-steven.price@arm.com>
References: <20250611104844.245235-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_114910_229365_53B2E752 
X-CRM114-Status: UNSURE (   9.36  )
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


