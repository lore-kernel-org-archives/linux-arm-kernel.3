Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D1CEDEC04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 03:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmZUdiZZg0fCj/2i+g2j9xmvk9n9CjWeVFiVPCHQNYY=; b=xQcAfzzxdJTW8EI7MUv05k/AfF
	C/Yl6Aq8fZ88aOJCtYmPN9HPJ+1DM+CCidVtZql1c5qTTbcjmck8dInuSHxgYKpiof7U/N8t8hlQc
	ph90wq+QGXPsXbD8O6qPmn0KOsYrfmupRj3mrAYkkjTmpfqFKTpQaYVXbArxpyYTnNwTEQfxYc6VM
	Z7SRiGh7xl3MZ6IdkzCskxsk3k2jEuhcwudRuxQ/qOERtjL9nCSCVkovcvSo3g97w/BPGdnCan0gk
	RzstxiDXdXnfF/6oOG0Qac+gCPdpjJi6v6L2Npz2hygRnY2G4MQ++lvr2ikNw1nKy2OFWdRVS/5GJ
	2OpSoBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd9k-0000000GOJO-3MMm;
	Wed, 04 Mar 2026 03:44:16 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxd9g-0000000GOHs-219J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 03:44:13 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5069b3e0c66so101832811cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 19:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772595851; x=1773200651; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmZUdiZZg0fCj/2i+g2j9xmvk9n9CjWeVFiVPCHQNYY=;
        b=lvhPpty9DjPM0dk/sxEbyISpDLGLXAJqYU/5s1VaYIs7CEECZWNKfqc0b3pHITaiii
         FfRu/eFV2axVUh19BEcOAsShT+A/+vzAr5EZrox14/b3VPwhDcqGunhYj+Xn6c79ec/N
         qY/6+WczN6sxjaA2BbT4/qEtVgpUSvueTT4+hA/8USPW4/u7KUwzUJd6Hsu2j4H8HtrO
         nZLLo6DQZl2aG2VWawaE6yB0gzcxttcMVWsFW0qNZXY3MG4fJ9gOpu4Ng+vjVaUM6gkT
         lvzmq3C9r1eOQJVNChZ05hKW6sjejCDiEywx9fQqoGfQ80rz8Sk3s3pA/PmYmu234SJo
         t3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772595851; x=1773200651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZmZUdiZZg0fCj/2i+g2j9xmvk9n9CjWeVFiVPCHQNYY=;
        b=wo0TS/B4bPWyX2+hVDWR5rbXIe0LdcUEjjOzW8NiGe5xukZ5Z2SYdsWcL1PzDzLcCc
         CChRF0hILKd1/CbWQjxZvhCLjc5IFjG1LxR9EnfrzP3hINSvpa+RaJGaXHHFgMNxiMZC
         VCdX4gz2jFfCkYkYwvMgquJPCyquU0zJBP23xd+L5Ky1OSovmDQwq/TVErZV6Fsshs1/
         QzJJcPMlD6W/xxNXnwz62zQwI9UY7tmyeP0KYZFL8S68t4lCgSn7fll+zt2DXD2eQDF1
         SZjPG6FQt0pFPuVsMmjEvrsDN4XVnOXAoQBYyuoIyCUX9HjD17pOX4b2x6gXx+8oXZPi
         8KtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn1JqCUHSIK0nJktNaspYAA4VDBihfh7oq8mR907041adRz/ItPIoAH+aIsviQu/YQsavdawSZtrsKvMuyTLcy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2+a4D6UbNKnq69LVHcfcCdvUOgnnlR7XUVALaDJ4SyLNB8ftS
	uDuIbZw3DaFXeJ/L+I/Dfk+yk9OSy4eO43OGZlyTrnM6s+gM+bwQ7xSG
X-Gm-Gg: ATEYQzyepLnQBKsh0/l0pCW1+b9cl51WlhVRWUBnHRb0cXOu9ofJPfGHglq2HA4Rjuq
	R/GXudVPKIxWu3OwUVoqPnWI7jg7NQhqx0LjIc7I+tUqlNLxnb+PJYxOgPb8t6Dh02bVDqlsQLG
	Tw8Y6c9KnOUYUWdh8lnMZKdtbr1v28eG7T20KLlbT6tH8BnMfHv/lHCuYDSH6G3UXdmniIwvc0k
	+SQBEWcoitSyKdE4hqpcsJzQT9UPk/vVGJvKWL10t3g8zZB76js+rVRprdwasUaV6Y3TMMf+Ygu
	TR6r4a4U86eclZBohBlAx+cOGziBHSZchiVV03vsZwyRWedkj57js4429UR6bNxvJh2gPM7h3k/
	p3jMTZSbZuobr17bLp8tYMVU7DOZA+5OD9D0HOGZnzYfV5iTjGmlB9u+oqHoc/B1ucCYsNQAnkC
	XrpqD4uGLiGGAx2giia/VsfnQHNEs=
