Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8816C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=; b=C7Mr3nqXW8trpoXHiJUKqm9EFN
	VwBh5gKyeXd8zDm7ZFcuGCHHJJanm7P5RzCeF4PcCi5E86u9bo0yagvf4PB5ssdUJnf4UZCzYX/qE
	Gy6PwEp+PNu+s9LsRldSQMm1Y4UxDtt9z6oBKyqssvu1AUpeyqiTWPUW3vaEjc+Xtr261dH5UwV6B
	6o6ZWI41gpsDizG5Mo4KFqEwVh8DPH16Hlq56lcw6tbVa2FNP3MWJW72oQc05joXyR8gcaqYAJJIN
	9yRNvwdDdd0SNtyQKLC9qoLQJ80HGzp+i63vpQejKP2cbkB/BXmM98JeK/nnYOKbpynmgtNh69cO2
	SmpIe4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftH-00000007hG0-0E8s;
	Mon, 07 Sep 2026 20:24:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftF-00000007hEu-1Oth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7lFq1642059
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=; b=oXXlmoTRr1saKrev
	F840BrG63g+79L9cQDvQOUzAdtHc15i3Iupnmogi2qIfmG6JAdpPmhvwBrvWHoPR
	Fp5koZlCQIb59yiobyKict0sA9mzTDNZHGKKLMEryt5YaoOsPTjpA0NvZML2H3gy
	aTunk1oAcu0ofjoJhgJFRWHHGMwtndrk5TXMcL7hDNVH7UzPTqQVOJGEI152mKOC
	hCxvt/lxW81UAHxRzgkXGGReuovfYmxOHRc034IizTCEmddyuP9cUVGog4HZBRLT
	v00BI0NU2Jz4yiBtWhmfZaeAaPYyE/uXxtR2OzanVdMHQlr2RPVLwRXNi7R7x8jA
	1yF64g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghruaawmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so6502638a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812667; x=1789417467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=GWJMRvXUIs4tg0sa08Zi+QhwYc3fAu4EQNZJPZJBKdIxWg+15HgLVVR3hqQiBOI2zN
         TDXYZIpMr2eqf44UJN4r3as9/oCENNzBNAzaUUfH+EBYOKZywaK6Aw7vYsHXdSShojxN
         bJTN+5JMdfT8/MXrRe9tbPTxXmz/aj/XdDOrpBNORzg+4tP8kG3tvroMs+byGHf130bW
         s+cdgdendqKtTrg8yNu2kwJQ1gLv0i4Rq4u9yRVBRXt5KHomh84KdwtFGieKZ5btvOuT
         eF1A1veR5suyv6DWBdc827Br2n8r2MuDuLkXVR+8iP2gOwwLPrtik65NPED2Xje3wyff
         1nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812667; x=1789417467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cSW22gDP0aHXM9uYQ6GNqbB9X8L4peq6obrroaX1pIE=;
        b=iIPPGWjJOqxODzINOiq3B+Uskp1qLhDWAvP6WvRC+yVsUK5IPum27gybJjxjZ4d5nW
         xe+QcrVl4dVRwgm2X48WwBavqdRo/YcJ+v67V0P2zuIVjEEnRnkg2kTavbSeaeg2W7PU
         Y2XMUy098co0lM7FHmsgtX7Rg2P/jLwMNALDeBfU7xVjStk+q595mnznAWRp9ApDjCpI
         mf/BDSdFBzFUEUMHJgs2jiGTckNANqRpvhP69/4YRsZUDldgGy60Yd8kVQt1H/hwwIJO
         gds9h0NUCOGoWY5amAvCrzg+W9IIMd/c4C0Jdv9bGdQL7aBTuQV6D8pDT+jf8xWDlMd/
         o0DQ==
