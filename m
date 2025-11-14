Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2785CE7B0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdYV/UUUzK+g0y1e4n+KXhL1vj4mnn1p47TPyDwiegM=; b=seVMAolWuvSD9NEFaIQkesGbQ8
	jMJ6FFIqAZZZz7ZmW/0fTH161yje2UGMxmc+klF/nBhFNTXy5TNj0HRkz/Rq0xuuMlac3N3ozmYoc
	lf5oC5lg0cRsZLbl6ASVUijnIpcxRwN4CSaqatUjLybS0eEu99/YqqQmqhF19p+2t45ohSHl7xldT
	Rpnk/MEFmt3oSoc1QnUASD5Ncu4/NlxTeYbl8FurvO2csyEeD06ZZkiaUS3vEK8igLbVYAl18u9Ry
	MMm0usuxeNKRLIvJDB10VsdwvmDmPPDlxZwIwqqME/hbN7a9nbbFBSgx2xKw343qskpE++97P3cXF
	8lXQZ8XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0U-0000000CHBi-1pkU;
	Fri, 14 Nov 2025 13:38:30 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0S-0000000CH8y-0v62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:29 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso3213439a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127506; x=1763732306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdYV/UUUzK+g0y1e4n+KXhL1vj4mnn1p47TPyDwiegM=;
        b=Fx40TYRACCpVkgJqY49bhF4MhqZKkSwpq6fW300OSaIaZJEZ21CCwuSASRcyoZaQtT
         OYKf4vZs3Y9s20Z0FUUwRSnxM80lgBImm4skC2Gax043QJEX6PS2igEhEnimJmbLCXqo
         Ws/HLaAOVosZXdqCnPBH0dxn0TSOlUYeos68Sg8OefucNtGCfwEtaAbVK83GuKnGg+pW
         9PCNHmBYazJ2ts+n3HpaCVAl2oP3LoW9rVu056aPbjlFkWBHCPgGzBHPQEqJZG5Wb/C6
         2RB0aIyl5XljT0O/pGppWUmY3OLpxGot2B/DQK8YXO1KOasI4oR3/FFpX+YUJpCr0MFV
         //9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127506; x=1763732306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hdYV/UUUzK+g0y1e4n+KXhL1vj4mnn1p47TPyDwiegM=;
        b=uxPcoW1bfxI8GWxjbeb3AueFCrrOTuv3xXMV0A8hGeYrjKclKdfa/nreIUoy+B5N+X
         mFWpp/Bemd404WtlBU306IUIXp6D7AkLYZNFLmCWH/QHtYPNFvtHlzDpi0BJ8VKo0nLK
         eWP7H24va9grLtEyi++nJ4qLeIxGafQIXdnjcjq34cZTQYuQpEml/CSjnct9uQUJabTa
         JcSCTTnL+BV9xRt9Gh4zIrNqJLFwN38QIOWLznPshc+HqYaj4sbOfKbzbgeV0R6LfBFA
         FHZS4VDtTyHi1XY30Q8XdA7RI88NLF/OekoaXiO23Blls7+k7gdNtklgxqA/Rqe0OMI7
         ZS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBMFqCkuggLcL8zbsYgg16qTywyQ8Rr4ebMyNxboBP9Ca66VpBvD0u2HqfGyqbk+c5JcKjrnRFFVC92ttE8Gze@lists.infradead.org
X-Gm-Message-State: AOJu0YycbtwqtJlj4FS4K+eCmfPNgJBF6aLEQOUiwOOzFEJ0hLQ2ooQf
	emaQfwRtD9nuUfm2upNXEDK7CYkzOGDFkAgs02UfCAvbd4h5YjIpDSuy
X-Gm-Gg: ASbGncvXJ35tt/h6L4YfFMQEohkBN5lo/J6YXmHQ0VL1cIPvTvwU5bHtGCU6gE/BOL9
	Kmx9Pm5OuFABvjvWinm7ZMW21SCc1F1O0sLvz3BHME1BVLlm41+zuIMUGv0rQhXbPjyxf1MNg1N
	9pNbERzVmW23QGjKpKM3W01NmIZCmTBpZXqGKTHGmWNMywUpEpQ4ZM9+T3M/CSusoCdX+dpwFCP
	NxGM4J/Br0RBIUc/fMrHpYjEFgvzbOcTiqf1/3e4mrW9cfwCD20Khpo0AG4cSmIdYLc5bR60w+n
	lo7AjguvyU+k8023Vqkk9MJKIKm4x51lwyqW8dabpdt2gdGWU7MHEon8w5i4ug9mkmQjwhY+cTH
	voQ6CeHCtY0szURsNAPq3tRhPJV9o7lELgrjCyG3x7JLjE4TaYaELguL1ZMX38csUyBQ/piIrBJ
	9xbKKa+tckJctOhfK2c/NOVc/RQC1+SOD0gwr/Ng==
X-Google-Smtp-Source: AGHT+IG+QplD5QTjYb8S9SqW056mSz7f0h/qlDXbebG1yGANMyx/wdTBv6PJc0hq4+iNYLCBHhHJcA==
X-Received: by 2002:a17:907:86a2:b0:b73:56a7:a36e with SMTP id a640c23a62f3a-b7367949692mr311064866b.50.1763127506289;
        Fri, 14 Nov 2025 05:38:26 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:25 -0800 (PST)
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
Subject: [PATCH v5 4/6] reset: imx8mp-audiomix: Extend the driver usage
Date: Fri, 14 Nov 2025 05:37:36 -0800
Message-ID: <20251114133738.1762-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053828_276729_A4EFE852 
X-CRM114-Status: GOOD (  14.08  )
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
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 35df9bd5f71a..d3396f37d1ff 100644
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
 		.bit = 0,
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
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, val;
 
 	mask = BIT(reset_map[id].bit);
@@ -141,7 +153,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (void *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -164,6 +177,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0


