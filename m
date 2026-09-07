Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2634C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3omiMkZWtgzaHHRt1sFImgBtpza9a0r1HxxkeHWh5k=; b=T+path1JxDJJKbzVhSjRs0+qO+
	Vcm8zCptT3jeYU4Q7mR3OAZgWWEr8FGrsO2D+lhc45Pl8C0X9InycxQEYXmb+d3R7ogTQnrAh8lWA
	6zAfrwHC37Zcr/wZQI0pJLgblzQKnqc1ib25Y235wEBPkCt8GESbt+UABgww/MBdO7Chbpv7vyBvP
	CDy/v2vqqoC6mD2p74K210ioMZ9cee6u/BQZfxThYpqmo2l8omOzzLrMhg1AosGxPOqRPa5GVisVV
	10ZP7KlYWwLqkjMU1/HtlDEaJVepjKxNMWK/429XhBeInYnunoqPtNsEg7e5GENaRwCRtRLwg5599
	Q4YW1P7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fti-00000007hZL-2h43;
	Mon, 07 Sep 2026 20:24:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fte-00000007hW6-1uZR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H7tu04062075
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3omiMkZWtgzaHHRt1sFImgBtpza9a0r1HxxkeHWh5k=; b=fq8CTt0/rfiOYHVQ
	QSGtjR/Clx7j3W0tx/g11l7kYCgJu+Esjpy3lz21RxIdEgCslX/AGWbPMVwmwRlE
	Sdg7/TG9CFrU6qOvETH8qBdmrL33rlkDywZNvjTRBEXrfk0k28KR5x+cBAPXLzVm
	HNhVuA8kxQxJCcHLOKUFarXqESXMValUWhXq7q3P74WV2YUX0LUr/qH8lOy2NlBa
	cxKuWOQSMJbKJLlIrAOIwKkPwYMCE819yX2dy6cLAI1BzV+ME0XVPPDyCgd8qZR7
	IjQRAdrE9zyhJPMmi8LE8baHO+3LbDJ9KB7Mcbw9ho30Lggw1Wp7M+W/XwnMCp1k
	gdHufg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077gspm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so6534710a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812692; x=1789417492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3omiMkZWtgzaHHRt1sFImgBtpza9a0r1HxxkeHWh5k=;
        b=XNb3GrOzyTjuRUU6fYwUUXoDQ6DOC90Zg83OLIVqXmfsKq9JndevokYuyHk/8m2P4J
         VU9Yu4hQP8Ey7FNXXgZwxZfwXqM35IpBNC7uQlELuqcWxlN6nTjqeFOdW17z95kFQa5e
         rRbtoFCCty5nfhrCDeXaVfDTeJ5RfH/LVbIxFxSCBQJufs7uWOmGt0Gy4/+arEJNY4VQ
         mHfCoiLvAn4sBkYeQVOiWehbxM93KDowGdhgtjjpIy7ajuMReyE6LOAANb5xCxXYlJTY
         7IfjgxVT9LFxjK5GXa/nl+QYq209jbu7EPetrRGpkRyEPRz0whC285v06IIWya1tDLs/
         jx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812692; x=1789417492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3omiMkZWtgzaHHRt1sFImgBtpza9a0r1HxxkeHWh5k=;
        b=OudNuwnSUR46xqGpPnbxE/BkcxEDGp1itYHQvFOeJvAOPEiT+GuOTBfXFrdAsRq8+x
         0L+4ViNjDHOv1oeWoEQ/xVXhRiSvS6bd+WoliQ2I4QKEg6JFOgJWJWgpm7Qb+Fq88FVF
         cupfY42ti0koh7cxHuWmtH9S7WzfMZvRofl0Je1vRvA2cLe3ZRF5gyuDjUy1Lii4MfO0
         MErG0uwywhhKstTwxNGwRMPF7QePv9pasC+ACDnUd6ICJiooP212M/DZ9bXA+8YkwlnU
         6rIdDfKfzyQaoZOa+OBRjgg/Igs1vGoX+CuyRTL010gKkH07x8+9g6ccgDr4jyadZjqZ
         TBfg==
X-Forwarded-Encrypted: i=1; AKwUvBwLG0Z/PLnZFQqZEFmDAxXpoNnsyia80bPhk0ZarwD8QdmdZCVtBIu4/cWJVDdQ/SsajFa9u2i4VWasYm8rbnZm@lists.infradead.org
X-Gm-Message-State: AFuF++kKdLEGspakts4aD+GeVx9m3Bafo0proVbKXlQ4tmtlrqFO09US
	hMCO2At9W6uS9LSBh7a86Dmt2qMSQJRJwpxXmlRqFtxq6xJYHt6D942KyXf5mRjghs3n5WMzQhw
	ZX4LyxgtzPwu/O8DQ5IlR/icaE5bLh+8JiE6VOt1eJG5powYX8+sy/8L+ocLAV5jyJ0YFszg8eq
	7Mb1U5q1KX/g==
