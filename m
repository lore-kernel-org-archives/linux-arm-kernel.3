Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748B4CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8PNRT/I48ie0bRNz5r0+TyoGyzFa1yYHCMX5vHGvkU=; b=SM99z6sTSGHRXRrCSTYBEIw5FZ
	u2r3refsY7UoBGPdaPcAh+ayEpeHhx/MF1IPpNIB158D0hyx9mxnLiU5dFMfprHWGzEc1nCztNCDV
	NKH5yk8c5mxtAmofYIj8n8Ulo3n/Gg1/8Uv+AtTDNl2vqSUhJ3Ch/2O3DMGQxXdVnZpbPXKZKeIx0
	QisQUuwLeT4K7y2GxcfDvQxbWWgsXOBzajGjR87tYUtSgTZvexPBb4YiEjX5WhW+dAnazOKNTk4XW
	L8s/WbnehBjMOI3UiTb0th9uemuby8aH6ZeJB8e+h/esy4eh0ItRQcgK4n43Isg0YqVb06TtGM2IQ
	mkc7mZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1W-0000000AyWy-41WI;
	Mon, 04 Aug 2025 16:26:54 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixX2-0000000Atqc-3RHy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 15:55:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-af95525bac4so387956166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322923; x=1754927723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8PNRT/I48ie0bRNz5r0+TyoGyzFa1yYHCMX5vHGvkU=;
        b=cr76FWlhQKpSwmBbDOGNpPy0Gztdy9wmbcs05jgFV882xwRDWCYh0/73jj0zBr2EJa
         wvJrW5cJ+HKH1+99xk0oaeGjqpsDDM8VhSWrZjLOhWAgVXLdBb8QHChdByZoVXeaN7/O
         y1DfjWBgVe4IdOVZPizUw/CpsVhhxvaaLbvSYjYFm88nOebu5CYH78rI9tyFcU0s9beg
         wGKIXce1x0zeGTwAZK5YJh57eWklND7d0X2zcDJ4pcxd8yq7bSL706/kl7ZhdeoC0fzK
         ZJKiAvIkSIKDtGAlCaUdlQJ5JEf9hazr5uqOFc/e2/QEjkChaYD3I8dRkj2RC7c/iydi
         6MoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322923; x=1754927723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8PNRT/I48ie0bRNz5r0+TyoGyzFa1yYHCMX5vHGvkU=;
        b=pX7qlmmO3p3L2UbDBJiRMTSt0GoO+1jWf8F39e/noZvyuyVQSnIj586VnH32ofB6Q0
         6KmJgJMlCL+fv7A8vm4wNsIqCUUDAwWi7Toev8FiiJiI/YVOeQEwazgxK+maL09DtKRc
         HETdCZd/x1jDST3tmU5pNNbbkEzmKyQQos0/fdlvakNObLPuikRrQ4OW1qAzWCG2dsUY
         VRestkc+vdmkaZbu7rQ3amRSgLROpbLEXRMkTv9k14gqPa6TuA5YTR8gQ67CDrBdTciV
         lA/nG6CBQK4l7cdUDSFPfomx9H8FCXw4ve4aOdWBSGzWVeCJMj/mEp6JdxZAA1jBOGKR
         eyDA==
X-Forwarded-Encrypted: i=1; AJvYcCVVdwF1s/FTpPgRSO+GoVmKfRh7Ced7EmAx98Lb9FhJRbWH0oA92CCBGI5GsHRrmWISJMY0pkymvBXYxcqbh3uj@lists.infradead.org
X-Gm-Message-State: AOJu0YxRYgYMJgNJ00DGjKUTk6ALtia92yddGRuKrfAy+SLNP9FUEO45
	szvg9GkQh6fWI3jklykkq/kubhemY9ZSrPqF9XZa6frxk6KNrI9491wM
X-Gm-Gg: ASbGnctJ5tJyprqiEvWIs1mceiwK3ymqlR8raFDs+KUZrWU/jPoFOe4Lct81AEMzINc
	M0kLVqWGE6IxIYecEZes+EqRUEqoHmgr8VXvhrEA1Y+5Jf/z/2NIzhLcz3+K6cpeSoUFyS5h8Co
	+yF4fWctRqK58kJbHXBH2nYs7UqWNieuCjVRMbhxpu6rPBoVIZNUwicfUc/+NsuggFKcDpeAEnf
	o4k3IYBRMEgjFdmCTn6bA3cz5AhJ90aom/kIzYsKP2Z14ROpUbTv6Bv/cEdy+lQ8eik0U1seHgz
	5WU4J+/CKX0feHsZv90bmJUSmU1iqQvP3ggmMZ0KWNM2Yx5FPHvZobugn7/weytfeFlQK7BUFLI
	7XEintwn4yeU48YsjYoyQ0Gr+pd4QiS9qOKptR9hPDqv9MoD47kNtgd4fQLQ=
X-Google-Smtp-Source: AGHT+IFfDvdFyuA9ALAp4YUM+ddrT5rqMT7rYruobfsQVPiAjFL8ichJg94bEOG/da/SNG5DJlXzHA==
X-Received: by 2002:a17:907:7ea5:b0:ae0:b847:435 with SMTP id a640c23a62f3a-af94024cadbmr998008866b.49.1754322922814;
        Mon, 04 Aug 2025 08:55:22 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:22 -0700 (PDT)
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
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 5/7] reset: imx8mp-audiomix: Extend the driver usage
Date: Mon,  4 Aug 2025 11:54:05 -0400
Message-Id: <20250804155407.285353-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_085524_902996_148ED432 
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..a3d0bd823272 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -26,7 +26,12 @@ struct imx8mp_reset_map {
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
 		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
@@ -44,10 +49,16 @@ static const struct imx8mp_reset_map reset_map[] = {
 	},
 };
 
+static const struct imx8mp_reset_info imx8mp_reset_info = {
+	.map = imx8mp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	const struct imx8mp_reset_info *rinfo;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -59,6 +70,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
+	const struct imx8mp_reset_map *reset_map = priv->rinfo->map;
 	void __iomem *reg_addr = priv->base;
 	unsigned int mask, offset, active_low;
 	unsigned long reg, flags;
@@ -112,7 +124,8 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	spin_lock_init(&priv->lock);
 
 	priv->rcdev.owner     = THIS_MODULE;
-	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
+	priv->rinfo           = (const struct imx8mp_reset_info *)id->driver_data;
+	priv->rcdev.nr_resets = priv->rinfo->num_lines;
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
@@ -144,6 +157,7 @@ static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 	{
 		.name = "clk_imx8mp_audiomix.reset",
+		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
 	{ }
 };
-- 
2.34.1


