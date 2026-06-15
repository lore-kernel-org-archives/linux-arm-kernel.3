Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3114CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=AAYh60EOoRrwIU/uunk1dmC+6E
	eaa3jE8+tHh+r0s4jARkYfqT2r7a4ZsvDNa6u7ZJvZWdfTCDwNTVNAP/JsPQc/s9mcx3QtclJkW3+
	YOkc7aaqQ47A52rGqV2p9Bo2cXK1QNJSL7DOUPMoiDmbvy82kepytsCgSM/qXf13KVjGRgvoxv6DY
	hQ3CA9S++X40L5wmApeVOIXJ789nJbYgPBfqDJ8eDH0ZEIE17D6B5FZO5OEX7AFvVhSLzErcRNtpf
	NTusxsEh5WjLA/FR1WvnfHN191KPopTLVkifmupjuF8ZIbEnqFek0A40F0ittVMAh1MkE+Wkzi+PY
	BCc+EdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2m2-0000000Dshp-2GOZ;
	Mon, 15 Jun 2026 08:34:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2lz-0000000Dsgp-3Xjb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 08:34:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6J0Q53344546
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=; b=h36EGtv8Vx0KQuJD
	PZ5IC27QV9rqS8hOCPuzi8adZ9hlXABwztMwbiGFplsxterTTY7eQ9lrG0sD1dp7
	n+Nb3P8885TdV+y/WbWvc+xAxXhjWJhnl4KHCez6JNidjz7vDBGdvxgBQalXT31C
	l/tIVgLFYBpzk/dvZ8pm6lDxUV7lCH1v5ZXev4tmJ8sWt1tslZQM0Iw8fbUuNMNA
	GxVXsBATQlZISgrdVJ5qLn9FeM9IbxcE+CS+NcKkbNz9CCUtHctHDXys2ei369PT
	H2jjniQDp7moJKM1vfTBHA2+2Pf8TqUhR6HGlTNoGXPGay/i2cMPgSRh6K+WVb0B
	GeiRhQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery9feefr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:34:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c0b35fa876so36380345ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512463; x=1782117263; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=DWpdWHsNpa+jB5pzfgc0bmTVMVZ7YAG1iErMU54pG0EDeIDDbCBx0izrmzGfDfE54E
         n2olJxtlRFQU9JUFe6PpxDtTNVc8aSXQRtekuOEGvuEBCo5t8bNuDDci6YwvxPkb+dU2
         UoXD7dVGW22JZLnbguSM7Vmhz0XzynMHlpg1vEeBIckW4OY5Kph0hCPffsuZPu25XlXL
         JAIGSjotUn1eehN/pxIjJHdnouxPXOXVoJ6QJc1JJfE+9mciPf6tCO9WrA8EGMpzdpXE
         SCBhDjwPrPavvpr/4hPVmimsfqHK7+NBJgQTB6wNlpsaPK1pJGvG3brxJcAO4f+HtnyD
         YKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512463; x=1782117263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XeXuSTBUDtUckVxvoOvS+dfvJD3DA/ozz/evToIu/as=;
        b=iW1A4MA8VZQH5Gesvohq9ccT1a2pRDPABSqrQzOonDmnABvUkgPb1mUAKOpvyh9QXV
         ZAC6C9anAUUxk4g5IDRmL1ssItkPX9+iFXgX/cVtWHp2p++jErJRlox6kIz35sUs4E18
         IZWLiPcy3c49dz6RtGfWy+/ydG+dPvd+diela9j/YrU1oE2fufzlPXJ77m8XYBuLcIvL
         X+0FnlvIDXqPCeRtfzTDXghNVzOW1SsZp9hW59iWH/xtfcMWIkW3rFkvRN7+iZYJ1H2M
         ymgjzHr3Z7pajZ2fnB8Av6xKSdpb6q5ChpyOobmBXpaRgNSTzNLmBqyQLjHoJsQs8PZD
         kFVg==
X-Forwarded-Encrypted: i=1; AFNElJ+/edxts2RYjFqkErSEUaElnGJ5WG1qc8z891EnVxmGCfgGnPUSmZjtBW6eVKdULMQM1Ia7/yrywV/UFpVoPTL1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk4oaEg0xY7oLYUzVIazvB1dyI1TaVHeBvtQDOjXbZgJ84hQGE
	S3yJLsNwsWbz0ZW6plzOII2v2Mj5swzKPEm7F/aSuyHzRiSiLIwdWXTMTRv5zoyAV3WkQbWshb8
	LCrjt07ZbAxiu6c43VrykcRyQjS+Ta97qzCh4cMwWXirfMy+T6B10cIMn1I2fpAvP5qXHoqadSA
	Hb8w==
