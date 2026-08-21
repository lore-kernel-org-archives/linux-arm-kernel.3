Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7ACC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=; b=GRSZHaV6O4OjosHx7oOUPWLQpt
	rt2UNYcoxT35utjQzTFjDDzwbWo0D5Je9Ey8pdL3LjiRXQxncQe4+j/v2Le2jMHClPyYltQaqbVKq
	deOaoiMmO2ewEzgykeDX9ZFiIuhZmqQO4yHVnKIFWUB/FNKSh71cLSUBC+Xa7vciXKtnrx82x/I2/
	Xyi5zLugHmqPvGIcXUMQfBiZZx6HriBjIjePya/EHSv0qlczGS7io+mavEnP7hhwzoPjNT0wCnzxa
	bjGj8ZLkG53rldtaFaXfFD/aWCkOdjOlirekSpyuiYQgl2pp7nnMtnLYiVwBQr1ZxdWzXUBlMiDLp
	C/xhY/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRr8-0000000DlSE-0vZE;
	Fri, 21 Aug 2026 16:12:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRon-0000000Dl9M-08xD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:10:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmKPb2322992
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=; b=JdfK5mYBUw8Od7lx
	mnYx8xKrBAxPDulL9nPlnbBpRY36/r+pFoL97Bg45H0yVhsu0CGisLqDW9AjEsMe
	ULzloGtMg2JztODH5JxXXXTyPEeaAMNnHBeFvCdsWDxEOkc8fqz0PR35v4Vo+V8U
	fDiv/YlPsOX58o4V489IAh69Zpx76LVbTtmVw4+TQD/Q1Pxi7uI4uXCGDFIhpk5A
	W8hcNNYKipPedlEhm4xDESYRn69mWSDPS998p0VENHHo24Yd9MYkk1RG9MSh395R
	of3OveJN7v8USCDTyRkAlWov61FuxFX+ma0wx6jp5VzPJ8IQR6dSfN6WNVglvT38
	LRDIeQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbwajub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:10:08 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28db6c77aso1996333b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328608; x=1787933408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=;
        b=NtFTYUsDzC9Xx42QPDzfboQKYfVSr4hdCKntQfl+1pzVMTdXqTlXSBC3VLDD6AYi+j
         HwB+bMGFz+oKmDPeTHkgsKyW9I15Nas1zaXU81nKifIO4zTVaTdwaIXbLcP9khl33tJJ
         QXfJhdndmJYwmdEyZzm7ANSgl7k2NiDUwMbhHCXWIKnEMHoudJxHPd34nFsneGwgZ4jm
         DOuL2l0mu+gQa/CXnJcl+b4K1VFlXcvK40q0SoOqLhPyXhN/HQ/HdSP8qJWYiXd/dCng
         LmbIPlgQplnMfxyWdDcIYTrCphheA+tq6cjg1UnUYigUCR9XWVfuZE17FHGylPnWx1f6
         TFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328608; x=1787933408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rk58wJ7XjlTEPJ1BKH7WAT75TFyVOUcMIVRSJOcLN7c=;
        b=T1e8zEo9sZdtUmnaWAPQWAd/aSL8aWsbAd0y2FFiSx171a2MZQ6+qBp9J+ZSLrg1qg
         VbZp/9cB14vHWnL5dOuHzKE1tpaaq9IDXAvpGXoEKCzXuvmC9eP2MoOGapwUdt30muwD
         3FKKKK+/2iI/7jxudJW81ZGuzbXyGJZr4hCkgQZygl6t6i8p064tQkAX3PvBfmRnCAnv
         xvyiaHiWYG6IYLItxUx2piK0EEq9D7mYntqs6RfwiFx8IjZJc7m6DMx1cpXkjy8oGf8L
         cA0TR+CEbos9oKvhRCLee8pocbBMhiONXQZ/6zeYMBm+Cvx0ucRZJCpUnWFUi/c9x+4o
         Acdg==
X-Forwarded-Encrypted: i=1; AHgh+RrCOZZIJBqVerb3ZET2eXx29rNmca/9sol8j3lsWxiier6Q6oMWdQURKVdOZoEWyjl99amPBOkkZKXGGmCVhOHl@lists.infradead.org
X-Gm-Message-State: AOJu0YwdYZCTi3bW4tV3rxq4UJd99zwzZCKmgChNkFNErrpOTzqCkahk
	+r747aVg7iSUq+QxKWuGXEF0+DDoxLHbgKsIauyGdpMW0IBNUwfgA1uKsRacWi1F27oxLLrKugI
	DjEFyV8lOGb7eovq2PJf5H0RHTVeInaDL6zsjueVGyA3r5cqlrWZXZBGXEoQe/XcAh5rZLzvSDL
	JCZg==
