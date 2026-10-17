Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CE3CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=; b=o+tOrAIRaVQcG09vo6oOvkJuPK
	PSlLiPFUFa0xduOWLmcZYaktjKUIYjN3He3IhtASkkHccQ7OXFFCLgTHjLZtGW1ojp4bXO73faj8v
	Q6dUVLcl1io1+cE6hY+8SiNP9q6qtVwfc/DsYXzBqaIaHqr2geAF09qIxMWDf5yWxthfgM6+sjqCV
	3MSFGmFnzFXqL7VceAj6mJUoPItUk9D+Xgouv9Li4Kni9PsoAXQ6rGLHrHkOtlSLl2+0nzJaxw1k2
	IyunsbG8Lk9tjxB5Uplt8EmL8nikZDx5g1uzWTVDh1MZ80AaFPdLyM05WwPofkHdqq2Mgu8zd5R9t
	CuoK/jbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI109-00000004do2-3qkc;
	Sat, 17 Oct 2026 09:46:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI107-00000004dm3-3JA5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:46:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2VC046971
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=; b=OnCyP+rarJGQiJvq
	VjC3gS+8JO0e8AHCY6afLZSzvAkqpvil44cQCjYmTNR30Yw3L/4Xu90PSRO2/fhF
	2bYXG2ea7gUPcYsLol7bPsNoU4Gtc2Z2NfQ+638cAUSqzIem0tW8819zp194BwlV
	iGkW2KsvX6sFzSkmL3o0MBOJc4tN8hPckwq8vkE/fa0YM58D9X+okU9UnNMm1Mx7
	zNQB6uKJtrpV5Y1vZ1xjqKuSGFKTbRPXv7e4C/sLs/OTS/Snk3e4GM3VCXr596Dk
	ZE+SgNNbabVNdMaZIfvDy+9y0jDlIx5vgGMma5rZsD1eKCZFzDtOJeycrcCMbMtQ
	Ju0cNA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bggqfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-152d1363a29so2691154c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230410; x=1792835210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=;
        b=LECLuCMHjzrXCUwPZlouG9WJSxmOj23/aX0XqfDnA53tikT652rfLDHgLSwtTBlI3L
         4qa9OyMrTHN+Twi57SJXxMaGOZDJSPlImfexcXeVQxywvT4u9TzuVfbhuHbQFG8nE/q4
         iOIkVSW+sBH3uCm46RHkzOnE7Yn1AFGcoTJiTefN/7Wtr00TzHs3yVRzZ3jvhRP+jdTJ
         KW+BPOVxHJKhmgSrVBW/hgKqcuBDCUFeXLer+sQnB47M87AfOWS+N8yGmPpjF/6kHJ1J
         u1InWDXCP4th38kH5V7O2dCWd4UXqsTIWe4FzdWx9wU21Low+gVSQxFu3+bGCMnJ6jO8
         /iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230410; x=1792835210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxJd5cO3iWIuSrAJ+9vQi0/59AxdxBAufcniJITxJnc=;
        b=hhFhQYb/XD5JHGJ+CevDwNIvZySxReN/Co31+MQw42qsUiP27hAdoR0ohH55k2vHdj
         xY4qkxWnfxObcPgPLQixj9/lJf6vfuBew7hKZWOZh3ADKPypzHv7uF5ww/DNhwqxUK+9
         SpY4M1NltBE2zGMkX1rvAYYGNm6vHot5mBtkwjmREAjNPIEAwBUa7NaK5OIEX0nAyuKm
         I9ws5EA7hsh65Aeb8HeM93cy//6cYNPqtuqv2mWGrjPSeLYkvpZCCiH+OjpjYW6YR4dp
         vHDyImk4raR+qqmyyDZ1q2wCATf4AVhy+/msmJlcOcMJUzg8diSSrQYcKpRL/nP8h2fi
         58wg==
