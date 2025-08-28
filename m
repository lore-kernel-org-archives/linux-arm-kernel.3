Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEDBCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=; b=mCDyw+6HaWqTcI0I5CFyepkxXR
	opSvNJoE7oypKSIqTKYW6zZWGq1ZRKRBfXf1yxDLHUEwiLM+kxfumqwwmfZv89Lhvp8xESXRe2YfC
	v4nCqvGju4Q+OBdkebAZxCJvg3UjE9fGSGeyXUP6vBOsMfTmk4ZZJ51bX0Zk3R8nBoxCHAr8lSph/
	ka4EHuMoKDSBi5DiX7ZytdP11WOxfWO8IllWXkK9qzfUNwTHwzYtQrXj9ERBiVqbFgIuWPkqNN223
	eFsVW+R6kWj0kuy+FyVVcWsap7XvJtJvk6UN5kp1eCRJZT+6KKdf0Hio9/lppi+KZAlqhLaxYhXyB
	o5tj6O4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLx-00000002QQ2-344b;
	Thu, 28 Aug 2025 17:24:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbSQ-00000001SyF-18mS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 12:10:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S6YoIM014892
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=; b=WBGkOii2Zwhsy+sc
	xHBvriDMKvagkkmCF1m5HAzgGrJlOPOSBamZyFPpDTo9lCegzVLsHhwhFgSS5QpZ
	p2jpV5+Tf6WPAjIuZikuSPXh1AdvCnv+xk7D2BraiDpX2NRYVzgqHSfsujd9//hH
	S2z9EqpuKtIDkrEi5pcWPGaY1IrlyCJq24vpBEvNXWfgdXNuEN8a0JsXgbR/lnxY
	H5I7srI6ghOIe0ZJ3m77+ckmzifG9ZdOCN6zmlzPcmToKNRbkeoPO/d/G8CoqSS9
	aMG+eud5nX30EczdV7aAJyJ29y5uLQx7d0Nrpz4WGBlLJxyBZ2RYeQEVQeKKQ3ZU
	9MnWpw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we7uhp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 12:10:21 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-324e41e946eso1746749a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 05:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383010; x=1756987810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=;
        b=EO9ei/P7KitOqNUgTGgw+ln2oFos/ZDbvUsk2iZW2/JB8qRDAnB3hC3HMQsJ6WAWCa
         cQKRAt4zWXakBE2GegkBKM4uBQCqnmbkZZcNmYireL6W0PVm+3eiMJuGiruVGJsig2HO
         qi22AyLMWtrsix65JzRLoPxBK//h+5pzVH8Y/v0KH+TXvsjN0OGiMd9UD/l8JqEVwMKb
         Voo6UzHhEejUNSQT0N2chXRXdQ7F32dyZrVmbkev5TV5iK3rJE02/VIHAIxFbnWNzBwb
         kTvQ8FyQduZ9ogvfCw+TmJEKCZhgjiet7o1+d0XXWEdusXzjglF5t8jmne5vf8tmRQwC
         HS1A==
X-Forwarded-Encrypted: i=1; AJvYcCW+lt5WM+8J6X3f3JPUhoufhzC6Jqt/yj/keycuqzXPk5dGbaKvRuoDmYdlUcA3STnZ2lYKwIFg1Q1w/XFzFVY1@lists.infradead.org
X-Gm-Message-State: AOJu0YyC6izukvUREWuY3OL6m0lX5QvW+q0wlW0Rs3dQflTbu078B3U4
	1/vZarTJ3P+r8RiL/4vdofV6KrOqdCuBdKrwc97IuOnvMv2OwYfacf4Xa8wsBID5qUFQc5/otsM
	/dNMUMN0e8RpIXSJ97exUUtsv7fH73HBPSxZM35wF+zOVP1jbYO1QJWWkz8ZpDfktlk190VwwFp
	Akmw==
