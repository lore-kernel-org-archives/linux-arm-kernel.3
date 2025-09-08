Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6624FCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BqDeeLR0uUmM7C0k54IlZeBl9ozo62JGf6aTcx1wuY=; b=i4GdGteQgw2Yk0DX+r8bRcdUOA
	Z7+r6CToQ5ABlt1FfzrOHmUcOXW3O1eoYqEKV3f6TX8lriupAuogjF0tZN8F3z4HLN6x0zzzki1X9
	WxBLCAhga8wxKGcJuh+Pjz4m2DGf1CgufTvNdbAXVaGCpgYP7xrtSI3eR8kLiZbU/J8Gwc59anmGX
	8wHjGer82qzxOw0ewzpaqO0epZ32UPmeCXmog3i0xHatxLE4NhtXJ4uBJvLf0fc5OPNw1szQeoT5r
	UVVSHJKLuo6WJO3MMtS+LMyBnLyJAKHS3XvByd8gbS1B1MQ3WKHacDLdrMKWZ+RWhlMjECzKdCurO
	/hFmy7Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbCc-0000000H5pc-10Jf;
	Mon, 08 Sep 2025 12:42:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaBh-0000000GiES-3ltB;
	Mon, 08 Sep 2025 11:37:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso3354866f8f.0;
        Mon, 08 Sep 2025 04:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757331452; x=1757936252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BqDeeLR0uUmM7C0k54IlZeBl9ozo62JGf6aTcx1wuY=;
        b=gx70rZOigAfMPYHoRjRjRKAIf4HZD4rNW61KseO732SZrw0CpSmNm9+bGFSx9iXMwt
         LdElZ75OF2yUiG78jfpZcB4kAkib5L17w1MZbjN98MGh4Z7boFA0vedXD3QVqkTAJPID
         zRaJ/McvAEtzOihIwBUWSUofjudGLlHBOyx+DfjJuwypRJQnYdqEa9kyBYCS/oTZ3gQt
         zZSUu24LpvF5exEmzRKN7fvkrMDBER66dX+BA3m0Lwaj83lDt1gjlD0yKpzYd38lwi5f
         i2sCmFIBwEJyzPx6zGD8pmOsNApMskXCwpiVTSyLKDlKZlKUJgxDZZIzdxrixpmXamn8
         2rLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757331452; x=1757936252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BqDeeLR0uUmM7C0k54IlZeBl9ozo62JGf6aTcx1wuY=;
        b=uG5eYClosI+ye8PQhxH/6ntTN6M01ign92BjI8iktS/kCmISYDELhQW+RpUqCHyqly
         lQn6rCF90YvxbnWRQ5f5q2x/zZ1+RJ8F88Y/oPczA2ODq2JaiuRyhBS02EkOnYiRoa5J
         uegBMbezJws6vst4OofpRLG54ijXTMw/8UllatwenfVAIfCkllv9pMKm2IQ0bW9Gald/
         1a9sw56bEfHv5CyRoMhcNu0Nxyx1n7iMZIo/SlVfY5j1nH5rE4aC3ZVGl9MStMBX6qjn
         3URJST4QUbLDXD4qXff592R9LfSty9vzauVKfQ24acYT1ou+8ZlWw05C+ob4Sj4Bocl/
         0nfg==
X-Forwarded-Encrypted: i=1; AJvYcCUEMvrxyYfcp2x/rn83+XVBbb+291gfoYn3sM95GlNdByNZDJlq0F8tB5tk7V4lc0nHQAejkuaB7PavR8W8bwA=@lists.infradead.org, AJvYcCUpO2l9Iw8AxBQJ4ea6XoHJk1sRskQH04Tq1UVH5hTS35nMxj6zppxR6DuywGk3S/I/aHVOSF+wAiqPnvYw2NoD@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt3wBIGiA7DfOqw81Cny7F9Yr/i1A1eG8ndSmKiX6r/fF0lqsg
	01MQ9D94HWdLVIkU/9O1UA7+iSW+xhscWiAYH3EGe5Z4TnMTdrUQRhXVhWsVEw==
X-Gm-Gg: ASbGncv+RY000obufdeV0V9OSKxTQ5tfH2uKmexS2vmcADTCFFUdX9Smmm/+xW7hzW9
	cMxrGc14hzSZoodh3PIz9iO8IXN5P+hI7YIucmBz92p8+DupEgmvAaJhlY+Uoty9ri11TxE6rja
	JFcd47poMMvKAv3ifj3s7TddhpmbI/ujz3/zo5+/5GGnWhZFift+j4RiH5NVuK901fGEaizFhKa
	rwfgPkNarZTqZb6iqIQd5miS5bCSptQ2iFwRB2J84gUfNR0H7e0Sskigczb1uhBObfUlWNHHozv
	/aJ/5GatsxIDxdPF5T6H7lHaMjpFoqi70Vx/U2eHfnmyP+gYMVvFTSo1QlJV++lAJ+tqpakt10/
	eSQ8O5Kg+LFQG9oXi0negr8Tf+JkjX81+oAZ/0g9vnAa19j7tpGmHYbrvBC+zMr2WzlaJa1BtJ8
	GgCHmEXg==
X-Google-Smtp-Source: AGHT+IFrUOxvTJ9AYf/YKS8fAGRSCkemugao7SAvxFhArk8O3Bfk9qqs7HkwmxNa2NacfsANFOZUEQ==
X-Received: by 2002:a05:6000:178e:b0:3d8:3eca:a978 with SMTP id ffacd0b85a97d-3e642e99b04mr5127314f8f.21.1757331451640;
        Mon, 08 Sep 2025 04:37:31 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab14esm476249525e9.21.2025.09.08.04.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 04:37:31 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Date: Mon,  8 Sep 2025 13:37:19 +0200
Message-ID: <20250908113723.31559-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_043733_936457_415C8147 
X-CRM114-Status: GOOD (  15.39  )
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

With further testing with an attached Aeonsemi it was discovered that
the pinctrl MDIO function applied the wrong bitmask. The error was
probably caused by the confusing documentation related to these bits.

Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
is never actually set but instead it's set force enable to the 2 GPIO
(gpio 1-2) for MDC and MDIO pin.

Applying this configuration permits correct functionality of any
externally attached PHY.

Cc: stable@vger.kernel.org
Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index f7f8fd2f35fc..d89da9581c55 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -108,6 +108,9 @@
 #define JTAG_UDI_EN_MASK			BIT(4)
 #define JTAG_DFD_EN_MASK			BIT(3)
 
+#define REG_FORCE_GPIO_EN			0x0228
+#define FORCE_GPIO_EN(n)			BIT(n)
+
 /* LED MAP */
 #define REG_LAN_LED0_MAPPING			0x027c
 #define REG_LAN_LED1_MAPPING			0x0280
@@ -718,17 +721,17 @@ static const struct airoha_pinctrl_func_group mdio_func_group[] = {
 	{
 		.name = "mdio",
 		.regmap[0] = {
-			AIROHA_FUNC_MUX,
-			REG_GPIO_PON_MODE,
-			GPIO_SGMII_MDIO_MODE_MASK,
-			GPIO_SGMII_MDIO_MODE_MASK
-		},
-		.regmap[1] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_2ND_I2C_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE,
 			GPIO_MDC_IO_MASTER_MODE_MODE
 		},
+		.regmap[1] = {
+			AIROHA_FUNC_MUX,
+			REG_FORCE_GPIO_EN,
+			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2),
+			FORCE_GPIO_EN(1) | FORCE_GPIO_EN(2)
+		},
 		.regmap_size = 2,
 	},
 };
-- 
2.51.0