X-Forwarded-Encrypted: i=1; AKwUvByvDnoaeunBf2GZZEM0cTTjVSBBgxXVR880eLhTZPbgvcR5g8OvAkFWUuzuPGw3roma/uQI71I+eNajr1YXu7z2@lists.infradead.org
X-Gm-Message-State: AFq9FYImfQ7jFNLOMlQtluoFxVllNYq5FPm9Mrcs+huVJc6wvyvoGSxg
	nq+GqVqvuS0K7anuu5zA3PN9IfiCUFjjzBiXpQWPZIiaXGc9CgkLHzV/rJVUvgR+NEHsjWgYlab
	XqqVvVznFTq9CYQ4IS6Z90U8z0T/iSCdYSDiwj5K36zJQOFBn+HUfWOpzxEJ0LU3u7BWVfFqNZp
	/KEA==
X-Gm-Gg: AYBFou0sg7gMs6pBdr9Uu+XWgBjoFEM4uh7T7KYo8UgtCXFaydL1s85n25+ojP7DCU/
	vDur4VGo3tcCKIuIuS1mCX+0ewNEaopQ86av9cXlbmrS7RzPEWacLU0sY8Ka5wRYHJ9VofYzIEx
	2+TZW2mA8qtr9NTiK6h4bJmIOXeUlScbZNPyMk9H6gJfXyYZvB0R38d50KEeV5K61hzyg9tAHz0
	l+WNS2nZl37weRsd5AKQCbfWGDdJEounk9+db3HDWrJ0xKYt27dRoQQ4XM1/WmEYohs5Mba/Oz7
	ZDz2VRF6St1EnVwHyzdleTueTPQ3yI79oXm3YzqNMGirRulQQWkm1eid9MnvyPl4iZxluAV+E+f
	jFqobrfu+Vz2YFgdofe8em/eF5/3s8Q==
X-Received: by 2002:a05:701b:420c:10b0:164:475f:1a07 with SMTP id a92af1059eb24-1850ce9ee1dmr3500613c88.1.1792230409501;
        Sat, 17 Oct 2026 02:46:49 -0700 (PDT)
X-Received: by 2002:a05:701b:420c:10b0:164:475f:1a07 with SMTP id a92af1059eb24-1850ce9ee1dmr3500569c88.1.1792230408783;
        Sat, 17 Oct 2026 02:46:48 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:48 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:19 +0530
Subject: [PATCH net-next v3 8/9] net: stmmac: qcom-ethqos: add per-platform
 NOC clock voting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-8-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=6570;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=9eVv8MAf4LXIE4/rruuWX0tApHl3P2+ZhsZWI8Gw7IY=;
 b=lXZAEmKZ17rfPjuthen1QPZFjUXUlWzYJGN4j3PW5NuK5F8UyAlHLfi7pC1PbDuzfE/vwVXJ9
 j2kY2ymIWl7D2AE6pPnGyFnfGZQLn/mRPDxg9IRkwAlv5Shj4lcvVoK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfXwkoXhoZTY9pU
 88s05JwMFWulo2ZLMeav9vCT5Xe2Hzm4tIoTHjOiYQkECb5Nwd0ZJOExPkpCPfhITvY66rX+Kj1
 /fQYW09pW/R8O5zctST8UVsOKGIDOhk=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad3440a cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9mpPtdtZZqvod9v0kJkA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX4zHoViMkmecU
 WL9rPUuODrwv4FCra2exPwzjREEJ5lRK9us872k0bFqn5gYeUHL9/+/E/nlTVRcOrfDxBhBjQ70
 /9saY+8VtTc2Nn9wCYshF1oKF0zfJWbuzGM5HoAUA+kzHq2+3HZUnuidnwADf5aJEuHOaAL9OeK
 MJHarSdP5/fdfIplokC281mlybYxlojTdr0TAuHhLFO9C+xSPCROwn0MR3kMsbYEPLK1IrsO/gV
 //MmyeZU84H/fgkQidPG/3AoIgjxXmgundYOqO53zRt2ZGqi4wKmFsg2wDcHbKxqZ5bb10UXfxO
 SC/+Kjr37e9U1fz37OMIXyUS+ldR0/kv/eZ5zPOszxc8+8zy2F3hvprnUlarsxbMFnAtxZTsvkX
 PGSpnfZXaruNkcTV4mOMap0CFy4h8cVpNyhw2y0lJIeloYTka12CHbWLo0bOvrCYYg9/Wv8ZhbE
 MWo34v91nCpIcs0STsQ==
