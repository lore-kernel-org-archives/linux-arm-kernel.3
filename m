Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEC8E94108
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74GzSC8zfks/a1MM2nAWYChW5ObdAzQ3nbdjBXxWlb4=; b=4vrQNvqyvIOD7islJY9LzP5gp5
	oooumMJc0KDjy3TOlajFvBMU7weNLjlKacK2PXBtlLXRgRviP5V3s0g/4hO8A05Rkc6ZHsWd1WLsz
	FAnDR3PSVRQ7HoFjHdaAqMUQQbk/pfX4jymxw7wd30+f8UtiVgvOqNei5YxET3drp1cHiV9HRLKtU
	hN29mrgEunpnb5usFHoP2tpC5mRON8AKy1ttIkKg8LUjvs5aVi/TX2MPdvKMyA+Jh07Gpc+PNkU9e
	xKNyn8VBPyKdbfNbhNnPO96hZJpPvZ1+//GU0gY7pUc7WZXj3W7xGRDgWbYuvQ5lVsFUafQ1XPTEg
	L7aMBvYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVkG-00000004dMr-0YRl;
	Tue, 30 Dec 2025 09:10:24 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVk1-00000004dAD-2VyU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767085807; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=74GzSC8zfks/a1MM2nAWYChW5ObdAzQ3nbdjBXxWlb4=;
	b=Dt7QvQjIR3Tauz2YI/HtfmtXgjGEv6gvZuPb2xNGQltCYstv99hO3FQS4EnA6oMYSk42UAGXTciSsIpYqrnJPDq8+meUsiEERmE4dNpVOkAmrgQ/2jYfIi5tq/HRCfk5k8vVO6j+gRVsJoT1TeJR48vChPUumBfvp3gS1FzN3vY=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvzUnDv_1767085804 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 30 Dec 2025 17:10:06 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	xueshuai@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rafael@kernel.org,
	lenb@kernel.org,
	tony.luck@intel.com,
	bp@alien8.de,
	yazen.ghannam@amd.com,
	misono.tomohiro@fujitsu.com,
	fengwei_yin@linux.alibaba.com
Cc: tianruidong@linux.alibaba.com
Subject: [PATCH v5 06/17] ras: AEST: Support RAS Common Fault Injection Model Extension
Date: Tue, 30 Dec 2025 17:09:34 +0800
Message-Id: <20251230090945.43969-7-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011009_788501_0F4E9B9A 
X-CRM114-Status: GOOD (  10.56  )
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

Add inject register descripted in Common Fault Injection Model
Extension.

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/aest/aest-core.c | 15 ++++++++++++++-
 drivers/ras/aest/aest.h      | 10 ++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 84b2fb8127ff..1218ae51079c 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -124,7 +124,7 @@ static int aest_init_node(struct aest_device *adev, struct aest_node *node,
 			  struct acpi_aest_node *anode)
 {
 	int i, ret;
-	u64 address;
+	u64 address, flags;
 
 	node->adev = adev;
 	node->info = anode;
@@ -145,6 +145,19 @@ static int aest_init_node(struct aest_device *adev, struct aest_node *node,
 			return -ENOMEM;
 	}
 
+	flags = anode->interface_hdr->flags;
+	address = node->info->common->fault_inject_register_base;
+	if ((flags & AEST_XFACE_FLAG_FAULT_INJECT) && address) {
+		if (address - anode->interface_hdr->address < node->group->size)
+			node->inj = node->base +
+				    (address - anode->interface_hdr->address);
+		else {
+			node->inj = devm_ioremap(adev->dev, address, PAGE_SIZE);
+			if (!node->inj)
+				return -ENOMEM;
+		}
+	}
+
 	ret = aest_node_set_errgsr(adev, node);
 	if (ret)
 		return ret;
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index bf0b9a49fdaa..505ecd9635bc 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -60,6 +60,9 @@
 #define ERXMISC1 0x28
 #define ERXMISC2 0x30
 #define ERXMISC3 0x38
+#define ERXPFGF 0x800
+#define ERXPFGCTL 0x808
+#define ERXPFGCDN 0x810
 
 #define GIC_ERRDEVARCH 0xFFBC
 
@@ -120,6 +123,7 @@ struct aest_node {
 	u8 type;
 	void *errgsr;
 	void *base;
+	void *inj;
 
 	/*
 	 * This bitmap indicates which of the error records within this error
@@ -208,6 +212,9 @@ static inline u64 aest_sysreg_read(void *__unused, u32 offset)
 		CASE_READ(res, ERXMISC1)
 		CASE_READ(res, ERXMISC2)
 		CASE_READ(res, ERXMISC3)
+		CASE_READ(res, ERXPFGF)
+		CASE_READ(res, ERXPFGCTL)
+		CASE_READ(res, ERXPFGCDN)
 	default :
 		res = 0;
 	}
@@ -225,6 +232,9 @@ static inline void aest_sysreg_write(void *base, u32 offset, u64 val)
 		CASE_WRITE(val, ERXMISC1)
 		CASE_WRITE(val, ERXMISC2)
 		CASE_WRITE(val, ERXMISC3)
+		CASE_WRITE(val, ERXPFGF)
+		CASE_WRITE(val, ERXPFGCTL)
+		CASE_WRITE(val, ERXPFGCDN)
 	default :
 		return;
 	}
-- 
2.47.3


