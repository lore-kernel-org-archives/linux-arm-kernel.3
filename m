Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F59DCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=; b=GepG3Iu97d4akFiMi+2zHhCBun
	Z4mqZjaKPdlNua9kX1efipaF5Zl16iVnATy/U4+RPeTficmyWvRDbnSxOgyA1jaLwvJmdGoiPYg8C
	k5oN9xo7mxoait68gla/4BoP31xJZH6a1zMxTivYNgEkiZwt6nj3g7Am1TbLg/+205W5+fbI5iR0k
	nK/+cZTPzx4XcXoZQsj5JoO8gEpNdkXRr4Ej7V07Er6L+wXD4UZYS1pT0HToQNbUJ73BCSf4xuktO
	FmfHTozrZVGnQy5pvvyELy8OVSgad8DYM5EE/HypW8Ainxqvr8BZZuPk05HznrAB/PGUp+Up5oU/7
	ZCV9GoFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHm-00000009tVk-42Nj;
	Thu, 11 Jun 2026 18:37:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXkHk-00000009tUW-3nL7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 18:37:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BIQ9d34027743
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=; b=THsbrssEx2QAUQoV
	rinXUVYsccewmN0Meth3D9ZoWwB11GGiBk4xo/5lz5Ue5kQ04de7MXEzWg5GeOl3
	lUMUpSAgYfBOm68beKb3jDQk/6LTgfXjacVAgJXZTJ+EqPeRvT1FMGv+579rSQI8
	YcxN4D63MSH3G84+PS0nqPlr74+2NZfTW5nfGcRkgS1eWlGwogZ6jqYJ8eYD6/3t
	AmYm9Kek13ZwAgTTj9pvh6pC1RLnCYmRTyhSRfT8ORiF+PbchoJ7JGQyniNihlwt
	CUb7aEwIPY2MtXvBxlry2UXzVeP43TY/wdal9tYzax05+bcido54KHzmftic0Z0E
	JhbpzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er014gtcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 18:37:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240b58211so124331b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 11:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781203067; x=1781807867; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
        b=Em1Xk6qmCUs9M4YAHp6nZTyy9g1hkKUIb84UsiXPBQ5JZGsJBHvbCEzuugyo35jIcW
         C5eF7WvQJTVGDoI9ius+VMN92O5jnkzEGrj/PHfu6y/lEOxgqdzLJdnhHogzebyM2UI/
         GVZodJtFT/bMjF18C0JvDSDkf7+FSkCphyb2VFds6rEh0KC5NNsIvakETZV0okOJQ2Dl
         VbmGx0KjyERfeMHomHh3Kt/U2zEhMDyuVP3Vi3he7LF6v7xDHPYr3B13NbGnevO4usuu
         wE8CUp2x3oX5Xnhy3b0CuH1oDqooyAMevE0DJdIozKQZ6Rgoil25Zrt1Ogdy7fMk6j6e
         aK6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781203067; x=1781807867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=beS1a+gbhwow9EniREJcckpgB+TSN7Ib6jhzMotycJs=;
        b=TR1LdzoUawbzQRmYICwc+PWXcWKRDgY7fOVs2wYsnvN3lumacCRtD1t52cSfxAcg0A
         /+hRx7fbB2Ufeyo9UwbUSnTtRNnOBuU4CcpWgFKQkG2e5Sqk5xBN5ls/8dFU9IoGl/iu
         PjR5lm+H7mzA19Tutxcemq4zwd0mj6LuytWjBeUEsC9shibCOYMsBFR7InxJGIjtFYId
         PZ4Ug1pHM0n6QOfmcveTvkIL8bqHuelxCIpCMR70g1yO0Bn0/eBI0zDo7BubyFPXO6xK
         5VacIDXQQWi2b5tRZLJW340jESABNx8lPT1oO62ZNBuyiMh+O5rABRM6e8uUWlYqwNBE
         5/Jg==
X-Forwarded-Encrypted: i=1; AFNElJ/wLrOZFnH4CoTfAIXUOEsuq7ZdjPQawz6m8eth9M7CXnr68QKAc64WqiZLGdHOuYCh8NH4malCv7qPqEeiblxF@lists.infradead.org
X-Gm-Message-State: AOJu0YzY4PTbnEpdLDSoXexdVdkGnzRuE0IVMhqdmGACPZytaIa4XhvR
	YV0ZGuYFbLGbSY5jf1iNLQ5NDq2pHHL1AkNSDFHTGv6CnMaV3Jm7qONT4qab5a+GjvCd7SjvYc5
	ZdHTBa8CDde3yiGbCzjTlq/35jy8DBOSZC2NuClXXwWpPWI3X3BRoeFK/tHyPMxkWBwzn+UsFg5
	2AzQ==
