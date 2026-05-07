Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA640CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=f1y8YdvFrmPiejcKzodHFB57hR
	7wg0VbhxipbYTGsExc1rJPjrXY7a+5MDCxoUQTig25TLrITIdqak4fXUEprPt5+ftpxLsW5udKTQB
	fKxp9BaRM7AF87uizOEf0CHFeckxkXz9mM0gSQvoI9OzqK3W0HowPhrjo788doYL+q2H1zixp0fu2
	78cqtkdvESuyTNbZxf75cDNZvvezb1MW8y0EceL5UGBwwXTWQqWmE04W3Tqmnce+VCVmgd1g5lCnC
	wQCE20YQIZB+ZNOjvYRr3i8A+b2Y3iEj+jjCgK8cRR6KIFr3kloMYKXnWnWhEvqNavUNyyd/4n4eF
	tmceU1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTK-000000041kW-2WlG;
	Thu, 07 May 2026 14:13:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzTI-000000041iZ-2Rc0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:13:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647AGnE0150864
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=mcO7vQ5zrFKDaeqt
	vZqFkK2dNRnCuiDU5Ge2UVkHSkX9MI+NnMnSehHPT4KARseHSj3d4edmystXwdZb
	m1/7h9Ba8a6kgq2oM6AxbcAJ80V2W5GhKB3Mg5JrzR9GxZoT2QU3ewxgUcwXC/wW
	+QL8HwAyZK/nfbKPJDvvNzjEqfJG85k3o+6H/TNDkY0YoW8ZDxCmXqrkK3DnTA/j
	8U4J8sLKYjDXV/x6xl4gnA0RUY0LZL0LCqbNIoqfoDz4kst0zJBLa/STugmEbbUS
	qEm+Wy3jNEd+16ApS5VNluIaeTCLVf8Y1by32t3Xz+IdM0Mk05PPn9uVswjFr83G
	BSBq5Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0kctt67s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:12:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c823549b1fcso1088684a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163178; x=1778767978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=dCT0gClPCXxEdPt7XSSWW6GUcq7X/aY9bQJhBmlVEBsMq3p0US85GxQKOYJ2TXcT2V
         nXpeiJ2W1DUtjd5DXO8DjGGs7jWxULTv6vtBRdoTDXt3GnXH9YofyOSPMiSiniahwcl8
         z/BczYQ2B8HYxlAgS84wZ3jJSw/LqYXwrZahFDZWIjAFSx00zq7c6IFfmxksZxibMScc
         Bb9WxdvVED7I9l0fUfWKruDO/3eqmVM4vwpWnx+hRENgr2pwwtO7jPX+jCm54WlNRwxr
         I5rd/L2SSc9c1THMXhgppGKbXuNWHTpKgYWlzyLzGAWeZpI6Nfv2rFv+vbfhx1QbnFNC
         o4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163178; x=1778767978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=m0wMNnKdoOxa9+FJmb4W0ZIkcyqS1ghBxuDQ6J0nzeeRiQwECC2ffn1QabLdACJKuS
         KvOlWXsMfkTBtP9S31QzcTzWGqg5OOU9iaryWghSnPl7sT0bvKxvs9KrGmq01zgKnEDs
         iK20nPIFZqZS8vImBjzJAxVFFEMziY+CJpFX/cVghubn1/N+0+0buOOQZka/8odRVITB
         Xb04KzWQq8Ctj61FHDgRhDBUvEu1KJMV96Sej8h+uuInV8rCrd5be9xagt3ULfXLnR0M
         S3k/EX679wdLwjb3OwP395I5evQSs7eCZnU98TmUCcpSp0FFN46Sum5Zckns8RO6QJif
         TfhA==
