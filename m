Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECE2C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=; b=1MzTVmo+o1LgUbXePTCHr6xyRa
	cyEWTMM8q5KFIbw9TVFFFmcc89WMpy49Z8UsDolpReSzwZOE4Cd7RKAtnAOdh94kNysNxQqlcr+YX
	HJ8CfrvAj44lXB96DGZeUwkO9L0mm6L+XMPKFYwrjkQceGLkKWxG8sZbQnU3TyOVHpobO1GA77H0i
	78vUHKK3fsLxJrJIMZcXrycBLnnexml4U2sFUHfzwAkh4wPeriFlVobMmQuJPdRmXC4E3ZL28Yjfh
	afn6tI55bkZzNf2UMREePQgxOkxFA3xd+pJy5mqTbTb/AZqmr8aiQ1lnxQF1g2QjlKUKrlUQ88Lsv
	2CamsMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fto-00000007hdj-3nxP;
	Mon, 07 Sep 2026 20:25:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ftl-00000007hbK-2oFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:25:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687HWLAi565042
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:25:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=; b=T4PlL33Xk5zjDyxh
	BUlto0g8F5GJA1rMWVho56/UPhEgBpa/mWZ44L0nFhxxBesK6Q1CrjnoQPzPXzG4
	UN4i5ePBHUpBptW4fo6NEjAkgiSt4uVx/YIu2NvRuGbLfUkv2V0x/K/Sds2kOS7u
	XzgMUGLwY8gRY5IpTY0kI0T8F3bdc/b+zXXIA2p6sXl6alBn4YeRtHuMeUQnSCMW
	xpzRJeCeuZB8wvrroUJpamTu7CwvU10JlSQyvjTaEK5dqC0M4QZUt32wSAuBnX/6
	HyNGUiWay4EnOU5H4Roy50/BdILONCtYj5A30283rnN/EEO3mK0sNZqvI1xY+2ID
	rdPFCQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrgev0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:25:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so48015455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812700; x=1789417500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=;
        b=MvOgKn9eJ+cOTL6NGdtRhGE9Hbm9zmW/LEtzU82JVOikxNBXkL7GMVO1pYglQzj1FN
         zaIC04eDLTDEPyW8vep3Q3zutPKy+w5so6njIRHlblsJP9U8pYQHZ5Na45MQzsZwiJNw
         1yJPNFwEWD4as3k1/TLGSRwpKakk/YmePkRE6Fu4q8GFyQB1p+0nMo2zWGIaq6U6cxwb
         EBgu1EMoNgGL7vbAKBX5mAKBZwhHRKcQCom0fqgL47ppvidTr/g9HEZpmyAKX+eAonfA
         4WvOr38C6Rlo8t4zv5HwR4KFy3r7oLv6vyw0rUoRdb7Rsenq7vo+tMK42BosN8vutzks
         C9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812700; x=1789417500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hrvy+QoVG0RLYoH5IBz54YMeR8SjZQtO5lp7S4xTaVc=;
        b=YqY9WUUoTMEhvsIlfA2vHnfJ6yFdnBRoxOmQnseamWe04HQy3HzwYjKoJz13NVKwwG
         v8UyC/vmZb82ieZOHklAQ/10uDzum+RI0Mof0vQVzzce2XU7eJeYynSuCrXMAYsdbhGN
         EAdVL4N2c2HZGkzQObWT4WSlvlOutv7+rGoi4lAuXmzi4A96WzcadPv9gQN7JTpnDAWq
         h4LSpXKaHS9h9CgK1hKI3EqSFiAEOZ5J0OdgIRvxHHQUlKJ8JAh0X5JaC3XwpCVgQgOu
         tMnZnWKh29k+CFNKhQ/NFAUPBiX5J2xXIAMNAuB+Fll1vpDEB5MLBcfZitVMDEImjDRo
         orBg==
X-Forwarded-Encrypted: i=1; AKwUvByTlmVH5XmieqQa83wxwzk5+iLYNGKbJN9SZOdVZ4zt1/x1t4nr/KiyiiXNpcSBNYtrcgyvgfzHAov2X3asBKgn@lists.infradead.org
X-Gm-Message-State: AFuF++lJLVCR+uaSIz7ogb8tv2yBxkCvPAIfFSWoBAQFxj018G4jd1AX
	CTRKQ8B/1f7i0RH+3l4u15r6f21q1XGrPbkhwkCHnl720ihLbprMxon3J0+cHGcSrO8Aw9c3DfO
	lhyAwWsnySqDNpxzszQY9Wgum04s8OHn0auhWo54YjV9Cl5QRUn1jWKuoJMag59qnjbY3f5Xpv/
	rKb94WljX+oA==
