Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEC6CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 02:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QQWW2uz0mLUGeiud1YvsmeYE/VL4dGiLWXdbNwYiHVs=; b=MetjiY9krgbtghnh1Tm/6yUWNd
	Z9OpRNzVRqdfBFct2YLPktP1r1i2QL/OJgrJ4aD2dEJTFf/3p7ZJ364SdMJIKhTHLVJmH5REEi0Uu
	VCe/EdcyU6zhkpWbNaPO2YaM/QkvSTeDSshh+EE+dts/qeT0vyZHc4qwU07unE82Hj74SCpjbc1H2
	ppreL9oRKcYdxxN7LfB1y55SwJu2tZScQ6Y74/FDSrpCpjyFloDThPoiA+Q1RRYri8kVQFk/L4jq9
	9Bzg1Lno+7XpDoVvIP6EvDRyJZI0sRqJ1mCVCJg83rRvJkxu1CgqX9Doz5NBjN5MENq1aVCJ4AauJ
	xbsQ3u/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNN1-00000006lTl-2QvL;
	Mon, 25 Aug 2025 02:55:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNFB-00000006ks0-3bTK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:47:40 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c9FTP55vbz2CgGS;
	Mon, 25 Aug 2025 10:43:05 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 914C11A016C;
	Mon, 25 Aug 2025 10:47:30 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Aug 2025 10:47:30 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 Aug
 2025 10:47:29 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: <maz@kernel.org>, <oliver.upton@linux.dev>, <tangnianyao@huawei.com>,
	<wangwudi@hisilicon.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>
Subject: [PATCH v2 2/4] KVM: arm64: selftests: Add test for GICD.num_LPIs
Date: Mon, 25 Aug 2025 10:39:52 +0800
Message-ID: <20250825023954.3516381-3-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
References: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_194738_190684_96890304 
X-CRM114-Status: GOOD (  11.69  )
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

Add test case about GICD.num_LPIs. The default value should be 0, and it
can be modified before GIC init, but cannot be modified after GIC init.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 33 +++++++++++++++++++
 .../selftests/kvm/include/arm64/gic_v3.h      |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index a8e0f46bc0ab..7e60443827e9 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -968,6 +968,38 @@ static void test_v3_sysregs(void)
 	kvm_vm_free(vm);
 }
 
+static void test_v3_num_lpis(void)
+{
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	u32 num_lpis;
+	struct vm_gic vm;
+	u32 typer;
+	int ret;
+
+	vm = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	kvm_create_device(vm.vm, KVM_DEV_TYPE_ARM_VGIC_ITS);
+
+	kvm_device_attr_get(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+			    GICD_TYPER, &typer);
+	num_lpis = typer & GICD_TYPER_NUM_LPIS_MASK;
+	TEST_ASSERT(!num_lpis, "Default value of GICD.num_LPIs is not 0");
+
+	typer |= 10 << GICD_TYPER_NUM_LPIS_SHIFT;
+	ret = __kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+				    GICD_TYPER, &typer);
+	TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_DEVICE_ATTR_SET, ret));
+
+	kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+
+	ret = __kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
+				    GICD_TYPER, &typer);
+	TEST_ASSERT(ret && errno == EBUSY,
+		    "Changed GICD.num_LPIs after initializing the VGIC");
+
+	vm_gic_destroy(&vm);
+}
+
 void run_tests(uint32_t gic_dev_type)
 {
 	test_vcpus_then_vgic(gic_dev_type);
@@ -985,6 +1017,7 @@ void run_tests(uint32_t gic_dev_type)
 		test_v3_its_region();
 		test_v3_sysregs();
 		test_v3_nassgicap();
+		test_v3_num_lpis();
 	}
 }
 
diff --git a/tools/testing/selftests/kvm/include/arm64/gic_v3.h b/tools/testing/selftests/kvm/include/arm64/gic_v3.h
index a76615fa39a1..c9f25cdd3651 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic_v3.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic_v3.h
@@ -85,6 +85,8 @@
 #define GICD_TYPER_ESPI			(1U << 8)
 
 #define GICD_TYPER_ID_BITS(typer)	((((typer) >> 19) & 0x1f) + 1)
+#define GICD_TYPER_NUM_LPIS_MASK	GENMASK(15, 11)
+#define GICD_TYPER_NUM_LPIS_SHIFT	11
 #define GICD_TYPER_NUM_LPIS(typer)	((((typer) >> 11) & 0x1f) + 1)
 #define GICD_TYPER_SPIS(typer)		((((typer) & 0x1f) + 1) * 32)
 #define GICD_TYPER_ESPIS(typer)						\
-- 
2.33.0


