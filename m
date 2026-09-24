Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9137C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYuRJAA8oly9E7Iin/7O8VsngbLwV6qRDQhUiQrbGds=; b=AYPX4uD9a+Ffj7YOwgZ9W5z7jH
	jOC7t92nWAJp1Ba3FaXHlXScncfSi78BnMOtL0NAbhT0FC2t2ScHqSdPpoVBHbfDTpvpYsH9Keqoe
	YikK53ULnIdiKgh8+j+DPkYr5mTU4wRg5PmZdDNc5IQ6Q0Q8ELYV6nvIbf8mKQ5JpL6N9nWDp2AIr
	yO8qwFuZpTewCa1PZKkWzRob7ydukiEBcmwwoszAJ1Rn2dHlVFjkqEWOiVRFfXbVyV1SiBCVEvMAc
	TmMWiNUGTQ9JP32rnU2lMoaJf0iSXIoEl1RKz25Uje2ridLmswqnZQ9r6EjdNytY0+RR6D+lbvyEy
	RpS/0B4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lx6-0000000BWaW-343s;
	Thu, 24 Sep 2026 16:05:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lx2-0000000BWYT-30Eo
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 16:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eYuRJAA8oly9E7Iin/7O8VsngbLwV6qRDQhUiQrbGds=; b=GooglYvUFxdOQ9FnLd4pavjlOl
	GfeqNILsjl1BbMnlDrEMXFnGUdtn4EFFLOpZEm7v7txROMIsRAa5giGG16uyqQ7ucmYqFyvR3XOdv
	JkemAI93Sh9R54BN4EIbZDUxI2YhSPfwOIMt6T3ErKPa6u+8PBe9n/WvUnzqAKT4pd2kEELhxm0Ju
	E3Chw4KBjeWRW/5g4aqXre/vUZwclfDEwuNa7esFn+ubqB4WD44SnqGB80U8tpz3o0UuJKes0rkrn
	yCg2r7Bo5RHOtBJI/Y4T4uuuo5q2zgsKYdc/jGO8YOpFigPZOUADgw57nEfOBWsVbySa4S6fWNbMo
	DxKPVDMw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9lwz-0000000GAm9-2OEK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:05:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4C3D152B;
	Thu, 24 Sep 2026 09:05:27 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BE5393F86C;
	Thu, 24 Sep 2026 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790265931; bh=e4q/PWyF7pIt1CQ8fjppct+/tCsvdAGsy+TtiAPcvi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lt5pqYvVdtJL2rfpa/saSCOFRu/i/inIISap9zx1Ca/uq0WlmTBtAlx8/yTBkMZRY
	 xseI4NYfObsbMspeYG/gAJOwIZmn/yn4up99m604CS0vg2ufDdKOm2W69qgt11fMPA
	 VACjJtyUk97jIpTki3hBr0Rty0ICu83QtURnRy9Q=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>
Subject: [PATCH v20 03/22] KVM: arm64: Include kvm_emulate.h in kvm/arm_psci.h
Date: Thu, 24 Sep 2026 17:04:45 +0100
Message-ID: <20260924160504.853911-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924160504.853911-1-suzuki.poulose@arm.com>
References: <20260924160504.853911-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_170533_850128_3295B7CC 
X-CRM114-Status: UNSURE (   9.23  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 include/kvm/arm_psci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/kvm/arm_psci.h b/include/kvm/arm_psci.h
index f86a006d67136..06c20612e9e7d 100644
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