X-Gm-Gg: Acq92OHzkAk+XYsCIJzgowU28RTU6T0N3oVapxaFGHBjTff3mhbqldS4TH+zrSC4yU3
	tzn3oddqhkYUV6ZzENq/jb9MWCUwxF4ODAjuFJ/YFZs6s4vTo2PWncVrW5SNeAOvH75UPzz4pbU
	L6qZyRcRG6122TLD0WP/1ISE/uLo9Z+BUA3i83guPJjSeW3LWDlf3iLA+lnNLc2EGGF4u0AzawJ
	YosoDNeTHmp41qIg9yAtts9T92L7OI4EMnQir0LQU2JVb718ShGL+NNFgE4v4tPdU0IA4gicebY
	th7ZXEXPTqwzcgiSOUpXO87KhpwEsK+N/D9XQGTGfdX4nbmvYBVxFL5gOvOpK23bZbiKvtFFnAq
	fSvM7zgKQP97GqNRmXJkRp8LlPQCFjyGHQKVD71pB7SyZGiNVOZk=
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id d2e1a72fcca58-8433690d21dmr4523511b3a.18.1781203066727;
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad0a:b0:842:57e8:1bdc with SMTP id d2e1a72fcca58-8433690d21dmr4523453b3a.18.1781203066140;
        Thu, 11 Jun 2026 11:37:46 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bbbfacsm2555666b3a.20.2026.06.11.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 11:37:45 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 00:07:01 +0530
Subject: [PATCH RFC 5/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-shikra_ethernet-v1-5-f0f4a1d19929@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781203027; l=2407;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=JQf6FOaG/Vq86vxkcpq4Ux+LVaeDywLUVuBCL3uEng0=;
 b=cRNGFK07xiHzKlfJ26rgcNf8d9si3vcKtY1yMqoX9jY4Tn5HpHhsmYACoJajUnoL17r7m0Iuj
 aj7mu7h5iuPDFJLzcuqZgYVRtp2sNTuFVrYtAGZyIEl1l5ab36lm3PZ
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: Xoee71HgnIIAEU-zb81lM0tq6a0WQ1K4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfXxfPcYb4wodHS
 u8WUiMvm9joc82+2ZgymNlV7AHjhwhnDNWuzTCIo+byxHIbhoxtfqcz5+3R9MJ1B+iQTK789k+D
 Z/rFrItswfG1e8tUuLmxIfDHQUQf7RQ=
X-Authority-Analysis: v=2.4 cv=Qp9uG1yd c=1 sm=1 tr=0 ts=6a2b007b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Mwvjr24TsYbRRF7WmgIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE4NiBTYWx0ZWRfXxJXO/F2sDMvX
 JrT/VdMBXDaFtw0aoLiyB8A4DUX5S4In9WspVLNABlyrUYtASpWespFc24qw3nUfvB5ax5KDe3r
 iCtFzNTt2MPShScnowNRLZ8j/9FMOFarmdgKBV9Q7DeOhMXw7VV6CWCYO4790t7UgbmbWUg7LQe
 wBGeUy5niXqlsdvTCRCocxZUPKhKU4uYqsu7/MHA8JS+AAqUB534u8wyUFYhChMUy7CPlKO/ugp
 +pKFPLvlVnEkoKK+F3LKL1h4crKdNmMfj1zjod98fccwjDWBc+KZcJEvtI+EF5XNzmgGHSKxZZd
 sdkapYKg75WS5inc1ruo+6qpIhK8xNdoxhpNbErnTeH6MBe96xOG4P5zOjEEoU5m5o41/0ygkH8
 dGSmCDmPsU3xn/4Dm3zEneubWIE6ciriD98vlK93TUsSsAretQmH6sfTPFmT4wQjznFMU2SxDJo
 hYbG594mQFVL2uUeCtA==
X-Proofpoint-ORIG-GUID: Xoee71HgnIIAEU-zb81lM0tq6a0WQ1K4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_113748_955226_72F1F9AD 
X-CRM114-Status: GOOD (  14.17  )
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
required for DMA memory access and the 36-bit DMA address width.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f4d4b419a76277cc6c56f03bb10d883cd4dff424..59fa8779e4e4628ae585dd5625168fca824662b0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -326,6 +326,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
+	{ "axi",               120000000 },
+	{ "axi-noc",           120000000 },
+	{ "pcie-tile-axi-noc", 120000000 },
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
@@ -915,6 +945,7 @@ static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
+	{ .compatible = "qcom,shikra-ethqos", .data = &shikra_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
 	{ }
 };

-- 
2.34.1