X-Gm-Gg: AR+sD12IP4vZm1fZXn6mofj0Z6BxhpQRaNacstaGJ9lGg+Pb9SofJ3wiF/bg/7/2XRl
	kjEI4zLUNiFHvuwrEuxTeMMBdPMhIwdqj+Wr9pnJ/zHsP3d8AuoML16nTLdhYlgypABWtMbmJS5
	LBJXK99be7EE9a3MmihFGVM/dI8vgPV4zG4N+oX5LROTIaXUOAAT3XjeDhbqgVpV1dNgZ5JwwS6
	3jOel1tVSrDed1PUvs9QmmzhKrqHoAmJG9f50+SwL3ZrfjtgnyM4GARD/dgK2GCqHHv/fiOUW0L
	7qY3odIUaYXhsP3/Y3OomIn4DsjA2MPHPwBQPKg1Nch8dWPH7MRKhOhJMaDUG5kpD7TO4eX90Bd
	a6FxWchX3jdkadBDvyEEmO8nru3uG5qpLW1Qb4VE4S2hHxMQzVtvzcY7ERFOx/N0/4QL0pBvFtb
	peqGEPjcamSSyzTUhzbmuIgUE=
X-Received: by 2002:a05:6808:3c49:b0:49b:dcb8:e2b5 with SMTP id 5614622812f47-4b2ef32fbbfmr8775300b6e.19.1787328607635;
        Fri, 21 Aug 2026 09:10:07 -0700 (PDT)
X-Received: by 2002:a05:6808:3c49:b0:49b:dcb8:e2b5 with SMTP id 5614622812f47-4b2ef32fbbfmr8775199b6e.19.1787328607195;
        Fri, 21 Aug 2026 09:10:07 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:10:06 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:59 +0530
