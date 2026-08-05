Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD8C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=; b=RhM6Z2+HpMFqhqSUg7YzbBnnEB
	p9CDD3foMrtgpZlN3Wl1QbfHysQwkaKgQx/0pD+HMBye8euotY4CRZRjfXI+kAYUcyS7kTno+iZ0i
	DHFE+7c4uYwgYbNo5emmyIlH/RZQmoMMwDU4yCsykycGDM7PCtLP0+wCa9uZa6wlgx1zO+BwMOPgL
	ktxTGtQJT0xSSQ5i2VutBgK1pPryP348N+a1jRQTyFiu51TdgcfRLpX1pmLV+a3cRTtfvpLEz3MDm
	sCRcjwy5zbp+nWBjy+BQSjr8lUQ326IGyWBk8cC44TIHdfw+AT3dy6JwnKDJFQ+C0iFGOQQigqhHr
	BRbCzXHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3V-000000041Ue-05Lf;
	Wed, 05 Aug 2026 13:53:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrc3S-000000041U6-3CWZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:53:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675DHiHa2773161
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=; b=m9IsQMs0rIyVN1y6
	JSJYCFnaJx64oDzxIJMXhLvg+xMpnnXqg2Ks0Bbhqi69vTL+u/l1xGrEQHTMeHDC
	f8Nvq8REhlZsXVSnrd+bmFUNMiM7ipRPiY6KPa8pVJLVoxb2AgdtBR+ts0nV6SzQ
	+IredQXIbAqQcCHD81GbE5HrwZ3WgOO5DMvbpbOR+f9pol4+JFZ3SKFO36qtEOnM
	2YY23Ww5cpPxb/dUCw4xnZ/Tuyp2u+p5IYCiXGB3EQWKyKuSlMK979WbObd7ds/P
	bZn3x+Z/fR1qm5aUsqCGwTb/x1IgVZEpA04Oub7bUHN7EhvLHFyMwIha+DYM1l6R
	f/ALZQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9r5vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:53:09 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81f0b6bb02dso26993047b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937989; x=1786542789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=;
        b=hl+Wuub6pDd9kkbTdIiu5C5KdtjBmbhTbsDG7YTXSo/6yKnpWOQE1mI0BY4i7arNAl
         SJkP5KeqA6GsreFcrbSYccyo4emcD1wqGMObpTVISsh2SjGx4rA197EXTEAqoFCZurot
         JzVymZDT24z6ZANViaqoE48Pv7DuNJCvp7n8sK7DEcJvBNtUwrIXTqLSeJsyFUsb1wB7
         4ymeL7Ub+IXDWT/MFyIGabIWFAHWsN7ZrZfxSGkN22BfTf+ozmCE+QIz+lceeNXH0JAC
         KWXWf/uA8Lg50GEmnrmY52CXJNl56a/vgjk7n9U0aF9ot/iGbw2RsHqBXKyAnIu56Qco
         Qocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937989; x=1786542789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7OIJdm3VbtrlxeJChZycDupxK0CtLDat6B09u3YioI=;
        b=SK8y5slaRlSax8OxYhs1Iwo3g0CT7J0Yf0Qi6uqEjxXECHwzG4ybtE1DNV+NRlBOOt
         YKEeMVlqOqE92ElzFFkeq+v76beORRc3vkU2nIY8NY95rW6Jbq6LVqfXESAgQXw9gvNA
         QDbhQswOJLp9wSEXPIY9l0OwXKWDEMtO1wKTO5gzsOdCqYUX16dD7xxSzaDpGwnsBVaO
         mJMU9R+c9om2WGa/IBG3M+xmiiz31OY7NBzwfBHMg70s6BXGkMYDRzvLh7JicZaxAMrG
         nI6wQvqvi6wQ3LYhDc2DH911Bc/GdpGtpW6GQrzd+6qv8WytoETSesgtgUg3PhUFe13n
         MKgw==
X-Forwarded-Encrypted: i=1; AHgh+RoZYbzij5VSVY5cD1OBzVPL0eM6nvTh2EVTI3zVINB42bhGJYiYucU6iW9u+sqyuL/GgK3vy8OITwd+JiGtYLtz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4PPV/Vc0zxG8sQdj51iuhG7mfK+MmE/7tZpb//+XbnnWszowB
	1qAiQjzqmFLXoasm3Mi0F5jAzTOOSH8EBv9/QvEFC4hyOF6ywVjsqtAUUjHCEPDTMieJItTSMmA
	fwmUCFrTQWn//d4maUAy1v44wu6I8PiPcD6QN3A0FxtmQPQw64cV3R3IvabSac0ifcD6E574mx7
	xiuA==
