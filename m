Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1B6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=RQRDMobrBgD5UAxMwQoEDrOJPJ
	wvDrgnqF/Wmr+vpTkEKXdE0E7ecDibtn+vO6FIEi9bYd3hGG0kAbWRpawjgITIf8m3ZSx/SHb4wA+
	S9O58/NNs5dWvWBIYZWv1+4zkLcRlDzleXGhPAIa0fEUw/oG8rJNLJnBK3NnJZq9syc3mf8Z5ER1F
	rXQHuu7dLvBe8F+lyjQxNHzKD7sLpLa3uZRi38f4xeXu9X0UNJyN1qhL6Ofnm7072caIg7luxOg36
	ehhGUnS3DrQCyWarp7m7QUljkI/79tSkPhzuBm3WZNWRzdlcrQGthcWLzMPmtecI64tC0rLRoUhyL
	pfAllyzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZcZ-00000008627-47s0;
	Wed, 09 Apr 2025 17:53:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ZXK-0000000850p-44Kv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 17:48:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HNxpX006900
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Apr 2025 17:48:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=PIvmL2M/dNP+Izc8
	SPtF7jPKvzmtovEKYhDSHKF3YwulHZV1xPA0Z7yVCsNeHvCws1Q5MyDyxI64vHAn
	CpQyn8Wxtkf+CxvcrrIABxItoBvqyPWkg2Hm9EHhEkRzp42w6QB+NjURdUpk+gIr
	opeLus+zUfhR0jvWGffQLFWgG9LoFu7V4hkaQauEQNy/8YRqJ/xHhtViuHlLey6f
	vVCMEETvGwuCvOMu+yLqOdSy8Acae4n/XLQaBrLOZNsvVipC1QFbgpKVT+K9pd2J
	eVNeHoixDIQoDYvize+AeaLPmuAxJ0E7PB1aKQdrVOJttcEjycpPiOyZAvqMQ4xr
	bnrGbw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3m8fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:48:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22650077995so100913655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 10:48:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744220908; x=1744825708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=IiDWwXiYIc+Fq8hK7JzrCy+nZXXgwGn/HvWCU6MUaW/Uly4GIp7I4chwyEKDTf58WH
         Zis10LGyhTVrfWNSULhONXB8zoQ4NuHECEDmhrFZxy8ab+cc1NyAMbjsgAOoqLNXzxfz
         sh2Oyko9IFsA9nuasiRkET5juzDNBHFCvwutflIC9U/B45Yjbc8IrSZwASpccYWooXJo
         a/HqfBa64XJUa0yqGWihLjb4SRn864bV0y60YwEblLoYnXqweUv+swDu5alIYELy4g+9
         NJcVpZr4dcWk9CCVInoi6H0q9XUYTiEksMcqytX3Z0CbcXHXYvV4/ucw5kwsQOuqeDAu
         2LlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXgRe4CWv49DRjkWEaDplvl+Xc5SS7yr6ZeB41dP89maDc7eD9vZKnp+NyNVhva8KMVU9gW4oxe8IHB9YGceQX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc0hp1eBP0W7lH4PgCrKUo4MwaSTwciY/y5isC1hDIp0AjLg+H
	VIuzbehktrdPvADoGaY/vMt6Asoymfhq68hl5MENMHTQk1cfz8/iUhhd07XW3oKQiKk7Ko3aPcc
	o4a3SBtoDRs+bfKbRFmCjVuWlL+iaEtI7lW0boW9D3zUQw0U2vtqJNM1Y/onvkznQinmAgfRzGA
	==
X-Gm-Gg: ASbGncsR8ypMTFQWNBP31i4Gb9yZBy3jKqElS4nymjpMkc2stHan5/7HWF7WtJYl+c8
	Usl8UUmMs0ozLTGb86QN4p6q/oL+n1npLsLp6RWiNdf0LvaUs+Amf1Cxts0ABwklDJEvmgyHnIc
	0IpxmdZqAUzHVOm4pRaH32UGHNfb0JoEaqHF25eLiAhxBEGryQCsiz2rvD4PwFklWU0T4OVzM3R
	wBPagVEsjJ/yPbWyzsj/Uf/q2lUIfJ4kHa/pZ4fcnviHzGbhouD66PEusu6wLxrccIzRdyMzcxI
	DECDiMK45cMxBGfRJk5Ln570B9GyoujUFbg8ueZKLnx6DtxWfIpyb4a8rbNjQ8vZnKA=
X-Received: by 2002:a17:903:984:b0:223:6180:1bea with SMTP id d9443c01a7336-22ac2a1de15mr59877185ad.37.1744220908515;
        Wed, 09 Apr 2025 10:48:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoY64Nb1reLud/xkdxjipEsuosAQTCcuRB4SYeUOoKWO1ItlQc2B5Vyzj7uQIhCCOyhDkH1g==
X-Received: by 2002:a17:903:984:b0:223:6180:1bea with SMTP id d9443c01a7336-22ac2a1de15mr59876855ad.37.1744220908113;
        Wed, 09 Apr 2025 10:48:28 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm14964005ad.148.2025.04.09.10.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:48:27 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Wed, 09 Apr 2025 10:48:13 -0700
Subject: [PATCH v4 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-sm8750_usb_master-v4-2-6ec621c98be6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744220903; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=v1B+o7WHLxEMTEOfPAhMrr55ozwTe5+GGQDr6x3JHHOW7mTjCYmzmwoZYNNYBILGRdl41NWGn
 9pKvj474EM0CzeyLEQY3Ka2pTbM5Ha9Eb+QjSEu0/aixSAKoc0wKgzN
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: dpMeUGEiRLcxmyKuKc4BxcywBV-aQ3QU
X-Proofpoint-ORIG-GUID: dpMeUGEiRLcxmyKuKc4BxcywBV-aQ3QU
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f6b2ee cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_104831_144193_7F00D7A8 
X-CRM114-Status: GOOD (  16.65  )
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

On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
binding definition for the PHY driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c84c62d0e8cbd9fc1c0da6538f49149e5bc7e066
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,m31-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M31 eUSB2 phy
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  M31 based eUSB2 controller, which supports LS/FS/HS usb connectivity
+  on Qualcomm chipsets.  It is paired with a eUSB2 repeater.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8750-m31-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc_usb2_clkref_en>;
+        clock-names = "ref";
+
+        resets = <&gcc_qusb2phy_prim_bcr>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+    };

-- 
2.48.1


