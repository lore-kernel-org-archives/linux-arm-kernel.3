Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F619D10F37
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEUrAaAcrC3D3wCSVpJgszh6h9a2J9Zuh9+Hw2rSnjA=; b=KjmMfR1fhGHOdrJ5b7own05zsS
	pVAMQxcw+5Td7Ck5bpPQ2v+X8JGQEYiNLDQAl9A1Satg+SHYwikucGd9P8Y1YYnqz201Wdgy2XiEf
	2rcxqzy56K6mAGmxjuw3JzshtNrJmEgnUig+QpJ17Cr9R/Tyv2ZQ9WShKe//QtsK7qgndOsJw023D
	rvo6jbk5Q7XUR5yT4FT2I8wLDT47TvCIrhoqpNR6fcw844XSrLkRVPfs4DiRqBXo2jdlT14hkXtbB
	NiuHGm9W8lt4o1iPnCuUJSUGOXPtlORGeb9Wjmw9v2Cn2aQCZNDfss0sFpzb3HKC0X6yEqUh1fC9n
	8GLMZluQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErZ-0000000EzmP-1F73;
	Wed, 26 Nov 2025 12:43:13 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErU-0000000Ezjg-1G10
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:43:10 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-64088c6b309so10755057a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160986; x=1764765786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEUrAaAcrC3D3wCSVpJgszh6h9a2J9Zuh9+Hw2rSnjA=;
        b=ZxAUHoWRqL4MzSwnika0WYK/sjeuto3+dZINp+A3jiGNO+OFISkosSVx+wcvxypF28
         9ZcOy2NpPYlYAixtkGIp4MA2iBVFMbvs61NnuMyDvvjwizZZw3GnPAoO+gvV9W5z7JES
         8+ycQrB21B8GbPZ9pQNSPLZxtPWFfhVaxX9abD6QPicaP0LXJJ65EVtIcJFdB57KLK3t
         bmmh1pIdXdMyeGnDtkzEa+YEwzjRZhufBYYG+6iph6L3SHOQMkgEKpjTa4ydoU2MHzBK
         suBriaTFgVUUANdcxGjnIEtcDpw6THmVMAcT/9bwzwG9hpQb5BxZYpb1MR2RepEgEc+O
         oNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160986; x=1764765786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QEUrAaAcrC3D3wCSVpJgszh6h9a2J9Zuh9+Hw2rSnjA=;
        b=i2uESXYNGgHMe15puu2pPOiTSZdwc/6CBROpCvwwjy6YrLndrqnP6jx76ILAJOsilb
         7HMhGvutMGwpLeGMi1k4WpawKu5CGf2x3o0dG0t8wxRYVXq4oH/EaiXWfBAO1UAnY87M
         Px4XOlLI563ZSEwZKHoDYzvISE15ZQeoFS+QQsiVfjrG2e1Y/u0D9VZb2ZZFp4F5wINx
         X0PG1cap7KeOI78ewbH1Q3u20vmk+CGhk6gP0lXYSDEfb8/G0rpdcYKT6SQv+wWMlyxW
         NL5XZeeUREcm6+GEBJLV/7Ih2BHnl3Ax+4TU8/Qj0iSlPfR0/yWgPNvwq7LC+GspbYg3
         s/pg==
X-Forwarded-Encrypted: i=1; AJvYcCWpop9EiGB01OTaaIfR+tKerbrraXzphRnM2+LX8yVebV6Pch+DKuv4S2zy5AWF2YR2Y5Wclpuoda7vovqLXuw2@lists.infradead.org
X-Gm-Message-State: AOJu0YyrBaN8RbhkuGaxZrc91Y2KaBJOXDuMhpq8qWsGMPxJfqmxWWNm
	V8Yc5AhzSOwIjCU/sFvi7ubZ1Hc7MCuUHttQ8JoZq72N6P6W/0JCRKH4Ez7+jfe4
X-Gm-Gg: ASbGncuvvyYiWBHt+yTPBdcRdvH7KG+OIUn7eB0yU+pNIlfyIHhFpaZuldMhuy0sHPr
	uOhEU0LXR/NBphv7j3dNR1g5nNuGJTE7kTN4Ajbp7IDSKp9QyXFOadFWQrtf3NV9usk1gFo9GUg
	mszBgoZeuwYAsuhUjdKME3e3CMBBs6aB8aDTy1FY9vU4EfLu9aIj/7vfhlzu//wVfNNVJK8LOZ2
	cMF/CydaSDp8bzl09YmwvGYs4dQ8dvdTMLZB+zKUuTPyOyN4j/fuLpb3TSAi1/GxBFNfIcQDl/K
	EKYfV5sq8dLPazL+o3Fg8Mp/v5QxOonUnDrAdDqHb+3XxVlQTf5iop1nCNxD9EW3fPJurF+3FlH
	2aONOAnzNT9X8jSLB+T45iQApcEpwj+Qj4HcDSNVI1OnIkVcwLzdfrwRZA9gJIKEe92Znpma2Aq
	tV+gCO2kI/OiYvl27TCpnFvH4JWgqVS2wMRbCV
X-Google-Smtp-Source: AGHT+IGKLPw8td8LrQ0ou6eIh/AvAY0vkGQJXd4hWo3MO0W0vfngL8sRsTQuh8232uCr75jYDD5EoQ==
X-Received: by 2002:a05:6402:510a:b0:639:d9f4:165e with SMTP id 4fb4d7f45d1cf-64555d057e6mr16359675a12.29.1764160986331;
        Wed, 26 Nov 2025 04:43:06 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:06 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 3/5] reset: imx8mp-audiomix: Extend the driver usage
Date: Wed, 26 Nov 2025 04:42:16 -0800
Message-ID: <20251126124218.803-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_044309_197842_8BC7F589 
X-CRM114-Status: GOOD (  15.26  )
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


