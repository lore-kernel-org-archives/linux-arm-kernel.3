Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C781FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFFZQX82Bmm9r98yVs8p4sid8uUuSTJLq1HybImupxc=; b=jJSsZs27+Dmu4g9o2hrilZXlOB
	UjD3XRnzHjJryv1rRaQ3cV6QF7BHyAQXuj5hkihGaHJ1H6FigDONp6NT1tzc7lP5liZFANq3jcQ+/
	5eiumJkMvdC3aE25wex9Evl+/p/vXHYYTPX5WNL4gpRDzqHqlpZ2LG/ljjsGpHfzrh2ge5SvEqpy9
	ujVEu72cG5Ts0ypVZQHG2KKelZijd5wmC2Dk2KYt3GkOY0nppwFDLjkB2D9xKCnW7A1Ggr9OTm+T0
	32qIjmPOQdGGakdYIY+btO/++afPsHP6fDY6IGLYIHJA3dt2xR8pLb5Lg9VFsZuthWv+texZUQdnI
	jADASBRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIx-00000006lyL-00bL;
	Thu, 22 Jan 2026 09:48:43 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virIu-00000006ltd-0wOz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 09:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769075316; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=hFFZQX82Bmm9r98yVs8p4sid8uUuSTJLq1HybImupxc=;
	b=cT2QkuJOv1QYZzOxV30quQqkni6dkLqwNg84idWisJaRUmPlHFNhubtfthvV+WCgol2Jwub1lxubZdu8DbVV6HIBxUbNId9AKqJbpb1JZOUnH1pivS99+zfqApjjjcmcLOPpnvLwEO9tolgeNCTJoAb0ObWzVNRPonzgCrQ26+w=
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0Wxbx2rp_1769075312 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Jan 2026 17:48:36 +0800
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
Subject: [PATCH v6 14/16] ras: AEST: Add framework to process AEST vendor node
Date: Thu, 22 Jan 2026 17:46:54 +0800
Message-Id: <20260122094656.73399-15-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
References: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_014840_472265_A8821624 
X-CRM114-Status: GOOD (  15.00  )
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
index a290b482bf8b..047c9a8cffe4 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -922,6 +922,29 @@ static int aest_setup_irq(struct platform_device *pdev,
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
@@ -947,7 +970,10 @@ static int aest_device_probe(struct platform_device *pdev)
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
2.51.2.612.gdc70283dfc


