Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65500C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=; b=d8q/zInu4K/BiJVwn1AuWBK+cw
	fhjUv3nhhexraCXRLuFPmRwiCjGtIbu/ygs0uBkIBc3BLnKBGygxqB/SpN8UsnwOLLggUFeHzBZDp
	+Hfv7HIQjY1DlEKFc9Sdfg7kSrTAhCkFAmPOM5J0kc3INJZeJLlksxxdX70LF//3cYKOQB0ra6ryB
	weB9xLqb43h/f4sACHE7nlxk7FQX2f5A+zd2hLzvJyd+ZIHzSk4Bmmv926BKNqPDRwiWybk06KX/+
	na7a+wmzFMNL9cVORqi8lKp2PLvOOf3YxnXu1fF3enMwuCmezudMUm8dhMepKaONztSEJm27biA3J
	Z6JMF2MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CaU-00000000P10-30fe;
	Thu, 03 Sep 2026 18:55:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CaS-00000000Oy2-04qY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:55:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3F1u417506
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=; b=ahrb7FLxlCP9y0bt
	cAFx5oVRJmHjZABg1PjfYicyMyRlnzwjhT0sfbeXfAsw21iU5V4JsBUewn1K/31F
	3Miho5zFr3Gf/F0BBBjANjTFQi6cHSa4S6uCOKQc2DJ0hBYvCCXts0akge/QkKs9
	lLc0jaXuHweSaVnhUvF8zCOR64vAM4n6/07lYyiexdagP38bDnqXxjRe1zgE5GKN
	iChl/GFMoeAb2mG7cZB5PGJaHp9HnNlrqJbxiEBLBaSjXZ4lFPBtIlw08MHBlHz3
	c5kT8iS8oPrmHc5W4T0r25XHKSC4gZwLvgIKkZ1+2FGIvNfzICuKJaL9MvfNpA9a
	VDo/pQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m2wnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so331251a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461699; x=1789066499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=;
        b=SHY8ZEvVxyxhJbKRyd7up+rkPZRPFmH4RNFmyMamKymeZ0DZ5cwZvUnMuki63vAwpu
         H5QhyOAt+J+I5Hp7XqScW6E44wAJhm2zEbB2wT67lBh8aZ+05wDYSYZpbfRsB7W3RIy8
         +4f/VpT5Xn2GJJYDQdMFvB2gHcukA54f8BzYRMEtpbtoGIimTcN590T1PIsL1uMeb9rJ
         ExOFMOTcYSyGcIVJ0ymbyKqQVzQhhklMXz+zJfqWnh2xi8cHwvI+uWdOxZcIc8nzLb7K
         yGe2sbJft7FuSOuA7W2FfHT1YxJdtIDLozR5yL3Ip9wks/yZKfnN+Q/R9bSXzIOVw5Qk
         kwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461699; x=1789066499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRq6FO1Wgh0OU+E4Zz5vIqKFC7LhLdGz4RbBzOB8Y1s=;
        b=FiBjLUja7F0UobN2s26CCKoloN2aG8hH/lJwlfUuQHcqW40B49ZRm7QH+3tFQnbb7L
         AP7KBWI8L4jrLtpiU8UX/lPCqpL9WAvalk3s0JDtDiUasaJJ4D7k6qWvpdu9Nb8S9o0U
         MfY1ogzYspHdZ448EjmztHEZ4+hk8Iqaewjk+jyU/w9td4CG/WwnOJn5qP4pptt+9n+r
         tK2BlRCHAOUBngaZBj2/7CIg1eZPRGj4dFJbNq0Ox38KbMyIfhN+UA/PD2dg6gy3V9M1
         4ZRZnrYYSzK892WHtVndsl/vo0yoIX0G2Cd9c4HDhbePKVppdVI4Uc5ahsPIcDdnQ19q
         g2kw==
