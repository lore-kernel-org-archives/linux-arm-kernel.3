Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C3CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaY23AYSISfLKG4YfX/pHWpMC3uqQphADZpu2gp0h6U=; b=u93sf0Cgyfx3AVYxSbrkLhdQN7
	hnEGH8lBVadZI8GyK3cO778jAAY5I1BWraRkSzAF8Aq3FcoHQMMZ3EItuF65AM1NoObgI3SEvCNCy
	SXc0F7W5n3aTb4hICOOe2VjGQYY0WeplkOKR8jQeCmrSsbJhCkQU+6jDzcLuR2j6vpgj6Ah6PzT6f
	YBkp92yzc3SdWRQGuc9OvUt6uU/lPcxv/q0jISvE4dRPqCAcceUKeEoZq9gV1f9vQe0OiWYDjfqYm
	KFXVPLyfm/L55HO9/231PlHjrVEcx2i9LsrHw2vhS0vkB7pMERE9Vhw+hPRNrwc/h1L/+NuTzzfDV
	I/gfdzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfO1-0000000G5NK-4B8q;
	Mon, 05 Oct 2026 09:53:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDfO0-0000000G5MK-1YFb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:53:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CBF7160A64;
	Mon,  5 Oct 2026 09:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C951F00899;
	Mon,  5 Oct 2026 09:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791194011;
	bh=eaY23AYSISfLKG4YfX/pHWpMC3uqQphADZpu2gp0h6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SPh8BsO5/zb4S2N+HnWOPEaMKq1TnMSY1rR+2apYwuZaSkcQyvdnwdfVkyZLyOKT9
	 xQhm7ivtcDkD8h2X3xbH86vJtCJJ0KI2m/utje2yOAdx7roLaW6G9RTeran1fVHjzn
	 1Fc3GCRH4CiixhF3ExrufvY2kg/jmcI0yp7324dlLMoLUUC2f+K02/1mzc8KXjWdhz
	 /nvDGID23z3Jom9gMI0rDkQSE56Tq/mvUZKWH0sIkNJDM0bpb4a0nxWQ04oD42wKF0
	 lMAQpwfeSJgaUYlJjn0rfdae7JF04QxcEFvYYk3PVGNQGYt1nRfCiUdgB/3gcDq31u
	 CiWXRoLgtJ89g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:53:12 +0100
Subject: [PATCH v3 3/4] pinctrl: imx: Match the standard SCMI pinctrl
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v3-3-d9bada32ed38@kernel.org>
References: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v3-0-d9bada32ed38@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>
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

Use the standard "pinctrl" SCMI device name instead of the i.MX-specific
"pinctrl-imx" name. Standard devices no longer have exclusive request
tracking, so the i.MX and generic pinctrl drivers can register for the
same protocol/name pair. Their probe checks select the appropriate
driver for the platform.

This solves the issue that occurs when both "pinmux" and "pinmux-imx"
devices that share the same fwnode as only the first device registered
is assigned as the owner of the fwnode. If this owner device fails to
probe (e.g., its driver is blocklisted or missing), it never reaches
the driver_bound() stage and the system skips cleaning up its supplier
links. Even if a alternative device binds successfully, the system
still looks to the broken original owner. As a result, all dependent
hardware components (I2C, SPI, UART, USB, MMC, PCIe) defer probing
forever, halting the boot process.

Note that the solution doesn't support same fwnode being shared by
multiple devices and associated fw_devlink feature.

Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: NXP S32 Linux Team <s32@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>
Reported-by: Peng Fan <peng.fan@nxp.com>
Closes: https://lore.kernel.org/all/20260928-driver-core-v1-1-0846bb8e0f32@nxp.com
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c              | 1 -
 drivers/pinctrl/freescale/pinctrl-imx-scmi.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index ed5bed545030..eef47d2054cd 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -199,7 +199,6 @@ static const struct scmi_device_id scmi_std_id_table[] = {
 	{ SCMI_PROTOCOL_VOLTAGE, "regulator" },
 	{ SCMI_PROTOCOL_POWERCAP, "powercap" },
 	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
 	{ },
 };
 
diff --git a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
index 613552e35070..b259a526ccc1 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx-scmi.c
@@ -354,7 +354,7 @@ static int scmi_pinctrl_imx_probe(struct scmi_device *sdev)
 }
 
 static const struct scmi_device_id scmi_id_table[] = {
-	{ SCMI_PROTOCOL_PINCTRL, "pinctrl-imx" },
+	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
 	{ }
 };
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);

-- 
2.43.0


