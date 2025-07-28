Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807B6C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK5T6uLGwmqn3hf1RmQGBueNfkd9EIhFCH8Lf+T1dH4=; b=L113UY9l9PAW/XbK7I30rF0oX3
	kfjM46ru+XhgBxrx+j2tArkgWfMCm5hLnPMACdnZ1VMwcV0F2qkboYT7ttupM8kzQvnuCTn+yFKBP
	Q3ZaKs5weeeeBWBUnKlTEo3EGIcKSsVJVGAepYUIcgR1yhXjxr1jBNTHU574zr1UeXGSg6ZYYXWAB
	HOZfKbvpaWuQMW9/rjew0UXL1A/iyCMSC08LJ2wMcTojvRgTdg2R2PQjk8wYqiVSuGTenURoLNiRL
	sgN9nQa4lmyCPsGu++OOBN/OPfhU9jcz0BzVrjD3q+3AoSjbdKVk+SCP7TeOpZRRQ7Jiz6hhD4Ezt
	/4xRkePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugO7m-0000000EY8n-3uAr;
	Mon, 28 Jul 2025 13:42:43 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugN5p-0000000ERPv-0lSx;
	Mon, 28 Jul 2025 12:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OK5T6uLGwmqn3hf1RmQGBueNfkd9EIhFCH8Lf+T1dH4=; b=kWLH9hHV9FwGnzuLVaUm5i56+P
	EhJuA5KZLglaBdxkl1ID8nlApi5OYmtg9BZge0EDaWB1zPxfmE8WI1Ad0aJQVHErdnXPpFatCXhBj
	hd7q18TiWktk1zeaB5fSJjCq5FkRTeI/qaWQtupQivld3BAovUg8M6nm+noyhyNkcFLt8mjLp2Qwc
	pbauB3uwRLXwVJiJnAhdwuPKuQ5glF7Tfd+SXqw5X3E6drlo48NOMJ4lDhfAHlX80hscae1whydxJ
	pEAWnRx8KRY4teQkLB/z5R7eON4allTr/Bxta4oP+cwEeVCF0pzJ7lyTupD671Bph2eO9546b9f56
	h8io8efg==;
Received: from [189.7.87.79] (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1ugN5e-004u0J-9I; Mon, 28 Jul 2025 14:36:26 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 28 Jul 2025 09:35:38 -0300
Subject: [PATCH 1/3] clk: bcm: rpi: Turn firmware clock on/off when
 preparing/unpreparing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250728-v3d-power-management-v1-1-780f922b1048@igalia.com>
References: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
In-Reply-To: <20250728-v3d-power-management-v1-0-780f922b1048@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pZZomASi24vggMR8j71ADAoeO3BXAe5jDYmwLalGNxQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoh26+suwpumaA/wn+o2MjmzSVpSXOUkLEBC56k
 q7kRLvz5BiJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaIduvgAKCRA/8w6Kdoj6
 qr/jCADgO02yc7qcjaMiFwUuEvy50CDhC+sepCAyp2+fSb4QTq5oj3h3Oc0Oq/VdPYslrovrVXI
 9Ol8N0vo7erv/C6qCjUu1pvBKoMQCI5jPTcqqO/K1mqwqyAyrUCH5eVMoTgFZiJ7wj2TKgb//ww
 99nhNkO0jfany3jhizw4XykRlMaH3q6RDuEExQuXHvEXlURYhXMLlU5jc4K7d+PEvjtyAl/+7+U
 LZbIWJvQJPjB0nvftbyi90KQUvMc7f+w9nn01GxhbKSPx8J32llhOEEJIWEER8zxeQS1V8gw7gf
 Z6koR4sDZkH4ykwgmOJiFTm81zHjUUesBEj3XbOgHbd4SDEo
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_053637_214896_4EBBC7FF 
X-CRM114-Status: GOOD (  14.79  )
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

Currently, when we prepare or unprepare RPi's clocks, we don't actually
enable/disable the firmware clock. This means that
`clk_disable_unprepare()` doesn't actually change the clock state at
all, nor does it lowers the clock rate.

From the Mailbox Property Interface documentation [1], we can see that
we should use `RPI_FIRMWARE_SET_CLOCK_STATE` to set the clock state
off/on. Therefore, use `RPI_FIRMWARE_SET_CLOCK_STATE` to create a
prepare and an unprepare hook for RPi's firmware clock.

As now the clocks are actually turned off, some of them are now marked
with CLK_IGNORE_UNUSED or CLK_IS_CRITICAL, as those are required since
early boot or are required during reboot.

Link: https://github.com/raspberrypi/firmware/wiki/Mailbox-property-interface [1]
Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 41 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 8e4fde03ed232b464165f524d27744b4ced93a60..a2bd5040283a2f456760bd685e696b423985cac0 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,6 +68,7 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
+	u32		flags;
 };
 
 static struct raspberrypi_clk_variant
@@ -75,6 +76,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_ARM_CLK_ID] = {
 		.export = true,
 		.clkdev = "cpu0",
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_CORE_CLK_ID] = {
 		.export = true,
@@ -90,6 +92,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * always use the minimum the drivers will let us.
 		 */
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_M2MC_CLK_ID] = {
 		.export = true,
@@ -115,6 +118,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 		 * drivers will let us.
 		 */
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
@@ -127,6 +131,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
@@ -135,6 +140,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_VEC_CLK_ID] = {
 		.export = true,
@@ -259,7 +265,40 @@ static int raspberrypi_fw_dumb_determine_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int raspberrypi_fw_prepare(struct clk_hw *hw)
+{
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk *rpi = data->rpi;
+	u32 state = RPI_FIRMWARE_STATE_ENABLE_BIT;
+	int ret;
+
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
+	if (ret)
+		dev_err(rpi->dev, "Failed to set clock %d state to on: %d",
+			data->id, ret);
+
+	return ret;
+}
+
+static void raspberrypi_fw_unprepare(struct clk_hw *hw)
+{
+	const struct raspberrypi_clk_data *data = clk_hw_to_data(hw);
+	struct raspberrypi_clk *rpi = data->rpi;
+	u32 state = 0;
+	int ret;
+
+	ret = raspberrypi_clock_property(rpi->firmware, data,
+					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
+	if (ret)
+		dev_err(rpi->dev, "Failed to set clock %d state to off: %d",
+			data->id, ret);
+}
+
+
 static const struct clk_ops raspberrypi_firmware_clk_ops = {
+	.prepare        = raspberrypi_fw_prepare,
+	.unprepare      = raspberrypi_fw_unprepare,
 	.is_prepared	= raspberrypi_fw_is_prepared,
 	.recalc_rate	= raspberrypi_fw_get_rate,
 	.determine_rate	= raspberrypi_fw_dumb_determine_rate,
@@ -289,7 +328,7 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	if (!init.name)
 		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
-	init.flags = CLK_GET_RATE_NOCACHE;
+	init.flags = variant->flags | CLK_GET_RATE_NOCACHE;
 
 	data->hw.init = &init;
 

-- 
2.50.0


