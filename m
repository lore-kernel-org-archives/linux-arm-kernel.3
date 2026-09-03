Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C127C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=; b=kD0nZNwo/oT32mwl2fMzKVE4KY
	e+awSQchf4fmemcGn8fuN1Gl/mka1QCxMUGC4jspWwNluU4kESEtnp4Dtzr3JcnU5cuSfxnGAiMIV
	YGtwIXxLXHnxJv/xs05+cqx1SeoCQbVXbqmOK9XVab67/L0BS8fE5f3XIVh9/pVGVyPoL0wUksTZz
	NtAbTqNmlVhqcdIrFitksetNG5ehMOYdZ0Rf9IJi9Y4Kr9W5yEzNbbpoLqyeyOYJN0/y8NkJuzoX/
	tjTDs0oGQdNcbOx2fHmAVJU5ylqkV5/QJ8XKxnF2Nrvfya4t9PTCko5JL2XF5byaRVoFhKDw1rSYP
	JRe0HjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Cad-00000000P5g-3ia9;
	Thu, 03 Sep 2026 18:55:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Caa-00000000P41-3EP2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:55:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3Vww1091151
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=; b=ADFubAnka63XDCbD
	aqDT+9JpXBDtCltgiFy6CDI2ukQgiTLWpoMa/bial6A+VkAtZI5K4/2ONSDjqfME
	e5dyGBqysDMrx1dA2+d92LztUUNy9I6DtKsRLVVRXYMo1F8ljZCLNAahjZ3Wnwr9
	Cj87k9RIRIVwMjKzNqhbWlvO+AHEnSxRIkDse/Z/+P0bVJ8xQGLT4w677r/DUmls
	xaBJt/9B/0yQBpMl9x22IiMXuRM0RTlPw2Dit8p6trc2/onrUtQ9tBLHqpXyvfkE
	pEmeIxLiRuRVF1sgTV5tXAuVP1pQyDjRj1VXS6b3vjyn12eq7SvdHqA/49Qbh6Tf
	GAzKfA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekk28s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:55:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-399311947f6so203833a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461707; x=1789066507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=;
        b=BxkCRt4YCUtHKFWJLwQ+9B2bMjj7gAhVmzUR4WHkwTXdp0ZS2nZDuaRXqML69fpHtD
         +7sVHNJUGKipb+fj084p+fxY/oSY2T7OAOlbfHlZc4nV5FofjADW+H2pJ96+pBFAiU7j
         7aCYYEYp0PGVouRLkQNklGb3ulCeEJn0Fuupm6Mgm9bGT/dF53uqm+Z0qOqBE+wmja9k
         rLgBbYbXbs2qt/7yGnmlF2ipewEH9ohtGct0GTYU0m78RiP9vHfktcWXzcSzvJERSATd
         RLumpJz0b6TOAAR2qF+DW4OWbVFwLKSW6zMVuoN0dTI9qm5Kqj1fY1josEu66Y1S0Bhf
         7Maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461707; x=1789066507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nlYWxFwCRtD+CyHkSV4Q7s20WNU8tKwVLibr/6VJ2QU=;
        b=EWMlxhDOgbXv+GGM97be93GIZL4eMxOzRAjfVvoti3UiSMeYLqfHL8vf+nNsmOGRjk
         9nfhAJ7scHXzDU4e5Zq5qXJ9RVtHzPLdUhJYuUMAzs3+xVyOG3BBnBuRLld+1zmpmhJQ
         bficptHgu93VwcnQNqIc65SKdqjN0/EekMtYg50Oa5Vt1ZdNP1Lkc820tmPSAgq1GNTG
         h6/PQFcYW+EzVMnB2lDfmnMLmhC1Y4mUG/EQXHTIR5ft0SmlAtAUlbJzrGzMvxkr28zH
         /7+3lGT+MzisVN9+OpQlaFfK+ukMfhwbcbWDrVrUBTuxYrbErKP/qq9obn3IEbTn6+c2
         FQew==
X-Forwarded-Encrypted: i=1; AKwUvBxcvcMGs/aLmLQ7mHbr7Nohxaa+mVZ6ajaMMaq5FxqggnDT9DBOn12EnmUaU9i8N8ST1L7M7PibdU/vx2eqJSek@lists.infradead.org
X-Gm-Message-State: AFuF++nFkPupQThaxUFUYiC72KhU/bFwjiK6qadfE3c4QCPHDWuvqX4F
	+9nC3BkFnLQf+Iolxg6TXvwo423OycgACfgLME1dmwMYfRDM98bypDLH2Vf3aEYlzCa4GN5V6l3
	TCzVZUrMqbM01C8O03VVsv4jTeZVns26e3EOKhQRBz4pMFWD65frTTrkvbA657A8XI8QDcW6xSb
	GHsg==
