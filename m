Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B13C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=; b=FY5Bi1RzhuK63v9WbNxLWn0LyV
	n5cNJV6ip0tvyucyRlVYHjY2XRn32pDzwztXt+WlBtObMZQu8cTorvfk4C8Kf5P7NNV5tRm02PRb3
	E4lfQHYqZ5zpAFJw8yBenqcP1guhj+X6agWlBZYhw7Aoeyxhmd7VzTnKwojX+OcEYHDMUklETXxIR
	vVaIPLeg0CSoY+x2nHGbLWH/x9zlhZDi4kyQY0/2TJwDHO/KTYetWSD3ViQwY4+ScU2htrsjmk4Mx
	Ua5+WXnnjPh6ZBpDubB3wAXAEFPvEDtABgQpjS2/blWoHXWPbo3JL+ytfbvdOvlEBdA/kGexGt4WO
	NLSvKt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRrC-0000000DlWy-3uwg;
	Fri, 21 Aug 2026 16:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRpP-0000000DlEX-0iwz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:11:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmMTJ2744751
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=; b=edXqU8uqZdz//uFl
	5RyLDYxnwzVQCD99oR0I/rcuPGBGWqmkOpoKvNkPuU+tNp9nitjoWlUOvmkv12Ke
	/xwANwZAXPLynBXIcC7sHstPBqXCRHIbK7yLVwg/2dIRXvzORZ8Ko+TwVrNcVdeQ
	IwHLlH1lurvue0YVmVdgT+jvv9ut+4b+PEWcwh9WabYe7YMizbK0hBSiUWiH8rBD
	QD/HbsWxwpmbwnnIZ1BNt0s/2NqkIy02iXpeFATuRhNDicQRIRXZvkMZHtqtMXlQ
	Wb1MSUx1iPIRlErdo5b5MeDgE6GGXzgsCrbJJ6/ju9azQAbXqAfPBBv7C4QRjtkS
	YtbPUQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdnaf4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:10:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28dbf4197so1984321b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328645; x=1787933445; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=;
        b=B8pxs3KO1nUmS1P1WJhVVmIyH6e3O1zIbeNcxlMHJLSngiNzPFZx7x/mwV9RRG0d5R
         +ybB39dwb07fTqfvf7UyJiRMlmKQ585nja/Zpaxdhn/MC3vBODhCPhqNn6usxOdORufB
         Z/1hLG4QtCYrogClhy1p1jaWfeFJzLobjUrOLcsAoB6ZgmV1ReSukKxsSIasb2fgdn8p
         YjamYYizoKkgVLQSpVWI4vH2GSl6GJKYKsP4Q9lWWwXmNOxCa7tsugIA30NJxTiFvtmk
         KTtEtTV7cjiMAUCgzX4pA0yMmBuJZ2+wzj7rVm/2NQnbkKnGRQXuVI2VBRoZI4O5LUG+
         4oYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328645; x=1787933445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNOGYQ0AHTnuxmnh8Au8PEXHgS0m8i9EzpDyehvezYc=;
        b=FOnkJ/Mkx7I21zP9cTYqVdgnNK0BJhtnNobq9RNxpN4LnmwtVrApOn5CuQIJ6M3zld
         1IV7gBYh5bccQhuhf0Q9IztCji2CgvxaIaGXLzlLjfNlwAzDOBm4+za+IRT1s0FfeEV3
         AAss30XpttKYMwtGTIvWbOtcscEfMY7WNIzlMnNgAUrWGF4pcgpJcmEopoZ4M2sVMC02
         NGsTJU4NXYaIfiWuADg/qHjjZKCbJV8rD44jQW7KK3IQV5ABmeBwIM05hrpqddCGbn7b
         P8pJtSozY/BUbrs5DFIVJi+WeGcrkng++mmkwjHoTTOyf1xWix9IBLLPgegrP137xSXk
         A14A==
X-Forwarded-Encrypted: i=1; AHgh+RpusNXcdVEwBpRkn329eW0KIWWwb8UmAeXGoAmAA6NUUnaqruWzidsvJMyLAdhSaJ2jNGXPpAR7w1+54XyAVm61@lists.infradead.org
X-Gm-Message-State: AOJu0Yw07/1+KRczuq7dkf2OMrbAVhClM+ERN6JK1+wYz+anYnfrcYrx
	M0PoQSUWLV18yn8g+hGrbseg3ogSe/2hZlo87r9opwoySc0cUaXBR0bAle3fd81BImIB+c1Tlrb
	oTUnQjd2EcoeEN3AJ10DfOXJc3jTeqmol65CxnYv0bE30uCRfBRyzmutkL+0TiqSIlFZB6BMe2b
	NB7w==
