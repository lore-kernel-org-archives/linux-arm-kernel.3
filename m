Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A7C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bksi0ClpeLu/YdtJuf0xLijhkWkH1CO8Ud4A2ADlXQ=; b=Ib+yBOBp046Hx0DsgRRsC/eB4E
	K22PDx7CStRNt+m4C6g95joYqETC438CxG4mh/fzzsHyhDapejWhGJDCnBYF6VOvucDo+IgXSw8Pj
	jhIBXbfd4nm+xCn3yf6GT3tJJeQmbszQ4836MqTN/K5QC8k8l+vNT5T3jpykYbm2T+ZHyaqpoulxx
	at0cH7RK8fkUQ3qQ0wbz3JEYVXqadUyrg+6lLzl9omXCzzftm28YiL/33qpxXuolezhrdiXvgYy6K
	9Gr9MPh2/9UlFziK4PEabZj5nFpDvsKSYibknexm2jxcgXLr90RXHZCbJ04v2OW4KjmLH6q+I9yz2
	4CZiwv+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyNCF-0000000EfAl-3XWk;
	Sat, 29 Mar 2025 03:49:23 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyN79-0000000Eeuu-0Esx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 03:44:08 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4ZPjst2Phbz1d0y5;
	Sat, 29 Mar 2025 11:43:30 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 773A41800B4;
	Sat, 29 Mar 2025 11:43:56 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sat, 29 Mar 2025 11:43:55 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<linuxarm@huawei.com>
Subject: [PATCH 3/3] KVM: arm64: Fix boot warning with kvm-arm.mode=nvhe on !FEAT_E2H0 platforms
Date: Sat, 29 Mar 2025 11:44:09 +0800
Message-ID: <20250329034409.21354-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250329034409.21354-1-yangyicong@huawei.com>
References: <20250329034409.21354-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_204407_254245_66502682 
X-CRM114-Status: GOOD (  14.33  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

If platforms don't support FEAT_E2H0, HCR_EL2.E2H is RES1 and nVHE is
not available. The warning in early_kvm_mode_cfg() will be triggered
if boot with kvm-arm.mode=nvhe and no indication for this. Fix this by
skipping the non-VHE checking on !FEAT_E2H0 platform.

Since this should only affect the "nvhe" mode, move "nested" mode check
ahead to avoid being affected.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/kvm/arm.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 68fec8c95fee..a0c0bd936a53 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2905,6 +2905,11 @@ static int __init early_kvm_mode_cfg(char *arg)
 		return 0;
 	}
 
+	if (strcmp(arg, "nested") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
+		kvm_mode = KVM_MODE_NV;
+		return 0;
+	}
+
 	if (strcmp(arg, "protected") == 0) {
 		if (!is_kernel_in_hyp_mode())
 			kvm_mode = KVM_MODE_PROTECTED;
@@ -2914,13 +2919,16 @@ static int __init early_kvm_mode_cfg(char *arg)
 		return 0;
 	}
 
-	if (strcmp(arg, "nvhe") == 0 && !WARN_ON(is_kernel_in_hyp_mode())) {
+	/* If system doesn't support FEAT_E2H0, nVHE host is not available */
+	if (cpu_has_e2h_res1()) {
+		WARN_ON(!is_kernel_in_hyp_mode());
 		kvm_mode = KVM_MODE_DEFAULT;
+		pr_warn_once("FEAT_E2H0 not supported. Ignoring kvm-arm.mode\n");
 		return 0;
 	}
 
-	if (strcmp(arg, "nested") == 0 && !WARN_ON(!is_kernel_in_hyp_mode())) {
-		kvm_mode = KVM_MODE_NV;
+	if (strcmp(arg, "nvhe") == 0 && !WARN_ON(is_kernel_in_hyp_mode())) {
+		kvm_mode = KVM_MODE_DEFAULT;
 		return 0;
 	}
 
-- 
2.24.0