X-Gm-Gg: ASbGncttkw21ao/4J2+bfo9sZsmOjwYr5ow/DYfAs1bl5nM59cy+MRLN9szEJOJHQtp
	JmqWZhWwHESLMt5NPH4Aik4dfoPuwNY9dIaPkTpzWuInpuQDSjyKMqrJIQcmpaF7KhDds0XuAo9
	uM97YGS8JGH7FC+T+bYFSioQmD/YWwUaG2a8MIoIqpGSnDoeynzrlPnrEIPuyCz1srwS73ztdTx
	/Viey3jTcKjuXWjCWrBlpgpgzqvmjWzgQv3Dx6+84g9dlYI4V0yeH6HItiQpk7CzJvl3EZXMWTS
	dXN0zVFxsOA2gVR6lZgh8jSYHUHomK2srzNAXUr8quQgqKmJ4oZpByprV3/6WflyRJ4EwAe+el0
	=
X-Received: by 2002:a17:90b:5445:b0:327:6a43:c73f with SMTP id 98e67ed59e1d1-3276a43ccb8mr8454350a91.20.1756383009737;
        Thu, 28 Aug 2025 05:10:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ1xN1nH2+SOb4TBgCljRgNHYk41wxaH6Bv3TBCbiJASEGGgEmFVy9pBEJvSscYC2NVVceMQ==
X-Received: by 2002:a17:90b:5445:b0:327:6a43:c73f with SMTP id 98e67ed59e1d1-3276a43ccb8mr8454272a91.20.1756383009006;
        Thu, 28 Aug 2025 05:10:09 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:08 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:38:58 +0530
Subject: [PATCH v6 1/9] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-1-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=5849;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8zvZqpFeuXSiqe4t+MpIJYoVCiPCsJm1Ov8cxUJVKCk=;
 b=jmYXpazt1LKuasdTDORWhr1cdImPInQgvTaDPJW/cJ43tD/9dbY47ia5cmphxGwxpSeg2YmcK
 zDj8ENLXIXfAy6GkNEgqDWx0QQOU+mh4pdMcKY2526d6HsUk6IKx2i+
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: qWVygVfLSUlfIHGxXNQj9y8omYOPOd1q
X-Proofpoint-ORIG-GUID: qWVygVfLSUlfIHGxXNQj9y8omYOPOd1q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX38nPaYfvFfSc
 GyNru630mJSjENMX5/D5ZDl6QnVKj5T7uKlht8zMB+vlmmu7UBBg3/fCRR/1SSBGsO5AI/8/D9V
 Ti6U9uNi0BGYWa1svTydqY8p5Of7ju8W89RvW08+UX9KbGaXPxCTOrJIavkV/LM9EmJC5Ar9RrL
 MvlNUymIgTESkjq72uPubQQqStRTgbir8RcXN96upyfEfALp1DgHYcZB8hsvCshjXcsaLsrYvMU
 ytIJDFJMLpv5ZVywZe8SLXo0CwHhD3kTzPHEXTi4wYEoFxDW5dNL8+wvdJeXboYS68MQu9vUa8q
 RJqNtzvMd5od51nkAmhGB3eZxbEwGKdVwbOOG3kfIpVeLxPEljqllLm74HvOWIV4q7JGDvT4g0r
 qywUJva+
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68b0472d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=dWfasREweX4F4dHnDHIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_051022_440212_67223783 
X-CRM114-Status: GOOD (  17.40  )
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

