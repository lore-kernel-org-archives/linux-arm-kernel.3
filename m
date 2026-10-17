Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031A0CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=; b=iBb7eVjknjgmsfjzXR/cfqXQRn
	xNahiCcr7LR5Dn3SsZbf8BQPOTwbPV3P9opcvOsnUh996CrVPTsFIlpIrpC7V8S4x2xKARCEDAfTR
	DQdEBbte8x/YkFYUr/wdxqhFKsHScqs7Ac2K2DL8oJXwydaBPnSTpAgsrCQ9ps8NSPPwwM95M7BeF
	G3jtPkV7quAMnrYh+94+UXaguLaSMCTGRqumgLhgY+gK4NWl2kuzzMuP4CVjvu/LGw0ZKqqBAKgbK
	XhDorPmFylsW4xr6477qZNd65H+hY1lXQyi0pqAEoBB0zlrfCt1QJwmAIdMJ8PdZe5p+ac9epIk1d
	u/cOxp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zl-00000004daA-0NYz;
	Sat, 17 Oct 2026 09:46:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zV-00000004dV8-18XQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:46:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oTNg3701949
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=; b=ORg8ckKSDEO4ycs3
	p7UmPrX18CHDtCmKlfBu3GW9j40Nx6fe19ek4mZh7GlHSuZgjus80oMwge7qK7r0
	QAx1NXUC3ZpP9M3T8mWfgScjv0DEZtDhYYQwNT3T5dp0LZxBSCHKw5dQwUZ9EZWv
	kFQnkhRF6N7owZSCzLSC0Lg4NWpSCj2koqsOvne7UoK7OMjzOSFAkcMY+4KoB6cg
	W+zDbUXJNM4iGtwU0embOR52xbMqr9WgmJmW0AIarV583NNSa0MKuqk7dvj77pOX
	6+Tbe9bT1SEngLVaQSzh0QsEfIVWEm0D7yf+ZC3OBtf6Qi5gRNXX3fJYrIyAdy4H
	6lWlFQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9gg22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1829530eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230372; x=1792835172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=M4unjtbQwPFLcCf/Mo0ErVBAl7u5Ib50RI1v+/ffsbXR5iyGq+8JbOMTsbb7bgBaQ9
         wDzI12ZU7WMeu1acaAwGkd40cb++Mo4xCD2bz9nGkwa4rNxCGKzpre5+xkz3obuPMf70
         vMUMOxvf2FKlRiY3silO4wGhySkD2xpaHXdDEJxjdrVvpkxfk1lE/OnYVRVTv8aGhgIK
         7YoIZ8W8zPVdAzlmv0LrhqGH/KtZrsgD+KRzp3PfNFL/mQ4UHdZApkYjHNT0nWbf/VNq
         RwtaN8LJhm5VofeSLKs+UrxT09KBCOgjJdSm2EpExn1pDaK2SsKpqeW2F+1hnZv8KUV1
         WcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230372; x=1792835172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=PsBcBE+pQN4cqQyQHimndKuzBxtnEEHjrI3XJ5InZm4GN599SLPo8D2sUnZHDX4lO/
         /MfgFDvw0mkT7QRvsN6W6RTAi13O+80GUGSSgEU8UOz0DwnqPtwRlXNE3R9sVGrGgba/
         jyXsLGh00uT5jYpNErVNxR2pLFFOUUGD3wf/5n65BQ/LCbo+XSYzdcV15dw0T46jsYTJ
         Eue2BH/bof+1cLlwWrEKJS2vsMsretLfTRestUONqe6noEJ609dkdmh9zxLOiskLhdFW
         SDaVy1a5ErL7TXf3JtDS/hPWUgDn5HbBTg8+WDzoV3QzW7NU5cXZN4G0aF3w7kJO8WxD
         xYhA==
