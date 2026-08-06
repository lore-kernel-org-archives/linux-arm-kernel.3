Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDD9C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=PS8Jus1+Ag5fpYstNdjginLK+i
	Ae3Greum0Y1bpqfuyOQq7Cv+BcFMX8AsDQms6yvF1gEDSL2Ut94DHLlnc7F96VQhV9+sKf+zR0OH+
	IXTc8Xb6CaESCnvHSaQxsZYWFI+ejsxuTDOlfN+hgogKdw2XIYv7QoPSU6EhavwI0UK3PBCniIuAq
	8trMx7tCZ20MT2woW0gscgjYdi2LmTlHofJJIYHERiu5nV1CwGHcKCgNhJrKj7nHs8z5sUpSe+GOQ
	23gsnLrt22clEFprLFLlM6Pgdu45fzdmlEQWkEL6Uw3mhGKJyDZPsoc0y8Rb945MmjuhZr1ITHuxT
	aoFqERZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQs-00000005YUI-3EaV;
	Thu, 06 Aug 2026 10:34:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQr-00000005YTf-1m52
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:34:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nnZS2105341
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=; b=DAPh0i8W3FgR196x
	rOKHkcP37K/wFCxjXlrgZXx5jDZejmVpRP+PoFDOfG4sDlP5srBAipWsf7l7142p
	6RrtNzyjofp4RNs7y1h6jE4h0q88W/oRjRSgBeD4EAeFlnofakahuFZGYV/MrNsW
	eM6mOWA+6hylQWsS1e/5afgpzROFJcxFZqGMqE11bTFaMcgzD2CQNRRO5MgX8iyv
	zE+xqgJs+/aWLDoaenR5ocGg110q6s/B7OQsOLgsycyQYwXPWGQRPJWCLBp/8zOG
	qWhuba8y4VZW52D0MIL6ik4tbZuEobLFVeQuR/q3pHbNbUHrWMrp+RVZMvkQ9SvU
	5NYVDg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq730dgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:34:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so2634167b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012476; x=1786617276; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=a1FhTcfuaxrZ/i8Rwb2WfGnXSwI4vpP/Vm+tum5QC0Ar6rtJf5CQCs5NOLMLQGA+7U
         77Bjq7pJtZAvbYZluI/AeHvFI5aeU1AZBX/1wW1bcfH+R4DQVwR97fUFRAR1iLkBSDbW
         qzV92avcYjClB1h9iyPcO0OH7eIp8msEZVfA1X7eeU/77VA4YhTBVMUh/EG3p/tclQ0f
         BflyMAnw5lMuPv3oStBGearVu/QC3j1X1RxCsgXPlmky4QG5/f+TQPCa/xBDZVMpdWDu
         wTL+tAFzRxOgqjGIDfftKeav/rgjDp6RWR1PsG3+JOiIuiqMV7Mysi40JWt/d0Ci2sfv
         GjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012476; x=1786617276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqweWc75LJ4nKbvr/g9yL9BCMMlm273gZ+lOwmdhkaw=;
        b=RBbaJ/U1m7Tt4MQ4T+vFegS7zPq8UzIYPztGbNzcfCojOUWj1Zsh29ba72kjcyTID4
         Pe84s90t+dFpDG5OjE1/uzIm0KhNpzBUrW5m2wtxPkPQll4jt9G8j8YvKzXglUdH7bCM
         q9t2dg5rw5BjOFfQOq5nUEgC9LgNAhxG/z3wK59Klq2nHQCU1P4QAT47RwdLVEDpMLB1
         Q76CWA35KsrIS9lzTLH8GDMOLl9Q8A2x+MTkh7Ws9OwhRogyy78L/gt3IqMeOwyBLyoL
         +xkYkOfi4IK2CJ9y8vBxNAF/jepqPlyi5M8RyYj/aqPvmMXp2tKt1fIpnQolNAv1qhUJ
         PrGw==
