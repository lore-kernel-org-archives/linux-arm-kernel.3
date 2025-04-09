Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A450C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwC1MXd1DUxzL/Pd3IiGa72EeBbd5SeSmY7qcx7CvjY=; b=cPiI4F9fURShL3AyE9BPAKJ19/
	wW8r8ryzn/o2mhy9R2uns+doMfDiVfTjFCQ3mG2Cu/WdGp1k50L7NodoUsCFyhBOTe85zeFFTbNpC
	6wmjNbxokLdIvLsD/5AfC2OwSXswd8wFNR1SqVudpYI5LXFNWk1jVxcboNyH3cm0R1aWtrV049fiy
	MXlVQnW+EW/ZYb7M0Av4Gh35JmJ7M/xru5J50QHhvRXtq0MqBkjnk5Vdwn9KMP7NILcq8IvxHa8BD
	L+WmFn15hutvEFNjPg+pO/sAvS9RE9azEWtgvKTIVNDnDu/efd0FcZCROudwC6l3TwSjDCylL+wO/
	TfqXxr7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZeJ-000000086CQ-2nnD;
	Wed, 09 Apr 2025 17:55:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZXM-0000000851V-14xq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:48:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HEr8p027501
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Apr 2025 17:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwC1MXd1DUxzL/Pd3IiGa72EeBbd5SeSmY7qcx7CvjY=; b=lIsm59PY6Zgcd7PK
	8K7wwJoZmWhKeqosXjED+afh//KKyPbKLmLZ1YvyatEUznZ5IphtRe/pfkfnuC2A
	dKlw80/Wo0dZ+eWZH7ofPoGge3/xuHoz6yB9TbhvxmgcBp1+3WYAQCPjgZOPZQvr
	t6j0jNKCGc6oL5eB/tArr6ClM03LBoXBUAUhdBS5BDqc0F33T2BXjE/7nAelLlWr
	qogaVyhMRVz4IFxtidwrzAJq9M2Ojua8N+/xo+jWR6nmVvQArzD6sD4V5GPMdnC+
	/6fJ+pkWOs5mc1ilvP7ZtN4skHRpE8QDtbfXJYd37+jPcnoa1EzF01DdaTJxonya
	V4g/pg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrmd05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:48:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-227a8cdd272so61729625ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220910; x=1744825710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwC1MXd1DUxzL/Pd3IiGa72EeBbd5SeSmY7qcx7CvjY=;
        b=I8H6g6QRvTkDniYtfixCRE/8HvvQQG/TWSvwUUcvoBVvxPoOXCmo13JhMrK6FYDBOL
         1eXL9VfbXn0HiNILXnMIfqSpQwsGYeCCpc2IY8Z1Eeq5Mh0QB2BxoaHURa5ACgSMeTWp
         2gBir+G03nz+wGVFKJSBXN7PUZTFCqx3QdEpeF2TCjHObDWQvngNZ3zDgQz9mSM99/V0
         HI9Skz/JgOBNjJD2p5c9NpgL/hegxWbxpgOqB/huten2Qv1Zm67vN7r5gMW6BsCFjHyL
         OkjHTv3zW8rmfPK/mfmF+c8Ph2bf7pq0am6MgavXkujo8GuwtzG4Scc90YNG4siB17Ke
         UbQA==
X-Forwarded-Encrypted: i=1; AJvYcCVTeO+p2g3lK+smm+tbKnB0VPTNVWbVwmCiB5OBGY0ipOkqUjpUAeuNE0MoJlCXULsfRFY60sKBcpj3XBrKkQh7@lists.infradead.org
X-Gm-Message-State: AOJu0YxXtQIdSGVmfONp5Fn46E2c8wnVrhs2RBSA+fXgLjPVAzmwnNru
	ddPQl4K6pLk/chztNC9xWlpj9b73hq8ElGDv2iuyQN6TIpDLYTh5lZF3WxcKW9iiaIjVmipeWhf
	/KmqVLDhX+3jJuaerY//Okyzkt2rOhqnBfJLKNqFPwJ0b6h06UXbgL+pT9ZLaIhTM/VEop6LfDA
	==
X-Gm-Gg: ASbGncv6bV16u2rvQjVdcZPSO4PxmnBaW8/4ikrRyX9KOXhKzm0j3Ne8jrSJuF8+GPd
	/1wH4+0GTlz606muMfqG+m3MxOPlxbJYQOYPB0Snni6Gs6tWbGHuJ6OzGXszf+ZmoTcHfggwNlY
	mdQc73mxL1QN+wsfT8jHxpszd9f3VaajpaLykkBzbJJQRfwsoGdopP9nYgVPK2y5KgTaF//d43p
	buTStz7sLBkimf4jgj+eloW4TZWYCqkWH9sgPCTfgEAIyJIQgBLMLUstuJWIhcbmx2Epn3wN631
	wiLGdTvazgg/FZgeMkvplhllSv/RLdsdaEUfA3BlJDUpMvlU06qNTSkll0Y3jThYCGo=
X-Received: by 2002:a17:902:ebcb:b0:224:912:153 with SMTP id d9443c01a7336-22ac3f2ea53mr53159285ad.5.1744220910052;
        Wed, 09 Apr 2025 10:48:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/HnVi786AZiTfGfIZDyZj81/oJeBPPJ71p/LCI5NAQgVjf3mOZuLT+HN9A8Iv/W8Luyl3CA==
X-Received: by 2002:a17:902:ebcb:b0:224:912:153 with SMTP id d9443c01a7336-22ac3f2ea53mr53158875ad.5.1744220909683;
        Wed, 09 Apr 2025 10:48:29 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:29 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:14 -0700
Subject: [PATCH v4 03/10] dt-bindings: usb: qcom,dwc3: Add SM8750
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-3-6ec621c98be6@oss.qualcomm.com>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1631;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=1Rnys225KK//uVf3TafT/6cgisRuKq1AQ6Bq1g6QnEc=;
 b=ftLP9I1pGcsIdnSe3GtGTUYNbqyLSqb2GgE1fxbjOR9dHurF7yavFOUcdfCgngmGB9tr1cdQR
 BdNrZVNjZO1ApuBapxVg8NZlMpanGCwyt841y6kFWwKtTdcJTxLAGCX
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: YfTeltG-8BlQchvz_5xfEhewyet82kIB
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f6b2ef cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=nqcDc_6wAsSP5qgj5vEA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YfTeltG-8BlQchvz_5xfEhewyet82kIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=888 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104832_424128_09F7F40A 
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

SM8750 uses the Synopsys DWC3 controller. Add this to the compatibles list
to utilize the DWC3 QCOM and DWC3 core framework.  Other than a revision
bump to DWC3 controller rev2.00a, the controller on SM8750 does not add any
additional vendor specific features compared to previous chipsets.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 64137c1619a635a5a4f96fc49bd75c5fb757febb..a681208616f3a260086cff5a28dc23d35bd96f9a 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sm8450-dwc3
           - qcom,sm8550-dwc3
           - qcom,sm8650-dwc3
+          - qcom,sm8750-dwc3
           - qcom,x1e80100-dwc3
           - qcom,x1e80100-dwc3-mp
       - const: qcom,dwc3
@@ -354,6 +355,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         clocks:
@@ -497,6 +499,7 @@ allOf:
               - qcom,sm8450-dwc3
               - qcom,sm8550-dwc3
               - qcom,sm8650-dwc3
+              - qcom,sm8750-dwc3
     then:
       properties:
         interrupts:

-- 
2.48.1


