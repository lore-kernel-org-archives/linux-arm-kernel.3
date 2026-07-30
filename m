Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4F3C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qn/I86EwarKgiaKJwJtzwq9CiBk4X3V0TOo2b54xzJs=; b=JxfLp2eDzWvHDAiDK0xWy67gvs
	V7TdmhWIHBMRS2IsxEuUkyMlYGr94rAep4oQjvqdaD9ZjLzJNX+Q+GPJarsMURjQT3ms8mP0MSFLZ
	OI7G0QroP47rThvonAOYFYOaDSws4ETAtkW5BBFXkE/YTPqrvQ9F+GjpZhbCjiOtvbffVXVpdnWJc
	cCLiirPuinjmwgzMqwFkC7YSWLNcnam6wKFGpORslcuOUy2h9+LrXJSWbQd9Dh/1vqdP9fzUlNrmN
	kvEFtZ4917IJUVGNM3C7jN0vaaFtM21em42pHNXWmdKf2aMKpxkBpzqU7To8YpYtRgviR+AhekHFE
	gN+nGi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXE0-0000000BJe7-2fiA;
	Thu, 30 Jul 2026 20:19:28 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpXDx-0000000BJcs-3Rk0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 20:19:27 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 1400441C2B;
	Thu, 30 Jul 2026 22:19:24 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8tAkVjAwJw0; Thu, 30 Jul 2026 22:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785442763; bh=aj8hhWibeTU8QIY9QYQlCqxjBoWJiWzaRKvTZMNVdc4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kyXRmBNjhlTWb3Efwi4gKUOx3YJ/qWt+BWHiIrxoYRU2Z8w1wIBXDoOzD8AnB1zi5
	 pB0jA99yara5KPFe25ezpO1XMEo7UIZnlzjSKJ0EaKi7lHIl2WKfpEFEHxOUMEiSoj
	 /tqHiEUz0gW7rmJ9ZRHXKr2HmD/sFX5Yj4HbQFht5M/JIngzF3z5YxKnWyOHGG7ifd
	 cWn4GX1218BxYbFce8bbh3uATd40qVkgIECa94Gpgq2rIPy2fy7YXcDVxfaOIKbycs
	 jk1FAYiEt7InWrA1YgBMEOkUelVZNTMmhSeCAKE1/wvDwA9c/8pT+vWIJFRN8XXr7+
	 SiDVw+2ZLePLw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 31 Jul 2026 01:48:36 +0530
Subject: [PATCH v3 3/5] Input: zinitix - add support for modes 0 and 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-zinitix-modes-v3-3-2c8de712997a@disroot.org>
References: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
In-Reply-To: <20260731-zinitix-modes-v3-0-2c8de712997a@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linusw@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_131926_132759_1C20B9C9 
X-CRM114-Status: GOOD (  18.73  )
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

Zinitix touchscreens have three modes, numbered 0 to 2. The driver
implements mode 2, and leaves out modes 0 and 1. The difference in the
touchscreen modes is the schema of the event data.

Implement modes 0 and 1 in the driver, along with their event structs.
Maintain a common, canonical event struct which is to be the superset of
the mode-specific structs. With that, introduce functions to convert the
mode event info to the canonical format.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/input/touchscreen/zinitix.c | 133 +++++++++++++++++++++++++++++++++---
 1 file changed, 125 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index a0a89d25e25b..aafd0b7d8edb 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -145,7 +145,37 @@ struct point_coord {
 	u8	angle;
 };
 
+struct point_coord_mode0 {
+	__le16	x;
+	__le16	y;
+	u8	width;
+	u8	sub_status;
+};
+
 struct touch_event {
+	__le16	status;
+	__le16	event_flag;
+	u8	finger_mask;
+	u8	time_stamp;
+	struct point_coord point_coord[MAX_SUPPORTED_FINGER_NUM];
+};
+
+struct touch_event_mode0 {
+	__le16	status;
+	u8	finger_mask;
+	u8	time_stamp;
+	struct point_coord_mode0 point_coord[MAX_SUPPORTED_FINGER_NUM];
+};
+
+struct touch_event_mode1 {
+	__le16	status;
+	__le16	event_flag;
+	u8	finger_mask;
+	u8	time_stamp;
+	struct point_coord_mode0 point_coord[MAX_SUPPORTED_FINGER_NUM];
+};
+
+struct touch_event_mode2 {
 	__le16	status;
 	u8	finger_mask;
 	u8	time_stamp;
@@ -165,6 +195,7 @@ struct bt541_ts_data {
 	u16 firmware_version;
 	u16 regdata_version;
 	u16 icon_status_reg;
+	int (*read_point_status)(struct bt541_ts_data *bt541, struct touch_event *event);
 };
 
 static int zinitix_read_data(struct i2c_client *client,
@@ -440,6 +471,87 @@ static void zinitix_report_keys(struct bt541_ts_data *bt541, u16 icon_events)
 				 bt541->keycodes[i], icon_events & BIT(i));
 }
 
