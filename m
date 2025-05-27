Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93942C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3NADvkga3zsMnIDaERP8P2SH/kTuoL1CAc5aDMyKmc=; b=BmMgHL7twbwcCfye75hiOxF2or
	NS+Tw9RvBsv4fJEUBhTHk4NdWUIrffnlunobJ4lFfQ+dCCxmtgMyTuFvvfRjTzmHy34ZYbOLY+Wki
	WyhoW9KN+e4XySm80naZwFBUQexBVMwK/axhSxmT47ZWI9DnLecb7qbZZSl1PYEv4kvBrQyhE+BA/
	8gN1v94CXnFc8VvTPCedLW5jjKpeLWgOyMqDFEBEXC8oDbhGa8NSh/9DXlsa6AGZbNmd/DIeqAJ30
	8tBre646Xhpfx2GAQ76d90IaxOmkPjOhrSBkXAMe+498qtBa2Kia2UfvFkd8A1dJJM1MqOzLCSDtA
	g7TfVYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2ls-0000000BiaG-14kp;
	Tue, 27 May 2025 22:27:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK2fX-0000000Bh2S-0Xen;
	Tue, 27 May 2025 22:21:12 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-442ea341570so28458785e9.1;
        Tue, 27 May 2025 15:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748384469; x=1748989269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3NADvkga3zsMnIDaERP8P2SH/kTuoL1CAc5aDMyKmc=;
        b=ZU5H6J4fjB8cDfaPhrtoxLUS16D7S3mLP8myFqP/rw24N/lyBd69pEp/GQ+qlykmry
         7HsLI9GiUsYARx5e8M/w0sBIeeOHT4Gug+aZ44bDFc3jo7FGqcvU1pBwyxr+cVK+bKZe
         sy6fptUCnAEALb7k1i1hvAEFjm2tAwKaT6SuLTf8KMwVX/CBGaiD+wqWFdcfo56tHGiq
         /03XqBQl7NxrZWZ/pyEsYnqAzzBGnwNC23Tmh70ZzWFwPoWpWWgrmn/sYqsK2xNm5+9i
         e9GhwgL3Bd51ATMvRUcOLUuDxRVV9Cn5SiTY7ZpYVb+RH9unEKBh0uuzOll9TKV3zyCM
         8LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384469; x=1748989269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3NADvkga3zsMnIDaERP8P2SH/kTuoL1CAc5aDMyKmc=;
        b=eFTLGrDshap/WNuk4TGqWI8JJfTzqs3qM+uoiemfsOUp84WVOX0snagsAbBtIW14fb
         euFu1sAFbcTI5T4dqiMmTtqA+TY9PrjjUpXonDNaaRvUJ+XnnFqtSltRAklTUSLYhVTx
         74ac/5UMSNLHrle+FpuGa8w3xPACvtVZ7RZNWszjApea+JC+Gh9HpRkxuCYenOY1ombI
         DyjX+p2MF90W0iNLuGi3RE4phK/JYlO6GxgqDrVIS6T7PCnBqhzhqUbPYjbs6z2dFL6z
         fVcPN+xMLMdvP80b9xasQdQqUQdmKXsiveOZSIifjCUiQcRcJ0Xy88PyHPSMiXgSCGx3
         2nwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKoPIkMXSqu1dCjH8ENS/1DvVq9mxMsca/mM2CKkUQT0HQT9x/gOEPfjKv4q5vTB7LwxaJLZpSKxmlHrw3mfLu@lists.infradead.org, AJvYcCXSrTyxchwvwI3i1wLeG2OKfGLqzQHWL22J+PXfVFWv0+wC/W1sZM6ltCDWNNVz/c2petbEg8lvYDihOKORh+M=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUrFjBy9lN+/bSPGDh6uCo843wguWeFneo/12HUbgemGMp5eaW
	6bpoK2RFAOKCQOlmmgitOhA8TDne+jgoU7sKKN/ot1Z4E1DWfkovBD08
X-Gm-Gg: ASbGncsxDwE8M94U80qav9cjhyfROvRDsnJyBOAhBEOtFmYY0J2v2XUN2ywPJ53D4jn
	wHtlp30FVcXgXTIoqODoCvJiiBaHakMAP+BZr4Sjrs2EvdPnvhSTLijQlRR+n/C8HLQnxeaNPHf
	GqobmsiRf+HeRfP/UmQ0PLS3WM1yMQe5MyUwYeyrDklzRdT11elUuL7KWSujPwhrJqa5fieMhaM
	iwVMHnO2TxqmkVVor1pCJ2TmpjlyuMsc+U0ZoBCeVbB5dDfX0DeZaRThUPb3eC7EOPDM2ifbv46
	sXVQ1r/h+sA89JSzdEurTNOxcc1qHiERSs2/FSuBEXdAxT6KSwOJc2sl4wTlBofYSsR99xxfje+
	UyIKIMN41On4kMe2fDtN2
X-Google-Smtp-Source: AGHT+IHeJk9AIJsEiPsDyOdkcBclUn9Ng6cF493QMFTmIDUtcT3zRKSyDDIr4ygGErAH4I0uAPPn+g==
X-Received: by 2002:a05:6000:4284:b0:3a4:cad8:42b0 with SMTP id ffacd0b85a97d-3a4cb47e137mr11905018f8f.47.1748384469086;
        Tue, 27 May 2025 15:21:09 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4e8bc377asm233366f8f.72.2025.05.27.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 15:21:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/6] pinctrl: mediatek: airoha: generalize pins/group/function/confs handling
Date: Wed, 28 May 2025 00:20:34 +0200
Message-ID: <20250527222040.32000-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527222040.32000-1-ansuelsmth@gmail.com>
References: <20250527222040.32000-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_152111_177261_F898FD82 
X-CRM114-Status: GOOD (  14.10  )
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

