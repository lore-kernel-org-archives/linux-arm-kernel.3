Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B6CC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2sikrRXkwMudaZ+uyQ+IIhj0K3P1q68Uznqjv+0AL44=; b=EhkudN6p0qcn3nPI8UH6oURahj
	1ZevmBphxhoOVUHu8Oa3sfl62GJ7y16OJya2NQ3tfvCPK3L6hosk2yZWJ6tDz9pCWxWz2qJZWcD48
	/FNxgo9Dyvd+rwXFkMOZie2OvuVw0Fdc31EF4FYnuXbSdibtAO9gPL59ok8Lk8dt6zThUXS8WoOuX
	UZiOMssvbU6AJ3TljHU790vui7wnvv4OLB2tf+2iNzZAHcxF+DnuAGdGjeqHYvI1ftQibWqruNXSq
	z2+WMG0LqtcWXQMbYK6cvg7y3wBMoLKYYxb6BUvFN/HBWvEan+ivPV7NEZZfPzo0SQyQ59QGd4arV
	E+TvjGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGy-00000004VZg-3lmm;
	Thu, 27 Aug 2026 17:52:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGr-00000004VVe-0Aji
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:52:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXcHC873684
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2sikrRXkwMudaZ+uyQ+IIhj0K3P1q68Uznqjv+0AL44=; b=cYuJtT6K1O7t18pW
	M52h6b3Cw3Dv967NMKWWUnMKNICuxBk9KmsVV4fCYX1zJ9YMY4Cjjw5FV7/g0HPd
	Fe7XF/JaLG6gE6ZUhJC4J6av7eEQZuODkbLyqryEeztPEw8fF3xUfC4S+iP7TDZn
	dPWx+ABDU2+3g50xY6o1DWp8uX7yfhcP/gNHe3w0UrDh/iLhbqiRftLGbgS0yO3K
	c09AEDS0aW87i/qGgn14x4dpQSP9mFsc6CpFGgmACM5QGRU72DbtZXx9E/5bbu64
	wg74LgBGgOFnmpUAQGzhUr5HYPJvxKlZ9aP1zKmCimN8nhIjWon22pLkMZnlMIFp
	zxmWag==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0gfdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63c16fc5bso1793775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853131; x=1788457931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2sikrRXkwMudaZ+uyQ+IIhj0K3P1q68Uznqjv+0AL44=;
        b=f3DrHWS1p3aYlLBjaUdZ5XjNxJO4hlk1HeXE6pj2fF25+H78wvpRMImSc+lwGPP2yz
         bNB5iP1v3cIGkERzHGjKAjpZvz9a8rLwsDokjILexne3v2UKqGfk/AYk+mjCtS8pqE0d
         phqvFFWXRrVaopa4v6/CAIwWLl+bc4946jb1mjmm2CanERVUbE94snGDot7TWV1PqKRB
         z7h0L523mWh21/nSoncwIfBncZS81TvPzpx48ud28//UKqcRXUxPJpd20XBvuneM/5Is
         15UOHBpUX4Ukf/EFxBRVPitMTAjdSHmAXNMhn0jwrKInFPYGoSSLHCH4MY/tEznhobTU
         zpSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853131; x=1788457931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2sikrRXkwMudaZ+uyQ+IIhj0K3P1q68Uznqjv+0AL44=;
        b=eg8VyJRfSq2M82myduguOv4R/ZPXjNjIyFg8cNToMNKXYOOdg6c7UcHjksywqbUKC2
         P7TjmOvZyOtRCZO9WXDCyQbELwXU9fZQiXslFwldYut9jeMn/G+k58zO2SLXo1I2REze
         WfN4J7JB28KbSDz19PrUWyhwQjHOW0DW8pPfHHSTJWqquS/0IhS88FLoOQRWoKZO/vzI
         CszI/D2mLSQ2mq16emUQA0h5Gu4M6L/jJ2xDwuc+rPaUAPrjPFv1cdRnW6lNXz7MNiXK
         RHAkiSagpBbktTKkSBBaHirREhB5l48lzRexguS1yLzmx1DrLFWe70xCSCt2UBKpKrX6
         RQuA==
X-Forwarded-Encrypted: i=1; AHgh+Roj1cVBXWaKMX4SCKcTpx4XoecAPhESm0ibMD8+C45DfgXyDRkKZNNIdnaQmcUgv3sXu3X8ivyJmfDwa971cqql@lists.infradead.org
X-Gm-Message-State: AFuF++kcEzZHDFXLlvenTuT+vRGdJNCtHF9eKUYtZjKL7APwTAGO4HRt
	KK/jN3KbBT7u/0VFleOeg77P2CmspFKyO8QYbxgmw6gGDkK50cpciFkHLM4944qzPfyY0gi7Ipe
	tlCec4OBrdpubxAzNJTOK9ge4TsOf+QbgtAWdl4h2FuMdYQ01foOBImOCTeDasw4j4Dp8SEYz/G
	hkuQ==