Add a device tree binding for the Toshiba TC9563 PCIe switch, which
provides an Ethernet MAC integrated to the 3rd downstream port and
two downstream PCIe ports.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 178 +++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..82c902b67852d6c4b0305764a2231fe04e83458d
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9563 PCIe switch
+
+maintainers:
+  - Krishna chaitanya chundru <quic_krichai@quicinc.com>
+
+description: |
+  Toshiba TC9563 PCIe switch has one upstream and three downstream ports.
+  The 3rd downstream port has integrated endpoint device of Ethernet MAC.
+  Other two downstream ports are supposed to connect to external device.
+
+  The TC9563 PCIe switch can be configured through I2C interface before
+  PCIe link is established to change FTS, ASPM related entry delays,
+  tx amplitude etc for better power efficiency and functionality.
+
+properties:
+  compatible:
+    enum:
+      - pci1179,0623
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO controlling the RESX# pin.
+
+  vdd18-supply: true
+
+  vdd09-supply: true
+
+  vddc-supply: true
+
+  vddio1-supply: true
+
+  vddio2-supply: true
+
+  vddio18-supply: true
+
+  i2c-parent:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      A phandle to the parent I2C node and the slave address of the device
+      used to do configure tc9563 to change FTS, tx amplitude etc.
+    items:
+      - description: Phandle to the I2C controller node
+      - description: I2C slave address
+
+patternProperties:
+  "^pcie@[1-3],0$":
+    description:
+      child nodes describing the internal downstream ports
+      the tc9563 switch.
+    type: object
+    allOf:
+      - $ref: "#/$defs/tc9563-node"
+      - $ref: /schemas/pci/pci-pci-bridge.yaml#
+    unevaluatedProperties: false
+
+$defs:
+  tc9563-node:
+    type: object
+
+    properties:
+      toshiba,tx-amplitude-microvolt:
+        description:
+          Change Tx Margin setting for low power consumption.
+
+      toshiba,no-dfe-support:
+        type: boolean
+        description:
+          Disable DFE (Decision Feedback Equalizer), which mitigates
+          intersymbol interference and some reflections caused by impedance mismatches.
+
+required:
+  - reset-gpios
+  - vdd18-supply
+  - vdd09-supply
+  - vddc-supply
+  - vddio1-supply
+  - vddio2-supply
+  - vddio18-supply
+  - i2c-parent
+
+allOf:
+  - $ref: "#/$defs/tc9563-node"
+  - $ref: /schemas/pci/pci-bus-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    pcie {
+        #address-cells = <3>;
+        #size-cells = <2>;
+
+        pcie@0 {
+            device_type = "pci";
+            reg = <0x0 0x0 0x0 0x0 0x0>;
+
+            #address-cells = <3>;
+            #size-cells = <2>;
+            ranges;
+            bus-range = <0x01 0xff>;
+
+            pcie@0,0 {
+                compatible = "pci1179,0623";
+
+                reg = <0x10000 0x0 0x0 0x0 0x0>;
+                device_type = "pci";
+                #address-cells = <3>;
+                #size-cells = <2>;
+                ranges;
+                bus-range = <0x02 0xff>;
+
+                i2c-parent = <&qup_i2c 0x77>;
+
+                vdd18-supply = <&vdd>;
+                vdd09-supply = <&vdd>;
+                vddc-supply = <&vdd>;
+                vddio1-supply = <&vdd>;
+                vddio2-supply = <&vdd>;
+                vddio18-supply = <&vdd>;
+
+                reset-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
+
+                pcie@1,0 {
+                    compatible = "pciclass,0604";
+                    reg = <0x20800 0x0 0x0 0x0 0x0>;
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    device_type = "pci";
+                    ranges;
+                    bus-range = <0x03 0xff>;
+
+                    toshiba,no-dfe-support;
+                };
+
+                pcie@2,0 {
+                    compatible = "pciclass,0604";
+                    reg = <0x21000 0x0 0x0 0x0 0x0>;
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    device_type = "pci";
+                    ranges;
+                    bus-range = <0x04 0xff>;
+                };
+
+                pcie@3,0 {
+                    compatible = "pciclass,0604";
+                    reg = <0x21800 0x0 0x0 0x0 0x0>;
+                    #address-cells = <3>;
+                    #size-cells = <2>;
+                    device_type = "pci";
+                    ranges;
+                    bus-range = <0x05 0xff>;
+
+                    toshiba,tx-amplitude-microvolt = <10>;
+
+                    ethernet@0,0 {
+                        reg = <0x50000 0x0 0x0 0x0 0x0>;
+                    };
+
+                    ethernet@0,1 {
+                        reg = <0x50100 0x0 0x0 0x0 0x0>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.34.1


