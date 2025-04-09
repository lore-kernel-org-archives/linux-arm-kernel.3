Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4ED4C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=mp4O5iOtBCGrhmHOHOUzEDSv7D
	HfO5w/SfelIfKkI6rb+Wx2YA1zaCqSPB0jBj6WSOw2ZSTADf5W9Cwx0cTTLDPz0lD/qjwhLTRjkYj
	+NT3NppZ73a2+fCBFgFuG/gP3oS2NcBvK4xTT9tYz3my8N5pq0gvMVPTyHQiNLsQH6hgPKnUu14hH
	76erLp0jcTi4m9hWEh12WeCFCQ1N8NCAM4ddS5otg8aychjhov8rwIM/dYGGEgDhaxoAmFl6bFryJ
	WIIVHrAmgxVNvycOZ/DI2PZEH60QRMQhJ9sRt5t6bS66Exjg4Ad5g7zS3oEKMXoMl8MORd9agQEqO
	d5FBB5+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Zap-000000085lc-12La;
	Wed, 09 Apr 2025 17:52:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZXI-000000084zu-2CV5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:48:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HG1SO015729
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Apr 2025 17:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=; b=NHnxggZ3HAyg23tX
	XexEu/d4b4xHNZpkZ+FJyFtExBOWgu662MfBiO8ZQunB+D3A6X0K9s3HAcUgCNJG
	Ug402U/C5zkYbyCqagEaz2pRlOSJnLbs0OJbtBaCHBUjUyftvpI2R8ntLowUEhM2
	slRDlDiuZiKQSQTbze8L8btwepDLMtOY/0Ce45s9E3SpoKO6MHznm/HHMYmi7iLy
	Win3sHeaCLquKFIUPb8nvsOxBYTBw40gMDA+n9yDONuw7GyAkBFl6nxB7prMHLa1
	NaIG883o+xMztiAmvSqleD3xB96wSTQFLybNNBwQuS6J3xcC1wW+5EdxbLYYUte4
	y85X8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2v8e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:48:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af9b25da540so4533476a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220907; x=1744825707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63TelnMaZLywwjt0ZE9rQRxentiOmbDDz3cY3YJGWYQ=;
        b=wuvm29EWtn7vOM+GOSuStvgF97F+qmOUMr0ziwPKxz2zNbhXXN/87WABuyfQvKeqoU
         VqtLrpu8SVB+ah+1eZZjJh5QfwGjXrvhKvndWnRI63nF47Ot12vJB8B2rWcS84XxwBqJ
         e+VOsAFB8BmqxZbw1pgqR3XlkNEUN+8km5YUAICtJZEc2FwLq+N7vtqDHE5Yv6dTH3YL
         EsSLARj9tmKu1AEFu7ibfuG+zr3b+Cg8GXMPjwGlMbz6nCoiJBl+KQ03hKA2mFHeOAgB
         vH3fQGk7e0Lm2E6yTDHBnnWEwNOS1iVEr7V4QOfD57MmAqsa4yMx73kXoglrQtBuLE2v
         YGlw==
X-Forwarded-Encrypted: i=1; AJvYcCXWe+lA/SUWuUWOKc12olNYCFwVNsIIGrg3zfjMwqXOHFFWaVwXOpV+UjlzkNpPZf8cL8WMHAvIFkgi4w8AImMj@lists.infradead.org
X-Gm-Message-State: AOJu0YzW3782KP+c+vByhSFfV91/IoSimiETKGXfwYWWRM8kIeVB40vg
	mawG4nfNqfjBFhy+9Ik5ZzMtK9K3ahV8/tNH25j1th+bXGNCd/1i80mw6xlFCGrCVxdH1wNNsGx
	aQ+6v+i4Cd5FdjzSYg0o/qgkU3GCSoizqHQm3hhl79YNEL8+06wFh03jHFgMdlq6ZbXxxQKLaZg
	==
X-Gm-Gg: ASbGncvefgBM3/hirHlOCmDxKVBZ2Lz2ahszUrqLo8naT425GNKCUrNFA7jizXT7L7w
	g12cNqSrbOgbW0f7YtsJR40Px3QjiodQtFuP1GPQgwJr/EKlzNgiADMqnTOoNa5t8H5CUFP1Uwn
	3eYHJdnBIP+KJU/Tr7kzxRp2h0GlVtJOHYJVxZO/zN+7V2jgb5DszWAzuhId4oNQtAlgJobt7Jz
	9HY3JqP+AAnucv9JL4kL0VcB3lswGkAhgfe2ewrdcx53x3cbYsezEVbziJZQTJa+bZHrIpR06QP
	BH5l9e3OPUVPbTgU8m1xdgPhbVki4+x6FP+TYNZ5RdnnBjhkYxZM+/UBxDqpXoBNyFc=
X-Received: by 2002:a17:902:ebcb:b0:21f:45d:21fb with SMTP id d9443c01a7336-22ac3f321ccmr48818555ad.3.1744220907101;
        Wed, 09 Apr 2025 10:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgKvx8lBdm1FHNuXnyGtbdi5VXYxEdAcXoc4DCrdY78oYm92MjebgYjMMTxhRh0F50+1wKTQ==
X-Received: by 2002:a17:902:ebcb:b0:21f:45d:21fb with SMTP id d9443c01a7336-22ac3f321ccmr48818185ad.3.1744220906692;
        Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:26 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:12 -0700
Subject: [PATCH v4 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Add SM8750 to QMP PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-1-6ec621c98be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=1370;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=8DqyV8lJU3L/SgQ/5n/G4b54XOO0JVKsEdNPv+HKEao=;
 b=77LNm3kHo7uIXLbsObMXwziEYQuHIhUNWEB4Y7oRJvpIb5WlARQPc7NSdgr3i0EeQnCMOqJMj
 APzL7x0yD/FArLp99KEn0e1azIyV9ttlUwnKo12dm6hc1W4QmrwczOQ
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: 0qgm3swGMNaETUkt6i8qsR6zQNiJ_UyV
X-Proofpoint-GUID: 0qgm3swGMNaETUkt6i8qsR6zQNiJ_UyV
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f6b2ec cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bbY3M6C_flAL0yJJl3cA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=876 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104828_574969_24FD006E 
X-CRM114-Status: GOOD (  12.77  )
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

Add an entry to the compatible field for SM8750 for the QMP combo PHY.
This handles the USB3 path for SM8750.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 358a6736a951ca5db7cff7385b3657976a667358..38ce04c35d945d0d8d319191c241920810ee9005 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -29,6 +29,7 @@ properties:
       - qcom,sm8450-qmp-usb3-dp-phy
       - qcom,sm8550-qmp-usb3-dp-phy
       - qcom,sm8650-qmp-usb3-dp-phy
+      - qcom,sm8750-qmp-usb3-dp-phy
       - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
@@ -133,6 +134,7 @@ allOf:
             - qcom,sm6350-qmp-usb3-dp-phy
             - qcom,sm8550-qmp-usb3-dp-phy
             - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
             - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:

-- 
2.48.1


