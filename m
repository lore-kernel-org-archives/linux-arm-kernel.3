Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2789C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=; b=GzE+OODeRESDM2ciMgE7MsmkvC
	NwG69DkbLl8w/bggbfoR5ZNL6X9ZOFyYZPISAtLYq0roC1PNPtiFwEFNWQlxyRUmQIQGF97yfuMAC
	IlYwfFK/qu//JRaGVCJpAbHP9h1ctP0YlB6AMGOBfozi6GNpyH7hRQE31tP92f6WZ3sgfibWQDCfF
	cM8NBJUv8YQChryB1ihlIvVOP68/bXsas7wpqj4MH+BywW2RKl8uJcwaP1CVsP4Vuj/o1OJA7ROPp
	npSc/0WewWhdz0MAZ0z3FZf9LH8G6LIyJtNtzHNd2tTQOf2d71VngCdK122fvN1C/jFjI5qoKTkbD
	3Hw/O3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjC-0000000C3D0-2m6Y;
	Mon, 06 Jul 2026 09:35:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfj6-0000000C35h-0Y6G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:34:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so18840485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330494; x=1783935294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=;
        b=AMKvfFRCigmpcHSDn/AMkrzw9QCgha8R6GSxLyiQEzhklKQvkswmsVD2OWLo8B7DcL
         8H/8zpiw/giys+LgNIIPIsQjO8zV/0LTbjGf6m/Q1efZvvH4AH4S7fYjpcqr2glI/Ev5
         kBGd/OTGpSkxk6YBGlhB52/9j/UgxO29y8h5otwrAPAZkkHtWcR63LdClSH707o46zlH
         fFc/2rC6xRus8BKOsOxvVDeDAv/sWmJOTaNAxVl0OwFAOSxMeXw2ztV+vBekcim/EBv+
         3YDtndIz9RMAzS4EWQgZV+OE5KZwlRqec35vQ7lSKQZ4YfwHhR3gI7CCIe8tMGltQvuP
         Ffew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330494; x=1783935294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Bs1t6niDEghP4G580i18CcoVCJKxGhV6ocPTEQ3Ayk=;
        b=Z7tfs/jPxxuZNhWsylCb8PtQIaD8Gby2OX34r3RfsHP2hNa1sFL0thCu2OB8dtb9iu
         PFzyXxq7hf5JgNlCDmQjJawxj+e176egaZ8fIGKNAnsW/K8l369IqEBc5QEWnf1PJjdr
         uCJmPve/BC6To+fCn0BVQiMwTePw7ftEbZexy8q6a9V8nQdQ/rhINVzt/tZEjWGqMBTx
         zJ2Htk432quAwUHyE2PU8BSb6V6qoitvpqXOp8WuLDUN+uB+fwrT2mDzguVwAWAmJlMY
         w55sLRQ8bFR4M3kHkeHpURt/l+TZq1L/DBByK7Z48XwbdTOBDKKiDmsBa5w/nUrl8wy7
         Hedw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Rk6BJNQOAseSKMAxDsNAyJfN/0el6JWie+6HuIYyYsEdVSqLRcwrIKhk1Hx8Sv73VFw2VZxQxwFZpA3JX0vQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzK+J5QH9sJpSLumhCUg7wwes5CLOhxOyhkKTV+Ag3Z6Da0Mkz7
	q1mLTir3Ma46BmPs9GCeM898SqS+nRFdFNspdGxCP7fEOdmM9rMe68tT
X-Gm-Gg: AfdE7cl78BrM7SH//ufFJmPPfz9NInpgM+Jvzxyrj4hLPI12gtwWGFV/75aT+WOIKUN
	D/wtVdnU4Bxp7dRVc/kXcMhzytZYwfbmnene9oy6/c9MAyhK0iTGmDs65Y6rGofco+Q+k3iHs9x
	LJLB7K5GIkDcwwK48MAfzMoqVaI59ucw8ERbjVsV5QJjzZXwrpDD+8tbgynVjXpIVWp+cRMdm5F
	786GWmMd9iS+O1cmlbltQs/3vrZ/j7EiAlSXkQyJeTPCKGS0+ssZxX3gg7IHSuHLS5EKG5YdNxH
	8R4phnqydzcTQKgvg7sDvVbyJJ0UJpEV19aOTs2VAZ/R4Y7C3Ts+7nIUZ0bljbLdeptMsasdkvB
	QB6ghiqfi5BoDk0aViUlJfbTRp4R7JAwIT+r119dm1h6yXqX/VGLtqShN0Zmkpwf6X94Rmy0wk8
	rrqns2j2BjAtDkgvNABW5an9XIUq42lnfyQ+sjTqUUUR2zwi6dgLa68dyCO0WBBpBp4Savs+k84
	HrqbvPdxMQr0sVMA2bepRm9Bw==