X-Gm-Gg: AYBFou29ws0d8sSoSUeiEluVZPXJR02CHVWk/veEyhL5GjR3rNmnekCuQMoI4YXxv6b
	ZCNPCPoBT1nVcGsuxN10iYHyfLdMqeTSs34yvCJ6zFONdiU6OGAdBAvmrXPOH9sqIRBh+YL2pOe
	3T28v1/fLGvIjcY+m17HS18VbQudwaOks0k+03P4jubsezKctEushvji8hHv/PHM240MOe7CWpA
	E0FwZFIMAjCAXizAZSWF+DKnBido5Sy/ULK1gXSMoIQGgcgC5JaT7byk1SeUl6VsNuAlJZdAXXu
	IR8yXWAIQPeWDJ7c45L23UXQ9NfrKvapDxNXRHJH//wxTITgDLfc9xCaFgE+ePaSscZGvzvOgQ3
	ypKu1fauhD//e2uQ0jwEiCEFdcJldtw==
X-Received: by 2002:a17:90b:390f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39b261b216dmr36938660a91.15.1788812692199;
        Mon, 07 Sep 2026 13:24:52 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39b261b216dmr36938594a91.15.1788812691719;
        Mon, 07 Sep 2026 13:24:51 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:51 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:20 +0530
Subject: [PATCH net-next v2 8/9] net: stmmac: qcom-ethqos: add per-platform
 NOC clock voting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-8-bbe3389d0652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=6498;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=lKQMPlISxVjQ0B3VRRfDDxS4lZ4Pq36AYneIrLWTVa0=;
 b=FD9Eh3b3BBC8+5eruwt91ntgGZGPwaLxcrjqWpb/c4z1D+jjsLiyHOSjy/TA7jPdlXslyKU+v
 PVh28r2jXSaDoUDm0Qrrpr/70G8RXVu4KBKDUnHKWbC/CpkZ0MDmHUw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX/K9HMqi/tDEr
 4/oF8R5D4df7vQ8AxAZZG0qLfO9DrKT1PnKKHqfk8VhsluZNPNbwM/XlGfO6Szf2/8xtEYBEG4L
 hqGeF+K99DyzhklqDFjs9A1d7QQ0LxdtLwmpOBoYSTScJW2pKw+iStewJA3sHqiYJlHI7RVMv+s
 /xH+IKFX669ctOA8GYGc1qLEJOhDtr1i781F6dfFjJgQKiaAkbPZBGZ306tpKHjRGzpdhI5A4oS
 HQz4WNETJRd+k+juw2U2BpcEgQH/gycqU2YYwLN32K05Wal49C9aO628KRgmcntyeUL0djaGUFb
 9dLRlG2sLp6fhuU6KzaW1MIu5oVMsLObS7liuXrtmLaAdSvZeZj8MbMNOnBkFGZC/fvq+PsBQZv
 +BA2p7aM328joa1es2w3S+kh6Lo1Rn1u2Yax0O70YHObwEVmA+O37PYJHrVgrcFVCDQTVcya3Ix
 crQudMYACxVCGUx+8sA==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9f1d95 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=EpEVno_IuBtMqvs2hnIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: OrwjIqlrzRmTo1xFQ1bZKXF9zamCgJee
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX9utLY8toLVlG
 4994Z1veJlEWDOWw3I9IvsumPb275PCx14orlfeSv1HS/Pk7zzsdwn0HTkCPSQmb6iBqQLV4UYN
 Gppef+5kTNBymEZ05x+nwIq2H1CgP1E=
X-Proofpoint-GUID: OrwjIqlrzRmTo1xFQ1bZKXF9zamCgJee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132454_619343_C10C1D80 
X-CRM114-Status: GOOD (  25.50  )
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2471871562ed9915398614d5c88d1c6673829db8..8871d285941162c72e2a8f79d2eef915d9283796 100644
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
@@ -689,15 +703,51 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
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
+				clk_disable_unprepare(ethqos->link_clk);
+				dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -706,7 +756,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
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
@@ -734,6 +789,51 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static void qcom_ethqos_noc_opp_cleanup(void *dev)
+{
+	dev_pm_opp_set_rate(dev, 0);
+}
+
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
+	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -795,6 +895,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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


