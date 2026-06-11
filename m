Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED4ECD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=; b=RigRvpcsYu91Mgu0zk5f4a/YIJ
	jBCWQf1FCHDIQARFFs0alEI/4PdHAl4GFszPpsqKxGJXHIEnFzg6dMHE1sEMBf96pbSYt1FsgEaw9
	kHOvP7RND+9KkpDbsZ6Cvh1sJ9yIvYt611VUsV61lVxAUHTp89z929EYSxhMxUvcyuFXl1jtUXyiM
	i5JBeshqR/ldm9EzxHyvzJTc3sXu0+DF6k2bTBMSb8otsEyPxnYerlzNkuHO9KMxEPGvC5Z7ZvTZZ
	SkMKwA4s4h6JBsABN+6oioEM5tpYhL/582cgvU2PvSjEz0zGT6YfSv1EHdiINY3QNyXx6pRIE+ajz
	Ur51hf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHg-00000009tSW-3Rz4;
	Thu, 11 Jun 2026 18:37:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHe-00000009tRD-2rdN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIS4rQ1433838
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=; b=MUO8NaskBty+GQfn
	grcHqROxQkF2kAJTeL7/02vjr7Om122IM0OxpiKBgVuC1yhFBwQwzqAXNoK+Bap2
	pCyjGAQ4vPTsaeX28NlguttVcG90Dlu1zeWkGURiMS9JvsbpqQQVCmgRxfIw0fdV
	pUsFjSeUWZvM6Jhj56BI4glbnUbmbxM92ll7HdCqJ93dEs0NjtCOarWtkymEWjrY
	mJHy2Y8zYdlTzQPuYX4IWGGU38CiktMGdA2s0sr73R1lys1CuDnoajtKfyP2r0oA
	mO0FREmCkDR8Pti0cLAxIRKydcif5MTDrYNLvRnMBqxEEp+wu+MqZjLML8+z2Yls
	MrwdHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7051mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b9d265308so137200a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203060; x=1781807860; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
        b=IsAhZ/XPYrFZLmXy09H7MbAIHnPc5F3HT/6v/9y12kp3/yzFnpJ7NX0b2nRGgsqoVB
         IWD6Mbuq7zEqtPT1WMeyQij4qQj+oXbw44euOhYAMi40e9qPcHU5KI0rkY/NJ9oWlXU1
         wTR5rUCMd8QZi5l9OLZAhniFD91OUrCCi+Spal6dv0eiHA34q0p1rQCysJX0j+zEVB92
         Hewcaeg5HFExjdhs+40eVZVM20FQCLAzq2MAI864L99wXC8qi4FH9UpboAYoNwSzN7te
         aoiMN9RX3GQmkdqy1fpm0PlpA85ncigOHZ5KLYv8QqRy5B757oOc2HQehHppbwNJP/zH
         Pzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203060; x=1781807860;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/v4X6+xp1eqpt5xDCt7e2HETdMjp4dbWkZLG+SeJDac=;
        b=c3rJ3AWuwu5Cg4nIaV7wALrAY8jkAPhB9bQvuirH7VLXveqpLnUnxnKbVZMu/1ptt5
         nIJPD7AiparDm42eKhU56+PaLQnelyqQTpQ0K1LdksQWGJPlTVyAvMJja3heGv3xXL1R
         r3OAbDTKUNGFsKa5qgUwZlIRk1gI6F2ra1lnu3AEGpJoc55r/yAxBw8Iuuq2Xm4+1ZJO
         Nq7tQNvGc9jpUo7+Q+539XMHI+p6hE04lZecYZZvfYbSs4MyeCAY2p3gJNQsGjnhqzjm
         NZf0YvF4CL/VRUsgeA8wpRjCTS+VopqdjYVH31g5uGjT4hjqvrp67oV1Apby5zTVf6mp
         96qg==
X-Forwarded-Encrypted: i=1; AFNElJ8g10cvRklyDdr3+8sLMuLGFq96vz1r8kYsFJx+rqIxbdPXUeGVioYIdI4XZsTlMTvSB4mILdDI63pU0p0ddrf0@lists.infradead.org
X-Gm-Message-State: AOJu0YwXfxvZHp6k/eUh0vxkvHU6NyO/ZN5Um2BWbjZI9AKuEm/9CWUl
	kqOi/+iY7TxYcM/Hy6evQ2XAKl4mxHOjhyYV9R8S1OkxLuwbhqdIILg8+wozptUy7ZwXqCIl4R8
	UaL8oZjM04wZ0q1MNkPpg+ghNVm5rUp70UxEAXQbzGBoDQ8WVigzpegs6cgXzrx6FfOuw14cvWi
	OUqA==
X-Gm-Gg: Acq92OFXqipquqqCOHcjFCRIyG9S9BB4atnlUmKA9L2O0DBxpJtFeMR0c+wMBag11jO
	W/QJfYUi5ZtiUBlJtnyZeuVC/lW80xed0SU5P2mzbHt23O2P7my471hmZJWTypBJ1dJHvQU25E2
	6la1Z1zUgCYMOFrkhbg6RDRIPvGOe9eedzeE0wMhhqfjwvrBa5oxFRVd7GZyT51RsIOk84YUBsm
	NS9FdFONNZsvxr0hnYl3e7eAbOURZ+l+r31OA1cukyvP+ddW7VyDkgSxGFIHwU/bQtfjbDUJmoZ
	3gR2iIQEol0TwyAlqbTvoxmoHi4zYti22a4OeLJQi64ihIDno9EDBEhbKDlFlvGwssKk4QA9yUT
	OiQ+3/60KZz8t1dWrZUb1EAO+H4bnsLycnZKXFbrmzaOi/wbq/wE=
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-377a4ca0e30mr4643591a91.16.1781203060241;
        Thu, 11 Jun 2026 11:37:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2690:b0:36d:ae6a:22fe with SMTP id 98e67ed59e1d1-377a4ca0e30mr4643571a91.16.1781203059802;
        Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:39 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:00 +0530
