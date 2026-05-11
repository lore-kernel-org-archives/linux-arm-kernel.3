Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847E2CD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=; b=TciStvfH8AL8CKbTV9g3rrmMTv
	nk9hQxD/oDu4aLDnXnMuF+5Pv8+VZVUd4ND5n6kXEJByY7kCoooFfzx5ZYqNW8zoK/uoyQ9F55Tfx
	35ltq/3hPbKn6aK9RAMM02Q5N/ya3GWrsWFRJ+4FX6njRF1DhrJz7XiSArWWKYzeoyG3syjEyvWPi
	JDdfst9PO4TLPJjg3nNZ24aJ9S0B7sIDu8RhrszNiLsvIGtwHD3gemT9blZVp5uN7EKyZG2PHEzHn
	9IHoITXRXmXb5jDk1IIHl+68f4HYOoPWNlj7y2lfj9tOkBHQRMXJjT6YjlGpgtIbRqNI417cnItyw
	Y99/poBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO7i-0000000D965-2H24;
	Mon, 11 May 2026 10:44:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO7h-0000000D95C-0V7Q
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 10:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=; b=Hz5frJ0mOCj6YeA+ujg8mmnev7
	6E2evjMW6FSNvM57vLZdK9S65/okNIzhVXuTlW6qcPdqmHaMLeLadUcSLzjwiFmioPi/5T7jCV0SG
	HudxJ3kwfhboG51E4Vks3uaNMoBUHrflqNSqgMSV5XYCZkhk7Y7PIs+AItykg7n2lEcSjgUOlrT7q
	VcObvSFS+ME8zYVoKBRedZUOuy678NcqRKND6yFYhWkmx3wAa9wJD/++cKHpwzrbx8KunmXGYlnzx
	yPIftXgCef47xG1gLkbZOTik0VdvhzKwiRfd5uiiBGxZUlNv1DT46fD5pmnqLNXvIg6/rMojXH/7e
	LplFqMdw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMO6c-0000000BMXN-0thi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 10:44:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-366087480d8so3717307a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 03:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496200; x=1779101000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=pa2bZh3ZkAHwrDgXwjlLax4SckOgxVpAYm0npVGXI10JZH/yk7wDWbLgboein3h/Zq
         q1hMjeAHTU21UwNye6/IS72X/b6rN+wqJxQm538vLgWDP6Gxr7Nsx229gfUeA1RTTRzl
         hlIKQ+whm6tYrm+eQ9Do+p5t4Re2LnS+c/GUuHA2ZqYoK62lqEijHx4VjUVJzaY7SPWW
         JHxX/h5PJDnMxfY5Oc6cZ/IoLbmELdtk4I1WrsmVrLBPvkbmEC3+kHGEm0eREIoGe5pe
         H8z1Tt9S0UKJ3j0EEn5DzfHM2FKF8477XlI1sSpaXh66GjTOUOPRZDlYGSfrkeDeZ9xo
         ezeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496200; x=1779101000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRXDOC53itDbvSH3E3HyxAV1yZ2/7SesuEGqqAx3Huo=;
        b=EWyUhUJgAuZ3RsK5EVDPNEYvN1wrQpC1r7ikbroaXRfDsEcP0QjIYA9CYpPwWSGk7w
         mLjPh3rQW9yF0JYsG64fgizojMDhAz/dLpAtDEgOj3JOeqpgEpb4pjUPeizRTRLMVtkq
         R5eLkns8ik0ssNoedkGU/Ab06P2Pa1mzHN/j6iN0RizDI5yRocg7t1bxyCTNu6nia1V+
         s/K2tSBaNyGqV2sJlXMnhjduWUVbh/yJoRYfMO5KSLrvL60VI4ZdrbOvlDFsEIRMl1F6
         Dj+om32y79vDBKv1qr6sxhcBzN8y/jLPk8gaz2AMIoD7SOofX4pkDwe2u1O8+or/oKgv
         5VNw==
X-Forwarded-Encrypted: i=1; AFNElJ+hRB++MxiDzMw6ZW2dfrtEmy20ukFwQvOflnwbNUOwld+TmIfAnLpMEwuhr6ea6kd6q3MvdEpy2KiiXl2+lAQQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwsKUJjJ/G8v8U+A7pD2Dez9EUUYMPG1KtuNQZIKfv6pJVEjIRI
	FAfQTqXbJwFTFC+DweFxg/wQHGL5PjaRhs1VSMNeWPtALwu7SLilqv9o