X-Received: by 2002:a05:600c:35ce:b0:493:b877:fbc with SMTP id 5b1f17b1804b1-493d2396eccmr114312345e9.21.1783330494156;
        Mon, 06 Jul 2026 02:34:54 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 03/15] arm64: dts: freescale: imx8mn-var-som: Align fsl,pins tables
Date: Mon,  6 Jul 2026 11:34:33 +0200
Message-ID: <bebc3185b37c48d6a6a2cf3e09d02751c77a2cd5.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023456_225844_815D5366 
X-CRM114-Status: GOOD (  10.37  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Reformat the fsl,pins tables in the i.MX8MN VAR-SOM device tree to use
consistent column alignment across all pinctrl groups.

Align the entries to match the formatting already used in the
pinctrl_fec1 group, which contains the longest pin definitions,
for improved readability and consistency.

No functional changes intended.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som.dtsi    | 126 +++++++++---------
 1 file changed, 63 insertions(+), 63 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index e1d2e2a72e1f..71a2f0866822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -368,129 +368,129 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
-			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+			MX8MN_IOMUXC_I2C3_SCL_I2C3_SCL			0x400001c3
+			MX8MN_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 		>;
 	};
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8	0x141
+			MX8MN_IOMUXC_SD1_DATA6_GPIO2_IO8		0x141
 		>;
 	};
 
 	pinctrl_reg_eth_phy: regethphygrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9	0x41
+			MX8MN_IOMUXC_SD1_DATA7_GPIO2_IO9		0x41
 		>;
 	};
 
 	pinctrl_restouch: restouchgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x1c0
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x1c0
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX	0x140
-			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX	0x140
-			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B	0x140
-			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
+			MX8MN_IOMUXC_SAI3_TXFS_UART2_DCE_RX		0x140
+			MX8MN_IOMUXC_SAI3_TXC_UART2_DCE_TX		0x140
+			MX8MN_IOMUXC_SAI3_RXC_UART2_DCE_CTS_B		0x140
+			MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B		0x140
 		>;
 	};
 
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d0
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d0
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d0
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d0
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d0
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
 		>;
 	};
 
 	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x194
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d4
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d4
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d4
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d4
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d4
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x194
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d4
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d4
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d4
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d4
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d4
 		>;
 	};
 
 	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x196
-			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD		0x1d6
-			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0	0x1d6
-			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1	0x1d6
-			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2	0x1d6
-			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3	0x1d6
+			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK			0x196
+			MX8MN_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d6
+			MX8MN_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d6
+			MX8MN_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d6
+			MX8MN_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d6
+			MX8MN_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d6
 		>;
 	};
 
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x190
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d0
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d0
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d0
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d0
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d0
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d0
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d0
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d0
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d0
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x190
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
 		>;
 	};
 
 	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x194
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d4
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d4
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d4
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d4
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d4
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d4
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d4
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d4
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d4
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x194
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
 		>;
 	};
 
 	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK	0x196
-			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD	0x1d6
-			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0	0x1d6
-			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1	0x1d6
-			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2	0x1d6
-			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3	0x1d6
-			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4	0x1d6
-			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5	0x1d6
-			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6	0x1d6
-			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7	0x1d6
-			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE	0x196
+			MX8MN_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MN_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MN_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MN_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MN_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MN_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MN_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MN_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MN_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MN_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MN_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
 		>;
 	};
 
 	pinctrl_wdog: wdoggrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
+			MX8MN_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B		0x166
 		>;
 	};
 };
-- 
2.47.3


