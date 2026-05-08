Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21BDCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=; b=QMqjvQMqLCJ1uVQ0rQUiqPtjvk
	ozwNUn0yZbCqF2ll1IVXI1OKpqbyJ2P9Rt9cfTUVPwgIZB4izjg22OrEXrPcCIST7ra5IvF19Ry+k
	LDnfXIZ2mibo3ZX0meCp9Tdug3SX/VqkDF30XsA0Qydd9Yhl+hxsF3/+fgsCIco+alc1/Zfk/hCXs
	WQq+3XavfFyzwvkZC4l85I/wKhXk3tVfBOdyor2GE/tR7rLhaedFH0GPqL5zgOw3iReTk8FBxXnlZ
	k9nooC37hzFQ5ByTno+SDkgprFlGWPcf+qqAsR9MGJ0Y0vK9ftGB+1Fvn1wllC8CvWetgRFw4wJK1
	pU0eNX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZv-00000006MiO-11Lt;
	Fri, 08 May 2026 11:41:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJZs-00000006Mh1-2i5C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 11:41:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64863JG94069612
	for <linux-arm-kernel@lists.infradead.org>; Fri, 8 May 2026 11:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=; b=WM8N0uOxtF7HrAkU
	77MJPHEkWvD5zCcGnwNlz3B7OvgUokhAQXyQHbdJcRXLiTru2CRxt0DxVkLgO+Xu
	KpCiSKGm1hhTUiSa95H8c8OgFTHVLsxSYpl1LHIRVm94OjAUEaOo7RYxBK/Hv9LL
	l0rbTercJYh3aodq2wgawgW6argjLv+DswbeVxdW1Z2oeacOjXnGkH8M6pj+q1MM
	sjXpjd1s0ytLk0RjDxEYIFi/y7xcl/EEDnbxXEqFPlVxRkFqbFmIrIdFMT8HxzLN
	tXBIwvOlZr7CGxrzktnWqMSQbmAA99tyG9NyUJRUt01bxi/hX64nVLF9MWiDC+Vi
	3NlSmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e12sp2rnj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 11:41:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ed2c173d3bso362133285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 04:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240467; x=1778845267; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=SluVsla2MCEjTWzO0E+ug+jZQ1vS+S0rchVBvnVS1qjbCq0+Xuy7zl446CQ/d4NPaE
         /bIKAlQchoUf+HjYQUUspCGBkJLmQEunH2RQgf9xE/ugKSQeDXKQMx8scMOBTFKK4G7i
         0hHoHuMvvS5Uc5gcd9jJHMpwMhxHSb31qdumQIPECLuy/CLZGHQHuIbADmqky/zCisZa
         F5iEH/UlloQ/+TzubLURc1iWQaqbS+pPnXC3HRssPtQtJX6DDSaULtrVvF2UVdECT15y
         CiHXsbCYfjbOBBsNN6VllNcWKNEeX3dOHQ8ZaEnUv9ah8u49Qp8gOnktms+JMwx522Y1
         k88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240467; x=1778845267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2QMZfo5GvIx279y7myj/MFns4ZF9kvnCOIi7ZALa51o=;
        b=GSe3vMsRdShrbOm/WoWhIxWrmxHGMgqthlxIz4vtkmaLfd4hj5NroLK2QcMumMnFEg
         2luhrkvt8m5jb15sVnLMjs8HwHsWKH/e03If3xgnug1Hn7EglghB4XrlTsRDMdRg0nQP
         w7APTUHgwwiXNoX6KzbgcDzpiCS68kmd4rbMPznk5tcrP2qTpBTIL9pbIw6VCQZ2Ud9Z
         83OyjDBsqM7NrLck25x9k/yYpPJBmkCqu9PTkoTguw7R/y5bdCDy9E7I+Q7vVKOxOfDp
         Ttri0Ld01Zhc049mHNCejG/wkZ+SI9zRn14HPw1tp011jzNEnnUyq3FXEtq82BPnFoVw
         5uLA==
X-Forwarded-Encrypted: i=1; AFNElJ/fCiyu5NNTnyQSVcBg8zQkUE+9ssrQiTU3WrKv8gK19nrddKAMYRsafO/BM2DUf4pDE34HZCDSKZ6hLcd6kIji@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3VwjYi4rVLLG/Pf0ebM4B12wyE1xFc8lu9Ssw5vaxU0AzFZ9V
	mk7jLBRFBZerwM18TAlQhYydRbJEyAd2aBnV9aeKQ+oTJiR0G6A5ZH2v4IReRliiWFQkgupC72/
	RH1ZABdfkYYO17HYGGdDpKOMxBhl8sYzZXrX0XigAZRJ07WVZIoLMx2KO1mqkcP5qOSMmHIQ3c0
	FbPA==
