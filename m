Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA59CCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2go7P0WmG/RPCYKvg47qI3EWymjqyqQ0wd9YV6XU2E=; b=bBJyb7laVOLvmajN8DfGC2msJV
	a74ulmqcqJn3cMi2m0rrT+aM5DHRJ3OLiAdSDZYjbXLMM9mBXeeXErlBEYJjS2ivxP/iyQGSNyBB7
	6fMZQtpIxDwioJ3FtsaVzD9yuHHppsriq2WH1uzHdC5WGASGNt5FnL5AiJeqi0sWB3yQadWIreHpw
	T1tUR7JbCMBMQDTn8e9DSgnMCDz9ZgYbD/qsvjHLJxcdIhZZIGiAk4e+6Kxm6/KbBSa2QBzq7MYNN
	D9v2d36GQ+pNKGCZZCo9dT4AhNCMXad+9Bpf5vd23Av4PHbAqrDYeUeYGwOymmanK2v1AY1k54gTV
	XAEc+4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRh-00000007uhJ-323z;
	Fri, 17 Oct 2025 13:24:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRW-00000007uXQ-11KV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 13:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=W2go7P0WmG/RPCYKvg47qI3EWymjqyqQ0wd9YV6XU2E=; b=f+pV7sjsc78ij1WfwBKYxb5XMV
	wnwxBi5AD67o9iTI9ihrTCZb/xVIOxA1RoZr8F0Zwfmg4O571qDsLot3bNYFlmA9zX6FlS4yiOQbC
	Zmdz98DCL3eOWGD7py5QpiPCyVx3wrjk78lhELJptCfmqPhV8tpY/uvIo7jLIfbeLsor1ehj2bmy+
	ZkS6QJe7gn/4gx9eNx11mihsRFZUUHpyYItjrVbcKfLQJu7gvad3d9lieX0SagbaJZAVjdmxcD35u
	U+kiuIyXUtW+HMIyES6MOjA3uhJpe428s9oW2AOaiCbLSodMxWOTo/Rf/6RBSazoiQUT9d92cMALx
	Ih+S2Vog==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kRR-00000007c2C-3tTh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:24:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 698EA1C2B;
	Fri, 17 Oct 2025 06:24:10 -0700 (PDT)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96C963F66E;
	Fri, 17 Oct 2025 06:24:17 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 17 Oct 2025 14:23:51 +0100
Subject: [PATCH 8/8] firmware: arm_scmi: Initialise all protocol devices
 and transport channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-acpi_scmi_pcc-v1-8-0adbab7709d9@arm.com>
References: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
In-Reply-To: <20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_142422_276304_3CDDFDA6 
X-CRM114-Status: GOOD (  11.00  )
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

Unlike Device Tree, the ACPI SCMI namespace device does not provide child
fwnodes to represent each protocol. To initialise all protocol devices and
their associated transport channels, we must iterate over the supported DSD
entries defined in the device.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index f679a769fc87..9470be5de692 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2786,7 +2786,7 @@ scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
  */
 static int scmi_channels_setup(struct scmi_info *info)
 {
-	int ret;
+	int ret, idx;
 	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
@@ -2809,6 +2809,17 @@ static int scmi_channels_setup(struct scmi_info *info)
 			return ret;
 	}
 
+	if (acpi_disabled)
+		return 0;
+
+	for (idx = 1; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		ret = scmi_txrx_setup(info, fwnode, prot_id);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -3175,7 +3186,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3304,6 +3315,15 @@ static int scmi_probe(struct platform_device *pdev)
 		scmi_device_check_create(child, prot_id, info);
 	}
 
+	if (acpi_disabled)
+		return 0;
+
+	for (idx = 1; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		scmi_device_check_create(dev_fwnode(dev), prot_id, info);
+	}
+
 	return 0;
 
 notification_exit:

-- 
2.34.1


