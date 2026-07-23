Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE92C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 19:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLGb/zziuaF6m3wpPJjhRXZbvSKjG2TPSjjhRdu4vOs=; b=x50abZI8HzJ1kNJPYbGOW1kUlw
	P5SDT8CiLJpKx7tzgMkT8iyNR303WxNXWs7ihg5FrncdOkNg5lvm6Sk8WxTEVauytov8SilEiIoO3
	VL7dvV4IhEifHL9QibKL83TbUTS1/b9c09NuFqblFP4I1dl3gXxIkbRN3G6glupUo7N6nzjclbYk3
	37B7gEyghEavw2lMukjFQyUjF8+RShhc1JQ5JBK1N3T1QjAV7GpJl8B517lUinY7w0tIcL0T/R93N
	k4at37+nM8dOvVycbBAv+7Xh9R7bKKUG1bxSIONq0d/Jn4av65U65f4C4J6ZyeCQ7VGrHqazVusfT
	inLImHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2O-0000000ExTO-057e;
	Thu, 23 Jul 2026 19:24:56 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmz2J-0000000ExS5-3iek
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 19:24:53 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DE2EB9D86D;
	Thu, 23 Jul 2026 21:24:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nv_NDWa0Tz9x; Thu, 23 Jul 2026 21:24:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1784834683; bh=SbIfnvgSjJKlnfJuMv2bCPAWMoq+L0ZH2BQgEn9//Uo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=XE5iYapVu+jR+7F/FAMsNEo5Vi9OASVv9c3qYfW0x+tRvh6LC0BJ7SwKgFdXOYMUT
	 XX1KOvqsGlirZfx5eSYxO7UUQbfJOLEYV7hy81EEMOAgOJYI0Fp6zOK2n/J7ggxWfR
	 Nte+Xjca8f7V4sVH+gEKFk2KuWNgdvdCm6CsIPQ5kCjxccdC7uzkF/CHHXHiKlfkBc
	 vNqpwB7M7unl+blyOZA5/uFKnx+Nw+tYL7j75w/6sdXwSnukMdpHpV5pouYk1MILZ6
	 x9yRbEGqPAA6pNS0noEiMJ/aDUgA1xEAfjIqbNkB9mQn8cDgdgI6Y3yyDLF4Au2xWU
	 x/HG6xFM3VYHA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 24 Jul 2026 00:54:05 +0530
Subject: [PATCH 3/5] Input: zinitix - add support for modes 0 and 1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-zinitix-modes-v1-3-f6df7d86a878@disroot.org>
References: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
In-Reply-To: <20260724-zinitix-modes-v1-0-f6df7d86a878@disroot.org>
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
X-CRM114-CacheID: sfid-20260723_122452_218100_6EE4ED63 
X-CRM114-Status: GOOD (  18.72  )
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
 drivers/input/touchscreen/zinitix.c | 138 +++++++++++++++++++++++++++++++++---
 1 file changed, 130 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index fdcb80f52c91..42010f23445e 100644
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
@@ -440,6 +470,103 @@ static void zinitix_report_keys(struct bt541_ts_data *bt541, u16 icon_events)
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
+static int zinitix_read_point_status(struct bt541_ts_data *bt541,
+				     struct touch_event *event)
+{
+	switch (bt541->zinitix_mode) {
+	case 0:
+		return zinitix_read_point_status_mode0(bt541, event);
+	case 1:
+		return zinitix_read_point_status_mode1(bt541, event);
+	case 2:
+		return zinitix_read_point_status_mode2(bt541, event);
+	default:
+		dev_err(&bt541->client->dev, "Mode %d is unsupported\n",
+			bt541->zinitix_mode);
+		return -EINVAL;
+	}
+}
+
 static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 {
 	struct bt541_ts_data *bt541 = bt541_handler;
@@ -451,8 +578,7 @@ static irqreturn_t zinitix_ts_irq_handler(int irq, void *bt541_handler)
 
 	memset(&touch_event, 0, sizeof(struct touch_event));
 
-	error = zinitix_read_data(bt541->client, ZINITIX_POINT_STATUS_REG,
-				  &touch_event, sizeof(struct touch_event));
+	error = zinitix_read_point_status(bt541, &touch_event);
 	if (error) {
 		dev_err(&client->dev, "Failed to read in touchpoint struct\n");
 		goto out;
@@ -682,13 +808,9 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		bt541->zinitix_mode = DEFAULT_TOUCH_POINT_MODE;
 	}
 
-	if (bt541->zinitix_mode != 2) {
-		/*
-		 * If there are devices that don't support mode 2, support
-		 * for other modes (0, 1) will be needed.
-		 */
+	if (bt541->zinitix_mode > 2) {
 		dev_err(&client->dev,
-			"Malformed zinitix,mode property, must be 2 (supplied: %d)\n",
+			"Malformed zinitix,mode property, must be 0, 1, or 2 (supplied: %d)\n",
 			bt541->zinitix_mode);
 		return -EINVAL;
 	}

-- 
2.54.0


