Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D3BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=; b=PRue8FLica/olmVAEhDCN633CZ
	RSiXkFmc+GYIxyGtjHJNQ2n3mUlsP32FchU/dIcfE1hw1rYCzekbfCsZjKPwWhNyYLGxJ50Nkv89D
	alYl0i1qrhWWeaejc82Y7LE19oud6pf8NoVg2zunZChr+oOZOPxwme/8QvZjIGfXOBoTAeby8pdaY
	GW4VNagJU+Kg6NDioNbi9xOPlnTiXwV3mztZYjTaKabvErUemF4Wm/BaT1xu2xG+amYGHvHOpEwgr
	fySaPG9DqSx0zGG82PQnGimNlW6KL/EDXRFQ4Tm6G9VNCZksdLeCtjg+uHgwYjy1PqA2k3WTIHCVW
	3MvJe4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYPX-0000000C3Fu-3575;
	Thu, 12 Jun 2025 03:15:27 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVyf-0000000BneQ-3b2h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:39:34 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7d0a2220fb0so48431285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688772; x=1750293572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=;
        b=el3QFiBd0Jis7zJ8KsUOy9sIZSmxuhQXOSxpIse141lK6eqSb4CvHIJ0JYU4NdC7UD
         LlT4ThGEDF+pixXHeIQA21Os3ogwPu8rJsnZ+WTlJOoad9NxYQQLX9GzP4SpmvukUlrM
         p+PN9TtdGDxDLsoPa5L+sx62SIwRvjU5QB+InECjEggwC4h2V4tUgLwRTib/OGswXN5X
         1QJ6k38loZAhtDc//H48zZ2DRBmyxUYIgbQ3rhpuFz9uziqAbQU/jadvTRFYcm6U0VSe
         28A0Z7nD3WmlrAI+UaUdEh7t9WSOzb7xLeVInHa1p8FpA2X8cBjjwD91EMpw3/aCz176
         d/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688772; x=1750293572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZcV6dgLUABISNoRbLStZXdX9ieJsM3t2TsGeLFmrck=;
        b=QT413F6v+HtDwlXpVBMOInvy+LB67ISQGQKtYiEMhrOE71HcU0XlcsgGIW9YoAvpXC
         GJGhFPkhwr6HKfFA8B+4+S5Bt+4RvqOGQgTeEYmyiFglqH1AnQd1YLsiqXHJnBlGKgvh
         S6ntTgk2nNvNicFCfIcDVQanMgvrr3ye+cm5C0BZMolEnY8Ocl9F/ywzC292sWd/xAVr
         /IXQ/9XucRpliL6grZPAtGVNd5379ksjfnOtJ4a2ol7k1ax/0kbK8rr+YGubPNZCXTQm
         +gQVKRP1toM1aZ9xDAX5YcQ6qBw0/hAQpLtt4Sqtn0K9FJpQ83tvtnT/6Wo6Gb77LW2+
         XynQ==
X-Gm-Message-State: AOJu0YwP3w0YcHRGH4sI9gb9oQqf4z//REwvqMUEXRJCkLuxDEnsOivF
	jOs4TXKGYZ9fK/VLh+0P43k9NXy/U/4/NOR9w7kGugfH1TDudzkBm+7GkDmjqw==
X-Gm-Gg: ASbGncty54RmjGV7jfX2NGXKwYqQax3GYhrMg1g4QFBcso7jB8f/qn2YyOPl9eyxUED
	+bwgGP+5Q/htYJv6zw2Tfah2EEHrKA/aeOcj7G1gTzaSotrVMJddJzCYcSVFbiOfUdoygG3scmc
	ncCQ1oqnJwwEuxkAJnxOf+8uAFp4RhbDOGoejx+iSGNnRQGfVTCRX+tH6X22o+pgshdSOdKylRC
	66QXtP3Z9F+LK9DMTg+EWkIQs7+eQNbt6KfALb7xC8KM8PuwnARg6U9G0BPKLo6bOVLVdEaFKqf
	PZtIGf2F0r3FOlY/tbohbCDwaqdyMWDGMrp/3Ok7ZI+msfzLHEF92kAL6mijAGRH24TkcJ+UP6u
	YyuKnOLd2cXskdGL3YVZgLxBkREvWfpuC9eIwC1N1qLbzkBk=
X-Google-Smtp-Source: AGHT+IGRbZTWvC22X7R6MpybUVtQlEi9vm+wQQ7hM+fS2BleTAKnnL9FMh3Xr4rqjJfDAkR/GVwBLA==
X-Received: by 2002:a05:620a:1d0e:b0:7d2:2833:6dff with SMTP id af79cd13be357-7d3b367bd6fmr167393485a.26.1749688772273;
        Wed, 11 Jun 2025 17:39:32 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:31 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 3/4] arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
Date: Wed, 11 Jun 2025 19:39:21 -0500
Message-ID: <20250612003924.178251-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_173933_895325_C5055FA6 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

In preparation for increasing the default VPU clocks to overdrive,
configure the nominal values first to avoid running the nominal
devices out of spec when imx8mp.dtsi is changed.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index 2ce1860b244d..f269f7a004fc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -89,4 +89,22 @@ &media_blk_ctrl {
 			       <1039500000>;
 };
 
+&vpu_g1 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
+	assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>;
+};
+
+&vpu_g2 {
+	assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
+	assigned-clock-rates = <500000000>;
+};
+
+&vpumix_blk_ctrl {
+	assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+	assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
+	assigned-clock-rates = <600000000>, <600000000>;
+};
+
 /delete-node/ &{noc_opp_table/opp-1000000000};
-- 
2.48.1


