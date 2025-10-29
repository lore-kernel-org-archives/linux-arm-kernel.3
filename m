Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27940CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=; b=oGWJ7yU37G3IDloIaf9mLiMGqa
	hxr71YnNUxl5g+xwEKmCnNN+sEDIyjLf4OgZfRiPGKYs4j9WKd/zEuVf368Ja+Ei4h7ttiFzT7pY1
	XBLyBMkDZCX1np3BO5Ej4w3ZnAhGHA1retbOOrzsOF3b6FqYQNfpSd8zGjXzuXs3Ks34JqDr4osxH
	p3Cxk4GLeWh5p8qS6O9UTswUmiIeLpZjK8q6j+VJC+DnJkrOW0TpGZXgX465Na9tZEqKxEiz39Xrf
	0vYr+xhhJvbrCHknzvHBmhPzKeSolQ1yhODeOY+xa53QbWsVwDzg/b+lDi/WI01cvO0GLzCXHDg+6
	Zmh6Cd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6f2-00000001SqS-0x7v;
	Wed, 29 Oct 2025 13:56:24 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6eu-00000001SlS-3rNS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:21 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so1376155166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746175; x=1762350975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=;
        b=G97bmrfaXMmFq2tCfpwXZAkm714DB/H5U/UjD/AerHyq/unyV/inaJKgcGwpt6LbQd
         a17PozZBnmzIGmWl55s0MHZBqOmHiRsYOSm1s9F2yY7QnDi2HyUrD7hmmVt5RPruq9xm
         pyKvhuA74wVhoMv/fr72GutuA6IwGFt9mAyNmJR3QVCcOuAgJRClrjRyBMFk+XjSsf/S
         +YMtnjzs2GgcdQhNlF3w7NodkBpWST9lD9o6lHdQtx7gPiLJ5M6PRYEzl6mCFJ19nQnD
         nvS30cNVU6udMSFAu7PGx6pfQvNYmwSfP6Yx5YYF+BktBmL6Z2YUcKugVagP4BtJsCCS
         mldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746175; x=1762350975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLOfFSUsLQFSAaCeNKLQcY7EGH2cZO39Xz6bSSm3lAI=;
        b=E5jp4k7cvjiLmZiSfXhy6JNe4kJqCHhx1pQ5RKHzgWi4YLLxF4t6DyviQzkYhLIUi5
         VDQWNBBGSHBDiZHrmf48pEGGAyHDIUiw0BK9XFLAtTH6GKqB6gfHoZlobQBuJNFbf1Vu
         kOFz3QmFwliBSLtmLPpV+MOxaXDx+ovez8XgzkUVIpGDcDGUNiyIiByTQwQa9MLeZ5SY
         jaoI0b/0er9KA4S/lt9RMutSCWlJDP3yinNTVsbwoDkOFJp6cZRRkqf7AiNK3bax+smq
         xZ/ZEaW1EbInSbY3CUj5WtU74IzZqNQ8vkb7RXtzFdO9hHivq30L8j8gMC7QLx+0DzrU
         25fA==
X-Forwarded-Encrypted: i=1; AJvYcCWBVYcTewLLFJ/l+3UON0s+/y+9ns7o1wvw7dX9dmmxSnXB9StBGStIZ5zFnODQGDvZt1u/nKsulIspZFT+WiSP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2SDxZ5Wfv80+hXDnBevOZwtKWi3TSzmyb+ZzlX2OLRTN+2TDv
	uYGBXZqWcasMGgg2vV06EOJi9L9ijZG4V/bInMNnoDxsAbN+yPgE8PBV
X-Gm-Gg: ASbGnctIJ6rJfrvZp3/RJlJK0RqXVEeu8u6pIrspUMLEi9tIUeRPVt8YwrgC60lvfOa
	8Y21J5ILbkwboMncG7X8JymgrHqst8GSgIiwIerlgrq/XV8kiwRwfn/oc4fafAhNPEeSUwO7I6m
	TFpdnliGO9S5/VWftwUqIHMiZeuPxUDD3Ecf1uLncodSCdZntx12C+Dcj0ZLI/+OhL3owBmvlAB
	Fxzi0UplFSXjV96QfVmRUdpFC833bp0xpRJEB4mwLOCQ2GO6o/wwW9eCGI5ObXNGmD2icjgAe5p
	6X2ChW8QdFivMuP18QT4sOFloKlfsGC4v3J8CLWcp4S0tGcSsjbdMCm/RdDJ6urLtPtREioxVsP
	waXK7RrdN3hA9R3IspbZJILi6Oe5I16UCyBx4P7AWxlNTp0RTSyP9Re6g7EUk6qfFdj/ING153A
	/eCHxu9ZF7iYhIQ/kX1cZ2I/JVLg==
X-Google-Smtp-Source: AGHT+IF7YQSNedMcBfqEpnFNryZkQPX09Rcf45htF6l7ea4hMqG4HFL94wsmN4DEcSgePcpQLPZJMQ==
X-Received: by 2002:a17:907:7f14:b0:b40:6e13:1a82 with SMTP id a640c23a62f3a-b703d327464mr285687566b.26.1761746174508;
        Wed, 29 Oct 2025 06:56:14 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:14 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Wed, 29 Oct 2025 06:52:27 -0700
Message-ID: <20251029135229.890-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065619_841708_FE421459 
X-CRM114-Status: GOOD (  17.19  )
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

Replace the previous approach, in which a single reset map is used, by a
per-driver approach, in which each auxiliary device driver holds a
reference to a certain reset map.

This change is needed to allow the driver to be reused for other NXP block
control IPs such as i.MX8ULP's SIM LPAV.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 3f6d11270918..5ee5a32c6950 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -23,7 +23,12 @@ struct imx8mp_reset_map {
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
@@ -41,10 +46,16 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
 	struct regmap *regmap;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,6 +67,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -140,7 +152,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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