X-Forwarded-Encrypted: i=1; AKwUvBylU9AdJFLVJQBlgy//FUZ+3omCeuTN+EJueWJFZGCUKCPeRtv/GHOQ94cCiKLrvDuFOmCyxtLAPaJYlI/F6ztG@lists.infradead.org
X-Gm-Message-State: AFq9FYJNH1I+OCNbO3EnYGiDav3i5rIupfulQGD5AFVXDbkpVbKEoZwa
	t5gqgDqHQ6aS036NamGqwxV/RI1qGyfFHUCKWOMmKbJs/t/IruHGEd11mybnSs/YjLt6DV881BM
	1nXUbtF5H8d3/kk6QzBnWAufQUoqL98Mi5Y2F7wJmX06P29ceNeG9564EoevUeUr0I555jh+F1W
	TJIw==
X-Gm-Gg: AYBFou2/hW0KKxcYiycy/RYQEYNErVwSHFgR8StriJ/B+T5Hoa9ATwJKfg+416e2zat
	3ZXBNDBNqoBGKsfj/c+1GdGVYqyZR+6BDn/BzjytKu3U4pPHhgqUrMOtSVFEfRebqRWd20W6fnd
	sX63jPzBP0GoDwfExsgVBGA/D5QdwrSiq9Vi+awN4B6vCPGJ7sGhVkH+F65ILDJpnAda0UtGtL/
	5mVPDqmMl3Zyw/4btyMMP40z76xQlDPaM/ejb579nzYs5SbExxsxD6hhJc1Q23Io4j6MCn9rx2j
	Lbit9QcPr99KoEejGcxzVJ5H5C09cUhPs4KwBbdRHn9FKsKTzU7TFQHDDzbEj1hEuTi1u4nErzF
	/PeVOqJBLQEL8e66dJ8PQ7bf4wIwnVQ==
X-Received: by 2002:a05:701b:2807:b0:14e:7162:2ab3 with SMTP id a92af1059eb24-185120a8369mr3006180c88.8.1792230371943;
        Sat, 17 Oct 2026 02:46:11 -0700 (PDT)
X-Received: by 2002:a05:701b:2807:b0:14e:7162:2ab3 with SMTP id a92af1059eb24-185120a8369mr3006158c88.8.1792230371354;
        Sat, 17 Oct 2026 02:46:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:10 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:15 +0530