X-Gm-Gg: AYBFou0rq8dAIwkuFOJ91c+1/0jhWAQtgjhTuExlVa/1d7Oq8/JKyKzo2YY6mpWAR+D
	8R/iQkGnZqddTMhSDIB63EIdUb+KIAnlbek4ytl5sQAutGL13YpqEnNlhwiOMppaTPDsuTJ0N7k
	yGBaVjAIL3c332YV2+cheG8gMU732hlh77NEN9Q9xQ2eMRIa8iHNftSNIbg1Rv0/O0NhVsc5Tm/
	vPzqo+g62SSz2GydPMe2BR/2jE4MB61GJBYJvnrtpR7JsFVkZtRqDRAYxv8CLZQp7ihpkkQXjgo
	5r4DVXEDorRIeR0GmrQZhcUX12u+XHW1qufQb8Wvn1vKeXHKmR9Ga6vPKF2PD52+9cSEJ2kSH1u
	3JwCh91xIZnqqaeFWcXQ1LC74K+SE6g==
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr881592a91.6.1788461706739;
        Thu, 03 Sep 2026 11:55:06 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8d:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39b261002f5mr881474a91.6.1788461706059;
        Thu, 03 Sep 2026 11:55:06 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:55:05 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:51 +0530
Subject: [PATCH net-next 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-9-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=2446;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=6Sz2cqNRtW1LNezPdy1yYmWDiunh7gud6qBkVKoWCGw=;
 b=eafzCTaX5oGSJgmMpw+62BELOmcZDQ+A8rVZfjvC7Ql/q2fwMZyJnskZrX4L7XK4y/BoPFoX5
 J7ufBnL3yKMCY/FMtq9NyBMLv+s59whooCZWyBOXtIPKdRElcMhpUII
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: QTAG61NtRKXnQB7TcCMHdn8QSxR3zSML
X-Proofpoint-GUID: QTAG61NtRKXnQB7TcCMHdn8QSxR3zSML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX4AkC93d2sfk1
 Am3qcBCn6VKhI0fcOlqqr/e+YnVB0k7vP7vGbR2/DlqV+tmu3nRBNKAmVvJmsN2a2uIbc0TJnuI
 FgTUyNl9bkBD8A1qY6OPuAHtGxa4wUaHe6AQ2Cjq6nVIdRwFHJJemGlmPgoNDlF6Z61F38h3z70
 MT99kRzeftiRrB21x+ysauSzqMZRO4Z/X4qxo+jylCxZwzJU5cofdcOr8e68MUU3tidJT3QXK0y
 0qkvnxpZFZkfw9eTBt1T3Uwke/zySzOPDqwQ74EYC74EzA+O2pD3Lk0PXqjXu8ZuG5zLHYZ7tbP
 vmu9uwmMH07suk5j8Sbhb8F5vnBoHqANmq3+i4Lu9qkbeXGOp7QFwolHecouYJQStwB6nzVPkSZ
 iwj9pK1cKNsKhVpV4EC9joDRSa8puYNbACuY4D87nFkWudxoGbid44frTWFaLp++e0trkJ+Swkc
 6LwIlfYPzct1aAOeEeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX1LPAn2X1eNpd
 2QH1LKna6gGmSdpiA1YdFeHDDpcZvDD1QpiDciwVo+1kwj8TCUuMsGFKtNZBakP8sYsRdIAwY6F
 T+EmPoglzITt9//oyp6kLJYVqtHzj4I=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99c28b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BjTvb0yH8tSpeHeYq6YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115508_928106_74F09369 
X-CRM114-Status: GOOD (  15.18  )
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

Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
backed by a new shikra_data descriptor that enables the three NOC clocks
required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
all at 120 MHz, and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index a31541506a4c930c76374d7d8b7eceb6f51f37a7..f96680456472d1fa7b72bd404c1ddc20e505f05c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi-noc", 120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
+	{ "stmmaceth", 120000000 },
+};
+
+static const struct ethqos_emac_driver_data shikra_data = {
+	.dma_addr_width = 36,
+	.has_emac_ge_3 = true,
+	.noc_clk_cfg = shikra_noc_clks,
+	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
+	.rgmii_config_loopback_en = false,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -957,6 +987,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


