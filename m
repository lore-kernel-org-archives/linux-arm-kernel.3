Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C721DEFCE5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 03:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d5yl02iJv/wkdm4hWnCdO+qs5aDrcJeSjvUW0fTJuE=; b=pnSIJVsfBDJlbTHN11L+hi3mp8
	1lHbZ2O9b2jRfg1blzRicdw8S/q/VMHSKlALyCZtC5MCksUx/gIXb/l4PXTaJrTKaNo4woohYGvgQ
	MNqIKjE78vS09zTmnhfTlwoZKkGb0UYOCe6AybVZ7qLc6x8ZIo/sXIpakotBkbzFqxRNFYMfe0xSH
	0EQMB/ke3XFxpc7ND4OYJbLqmPFkeZ4qkrPWfqXI+6PW+4bRHJPtQs6FCIsuXWKdBPhg/JT6ymZnz
	UxN3pcgGWW5f/FYxFD8FK3LcX7IR46K3pZZnYhShDu+z7krS60SndsHDG1iWtcaI1jrzPCefiUldD
	acMzPTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzTe-00000000r6k-41Fp;
	Thu, 05 Mar 2026 03:34:18 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxzTa-00000000r4m-3Nxg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 03:34:16 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-506c00df428so66314871cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772681653; x=1773286453; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d5yl02iJv/wkdm4hWnCdO+qs5aDrcJeSjvUW0fTJuE=;
        b=NTZBOpILAt71nnvX6zWSfqgsGPVbJVAegMIs2QAmFehd5B5QU8fs5l0jQQQ6KfCDwI
         yEX98YfFMhyB9pAFezrjfalocSQsUJzmiIhNbJPT1aIlwxeAjXXmRimF5IoVoZdVXkov
         38cH8eDcSwTNNzoP7a8MPzvBgMNETXiSXwPeAIyDL4lKcet7oRvVE3jO2vtLTKDdTTLk
         598lJZtgqYDFFEFXYP1fiUQO9LDWt2JDpq9v9XWvp0TMee6JJSYyVajZTBgoiApEzaLN
         +Hsdr4GnNtifQen4g1/C6whtTvrdnKmkaTeUvJj5IsarTf9GnD1BJxHoR9KKI7NUH588
         MBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772681653; x=1773286453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d5yl02iJv/wkdm4hWnCdO+qs5aDrcJeSjvUW0fTJuE=;
        b=Xc9hAytpvC2k47tFSKCcs6M1SXifK9DSmbRwjYuDJaBA+r9F9D0Y8r1xVfZFKt79xX
         fVxep8nzp9kIg67UWaRkeAgiPMSV5k+EzRj4dBlYkX06FEiX9iZjhI5gdoPSpTzxR5Vm
         LJbWt1HjIjgw+usCZS5SiygTzC5X7p7J5corLqExQS/1PrV/s8XiI88VvQ0AodFGkfdW
         bbIKWJVYaXZfBgphG8AYHKoCX5Y0tmdAgF2YRpgJ4HZhQA557HmZtt+Rp4qd+3xzzNsu
         mfOPIW6IBKe3TX9VX8tLrQzGA/3RmgbYogO5/GE3VaGxDpfYQWRpasizlOXj3n/GKdJt
         W1UA==
X-Forwarded-Encrypted: i=1; AJvYcCUnZxiI+rbjc08pZdQ1pNEfAKdE4wudSwx2iI2OWAu7Bnl2Ftczb69Qf2u2KksGZW08dvCDTC63gmklQkqSnTqU@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDTfwb9bP3kcUvzRnfYYV3FMmR9jOWMp96T0mhtH9kh6VEZZj
	V24hgpK4zwAMWBD9+cjNch/rA03vxHsU+i+T2lRoSslk5OxdlUX16g76
X-Gm-Gg: ATEYQzwQZb934Fv3zvd/W21tNVxB5f/097iXJ4QxU8IcwTs8voG2n2isPEJaRbSrqbQ
	o8jSpBf63d2M7coiOW8EhnkzjFHiXT7H3LZalEJUzkBGKeZUzGh5Hk6V5+ur9CxE5HuwRikk0Lu
	CGGHfnQcQxgrHHX6ztjXq3csDbEzvNTnfCsP6YwaZHynmr6/iYH4/yku2y4IjRDw8ZqKScGs1iN
	ekK9ZUylywPnlqlR+GM+Z/gal9obR/er4gq8WywoKIJqBNgq2FM/Wp4WNV7FhkeWWOmzjD1+1l9
	BPyeIxu5B32DiBN8v+w3D6417i6B2EaUDGlkwR8gKRmwsti+u3hWIXnp59PUO0sDpI62U4VsFDH
	gUpgWt/g5dN5oUssdTfZF/u1TJJDeHlYr1vPlRAw3Fjny8VfZdGEm39AqeBiZcpzT/Kxiz/sGSn
	abG2E1ojbo7k9Ni3KE+zNa3mszPGo=
X-Received: by 2002:ac8:5a0c:0:b0:501:4b10:aa9e with SMTP id d75a77b69052e-508db2a632bmr59254511cf.13.1772681653433;
        Wed, 04 Mar 2026 19:34:13 -0800 (PST)
Received: from [172.17.0.2] ([134.128.219.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630b6sm190667601cf.7.2026.03.04.19.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 19:34:13 -0800 (PST)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Thu, 05 Mar 2026 03:34:08 +0000
Subject: [PATCH v2 2/2] pmdomain: sunxi: Add support for A733 to Allwinner
 PCK600 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-b4-pck600-a733-v2-2-ba6bbed7d253@gmail.com>
References: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
In-Reply-To: <20260305-b4-pck600-a733-v2-0-ba6bbed7d253@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_193414_862008_86CFEF73 
X-CRM114-Status: GOOD (  16.73  )
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
customized version of ARM PCK-600 power controller. It shares the same
BSP driver with A523. According to the BSP provided by Radxa, unlike
A523, it doesn't require reset, as well as a different pair of delay
values.

Make reset optional in the sunxi pck600 driver and add support
for A733.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/pmdomain/sunxi/sun55i-pck600.c | 35 ++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/sunxi/sun55i-pck600.c b/drivers/pmdomain/sunxi/sun55i-pck600.c
index c7ab51514531..1d47bbd35ced 100644
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
@@ -206,7 +209,27 @@ static const struct sunxi_pck600_desc sun55i_a523_pck600_desc = {
 	.device_ctrl1_delay = 0xffff,
 	.logic_power_switch0_delay = 0x8080808,
 	.logic_power_switch1_delay = 0x808,
-	.off2on_delay = 0x8
+	.off2on_delay = 0x8,
+	.has_rst_clk = true,
+};
+
+static const char * const sun60i_a733_pck600_pd_names[] = {
+	"VI", "DE_SYS", "VE_DEC", "VE_ENC", "NPU",
+	"GPU_TOP", "GPU_CORE", "PCIE", "USB2", "VO", "VO1"
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
@@ -214,6 +237,10 @@ static const struct of_device_id sunxi_pck600_of_match[] = {
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