X-Gm-Gg: AR+sD10NGqN+wKWcO+KWb/cikER5mO55GohBOE0j5DuKLbDFZnng9OL6DT6RuURrK+r
	PQ0a6XgL9rku9GdZo5NGbB0xDFx3CKwobKXJLaAN0oc7EH2Pp4Sj67HIgaVVY+eZl04bik83SAS
	J3pDSSNe0fiPp72WrXYZ8rUzkF18uXz/Gmb+RrBfGO95DmLz6ywqcBbZ/g6eiLOXqAlbY4lF9AU
	rNeLke6n9k1tCZoopHgV13UrpvJDMp3Ud4i0e2c0mARFIJwDgRYeeqSuYxUOtzOkRexTA41aZoE
	5vUsH8T33BqC+I3wVwyZ0nes7lE0TwFhTGigJf/+OruMf03GK2NQam8vfmeLRsIEZYWaFKh4Uyt
	yXBpMdn8meeOLXm5As9NxJgxneQ/iMh3B4rFYT2wPF8Cb37hfqJIByvxGrgceqkpdZBn42onHwE
	/iLsbuYCx8bLwMEmeyTBuuYRQ=
X-Received: by 2002:a05:6808:4f65:b0:4b2:8dbf:771 with SMTP id 5614622812f47-4b2ef36ac0dmr8148590b6e.10.1787328645359;
        Fri, 21 Aug 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a05:6808:4f65:b0:4b2:8dbf:771 with SMTP id 5614622812f47-4b2ef36ac0dmr8148515b6e.10.1787328644850;
        Fri, 21 Aug 2026 09:10:44 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:10:44 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:03 +0530