In preparation for support of Airoha AN7583, generalize
pins/group/function/confs handling and move them in match_data.
Inner function will base the values on the pinctrl priv struct instead of
relying on hardcoded struct.

This permits to use different PIN data while keeping the same logic.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 569 ++++++++++++----------
 1 file changed, 319 insertions(+), 250 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 8ef7f88477aa..8af9109db992 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -30,20 +30,20 @@
 #include "../pinconf.h"
 #include "../pinmux.h"
 
-#define PINCTRL_PIN_GROUP(id)						\
-	PINCTRL_PINGROUP(#id, id##_pins, ARRAY_SIZE(id##_pins))
+#define PINCTRL_PIN_GROUP(id, table)					\
+	PINCTRL_PINGROUP(id, table##_pins, ARRAY_SIZE(table##_pins))
 
-#define PINCTRL_FUNC_DESC(id)						\
+#define PINCTRL_FUNC_DESC(id, table)					\
 	{								\
 		.desc = {						\
 			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
+				.name = id,				\
+				.groups = table##_groups,		\
+				.ngroups = ARRAY_SIZE(table##_groups),	\
 			}						\
 		},							\
-		.groups = id##_func_group,				\
-		.group_size = ARRAY_SIZE(id##_func_group),		\
+		.groups = table##_func_group,				\
+		.group_size = ARRAY_SIZE(table##_func_group),		\
 	}
 
 #define PINCTRL_CONF_DESC(p, offset, mask)				\
@@ -359,16 +359,46 @@ struct airoha_pinctrl_gpiochip {
 	u32 irq_type[AIROHA_NUM_PINS];
 };
 
+struct airoha_pinctrl_confs_info {
+	const struct airoha_pinctrl_conf *confs;
+	unsigned int num_confs;
+};
+
+enum airoha_pinctrl_confs_type {
+	AIROHA_PINCTRL_CONFS_PULLUP,
+	AIROHA_PINCTRL_CONFS_PULLDOWN,
+	AIROHA_PINCTRL_CONFS_DRIVE_E2,
+	AIROHA_PINCTRL_CONFS_DRIVE_E4,
+	AIROHA_PINCTRL_CONFS_PCIE_RST_OD,
+
+	AIROHA_PINCTRL_CONFS_MAX,
+};
+
 struct airoha_pinctrl {
 	struct pinctrl_dev *ctrl;
 
+	struct pinctrl_desc desc;
+	const struct pingroup *grps;
+	const struct airoha_pinctrl_func *funcs;
+	const struct airoha_pinctrl_confs_info *confs_info;
+
 	struct regmap *chip_scu;
 	struct regmap *regmap;
 
 	struct airoha_pinctrl_gpiochip gpiochip;
 };
 
-static struct pinctrl_pin_desc airoha_pinctrl_pins[] = {
+struct airoha_pinctrl_match_data {
+	const struct pinctrl_pin_desc *pins;
+	const unsigned int num_pins;
+	const struct pingroup *grps;
+	const unsigned int num_grps;
+	const struct airoha_pinctrl_func *funcs;
+	const unsigned int num_funcs;
+	const struct airoha_pinctrl_confs_info confs_info[AIROHA_PINCTRL_CONFS_MAX];
+};
+
+static struct pinctrl_pin_desc en7581_pinctrl_pins[] = {
 	PINCTRL_PIN(0, "uart1_txd"),
 	PINCTRL_PIN(1, "uart1_rxd"),
 	PINCTRL_PIN(2, "i2c_scl"),
@@ -429,172 +459,172 @@ static struct pinctrl_pin_desc airoha_pinctrl_pins[] = {
 	PINCTRL_PIN(63, "pcie_reset2"),
 };
 
-static const int pon_pins[] = { 49, 50, 51, 52, 53, 54 };
-static const int pon_tod_1pps_pins[] = { 46 };
-static const int gsw_tod_1pps_pins[] = { 46 };
-static const int sipo_pins[] = { 16, 17 };
-static const int sipo_rclk_pins[] = { 16, 17, 43 };
-static const int mdio_pins[] = { 14, 15 };
-static const int uart2_pins[] = { 48, 55 };
-static const int uart2_cts_rts_pins[] = { 46, 47 };
-static const int hsuart_pins[] = { 28, 29 };
-static const int hsuart_cts_rts_pins[] = { 26, 27 };
-static const int uart4_pins[] = { 38, 39 };
-static const int uart5_pins[] = { 18, 19 };
-static const int i2c0_pins[] = { 2, 3 };
-static const int i2c1_pins[] = { 14, 15 };
-static const int jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
-static const int jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
-static const int i2s_pins[] = { 26, 27, 28, 29 };
-static const int pcm1_pins[] = { 22, 23, 24, 25 };
-static const int pcm2_pins[] = { 18, 19, 20, 21 };
-static const int spi_quad_pins[] = { 32, 33 };
-static const int spi_pins[] = { 4, 5, 6, 7 };
-static const int spi_cs1_pins[] = { 34 };
-static const int pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
-static const int pcm_spi_int_pins[] = { 14 };
-static const int pcm_spi_rst_pins[] = { 15 };
-static const int pcm_spi_cs1_pins[] = { 43 };
-static const int pcm_spi_cs2_pins[] = { 40 };
-static const int pcm_spi_cs2_p128_pins[] = { 40 };
-static const int pcm_spi_cs2_p156_pins[] = { 40 };
-static const int pcm_spi_cs3_pins[] = { 41 };
-static const int pcm_spi_cs4_pins[] = { 42 };
-static const int emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
-static const int pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
-static const int gpio0_pins[] = { 13 };
-static const int gpio1_pins[] = { 14 };
-static const int gpio2_pins[] = { 15 };
-static const int gpio3_pins[] = { 16 };
-static const int gpio4_pins[] = { 17 };
-static const int gpio5_pins[] = { 18 };
-static const int gpio6_pins[] = { 19 };
-static const int gpio7_pins[] = { 20 };
-static const int gpio8_pins[] = { 21 };
-static const int gpio9_pins[] = { 22 };
-static const int gpio10_pins[] = { 23 };
-static const int gpio11_pins[] = { 24 };
-static const int gpio12_pins[] = { 25 };
-static const int gpio13_pins[] = { 26 };
-static const int gpio14_pins[] = { 27 };
-static const int gpio15_pins[] = { 28 };
-static const int gpio16_pins[] = { 29 };
-static const int gpio17_pins[] = { 30 };
-static const int gpio18_pins[] = { 31 };
-static const int gpio19_pins[] = { 32 };
-static const int gpio20_pins[] = { 33 };
-static const int gpio21_pins[] = { 34 };
-static const int gpio22_pins[] = { 35 };
-static const int gpio23_pins[] = { 36 };
-static const int gpio24_pins[] = { 37 };
-static const int gpio25_pins[] = { 38 };
-static const int gpio26_pins[] = { 39 };
-static const int gpio27_pins[] = { 40 };
-static const int gpio28_pins[] = { 41 };
-static const int gpio29_pins[] = { 42 };
-static const int gpio30_pins[] = { 43 };
-static const int gpio31_pins[] = { 44 };
-static const int gpio33_pins[] = { 46 };
-static const int gpio34_pins[] = { 47 };
-static const int gpio35_pins[] = { 48 };
-static const int gpio36_pins[] = { 49 };
-static const int gpio37_pins[] = { 50 };
-static const int gpio38_pins[] = { 51 };
-static const int gpio39_pins[] = { 52 };
-static const int gpio40_pins[] = { 53 };
-static const int gpio41_pins[] = { 54 };
-static const int gpio42_pins[] = { 55 };
-static const int gpio43_pins[] = { 56 };
-static const int gpio44_pins[] = { 57 };
-static const int gpio45_pins[] = { 58 };
-static const int gpio46_pins[] = { 59 };
-static const int pcie_reset0_pins[] = { 61 };
-static const int pcie_reset1_pins[] = { 62 };
-static const int pcie_reset2_pins[] = { 63 };
-
-static const struct pingroup airoha_pinctrl_groups[] = {
-	PINCTRL_PIN_GROUP(pon),
-	PINCTRL_PIN_GROUP(pon_tod_1pps),
-	PINCTRL_PIN_GROUP(gsw_tod_1pps),
-	PINCTRL_PIN_GROUP(sipo),
-	PINCTRL_PIN_GROUP(sipo_rclk),
-	PINCTRL_PIN_GROUP(mdio),
-	PINCTRL_PIN_GROUP(uart2),
-	PINCTRL_PIN_GROUP(uart2_cts_rts),
-	PINCTRL_PIN_GROUP(hsuart),
-	PINCTRL_PIN_GROUP(hsuart_cts_rts),
-	PINCTRL_PIN_GROUP(uart4),
-	PINCTRL_PIN_GROUP(uart5),
-	PINCTRL_PIN_GROUP(i2c0),
-	PINCTRL_PIN_GROUP(i2c1),
-	PINCTRL_PIN_GROUP(jtag_udi),
-	PINCTRL_PIN_GROUP(jtag_dfd),
-	PINCTRL_PIN_GROUP(i2s),
-	PINCTRL_PIN_GROUP(pcm1),
-	PINCTRL_PIN_GROUP(pcm2),
-	PINCTRL_PIN_GROUP(spi),
-	PINCTRL_PIN_GROUP(spi_quad),
-	PINCTRL_PIN_GROUP(spi_cs1),
-	PINCTRL_PIN_GROUP(pcm_spi),
-	PINCTRL_PIN_GROUP(pcm_spi_int),
-	PINCTRL_PIN_GROUP(pcm_spi_rst),
-	PINCTRL_PIN_GROUP(pcm_spi_cs1),
-	PINCTRL_PIN_GROUP(pcm_spi_cs2_p128),
-	PINCTRL_PIN_GROUP(pcm_spi_cs2_p156),
-	PINCTRL_PIN_GROUP(pcm_spi_cs2),
-	PINCTRL_PIN_GROUP(pcm_spi_cs3),
-	PINCTRL_PIN_GROUP(pcm_spi_cs4),
-	PINCTRL_PIN_GROUP(emmc),
-	PINCTRL_PIN_GROUP(pnand),
-	PINCTRL_PIN_GROUP(gpio0),
-	PINCTRL_PIN_GROUP(gpio1),
-	PINCTRL_PIN_GROUP(gpio2),
-	PINCTRL_PIN_GROUP(gpio3),
-	PINCTRL_PIN_GROUP(gpio4),
-	PINCTRL_PIN_GROUP(gpio5),
-	PINCTRL_PIN_GROUP(gpio6),
-	PINCTRL_PIN_GROUP(gpio7),
-	PINCTRL_PIN_GROUP(gpio8),
-	PINCTRL_PIN_GROUP(gpio9),
-	PINCTRL_PIN_GROUP(gpio10),
-	PINCTRL_PIN_GROUP(gpio11),
-	PINCTRL_PIN_GROUP(gpio12),
-	PINCTRL_PIN_GROUP(gpio13),
-	PINCTRL_PIN_GROUP(gpio14),
-	PINCTRL_PIN_GROUP(gpio15),
-	PINCTRL_PIN_GROUP(gpio16),
-	PINCTRL_PIN_GROUP(gpio17),
-	PINCTRL_PIN_GROUP(gpio18),
-	PINCTRL_PIN_GROUP(gpio19),
-	PINCTRL_PIN_GROUP(gpio20),
-	PINCTRL_PIN_GROUP(gpio21),
-	PINCTRL_PIN_GROUP(gpio22),
-	PINCTRL_PIN_GROUP(gpio23),
-	PINCTRL_PIN_GROUP(gpio24),
-	PINCTRL_PIN_GROUP(gpio25),
-	PINCTRL_PIN_GROUP(gpio26),
-	PINCTRL_PIN_GROUP(gpio27),
-	PINCTRL_PIN_GROUP(gpio28),
-	PINCTRL_PIN_GROUP(gpio29),
-	PINCTRL_PIN_GROUP(gpio30),
-	PINCTRL_PIN_GROUP(gpio31),
-	PINCTRL_PIN_GROUP(gpio33),
-	PINCTRL_PIN_GROUP(gpio34),
-	PINCTRL_PIN_GROUP(gpio35),
-	PINCTRL_PIN_GROUP(gpio36),
-	PINCTRL_PIN_GROUP(gpio37),
-	PINCTRL_PIN_GROUP(gpio38),
-	PINCTRL_PIN_GROUP(gpio39),
-	PINCTRL_PIN_GROUP(gpio40),
-	PINCTRL_PIN_GROUP(gpio41),
-	PINCTRL_PIN_GROUP(gpio42),
-	PINCTRL_PIN_GROUP(gpio43),
-	PINCTRL_PIN_GROUP(gpio44),
-	PINCTRL_PIN_GROUP(gpio45),
-	PINCTRL_PIN_GROUP(gpio46),
-	PINCTRL_PIN_GROUP(pcie_reset0),
-	PINCTRL_PIN_GROUP(pcie_reset1),
-	PINCTRL_PIN_GROUP(pcie_reset2),
+static const int en7581_pon_pins[] = { 49, 50, 51, 52, 53, 54 };
+static const int en7581_pon_tod_1pps_pins[] = { 46 };
+static const int en7581_gsw_tod_1pps_pins[] = { 46 };
+static const int en7581_sipo_pins[] = { 16, 17 };
+static const int en7581_sipo_rclk_pins[] = { 16, 17, 43 };
+static const int en7581_mdio_pins[] = { 14, 15 };
+static const int en7581_uart2_pins[] = { 48, 55 };
+static const int en7581_uart2_cts_rts_pins[] = { 46, 47 };
+static const int en7581_hsuart_pins[] = { 28, 29 };
+static const int en7581_hsuart_cts_rts_pins[] = { 26, 27 };
+static const int en7581_uart4_pins[] = { 38, 39 };
+static const int en7581_uart5_pins[] = { 18, 19 };
+static const int en7581_i2c0_pins[] = { 2, 3 };
+static const int en7581_i2c1_pins[] = { 14, 15 };
+static const int en7581_jtag_udi_pins[] = { 16, 17, 18, 19, 20 };
+static const int en7581_jtag_dfd_pins[] = { 16, 17, 18, 19, 20 };
+static const int en7581_i2s_pins[] = { 26, 27, 28, 29 };
+static const int en7581_pcm1_pins[] = { 22, 23, 24, 25 };
+static const int en7581_pcm2_pins[] = { 18, 19, 20, 21 };
+static const int en7581_spi_quad_pins[] = { 32, 33 };
+static const int en7581_spi_pins[] = { 4, 5, 6, 7 };
+static const int en7581_spi_cs1_pins[] = { 34 };
+static const int en7581_pcm_spi_pins[] = { 18, 19, 20, 21, 22, 23, 24, 25 };
+static const int en7581_pcm_spi_int_pins[] = { 14 };
+static const int en7581_pcm_spi_rst_pins[] = { 15 };
+static const int en7581_pcm_spi_cs1_pins[] = { 43 };
+static const int en7581_pcm_spi_cs2_pins[] = { 40 };
+static const int en7581_pcm_spi_cs2_p128_pins[] = { 40 };
+static const int en7581_pcm_spi_cs2_p156_pins[] = { 40 };
+static const int en7581_pcm_spi_cs3_pins[] = { 41 };
+static const int en7581_pcm_spi_cs4_pins[] = { 42 };
+static const int en7581_emmc_pins[] = { 4, 5, 6, 30, 31, 32, 33, 34, 35, 36, 37 };
+static const int en7581_pnand_pins[] = { 4, 5, 6, 7, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42 };
+static const int en7581_gpio0_pins[] = { 13 };
+static const int en7581_gpio1_pins[] = { 14 };
+static const int en7581_gpio2_pins[] = { 15 };
+static const int en7581_gpio3_pins[] = { 16 };
+static const int en7581_gpio4_pins[] = { 17 };
+static const int en7581_gpio5_pins[] = { 18 };
+static const int en7581_gpio6_pins[] = { 19 };
+static const int en7581_gpio7_pins[] = { 20 };
+static const int en7581_gpio8_pins[] = { 21 };
+static const int en7581_gpio9_pins[] = { 22 };
+static const int en7581_gpio10_pins[] = { 23 };
+static const int en7581_gpio11_pins[] = { 24 };
+static const int en7581_gpio12_pins[] = { 25 };
+static const int en7581_gpio13_pins[] = { 26 };
+static const int en7581_gpio14_pins[] = { 27 };
+static const int en7581_gpio15_pins[] = { 28 };
+static const int en7581_gpio16_pins[] = { 29 };
+static const int en7581_gpio17_pins[] = { 30 };
+static const int en7581_gpio18_pins[] = { 31 };
+static const int en7581_gpio19_pins[] = { 32 };
+static const int en7581_gpio20_pins[] = { 33 };
+static const int en7581_gpio21_pins[] = { 34 };
+static const int en7581_gpio22_pins[] = { 35 };
+static const int en7581_gpio23_pins[] = { 36 };
+static const int en7581_gpio24_pins[] = { 37 };
+static const int en7581_gpio25_pins[] = { 38 };
+static const int en7581_gpio26_pins[] = { 39 };
+static const int en7581_gpio27_pins[] = { 40 };
+static const int en7581_gpio28_pins[] = { 41 };
+static const int en7581_gpio29_pins[] = { 42 };
+static const int en7581_gpio30_pins[] = { 43 };
+static const int en7581_gpio31_pins[] = { 44 };
+static const int en7581_gpio33_pins[] = { 46 };
+static const int en7581_gpio34_pins[] = { 47 };
+static const int en7581_gpio35_pins[] = { 48 };
+static const int en7581_gpio36_pins[] = { 49 };
+static const int en7581_gpio37_pins[] = { 50 };
+static const int en7581_gpio38_pins[] = { 51 };
+static const int en7581_gpio39_pins[] = { 52 };
+static const int en7581_gpio40_pins[] = { 53 };
+static const int en7581_gpio41_pins[] = { 54 };
+static const int en7581_gpio42_pins[] = { 55 };
+static const int en7581_gpio43_pins[] = { 56 };
+static const int en7581_gpio44_pins[] = { 57 };
+static const int en7581_gpio45_pins[] = { 58 };
+static const int en7581_gpio46_pins[] = { 59 };
+static const int en7581_pcie_reset0_pins[] = { 61 };
+static const int en7581_pcie_reset1_pins[] = { 62 };
+static const int en7581_pcie_reset2_pins[] = { 63 };
+
+static const struct pingroup en7581_pinctrl_groups[] = {
+	PINCTRL_PIN_GROUP("pon", en7581_pon),
+	PINCTRL_PIN_GROUP("pon_tod_1pps", en7581_pon_tod_1pps),
+	PINCTRL_PIN_GROUP("gsw_tod_1pps", en7581_gsw_tod_1pps),
+	PINCTRL_PIN_GROUP("sipo", en7581_sipo),
+	PINCTRL_PIN_GROUP("sipo_rclk", en7581_sipo_rclk),
+	PINCTRL_PIN_GROUP("mdio", en7581_mdio),
+	PINCTRL_PIN_GROUP("uart2", en7581_uart2),
+	PINCTRL_PIN_GROUP("uart2_cts_rts", en7581_uart2_cts_rts),
+	PINCTRL_PIN_GROUP("hsuart", en7581_hsuart),
+	PINCTRL_PIN_GROUP("hsuart_cts_rts", en7581_hsuart_cts_rts),
+	PINCTRL_PIN_GROUP("uart4", en7581_uart4),
+	PINCTRL_PIN_GROUP("uart5", en7581_uart5),
+	PINCTRL_PIN_GROUP("i2c0", en7581_i2c0),
+	PINCTRL_PIN_GROUP("i2c1", en7581_i2c1),
+	PINCTRL_PIN_GROUP("jtag_udi", en7581_jtag_udi),
+	PINCTRL_PIN_GROUP("jtag_dfd", en7581_jtag_dfd),
+	PINCTRL_PIN_GROUP("i2s", en7581_i2s),
+	PINCTRL_PIN_GROUP("pcm1", en7581_pcm1),
+	PINCTRL_PIN_GROUP("pcm2", en7581_pcm2),
+	PINCTRL_PIN_GROUP("spi", en7581_spi),
+	PINCTRL_PIN_GROUP("spi_quad", en7581_spi_quad),
+	PINCTRL_PIN_GROUP("spi_cs1", en7581_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi", en7581_pcm_spi),
+	PINCTRL_PIN_GROUP("pcm_spi_int", en7581_pcm_spi_int),
+	PINCTRL_PIN_GROUP("pcm_spi_rst", en7581_pcm_spi_rst),
+	PINCTRL_PIN_GROUP("pcm_spi_cs1", en7581_pcm_spi_cs1),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p128", en7581_pcm_spi_cs2_p128),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2_p156", en7581_pcm_spi_cs2_p156),
+	PINCTRL_PIN_GROUP("pcm_spi_cs2", en7581_pcm_spi_cs2),
+	PINCTRL_PIN_GROUP("pcm_spi_cs3", en7581_pcm_spi_cs3),
+	PINCTRL_PIN_GROUP("pcm_spi_cs4", en7581_pcm_spi_cs4),
+	PINCTRL_PIN_GROUP("emmc", en7581_emmc),
+	PINCTRL_PIN_GROUP("pnand", en7581_pnand),
+	PINCTRL_PIN_GROUP("gpio0", en7581_gpio0),
+	PINCTRL_PIN_GROUP("gpio1", en7581_gpio1),
+	PINCTRL_PIN_GROUP("gpio2", en7581_gpio2),
+	PINCTRL_PIN_GROUP("gpio3", en7581_gpio3),
+	PINCTRL_PIN_GROUP("gpio4", en7581_gpio4),
+	PINCTRL_PIN_GROUP("gpio5", en7581_gpio5),
+	PINCTRL_PIN_GROUP("gpio6", en7581_gpio6),
+	PINCTRL_PIN_GROUP("gpio7", en7581_gpio7),
+	PINCTRL_PIN_GROUP("gpio8", en7581_gpio8),
+	PINCTRL_PIN_GROUP("gpio9", en7581_gpio9),
+	PINCTRL_PIN_GROUP("gpio10", en7581_gpio10),
+	PINCTRL_PIN_GROUP("gpio11", en7581_gpio11),
+	PINCTRL_PIN_GROUP("gpio12", en7581_gpio12),
+	PINCTRL_PIN_GROUP("gpio13", en7581_gpio13),
+	PINCTRL_PIN_GROUP("gpio14", en7581_gpio14),
+	PINCTRL_PIN_GROUP("gpio15", en7581_gpio15),
+	PINCTRL_PIN_GROUP("gpio16", en7581_gpio16),
+	PINCTRL_PIN_GROUP("gpio17", en7581_gpio17),
+	PINCTRL_PIN_GROUP("gpio18", en7581_gpio18),
+	PINCTRL_PIN_GROUP("gpio19", en7581_gpio19),
+	PINCTRL_PIN_GROUP("gpio20", en7581_gpio20),
+	PINCTRL_PIN_GROUP("gpio21", en7581_gpio21),
+	PINCTRL_PIN_GROUP("gpio22", en7581_gpio22),
+	PINCTRL_PIN_GROUP("gpio23", en7581_gpio23),
+	PINCTRL_PIN_GROUP("gpio24", en7581_gpio24),
+	PINCTRL_PIN_GROUP("gpio25", en7581_gpio25),
+	PINCTRL_PIN_GROUP("gpio26", en7581_gpio26),
+	PINCTRL_PIN_GROUP("gpio27", en7581_gpio27),
+	PINCTRL_PIN_GROUP("gpio28", en7581_gpio28),
+	PINCTRL_PIN_GROUP("gpio29", en7581_gpio29),
+	PINCTRL_PIN_GROUP("gpio30", en7581_gpio30),
+	PINCTRL_PIN_GROUP("gpio31", en7581_gpio31),
+	PINCTRL_PIN_GROUP("gpio33", en7581_gpio33),
+	PINCTRL_PIN_GROUP("gpio34", en7581_gpio34),
+	PINCTRL_PIN_GROUP("gpio35", en7581_gpio35),
+	PINCTRL_PIN_GROUP("gpio36", en7581_gpio36),
+	PINCTRL_PIN_GROUP("gpio37", en7581_gpio37),
+	PINCTRL_PIN_GROUP("gpio38", en7581_gpio38),
+	PINCTRL_PIN_GROUP("gpio39", en7581_gpio39),
+	PINCTRL_PIN_GROUP("gpio40", en7581_gpio40),
+	PINCTRL_PIN_GROUP("gpio41", en7581_gpio41),
+	PINCTRL_PIN_GROUP("gpio42", en7581_gpio42),
+	PINCTRL_PIN_GROUP("gpio43", en7581_gpio43),
+	PINCTRL_PIN_GROUP("gpio44", en7581_gpio44),
+	PINCTRL_PIN_GROUP("gpio45", en7581_gpio45),
+	PINCTRL_PIN_GROUP("gpio46", en7581_gpio46),
+	PINCTRL_PIN_GROUP("pcie_reset0", en7581_pcie_reset0),
+	PINCTRL_PIN_GROUP("pcie_reset1", en7581_pcie_reset1),
+	PINCTRL_PIN_GROUP("pcie_reset2", en7581_pcie_reset2),
 };
 
 static const char *const pon_groups[] = { "pon" };
@@ -1957,33 +1987,33 @@ static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
 	},
 };
 
-static const struct airoha_pinctrl_func airoha_pinctrl_funcs[] = {
-	PINCTRL_FUNC_DESC(pon),
-	PINCTRL_FUNC_DESC(tod_1pps),
-	PINCTRL_FUNC_DESC(sipo),
-	PINCTRL_FUNC_DESC(mdio),
-	PINCTRL_FUNC_DESC(uart),
-	PINCTRL_FUNC_DESC(i2c),
-	PINCTRL_FUNC_DESC(jtag),
-	PINCTRL_FUNC_DESC(pcm),
-	PINCTRL_FUNC_DESC(spi),
-	PINCTRL_FUNC_DESC(pcm_spi),
-	PINCTRL_FUNC_DESC(i2s),
-	PINCTRL_FUNC_DESC(emmc),
-	PINCTRL_FUNC_DESC(pnand),
-	PINCTRL_FUNC_DESC(pcie_reset),
-	PINCTRL_FUNC_DESC(pwm),
-	PINCTRL_FUNC_DESC(phy1_led0),
-	PINCTRL_FUNC_DESC(phy2_led0),
-	PINCTRL_FUNC_DESC(phy3_led0),
-	PINCTRL_FUNC_DESC(phy4_led0),
-	PINCTRL_FUNC_DESC(phy1_led1),
-	PINCTRL_FUNC_DESC(phy2_led1),
-	PINCTRL_FUNC_DESC(phy3_led1),
-	PINCTRL_FUNC_DESC(phy4_led1),
+static const struct airoha_pinctrl_func en7581_pinctrl_funcs[] = {
+	PINCTRL_FUNC_DESC("pon", pon),
+	PINCTRL_FUNC_DESC("tod_1pps", tod_1pps),
+	PINCTRL_FUNC_DESC("sipo", sipo),
+	PINCTRL_FUNC_DESC("mdio", mdio),
+	PINCTRL_FUNC_DESC("uart", uart),
+	PINCTRL_FUNC_DESC("i2c", i2c),
+	PINCTRL_FUNC_DESC("jtag", jtag),
+	PINCTRL_FUNC_DESC("pcm", pcm),
+	PINCTRL_FUNC_DESC("spi", spi),
+	PINCTRL_FUNC_DESC("pcm_spi", pcm_spi),
+	PINCTRL_FUNC_DESC("i2s", i2s),
+	PINCTRL_FUNC_DESC("emmc", emmc),
+	PINCTRL_FUNC_DESC("pnand", pnand),
+	PINCTRL_FUNC_DESC("pcie_reset", pcie_reset),
+	PINCTRL_FUNC_DESC("pwm", pwm),
+	PINCTRL_FUNC_DESC("phy1_led0", phy1_led0),
+	PINCTRL_FUNC_DESC("phy2_led0", phy2_led0),
+	PINCTRL_FUNC_DESC("phy3_led0", phy3_led0),
+	PINCTRL_FUNC_DESC("phy4_led0", phy4_led0),
+	PINCTRL_FUNC_DESC("phy1_led1", phy1_led1),
+	PINCTRL_FUNC_DESC("phy2_led1", phy2_led1),
+	PINCTRL_FUNC_DESC("phy3_led1", phy3_led1),
+	PINCTRL_FUNC_DESC("phy4_led1", phy4_led1),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PU, UART1_TXD_PU_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PU, UART1_RXD_PU_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PU, I2C_SDA_PU_MASK),
@@ -2044,7 +2074,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_pullup_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PU, PCIE2_RESET_PU_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_PD, UART1_TXD_PD_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_PD, UART1_RXD_PD_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_PD, I2C_SDA_PD_MASK),
@@ -2105,7 +2135,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_pulldown_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_PD, PCIE2_RESET_PD_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E2, UART1_TXD_E2_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E2, UART1_RXD_E2_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E2, I2C_SDA_E2_MASK),
@@ -2166,7 +2196,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e2_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E2, PCIE2_RESET_E2_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(0, REG_I2C_SDA_E4, UART1_TXD_E4_MASK),
 	PINCTRL_CONF_DESC(1, REG_I2C_SDA_E4, UART1_RXD_E4_MASK),
 	PINCTRL_CONF_DESC(2, REG_I2C_SDA_E4, I2C_SDA_E4_MASK),
@@ -2227,7 +2257,7 @@ static const struct airoha_pinctrl_conf airoha_pinctrl_drive_e4_conf[] = {
 	PINCTRL_CONF_DESC(63, REG_I2C_SDA_E4, PCIE2_RESET_E4_MASK),
 };
 
-static const struct airoha_pinctrl_conf airoha_pinctrl_pcie_rst_od_conf[] = {
+static const struct airoha_pinctrl_conf en7581_pinctrl_pcie_rst_od_conf[] = {
 	PINCTRL_CONF_DESC(61, REG_PCIE_RESET_OD, PCIE0_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(62, REG_PCIE_RESET_OD, PCIE1_RESET_OD_MASK),
 	PINCTRL_CONF_DESC(63, REG_PCIE_RESET_OD, PCIE2_RESET_OD_MASK),
@@ -2548,12 +2578,17 @@ airoha_pinctrl_get_conf_reg(const struct airoha_pinctrl_conf *conf,
 }
 
 static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
-				   const struct airoha_pinctrl_conf *conf,
-				   int conf_size, int pin, u32 *val)
+				   enum airoha_pinctrl_confs_type conf_type,
+				   int pin, u32 *val)
 {
+	const struct airoha_pinctrl_confs_info *confs_info;
 	const struct airoha_pinctrl_reg *reg;
 
-	reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
+	confs_info = &pinctrl->confs_info[conf_type];
+
+	reg = airoha_pinctrl_get_conf_reg(confs_info->confs,
+					  confs_info->num_confs,
+					  pin);
 	if (!reg)
 		return -EINVAL;
 
@@ -2566,12 +2601,17 @@ static int airoha_pinctrl_get_conf(struct airoha_pinctrl *pinctrl,
 }
 
 static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
-				   const struct airoha_pinctrl_conf *conf,
-				   int conf_size, int pin, u32 val)
+				   enum airoha_pinctrl_confs_type conf_type,
+				   int pin, u32 val)
 {
+	const struct airoha_pinctrl_confs_info *confs_info;
 	const struct airoha_pinctrl_reg *reg = NULL;
 
-	reg = airoha_pinctrl_get_conf_reg(conf, conf_size, pin);
+	confs_info = &pinctrl->confs_info[conf_type];
+
+	reg = airoha_pinctrl_get_conf_reg(confs_info->confs,
+					  confs_info->num_confs,
+					  pin);
 	if (!reg)
 		return -EINVAL;
 
@@ -2584,44 +2624,34 @@ static int airoha_pinctrl_set_conf(struct airoha_pinctrl *pinctrl,
 }
 
 #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
-				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
 				(pin), (val))
 #define airoha_pinctrl_get_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
 				(pin), (val))
 #define airoha_pinctrl_get_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
 				(pin), (val))
 #define airoha_pinctrl_get_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
 				(pin), (val))
 #define airoha_pinctrl_get_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_get_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
+	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
 				(pin), (val))
 #define airoha_pinctrl_set_pullup_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pullup_conf,		\