X-Forwarded-Encrypted: i=1; AKwUvByRHGBbb9ZbxsViCq4s4CmxN7OsGAmbWg73OQvBjRPN5lzaWMucIHs7ewdaK+GZapcEJMQZHqPHK9O00YLd3VFT@lists.infradead.org
X-Gm-Message-State: AFuF++m7/Xp6O0o1ar1fDCNUSH9yUhjxWKkAirjbwv54LMZe3oNWfhqr
	wBtcDDDytcXGq7BhQPkirh4Pxf3wVG3bfSOl+I1suxlkXnaOv7XwT3FSz8pvWlleFPeMKbm79V6
	Z60CTtmo8xuUqndqU+bck47yML7NEvEtex2blKU7ZGMhp3LCrZpcuazcz8OVBdcqIMlt+E6ja1H
	vrUw==
X-Gm-Gg: AYBFou0nwzOeoqGnuwjt2uuGVO3UTP1YI0eziDpyN1JXxBWLvqj75noOvXr21ewsdg7
	kmL3+5Nz5VdiAP8WZpPUrK2+M35LVINyFlhsRFypBoQUAgrsrFAyBf5HnMgx1MUSnzWpqLX82RX
	pZuxgBpQ7Sm9mNbOg4ytm0plqbGIsRbR819Wv03XTfNvjIKLLMJEgUeeKcysf5XAPxaiWqxHADV
	190FTw0v6j3uAmqXmWn9H+H2ycp9wAh4kqgRGh/eAuxUdFoI83/Pz4hOWoT3zlR+aoVq8bdUgyp
	kKmqfsr8QQCFCN7tyvR2/qhQcT+9560WSJzETOAWFDT1c1uhVDlDcvHTTVLGxWD6KUGBygfGgXx
	G5jp+OkP5A8KWLoTzjqpp5wpMpbiJgA==
X-Received: by 2002:a05:6a21:6816:b0:3d3:afa7:8101 with SMTP id adf61e73a8af0-3da3a16d1cdmr786596637.28.1788461698735;
        Thu, 03 Sep 2026 11:54:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:6816:b0:3d3:afa7:8101 with SMTP id adf61e73a8af0-3da3a16d1cdmr786529637.28.1788461698279;
        Thu, 03 Sep 2026 11:54:58 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:57 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:50 +0530
Subject: [PATCH net-next 8/9] net: stmmac: qcom-ethqos: add per-platform
 NOC clock voting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-8-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=6340;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=3qNv1gt53nDwmaZH3husajnhbdisLPvYiqw3RUvnSA4=;
 b=tT0xjbelciTRGJKzrX4LgzDWW4xxzHa+Wp/2FPlqaG/hynm5ROaZNmS3jqmRfWpOIwkDXy2pv
 MG6s7z/MzO8B5WV/Lk3pM6k04iN/CQFs5mEAZIg7O5uTQqeVprKDkrJ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: JjiRW1ILG8C9BawMwMZFCnkxhXHcGw1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX3d1K1N/K9XX0
 u97l+U7WNvWTKby+BA8WIqfdGZEHK1CVHH1Q3CekKZ3pFgtNv//s33KPsuGDVt9ixy55BIu0lOx
 FdQFxSthvBvdzu6VotA1t3Ejip9lgQ2avbtI+eeY26+rSm2WmSSQCB0VGacBY80cTNy6YmMIeF4
 2h+8knPlJZPRTgFpxoTh1agJBdSqHoiZrD+PyBWLjyFAN1DzAcixjdvWZV58/LBHZ4otFTBpERp
 QWKQsRcG3UtFYCJ1joyd+AAbPAK/yrPZLMcfnpzQiqLPHvQOLxvHFkzA81ADxckJ6O1Hnmj3Ogf
 XURDyMl+TJcnUY0aBkZpZY+tD6AtjxP8ErvuhZzyjWL15byVqaPefIW2yCk2bd3jGNt5VBGlA2J
 qCVZd3PWYfYn/3t1tkiRcz74F0ZOKju7qEUxHG/A+Maz0A64CTxdE3REMlu+9xYYWp906OeiiXq
 eGn/X17gVmS7eEiRagg==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a99c283 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LOscwf8DjUB2Y-oEo0sA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX+lKNp87vt4jb
 GHLmeLL/iF9N5pJtRsnEoJQ4CNjf3jsSX8CPGi1uWWRLUR5sRd3VvomLkq5yzSHoXDZ6Xi9xL54
 T8SWdy4rPP3WFtk3fJeRKyg4cfbcC4M=
