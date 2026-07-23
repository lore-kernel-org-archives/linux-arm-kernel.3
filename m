Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36524C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=; b=Y/yMjDLKvW4Xdtfde4pE/5Iu59
	4bE86jEq4XriOUBvXG0h45l0iYkwTG6u2+oW37Gzzr5K5pgW8qAQ2pzdCqz4EKzuSJbyNZAHsyMxd
	Imk0Nc9JkLa38xSJY7OguEMpGJE8+r39bMX72cI7QqHgowzld0ftrXB2UPk9KYvPBQSGeZzilp6Dv
	lQud0MDLgBjXc6oJCqnANbZsNkn/XDxIOWZE3kaD6lP4ufJ6Mz2goiImNgPhc9Si9/7A1lgQLO6IX
	hKbK9Nvr/+iOyTrkAnfY5jt0vkI1NVdXwzkPNHRqENj2jcpTW7Qa4b304vawIgjwT3YWhtXSai/og
	aPkFaFHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIN-0000000DQ1j-11NW;
	Thu, 23 Jul 2026 04:44:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmlIG-0000000DPzX-29wb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:44:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X9fA2658543
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=; b=cXjpJjPCy3bZRHCu
	+E34WGMNeKHlwVCJPOBCMyZToQivrgl3OUv6DH0rAcMK+UqsO1RuAmPZF+2o/0DQ
	ysTi1JMYsvMRfWSKULM2Dw9n9bdgtIi+uojYNQlhyaNY3Nm74CZk0zIdgbeOyPIi
	s10NfznSJ+yyvRSth5oV0ON3fMiqqSJucMLLrZjQlKzWJrdOopaYCdzgcoAhKara
	IwtoMqQEz4v/Ykn25pyjmcjAbVmN3MWj7Yk72tCm+ZAeA3SlEN+El3LR4w4a6dlN
	VsvqtzTcRbYMnUdFovcyNdYDLCED6PWl1qHSvz9D+LGiJpKp6UJFVKobUgvSmUQX
	r3YsYA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b510bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:44:23 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso301963b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 21:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784781863; x=1785386663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=;
        b=SRtbNy9XOPy6FNQuV4uv71uTEq0FA39WtTRB3LNkL9P9ozOfxR8tYPnQrUqnBNJuxz
         VLGPeu9cz8Yin6RmtlPLgqaM+biwDMnoO/gXr0ImP/8hHSXxrp4tpwMb7kiK62SAPiaR
         AninC5cc+e3G+wuBILcWhx2682rb1tRmVWqMLlRj+z61udgF3ozkwh2goQ0Il3NCZpDK
         N/SHVaPZurvI5oUi7cw4x1s7DKFnUAspyV4B3rQlx/Gs5jBSM5oQTIMyquQCQDeNuMEV
         il27z0VlY7fASqYqxQBQiLT9nIegl6pH9Tyh+qNNwOVL5dtyOmcIJQEU7DVZflvcX2bF
         WYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784781863; x=1785386663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uk6eXswhPXk7ia8EY0gX+lBahH+0TgY0YHRYlIfn1pg=;
        b=Z3PdBDhfvfKHcw2VqfcwEa2YDi4nRXQkwPTviYesnG621P5K1JHyPSXpNOKzZy4XVq
         3Ety8TfIQG+XUExmE1hGPiddDvLIK3Pr33uYh+bJvTrpOoYPKrosCsI02P5s33A6lVgi
         QrIfEg8qP+9xlkycx8CudhBTUVfu/FmIv5MHMjLeo5H3wCAkVXAv/cJ81SOXJvDQCSHE
         IDgvCPhqj+G/tKHB/eT6uZYdx0y9Fm0A7zU9AchBAZTMrPbhapUMAGO2XS403a2xaPfB
         VrlcsSJz1SjZ9N/ZulXgIBaUVFtJYhmdVAAFkb1k0EjmA2yyd3FLi/ysDWIu9mc+VaWp
         15jQ==
X-Forwarded-Encrypted: i=1; AHgh+Rps/P6z7iwCS8ShA8L7htyb4JW6OdIJTWYdrH+1istYey/Iv9vTra+F7XXPq5mujO41jtSZOtORdgC0zaUvPO3J@lists.infradead.org
X-Gm-Message-State: AOJu0YxEQTo5NNiuMpePvFB8OYtIYxC1yJuYUFskXQ3pChSX9cW1o2OQ
	H8iKY9na8pooGkl+Iuav9xOFiKROVnwdC1LjeIvnA1j9TV5dMjnHO1DMHP05mgyvaC+w23UOKG+
	j69F3rurjPX3m9/KQPnuzZYluPwwEnErau1KM+zvsdRTtCPtlmDXF+jMC6+Cs400SkvzzbnKWQN
	L52w==