X-Gm-Gg: AR+sD1122n0sDZYXsSIKfSfV1Jnbuyr2kfzKeOfR4m0n0i3yfZpcgSydSqc+n2UCfC8
	FLcu8IPCfXKkfgueiDpGxJKx0h4ImjNDa+ZiOrjh++ZztMdH1eE96OUC/m0S1IFxhwCgwYuHP4A
	IPkWFgwBiBS5Tl73yIgxDn2IThVGfm+JCOMTYYeMKzlYRig9Eb0d1MxnM/z8piv4UinldSKMZXS
	hjwuT/xsOOi2npFgrF4MjVgkTHRBDgPdnF9mUINFwywGpdwXT35v7558BKoAdyA3Kg4NfiMouup
	EBHN/9y+ekHLsFoRrKbZAADbYVasI9wfn1QKTNGi6Wh6BWVJ4tXUYJcal9qXsnieeb22JeH5WRl
	4viqZ38TuJvxQ1ZColsdDqRFBstWKWpg=
X-Received: by 2002:a05:690c:e3e8:b0:81e:d8ec:d86d with SMTP id 00721157ae682-8201f0c1475mr40011907b3.2.1785937989216;
        Wed, 05 Aug 2026 06:53:09 -0700 (PDT)
X-Received: by 2002:a05:690c:e3e8:b0:81e:d8ec:d86d with SMTP id 00721157ae682-8201f0c1475mr40011277b3.2.1785937988569;
        Wed, 05 Aug 2026 06:53:08 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8201320ec71sm20892517b3.12.2026.08.05.06.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:53:08 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Wed, 05 Aug 2026 19:22:46 +0530
Subject: [PATCH RESEND v6 1/5] arm64: dts: qcom: shikra: Add CAMSS node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-shikra-camss-review-v6-1-a8dbc66f0d87@oss.qualcomm.com>
References: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
In-Reply-To: <20260805-shikra-camss-review-v6-0-a8dbc66f0d87@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785937970; l=3966;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ig1ML5YRxSKYBLnbyel5EiPeXH4lJTzPwD446Jp+noM=;
 b=Lf8N5eVjJBhYzRlwMotuU4Jml97qt2JyamtsHpbZZOPT+DCMpdZAJdgTOPKgvKtJSykRhRJgX
 jVgXX4L0/XKDRhKL7bxxmapb9/0jon3V+L9wwisnJgGO1dPMpIlqI1x
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfX4qS0dabUsJR7
 3TVl79AOpqKYzpO8TtpB/pEUYDFybzWVjmoYB2eYkTq4YIGzK9tNMvPXcP4psl6skDMqZ+XfZHb
 mFGZvKTO5b0qkTQgNaLtUvvROrnGyLnk9NQ4COm6se6RyPMJQRARvgbYW52btOPcRPlC3TEG8cg
 8U1K6hp1PlenIBFaOjGW0zCQlo3styC3jPjGbK8KAqxapKtTctLiklEcjAeqzCZIiGryUPihlva
 8B+qSoITnm/lNFyDMBYjP/AN2Z9SAE2n5s2+5RhpzfE6cNXnsr3tEt54ZkqsW2TlQK7NP4nhRfQ
 h1DNP1lLIkHJrFCHrozEdM2SpPU9+3S6eqihhmeJhKvtsifFgbflx/LXzqDKbwfoQM+0QIfc4Ga
 hcIms0MJTkC7IuqRfbBvGHorOCFVsxG57XmqPnQUe9vCjRh+lox/GSBJB26o6BqyVUgzWLyTHQM
 d/mICsupbwCnvH+ALSg==
X-Proofpoint-ORIG-GUID: zL8XhJ3vx4qglPOt7ppJ3K2gzM_zTN56
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a734045 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ahKksh3eZu5pIVwncigA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zL8XhJ3vx4qglPOt7ppJ3K2gzM_zTN56
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMiBTYWx0ZWRfXzZZqraI/OG9z
 +i7w3qPg16YRFJXdTUJKqfxMfTdKZiI+olUS1jsYs/fcoUvLLtXRJSBbPJTaHPIFaWwp6OX585Z
 /4ZCu4gHkdmuIKSStg6z6NSwVsWCXFo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_065310_924881_3C55662D 
X-CRM114-Status: GOOD (  13.40  )
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
index 80e8045282d819f14cb816b8b924dbcfbfd866ec..2e5976861253f4402c75509f52301c21e3864d1e 100644
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


