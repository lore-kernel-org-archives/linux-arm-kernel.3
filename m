Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67538C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 14:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOORdYjCVffL6BqXTG3jjm5QCdbD3d6xHdBFxE8U06U=; b=09OSPHnXQUQe/YTnhGhYjwZ4Yq
	I6ANZGzOAA8WPZE+9Q0pP2puBZv0YERsc6HpuuM2X1QkcvHaF5wNEF7zKZvB2fByRS89aUngMaCmE
	KkyAv2Q/WTjyI1gC6kPZlYx0duEj0MPA0hOJdgTFSPYPqQeT3cLGmBc9J5F4h6g8bbP3ExoHHRgrK
	ry6E8NUntGAu0AwEvcdCaEgj/HNTNvjRZrsxLQaMZ2bN/cSbaK1p+jiAyjy9VkPovELH5JV1slvdH
	imZ8S9MblnKLq1yyX5isFtmqjNfHjSIRW6R2oJTa6QWrKiDX9WCHRcZOw/DNxlymqIlhQot2bBHpZ
	XzQkwrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrui-0000000AlWS-1Dd4;
	Fri, 31 Jan 2025 14:22:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdrqs-0000000Al1Y-2066
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 14:18:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D5A8150C;
	Fri, 31 Jan 2025 06:18:59 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 89A773F63F;
	Fri, 31 Jan 2025 06:18:32 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	Peng Fan <peng.fan@nxp.com>,
	Guomin Chen <guomin_chen@sina.com>
Subject: [PATCH 3/3] firmware: arm_scmi: Emit modalias for SCMI devices
Date: Fri, 31 Jan 2025 14:18:22 +0000
Message-Id: <20250131141822.514342-3-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131141822.514342-1-sudeep.holla@arm.com>
References: <20250131141822.514342-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_061834_557229_FDB1E5F1 
X-CRM114-Status: UNSURE (   8.29  )
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

In order to enable libkmod lookups for SCMI device objects to their
corresponding module, add 'modalias' to the base attribute of SCMI
devices.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/bus.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 862dd34eca62..7af01664ce7e 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -287,6 +287,17 @@ static int scmi_device_uevent(const struct device *dev, struct kobj_uevent_env *
 			      scmi_dev->name);
 }
 
+static ssize_t modalias_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct scmi_device *scmi_dev = to_scmi_dev(dev);
+
+	return sysfs_emit(buf, SCMI_UEVENT_MODALIAS_FMT,
+			  dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
+			  scmi_dev->name);
+}
+static DEVICE_ATTR_RO(modalias);
+
 static ssize_t protocol_id_show(struct device *dev,
 				 struct device_attribute *attr, char *buf)
 {
@@ -308,6 +319,7 @@ static DEVICE_ATTR_RO(name);
 static struct attribute *scmi_device_attributes_attrs[] = {
 	&dev_attr_protocol_id.attr,
 	&dev_attr_name.attr,
+	&dev_attr_modalias.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(scmi_device_attributes);
-- 
2.34.1