X-Gm-Gg: AR+sD117CPH5ZS9NosQxbbX5fiMUKCa5RcpeyhANm2Rn6KG93dSea9Hx90zdN2Um9pJ
	aeli6wsGaCv/+1UMPp5yTikpGRqX1IJaY9eBzm4aSrBhL/BqSQxugwTN8HaUFtorox8OhydB97I
	61KZWLrKuQTGpn7ENlDAON2eWTB+XjRIgc8BkAtn0YBPiAgNrV03ktz4eil8Sdf2oXA1YSLmCsl
	hwF7v9GqCpahXPPeTjpOvUSfYYt2x91m6AhNXKzHs/Oz2n+KPygGdqo2Jjz6mpPlujCRFPDX1U5
	aVDdjwrNQ0t1kLG66gnLySNFyDaihkfmq4n1oIab9W5IoVNcq3wlV/wkbgMoV8lf5FvuU8FKikp
	MX1MnibAUyAAIGemqRA3RzW7GTdpF/GU3WgOy5uqkLd2lXSW4Ak+sxBjuE9S+UmPs/N//eXd58X
	JF0iNmThThGYys9e8jXkhBhGk=
X-Received: by 2002:a17:902:fd85:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2d74dc6f7c3mr14004285ad.7.1787853130559;
        Thu, 27 Aug 2026 10:52:10 -0700 (PDT)
X-Received: by 2002:a17:902:fd85:b0:2d6:ffa1:429b with SMTP id d9443c01a7336-2d74dc6f7c3mr14000265ad.7.1787853128867;
        Thu, 27 Aug 2026 10:52:08 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:08 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:09 +0530
Subject: [PATCH v5 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-6-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=6755;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZnkQG+JcPp3GcC7zdZXzSDhHf6/rgK9ZZsLqH/4xBvc=;
 b=8+4NzS0AYo4ne8nSm4dNJ7oDOmmThnTT5jL5Kafdb+9QqoVMtxp6anYDj+2KgAaRhABwr3lh8
 6SPuxFZSr+nAPppB3ss074ZHbRdtWnkcUToNkDAtdD/29vKtJJE3Kcd
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXzNTpDCAPIoR6
 QO6Rbbn1XiW/fSanODiQ67DJ6fBpJ7aYcTSR1217rpeJ8sU93PLCPNjq/DBQmJL3PizddKgCYQF
 noyZ0rxIyse/IuurjBC4e5PSsX71ypN4iddiqPS3AjQIkkacC7jVCe7tlpXbUdI4HvJ3zJuWOwk
 GsjQfdm43xUBGSvfGv7++ERHHnE1fSW/ttrzChCj3hpo+uKiOs8HM/OLenDXu4ElR6ZAtu0toSJ
 HJiNwW/1L/MrcVo0RFG0VsqgdAUBwBSmb9Elfpq6Vt2axMTKxqOH4jnI7qGoY60ID+RC9R3wHKc
 x8sTTACrH44IdLaUJvCKBvD95UMI13DO4nYvWqe6Bfds04deciQJHsVf+Fgb9DXUwgAjudgCqXU
 NslZdCb4iOQqABssFUqx/X1RzFWYXf1FpDd1GaTf2to2T65Fw+sjMy4vDj5VmSAF1ijKu+W7eyU
 Yzo+iQlqzsBu9nbyLkQ==
X-Proofpoint-GUID: JDo2u03Wb8QNhnO1w_nQ6Yl3fpV5JRKb
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a90794c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HzFHdt0s4hRtsg76xsUA:9
 a=n-z2q6p6VjFlOU1q:21 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: JDo2u03Wb8QNhnO1w_nQ6Yl3fpV5JRKb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX6QPysm2u6lwo
 bcZn/z8ARWWcK8AKP2BH2N0FgRx1XLBet7X8UApeCqBiinRgpHm307/Vj8JVv2vx1M7a4z/KZ6A
 dYgtlIesFCsN1YQ6x7gU/juFgjwCjcc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105215_532927_65A2C033 
X-CRM114-Status: GOOD (  16.38  )
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
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 118 +++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,kuno.h       |  89 ++++++++++++++++
 2 files changed, 207 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
new file mode 100644
index 000000000000..20d169b31142
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
@@ -0,0 +1,118 @@
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
+    minItems: 1
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
+    clk_virt: interconnect-0 {
+        compatible = "qcom,kuno-clk-virt";
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    aggre_noc: interconnect@1640000 {
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


