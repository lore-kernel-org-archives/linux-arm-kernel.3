Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEC2CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=; b=x2Wwpk1l7CV65Ixuz6IT8qs7//
	dXz0Pi0A2cxS2Lvftebw4QEOj2oixB07TjzCcPn90TTNJkgHljsY5CxghHyGO86kngBUiyNQvjl1v
	Pbo9W5TCo6nVLI9lnYYuxfmSNdRLYt3eosNxEcHZrCYH0q+DDjRvyoXBz85ZY5cJ+2LEkw2+6UlU/
	LJJKYItHy+cyLpa8y11jfgxEYNS3pemHMHlosI1OoKe1BMxuOJ/vz/OsbxX/YxDPTYPloQCkEHpvX
	iiMreGElg8Zi81a4DbdCe5G8iunH9gpbGnC6Ud8ZwbOJwPYFtfeUTzTr4ub3WFungyEOI2Ol3dnfB
	YdnjZiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Nh-00000000zNI-2ByI;
	Wed, 29 Oct 2025 11:30:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ne-00000000zMQ-0jPX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:30:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4uxgF3676883
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=; b=aNUjs9WiPzPJbyID
	o5El/x/qjHFJZumDaOCr1WdSAX9BNRoLz0IUuDThNxzIO0CpQuKsL93IHl2S5aaF
	z/ZE/pD4bIDCoQoqAKJ7TOx4cXeb7FypdGKNI5/Mzdp2PArZgx5HJDLUSxwLqLZT
	scza5/NzsINlKasQLMXPjLGph/vrZ1ORukkiEqTTSgwDeAIYqjZCMgfBlfsJj313
	tYiy1ZsJ1APgYeeyTH6VNKoaiJkdDkQ56zHOaUk9FhBM5py/19eHPx31UXL4mCX6
	emrVXJWSHHcz36Gmr7Dl8AZDEbKXAA6jBCDOSV5HenhNc5tGXPxPb1HLjzeJB8mc
	63khLA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1jb8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 11:30:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-294880e7ca4so126608795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761737412; x=1762342212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=;
        b=Jcz2GZD1MEIBdd1LxaygJXGvQXQM4tBGjbU6S/G6h36GMUyWu6Ds7xZ63AanazeYMe
         NLfTUEVttm4LkE/tLvtGp2SLha/h0BaijD3Zwilhryas01KzRRfGCCCzHFZ47j8mk7lf
         8s71mRZEu8hOiCNSpXArVZPeytg+4kSIeOSZx1lCqL51bkF5+HeY7emjs3LepIbhnCzS
         BuayK9d/8uGAOC9VHjankg37UMTgGCUXvRWZuxT43GOEYwRpG5uFEdjqEDJQ7gu9Dwqr
         ds5Qg2fssFZ1/9DU2mR+qPyNugYC9rgnMu42QYmxjUpsl0srpDzkL1rIVG8+z2l6fbMk
         oeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737412; x=1762342212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5SuIv3JLHlPvqOUKHgEWsX4PG4GINisx08kaTXoUAg=;
        b=rJDAJolRLpYWXEL8905/Mlw6Cn/QiM66oAoyztw6BGzr3yrPMEuXdE7Eg8jEGA8Gr4
         56e4vpP2E8VLSo+HTVtwoedRSp++Vu/eN4XoR9BGmTMfH77MZ1TkqUeZjeFH3L/206Ha
         f85g0qldSixMlcv8AKzM6p6rLshZD3MZ66xDm9pjkQK49bW17kXpvlsgMdIeBmZGF3MA
         zzx+21ASnSurIj+QDWNXrTiPoThnDklvVdA2iINyFR5URo9rLd3JWzP5+fM9tT+It7V9
         Se33xOrDY/LuprGznatc/l7531l5RY0lBe5gE3+7PgAVyEPwkt9S2fEwpJ8Ne3uOYcPJ
         4NFg==
X-Forwarded-Encrypted: i=1; AJvYcCVN417k8zSZuL4h7glLg5CMnVlfupQgsoax0jqPJsrkyPL2A2myJMMwbjfcdLM972nAn27asWycWXT/LqO8t+vG@lists.infradead.org
X-Gm-Message-State: AOJu0YyZNdwn3fEQ4mjwhqsAFhyAISszwwij2fAfdpCctYDTN9gS1zxM
	tXIPhdjXSblca1s5eKpnStYwPXEw9uX3ztdWcWfnx/JkSvJwiUVTSXl3hK3E3vPQtp44YCfE356
	6Dxau1NyXj3Z6oAMMRY7B+U7zY1lVze3b8J8SaTkPMFF6bTja5AlMWreIBdKu4dGTJIK2P2k+kK
	3s0Q==