X-Forwarded-Encrypted: i=1; AHgh+RoLH7HNIyaKeVbQr47VFVwMJTWEfAY9n9Worx9sqGYzarDVeoawsfx+v9cLCWN+1iIidPdSUZs0Y1OuMZ4JnZst@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdw2aifQO5cEJXTnkzgVN2NezNM7nZYwYvUSJ3P5Je59WfkgjG
	4aUBmhsRffWG84qLNCepPQ46tjTqqZoY3JsSI2Ia1Sbw2thzgdqyr9WeT7PA76ZBYcYZF5+R/eU
	60g8HBQKoQT+fM4WKGrxRPpMdy3foFvtzYcaAQKy5P6RTC2Wtc4P0N2/DP60R1ECe1G+4WxQTRA
	QIpg==
X-Gm-Gg: AR+sD12I7H/YvBkJ/yhu5rBZxcSH63XcXcLDqm0+UU4zqIEt27KYvqObLMxKD/qkkBO
	4vMreJ6mEwyZfPxkAModu8Ai2bwi7nutgZ5xwgQvY32xyk8Chl+F+KXVrMdgNaMvVGmXob/k+5d
	/EciMWrviYtHWoSsYoXJKuseqkG740fYUU8NNZ6YYVuhnqViygfjAzJLUawAEFGUJF+K4W9P3Ck
	h1Yj57MTqDdwAgSWj6iPkQP0qQuRl8RDb8pbcNIXnJLGa2CC4kwibYgVwM57njYy+Sctm4jR5iM
	o17PWNqU0zf11EJENPXwEyp2MOvmS4hOGrKIfTCfZt9ar9Jl9Ns4VvrNhxjNxIThOMGjozwNO9V
	KjL5yLvpp2qcdgXwsUHzBKKQu
X-Received: by 2002:a05:6a00:aa0a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f2e0070d8mr16720021b3a.21.1786012476086;
        Thu, 06 Aug 2026 03:34:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa0a:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-84f2e0070d8mr16719942b3a.21.1786012475666;
        Thu, 06 Aug 2026 03:34:35 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:35 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:07 +0530
Subject: [PATCH v10 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-2-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX154oRjpEBEnG
 bErrQCAe5gSxITKrrvVvhMT1yN5DFeayPJgoJtbkEq05AJ3gXcmPifFfk6HOCCzzTbpOPII0xu3
 8nyQ1R0biw71/GPCncLNOq5a5mEAxGx2PedWkfPAIVpkaEibaLFq4vCr9GnFFWoWXMz2TNHHFlA
 dANtW+1Fe+WXmk3diTKnk943PADJYx78On3OH8my51u/HJhsCb2e0vs9gLV7zE0H6T2OarqjS0f
 eB6IAwuZr4Py0A6jclIokyHC4O/EEX73lMPDlGRId9dHR1mNdhkSJHEGiVR8BR/wap5qCPPlfuL
 9Vg5tiPnrOyJiQI9MIWJ2quYWGrSYLtQwTtZiPOOoO2X371wghooCj7ny5is+jBgsDbbUPec2Ai
 PdK6dV+qk+bT0LSk+9m/Ez2FudVkIX0XUuov3/qUIifEvTNPzWteiISxQKn1h8YpBG5c9gjL6cf
 YcI46w2XrrCn4MHtpkA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX58mI0BF6+YHd
 /yUitZU9SMrs6DxdhuhhyQAtscVx2q6hbyVRtdqchzHvzW0VZHwjS4W1z17boRaZwYrB6Nm1xmi
 E41YKIgbprfZWqa/gQ7NFKrNuN7jEEQ=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a74633c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 5Aq6fhfX4sr-zF8_VCW1KgYzQHXL8nBS
X-Proofpoint-GUID: 5Aq6fhfX4sr-zF8_VCW1KgYzQHXL8nBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033437_478011_DB39613C 
X-CRM114-Status: GOOD (  13.01  )
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