X-Received: by 2002:a05:622a:1490:b0:501:4b9d:ad19 with SMTP id d75a77b69052e-508cea9b44fmr52007601cf.22.1772595851140;
        Tue, 03 Mar 2026 19:44:11 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e608cfc6sm88603286d6.14.2026.03.03.19.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 19:44:10 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Wed, 04 Mar 2026 03:43:45 +0000
Subject: [PATCH 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-b4-pck600-a733-v1-2-2f54efdb8cc2@gmail.com>
References: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
In-Reply-To: <20260304-b4-pck600-a733-v1-0-2f54efdb8cc2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_194412_534589_5497D189 
X-CRM114-Status: GOOD (  17.43  )
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

The Allwinner A733 PCK600, similar to A523 PCK600, is likely a
customized version of ARM PCK-600 power controller. It shares
the same BSP driver with A523. According to the BSP provided
by Radxa, unlike A523, it doesn't require reset.

Make reset optional in the sunxi pck600 driver and add support
for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 53 ++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index c7ab51514531..8f9fdc3915bd 100644
--- a/drivers/pmdomain/sunxi/sun55i-pck600.c
+++ b/drivers/pmdomain/sunxi/sun55i-pck600.c
@@ -52,6 +52,7 @@ struct sunxi_pck600_desc {
 	u32 logic_power_switch0_delay;
 	u32 logic_power_switch1_delay;
 	u32 off2on_delay;
+	bool has_rst_clk;
 };
 
 struct sunxi_pck600_pd {
@@ -151,9 +152,11 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	rst = devm_reset_control_get_exclusive_released(dev, NULL);
-	if (IS_ERR(rst))
-		return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
+	if (desc->has_rst_clk) {
+		rst = devm_reset_control_get_exclusive_released(dev, NULL);
+		if (IS_ERR(rst))
+			return dev_err_probe(dev, PTR_ERR(rst), "failed to get reset control\n");
+	}
 
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
@@ -193,7 +196,14 @@ static int sunxi_pck600_probe(struct platform_device *pdev)
 }
 
 static const char * const sun55i_a523_pck600_pd_names[] = {
-	"VE", "GPU", "VI", "VO0", "VO1", "DE", "NAND", "PCIE"
+	"VE",
+	"GPU",
+	"VI",
+	"VO0",
+	"VO1",
+	"DE",
+	"NAND",
+	"PCIE",
 };
 
 static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
@@ -206,7 +216,36 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
 	.device_ctrl1_delay = 0xffff,
 	.logic_power_switch0_delay = 0x8080808,
 	.logic_power_switch1_delay = 0x808,
-	.off2on_delay = 0x8
+	.off2on_delay = 0x8,
+	.has_rst_clk = true,
+};
+
+static const char * const sun60i_a733_pck600_pd_names[] = {
+	"VI",
+	"DE_SYS",
+	"VE_DEC",
+	"VE_ENC",
+	"NPU",
+	"GPU_TOP",
+	"GPU_CORE",
+	"PCIE",
+	"USB2",
+	"VO",
+	"VO1",
+};
+
+static const struct sunxi_pck600_desc sun60i_a733_pck600_desc = {
+	.pd_names = sun60i_a733_pck600_pd_names,
+	.num_domains = ARRAY_SIZE(sun60i_a733_pck600_pd_names),
+	.logic_power_switch0_delay_offset = 0xc00,
+	.logic_power_switch1_delay_offset = 0xc04,
+	.off2on_delay_offset = 0xc10,
+	.device_ctrl0_delay = 0x1f1f1f,
+	.device_ctrl1_delay = 0x1f1f,
+	.logic_power_switch0_delay = 0x8080808,
+	.logic_power_switch1_delay = 0x808,
+	.off2on_delay = 0x8,
+	.has_rst_clk = false,
 };
 
 static const struct of_device_id sunxi_pck600_of_match[] = {
@@ -214,6 +253,10 @@ static const struct of_device_id sunxi_pck600_of_match[] = {
 		.compatible	= "allwinner,sun55i-a523-pck-600",
 		.data		= &sun55i_a523_pck600_desc,
 	},
+	{
+		.compatible	= "allwinner,sun60i-a733-pck-600",
+		.data		= &sun60i_a733_pck600_desc,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, sunxi_pck600_of_match);

-- 
2.53.0