X-Gm-Gg: ASbGncswLGsepJ8diwez52AnQ7TInsm+ZN56CrNUIlNSPM3kln2S1ccvwPrVbTW/mUl
	MEWWMK2kzhyDKPCrIFseQbcG8PdiwMGZXiZh6928peFV5vpsn/RDnd5aw3wm06lyz8RJq+SQPqK
	5gSIKOhVy5nbl7a/ZZpQ7/T7wRGf+2sxF9+JWiTcIb6wevtgBAXm0eLjbg1vPqy3fg+6+J/3G8C
	5+ut4OgVvxhQxYD+fXfwfZnyN8lrb/+Xsk3hTBRhk/4JJH3C7NGf9RhKDDNTcu8OUYZqyKlzMau
	B/n51GXsboGjZynAg3UtnfP2A8wp6u2mli8feu5J4hqLmIXFJporzTTGdHnMvWhFs5gLbvjTTf1
	wsuaoT63U6LxMgAX3klaRb+Ue1+QeGN2QIQ==
X-Received: by 2002:a17:902:c40c:b0:294:e095:3d42 with SMTP id d9443c01a7336-294e0953f09mr29700555ad.18.1761737412188;
        Wed, 29 Oct 2025 04:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKen6ywCbIWN5KljQYyzqeB5TtouLUxaHfS6JF/boLobTCHja0f2s4KTk4RalY/HOi1jpb3Q==
X-Received: by 2002:a17:902:c40c:b0:294:e095:3d42 with SMTP id d9443c01a7336-294e0953f09mr29700195ad.18.1761737411609;
        Wed, 29 Oct 2025 04:30:11 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d429c6sm152154935ad.85.2025.10.29.04.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:30:11 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:59:54 +0530
Subject: [PATCH v7 1/8] dt-bindings: PCI: Add binding for Toshiba TC9563
 PCIe switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qps615_v4_1-v7-1-68426de5844a@oss.qualcomm.com>
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761737398; l=5849;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=8zvZqpFeuXSiqe4t+MpIJYoVCiPCsJm1Ov8cxUJVKCk=;
 b=AdOy0S3mZ/lZS6F+7uotar2aiTwAJgcCpLULu+p8hRxJ2GoC59XC6AshqTdWID39wa9X7F+yI
 SwyzihmiykADjAAaHp87ipSRmmDPYA9MGaLk/hG6c8rgLeeu4IkCPnu
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Nu/cssdJ c=1 sm=1 tr=0 ts=6901fac8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=dWfasREweX4F4dHnDHIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: iHTznQxuF2NkBCD5vutCB4KVI5ZV8AE1
X-Proofpoint-ORIG-GUID: iHTznQxuF2NkBCD5vutCB4KVI5ZV8AE1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA4NSBTYWx0ZWRfX567gzo0maaEo
 kNxssDlxmsh8Cu+UPPYPj7jYogAxhGnJ9T8M+Fb2QybgCK+vG9pp4APZKSm4xJfOuaJ+3fWNtcm
 dsucGlMmy6k5jL1ElIqvPJAIIVo9E7qv86vjl/BiMJsZKww+XeaGCP9mlyAPiq6wDRDaRKKJaZs
 wl06dO9SkWuiFgk+JPt+16pUR13Qk3szERwD5yhqR0osksO0mKbqXlKzZZVwoFY5VmKuDWmD898
 6PDe4wCIAMhi3tAIGTlaIqQrf1evgXbxTNqZBd81zQcG2CM+lquhvSGKpzMunEwwzV1daO0kY8M
 RV8HNe2sgIBpvKP6rUHnfXhRQ5mCRVSczp834qnkne5+QKlfs5x6/aCG8UJOFoC4/nVcBuM9PCZ
 xJFCeTsjpxUZz8ZAVzYBq3m/qOqrNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_043018_352834_7861FE39 
X-CRM114-Status: GOOD (  16.82  )
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


