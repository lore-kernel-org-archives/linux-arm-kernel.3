Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CBCC44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=nzrSJ+i02ZU0Z4IpbbAkS8Gsih
	qbgGt+2Um5gjKCtPiTfxzIY26Vyo8JwhapMlQmbWyL52caLiLoIzyG7OXZMRO6dcikWvZLv9iIEIA
	ijrANycnfr5HNKPxWud6Hw6Av2k9Ipyqq73HWVWj6PX2qYg4iqHk6XJUKHhK2yTAPrjqPfuAHjhFu
	VHdkw4RDqwM09LWoqczNprf4xQGXcllb93qJ3FfxEgj2DzfNQqqkoI++S2RgVETE2mKt8aIDkkSFG
	S/2cedHvWnA/xuChV3m/3351SI4TU/GmH/7zfWUBkB+HbkMQN43FrkjZjdbx/vThTu4GKkyKhydIN
	7dCQFCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8F-00000006Iu5-2grx;
	Thu, 22 Jan 2026 02:09:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik8C-00000006Ira-2eCF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:09:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMUJo04057946
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=; b=E5WLRRyNcki3om0y
	W+UWAkV7kgO0zhfb1tQkhrwV3Wb6mfiAheyRLqTFfE0m8icRRAVZmGQgDu/6by7B
	KZB4SlsOeqENd6Sp2Pz57SZWPZHmp4h/97/fJyV2oCPgfZXRxR6NOOCou6ijkuna
	U1eyi2O5YoYxthuyu7+2s3U6Gv873F+S/1ttytcYw3Y3YQ6zbfeyTifbjkIf5aON
	+oio1d3fedzzBTDThGeZaiJMVyxmX6i45K4vpDBe7CVqBhWaS9uqlc0t9bubXDwy
	kbAvjMfB1K0ORqtJSt8QkJ0V7eWWGheu4fMHXORWdM/xk5aoagn81zgyd9QTAxzs
	cnxDhw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu7nbrg9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:09:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a784b2234dso11286265ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047747; x=1769652547; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=bgT8lTx1rrSFQ1DS5b1/g2YgfiSWgqSQzgnnxbNeMyzPc2pLauabtT5tBwyyaqE4qK
         g5k9NIbkmeqC8rwf3vugn8mXDfsucXJyDYyEO7dZOyfmdKMVVFiEYCCNSF5559VuYasY
         QCysVaBWy/RHS7WFoh4pD8HGjCzDgYwlGYhWeBOlWduwaMfKGdHQHhf/UeleSGEYg8zA
         mgGYTTSjLoqP3I1eQRFPyZozvI3CLS1CwBxnsimwaYLZUgoo16bEdBTNMCgTvPOFlbHK
         K5t6Dx0dQltqJ/Rmsb7iZzGwGLaJH5gSxOzTRASvUsKlShgUKrxMQ2NBIbBF2dtWpvZt
         r+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047747; x=1769652547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5PgA1qa3IfjGRmReOuT+Jdii9AuqyqupAfSP/tz1CU=;
        b=gDc23nhJIUW/fR34vweBGtkg9nkk6bWb8E1rOYwrfSkXW/G2VMACqSL+6LUxNKsQwt
         7+xp8cFBu07fQ+4h5J2GjLLks6gp/SeGH7JV24yPtowgoFwvGW0GVml/Kf6JIGEFMJA5
         lJ8y3PygzfnVz98YB/si/R5dZ/sYIqUqJ0bWYKMniCojV5jm7jgUb2B7Ige54oov/a61
         sW7HusCDI8etceLYUIClZZvJPdTDSmiEl3rRXvWC3cVjavFY2RAzvs4HmbvDFyHIn3cA
         yZsERl76BQNAQL9ZCMAEz8iiPxzGehOHd9aVWCKVZcNyAnxYSsQAIKMYY7dlaH67LSqb
         +Tkw==