X-Proofpoint-ORIG-GUID: amsa4xRmC7aZDAeOJHs4nuorRTLbEGDd
X-Proofpoint-GUID: amsa4xRmC7aZDAeOJHs4nuorRTLbEGDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024651_989021_9943BC65 
X-CRM114-Status: GOOD (  24.50  )
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

Some SoCs gate the EMAC DMA path behind dedicated AXI clocks. Add
per-platform clock-name lists and configure them as a single
multi-clock OPP. The OPP core programs every clock rate and propagates
the required power state.

Select PM_OPP because DWMAC_QCOM_ETHQOS calls PM OPP APIs for
compatibles that describe AXI OPP clocks.

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 104 +++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index ab3c4cf964239d724945651f7f7b5448118ad5f3..c86fbe2680ad46b6d444c1469b90872dff9b26b4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -146,6 +146,7 @@ config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select PM_OPP
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 370eb05caabc00a20d887ac88c1ffa4473bc4021..9c602755532e141f4b822721686b1481b29b7d4c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,7 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -98,6 +99,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const char * const *noc_clk_names;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +115,9 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data *noc_clks;
+	unsigned int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -673,18 +679,61 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int qcom_ethqos_set_opp(struct qcom_ethqos *ethqos)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned long freq = ULONG_MAX;
+	struct dev_pm_opp *opp;
+	int ret;
+
+	opp = dev_pm_opp_find_freq_floor_indexed(dev, &freq, 0);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		dev_err(dev, "Failed to find AXI NOC OPP: %d\n", ret);
+		return ret;
+	}
+
+	ret = dev_pm_opp_set_opp(dev, opp);
+	dev_pm_opp_put(opp);
+
+	return ret;
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
 	if (enabled) {
+		if (ethqos->num_noc_clks) {
+			ret = qcom_ethqos_set_opp(ethqos);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC OPP set failed: %d\n", ret);
+				return ret;
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
@@ -693,7 +742,12 @@ static int ethqos_clks_config(void *priv, bool enabled)
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
@@ -721,6 +775,52 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static void qcom_ethqos_noc_opp_cleanup(void *dev)
+{
+	dev_pm_opp_set_rate(dev, 0);
+}
+
+/* Some SoCs gate NOC access behind dedicated clocks. Acquire them here
+ * and set up an OPP table to vote for the required rate and power.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct dev_pm_opp_config config = {
+		.clk_names = data->noc_clk_names,
+		.config_clks = dev_pm_opp_config_clks_simple,
+	};
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	if (!data->num_noc_clks)
+		return 0;
+
+	ethqos->noc_clks = devm_kcalloc(dev, data->num_noc_clks,
+					sizeof(*ethqos->noc_clks), GFP_KERNEL);
+	if (!ethqos->noc_clks)
+		return -ENOMEM;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_names[i];
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	ret = devm_pm_opp_set_config(dev, &config);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to configure OPP clocks\n");
+
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add OPP table\n");
+
+	return devm_add_action_or_reset(dev, qcom_ethqos_noc_opp_cleanup, dev);
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -782,6 +882,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
 
+	ret = qcom_ethqos_init_noc_clks(ethqos, data);
+	if (ret)
+		return ret;
+
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),

-- 
2.34.1


