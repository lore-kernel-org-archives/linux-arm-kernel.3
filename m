Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7E1E9412E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 09:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6bjjzmoiF3Vk4RhLCBDs5f1E17Xepav3f46Orj2EhI=; b=Xa25SrEeUipQUQPEXSxvGduMX/
	vjnIyzvZgBJeVsFSuWRuALsA7Zsx8JKWiUpCI4+RpKP7L80QN+nDf53SfUbvhVvGcin3TfDPA8KDe
	A8IZQaFlbg8vb++UJWF8RB+qvtgAWFpblZcIs96SYKNJclHCvsOsoZMp2H2a7R/2s12YjCK1rCpcT
	Pm0yldxbcWgaoRPLVF54KtUmttlxxQrRmxOODvQaNEFaw2cwhXy/NTn2+srtdwVxqLly1X+sPl8MM
	PSfHKXiqDmATRDV1mGTaKNxBvBk/QSFzjr/MsRAS0ZXENw8V+wMvtlaa+lGlvuyT2W0O9+zZM7AGn
	3zMv64Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVnQ-00000004eU3-0QHm;
	Tue, 30 Dec 2025 09:13:40 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaVnN-00000004eSI-1rhZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 09:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767086015; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=z6bjjzmoiF3Vk4RhLCBDs5f1E17Xepav3f46Orj2EhI=;
	b=Mz0cOcT5GiTBTIknyGo2QdBpDk50lYezZtcUzwFznMEOuxqqNyybEj0YceDUdQyFjHi07LvGvkWYzSQT1MIMVlLd9U3PK9CSHxygNXdPYlTVIvJG23iYapzOQl6UNoOGt6rhXHgJGgT0la63CqQnJpySUwiqELEO7fpmPtqKxk0=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvzWEmD_1767086013 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 30 Dec 2025 17:13:35 +0800
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
Subject: [PATCH v5 15/17] ras: AEST: Add framework to process AEST vendor node
Date: Tue, 30 Dec 2025 17:13:32 +0800
Message-Id: <20251230091332.50209-1-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
References: <20251230090945.43969-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_011337_665688_91A01A47 
X-CRM114-Status: GOOD (  14.29  )
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

AEST table include vendor error node to support the component that do
not implement standard Arm RAS architecture[1]. Each vendor node may
have their own initialize and interrupt handle function. This patch
supply a framework to process vendor error nodes, the vendor process
function is binded with vendor HID.

[1]: https://developer.arm.com/documentation/ddi0587/latest/

Signed-off-by: Ruidong Tian <tianruidong@linux.alibaba.com>
---
 drivers/ras/aest/aest-core.c | 28 +++++++++++++++++++++++++++-
 drivers/ras/aest/aest.h      |  5 +++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 052211ca3e2a..4d20e54832fd 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -925,6 +925,29 @@ static int aest_setup_irq(struct platform_device *pdev,
 	return 0;
 }
 
+static struct aest_vendor_match vendor_match[] = {
+	{  },
+};
+
+static int
+aest_vendor_probe(struct aest_device *adev, struct aest_hnode *ahnode)
+{
+	int i;
+	struct acpi_aest_node *anode;
+
+	anode = list_first_entry(&ahnode->list, struct acpi_aest_node, list);
+	if (!anode)
+		return -ENODEV;
+
+	aest_dev_dbg(adev, "Try to probe vendor node %s\n", anode->vendor->acpi_hid);
+	for (i = 0; i < ARRAY_SIZE(vendor_match); i++) {
+		if (!strncmp(vendor_match[i].hid, anode->vendor->acpi_hid, 8))
+			return vendor_match[i].probe(adev, ahnode);
+	}
+
+	return -ENODEV;
+}
+
 static int aest_device_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -950,7 +973,10 @@ static int aest_device_probe(struct platform_device *pdev)
 	}
 	init_llist_head(&adev->event_list);
 
-	ret = aest_init_nodes(adev, ahnode);
+	if (ahnode->type == ACPI_AEST_VENDOR_ERROR_NODE)
+		ret = aest_vendor_probe(adev, ahnode);
+	else
+		ret = aest_init_nodes(adev, ahnode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 2f6a7b9ca4ef..304c03839d31 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -244,6 +244,11 @@ static const char *const aest_node_name[] = {
 	[ACPI_AEST_PROXY_ERROR_NODE] = "proxy",
 };
 
+struct aest_vendor_match {
+	char hid[ACPI_ID_LEN];
+	int (*probe)(struct aest_device *adev, struct aest_hnode *anode);
+};
+
 static inline int aest_set_name(struct aest_device *adev,
 				struct aest_hnode *ahnode)
 {
-- 
2.47.3