+static int zinitix_read_point_status_mode0(struct bt541_ts_data *bt541,
+					   struct touch_event *event)
+{
+	struct touch_event_mode0 event_mode0;
+	int ret;
+	int i;
+
+	ret = zinitix_read_data(bt541->client, ZINITIX_POINT_STATUS_REG,
+				&event_mode0, sizeof(struct touch_event_mode0));
+	if (ret)
+		return ret;
+
+	event->status = event_mode0.status;
+	event->finger_mask = event_mode0.finger_mask;
+	event->time_stamp = event_mode0.time_stamp;
+
+	for (i = 0; i < ARRAY_SIZE(event_mode0.point_coord); i++) {
+		event->point_coord[i].x = event_mode0.point_coord[i].x;
+		event->point_coord[i].y = event_mode0.point_coord[i].y;
+		event->point_coord[i].width = event_mode0.point_coord[i].width;
+		event->point_coord[i].sub_status = event_mode0.point_coord[i].sub_status;
+	}
+
+	return 0;
+}
+
+static int zinitix_read_point_status_mode1(struct bt541_ts_data *bt541,
+					   struct touch_event *event)
+{
+	struct touch_event_mode1 event_mode1;
+	int ret;
+	int i;
+
+	ret = zinitix_read_data(bt541->client, ZINITIX_POINT_STATUS_REG,
+				&event_mode1, sizeof(struct touch_event_mode1));
+	if (ret)
+		return ret;
+
+	event->status = event_mode1.status;
+	event->event_flag = event_mode1.event_flag;
+	event->finger_mask = event_mode1.finger_mask;
+	event->time_stamp = event_mode1.time_stamp;
+
+	for (i = 0; i < ARRAY_SIZE(event_mode1.point_coord); i++) {
+		event->point_coord[i].x = event_mode1.point_coord[i].x;
+		event->point_coord[i].y = event_mode1.point_coord[i].y;
+		event->point_coord[i].width = event_mode1.point_coord[i].width;
+		event->point_coord[i].sub_status = event_mode1.point_coord[i].sub_status;
+	}
+
+	return 0;
+}
+
+static int zinitix_read_point_status_mode2(struct bt541_ts_data *bt541,
+					   struct touch_event *event)
+{
+	struct touch_event_mode2 event_mode2;
+	int ret;
+	int i;
+
+	ret = zinitix_read_data(bt541->client, ZINITIX_POINT_STATUS_REG,
+				&event_mode2, sizeof(struct touch_event_mode2));
+	if (ret)
+		return ret;
+
+	event->status = event_mode2.status;
+	event->finger_mask = event_mode2.finger_mask;
+	event->time_stamp = event_mode2.time_stamp;
+
+	for (i = 0; i < ARRAY_SIZE(event_mode2.point_coord); i++) {
+		event->point_coord[i].x = event_mode2.point_coord[i].x;
+		event->point_coord[i].y = event_mode2.point_coord[i].y;
+		event->point_coord[i].width = event_mode2.point_coord[i].width;
+		event->point_coord[i].sub_status = event_mode2.point_coord[i].sub_status;
+		event->point_coord[i].minor_width = event_mode2.point_coord[i].minor_width;
+		event->point_coord[i].angle = event_mode2.point_coord[i].angle;
+	}
+
+	return 0;
+}
+
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 {
 	struct bt541_ts_data *bt541 = bt541_handler;
@@ -451,8 +563,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 
 	memset(&touch_event, 0, sizeof(struct touch_event));
 
-	error = zinitix_read_data(bt541->client, ZINITIX_POINT_STATUS_REG,
-				  &touch_event, sizeof(struct touch_event));
+	error = bt541->read_point_status(bt541, &touch_event);
 	if (error) {
 		dev_err(&client->dev, "Failed to read in touchpoint struct\n");
 		goto out;
@@ -682,13 +793,19 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		bt541->zinitix_mode = DEFAULT_TOUCH_POINT_MODE;
 	}
 
-	if (bt541->zinitix_mode != 2) {
-		/*
-		 * If there are devices that don't support mode 2, support
-		 * for other modes (0, 1) will be needed.
-		 */
+	switch (bt541->zinitix_mode) {
+	case 0:
+		bt541->read_point_status = zinitix_read_point_status_mode0;
+		break;
+	case 1:
+		bt541->read_point_status = zinitix_read_point_status_mode1;
+		break;
+	case 2:
+		bt541->read_point_status = zinitix_read_point_status_mode2;
+		break;
+	default:
 		dev_err(&client->dev,
-			"Malformed zinitix,mode property, must be 2 (supplied: %d)\n",
+			"Malformed zinitix,mode property, must be 0, 1, or 2 (supplied: %d)\n",
 			bt541->zinitix_mode);
 		return -EINVAL;
 	}

-- 
2.54.0


