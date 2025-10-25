Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C956CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 04:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bw4z9PVBnrl74pcQ+V85ZiVa2r5TmKnZAhW/Uv6GfHQ=; b=BFI0gmnYQHKNPr7bJiGmiGk+fP
	D+8/KDVRsMzyBfC13dZ7gNgTys2aPx/dnKK0w9DePZq2T0yCRCG8tOHB+1nFsgNcKnmv+5CK/ZWw2
	8fDv6TLTlPXtHsSZSU+TIcl1PklwRBbT5AvC15yt9QBQl1CXMzggyVDQN1iaow16c55awBEb2mI/h
	zIfsyZ7lgd32ynoY5sVzwV1v0nEKEBM7om+aMCBQO6yzNwlE4yd53o2JN3RyTR1LolbbMGznHT5T7
	OLMmsVK+xrQ/P76HaoLrxjjAPmif8roN2eeE59IeF68OW4wgUSulzfxzaSFybl9zt1NazLxF4lImd
	WNxrA0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVx7-0000000AwWu-3Gku;
	Sat, 25 Oct 2025 04:32:30 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCVx5-0000000AwV4-1ppp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 04:32:28 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-378ddffb497so24451231fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 21:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761366745; x=1761971545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw4z9PVBnrl74pcQ+V85ZiVa2r5TmKnZAhW/Uv6GfHQ=;
        b=UrSEakAPsyKuxmnGcpJo9jMNjWWSsEUMUEHmRXxErDaNOa9mW4JQ5AwKZYyDAOzdCn
         hNvcAq3JT6KF0vI+hT3urIFacPYaieq8/0wLd3oUF5z4h/J9NYAU66S8zJ8qhaWjVQXx
         x8SLkBFSE1zVr/ypyOeMIKkCJU7RELTZeEzITltOn8uAmxfnADC1pB1mt0qeNECGE1yb
         +e/JnXMr8SoSStCmg7oGrCPi3SLqQfynyOz08q7SGDLUO6/MpEnuZcHpZ1mkg5GIJUfa
         fP8rSXabrgRuwVchcM2RsDKK4LJk+3QJVGHNNhEiub/xsrZ9kcHJuOyBw7Bh+8ZQghw/
         6Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761366745; x=1761971545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bw4z9PVBnrl74pcQ+V85ZiVa2r5TmKnZAhW/Uv6GfHQ=;
        b=oDDcu9weAoTOhDz+zfuWrqV/xa8ysGcpSng1nXfwZb54PoTu0kLv2ngUKh/JBb6v78
         uDAr1oEuw1VejCXiqtF0wDDbywUwrQwnSdDJURAxLDLpIRq4XfSP/Wy7HoavxaIzm6kg
         LpybRH4cRmXymuYETow+sLm0pFzyQ94i9BiOOiv8YZziT1UEeiYos0IAj8K/d5ilmzu/
         b2uUaBV5nfuy3P2GyJ8pJpMDzdiPLYx1Q/gI7sK9se/hY1rBeMqdiz17+boasf97CP+G
         n7OtSwNTKqfJ8bxJXJ5kkKIHXZYh+2hm32cIwJpVppwIxYveBcZ4Ao03GlDL1UUWfcyt
         tiwA==
X-Forwarded-Encrypted: i=1; AJvYcCXppUaao3hTWPIt+pzwQ4t7OP5ZYCqvv494L1hxd4KAa9pr09hFiSUqjax1Ut14z/q/ybg8QIcYNPqk0FTfneq6@lists.infradead.org
X-Gm-Message-State: AOJu0YxNB9DN7z+nLkJ/4qMu/vgQC/dclx9OPg5RwBp6//GMgfXWmr61
	k94RVygYqh/IrKMvn2oEZHV+W3r/A6jEMhn1fyOFGV3OEJZ/y0gxkPq2
X-Gm-Gg: ASbGncui03smJHagKpBH/DqLuXNplAUEjqXEWVi++jmo3w4yKlXR58sU0KSfMigF4yD
	1LZPXpT5sKd60dX+FrZuW9z8mIFx+9c+1x/bF0j5R9IS+BqHuJv3jCcpqnpwh+wSiTsqVcVnlVu
	qh2gCnu/smTytcQj4NyAsGt+du+4lTuwwoWTXpI4UdTR8HJh1zmKAgzx63zKqZ2SsnQma1cZ7AE
	vIwf6a8oUP6pdeLB/bqvLnOG8v12xLvln/1G9iA9bgWEOqkRLwCr4UvCL1zzCRyBrxb6bADfmDE
	vxsZEeAWk7bkAsOpLzBGwFHHYT6NPLzUeJVeQVa8le6DpbwjV7CrtQvDUfk27iwX6LYuTb5jXJ0
	qDfizpH2xJsN+mMLyCjZ5hYUCTo1C5GBzAAzQ3Ejo4k85erz3392pkplygBcgZ9ShA354JrvEce
	QZ
X-Google-Smtp-Source: AGHT+IFIlO0Xnz3NfsASBS+sA6Ogolz52/zgOOHUf1BRiQNX9JIhdrYW1iCIFtP2vXKndrvpB2lUXQ==
X-Received: by 2002:a05:651c:221f:b0:375:db6e:fac9 with SMTP id 38308e7fff4ca-37797a0dab3mr93162251fa.31.1761366745177;
        Fri, 24 Oct 2025 21:32:25 -0700 (PDT)
Received: from junAIR ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-378ee0ca7a0sm3409241fa.33.2025.10.24.21.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 21:32:24 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] thermal/drivers/sun8i: add gpadc clock
Date: Sat, 25 Oct 2025 12:31:25 +0800
Message-ID: <20251025043129.160454-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025043129.160454-1-iuncuim@gmail.com>
References: <20251025043129.160454-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_213227_493172_47CF3BB8 
X-CRM114-Status: GOOD (  13.03  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Some processors (e.g. Allwinner A523) require GPADC clocking activation for
temperature sensors to work. So let's add support for enabling it.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/thermal/sun8i_thermal.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 226747906..c02c398b0 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -66,6 +66,7 @@ struct tsensor {
 };
 
 struct ths_thermal_chip {
+	bool		has_gpadc_clk;
 	bool            has_mod_clk;
 	bool            has_bus_clk_reset;
 	bool		needs_sram;
@@ -89,6 +90,7 @@ struct ths_device {
 	struct regmap_field			*sram_regmap_field;
 	struct reset_control			*reset;
 	struct clk				*bus_clk;
+	struct clk				*gpadc_clk;
 	struct clk                              *mod_clk;
 	struct tsensor				sensor[MAX_SENSOR_NUM];
 };
@@ -417,6 +419,12 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
 	if (ret)
 		return ret;
 
+	if (tmdev->chip->has_gpadc_clk) {
+		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
+		if (IS_ERR(tmdev->gpadc_clk))
+			return PTR_ERR(tmdev->gpadc_clk);
+	}
+
 	if (tmdev->chip->needs_sram) {
 		struct regmap *regmap;
 
-- 
2.51.0


