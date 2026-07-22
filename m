Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C20CC4453C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 17:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxEYmlqGGiYq3Bc30IofrgYGCXgAw0TDgEYkHxOaSog=; b=SodNMtKwi8B5qlHXMQQuSqdXx9
	seCUsOdoQhhtvMWbJ8kl25le6AQJQpE6CPKlfUFQCqOS4C2gfzDhkELFDuKvBIwwEvO2A2k/qHPSU
	wL8So21LL4K8g6yrRKve++M6TiOiIeFdt7Av6HgttTz8mAY696vgm+Rd9hcIlyd9acDesaAb5fRkx
	Z28icOUhomsTZ/LsI3/3MCF0uzroHT5vmWQNXwcxYVvw1vMskAES0H+lvf1rYGsc/4l1MDVGjLGO1
	KdhHFXu527BscRZG7BgfEet78rZsmQgMZmoSU3CJmI8h5ejoXaYKJrQNa0aCgan7SAnyZxonD8vpZ
	vz0/FVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaqu-0000000CTed-0pWx;
	Wed, 22 Jul 2026 17:35:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaqs-0000000CTeD-2a5W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 17:35:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E3DBD600C3;
	Wed, 22 Jul 2026 17:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB451F00A3D;
	Wed, 22 Jul 2026 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784741725;
	bh=TxEYmlqGGiYq3Bc30IofrgYGCXgAw0TDgEYkHxOaSog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZafguT7DuXfAqRN1DjjINYsRkMFXjM1pCVCPbbT0ELGaqm/m3P1wFO0HchscpckLp
	 hDsDPquf95CEYh+vNNOpZNIBzL/NeZWIxrYZ3c+AJEf7y9VjqUS8Lq4j1K5jENpnDt
	 MPnhpRxS3vO2+OlKkgYwlC0hwgn4bhoGPSMKsskdE1PLG/5ZzCWyxwtou3Nh1t2U6e
	 vKZ37g1Dp7j58q2qPOeYdPHCFcy7cqnwdIRCkVchIxICaeItb15v3LfFcbw4YVIS4v
	 aa/Hu0sqW3TtuWZdbvpB9kRnirvD7koFceetkE85lxB/i9t7sOddbM03pzqIPiIbX5
	 uHB+ImqKmK2QQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] firmware: arm_scmi: Unrequest devices if driver registration fails
Date: Wed, 22 Jul 2026 18:35:21 +0100
Message-ID: <20260722173521.2184378-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722173521.2184378-1-sudeep.holla@kernel.org>
References: <20260722173521.2184378-1-sudeep.holla@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

scmi_driver_register() requests protocol devices before registering the
driver. If driver_register() fails, those requests remain in the global
IDR and retain pointers to the module's ID table. Once the failed module
load releases that storage, later request matching or SCMI device creation
can dereference the stale pointers.

Unrequest the complete protocol table before returning the registration
failure. At this point table registration succeeded, so every entry is
owned by the current registration attempt.

Fixes: d3cd7c525fd2 ("firmware: arm_scmi: Refactor protocol device creation")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index af3d28717cd2..a86fa18fc5d2 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -395,10 +395,14 @@ int scmi_driver_register(struct scmi_driver *driver, struct module *owner,
 	driver->driver.mod_name = mod_name;
 
 	retval = driver_register(&driver->driver);
-	if (!retval)
-		pr_debug("Registered new scmi driver %s\n", driver->name);
+	if (retval) {
+		scmi_protocol_table_unregister(driver->id_table);
+		return retval;
+	}
 
-	return retval;
+	pr_debug("Registered new scmi driver %s\n", driver->name);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(scmi_driver_register);
 
-- 
2.43.0


