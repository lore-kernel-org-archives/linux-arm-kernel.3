Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE1CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=; b=cCKWVQdMoYEDb/aWnyrKZ8p/DU
	SIvR2Ll46vSrzcwuB5DaJZ6EyzooKUMCSVYYHV1c2o4JsQUghOUiiAMqLWvdXXvJpPwwYJnnHzk4Y
	3GLytaFKx2Ku10dPIbb6tDgTvFKIDeq18dlrH+snwGdJYRNOAHPtAXAQI6kCugQscP8JQwpPyrJUx
	2sKvpIICLLG8iDtj9jsV9Xi3E2R/0BbYGU8eGZOg1Ywvc5xgUVmoIFzmGximlEX2Ye2EV4by7TM2a
	L+HMSY+JEl7QjxZJfgCyuT2IpuFQQ/UfXRtF+TfdpnuPrJ/9ZnXtKu9VcbLqqOXT7pK4BfbV1CFab
	kcE8jl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI101-00000004dkC-3JE0;
	Sat, 17 Oct 2026 09:46:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zw-00000004dhN-43Xo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:46:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o2sh4002840
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=; b=eHo3FNITcM89OI38
	nuR3/J5lz/UH6jTyBY1osa0kDOEiXFMvbnRtC68yNWLSZcmrlWKkj2tcJAEYeWpM
	aEcbL6vgK9Y/s+39XV9vwONp54XQncMMO4MO2Ck7GWUcknnwcq239oOu3rVuJd76
	EJcwasKdXULBJQA/QOB1z7pE+DphPMELqZ/6gbc4x0X2RCyq7Q3h7QOJfJKFjDsV
	VoZpCtlngRZ35rZBruYIGUs8GXwtr3ynXN0ZqbfDSsrg8D7nxHgOTkFJtrcaOJpN
	yHX/YLqovGji/9qP6ednoBen9w6YvDBer4xUHxZNQPcuORsIapxeR/GGABt7al/g
	glPKgA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se0j22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso1829965eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230400; x=1792835200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=;
        b=AG45/Il29Uo+GnyFu6ItwpO2Tq4HlICskbt4Eg73HchzTONMGTw60iEo0YvuUDm51C
         NHM56zVR6Ayjgvy/t/Kw8Rlx+jxjdWWXcnY3/oAixeM83e7XF07ydR94yZUsUQKvCeMh
         KT8IJT+uLtpkCYxDz/NEKNYBenvUwWY17nCA2vKXp/5f4JHlDQ+ZasA6NEk8ekKT5vWN
         SwmMXwfj+CuRRwVRoG7exRY3Zpy/MkaCCf02Rcl6k7orakiOwiwIakHOnfKamSRIphNe
         H834QlHXnEh/7MxfouUladrNg8p9Oblh+HaMSknzOV63n5jGCAZ5QXpSUPMbK/ItPve2
         afBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230400; x=1792835200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwyNx8squDcGRhqcv88DwHvZJrpnm5bfNBtJw6lqDOI=;
        b=jH1seTDa7FLRdpPtsuMHeqSRWXCp62jTHqFc8aY16aP7hQZHpqVkhNcUtx2sMOmwEE
         1bfJ8kPuO+NVOVgW7UM4zxpPviUBmIzL29QVfD4HbPJQHBwC0+HCiDXvh4nga/QqxJjq
         ROpSnoS4CWjUVXrEA+p/QYotWUA6H05E3hS8bzIIcW1DOlVSaKdEWU8eYQEdtU9ktKA6
         KLwzI9Y0wRtxYCdnDrt7sUZOW0OLil+TQJ2NFBfsO4QGvhhfQByY4GPcXWm8406UQwxo
         bnWbzpF2HDmTisgCbNS4s0kfcuQogmlbycu9eiHUGpiZdY6l+1zRqeSaitIVAsem+G8T
         0S0A==
X-Forwarded-Encrypted: i=1; AKwUvByTwEVCP1APT9Q2TXSxW55jMkj7ezdqyBXLvajcX5l01vBPmr4DXqt2j8dzxIIG98F7V2iZlnUEl6IEpSJwxU8m@lists.infradead.org
X-Gm-Message-State: AFq9FYKGS4zGIAyTK0MnorEBEiSM+hJEFdxq3SjCxmIkgBJgf4MOUllz
	nrVZmZpxYo4etenfESzKWdQ1I309Z/0n2T4ft0+EVblrJS6TeLkyqQXuP2jfHWAlYhTY/uMMhJ7
	Z20mHbzuWQGsNxUQ4tXFuAQNgw2vEIxuM12BNwHPebJ0uYNCH2bdVrFQ+jtmoPzku+O+E05fkSb
	Aq2w==
X-Gm-Gg: AYBFou3OaiEG6u7uAS1oLHaCKhv/XTt5483R5O/Px9MUg1s9d6W5FW6crGZ2W0aMp+q
	UTRGKgq7pGmyMknwbGf3PmpMvcn4SxNCbEVqFhr0Hhbhpkj1pl9cBfP9dUDizjWroC5vteYiZC3
	R7i+W5mBORBa3Mp4whgrzo4HpbObW0p8K/BS/ygiM+nqZIIC6FIV8oQlXndEColwA7BkXiqa4Dc
	fM+lVkVdYA6vEMGdYJ6tflk14Ch9CKK2LSWXzQSGSnAtQxDrVPVVyVqw1x/NuUp4DO6ZHt1CSZD
	FcXKCURHRFYNkJYLp4hOpisZKhxuMMCCUcUZpNurYS8FHk/Tt+jpy5E544NzV22+zLkFgqehroV
	YdcbSEIG1QMjqeZI9JzGrBwNXg0iiZA==