X-Gm-Gg: Acq92OFaPS2AH6DTtTv0bv6xf15OfMNogA0PagJj889zFg0rgUcow+WghMisgDOVNCh
	csbNiRKhZM7Xc+Dm3VJw+mnJg+D6AMn48lVDCBwT0DW6DPei2Uv/ehwPzxoaYjBluPiFCfnjfia
	3EdMgqvjap8aN15jUO1CyXAbVuLraxyOYMWTgK0Ov1iIQuYHPPOKS0x+vp+NEmowxfsnDQjau9E
	vZMGuoYSUu0EoWFFnFvbsaHWjg3oZ1rkLPLxP7hGheKma1gUxQbz1kmeHMnsHta17O+2N/3Ak48
	NTzkr3afj1gRM/LTuPGoxQgJtuaSvt+pEWDfihduy7l6cjZ1oV/iqjd/WlHsvIrkBgNFRxF86vx
	E62cexWCoVyqaZ6ACesvj9iMAgAPf92vev1+Y5S/led6JGpgwsFzd
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136315025ad.24.1781512462603;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
X-Received: by 2002:a17:903:2310:b0:2bc:ac76:c1cf with SMTP id d9443c01a7336-2c4136e81d7mr136314725ad.24.1781512462126;
        Mon, 15 Jun 2026 01:34:22 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c70easm122789235ad.25.2026.06.15.01.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:34:21 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:03:55 +0530
Subject: [PATCH v4 2/6] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-camss-review-v4-2-bcb51081735b@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781512439; l=3937;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=FD/YYzeYflttpFETR8KNzzuysuLGEKsTDke9rdJBgPs=;
 b=S+g3AVCbFZadW0cTR3VKyGr/WyTEp+9L5TnSb1M6ihwOPpO9a5hWKeZBoHRpo14yQvnGDguUA
 sDaldeY7rINBJKtG0qa3JAYOz+R0/fS0KO+jnsBqbCg8PVZFhry85FL
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+EaljRYRC6Nv
 9uWKhvEJhiaTB3fHivP7KDUaHOqh7lOihwmfupvU8EHGktLPXA2/nfUStFPGC7W9BX+rp0ZzKwo
 zUvqUKxXdB+RJVKI57jagSrQt0PdgDs2KE1iv/PzqxC0oUg37zgrQ7g7clbGRpjnLfOWH3p3A2N
 Evxydd8O5faPmm2tuHIWwULb+KDFtodnDpC3fvj06YHWUFwQkaZwT3P7zl5sjesOC4pG56DgJ0o
 uJPNWYz50DzGm4jYqPi3WZOlhaJ/zrAF+Qk0WMsccrh02Hu6wMFhuPNOxEyDmgm0ncFXx9ztSCm
 FcGR53aY0l2SLlDZxgPZINSxx1eeDVqFxZlaqHYZmO4S5tBR54uXkcElhOxNLav67KR0YwSmZJL
 f0wlmd0RnhDon7AvQ/LdWcGT5ClHNGNy/sh3CSGCHjzsZVqPJQTnpgF8c+DvYSXNX3kGVKm6vOg
 m3sfFDVNj3w7VkxpXEQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OSBTYWx0ZWRfX+rxmBCT8uK0C
 YcIPS/7b8ZoqjqcSsz+gmgTcHCq4RnO75Wxlsvkg+C3w49dQaVl0MFV9fvhhLAGsqp0SRcNNZXD
 TEl5xyNZrFbwWinRj27aGl81bEdutec=
X-Proofpoint-GUID: cfrkThls5LDPPKThakZnZxoGVTEUBC3T
X-Proofpoint-ORIG-GUID: cfrkThls5LDPPKThakZnZxoGVTEUBC3T
X-Authority-Analysis: v=2.4 cv=ULvt2ify c=1 sm=1 tr=0 ts=6a2fb90f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_013423_884290_68697254 
X-CRM114-Status: GOOD (  13.14  )
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
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..f0e827996609dab2c09834857a1bffd9560155a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,106 @@ opp-384000000 {
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
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1


