Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF1CC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2pQ+C4SUP4Ig2ZogJ3bhHxA66J4i8YOEkIhS0I/+MI=; b=T0fMqgt/V2k2+4p6NOAunoWjl5
	g246JclQW41cZGFLzUKsyS9IWAAw6yUs0VhL6xnln+i81eiVsqPrc7xhfgZmaGE9/MvttfOnEhsoy
	fWML4PE3qLNStlCsUPR6PoH90htp6BU7tZnOYS75VmhPBXy6kmnQrmFInbZl6iQn+kWeabwvD5cZ2
	yGWYnUHhVsUE+5cQRQv/ZQ0S9b635d+qws1UrqBLBX+FPZIMDQNXZpnO/jGxjHL9FNGE2PQxEooYy
	LGl/MW01XH0Ww/Xu3ZH3Z1SS0dGYqJ2V89auYN1fmSRSeNNmOYYA8Z1pDfi+6rKahT1QxdPPl5U7e
	PIuJRisQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIE-00000006lO3-2CQX;
	Thu, 22 Jan 2026 09:47:58 +0000
Received: from out199-8.us.a.mail.aliyun.com ([47.90.199.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIB-00000006lKC-27Tq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:47:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075270; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=a2pQ+C4SUP4Ig2ZogJ3bhHxA66J4i8YOEkIhS0I/+MI=;
	b=vsxdMiNkkcmF4L+WED2QQEWcAiaRgyP+yH5Zg++FPmSdR7NaxVEt4fIp+f8jTJJ1cXcsRrzftyuZ4JROViqrb4VatV99O/Yzaw29S4IksBWewOM0bMXeaqENpxs61KpG91vIXiD7R3SQ18RxEdQb+aiXJatnjUHtS0KjhLA99TA=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WxbtZj3_1769075266 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:47:50 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lpieralisi@kernel.org,
	guohanjun@huawei.com,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	tony.luck@intel.com,
	bp@alien8.de,
	tglx@linutronix.de,
	peterz@infradead.org
Cc: lenb@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-edac@vger.kernel.org,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	oliver.yang@linux.alibaba.com,
	Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: [PATCH v6 06/16] ras: AEST: Support RAS Common Fault Injection Model Extension
Date: Thu, 22 Jan 2026 17:46:46 +0800
Message-Id: <20260122094656.73399-7-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_014755_818401_FB9D2D1C 
X-CRM114-Status: GOOD (  11.36  )
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
2.51.2.612.gdc70283dfc