Subject: [PATCH v3 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-10-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=5624;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=Wpq78rgozBemMvqXHShHTN41xjvjcSPxsv2keQOrZLk=;
 b=2JB3MH5BwbpK/GnBaySz6WvTOeAwNs8O1+wa0QVsVL28hl2+1sSGtcKdI0IIYQe62SiAl0V7V
 RpKGgcVPhFgA2cQCqTfAJcHVOe2O4mu0C4giH0PGmxMn88OZLcBee3L
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX9K3gCjxqDEdY
 pCYou92N8DiiXwg9VLLk0RoS1jPG3PhY5Dp4wtzknIrvYsmZJYV3wPSD2bGOF8oLaPOdwnCzVqB
 0AoABkOONdSzr9/NxBEk8eQHtTlIRah7UfUMepjS7KeQnrQ8Hv5CS4hB1nF2qqKjm+Ghvnoh+u6
 7oFJnUThuR015xsznaqBlgMjIMy/DeGJfebtFpx9q2znunIv00FhJO55lr2NIA3cRzWuJWlILRH
 NjllbLd6GGEbZP2fkHguJMBJ+seuQxaYmgNTMNSX/C1J0XjE1tlfYXOUf7bXT9M6FXeQJuDhl+/
 klsmGxvBvAIxPCJY70wzgk5TC+UfBKot2OCNJXf4xb4AJvmGKjuEebQPu5gICduFQmdlfDOIGtb
 YOPHOVUZaGYus6S9z0EsMxsoEZDKKhO4Q+uPvWNDbl5XY5kz/H61ZfcZWCFMJYvDuZLFVdVqjAr
 TvmQ+h8sm234/ponGdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX3/EhVedqYAFt
 IjwQ4lM/29k8DsGFVlD82bARqUKTmvLcwfbjh4oyk0oxXJMtMDZakWH07ISKRBU/js9+oNlFN3O
 LE196WWK7Y8IYw0HCNdo0Dyyr4srwG4=
X-Proofpoint-ORIG-GUID: DhcHoiZI6hKm5IYGetNADHO0DwUW3A7E
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a887886 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=PKuh8qK-LUMqOkA3WUgA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: DhcHoiZI6hKm5IYGetNADHO0DwUW3A7E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091055_032048_0CC8EBC5 
X-CRM114-Status: GOOD (  15.99  )
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

Document the Global Clock Controller (GCC) binding and associated
clock/reset IDs for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 52 ++++++++++++
 include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
 2 files changed, 147 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
new file mode 100644
index 000000000000..7ae37033a1af
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Kuno
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks and resets on Kuno.
+
+  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
+
+properties:
+  compatible:
+    const: qcom,kuno-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board active-only XO source
+      - description: Sleep clock source
+      - description: PCIe pipe clock source
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@80000 {
+        compatible = "qcom,kuno-gcc";
+        reg = <0x00080000 0x1f4200>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>,
+                 <&rpmhcc RPMH_CXO_CLK_A>,
+                 <&sleep_clk>,
+                 <&pcie_pipe_clk>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,kuno-gcc.h b/include/dt-bindings/clock/qcom,kuno-gcc.h
new file mode 100644
index 000000000000..bbaf1799590f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,kuno-gcc.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_KUNO_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL2							2
+#define GPLL3							3
+#define GPLL4							4
+#define GPLL4_OUT_EVEN						5
+#define GCC_EMAC0_AXI_CLK					7
+#define GCC_EMAC0_PHY_AUX_CLK					8
+#define GCC_EMAC0_PHY_AUX_CLK_SRC				9
+#define GCC_EMAC0_PTP_CLK					10
+#define GCC_EMAC0_PTP_CLK_SRC					11
+#define GCC_EMAC0_RGMII_CLK					12
+#define GCC_EMAC0_RGMII_CLK_SRC					13
+#define GCC_EMAC0_SLV_AHB_CLK					14
+#define GCC_EMAC_0_CLKREF_EN					15
+#define GCC_GP1_CLK						16
+#define GCC_GP1_CLK_SRC						17
+#define GCC_GP2_CLK						18
+#define GCC_GP2_CLK_SRC						19
+#define GCC_GP3_CLK						20
+#define GCC_GP3_CLK_SRC						21
+#define GCC_PCIE_0_CLKREF_EN					22
+#define GCC_PCIE_AUX_CLK					23
+#define GCC_PCIE_AUX_CLK_SRC					24
+#define GCC_PCIE_AUX_PHY_CLK_SRC				25
+#define GCC_PCIE_CFG_AHB_CLK					26
+#define GCC_PCIE_MSTR_AXI_CLK					27
+#define GCC_PCIE_PIPE_CLK					28
+#define GCC_PCIE_PIPE_CLK_SRC					29
+#define GCC_PCIE_RCHNG_PHY_CLK					30
+#define GCC_PCIE_RCHNG_PHY_CLK_SRC				31
+#define GCC_PCIE_SLEEP_CLK					32
+#define GCC_PCIE_SLV_AXI_CLK					33
+#define GCC_PCIE_SLV_Q2A_AXI_CLK				34
+#define GCC_PDM2_CLK						35
+#define GCC_PDM2_CLK_SRC					36
+#define GCC_PDM_AHB_CLK						37
+#define GCC_PDM_XO4_CLK						38
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				39
+#define GCC_QUPV3_WRAP0_CORE_CLK				40
+#define GCC_QUPV3_WRAP0_S0_CLK					41
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				42
+#define GCC_QUPV3_WRAP0_S1_CLK					43
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				44
+#define GCC_QUPV3_WRAP0_S2_CLK					45
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				46
+#define GCC_QUPV3_WRAP0_S3_CLK					47
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				48
+#define GCC_QUPV3_WRAP0_S4_CLK					49
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				50
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				51
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				52
+#define GCC_SDCC4_AHB_CLK					53
+#define GCC_SDCC4_APPS_CLK					54
+#define GCC_SDCC4_APPS_CLK_SRC					55
+#define GCC_SNOC_CNOC_USB3_CLK					56
+#define GCC_SYS_NOC_USB_SF_AXI_CLK				57
+#define GCC_USB20_MASTER_CLK					58
+#define GCC_USB20_MASTER_CLK_SRC				59
+#define GCC_USB20_MOCK_UTMI_CLK					60
+#define GCC_USB20_MOCK_UTMI_CLK_SRC				61
+#define GCC_USB20_MOCK_UTMI_POSTDIV_CLK_SRC			62
+#define GCC_USB20_SLEEP_CLK					63
+#define GCC_USB2_CLKREF_EN					64
+#define GCC_USB3_PRIM_CLKREF_EN					65
+#define GCC_USB_PHY_CFG_AHB2PHY_CLK				66
+#define GCC_BOOT_ROM_AHB_CLK					68
+
+/* GCC resets */
+#define GCC_EMAC0_BCR						0
+#define GCC_PCIE_BCR						1
+#define GCC_PCIE_LINK_DOWN_BCR					2
+#define GCC_PCIE_NOCSR_COM_PHY_BCR				3
+#define GCC_PCIE_PHY_BCR					4
+#define GCC_PCIE_PHY_CFG_AHB_BCR				5
+#define GCC_PCIE_PHY_COM_BCR					6
+#define GCC_PCIE_PHY_NOCSR_COM_PHY_BCR				7
+#define GCC_PDM_BCR						8
+#define GCC_QUPV3_WRAPPER_0_BCR					9
+#define GCC_QUSB2PHY_BCR					10
+#define GCC_SDCC4_BCR						11
+#define GCC_TCSR_PCIE_BCR					12
+#define GCC_USB20_BCR						13
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				14
+
+#endif

-- 
2.43.0


