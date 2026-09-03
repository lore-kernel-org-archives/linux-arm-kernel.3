Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322DDC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=; b=NoQC2GrirzPHRaMj+42Gd38AVi
	uve2LLPWkse8Y1fVY88V8ZY+0WSXJpZmbzX6omt5KUgsLquL44yLM4OAP65xaa7CfeDZ3aTZ0MClF
	hv9UfzVzybudh2B4ifaf2qVbONqPznWHJcnG2mMs+bY3is1ARY3+9T9pywp7KkxeWumPWpmvgEsQp
	M56QzOwluE0ScGoQxXBBrwSp5L+Q0RwzUJ0het8VjGKmQWimGkqkPGrnOPXB1PaAS360H71voK2Pv
	OHzPsaRAdStfCDK0NP9Lj/yz/6WTaURdYF8AHImes7fi829QEXpTEc4Uv2WWTtovVzXSJoTlX2wfI
	rOsLCdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ca7-00000000OkV-3Imx;
	Thu, 03 Sep 2026 18:54:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ca5-00000000Oj9-1KEt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G34G23958103
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=; b=SOVT39CTaHfspJNN
	T0Xwf9QKRY7cTVbR/hYBMXr0mA37ZqoNFCi2Yx2roa+ltesTIreKH5oequXd87e/
	8H+0NjFxNRpUqaYAU7WAXe/77IUrWPH6Zqo8xhZVXHgdTpIUa97Zh9QOxVKNeyrL
	5zSp7WvHzt72FKP1ut8nQ+Se3KWQ6oynA7vudhhz3h1E20Ngo2fbcZG0z72DDUKe
	0/zahxl8j7PCxomsLjrthRPXTqsaJf/RG/HyrxEJQBJ01RhOyIixY2bczMMgM2PU
	72rvn3Wyr9QnxJC+xGkh2Fy0xM4/4U67AnZJ+s/lnE/6UMj3+O2ZmWVhndCuHV5j
	di7uag==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d12qny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d292eac1so242208a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461676; x=1789066476; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=;
        b=TYLPYT8BTJpCmPqPZEeWbR2b8yubTY7QIgFPfJgd37DYOga/hfFzxHEfbfJT2BRuyc
         1ucU0+7XF31Zb1jRCned0N6sbnWJxHn4Yw70oEwIRnwyhPbH3D8pJ0fzOYmQlZbfYJi6
         WDxgkjtLfn6qTM+RtB8+dPIE274p++X+i32lre03E6Dtl8WlL5xEl39j3hbyqE9LcZba
         9hln/KM4/V55KkG5GhcQxFyfEg1YwSxmRugpl79+IqgbOxjCJWZCzGMl0Yu4d6N74MOZ
         U1FLEuz9bIQNf7SB6HFADLa9USgWj3d7jZeTlwtSHgaCyI4hyvk7dF2w/WXywSoJ81pZ
         jLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461676; x=1789066476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CMUpW6p9PAs/kdnPc2ogQtTbd49AApNHpaOy6dca8j4=;
        b=FPivyBkpnCifct1ELSbjAfncgkvyXm7wax8cSTauVE9qGLoym7h+85AghnLohnglUv
         +1J8ib3HC/gv7XGIouC3K6cld0kk3Trdvge02vsEtAiPvQsz9Yt/ueiNMAjSen1SIgKG
         GcG14xbjD7FiLQLKi52toO+r6VoIEiWjb1hEwzKwx4KOp2IMtz69m007lOnrIpGxi/Wc
         lCnx2hCP9w2s0TqMq81qAG9pTKjUW8eBBywIr7+H8Z79x8ZKmAv/vMXiihm1q5X8SVEa
         pcIu9r9zCYdtx1ZhRJPYMdmKSRHzDGvypiY8eHTWbqxGtPkGl7qjAKwjoyIHw/BU7yvS
         8S/A==
X-Forwarded-Encrypted: i=1; AKwUvByeXCJIl3rw8J0fYBfBG48rAz1JgJE4aIGDX+D8zi7ugL6HGc+eUMMHR1uDS6Q6YDQfIkkYP2IZj27wkleRigvS@lists.infradead.org
X-Gm-Message-State: AFuF++l3RwUl5csEugekvJtgLuIHoLnZrXXdBZDZo5BFgHOpa2qI3WiK
	BWKGhJNSK0FTGCal1GtU3TtqADoZEPX9OwyzDsw4WBtbPv86MJt+lxvDgICPwjWf+lTYbMmtHgL
	GpdEARNn+asQdgn0PKYSzSLkmezI6iL6ujF4MNFrp04VTxml9m1DVX41va0wkTxnlhsWMISFzEZ
	kI+A==
