Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C09EF327B7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6zZIlIr38CDfooLWoZOvIbGgI1g4uZLDLudDAlPaH4=; b=0rKnSn8HchBr0srJt+F+X1E4pj
	cYb7CveL9aoQibl3Cgu5X490X6g5E+1gyULYqdSjCYygHbDn9dEwOiyVx/PaTQn88FyyaLA93z3mH
	7b7SWiFYw7zQHw346EitrmEIyIEX+ENrfhkWbtmwvbQecuEr3f+TuxXvByRq04BHlUBdwvv8MrsHe
	S7rYDOTZVN7FuuqazybIzX65lSZ7auyafLBk2ibg55BqQ9Ke/BT77jT8BnaOFtltqK0PIyUVvZN1n
	YIHSPSbMvJZ0t0nEAX+3jZcAF4psgfwcH9Md0xOhHw5PO2Ml0k9+DFS5dhLhrOqW4T3MrHLq+Kjum
	SseXpZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5PP-00000008A5M-2luk;
	Tue, 21 Apr 2026 07:20:35 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5PL-00000008A2l-30Rx;
	Tue, 21 Apr 2026 07:20:33 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776756028;
	bh=QVwXg2rjCHDLPb10isf9/q6yv3hIqKAxTDlkEXCyDmk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bYrz4pBXpxRjAhjmybXDP0vXtXs6gMCuXotxaQfkG0trIW30oPYdd526016yHy7Sv
	 NuQo2DBgni3thFcyOZ90iDGqJSNajcF/CYnD7egPDpY0bHAVmMlYOTkUB3aSmwIEhb
	 gmEbypZvezlt7zFi9mUt09Dr2UFkFewdesZ1BOzY=
Date: Tue, 21 Apr 2026 09:19:45 +0200
Subject: [PATCH v3 3/8] firmware: meson: sm: Add thermal calibration SMC
 call
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-add-thermal-t7-vim4-v3-3-a2e7215ed003@aliel.fr>
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
In-Reply-To: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776756023; l=2173;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=QVwXg2rjCHDLPb10isf9/q6yv3hIqKAxTDlkEXCyDmk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QImkxPxX0+BT1xAnZ0BrNzFKZdGiTw0b2KgOL333+7QF7i63jpAfOedT8PIzA9qW/Fl0VuQYU29
 IAhmLmwVdkg8=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_002032_078497_447F8FF4 
X-CRM114-Status: GOOD (  10.27  )
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

Add SM_THERMAL_CALIB_READ at SMC ID 0x82000047 in the command
table and implement meson_sm_get_thermal_calib(), which forwards the
tsensor_id argument to the secure monitor and returns the calibration data.

Also realign the CMD() column to improve readability.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/firmware/meson/meson_sm.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 3ab67aaa9e5da..4e57986724212 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -41,12 +41,13 @@ static const struct meson_sm_chip gxbb_chip = {
 	.cmd_shmem_in_base	= 0x82000020,
 	.cmd_shmem_out_base	= 0x82000021,
 	.cmd = {
-		CMD(SM_EFUSE_READ,	0x82000030),
-		CMD(SM_EFUSE_WRITE,	0x82000031),
+		CMD(SM_EFUSE_READ,		0x82000030),
+		CMD(SM_EFUSE_WRITE,		0x82000031),
 		CMD(SM_EFUSE_USER_MAX,	0x82000033),
-		CMD(SM_GET_CHIP_ID,	0x82000044),
-		CMD(SM_A1_PWRC_SET,	0x82000093),
-		CMD(SM_A1_PWRC_GET,	0x82000095),
+		CMD(SM_GET_CHIP_ID,		0x82000044),
+		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
+		CMD(SM_A1_PWRC_SET,		0x82000093),
+		CMD(SM_A1_PWRC_GET,		0x82000095),
 		{ /* sentinel */ },
 	},
 };
@@ -245,6 +246,24 @@ struct meson_sm_firmware *meson_sm_get(struct device_node *sm_node)
 }
 EXPORT_SYMBOL_GPL(meson_sm_get);
 
+/**
+ *
+ * meson_sm_get_thermal_calib - Read thermal sensor calibration data.
+ * @fw:		Pointer to secure-monitor firmware.
+ * @trim_info:	Pointer to store the returned calibration data.
+ * @tsensor_id:	Sensor index to identify which sensor's calibration data
+ *		to retrieve
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int meson_sm_get_thermal_calib(struct meson_sm_firmware *fw, u32 *trim_info,
+			       u32 tsensor_id)
+{
+	return meson_sm_call(fw, SM_THERMAL_CALIB_READ, trim_info, tsensor_id,
+			     0, 0, 0, 0);
+}
+EXPORT_SYMBOL_GPL(meson_sm_get_thermal_calib);
+
 #define SM_CHIP_ID_LENGTH	119
 #define SM_CHIP_ID_OFFSET	4
 #define SM_CHIP_ID_SIZE		12

-- 
2.49.0


