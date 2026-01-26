Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AD8D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pz2jknnsrS1lG8C1mtWwO8TUayvo0fQL337DUELyEgI=; b=cx5qI0Q/wpqXjMNG6XIPh62Gbz
	fQpmDSxmIbZ6DSJTdMW5cGCnKrZnJXsS11POpKt41VscELXgzRkHkAQ3hq2uDUQTpp3pkSdaxghe/
	kUQ9AKsV5vm70qVai7Nb1zq+gNibCvx6m2ilEfGS8/+nbQq3q2fV1JAwREJC66bIdWv64hos7mt08
	el1CIjJWGvfsKI5s0PcxPkZhmfHwjwilJstaBN7ag05RWCYmiUzeWAkE60LJFPXiLRiVsL3eKFrRe
	OfeodELZ5w4Agkdh944FCO/KZhRKL1FuaXqEHB7DhtIn2/xHkTUuMt9ZeGCawNu98KxRCL0LYdVGu
	ToNliT/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPMA-0000000Cr7G-1tdO;
	Mon, 26 Jan 2026 16:22:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPM0-0000000Cr2r-3Xq9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:22:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so69060385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444535; x=1770049335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pz2jknnsrS1lG8C1mtWwO8TUayvo0fQL337DUELyEgI=;
        b=O2IOigak/ZbIOM0sb6Zl6zfeN94BSbrWWA3IxDWqCw1BWJebS6aDq9B3ABU9evF+zZ
         XQQfzKGP6UnwAuGpdAxw+ENYiQZ6BLfA65ro31RveyjWSmJvs0iO88rxQmg+4sLANc20
         Ye/ILVT9HTYWAM2NTLTayX/+f0Zfo+HI+mlgrXpLkhXFRU+kOqHKQ6ryxmQz9/X001RL
         1oW6By2c4u40xY0awbiP9fPyiHW8M8lm5gJWVMwHr3UZA7QkbyB/SnmfE8SnBstjA85D
         HiqgGonIfrMJb909757Q1tqo9fnS+HodQtgJeLdrXPDc/5QjcNOTSpsx2zN0hjmr52qj
         FSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444535; x=1770049335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pz2jknnsrS1lG8C1mtWwO8TUayvo0fQL337DUELyEgI=;
        b=TP8ctvqpJjkBDpfzde9PdWuKS5v6YBJmA3kzI+u/ZPNfV7oXgDZ2VZn4V/gTPZxTpV
         XTzDg4heH5H/AcHUrMsD76B5yvtthijhDr5nXsRf/Gf8OZN/FplBGt5tfTEdlvMaGxVk
         3Fqu8mfn3jjB5C01LxQNy+dwzg8pOcmy0b++CxsIBN3DqrPEmdoLyV+SGZsVD9nyaEUT
         AWBQQbRmOdOLN50GFhmQX5GTgHVzCSWkiQPYaKgs72Qj1qm1UUpAdhMSQd2BKXOE/AAz
         Xt9v6CvgKw13diBm+EomGFw17EZT1fOoFn03cIeEKXH/+0vXd/ctH5N3RoBWC6xOntev
         nSLw==
X-Forwarded-Encrypted: i=1; AJvYcCVMWJlTJP2b+R28N9J0AGfFZaHHrWpG9MoL48ev1We8h4OJ3PKZMR5yKskVGyWuNt/FuiDNZUJO/4iv6PoOzULO@lists.infradead.org
X-Gm-Message-State: AOJu0YwIfYbPIduk3Mcrkz1BxYagG8tkKqllAqi8zTConziV3Jka+bVw
	EsVUONLcL+qcNnJqHVCWT1sJUy7AYcAMqsBEMF3OarFXnmVi98ZXtIiG
X-Gm-Gg: AZuq6aJsfMXvdqsQsNcVW8jBvBFWmGheqv2jxrZd3Y9Upk+hgRlhd/ydAmhPLiiuh4u
	tLoZcyLHJfWxTjVp5iP8cySxEC/HiI9+zfl77bujUiXUJBfgSF7lCGXyokpbM/Og3MoIP6Zt5fD
	mR4LQd3QuWLYTw1hEeUKZ/DoEPgQIjtAyD6GBoM3uvWTP9qRlHxhY0Mmj4/zOuazlNPb4K6En0L
	3Q05AbWTBu1g2XL7LbrNruHSeIc51mim7XSiezxTFBEYNNDJ0TaUsoLx7j13O6bkKjyZFzhdQy2
	Rargj6rh9WhQPj1R5LVQFdlQNXdgHigoGr1QPkyqODLf9AP1LD0OAsHbHG5cVcD9h+/JIsvZbtE
	UDvQ1Pj4bP8Rq1JaKopSOguHFLlFYKc8yP71f5qG/2OX2P6zxj5lehYMRToBW7WKsCHMC+X8QcD
	6ciWCQ32YIyJrwbAG7e9/udIZ2+Ej+gHtm6EhYQQ==
X-Received: by 2002:a05:600c:a194:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4805ce4decdmr57737085e9.13.1769444535111;
        Mon, 26 Jan 2026 08:22:15 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:14 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 3/4] reset: imx8mp-audiomix: Extend the driver usage
Date: Mon, 26 Jan 2026 08:22:02 -0800
Message-ID: <20260126162203.708-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_082216_931217_8018D472 
X-CRM114-Status: GOOD (  15.02  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to per-device reset map to allow reusing the driver for other NXP
block control IPs.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index f6152c0cc5ff..00eee528a2d2 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -24,7 +24,12 @@ struct imx8mp_reset_map {
 	bool active_low;
 };
 
-static const struct imx8mp_reset_map reset_map[] = {
+struct imx8mp_reset_info {
+	const struct imx8mp_reset_map *map;
+	int num_lines;
+};
+
+static const struct imx8mp_reset_map imx8mp_reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
@@ -42,9 +47,15 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
+	const struct imx8mp_reset_map *map;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->map;
 	unsigned int mask, offset, active_low, val;
 
 	mask = reset_map[id].mask;
@@ -132,16 +144,20 @@ static int imx8mp_audiomix_reset_get_regmap(struct imx8mp_audiomix_reset *priv)
 static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 				       const struct auxiliary_device_id *id)
 {
+	const struct imx8mp_reset_info *rinfo;
 	struct imx8mp_audiomix_reset *priv;
 	struct device *dev = &adev->dev;
 	int ret;
 
+	rinfo = (void *)id->driver_data;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->map             = rinfo->map;
+	priv->rcdev.nr_resets = rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +180,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0