X-Forwarded-Encrypted: i=1; AJvYcCWcVjCzkZRKu8u7ib+MFA0Iin3yRqD6jzOskX08BVaqXVWAWdY+KoBKljleozKLwCLj6Ze2UfU+chQjGoZ0Uo0u@lists.infradead.org
X-Gm-Message-State: AOJu0YwxYcFIquLWGAfkdx0LCoXKSQH/LflABjwVIFvUKgVv8mC5SZIT
	KTR/VU0ZLyx2G2aeh77HwFpiF4dcnNo9K07kQ/904EDYVNhm4LATme2SfcP53rlVWe61dDb2e9x
	PJvUMVsL5k36+vxTBfiG1SWDpV6xZ8RWmOl2JAj9kNpTCm5FXEZfgNqObhJL4BrkPhMCQ7cmm8e
	NzNw==
X-Gm-Gg: AZuq6aIH9YrqjfB7B7M2Wj3Z4ezjpbCzQt7cTMrfpo9J7rD2rV82ly+NkxW39WGdmCh
	oZxV943F53q7a9K77li/j6ZOb1/GeXTQP+ejVUgHoglOCIslyQhHJFJilKHNp4IznKV2bdqAuvQ
	TpYqx7u2TCFkF5Lp6W8yKgny24WxI+yVthF8mIZeWbJh+s0z4TjnRu3G4G8fyTiBwTL6o/aexs5
	mOQIB6oAh8QShs5eojtMwvbNCKGsTGyKnUKNL4Q7CExSqa1tlm/V+adzxzsDWPZeC7aHNR1lQgT
	gdZRX4kdTmMYzxKpe6mohkqmbi8ypkXgptQMyPYDmHR4+LPfd99bG2VSsbCnA3yWYQN7Dt2Yvg5
	TeEwEq2bClx8jXuXYpvf4vcAHpbULLh20qCBVgDDAD+eVh8CcOfQ0zFz/lnkr+NxEbhMjWrce
X-Received: by 2002:a17:902:f688:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a76ad5c3b2mr66689535ad.37.1769047746714;
        Wed, 21 Jan 2026 18:09:06 -0800 (PST)
X-Received: by 2002:a17:902:f688:b0:2a0:9ecc:694a with SMTP id d9443c01a7336-2a76ad5c3b2mr66689235ad.37.1769047746185;
        Wed, 21 Jan 2026 18:09:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:09:05 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:18 +0800
Subject: [PATCH v10 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-5-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=D10EnaHvzxc5IcCAThb9a/AzzqWooUS88J0GgYqXhUw=;
 b=PWRV+OSxdyrgtlPlA/88c+zwxtpmLqdGmkgVUwG5GAA4FUiVev4B+usVORsZujvgNYb6XuyVN
 X743Pihp9HoBYSojQw1lDVFuTtCvvgoNzPqUQUjjgZhrXLAVA5GLOZw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: s8o6xBjjqIekBFfKcoM6FZ6LP_X2XZsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX1EuzRqQqQjp9
 OIEbBlJwk0E+jWdvjBeNxIggJ3YWaNcFuQ71RnBOCzCswWHYSv5ln38kDD0iT/gwIX1MmHjVo+e
 /Zg8Wlo6380FSyRB/WatpfdgbpFYcUhjvdSkD02tioXGQL3pHwBQMYeKYML/8CIGuxtPopCgWa0
 1l9J9WyeYv6cosrk/+u5WCGc7w84tR2HRzNqol2zoEiJ+INr64OXhlR69IsJfFHQ7pgeChZbnBY
 +XivbqKKqzXnnxy+gjc2FD/UoCjDg6j06vAWRYw3Fhm5pPyNkgvkgQimNN0ttywOB/sM2f2W+9f
 Ol2ub1PwM/Zy7GGgGZ74pareCdOR5MvH50pAUizZj4Swse2/B7OtZgviPiDy1HotcsFjbqGFbnz
 Yd8OtYU3GstYSdJ7aSA7FphgIbUEUDmBPs7HmqspiylshZwsy4zPV+hZjjGWtOb42i0e1LlXE9l
 iO8obWbH0K29X0YxB3w==
X-Authority-Analysis: v=2.4 cv=dZGNHHXe c=1 sm=1 tr=0 ts=697186c3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: s8o6xBjjqIekBFfKcoM6FZ6LP_X2XZsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180908_822441_B3CC5975 
X-CRM114-Status: GOOD (  14.70  )
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
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index c969c16c21ef..ac27a8b89085 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -60,6 +65,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -67,6 +74,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