Subject: [PATCH v3 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-6-196e2b306368@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=6723;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=mtVrV1uYZXDyrVr/tVpZRG4gZ+TsBy9yYnmosCcfvew=;
 b=7PUGi/8pw2fm6JVgwRuMQ1lLjBQHi4gKEBJbyChLH2ALoQTlEK8RuCF8rjiCbtGttm4CyiGBe
 p05KznwNYIEA9LdZDATX5ua/pk+BnSBmqZuAeqP0x9UX7cj6BCJxQ3Y
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX8zhIpO3nzH8S
 EbnC+TKCqEzMnkUBozjAjCUw6h3Eqtv85UdAwHJxCeZg8yF/rQy9VNaDdf3srGCjLRCRWKuLW7a
 gcurxjXF4wtHyqXBfTlEV6i69m1opFs=
X-Proofpoint-ORIG-GUID: LKb90H3skkBXdNahKPyXi1mBFyW0acST
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a887860 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HzFHdt0s4hRtsg76xsUA:9
 a=SZrWHX6rubHfZbWI:21 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXycH7wiBkMa/2
 7UZ+vd9W+NIo+BCUkrhONx/9hzSTzZeQZn33qzXeD6fDQYjUoC0R8QaVoHzuZjUYB9LWepDA9WL
 TPD9egMmkt0GmGEsKAcXjyIdS9RguTLvi1MY53Qr24XvKUnuXg305a7DefV71UctohIXe5Uws/t
 QKM/ShnU63m0GvA95tfJCd835UoT8P+cGWMOVV+A3sLmfPvn2bm1EUgwcbHSIwEKu40zblXeYxL
 d7BOLv0rH+RxKxfVYNa6KKDaHElkvugnecPOYw/dcttc3TM4njlTurdJdAmczyN+o+zRBIy9MSl
 ybqxs9pLaw/7POZcsyngsaKpwjTIXwg7LvVUANR88T2TfZpYds6ac2Dbx2jmYcM15et7rXvvDiX
 Os4psOFHDsPTXNxQGuXEHh5sk43TCubEKWyQkit2NiiBy+MFBMgTODqhNd68Sqt4uSET3epbt2w
 XKZE9Rddh1ViuPDgbxA==
X-Proofpoint-GUID: LKb90H3skkBXdNahKPyXi1mBFyW0acST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091009_100074_C268F3C0 
X-CRM114-Status: GOOD (  16.35  )
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

Document the RPMh-based Network-on-Chip interconnect providers and
associated node-ID definitions for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 117 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,kuno.h       |  89 ++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
new file mode 100644
index 000000000000..576ce8b1a802
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,kuno.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kuno-aggre-noc
+      - qcom,kuno-clk-virt
+      - qcom,kuno-cnoc-main
+      - qcom,kuno-dc-noc
+      - qcom,kuno-mc-virt
+      - qcom,kuno-mem-noc
+      - qcom,kuno-pcie-anoc
+      - qcom,kuno-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kuno-clk-virt
+              - qcom,kuno-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kuno-aggre-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: System NoC USB SF AXI clock
+            - description: IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,kuno-system-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,kuno-aggre-noc
+              - qcom,kuno-system-noc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,kuno-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    interconnect-clk-virt {
+        compatible = "qcom,kuno-clk-virt";
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@1640000 {
+        compatible = "qcom,kuno-aggre-noc";
+        reg = <0x01640000 0x33400>;
+        clocks = <&gcc GCC_SYS_NOC_USB_SF_AXI_CLK>,
+                 <&rpmhcc RPMH_IPA_CLK>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+...
diff --git a/include/dt-bindings/interconnect/qcom,kuno.h b/include/dt-bindings/interconnect/qcom,kuno.h
new file mode 100644
index 000000000000..eacbae38f85d
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,kuno.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+
+#define MASTER_SYS_TCU				0
+#define MASTER_LLCC				1
+#define MASTER_AUDIO				2
+#define MASTER_CPUCP				3
+#define MASTER_PCIE_RSCC				4
+#define MASTER_QDSS_BAM				5
+#define MASTER_QPIC				6
+#define MASTER_QUP_0				7
+#define MASTER_ANOC_SNOC				8
+#define MASTER_CNOC_DC_NOC				9
+#define MASTER_CNOC_SNOC				10
+#define MASTER_MSS_PROC				11
+#define MASTER_GEM_NOC_CFG				12
+#define MASTER_GEM_NOC_CNOC				13
+#define MASTER_GEM_NOC_PCIE_SNOC				14
+#define MASTER_ANOC_PCIE_GEM_NOC				15
+#define MASTER_SNOC_SF_MEM_NOC				16
+#define MASTER_QUP_CORE_0				17
+#define MASTER_CRYPTO				18
+#define MASTER_IPA				19
+#define MASTER_MSS_NAV				20
+#define MASTER_TME				21
+#define MASTER_APPSS_PROC				22
+#define MASTER_EMAC				23
+#define MASTER_IPA_PCIE				24
+#define MASTER_PCIE_0				25
+#define MASTER_QDSS_DAP				26
+#define MASTER_QDSS_ETR				27
+#define MASTER_QDSS_ETR_1				28
+#define MASTER_SDCC_4				29
+#define MASTER_USB3_0				30
+#define SLAVE_EBI1				31
+#define SLAVE_AHB2PHY				32
+#define SLAVE_AOSS				33
+#define SLAVE_APPSS				34
+#define SLAVE_AUDIO				35
+#define SLAVE_CLK_CTL				36
+#define SLAVE_RBCPR_CX_CFG				37
+#define SLAVE_RBCPR_MXA_CFG				38
+#define SLAVE_RBCPR_MXC_CFG				39
+#define SLAVE_CRYPTO_0_CFG				40
+#define SLAVE_EMAC_CFG				41
+#define SLAVE_IMEM_CFG				42
+#define SLAVE_IPA_CFG				43
+#define SLAVE_IPC_ROUTER_CFG				44
+#define SLAVE_LAGG_CFG				45
+#define SLAVE_MCCC_MASTER				46
+#define SLAVE_CNOC_MSS				47
+#define SLAVE_PCIE_0_CFG				48
+#define SLAVE_PCIE_RSC_CFG				49
+#define SLAVE_PDM				50
+#define SLAVE_PMU_WRAPPER_CFG				51
+#define SLAVE_PRNG				52
+#define SLAVE_QDSS_CFG				53
+#define SLAVE_QPIC				54
+#define SLAVE_QUP_0				55
+#define SLAVE_SDCC_4				56
+#define SLAVE_SPMI_VGI_COEX				57
+#define SLAVE_TCSR				58
+#define SLAVE_TLMM				59
+#define SLAVE_TME_CFG				60
+#define SLAVE_USB3				61
+#define SLAVE_VSENSE_CTRL_CFG				62
+#define SLAVE_A1NOC_CFG				63
+#define SLAVE_DDRSS_CFG				64
+#define SLAVE_LLCC				65
+#define SLAVE_GEM_NOC_CNOC				66
+#define SLAVE_SNOC_MEM_NOC_SF				67
+#define SLAVE_MEM_NOC_PCIE_SNOC				68
+#define SLAVE_ANOC_PCIE_GEM_NOC				69
+#define SLAVE_SNOC_CNOC				70
+#define SLAVE_ANOC_THROTTLE_CFG				71
+#define SLAVE_QUP_CORE_0				72
+#define SLAVE_BOOT_IMEM				73
+#define SLAVE_IMEM				74
+#define SLAVE_SERVICE_GEM_NOC				75
+#define SLAVE_PCIE_0				76
+#define SLAVE_QDSS_STM				77
+#define SLAVE_TCU				78
+
+#endif

-- 
2.43.0


