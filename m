Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F9FC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=v5hfNaeNNBKpemAw7/X94XkhfR
	HEwytW28D0dCWmfpjt4v0yrqhz0hnCdIcuZ8S8EcSATrNk+IeqzJ0smhZhhH5jFKzn0qOKAjYzfgl
	PiwUnuXSMbYgPXpqDC1z7iJFdA23JFMW/KNiVU8oSmprftWHkk/CP6LBfrrbr4KYJrH788YfRnLf1
	SmsTWuKZkCaVDgo1Kqzv4oVEFvmai7TvPJIx3GlzrDMr9HnM57p5W52KV5+KrNh+K3tsMvL+jSP4B
	umOsvSN8sG2VaTm7Fp/ZA50SXbWzczifO93CquQmMH5vcOJanHu+mDhEDc1PSwoj6dh9Ydw8BvjL6
	OduC/28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3Q-00000001SVj-1Eym;
	Fri, 17 Jul 2026 07:32:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3N-00000001SUL-02zx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:32:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cRll1018979
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=Py8LvuyPCUYIugxd
	Mukqf1gED86qPjIRSzkMHAAQ2SDPMh9f9EHtAIZye6NLkJAHu0v+APtVuJZ7SRDY
	/gYgu91JHoE/72RYW58t5VG7SU+sjzN/QOTpLqI11qyGpTZpbhhcReQb4ct592DK
	DAbflv93w45hVGFolfXUKyx86nfU+BI3yT/BcRGjjyKsB8vQ9b0jTej3KoeIjY1a
	jTqzH5Cyi9YDkerkFg2AoMM2bEEP6zX7B6W0enyB4rF5D4tbyfXykCLCecj+RfQV
	uJTkP0LwF0ZnsQLXKcBUmT1QFWMb6p+GrL4FwzZJqD9+OxUP1B9VzFYNcfBBbvnK
	+bnK9w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff8107hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc8bde6318so135662965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273531; x=1784878331; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=aeSImU7F8zLZmCGtqEQva84mSnwF2OfikKzh+XAr5AlBllFkrrwlYBH9INOcJNPeJG
         hjE3e/3BT7XyJFd8zitS7XHsKEQwnxJPHL000NP3+Mu8vxgjeAcyrVasUw04YREy5S8B
         C9IGb4Hwz6ymgBNp8KU+PdVmhkSMR7koiZvWQTV1SVeMKW41xIU8s+ACeewjuMvH0wyB
         cBUPhMPTeRvjb14STq/O+XER6fhy11pS7ZmhnxilFDNlH31CH0wIi2RnLgToMpCEHiP+
         Q16QfIINATobcq09pFAFXpprEFxH+b98B8Qkmzz4KnYoc4JT0O13+5jGKQtPbQOKNkAs
         6UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273531; x=1784878331;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=ZcT2UpBnnLlM+KRyI22l8dNtoLpCzSG6egN2dH9a33FIbflvbE4aVtgwOmGkArzEpu
         KLRdM4ed9a1t7PS0PeTPm+gecSK6l+64ZGKz8j04hd10sS1MD8Zbrh8YKzYH/kFiCYCm
         W6d6WL1I6eN71rTfckATt2NTZLxn+0v/MACe1dpkEG3lwqTVqh66pd0n9WF12hvWHjXk
         BYBnB/RWqwqBgTE50EeRc3hBazp7nlX762h4xWDI7KwkYGdiNcg5t5H+KwSI+1nKBof3
         VWuZoIR3TNGm8KMnsHSrjxexZhctqKCOw5IkxRENYQ/tAMo1kFBa69OcMmCaM6DVIyst
         efgg==
X-Forwarded-Encrypted: i=1; AHgh+RpMLtPLucXTfbcu69uuT5cc9+1tYAsDOgP6w3HnbD4v9Pth90aIjB4R494qLVy1KHyV0MDQzIPSYEuQLb4o0KtX@lists.infradead.org
X-Gm-Message-State: AOJu0YyvEHc6yDEwmCOj53WPTotbTws8iTQqNk7DEzHZKF7llVkMDy8A
	2slqu7eoCjnygZtV+jjYA6ahh3BLCzglTWxqCvR1GEQJug3uoB89MH2JmXu6697VAlooEdFK2fH
	Lw+bRGN+VSWVn8fIaoaPQythNrrgVKhfGjD3PgF4zBUEmpKY1pOauAFb4rKqBB9apJmdFAdcDps
	NPgg==