X-Received: by 2002:a05:701b:2059:20b0:144:fa57:c617 with SMTP id a92af1059eb24-18513e7b77fmr3436985c88.34.1792230399709;
        Sat, 17 Oct 2026 02:46:39 -0700 (PDT)
X-Received: by 2002:a05:701b:2059:20b0:144:fa57:c617 with SMTP id a92af1059eb24-18513e7b77fmr3436956c88.34.1792230399102;
        Sat, 17 Oct 2026 02:46:39 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:38 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:18 +0530
Subject: [PATCH net-next v3 7/9] net: stmmac: qcom-ethqos: share common
 GMAC4 address table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-7-26a8beb44b8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=4125;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=Ipht7m9Et6WvFOLhnDe2Rp01r1bPZoZU3GVWVCK2PoM=;
 b=0buwP2KxV6FyhlLYOfmxajy/KEdIt1S8Rh/NuxnaHT76EhURWfHYmoQVQKm4g9as3SDyHp1ni
 wedUK5aj9tVCvXMzEfgegErU8ZNfPz1M6Sl6op8Yaep/85PSKFYUJ6I
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-ORIG-GUID: oZ0yhJ_MppgmhPbd6NKTXiZNHu3QwxiA
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad34400 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=koHM5ydvv4bFC7S24qUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: oZ0yhJ_MppgmhPbd6NKTXiZNHu3QwxiA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5a+q6dT0BnJz
 vH0X9AMplaU8bkT0RNJTxO+qEvmLG6eszJfFh96nbeU8bf5LcocSjMazXaPHNGbwISaTpzZzQxT
 oCpykgM/ALzTTnNd4anuVvjkGiQ60i4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX/MEjJtulsd51
 0cWpUr5NFrbuFtcZF7u47UqjR5abz4q4DQz8iKuGnr9ntaiISbuf6NJ7BtfUMer9regXMxkWQOx
 qbpTaBWZBPGlUUSg9ZxJiRh0ly02R9UXdVh2l17wytB2dYdlunI+YadfQMvVP+L6pS3mzYaQ76q
 k5A9Q9gcKHvuseqAqRX2ooX9Y/WbJKG5JUl8jmclW5ULSFqy+Dy8VZFdPnxrWtuQCAsjmZQMpRQ
 6mlbyIPuiK0eeC/1eUrdA3zQoBynqwlnaeGouEBFJcUMP/V6gHU5zp7VP444pAjCQIVsjDcUomJ
 30TclZdW7JF2KiFQa+J+0pTAqIusnY9on/dO6ursG2Nxg/l6QsqHb9jNKblpew3FJMzb5Go+A64
 3yzamPoQFsJ/O/e2duYlWl3N/VE+nzCs7p2WX+4FTjAevfY7YYiD0FnVXt2hBw2ve3YQMxStDXX
 rom6gReLV0HSfRwOKgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024641_022836_EEEB7CB9 
X-CRM114-Status: GOOD (  14.91  )
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

Several ETHQOS versions use identical GMAC4 DMA and MTL address offsets.
Store the descriptor once and let per-compatible data reference it.

Use its presence, rather than has_emac_ge_3, when passing it to stmmac
core. This keeps address-table ownership independent of the feature
flag.

No functional change intended.

Suggested-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 57 +++++++++-------------
 1 file changed, 22 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2471871562ed9915398614d5c88d1c6673829db8..370eb05caabc00a20d887ac88c1ffa4473bc4021 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -96,7 +96,7 @@ struct ethqos_emac_driver_data {
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
 	const char *link_clk_name;
-	struct dwmac4_addrs dwmac4_addrs;
+	const struct dwmac4_addrs *dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
@@ -247,6 +247,23 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct dwmac4_addrs ethqos_dwmac4_addrs = {
+	.dma_chan = 0x00008100,
+	.dma_chan_offset = 0x1000,
+	.mtl_chan = 0x00008000,
+	.mtl_chan_offset = 0x1000,
+	.mtl_ets_ctrl = 0x00008010,
+	.mtl_ets_ctrl_offset = 0x1000,
+	.mtl_txq_weight = 0x00008018,
+	.mtl_txq_weight_offset = 0x1000,
+	.mtl_send_slp_cred = 0x0000801c,
+	.mtl_send_slp_cred_offset = 0x1000,
+	.mtl_high_cred = 0x00008020,
+	.mtl_high_cred_offset = 0x1000,
+	.mtl_low_cred = 0x00008024,
+	.mtl_low_cred_offset = 0x1000,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -261,22 +278,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v3_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -296,22 +298,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
-	.dwmac4_addrs = {
-		.dma_chan = 0x00008100,
-		.dma_chan_offset = 0x1000,
-		.mtl_chan = 0x00008000,
-		.mtl_chan_offset = 0x1000,
-		.mtl_ets_ctrl = 0x00008010,
-		.mtl_ets_ctrl_offset = 0x1000,
-		.mtl_txq_weight = 0x00008018,
-		.mtl_txq_weight_offset = 0x1000,
-		.mtl_send_slp_cred = 0x0000801c,
-		.mtl_send_slp_cred_offset = 0x1000,
-		.mtl_high_cred = 0x00008020,
-		.mtl_high_cred_offset = 0x1000,
-		.mtl_low_cred = 0x00008024,
-		.mtl_low_cred_offset = 0x1000,
-	},
+	.dwmac4_addrs = &ethqos_dwmac4_addrs,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -830,8 +817,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (data->dwmac4_addrs)
+		plat_dat->dwmac4_addrs = data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;

-- 
2.34.1