X-Proofpoint-ORIG-GUID: JjiRW1ILG8C9BawMwMZFCnkxhXHcGw1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115500_079979_BABCF71C 
X-CRM114-Status: GOOD (  25.42  )
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

Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
that must be enabled before the DMA can reach memory. Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.  The clocks are acquired during probe and enabled/disabled
alongside the existing link clock in ethqos_clks_config().

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 101 +++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 4f9bef662c5796ce3cca64b19a595bcdbebbf336..a31541506a4c930c76374d7d8b7eceb6f51f37a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -84,11 +85,18 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+#define ETHQOS_MAX_NOC_CLKS			3
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
 };
 
+struct ethqos_noc_clk_cfg {
+	const char *id;
+	unsigned long rate;
+};
+
 struct ethqos_emac_driver_data {
 	const struct ethqos_emac_por *rgmii_por;
 	unsigned int num_rgmii_por;
@@ -98,6 +106,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const struct ethqos_noc_clk_cfg *noc_clk_cfg;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +122,10 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data noc_clks[ETHQOS_MAX_NOC_CLKS];
+	unsigned long noc_clk_rates[ETHQOS_MAX_NOC_CLKS];
+	int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -691,15 +705,51 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
+	unsigned int i;
 	int ret = 0;
 
 	if (enabled) {
+		if (ethqos->num_noc_clks) {
+			ret = dev_pm_opp_set_rate(&ethqos->pdev->dev,
+						  ethqos->noc_clk_rates[0]);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC OPP rate set failed: %d\n", ret);
+				return ret;
+			}
+
+			for (i = 1; i < ethqos->num_noc_clks; i++) {
+				ret = clk_set_rate(ethqos->noc_clks[i].clk,
+						   ethqos->noc_clk_rates[i]);
+				if (ret) {
+					dev_err(&ethqos->pdev->dev,
+						"NOC clock rate set failed: %d\n", ret);
+					dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+					return ret;
+				}
+			}
+		}
+
 		ret = clk_prepare_enable(ethqos->link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
+			if (ethqos->num_noc_clks)
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+				clk_disable_unprepare(ethqos->link_clk);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -708,7 +758,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
+		if (ethqos->num_noc_clks)
+			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
 	}
 
 	return ret;
@@ -736,6 +791,46 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
+ * so ethqos_clks_config() can enable/disable them at runtime. The OPP
+ * table is used to propagate the required VDD_CX performance state via
+ * dev_pm_opp_set_rate().
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!data->num_noc_clks)
+		return 0;
+
+	for (i = 0; i < data->num_noc_clks; i++) {
+		ethqos->noc_clks[i].id = data->noc_clk_cfg[i].id;
+		ethqos->noc_clk_rates[i] = data->noc_clk_cfg[i].rate;
+	}
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	ret = devm_pm_opp_set_clkname(dev, data->noc_clk_cfg[0].id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set OPP clock name\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
+
+	ret = dev_pm_opp_set_rate(dev, data->noc_clk_cfg[0].rate);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set initial NOC OPP rate\n");
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -795,6 +890,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
+	if (data->num_noc_clks) {
+		ret = qcom_ethqos_init_noc_clks(ethqos, data);
+		if (ret)
+			return ret;
+	}
+
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

-- 
2.34.1