X-Gm-Gg: Acq92OGp7rEDh35QJIf5CfZVOkYcdawK+kN+Car5gaAxGw3f6xjwO2DxtvYq6FapJ+1
	MX3Ck9DpxHfFHXvKFM6E1H5n/Z/Tx+3xd1FuLuV4VV+g1H7tzk9PfIKyZu/qLN+WETSeAdAZhoL
	xACBZZw7l3aVxNnJkfg6B/jH/0z5wM80nRyUK26XM2rZ8xkKZs3s4HisGp0vGgY/2fhEIJeuozm
	TPz+PzmIguhpkgFd0Q392u/zir1e/TomO/flf6dign6lIjJJFJrkgVAt4TCuuZTk0cKuAv6+TbS
	RSXbDhcisGyWvZ4EpZT5Vn+/CV8Dcx1XTnvYiPVbGm49OwZ+mUoO3aT9PQN0jo07BkYHbxCx+I1
	tZepLnRk7RvhotreiMExUX54y9lRtyEsnH/vNnNpvXpOijHfXCUd7aivgiVfF6fd9cE3Gx6xs56
	ZbFIrDLeMea8V8j6Ezt28LNDtHyXqk
X-Received: by 2002:a17:90b:3903:b0:367:f9f1:af78 with SMTP id 98e67ed59e1d1-367f9f1b66amr8598826a91.7.1778496200549;
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:43:20 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 3/5] media: hi846: fix modes handling for different lane cases
Date: Mon, 11 May 2026 18:39:25 +0800
Message-ID: <20260511103927.279550-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511103927.279550-1-mitltlatltl@gmail.com>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_114330_581041_B3C236E9 
X-CRM114-Status: GOOD (  18.27  )
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

When using 4-lane, v4l2_find_nearest_size may return an unsupported
mode, 640x480 mode, and it is set to the default mode.

To fix it, specifying the supported modes for different lane cases,
once the lane count is determined.

Reported-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Closes: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm/
Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index 61297ef66a0e..c77b34a5e166 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1130,6 +1130,8 @@ static const struct hi846_mode supported_modes[] = {
 		},
 	}
 };
+#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
+#define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)
 
 struct hi846_datafmt {
 	u32 code;
@@ -1162,6 +1164,8 @@ struct hi846 {
 
 	struct mutex mutex; /* protect cur_mode, streaming and chip access */
 	const struct hi846_mode *cur_mode;
+	const struct hi846_mode *supported_modes;
+	int num_modes;
 	bool streaming;
 };
 
@@ -1736,8 +1740,8 @@ static int hi846_set_format(struct v4l2_subdev *sd,
 	hi846->fmt = fmt;
 
 	hi846->cur_mode =
-		v4l2_find_nearest_size(supported_modes,
-				       ARRAY_SIZE(supported_modes),
+		v4l2_find_nearest_size(hi846->supported_modes,
+				       hi846->num_modes,
 				       width, height, mf->width, mf->height);
 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
 		hi846->cur_mode->width, hi846->cur_mode->height);
@@ -1821,8 +1825,11 @@ static int hi846_enum_frame_size(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_frame_size_enum *fse)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
+	struct hi846 *hi846 = to_hi846(sd);
+	const struct hi846_mode *supported_modes = hi846->supported_modes;
+
 
-	if (fse->pad || fse->index >= ARRAY_SIZE(supported_modes))
+	if (fse->pad || fse->index >= hi846->num_modes)
 		return -EINVAL;
 
 	if (fse->code != HI846_MEDIA_BUS_FORMAT) {
@@ -1950,12 +1957,12 @@ static int hi846_identify_module(struct hi846 *hi846)
 static s64 hi846_check_link_freqs(struct hi846 *hi846,
 				  struct v4l2_fwnode_endpoint *ep)
 {
-	int freqs_count = ARRAY_SIZE(supported_modes);
+	int freqs_count = hi846->num_modes;
 	u64 link_freq;
 	int i, j;
 
 	for (i = 0; i < freqs_count; i++) {
-		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
+		link_freq = hi846_get_link_freq(hi846, &hi846->supported_modes[i]);
 		for (j = 0; j < ep->nr_of_link_frequencies; j++)
 			if (link_freq == ep->link_frequencies[j])
 				break;
@@ -1999,6 +2006,13 @@ static int hi846_parse_dt(struct hi846 *hi846, struct device *dev)
 
 	hi846->nr_lanes = bus_cfg.bus.mipi_csi2.num_data_lanes;
 
+	hi846->supported_modes = supported_modes;
+	hi846->num_modes = NUM_MODES_2LANE;
+	if (hi846->nr_lanes == 4) {
+		hi846->supported_modes = supported_modes + 1;
+		hi846->num_modes = NUM_MODES_4LANE;
+	}
+
 	if (!bus_cfg.nr_of_link_frequencies) {
 		dev_err(dev, "link-frequency property not found in DT\n");
 		ret = -EINVAL;
@@ -2088,7 +2102,7 @@ static int hi846_probe(struct i2c_client *client)
 	if (ret)
 		goto err_power_off;
 
-	hi846->cur_mode = &supported_modes[0];
+	hi846->cur_mode = &hi846->supported_modes[0];
 
 	ret = hi846_init_controls(hi846);
 	if (ret) {
-- 
2.54.0