X-Gm-Gg: AR+sD112LGBtCJE2dWWGAzlaN6mgOoRJukpbofIVwIHenz+v5jqVJUeB2tOPs5GsgZh
	339vd+6Hrkt0wNF4UprIb+b+IZUNnBqlo5W0glgR9TngdUzffjgem24xrpoPEzOzQx7bGB+HrgY
	aveiVOFQeitEEv4aGQPolqDnQJhpGEq4S+Dc37QQ21JBBcsX3ExmXqemMhHeqbLxMNOdPjn6uEk
	7ZIwGk+unAa1u7FVBfsWsAothc6DTvndMAsI+GFRrIPzVpFhA6ofJGOOnihqoYYSB7safLAB0Ya
	wGql6W15ljLZs0LVXGeq27dggPyuxckliMf3fM0iMv6qLhjDwNpVTRwzLRoyyx167JLYeb/oMT+
	ulUK5zhKkVFyQ7stp5rpl53+6j1WLLDE=
X-Received: by 2002:a05:6a00:12da:b0:845:c373:6525 with SMTP id d2e1a72fcca58-84e2bb2395bmr1829633b3a.41.1784781862910;
        Wed, 22 Jul 2026 21:44:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:12da:b0:845:c373:6525 with SMTP id d2e1a72fcca58-84e2bb2395bmr1829598b3a.41.1784781862451;
        Wed, 22 Jul 2026 21:44:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e175aad1asm2327922b3a.44.2026.07.22.21.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:44:22 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:13:56 +0530
Subject: [PATCH v6 2/6] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-camss-review-v6-2-7c46f9bbb4db@oss.qualcomm.com>
References: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-camss-review-v6-0-7c46f9bbb4db@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784781838; l=3966;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=D1n9L9gbfR65jz3NtcMFzb7EnvhrcmL8xb/Rqg2Wqmg=;
 b=RZ7JSUKc7CI0/q2DojVdaY6OREJsajlJM6e50P2PWCDfwtHrKjy8d68R9zUTseBdvKaFzhRzg
 d6wJ7Dh4dC3ARTTqYjhbqW26nHhoZ5av56mpbi9hMmjgt89I6XpN5F9
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX4MjvnD3tHSw2
 sJvjQ8e0yKejXimGbcOt3KfH21B0WKKV/BWQ53alKTyaW4nkxUi5BAsFBFoRILSHs6AXAts9Udg
 /RucowcoiTCN/72GqHwL5A5efFR357kG1v4nBXwatJ4frGkHwkVnPGeBjy9fJQEbIGX2l+lP1Nt
 gV/XCNezX/D2aktzXqbB+M59C4PDfWUWiogZQR2lqQ3F79a02VWOb9artb2s3YdHGLgGpukUTnl
 4mHNh5LBsUEg8W2GGomOpYRcBDEGIQs3Ujf11nrctFYE+dM+SDRVETsj8tXMvseoKevPc003WGp
 cUSGEBzNMwg79VvAXI2slR6RpNfRKvBnHCiwfhdGJLzfMWbbVlaxH9XJFfxijR0Ia1MPMtCIvwS
 QKjK+nkYPxEM28sxPy1iLIkIanIH7Lt0wwj8a8PB7pzZUDEMkcIWrvEBBB69xStoJL9c03hLhEH
 zLI9T1B2N/MX+cG8G2Q==
X-Proofpoint-GUID: rPgda25M_s6JVUfh0nCw4cGXTURTj8DJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA0NSBTYWx0ZWRfX0p0r7m+V3LZ/
 Ifu97FswBpz5awLfC8ji1IzeGoWOEnsDVkIE5jt9dK+befj9MdsjgVEaFz9prvdhpJb1OT1UWs7
 DYt7ht7C1tNdjKx4uhuiAvmbqGqaWV0=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a619c27 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: rPgda25M_s6JVUfh0nCw4cGXTURTj8DJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_214424_599096_BFB2EDDE 
X-CRM114-Status: GOOD (  13.05  )
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 100 +++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..f7caee4cffdf72b7e98f5dd33a33419087cb8b57 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -640,6 +640,106 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
+
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
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


