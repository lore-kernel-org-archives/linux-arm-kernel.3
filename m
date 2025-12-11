Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DBCD3E78F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 06:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=; b=rgtSxmqj2JJ58TAkLYz8gx395L
	3cUMxQIJCcLHt7qbNflOCkcL7rg2sB6qcnw5Gu4YvxAxHTbxItFguFwqnGdlYj9DbitkT7Bi58XdB
	4CP+Ehby1+5Lpbo03MkiwQc+GqB8Ei4b7XZPiEq+QlQGGT2dJGLEoGJRJRO8ZfNsJ7mQJ3su1EIKp
	c3OS95WIyDAlFCCcE5n4B/JtGddc/731HLWRYZjMgwlkqgYBHyBZZ7outtNDOryskEl+Ono/Ez6Hw
	5uFZco1DqQI5VHvyLXpf5MKQi1N8r+78Rs2QiJFaaQaITNgyv5DcUHQlOAXlMEHUOdzAXWrxemIH/
	C52T+43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZuB-0000000GGeR-0u1n;
	Thu, 11 Dec 2025 06:11:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTZu8-0000000GGcA-3PY8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 06:11:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP9wp3544375
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=; b=Dzz6tUlgHM9oRnM+
	1u0bVdPsY5B7Yyyj85RUUJ8mF2HzOAXFR8pifp9/jTFcyDjD5gAtQ2cAPqDJfILe
	KMBQerBP3IpnKrd6UCCfBbSL6IOb3SRrnkgl3XA4aVVEChTzKnq0buC6qTdyDx85
	CoQsp+0TfYZ5JN9CZi49rvV9JwDfA8BxdqXqAye4coOBHv6NTWmbB2OUmvJPXIPH
	RF2Z9YVXdBRW1isJv3BepGiqECPNOWMVZ10M3+cPSwg1dpZbIy/KAMfncLsZBoL4
	6KMpQ1hHtG6yU2qyH6eg+58Sf5rDail4/I4fwi3DAnewgdxM3CfKA+Wqaz6Npsfc
	HACERg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xp4cd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:11:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f8a2ba9eso6358795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 22:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433516; x=1766038316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=;
        b=knSw1upEA1GHI7hAA9XjJtuQN5SP623KLBtdmOp7XKe9n29s9hDk3zCjXLHcxpA6JJ
         vELWOHcKgOJLUtLaP8IuhKhkC/EX84x2cD4JW8xg/tW6Vw76cOXvimT5SS5rhXsUvjsg
         pl01FP10oFq4VTk5z4lD/fugo9Q/eqefAyy0u+zCJnHqGlKkyqFbnrkcbLbkWE6NeHb3
         DKexsigmc+7oamFox4yEMWre6dBqKdGFqEsUDsfzbMR8q6ocn1H8caOe/NqK9Q50lWe6
         vkfHL4yDh1F2W3aQb4kvLf2R6BtsZ/c9psj2Yc1R++Ylm9xchCZ4BYw3g4EqKbiNLVPd
         YwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433516; x=1766038316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xU390iYPL1F5Qvsi5RSyIsOPJpo2qp2MU5IZ2qkkcq0=;
        b=Y0vGnDVhT/Q1utRtLno45iW0eSJnTF4J4QIuGZM7+lNI04UuiUpQR3tCWJCt1CsavJ
         n2+Ne5ESqSJ8EXx4FxYXhqEc7EN2UmE9dLjkWP7UGcwERy4+6TEO4ueg9Z+vTUFJ3n87
         ZDoxC+80rvS4rD3rnLtQ3WhYNarz2K6rlHWCCN55NEbw8ygqKHEtFer3HTbFWVNRvhRk
         DrvjjzMlTw9uOFgsIt+c5oCYdQfxjvrAvSusF5gfRmhlBz2uRIn+uILPp3dWZmhnOAne
         CmvBdbN0LhEYlo0XLEL3mCx7gYKH/ZVZBALvDpjFczNuCUV0s2NY83oR0dZytHv9fffs
         iWKg==
