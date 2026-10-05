Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D6ACA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd5AiV+Egj6KEvH01cjHFLoKM9QPjWxRSjuXESD6hwA=; b=LzibzXv570voJTqIfBe/hEh+Fr
	ur5eAPns/7MzINoCN/PG9llhqmdSs5zlLpFvMzB2hWubmmGG04Ybkxb68/9bus+61cO70bVO3SgZi
	yGUHEawjaPMtchQwtkCtwHj1oOz+UKieNAZMceK1VqIPcZT941pOPHteqM6DNyVAAur+oe8A1qiVN
	ilmaOFgv/jjBTn4v1DS4PTFigZRf9Iz8Jfb9VVHwTEORfvCiNYkubToT3n+N8DEFQFm8dTUpWzybX
	04BuPtW4pJVJyKBprYlw+de7lDXi8H4c0jn9Toiixqxb9kH3owIyxli9cS/vEpexwVCj9vwmev/ip
	a4iaqxPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfO6-0000000G5Q8-13Vj;
	Mon, 05 Oct 2026 09:53:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfO1-0000000G5N1-44QG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:53:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B1216022E;
	Mon,  5 Oct 2026 09:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00421F0089A;
	Mon,  5 Oct 2026 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194013;
	bh=hd5AiV+Egj6KEvH01cjHFLoKM9QPjWxRSjuXESD6hwA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bdA5mMgcRH13PP1HS2ubFLyAP4jljXIAybpm2euDVWXMhHhw08hNi711gWRT3mwWH
	 LbO11zv2RYxa0jLp2JQlEeB9cwZpYR8d2wyjB4KWT1qnexocEV9t/pugyDUhWzJ9kH
	 cqzoP8r9QbveJTBCS2tksiU4ZQZBsXen1tgahoNcefnU5qzlyEEnuXC59ejvG6jzDP
	 TVMiBH8SYUp2SpkS3D1Fr/UmszLthicsNHmHpuo6J53XSKnqNSfbRlAV9wrXErUb46
	 kJ+HCjajnXrGLqrkffmRsRslfoGCKSWu68754+Z7C+cpw2vq00YzCpWRUp/+Jjw8wR
	 k57g4lzgljtVg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:53:13 +0100
Subject: [PATCH v3 4/4] firmware: arm_scmi: Skip unused performance-domain
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v3-4-d9bada32ed38@kernel.org>
References: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
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

The SCMI performance-domain driver uses the named "perf" device only
when its firmware node declares #power-domain-cells. Otherwise its
probe returns without registering a provider, while the same SCMI
protocol may still be needed by the separate "cpufreq" device.

Do not create the "perf" device when the provider property is absent.
This avoids an unnecessary device claiming the protocol fwnode and
leaves cpufreq creation unchanged. Update the device-creation contract
to document that an intentionally omitted named device returns NULL.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index eef47d2054cd..7613ea2893ef 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -570,6 +570,11 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 {
 	struct scmi_device *sdev;
 
+	/* The perf device is only needed when it provides power domains. */
+	if (protocol == SCMI_PROTOCOL_PERF && !strcmp(name, "perf") &&
+	    !fwnode_property_present(fwnode, "#power-domain-cells"))
+		return NULL;
+
 	sdev = __scmi_device_create(fwnode, parent, protocol, name);
 	if (!sdev)
 		pr_err("(%pfwf) Failed to create device - protocol 0x%x (%s)\n",
@@ -596,10 +601,8 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
  *
  * Return: The created device (or one of them if @name was NOT provided and
  *	   multiple devices were created) or NULL if no device was created;
- *	   note that NULL indicates an error ONLY in case a specific @name
- *	   was provided: when @name param was not provided, a number of devices
- *	   could have been potentially created for a whole protocol, unless no
- *	   device was found to have been requested for that specific protocol.
+ *	   note that NULL can also indicate that a named device is not needed
+ *	   for this fwnode, or that no device was requested when @name is NULL.
  */
 struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,

-- 
2.43.0


