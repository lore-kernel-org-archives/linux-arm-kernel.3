Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1D0CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=; b=nTkuQ/k/4zNc9xAIC4RnW2CFSA
	eBDILH2KNDldc2+JtHerIf5RYKP6ToD1lZpP4DuEQ3ZxVc7vPfWxeAbMdIPaXBUqVHGZH/uuOFCTO
	nP4kSMVplJcK3a4VESCv/WdCq9QqxCn6FHYAPLXZ2gLtC3hUsMz0A4ub+rElsNgptLmQSK+hAZItW
	+iAs5sBFWcz8d03PbjzdT9AMgzdETxWU+yFiQjlAxur1qZ/7W2HR6MLtyfmri865QuuI+X4tmn4lg
	xyq/LCW/RIhhNuaRzB1Zm1dfzm4q5tN1YglvA3HwXn86CCBP+IX+uktStY4C03XzkHkPpqjez0gMj
	dUYC+92g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadN-00000003h8V-3vKQ;
	Mon, 08 Jun 2026 14:07:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWadK-00000003h7J-37kY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:07:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRJVI3340238
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 14:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=; b=OC31Rygoa1cYQ7UK
	9AstLNJhmhLKmaQa0VOgF/+XRdBFUCC6UwS9wyV/Ktb/FolVJv2qtrcqRBUUKEhF
	vrky0DBCWlGUYjlCFT/IyMCgbFBN35Aw3nWyzA4aWzjQL6BF0wrTbY/MswV4R6uh
	f0pijpz7YoE2Rea4fvPIRjDUs+fdGP7Ltj0xxkfEXfHTP8WnoM7ermmKDDca1Rhn
	6bID3VorwtqOeOXbsP9sh1U1pRZJ5mPPEiP4x275t++Ds33TWXvANm5awMSgBQxF
	/B2Vh+T6t7s1kY8jxEK1mrzk1NEfSRsEq2wEtKMn201qSygK5uX61ncJLtfOnUIF
	4MpTcQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m0m5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 14:07:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf0d79d41eso34628325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780927638; x=1781532438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=CVqCJg0eV83A/GrQKDyi1Dp5lAiwcQDVZoIl6Ahkuq8TpDoo6A27yZWE2v7tAdXCaT
         MFbl20dyy7Nb+bf4hFBXYx4/00n7lvMeqy4Yrgqw8OYBC/oHwvbQFlUm/KXPQq6A1DPw
         MIlb8NS9El07q7Arz0sMpDCmASRLLbBNAmGM8D+4g8kBadbvZP2X6VhZ33X4N3i2Lghr
         b/4wlWQqJfAL3c7IIkUxlp2GWPUpen6FSvPqBQyrfqKh4AscPhh+XrO4HrkRSg9qWpJd
         4J1dEohGrR1r4o4lcMaVTz1/IINMamFqTNg9B2NuZh1JapWFFz1xoPBxJLLcY9ge5aTi
         frtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780927638; x=1781532438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vpwMI8a0fnitJdgxCYqYUwu0ZDxpU+HFbaXoqZRi6Q8=;
        b=nGOvYeDtEmNTSFU8XkvSFTdY/hvmFxhaZSQQUFtia+nFSqiMmJkcoCyecZrQULKP8C
         USWzkzeLZyr+xU202oWC07aXUi8VtqcYtWFth/6lUmBacody+Ne7MzQXhRucb799lBUn
         EQ8BYHNboBbSnfL1NUKhQlPwxPPgJPaAF5HMlzYno2CbVk1xlc3xJVgIYgEoiXf7fN3E
         7IivBd+vRjebCMFPiS4LsPXI9L4S96LaU5ytDv7ZwTxpDIM1UeexLBIROZyg4xbTqTk/
         kBtP2iP/2LpMcBXigKi7iF21B75Shedv5m6SKiW9uhco/JPxBwLFmttqjNNkFk/Yphbb
         S/8g==