X-Forwarded-Encrypted: i=1; AKwUvByZHfuFO8Ns/WeW375mzn2Ss2i6Rdhg+OJelb0DDhCH0Ch9VC26yPX4tdcAQEr361ayZKYSvLE06ficPR0BLiyQ@lists.infradead.org
X-Gm-Message-State: AFuF++nVqjLhBfnGL7aTReDEalc29RGevIgI/RJmWEIr9mEyFezg5r0r
	ea+dKwz23XBl4LpNBG5hL4F8dxnSf7LPVod7CvTZKgw7aOnReSNIVgmAm/CrTHkudrRek1ZaF1K
	Wo2ssKyFKwkuNh5zfcOm5JGHFZoL89+EqMvdX3BqNOxI3WDdrzpLFlztUqY9XQPFp07l0+mNkh1
	XL4p/GrC4IBw==
X-Gm-Gg: AYBFou2zeWB6oN4d2JFuEJ3MTeezko3/z8PvT6vYz7eTOCODIL1UVX1R4N/Y/jv6Jhf
	auneQe5lE05YYGQShP9bL3AtwGhwvAicZY08zNQvioqMv6h+xJPwSpDA2h+BdnIlhAQhNbjRhSc
	Byall7+2Vj1QO2Jdmo3hsyHhHooaPAs82OSHTWhde2lXqcUlWtEoAy4dmCwyVTy7aHEhOt41+t4
	9gvC/Kae74tJyZHMjyOMx8jsqC6uJW9yZLntI5UOxfEg62T8Q8qPe3VvKcJVdsDXh2qbIsK7Aov
	UM7HXuzrg4pVkzPFwcm+3AfOGARc2kgn1jknh15l1OeZo7x9RXALM0RPpg522e4pFd3wUbqd0vP
	YQ7OAFc6jh6Xj6RzgFIwuJ2S3tgRVzQ==
X-Received: by 2002:a17:90b:280b:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39b261cfebdmr34880043a91.14.1788812667216;
        Mon, 07 Sep 2026 13:24:27 -0700 (PDT)
X-Received: by 2002:a17:90b:280b:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39b261cfebdmr34879983a91.14.1788812666696;
        Mon, 07 Sep 2026 13:24:26 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:26 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:17 +0530
Subject: [PATCH net-next v2 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID
 mode to use DLL bypass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-5-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=4883;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=H1FwwnCAzH++7RGqPRMDkA7lx0MXBiHM+RuBRtHZzLA=;
 b=rz5FzNCKy0hd45LxMN56ldZNlxCT9C+l66wapiVjvwVNMp4Wb0CADNuNN+/vQqvusiXsWP5nZ
 2qR2KLNcUABC/i79ckJMTAgQrKraAz1CKhSKic/CFTpMB7eOlwdN3M0
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: 4MTJx0XzqVSKjGKD5G9IxEjVX1Lh6Kp-
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9f1d7c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4MTJx0XzqVSKjGKD5G9IxEjVX1Lh6Kp-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX0erlkUuAxVQC
 Va1gZOO2EnB/oOwna/QZIzKYQDk5cQ7LMJ4Ea4chlbFCHX3sogIVyl8tmsa14Bzv8ycR1tbr6v8
 kXXfV8gBCMyZdU/tx1tguPOBYj2v2R0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX3WsCzGUC+e3e
 DELJ5Q5TBeqv5CXEgY6JSMiuH77RzUpuZWa2pg5+MxSbJL5AhXKsKZ/giZElgjhWw87+8bgWuHq
 leKWv2YvxT4BwqOrgMgBRybdkaqSEssHzvuNC4xXshkHOmAKeCNqkJa7b+wcD1dgrkfqULRlytX
 WrdD8xlfwak0dLJFuWUbBaXuBhZLgcRUL13FF6HUN0zhWOr1aLOxKihBcWro0sgexpM2mRre3P1
 hTrKedoOYvkF9+swaSLFG7H8v1i8/reNuvxdARPqp1YPbVAs0XWjMg/7hiy2/ASiRVsyHXhZGN6
 RyB+lMqFHm6JT27N//eTCoBmg7v0vS4KRS3ldCTps1gjnjZOX1Vo/KJDQ3oRqF/hGpZSUmlB5Ri
 NLXMbzMGI3x76eLlBqz9+lRIr4+TdXdJf2Tl8lNni8qcyJnjOi7t+ag45FRQfupYkpb57wcX6gf
 oNnVEiPfbCb5JXYIZuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132429_397501_9E23E794 
X-CRM114-Status: GOOD (  21.78  )
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


