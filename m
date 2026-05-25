Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01020CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7NAGk2PTjrSuxAU53GJ+dkf6zZQMPpsPWuOx8oT0f4=; b=hkyEq8SyLBLyrdBK91IM9mZQge
	o6PJvmVRtHuwXmFOiRNoPFQ44nSyUjvcM3rvhVkqRuVOvEstX+RvWoXV9jhiW0UJ599+UMECNO9k5
	hUA3uu+0vUaN6GDfyh4wUnGq+3oUo5rasRzSG7uyIec1/fIcyI2NnpSE2E9YGtRyoEX1JKReC27iF
	s2JUXnc2LoAJiLLBobwH65GRyAKRQUAA8U//r+7yKMpUEBglWp+iKHRRbwT4HoJEOQO7joYu7JEAT
	MhqPu8bhSYvVYXtaimQlAPBYy4J2dz/t1SbHMNfudbKphbsFjHqt91TKTLKxyzruHK/yTT/jKi0yA
	jsF5uKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9w-00000000RKR-0y50;
	Mon, 25 May 2026 20:44:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9r-00000000RIH-01Ft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74D59600AB;
	Mon, 25 May 2026 20:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797621F00A3D;
	Mon, 25 May 2026 20:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741858;
	bh=/7NAGk2PTjrSuxAU53GJ+dkf6zZQMPpsPWuOx8oT0f4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jAzHwS+tpKvNKbh7idJaE8L9W/vb7c6+MBMRmHu9l5WP/WF196JCheC5Yw2G1B88E
	 nY8YKt/CtIUfXoc/PbCMHmR1xz3RzuyIJm+JNwrr32QhXJy3JWR2TGrczZYeMQX5uC
	 7VpmuwEpev2GUzEv4N/uBkIfRVCyQv6wDZIzVFitqF5KKzAvDcfjjEUWLGLB9ZDMKj
	 J9Zy5Z9ppB+sX3uk8WIrZOb33N0HY64NyP+/4rzXMSGYl53RIbCK6lKwVDto9qRK1t
	 T79C9Cf5ESvz1LGDQoBpwHQbocYRoOUShagUgjk+okVFhLh5ZzZRWrUCrJq3yQSa50
	 dCW2Qj12NQjGw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:40 +0100
Subject: [PATCH v2 2/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-2-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

Add a call to device_set_node() in the SCMI probe helper to associate
generated SCMI platform device with the firmware node of its supplier
transport device.

This complements device_set_of_node_from_dev() and ensures that
firmware node information is propagated correctly for both Device Tree
and non-DT (e.g. ACPI) based systems.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index 7c9617d080a0..cc469370e989 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -497,6 +497,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 		return -ENOMEM;						       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
 									       \
 	strans.supplier = dev;						       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.43.0


