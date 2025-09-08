Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F012CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DShGhrjrqskk81shUEZqzaXPQnfD8BZ/czBlA9gz3OA=; b=Zw9uaF4zHCSB1cKFhcPMpCWeoV
	oAHGbpRyKiGQkg8qDy7IPfNqNt4TqO+EbBZb5Hj4ayxVTTwK2GgvHPxMZVrYkAO6juA1yhBfVqRGN
	Ds9tC4QArfTLSd6+Dm7pUSElrBHcYrUdPG6LQct9/UALGGD34yRBIvYe0O4ruEVnk851/SPgV3NTj
	IsFXhjkkFWRG4u7sDYwMTWqKAoxmtQmsx3SS3xb3xugXuq0Om13rxBcK+/MDubErASEB3EE5j11AP
	B7NpMfoYLvJCcI2S98KMrX80OQqXMznl8+y92FR83hOQM1wu5eUzSfLOeVWCFFrto0YPoIuGZFZLS
	EGMXvBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRWu-0000000Dzrm-2cUc;
	Mon, 08 Sep 2025 02:22:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDe-0000000DusD-2Vd8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LgW3e000822
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DShGhrjrqskk81shUEZqzaXPQnfD8BZ/czBlA9gz3OA=; b=nSLTumgVqQrTMDgw
	v2vrZb3bewD4HnzT8mf+QH+dTwiawtd8HWCq+n3HNFzzpqWhx4iUeGenxynk/Ysa
	b18YxHQyP0SCVuOjgrkV6EfA97WpFjexFI8uQhvntY3BHnt60J+HEgZTQFsd1uj0
	HNIbxcXmCt7fg5Xlt+eU2fG49g8RNAKf+qftRnE+2ylF/4C6FXObsI8HprGyJFKv
	8KUkgNy+7+onpdvLswb77mdhsn9JK4OJ99iaPzVW8pU7sYDS5Vy+uu4e6AJn9kXs
	tJRkkhB6JSzhYpnwzRLsDSengoVSA8OdNXKNE5VBhCVVhegT/UT49llSzW8n3huX
	i/Ix3Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8awvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7722ef6c864so3568884b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296976; x=1757901776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DShGhrjrqskk81shUEZqzaXPQnfD8BZ/czBlA9gz3OA=;
        b=KwJUtIE+NwVs5wC/r6bHTTAhQWgj8eZoWeiwCW8WrFj7iiZuEc16JlV0GXeQjTpLTI
         p8oDn0ZBgnbzT8H+omtGCnANfqjUAARryloIlJMRItdSXVns2/HADKCoc5blL3RDr1hS
         3qb8eXnu2fyPKfJJVIzZIOpuKmHWTCVRFNOJvrZr8yzIsd2U2kuDF18pJ5vztFhVg0b/
         yFuAtdh7Nvy32kpdaexNLXt5wIakvCukA4GG3Id6K6ZGUOkIPt1kWhiXaOmRNgf7L98n
         AfJ3BUdHxBC79m+wju/O3IodWwOdQ/WmKQPkoqet2DoJdVvI6bJI5p+V8klrajB+LmyW
         1B5w==
X-Forwarded-Encrypted: i=1; AJvYcCXruWkRwJlf+/yr70OCg2mubG7gS6LA2u8vFV9mDWqvPxKL1AupyXJAeEsVVHOvuuOsafa3Jj1LTvUVRAIa83ke@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw4LBgmur6A7irfmpWcDAl6F2trXZQs80S+Is/esaUqjuWX811
	gIN1YC7bUfU0VGABYcDHZ6mD7aXdF3GrSbUxJ+6/sJQj9wwzpHlB8hskYm1jZMlXO0dPAY6+kNE
	tVwO+GIQY0t1LMicGcFjl3/aXymvlpqm7bv0FGh79nAIROU9skjgrZCT4sTOGfSOdrt3LlscV4h
	Gl10pZcBHj9guS
X-Gm-Gg: ASbGncsUHOheYGZ+u2rCn43sOwBPwyNTt8rIjVVVLB5kz1LPJngiAB3dnz+8Z22bLE2
	SYA35NzD3HwidqQjUVI+AeZeWBxnH/+IT3tCeR3aWgCAQJWOsURPwQNamdBfEPlGS6YFbBRu51d
	lODT3jJakgdFmn1YRhQDNcnO9c1MPGey/NCuJrWVXnbx7Cxuz69wnNca+RVwej9u+jeBJoddWwH
	/+scXUEcUlZHhK1KmtWYw6thWDqTs1FDpYQUJrZDCrSC6DF/yv71st21WSSfhcdbNIRPf389RwM
	66HahG7yWfipaowxAt8ZC7ULJGDjmRzR2U2l+AU0IgvEdDK6OYUOdnk5z/7DF4NjeFGb9HoekQb
	VZ1sfRU61WphMqQhOoBcUbvfuwF8=
X-Received: by 2002:a05:6a00:2316:b0:772:4759:e45d with SMTP id d2e1a72fcca58-7742de8f0e6mr7749333b3a.22.1757296976271;
        Sun, 07 Sep 2025 19:02:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE21drREBfGZ25w/CVQp8dbwRMeZLBum3GOWYMesmkAgDZBajK5madzZ26jtZiz8XqCEaW0eQ==
X-Received: by 2002:a05:6a00:2316:b0:772:4759:e45d with SMTP id d2e1a72fcca58-7742de8f0e6mr7749285b3a.22.1757296975797;
        Sun, 07 Sep 2025 19:02:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:58 +0800
Subject: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=1804;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=7Lmwt8RPe9FYwcCsZot55MuF3UiAhcsArLukTTIDuFQ=;
 b=Dc6xN4+sy4FfyxjirI9U0M08+G8323SeEKPga96f9sV/F8cXG2ByJ9zM6mCw+w7GwLgMMn9ph
 uC0Q5GaMEQID8V3WMgEL8/BG4NUAMYkDXV5bzZFjrl78oC4ClcU6zkb
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX/MMF40z/O+Ga
 oxNe9ccIWxMV670xDkdYL9/Y1qyJs5gKk7Ak4HvYpNz2dPUU9JqcX6ddmfHTIPLRNXdxbhRGLE7
 vJM3wZdZFdqlpstQK5uaL6s/QTGlTKq9LGBPqAGgcDWg649s/kIhRoBaTdiraXS4qBHiHIRF4Wd
 zxIKi/W0G5NO7RotQLtQsciCkrrQcERhLyXmUrBJohb+HZdQBzW+wI0uTaX7+g34V58Ry/K/Nqq
 cuIbS29zJN39BqjJGQ/T7jkjIVO3hUyfoiaN1KmsPs1N2yQ0ptQti8T72vgbF6SNsbqEUhP/F7N
 cyQQcfAwCzQbtQC6XhmAFkcJef6vt47mIBe2m7DGD0bbFj8TerroKHFANmvHxE38iZuE5ZbjbTH
 XIBN6a3p
X-Proofpoint-ORIG-GUID: LWLvEHbT8r06vUbxg9qdaQfu0eKMJB4-
X-Proofpoint-GUID: LWLvEHbT8r06vUbxg9qdaQfu0eKMJB4-
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68be3951 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190258_767280_5024B512 
X-CRM114-Status: GOOD (  15.23  )
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
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