Subject: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
In-Reply-To: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=4681;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=ZmBtT5CKOpRmxcc7v3W7uVY7c9Er9mvwK+eDsLT5JgE=;
 b=bCe8anHiaYQQwnOm3jo4Hsfoo/mKrJW/Wl8EEkqNTPeb4F7OP3gQPxML+Va5VRquQ4ea3SbeS
 NSdDKQSUdd8CSPtEDIX1z/IMfhBJE0waxtMBBKSSF5s2NDKd8mzvSC7
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: 5zgMMhkgchss11xl00x42qWnTR0dYWmt
X-Authority-Analysis: v=2.4 cv=B9eJFutM c=1 sm=1 tr=0 ts=6a2b0075 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=upsBg6xUXwFThmIlPvgA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX8sxqCkwMMHtg
 9XQAY7JL3RjXrRbsAQ3R8JrMx5XltHxcufgXFE8/HlYx05pIZ1oOrFDqmGY0cFmcp+VsjEjz6J9
 KVtPmSWBCm8lf1VEZa98A2snfAQ+6aPygL6EQAcbOUdQPKR3jMEYts2H576Vvqgvx5fR42dzGsN
 mHWEK90+WiqZcKbSdBBQ6zvOnNuY8LAbgr6hRr98n0+DH63lWrpfwLXMYelBYSJoYlsZSxuu1Gy
 byKXRPqWxfhVWBEGz4EE0wK3oI7iFelcWEFLor0a3dHXXm9ydNi3yo97+I1p1uN4dvH77omtZ4U
 X1tyAK/1tCL8uo+Uhrs610mxwaAgBR6k2Z26Vko0DlNanYg1Ps7ddHm6RAdXvYhatMWEppUCych
 XWD/s6qccHDziDUTMHewdSFMituiPKWQ5IaX6+l2ics+IrzcfWBPx5EonTpt7oSwju6hpLWU26e
 swcjShECXaKYLi9WZBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NSBTYWx0ZWRfX59U0IbFxQwRF
 Ja7RjeWWcyEvoocHeIZ9zp45t0q+nN9uGhNccZwPCHlcrK0TS2HpRykbcyOKA/BWCtOL+Wdt0oH
 AER0ItfxsRLU0OODZNYVEFgqdqxedL8=
X-Proofpoint-ORIG-GUID: 5zgMMhkgchss11xl00x42qWnTR0dYWmt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113742_842483_BDB1A98A 
X-CRM114-Status: GOOD (  22.65  )
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
that must be enabled before the DMA can reach memory.  Add
ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
runtime structs so each compatible can declare its own set with per-clock
rates.  The clocks are acquired during probe and enabled/disabled
alongside the existing link clock in ethqos_clks_config().

No functional change for existing compatibles. This will help us when
we add support for Shikra.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index bec08f1eb8cb41484ba3c91c77393e163e7fd071..f4d4b419a76277cc6c56f03bb10d883cd4dff424 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -84,11 +84,18 @@
 
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
@@ -98,6 +105,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	const struct ethqos_noc_clk_cfg *noc_clk_cfg;
+	unsigned int num_noc_clks;
 };
 
 struct qcom_ethqos {
@@ -112,6 +121,9 @@ struct qcom_ethqos {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	bool needs_sgmii_loopback;
+
+	struct clk_bulk_data noc_clks[ETHQOS_MAX_NOC_CLKS];
+	int num_noc_clks;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -696,6 +708,17 @@ static int ethqos_clks_config(void *priv, bool enabled)
 			return ret;
 		}
 
+		if (ethqos->num_noc_clks) {
+			ret = clk_bulk_prepare_enable(ethqos->num_noc_clks,
+						      ethqos->noc_clks);
+			if (ret) {
+				dev_err(&ethqos->pdev->dev,
+					"NOC clocks enable failed: %d\n", ret);
+				clk_disable_unprepare(ethqos->link_clk);
+				return ret;
+			}
+		}
+
 		/* Enable functional clock to prevent DMA reset to timeout due
 		 * to lacking PHY clock after the hardware block has been power
 		 * cycled. The actual configuration will be adjusted once
@@ -704,6 +727,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
+		if (ethqos->num_noc_clks)
+			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
+						   ethqos->noc_clks);
 		clk_disable_unprepare(ethqos->link_clk);
 	}
 
@@ -732,6 +758,37 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+/*
+ * Some SoCs gate interconnect access to the System NOC behind dedicated
+ * clocks.  Acquire them, set their required rates, and store the result in
+ * ethqos so ethqos_clks_config() can enable/disable them at runtime.
+ */
+static int qcom_ethqos_init_noc_clks(struct qcom_ethqos *ethqos,
+				     const struct ethqos_emac_driver_data *data)
+{
+	struct device *dev = &ethqos->pdev->dev;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < data->num_noc_clks; i++)
+		ethqos->noc_clks[i].id = data->noc_clk_cfg[i].id;
+	ethqos->num_noc_clks = data->num_noc_clks;
+
+	ret = devm_clk_bulk_get(dev, ethqos->num_noc_clks, ethqos->noc_clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get NOC clocks\n");
+
+	for (i = 0; i < data->num_noc_clks; i++) {
+		ret = clk_set_rate(ethqos->noc_clks[i].clk,
+				   data->noc_clk_cfg[i].rate);
+		if (ret)
+			dev_warn(dev, "Failed to set %s rate: %d\n",
+				 data->noc_clk_cfg[i].id, ret);
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -791,6 +848,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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