Subject: [PATCH net-next v3 4/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-4-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=4883;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=H1FwwnCAzH++7RGqPRMDkA7lx0MXBiHM+RuBRtHZzLA=;
 b=DDwfHmr9636anChinr+M3RRKVGtgJw5ssHyHSwl2vI7NWLC7XrTIdFuXo6QVd1P5/VtZkkmFT
 nuNGevKflktD20S3RbxLJCbjuFgU8gobMVyUWl3spQhs+aMTDu3OGyt
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX36DMSZngG09A
 i8597iPR2amWu0fdUHs2SqsUZxzC+P3nUUtPrPjGX2aDNhBtzULBntvIjH1dsLvvScsB9dFi4YE
 bRo8K6vRPGGhWguycFV4/ErGOzv5i+o=
X-Proofpoint-GUID: PdXKmMfM9uF9IvprQxOnY06x1Ti6HK0R
X-Proofpoint-ORIG-GUID: PdXKmMfM9uF9IvprQxOnY06x1Ti6HK0R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX/CuTwapBaKmI
 fKw1p88Bv3sW370emMEnJ599NzrzNDjm6Ks68/349bIMCF5lU/sTpjUK1swSgKYisH3ea9QmlKz
 dVAmiKCwAsY0Ib8uzpgoRQVLloeJiBQxoFWk1Yv9NleNknx4aGfzYUvIyizZczQiwR+fEVBNDMH
 pa2pcBb4rSTrXlkIPYG9Y6yolaRWSWgz9k64negGoMb5gNDLoFfal4iJXkbSwHYArCKEYsDLR+I
 Wssh6S0WXoYJzA+QGWUcNkLpL8KVSmDY6st0JcuWvZIhRZkuyYJHiFSpzU2MfTYQW1Qq22wKy1g
 G0wII7NkIdJZZ4Hj3dZrckmmwA8TKTr4GODSFi0DlMDoP8GePMciBANxOXSMWrDjEqGvl5fZGfK
 EhOnsCaX7lc/UN9EeQ39hbyCFNeLG+aL8fKpx/UZ8j4CVw5iAJ6L2YQerYvr376DwqKhCplGA5v
 GJ2x61dLmxLV0VF4PTw==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad343e4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024615_382533_71B349DD 
X-CRM114-Status: GOOD (  19.99  )
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

When "rgmii-id" is selected the PHY supplies both TX and RX delays, so
the MAC must not add its own. The driver currently falls through to the
generic DLL initialisation path which programs it to add a delay.

Power down the DLL and set DDR bypass mode for RGMII_ID, then program
the IO_MACRO via a new ethqos_rgmii_id_macro_init() helper. Also fix
ethqos_set_clk_tx_rate() to not double the clock rate in bypass mode at
100M/10M, and remove RGMII_ID from the phase-shift suppression in
ethqos_rgmii_macro_init() since RGMII_ID no longer reaches that path.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 67 +++++++++++++++++++++-
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 44270c25d874f72e7f971757fec659d36468c315..53fb9de4d92c7f1b3c51c183064024f06150444d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -67,6 +67,9 @@
 /* SDC4_STATUS bits */
 #define SDC4_STATUS_DLL_LOCK			BIT(7)
 
+/* SDCC_USR_CTL bits */
+#define SDCC_USR_CTL_DDR_BYPASS			BIT(30)
+
 /* RGMII_IO_MACRO_CONFIG2 fields */
 #define RGMII_CONFIG2_RSVD_CONFIG15		GENMASK(31, 17)
 #define RGMII_CONFIG2_RGMII_CLK_SEL_CFG		BIT(16)
@@ -183,7 +186,15 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	/* Clock Rate Requirements:
+	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
+	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
+	 */
+	if (ethqos->phy_mode != PHY_INTERFACE_MODE_RGMII_ID ||
+	    speed == SPEED_1000)
+		rate *= 2;
+
+	return clk_set_rate(ethqos->link_clk, rate);
 }
 
 static void
@@ -405,8 +416,7 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
 		phase_shift = 0;
 	else
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
@@ -475,6 +485,42 @@ static void ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		      RGMII_IO_MACRO_CONFIG);
 }
 
+static void ethqos_rgmii_id_macro_init(struct qcom_ethqos *ethqos, int speed)
+{
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
+
+	if (ethqos->has_emac_ge_3)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
+
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
+		      RGMII_IO_MACRO_CONFIG2);
+
+	if (speed == SPEED_1000)
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+	else
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15, RGMII_IO_MACRO_CONFIG2);
+
+	if (ethqos->rgmii_config_loopback_en)
+		rgmii_setmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+	else
+		rgmii_clrmask(ethqos, RGMII_CONFIG_LOOPBACK_EN, RGMII_IO_MACRO_CONFIG);
+
+	rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP, RGMII_IO_MACRO_CONFIG2);
+}
+
 static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 				       phy_interface_t interface, int speed,
 				       unsigned int mode)
@@ -493,6 +539,21 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 
 	ethqos_set_func_clk_en(ethqos);
 
+	/* For rgmii-id mode, the PHY should add the required delays.
+	 * Therefore, power down the DLL and program it in bypass mode.
+	 * Program the IO_MACRO as per the settings recommended by the
+	 * programming guide for bypass mode. This will ensure that the
+	 * MAC core doesn't add any additional delays.
+	 */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);
+
+		ethqos_rgmii_id_macro_init(ethqos, speed);
+
+		return;
+	}
+
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */

-- 
2.34.1