-				ARRAY_SIZE(airoha_pinctrl_pullup_conf),		\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
 				(pin), (val))
 #define airoha_pinctrl_set_pulldown_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pulldown_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pulldown_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLDOWN,	\
 				(pin), (val))
 #define airoha_pinctrl_set_drive_e2_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e2_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e2_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E2,	\
 				(pin), (val))
 #define airoha_pinctrl_set_drive_e4_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_drive_e4_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_drive_e4_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_DRIVE_E4,	\
 				(pin), (val))
 #define airoha_pinctrl_set_pcie_rst_od_conf(pinctrl, pin, val)			\
-	airoha_pinctrl_set_conf((pinctrl), airoha_pinctrl_pcie_rst_od_conf,	\
-				ARRAY_SIZE(airoha_pinctrl_pcie_rst_od_conf),	\
+	airoha_pinctrl_set_conf((pinctrl), AIROHA_PINCTRL_CONFS_PCIE_RST_OD,	\
 				(pin), (val))
 
 static int airoha_pinconf_get_direction(struct pinctrl_dev *pctrl_dev, u32 p)
@@ -2798,12 +2828,13 @@ static int airoha_pinconf_set(struct pinctrl_dev *pctrl_dev,
 static int airoha_pinconf_group_get(struct pinctrl_dev *pctrl_dev,
 				    unsigned int group, unsigned long *config)
 {
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	u32 cur_config = 0;
 	int i;
 
-	for (i = 0; i < airoha_pinctrl_groups[group].npins; i++) {
+	for (i = 0; i < pinctrl->grps[group].npins; i++) {
 		if (airoha_pinconf_get(pctrl_dev,
-				       airoha_pinctrl_groups[group].pins[i],
+				       pinctrl->grps[group].pins[i],
 				       config))
 			return -EOPNOTSUPP;
 
@@ -2820,13 +2851,14 @@ static int airoha_pinconf_group_set(struct pinctrl_dev *pctrl_dev,
 				    unsigned int group, unsigned long *configs,
 				    unsigned int num_configs)
 {
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
 	int i;
 
-	for (i = 0; i < airoha_pinctrl_groups[group].npins; i++) {
+	for (i = 0; i < pinctrl->grps[group].npins; i++) {
 		int err;
 
 		err = airoha_pinconf_set(pctrl_dev,
-					 airoha_pinctrl_groups[group].pins[i],
+					 pinctrl->grps[group].pins[i],
 					 configs, num_configs);
 		if (err)
 			return err;
@@ -2852,23 +2884,16 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc airoha_pinctrl_desc = {
-	.name = KBUILD_MODNAME,
-	.owner = THIS_MODULE,
-	.pctlops = &airoha_pctlops,
-	.pmxops = &airoha_pmxops,
-	.confops = &airoha_confops,
-	.pins = airoha_pinctrl_pins,
-	.npins = ARRAY_SIZE(airoha_pinctrl_pins),
-};
-
 static int airoha_pinctrl_probe(struct platform_device *pdev)
 {
+	const struct airoha_pinctrl_match_data *data;
 	struct device *dev = &pdev->dev;
 	struct airoha_pinctrl *pinctrl;
 	struct regmap *map;
 	int err, i;
 
+	data = device_get_match_data(dev);
+
 	pinctrl = devm_kzalloc(dev, sizeof(*pinctrl), GFP_KERNEL);
 	if (!pinctrl)
 		return -ENOMEM;
@@ -2883,14 +2908,23 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 	pinctrl->chip_scu = map;
 
-	err = devm_pinctrl_register_and_init(dev, &airoha_pinctrl_desc,
+	/* Init pinctrl desc struct */
+	pinctrl->desc.name = KBUILD_MODNAME;
+	pinctrl->desc.owner = THIS_MODULE,
+	pinctrl->desc.pctlops = &airoha_pctlops,
+	pinctrl->desc.pmxops = &airoha_pmxops,
+	pinctrl->desc.confops = &airoha_confops,
+	pinctrl->desc.pins = data->pins,
+	pinctrl->desc.npins = data->num_pins,
+
+	err = devm_pinctrl_register_and_init(dev, &pinctrl->desc,
 					     pinctrl, &pinctrl->ctrl);
 	if (err)
 		return err;
 
 	/* build pin groups */
-	for (i = 0; i < ARRAY_SIZE(airoha_pinctrl_groups); i++) {
-		const struct pingroup *grp = &airoha_pinctrl_groups[i];
+	for (i = 0; i < data->num_grps; i++) {
+		const struct pingroup *grp = &data->grps[i];
 
 		err = pinctrl_generic_add_group(pinctrl->ctrl, grp->name,
 						grp->pins, grp->npins,
@@ -2903,10 +2937,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	/* build functions */
-	for (i = 0; i < ARRAY_SIZE(airoha_pinctrl_funcs); i++) {
+	for (i = 0; i < data->num_funcs; i++) {
 		const struct airoha_pinctrl_func *func;
 
-		func = &airoha_pinctrl_funcs[i];
+		func = &data->funcs[i];
 		err = pinmux_generic_add_function(pinctrl->ctrl,
 						  func->desc.func.name,
 						  func->desc.func.groups,
@@ -2919,6 +2953,10 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 		}
 	}
 
+	pinctrl->grps = data->grps;
+	pinctrl->funcs = data->funcs;
+	pinctrl->confs_info = data->confs_info;
+
 	err = pinctrl_enable(pinctrl->ctrl);
 	if (err)
 		return err;
@@ -2927,8 +2965,39 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 	return airoha_pinctrl_add_gpiochip(pinctrl, pdev);
 }
 
+static const struct airoha_pinctrl_match_data en7581_pinctrl_match_data = {
+	.pins = en7581_pinctrl_pins,
+	.num_pins = ARRAY_SIZE(en7581_pinctrl_pins),
+	.grps = en7581_pinctrl_groups,
+	.num_grps = ARRAY_SIZE(en7581_pinctrl_groups),
+	.funcs = en7581_pinctrl_funcs,
+	.num_funcs = ARRAY_SIZE(en7581_pinctrl_funcs),
+	.confs_info = {
+		[AIROHA_PINCTRL_CONFS_PULLUP] = {
+			.confs = en7581_pinctrl_pullup_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pullup_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PULLDOWN] = {
+			.confs = en7581_pinctrl_pulldown_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pulldown_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E2] = {
+			.confs = en7581_pinctrl_drive_e2_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e2_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_DRIVE_E4] = {
+			.confs = en7581_pinctrl_drive_e4_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_drive_e4_conf),
+		},
+		[AIROHA_PINCTRL_CONFS_PCIE_RST_OD] = {
+			.confs = en7581_pinctrl_pcie_rst_od_conf,
+			.num_confs = ARRAY_SIZE(en7581_pinctrl_pcie_rst_od_conf),
+		},
+	},
+};
+
 static const struct of_device_id airoha_pinctrl_of_match[] = {
-	{ .compatible = "airoha,en7581-pinctrl" },
+	{ .compatible = "airoha,en7581-pinctrl", .data = &en7581_pinctrl_match_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, airoha_pinctrl_of_match);
-- 
2.48.1