X-Gm-Gg: AeBDies/F3LGhzK4CtWqJlyjQvEMW6M4IBTxWCxfM7bukYKQqw5c6YAehEeM2PVAoIh
	G9fbijo4jg5BBDB4XyIIrd3jqh3NWCySjCNMIIFhy8XaP1qOIAh/+RpiG6QUn5qM2geA7Gln2K0
	z0/OK70D2L7LOy3cBn/WcdJwOp5WkHZY5MsqAiqQAmyeMsgm1bVo2O6TIuW7jsJuode1Dh4JgmX
	mn51n3t6M212zjK2igFP/Yeig34CXQxtn1ddFx7LLuzrd+DVMcqONEMxNJUsFQLZVqkhICiPQtL
	YDOe9FOPo3SWsiW9bDMGHnKygP1fzkhfuJyd2VczA4/27siiZqw1yXKLD9/dCsZ3ko0u32Q7d20
	xTit+oBZUhX5gmVWSwwUdUHBtfIN//T4j2xpYcU5iIl6oc2+SjmzXndjLv5Gzbviq2TatqLcTGT
	Urd4pTu/Z747yW
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788518585a.46.1778240466880;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
X-Received: by 2002:a05:620a:294e:b0:8ee:589d:5dbf with SMTP id af79cd13be357-904d68df456mr1788512685a.46.1778240466256;
        Fri, 08 May 2026 04:41:06 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:05 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:39:57 +0800
Subject: [PATCH v2 1/7] dt-bindings: media: qcom,x1e80100-camss: Describe
 iommu entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-1-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=2779;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EgoG8dYeMOUsaStegKZNiGtsdNqb8ep20lln6yJOD4g=;
 b=gplcoxsXbwOQNprb2mtOphiyAsN4q5dxQl1NJCfFgaExg+NyoXXlMSSE5kuXRYjIG3/OjJ1B0
 BRszlaW/QF2Dwe439yzT1VZJvuEXFAs4f253ypvuNDIAZeusLcrQNx3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMSBTYWx0ZWRfXznL0hSlRA4D3
 0HUe9I/JCZ5fSYU6vvLUjS/b4OV8EXnGKAtwsTuNq4YZCEMUAmJ/H9KOtYFLndp6eyhHrdK5V6A
 xrmgGSyzVVLOSBNrQlJ8GynlI3MRU23XFtDcCXaIgbDueRl6mqy6v0s3xHgd+41Yqrgq7Mb46N9
 J4yFh+jn3QnaQ7qJsTGkGw8j9Y+jQhb96DbnQu/xrhOSSBgSIlGVHteUcLPE19QFwQ/lpgX+rCO
 BiUXOAvvVLYg9cQpnbUWhZ7WDDD2WOFUNyJWQdE5UWBMvLhRAoUmtpROfM4B194cf0pkZ0CI41t
 pjVJJ0iYIZniTc7dQNS7Uo1f6LhguMFayOBvnZyJbOFbM24j4pIc/WrqTCb/0VmChHbh4XpCipA
 Y6+jk/lVMxP6W7fFU4Yy8lJfY4305VT1hztvutzMtvp5NcJEJykIUs6J36JwUqbknPZRa58geaR
 AO8fUrc8+6fINauu2Zw==
X-Proofpoint-ORIG-GUID: wr0nANoJ35IopFwW058XcVdd_XiNp61h
X-Authority-Analysis: v=2.4 cv=Wu4b99fv c=1 sm=1 tr=0 ts=69fdcbd4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DGnd2QOFyrMO3axh9N0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wr0nANoJ35IopFwW058XcVdd_XiNp61h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044108_701923_3FF1D0B9 
X-CRM114-Status: GOOD (  13.64  )
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

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The original iommus list included entries for ICP and BPS/IPE S1
contexts. Only the five S1 HLOS stream IDs are required by the CAMSS
ISP hardware: IFE/IFE_LITE read and write, SFE read and write, and
CDM IFE. The remaining entries serve other hardware blocks which will
be described in their own nodes as support is added.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 26 ++++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 2d1662ef522b7b874a3e308e374044255bce5bb8..126400772d028811c9efbb1443144ff4f264fcad 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -104,7 +104,22 @@ properties:
       - const: sf_icp_mnoc
 
   iommus:
-    maxItems: 8
+    oneOf:
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
+          - description: Legacy slot 0 - do not use
+          - description: Legacy slot 1 - do not use
+          - description: Legacy slot 2 - do not use
+      - items:
+          - description: S1 HLOS IFE and IFE_LITE non-protected read
+          - description: S1 HLOS IFE and IFE_LITE non-protected write
+          - description: S1 HLOS SFE non-protected read
+          - description: S1 HLOS SFE non-protected write
+          - description: S1 HLOS CDM IFE non-protected
 
   power-domains:
     items:
@@ -332,13 +347,10 @@ examples:
                                  "sf_icp_mnoc";
 
             iommus = <&apps_smmu 0x800 0x60>,
+                     <&apps_smmu 0x820 0x60>,
+                     <&apps_smmu 0x840 0x60>,
                      <&apps_smmu 0x860 0x60>,
-                     <&apps_smmu 0x1800 0x60>,
-                     <&apps_smmu 0x1860 0x60>,
-                     <&apps_smmu 0x18e0 0x00>,
-                     <&apps_smmu 0x1980 0x20>,
-                     <&apps_smmu 0x1900 0x00>,
-                     <&apps_smmu 0x19a0 0x20>;
+                     <&apps_smmu 0x18a0 0x0>;
 
             power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
                             <&camcc CAM_CC_IFE_1_GDSC>,

-- 
2.34.1