X-Gm-Gg: AYBFou0flYvt6hPLrOuf0WBmPZfNVYzPjUmVNAwnfO2fNIvnxq5MRRUvX3J3cIhRS6g
	aDeVRUxDoyTicMwYBKstM76pKz5WHOR1xGJEaAGaxx2/T7MDKrWmTMfs+g/QHxuoG1u5xl696E2
	fb+EiqEu/gYGlN1oym1EHDBQi8RYmzyXV2Rglp9jD55oU3MrhvyabcgnUMa9A6LezHIeFR8sZ5B
	DgRj1vfdTtaozhTuhf8wIDVZiewF4SVI94XPPqvoNX0jBvep8wpB+TLqz1K9KOkwpnB5hUN80Wn
	8WvYXsXSkaTr/5EIAKZyxPfnBVX8IH+ypKhju5VJloWmbo9brcXrIZvyerhFLHVdxG0+qPafTCj
	zHhKniIJErh6YYaE4nbSnAjwdhBgsVA==
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr937534a91.1.1788461675692;
        Thu, 03 Sep 2026 11:54:35 -0700 (PDT)
X-Received: by 2002:a17:90b:51c7:b0:398:e73e:5a0c with SMTP id 98e67ed59e1d1-39b2609f34bmr937450a91.1.1788461675090;
        Thu, 03 Sep 2026 11:54:35 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:34 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:47 +0530
Subject: [PATCH net-next 5/9] net: stmmac: qcom-ethqos: fix RGMII_ID mode
 to use DLL bypass
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-5-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=4880;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=oPIOV+gVLaskH06k2h0yfpHO+z9xupXJmiUCrslRjTc=;
 b=sRHi8BoPgbISk0KgC4JVIGsrHJ+lg5f/DF9tLeSaANkxWpr2474ufayQ5HWVVmUWbphyvASaL
 lMGakYLTTy4BLwe+7HrABFpLsuTJ22zRFKGrMtVA2WdExt1i5a56LXF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX9OVWOan5x20Y
 sQKYun6uCG/6WxCaP2rodh+EeXCT9RIvxPPNlvU7sQwNIkdFr0KQdtLB2J84PCZil2fCNAKkYUG
 +G/iICWTW7WHdY9eWV/A8ZyfwzIwLyJHavlsA+MgxIdtPGxvMWxCx0qpSUwsj7d27Nj5/dn6cxo
 WYxnwbculN1fn0i/IE6+gaxfZ3UrTd9bB3uG1OkEK7+YofF8zkwtPPjOM7FZv4L9o9ecMys8Qfb
 baH3I3OATd7tBNqJ8LCbMMjhJImc5aDIINzaF4GBuApNxBDYDwS5p3yf99CEoCGgOf7DBva4vTT
 YJOL++zPcTLf3w1i4zsmADX1yVbPcsV7PquS1FFvBnyJj//u7vTaUr+n1Lu6ZxywKH2vZLXvuPz
 YoI1h8DoHUOziBula+ltlixnbddz0adY53nuGu9EiudTsnEXAvrLWhoZigfwu6HI1pWKU/UXpiO
 tCjuDwNazEomnY6lczQ==
X-Proofpoint-ORIG-GUID: LabSePftRQxMi2hhZ2o8SPxlgwIpjZ0a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX5FddoITDqGUg
 Y978SAFoO8Zr6TjjVtbXOE3K0i6CI3U2E0MlhvCZAIX1Qwuu2EgBZ/ATTDcNBeUOHjasdSJTNUo
 0Wj2lgcx0AZs+SyM2HHQqgXsZeeoaAI=
X-Proofpoint-GUID: LabSePftRQxMi2hhZ2o8SPxlgwIpjZ0a
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99c26c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ctJ5fWpjfrpFC8ASC0YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115437_370941_742519E4 
X-CRM114-Status: GOOD (  21.56  )
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
index 44270c25d874f72e7f971757fec659d36468c315..67738c1598c50ade22f2d548a6d66911c348af51 100644
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
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
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


