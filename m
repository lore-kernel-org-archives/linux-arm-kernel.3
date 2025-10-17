Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDF4CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 11:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=; b=vr5neQkRdrNoorPbYmjkqW0+xG
	28lQOFuw+hEdJKYwV0Gbv9Knqkx+uFHzELgpJrzdH+n0Lx8wNGb7nJT74RIqR/93CW5KdMGZEUq6K
	r2TI1lL1Cn3+avd7IuRPVkxnnlTF43VF8YrnQ3ew++06Pcds73jclnfD7PLbGh5g4/VS1bMSonfW/
	xEszQc2pYGHdPNEy4jZv7wCMzdPC0bfthqKSJGaMTc7v9OtnpCtVXrnfR+8/sTjLkTgdEqA5WG6c5
	pZuH/9zLlFE+eCpwfT4jOjFlYx55OFcLJe3MU+xTu+aKUT2gGGB5qdsZetidqsHz1j896Hz0wD4UV
	Vt1oze9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iX9-00000007ev7-2ixR;
	Fri, 17 Oct 2025 11:22:07 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9iX0-00000007elo-3Wwl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 11:22:00 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b48d8deafaeso379767766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700117; x=1761304917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=;
        b=ehlkE38Wq/UwgFFgam2NDwJ4LiOBmqz2CJYUqq79vda3o+F8DLq9hYRGrv6DWFwH70
         s+TEYrELx7dt4wM/gvxfR2MdgPQlZBDRGcUrMqGt/1y3DtdyjNh5AutYKTd1Sa+mtiGS
         H6rr5MV4QNXuZ59imGirEe77c2epO3xOZVtuXzhBt033M75ZbRLDi0QEtQ3/HNgFtWlL
         Uzn/yVHtNpcBxuHf75vaoBAeGzU/oAG3gs/HCb0gR5qptGBGuDvpjehAf/vPE4K9Q1yu
         hIAqK/AuK534BSqDccibrVQtShfxu1m+7ftiioFsPVHosQUpm0aGQOFXgX/t/+t+NLXA
         yeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700117; x=1761304917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPdqo0alu4iQYdIv2XuXRfTnuhzF5tbpLw/kkpI0JfQ=;
        b=xOvoBuacDKFxJaiY3pFiguG3QjIMy4mz3C8xOt++TCJJncop0Qtb3ULLYV/RSV1X0V
         oWbmYdr8fSAmtteIcw4/P8JG+dM0IjIvRDgKvFWC3T/z1Xz9eae0+T4xnxI97j0+q6Ox
         T4QKvG26IXJBc9sRTJAeBNSfBpCKumjFD8ALNi5BXO7Yyfycon3EqtVjDCIvoZYagMjq
         YnrCp6WpEVLfZi0jgKBAm3riHn7P1s+YMfAZRyTa7fnRNY9blWEMmX8lzC0s5UvATrrY
         CckBN3QLNyIJvYrKkv/+0ac4j7bbpzllFtEvwBZCJCkjn0A6Fc2TVZ4v9tCoyyKugBQH
         l6gg==
X-Forwarded-Encrypted: i=1; AJvYcCW5wcMWgT4IL6kCvi8dJtcJJP25X9A5I9aO+whjJK+7VlTV5h2CU18KLuXf/yIf4ZQpHy5Yr0gY6BefnoGvykWD@lists.infradead.org
X-Gm-Message-State: AOJu0YwrXn5kRWQgJP3N6Rz1YS3jGPhQX8na3whqUOZ1TniNO6QeNS6X
	uFWlWdXjUN9XOQ+AS+Yj4RzxyZJ7VuIP65CSFUrl+3sZ49lCns0rBQK9
X-Gm-Gg: ASbGnctN7C0k0ibp4kZeRQiROPCELMvaJ/38f78dTi7CymqyuPBuFU74MdEKiWevchA
	jEDj8YUPRM8gLRc3IHf7t9S0mhhtDpvAhBT/9plw1lm7bSueW1abUkwffAal6YFIPKbv6Xgf7AH
	bCL6R1+8bJA1Jr92wlfeoQwbmTCt1G3wZBusMyiySBVzDjpeDHmpXJ0Xbq135TvZihru0jnG3XP
	dHJLnLNIib5Tk722zWT/JSI61Rn7xD1arex2hiU5GebaD8YoXaXVAh/fqBcmf8weDc7Xl0trLOX
	Nth2yXyM/G9xr4GFYZ4LMaLbhmOxcHd0wX15xRAETIpkKUZpLnvLLkJskGfbVegOzmYzLYmywPO
	EEbGrFeMzwFfqMVAKKu7EPe3Y4czugbHcMDIcm4uzFXK5Y+cqZgDgYct466VM/+4TPAXm6i4wFO
	c7QkKXp1FmkeThVhN2+gO1b4z7kYg=
X-Google-Smtp-Source: AGHT+IHVLr79Aj1wmFsQfBf8luDTxUDCNFd8nKuGaUsCgVTKbksjEKUTdzlfSjzx9IgrO6A4BqLrMw==
X-Received: by 2002:a17:906:f1c9:b0:b64:8464:68ca with SMTP id a640c23a62f3a-b64846468e0mr277225466b.19.1760700117100;
        Fri, 17 Oct 2025 04:21:57 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:56 -0700 (PDT)
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
Subject: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
Date: Fri, 17 Oct 2025 04:20:23 -0700
Message-ID: <20251017112025.11997-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_042158_906783_B71AFE75 
X-CRM114-Status: GOOD (  17.92  )
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

Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
which allow users to control the assertion and de-assertion of the
reset lines tied to some peripherals present in said subsystems. Some
examples of such SoCs include i.MX8MP with AUDIOMIX block control and
i.MX8ULP with SIM LPAV.

Some of the aformentioned block control IPs exhibit a common pattern with
respect to the assertion and de-assertion of the reset lines. Namely, the
user is able to control the state of the reset line by toggling a bit from
one of the IP's registers.

Linux can take advantage of this pattern and, instead of having one driver
for each block control IP, a single, more generic driver could be used.

To allow this to happen, the previous approach, in which a single reset
map is used, is replaced by a per-driver approach, in which each auxiliary
device driver holds a reference to a certain reset map.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index c74ce6e04177..c370913107f5 100644
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
@@ -45,10 +50,16 @@ static const struct imx8mp_reset_map reset_map[] = {
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
@@ -60,6 +71,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
@@ -144,7 +156,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 		return -ENOMEM;
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -168,6 +181,7 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.43.0