X-Forwarded-Encrypted: i=1; AFNElJ9C7AgeCJb4P31HL12kYXpTaMq6xkCnKl23XOLu39VROnczQmWB68DiWOTS89iB3yiV8K8t+e8ixf7D7B40CeeV@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7WiZH6Tg/wkOI7CCrp54RJ0lnvrBYNr4j/Vu0stoOIF2QHg6y
	ZoZHkuyldN9jCqUySvhBwU73+SVZx+vr1kp/WQGjaZcvZ8WDFdkUDfFL+ekrh6xMWUrfXCl2RED
	qBd5UM9VuACAAL2qV8CEeoTyaHmaSNnoL0DZxXbkElt1p0lHAkZRybwRGwa7cQHTjecLkNlKtot
	fZPw==
X-Gm-Gg: AeBDievMWRbIJqDmoR4MlwwtCcZ4ipKqoVnpmye0/WFBwI4rMZhbq2VOPTd+K99TDdN
	Q8FvUMVQGBrugHwfs8niVVWH08iqqV4jwyyE03pyn6kAJ7Dt07yNCcXVwMizO5n7bE37Ap2BiKT
	/W8rzZ+aID9eRaCxwtThCdhhvDrVjnHDTO+aF5mXGAlnMjR8mMSC9kft96EKKeBnFvTrTGcLEHc
	ug9K2QtUHoCPRYs4wblcartwKWwEfcPTj80RouRnjaipYpKR9CAPZGQdpsBe9zuRGlw8BLNUYlO
	nhOI6O60CDXhEZ54rYrjQVoE67rdxVW0CPQCk0Hj4J/aGcLPrzWZtbCyQoegaReH09R9RR1i2IT
	Q6BJZvBlefVUUV9//IZYYLfs0QaBxhZ2WfgrwyxnbPRajxUW+PLg/6QOHXuwEDNwYTVJCxvxDvr
	uL6tvRRy5SKpHz49C8O5ixq6k+znFxDg==
X-Received: by 2002:a05:6a20:549d:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3aa5a8fa74emr8808167637.15.1778163178479;
        Thu, 07 May 2026 07:12:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:549d:b0:3a0:b781:4c78 with SMTP id adf61e73a8af0-3aa5a8fa74emr8808117637.15.1778163178010;
        Thu, 07 May 2026 07:12:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:12:01 +0800
Subject: [PATCH v18 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-5-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163147; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=cbhIVnG1Yhq18s+Tdqc3kFKI5ZPNKCtC78rrD5zLokchh/bY3YK03jTYA0TL39zB1MBdRbNi7
 gAn4qnXQvYWC18pDUJo71hQc0WNHjig3kyty4rXNE9xe3WE3/ahbwok
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XsPK/1F9 c=1 sm=1 tr=0 ts=69fc9deb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: qN7btYZlBed4F0gbbnMDF9LZvNC14GdN
X-Proofpoint-ORIG-GUID: qN7btYZlBed4F0gbbnMDF9LZvNC14GdN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX9j5hR1OpZjFl
 zTPjGTrFBafy0AdwplqsECWWrBzvQqPROt36g/qCGwULmTdpGEPz/AhHxxsGSMpp697dJAdssqa
 EdkepMbbSNisWr/jNd0n3Hi5vAHUM4zIY9Fs9gb60zConYvHqBqPM5UVZIHZIhjASIiKIwVz7QF
 1qnOIkD6jFpxucLVHr4wog7Rx81Z0aJGg2w00fFzOa+JHdnQxsAg6sry8hCuwJD7V1IAUV5yhHf
 TsuRWqDSyhX6hCEZY/3x0SUuu7PvNgj8lEbNbVY8lJvbuTFQq3eCO2DJQVXbFahvXZyX90ZNeH3
 /PUucFVg4+mG7M1mWIoVhYNpS+BWMouqQJiGHkcoVWbPxybx0SSIAdNZ0UU9/5X5b4PSwGCfSny
 1ksla6uZixzU7u6yjm7leN2cDZYgHvBWjaLHxgjx2gyCPublhI6y8oxfm22c1vCgEGEvg1LkJPN
 4QJin3953azR99z4kDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071300_743608_C163AD46 
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
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
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
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
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