X-Gm-Gg: AYBFou124rUWJIg0UAqc6BDorYmJ/hKODrLct8xygXk7f0lxfrLj3Ao9eJP8vK8Rfm8
	nVxvK2Afbk/e8coCk9pw5nFj/5EMA6hOLpCdmnmwyoqOl7ISTDCP4kZu/B57f0hhubmNMPULIOz
	HLq/nz2rUWNXuqzB/TlvHx4QPVutWPnbnxOPrl9ifcr0du9vWk07j3N5DrTzwzcao+bl2Pwxsxd
	C5PRK7zAabvXVFeRdTeJIdVMcdx+7SglnuVzbhILMjW3enw1sHy3zcRsqZTeBGEK7MzG4IJGP1p
	GhEgoAOusGT7cwF1mCyJhd8OaUJTB8d5+aDRVPX6anISUUI7kNP9BlWdiY7aVy7NJlO/U7AgCK3
	iOGEjYz3inHM2Nrcf8ggCh5Iqb7Hzsg==
X-Received: by 2002:a17:903:4b04:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2db124b1ae2mr337578545ad.6.1788812700541;
        Mon, 07 Sep 2026 13:25:00 -0700 (PDT)
X-Received: by 2002:a17:903:4b04:b0:2d3:160b:c01f with SMTP id d9443c01a7336-2db124b1ae2mr337577745ad.6.1788812700084;
        Mon, 07 Sep 2026 13:25:00 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:59 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:21 +0530
Subject: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=2805;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=KsLk75r2w7Y7Td996D/f1RY9lIMY3ClaAGPh1T4xOuA=;
 b=dBBGlbQ+PXRK8wV2RTj9A9/IfrTUGHY9GlnPObuNyviClmSFJez2HMSBuIgjBJYSaU6yfzIKP
 OhRIpYexXv8CIc9lrWT634bEjV/CIGTmd+QQsDzMWwxUsfQ4OwMfErw
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX12nqiA9zFMQK
 GZNoI2Q3DXnrz8yWbVFT4dSLn2dLwdWoEsfsHpGEcGyRBxuVRNbwXM1ll6IIzoUraEgxOPWHKAv
 BK9zURvxRNuYJJeWyWCq40BpmvD97Qg=
X-Proofpoint-GUID: 31BuPZD7fYWvYSY65YvmQCRz000S2W9a
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9f1d9d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=8IO8aBILldGQKMPJy6sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX55r2Oey9jtZo
 7WquDl/Qi+3bMeeBsGpfQOBZkXH3qUgWUwYSSYzeuhuz7IoLNagzTKe8VXhgU5aDM4XyVlGviBE
 cgYUehYp3AI5At2SuGcG8BGxdDNXUFDdi/wfIh2Nm3DdTl0hH57rBUemWRq+C4+NjRsx+gYsjYM
 sPQQjx50X/sXe/vPYTxh15Vdqk+2wJQPgY8wTYlQTgurlenyUHNu1DBG5AhO5V/KFoEXSuaOP6d
 1v38I5fLqL34AAWKcFUEDLlUSpvv/uMXuvP1nD0Re02nVBlifvmJN2HogD+tBXRRM4wUBV5KDXj
 NFDJolgKVP0z69d77wJ6bE82bsVhCNuC88YFt9iAzgNNDO8PyGFK9paCMUSQYa4SZ9AmkzHPiHi
 4gqVR5xAurboh3qborOJ7Xw5X0MXQErHqlZjzWHldUHIPZTEIlXtgjb0X6gP8PBMPzyCVAsfv8D
 cUes3xrBYmO4jxHFtcg==
X-Proofpoint-ORIG-GUID: 31BuPZD7fYWvYSY65YvmQCRz000S2W9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132501_739664_C35B60D3 
X-CRM114-Status: GOOD (  16.43  )
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

As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
a second enable reference on the "stmmaceth" clock, which is already
enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
run at 120 MHz for NOC access, and managing "stmmaceth" through the same
clk_bulk path keeps the rate-setting and enable/disable together.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a488640f6dbdca30 100644
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
@@ -962,6 +992,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