X-Forwarded-Encrypted: i=1; AFNElJ/NqlEsGV6ztUWstMJjGckJE1yrqIeuKPIfNBdDoYOzRU1+vTSwmTR1PJiwQQDorMSqbByTaMI4m1pA1IEDusWm@lists.infradead.org
X-Gm-Message-State: AOJu0YxTTp7U9sYeBUXWaaYrCi4oSRnSh+ftXKQph5om+8/JmEYLxcgd
	O3MnoCHM0wzV9F9i8KSE4IPFmtUxynCSuhQUfthZWKvF6nm0eWtGs7/doKcjYYFbfRrymQDBzbO
	DcfmJmZghxtEOUU4Lpw5rjHiE0X5ULFAz9Qg9DhhBEg4sOCn/P9+xl48AbsvyAsKRckPuHNBiau
	+L+kcgmlMVOMLO
X-Gm-Gg: Acq92OGlbgHdiAsSOyq6d2c3dhh0QbdTVgjoFD1Ah8A3zrSdHlQ4l7WMD7SFc3agI1F
	/bU6EpWAtzJpADx8JwO5HtD+APUVhd0jC5fzqzPR5BngP59o/lKfZwdqXhElGzHnYrcRXsXqREH
	D2cQbPqTwsv4x5htocQ1i8iOy5Xng1NnK3HgPkxFmPyOgKJslquIyVdcd0wrFDWewBgcqDo/OeM
	SUW7DsIMVZ9c3EMeG1eyHNC7fUlIf8Do5iF3W1TE9rZiAD1d+plxcqvz2AEniE6bjkXbWcUMgON
	FAKaVRlBf2xzqhEHPtu4zCBOyHRPDxHua8MHlfKyzu6deFRe3EOgwH0gTHMPHe8IPyiR94ZFCNc
	fH6V/Y4n5HeDx/fbgD4b1ndKD7wBboUl18qdOGwxoDaS0wpzIN2QOL0tAEnTa28U=
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187867365ad.5.1780927637560;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
X-Received: by 2002:a17:903:3845:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c1e7b3fe70mr187866695ad.5.1780927637093;
        Mon, 08 Jun 2026 07:07:17 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1646e5c51sm183935955ad.0.2026.06.08.07.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:07:16 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 19:36:40 +0530
Subject: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780927607; l=3808;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ldYjYAGXo9AsC38/Eko4nOrSCJF7kUU15KKBuwcyPE8=;
 b=mJqkPYbxbRsScJQJpieQcSgJYF8xfF4BRtw/Lj10jdnv8SKIh4KRJCE4LdjY0kpg5zUwH8pNn
 /0Xgj0KhF9PAINqKk2urbc3bNU6KqB1yUijwzwn9HrUSDaWSKExfPm0
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMyBTYWx0ZWRfX7kId6UM+QgOS
 JQ3VmHp3XSuSu7DQNddmR+w3VZPDcHfc4L57qAG1KlPG4OIMa9Xkk/UuNbFuMJX/DSz16tCLWG7
 t7P6+0n6czlLTXTO9AX2DuJw6DMOzYl6lcQhaA/epdqXAwvrp7yKOKoU2C5SjK9+8XTYB0tQlB2
 bMRwKHAzPRecr6NzjbZk7OswzOs+ve8ty9Dp97MDslEXmOjdEC17SMRl3F7CAAO6FQjaHZrVylQ
 wBGo0r7Vf9yWdwfWVVFOuHcNqaXd9dSktZiHHmsVJNLVFcJsLM0YKQGYf9XDKHMHqoaJ4hkQ0/S
 J6fjlf/xy3YMr+nGljZf6yydadY1S8w7K+jQ6r9CIG8kj6uz31E7BkHNrL8ztfX16jfALQ5QV8Q
 FdYqGGRLOWod0CCI9utTZOj5UaieJC2WZQPALBAU/J1yhwpOcH9CSfhfQH3Nq3nDe3M0u7oV/eo
 cW1CAWvIFD/0pHXu2kA==
X-Proofpoint-ORIG-GUID: i37uH4dfyi6HS-KxcQz1b7a6ZTtDz-9h
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a26cc96 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: i37uH4dfyi6HS-KxcQz1b7a6ZTtDz-9h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_070718_796311_89571441 
X-CRM114-Status: GOOD (  13.12  )
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

Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
and OPE blocks, so only a single IOMMU context bank is needed.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