X-Forwarded-Encrypted: i=1; AJvYcCUNztgFTtww3tPitsCInKrwpXahksHpIWp3kDONNzJ+p/FFFzmWVZVfSIIyugXf+alWxZwGrzWw9AVc7GuPdiyu@lists.infradead.org
X-Gm-Message-State: AOJu0YxGv8F78VzmXSojpj2B0hbhg02UqmrTxfnqO3FFJRIFqW2GiuIv
	7LUFn8sr+90qbjYiZXqiG/r9pBJy5Wzo5tYMnTo4ZR/icPxF/FWDjfazlW2WLGMEM6RFqVTqohF
	fLAP7fmTS4q8vykih7oqq1eCEDyTbWb8j8M254EMV/HFAWVVTlXXBGz9d+vVEKhSe3meZmDB7he
	fypA==
X-Gm-Gg: AY/fxX7+jw7fzUd2XqWxwtzv3zW02cjBxzJo9LQqqbhgz7ilwkDWjSC0Zh0ZsFkg9Vl
	gM2feDLkbZOcVL+Ku8uRJ2clYQ3THBNmtkZPmTz3pCcczmYsSLf00s2npnZauMfsCxhFDAm6GGs
	58aNmdXlsBnkWMx0MUxD22eECzxG7lyb8qVNq9IrPFG8tPuBB5gkmdVgYW/fm/sXwz5a8d753Dw
	0gBIoCkHXV1/4p3iIK6SoYYy4N9Xy/Pay5yconB/NlyZEzyQJ5E0DBVCB9zBmjnPzDrtufQ5Uky
	ZeZliiLboe2Co0lzmV2cub9HywUrHlJsMErBB46HMzEafsy3aeOYkm9MuZLNvN3z4RoskyeZt+Y
	M/8w7xLoN6tdf0XQPzjnlWwBxBcrOK9R9KSFJEv/SZ+VfSSC7Z5zn/cG5vlmZEgwCF91obTyi
X-Received: by 2002:a17:903:37d0:b0:298:2616:c8e2 with SMTP id d9443c01a7336-29ec2d931f7mr51328705ad.53.1765433515646;
        Wed, 10 Dec 2025 22:11:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEC7bCdOk7ZZttMBSYSwTYu8QQ9vzK9ZaiuFjyDfhihxVmRGXaykxQavGYy0vsVQsfZbu8EXA==
X-Received: by 2002:a17:903:37d0:b0:298:2616:c8e2 with SMTP id d9443c01a7336-29ec2d931f7mr51328505ad.53.1765433515178;
        Wed, 10 Dec 2025 22:11:55 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:54 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:44 +0800
Subject: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=1903;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=uQDnFuWQfa6/Sdi9CzMqAfsP0M704DoHSxLv9wulLd8=;
 b=dtvZNc7Ql0EIwNVK3ZcPR/UHLvwtntV81rVMcD579qhYkfIauSpGzGIQ9h1H5xKu53Dcm3DyS
 wO0rLQgmlE2CxIwwevSyhyC18zapssNyQIas2ur7G7AJhcj3Kq4sEs1
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfX3Z7DefH83iZR
 Eo+AJl4IsVsqJ1JALpLeEHfpHLhvkDmE3TR4EBYuNYGz57oOOQsDZWi97wTNGFyD8gbMlHBWZ/M
 N+rh9wygOqDXfiptNzppD0KCy9u33HCmZ4jXFSoB07XUF446UQisObFszFzyRacjd5//RlAAajH
 lTHW7zCwklRSzjkPP0qVNChemvIWdOfO8dzqqLaVllH+3xzGsPYoayrZGJ3pPy3Inab1TVwwrp4
 KHjoRk1jwF4UwrMah1CJZFhrUCiifgHE70cVzEVt0vRKBdWzyR7R0EHx6PwbvxgAynqm6kQQAlN
 UOzvs3DQmSnLcvxU15tyT7ZxZQ4gsw6Y1eQZeKizIY6tj2365hRRs56pTxeRo0dTPkSoUjEjxbs
 PnzwYSaVcWGuU1sCq2igd7ee8mol9Q==
X-Proofpoint-ORIG-GUID: klWH_VMucQufjCEzCWJ3yEpmYU_wmWCw
X-Proofpoint-GUID: klWH_VMucQufjCEzCWJ3yEpmYU_wmWCw
X-Authority-Analysis: v=2.4 cv=A/Zh/qWG c=1 sm=1 tr=0 ts=693a60ac cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_221156_929545_34F1B387 
X-CRM114-Status: GOOD (  13.72  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..90f88cc6cd3e 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for the first etr device
+      - description: Byte cntr interrupt for the second etr device
+
+  interrupt-names:
+    items:
+      - const: etrirq0
+      - const: etrirq1
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +79,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etrirq0",
+                          "etrirq1;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