X-Gm-Gg: AfdE7clDOeGRQ5u7dGE5M12aRukmzJfoN381zavgOeRzeorZ5dHRnjPjfNHHEGi3K1Y
	LbyGofD7n3B6ydWUEyjm7ldY8J94YUMNCY/GWuvOr4FeFHzem5CWT6i+oYeG+Zlnee5cLLidmno
	Z+UI6GNAw9vYkPefROgStHHpTfjt2IXRzDIxWB6QVFa0ZQbcTQ98+/kHCvEKB7w0lVWZztxYJyN
	BYDnDM2k3+A+aHnxetkAO6eU5pJJhxflBf+wxUr3B/2QKHBiroapCgXmjx0cEyJvHMGigQDxMvS
	PGiU8rV/tDzVDZqLfh/ZtTvnSAYH/7nW5GZ3S8xvjWPoZHXyn6JlXXv01UkPlmwg/XoNvJC6CWb
	vsZs5gqy+K9AeCd/+QsMsVUKn
X-Received: by 2002:a17:902:ce10:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cf34a0a416mr15804815ad.24.1784273531048;
        Fri, 17 Jul 2026 00:32:11 -0700 (PDT)
X-Received: by 2002:a17:902:ce10:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cf34a0a416mr15804455ad.24.1784273530594;
        Fri, 17 Jul 2026 00:32:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:46 +0530
Subject: [PATCH v8 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-2-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a59da7b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: MNttWQ9LF_kIcZgXtkdlp-O5UDHYxmsQ
X-Proofpoint-ORIG-GUID: MNttWQ9LF_kIcZgXtkdlp-O5UDHYxmsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX8E/yMJyyeHxS
 1GaZBWdSUnEliluUn5cQRkAOV3ZT1+QkvfD4gS2VCoH4IcX0iAwBKCxTe2xB2V9nJcycF5Syr/I
 z2uM/ygCEMoB8GvCNIT/rtcRfZHXaNDeWkP0DBJHTxH9CEjA+LPb+YJpUuPNwF3blpFR4hJM+LR
 hjOaUNRf81Of6HzP8e3ZVlAMRUajNeN3lQaxhXscsMEikeiJYfD+MAh6tFGOC47E64k73Vtcjwv
 nFzKe2CeBSYiVTkf414SmIuCb2ZOkaqSsemDuk7tn7BOh2XsKHJUuWIQyMk/a676I70xcTDllpL
 /Cci+CDjI2XelGzM2/SL38dW7khWCfDXAY6FIN6qJaULeKHVhnm4OhM5ZUxjLDnnbG5R4uZmIdT
 fP8Q09CX264W9KMEvTLNc/D8bDS8Z475//SJHMqDQvFooTOY0FKEGkdTPUlaYA+5g/OVNYzZZEL
 7rhVwiDCBaU7LU6HqFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfXwXFiK5wiEKZK
 m7UFgt9CyESBNu61zKmTd3FVb4sBO7KPPefoSTy8kK6HN43T84mrmW004knxwgyWpuUta7IbE0U
 VQmS/HszXfTZL3s2sA6THJFRAzdrT9k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003213_290397_BAC928C9 
X-CRM114-Status: GOOD (  12.80  )
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

The Milos video clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented
qcom,milos-videocc compatible, this is an ABI break for any devicetree
using this binding without specifying them.

Fixes: a4937e974186 ("dt-bindings: clock: qcom: document the Milos Video Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-videocc.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 14c31efe1308aadbea61eb7be7e56039a923aec5..4d8d109cd304ef0f5afc5c3fc7961a6156003d4b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -26,9 +26,21 @@ properties:
       - description: Sleep clock source
       - description: Video AHB clock from GCC
 
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MX power domain
+
+  required-opps:
+    items:
+      - description: CX performance point
+      - description: MX performance point
+
 required:
   - compatible
   - clocks
+  - power-domains
+  - required-opps
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -38,6 +50,7 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@aaf0000 {
         compatible = "qcom,milos-videocc";
         reg = <0x0aaf0000 0x10000>;
@@ -45,6 +58,12 @@ examples:
                  <&bi_tcxo_ao_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_VIDEO_AHB_CLK>;
+
+        power-domains = <&rpmhpd RPMHPD_CX>,
+                        <&rpmhpd RPMHPD_MX>;
+        required-opps = <&rpmhpd_opp_low_svs>,
+                        <&rpmhpd_opp_low_svs>;
+
         #clock-cells = <1>;
         #reset-cells = <1>;
         #power-domain-cells = <1>;

-- 
2.34.1


