Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC43AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=; b=mvT1i5OXCNSxmTsddq3zJEMJbQ
	yjwlyuqvywBFnAMK1D0ueucfClaqIMu8tY+F/Vi5MlXAmds7hCXoje4/3oreMJLJI19zkYIfmBwbq
	NC49lX/VSqeJrJOWQ2cYtkbRw3UlWmErqEJbNVNZ2BShcWoqD2rkJN+Wcv0NFYgeky7PsSQVwxQg7
	QmJ/o27EW+QLKQ5ixUSBwlkOCsr8o0/ODFq3KzqAsAF6Ic3evPx9M/x4xPQEpeTkEdlBfRxCVRWTO
	QxFZ0dPah8OZRgu5IPkLJHbV+ZgePZ477jMWsZhkqyG9O5qm9u3zMU9KZd/f4zHTX3i+SgAhQdGjQ
	7tmZWqGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI2z-00000009en1-2TYO;
	Mon, 13 Jul 2026 14:54:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI2y-00000009em5-1dY9
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=; b=aQwCyIbweaqDjjhbOAqcEDsbHY
	8QItykiFqbvlffbqSnALn6tb3cTt1eWgLuRBwsoxv6hYLfas66teSCbFGGz9NspkQB1KKGaLAJ5SA
	AP2QWEzlTurR6M4rXz/J6hdxu/jFwpDWGoqRZr+dFIU06w81b+/xMtjvqRlJStZ1Iv337cEeSdmP5
	cawYeqYeIZt+jVymnhDDb+De8c1gp+VdMF1gI9dn/b8EZwtco44QsFqs1Tiv0Jw9uYMQJFMZCv3B7
	BEV8QEi0/ORWCA870Tm4HlCfI3c9RDgLDgFzPX72UCWJ5KtbpBR9bw1sfO2uw39Qo9HrSIgSnb0O+
	aCJ4oBKQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI2v-0000000BjlD-18kf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:54:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEGek1516565
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=; b=ofQorq/FVZQXrf/h
	muej9Xe6JugH2Vf4rCykWBdZPw2WxMym6btcT0gpDG6bFDG8gfkJgb6deXkN+Knx
	VfYwOLAmOQUcDXWYuyMY9pJJDnE867w+Y+NdiH3HshdsZ0sTauLMy0XbFRBj1RUf
	Ph3TQIOIzvWdjkYNZJeZ2VKOXom4OA0npNi0JFL8R0omgOsSgPG9a4Rc1xysCsL8
	U1LrASJ1/QdMtzPqevW0ijYTF7LigMlPCMJyQ6kCTkRCM/03wBRkLvTCPynEcBwN
	EsXM7DqdwEgwlNV1mm9ICwQuNZ81keaml09aQz9bIJCwzcga6S5+mwaxraokTULm
	XH40AQ==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubssskr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:11 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6a1625758a5so9956eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954451; x=1784559251; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
        b=Hd6XFEubHObWz1Aow/bM24eMgPqPNBncdTdvv4/rqD3EOmoYLg2SDVjrd+ODulWguQ
         gswpJVG1AWmH1iaLrpgwd/piPbrn+3zmsh9MFvdGNb2j2swpdqhGX71z47CI2iWvYur1
         LLQD18ThHWzp2O57MOUhrOcntg+wWta94kbcHTQtwBwq7bIalWm2KxsBdYQPeo7iSdxK
         osDLKQAS31h0lLUrkPGq9UPVw2fxwHT3Hf/2cmZ05Vhzxna2zrIArQG+P6Q1s1HYKUtI
         bjXx2GWbqvSRMAc6uEt09GSKrQCrzNwZfcgPPU+hhd8TO2VK8qOqjmqIc67jXq6gVlTn
         h/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954451; x=1784559251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcYvGlNPYHGAbkj6uHtYNOFb0mvWGe8spTqM6tNVWI4=;
        b=nEExT6Jvyh8NpkO0rCyZl8jFnvb8mhEl11VVLYcHXZAebqyoxj5xFQhhfOtLN7iWHJ
         kihBmi4TUM++A6ys1oOldwNIBOODckutD+kRO1jy3XxyfKOvO2WKNcPspZ7B6B5VF5Jx
         e3c7v5Ag4gbfITamtUbXDtGsrhQL74P/Pa0Aqlh7OdGpSyKDLpCcPlTEyUhgeDR6kOL4
         hmuTa0sMWZTWY9yv1XhN3xoNxtAbQa9CzrZHJGPQ+mmwib3gSvxhetoV/x2SuZhxNlYO
         fzkdeNm7urtiMouvs2DV/VnTLTt7ZjOYWCj0Rogl7FrRYMXE08BiEo6KlZ44J0dsEY4Q
         oIng==
X-Forwarded-Encrypted: i=1; AFNElJ+LF3H/sY4xtluZRdbHCiPig2hTS8mbogUWiIJqsIkY1N/3Yt2JdrOoVGyVW4kx7PYwX4G0jZ+fo+s45ivt/YLJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6u2X+/xqZ4LMw+tSB6q70/wEjymBqeVAuQZCsn0BefBzXTSgP
	qAWpGR9FRzlSbDoZVO+L/G8VDOHQIdcwErKtYQPS1WK4YxSi0A3lMfNpn5FkpY4qdhhe9idnZcw
	9zYDUNjAYCagzmvcrjqX+uQVF6zxhKGsVorA+1dyvwIBOtV/ZHGf7jwi/UR6SbXUvpGJnQpY2ok
	aNyg==
X-Gm-Gg: AfdE7cnuT5a9DxOz0JvqUUM5NmfILUzp/trF/Dx8gFqDZhz/bsqVycvjBiHIQ1Cv2/X
	lmuv+vnDIuDjtzqYlCzMiHJdcvJ2G/dkTP7I2O2OG+Z5/JuMLEl5dC5tNcjoPENQitchQjtImZO
	9pqfbIUKxgGLcbPf0nRf1SEfifjpYYZHmaWpDE/C7WZzB7o9uyUjPMLI0Uk1zd809uMKwk9Gheg
	/8bOopQBEQsTT3EWtvjB967aNlb5/cyyEFHGZQThx2HFhLrdllwCX33leByFUOIR9Flj8wRzbL4
	qbaKWLKnV9qgf+RElwy0Xoj03mSVyk/LARPnma15axZ45bJ8xjHUpj652pEGBKNaOS+hThdEXHq
	4mwAyUCPQvkV5+QR0956vrC/U4QqoSkDprNQ=
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id 006d021491bc7-6a39a54b726mr5693309eaf.1.1783954451010;
        Mon, 13 Jul 2026 07:54:11 -0700 (PDT)
X-Received: by 2002:a05:6820:98a:b0:6a0:e15d:7a with SMTP id 006d021491bc7-6a39a54b726mr5693280eaf.1.1783954450612;
        Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:10 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:40 +0530
Subject: [PATCH v7 02/10] dt-bindings: clock: qcom,milos-videocc: Add
 missing power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-2-4d91bcef50eb@oss.qualcomm.com>
References: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
In-Reply-To: <20260713-b4-eliza_mm_cc_v6-v7-0-4d91bcef50eb@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54fc13 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PEPMgF9El5tgKvQp_-EA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: S-q45wIGEZb-jCTg5hlBnIiPqeOIU5ZU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX3zT9mynweFge
 Pg9g3d3AzqdzXrymvx37q2Lvm0Spcc1y0rZf1sLEQffdV/AwXcpJnJJj0FR/4+11cju9nA8iYXS
 jTrzFvomqJfL2dytuVfjFk/lnpA2Nxo=
X-Proofpoint-GUID: S-q45wIGEZb-jCTg5hlBnIiPqeOIU5ZU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX9ZJGd67yifbn
 FbxxIQInEJ5XBpXdf+QP9CvcMqseOi07enfWZoWCgKeik0IOn8+y1S7u1X73H8yGBxpbB9jWXja
 iES8eWunoS1lRxXER/VAU0ysOJ9Nv1Jx7CWT2zXPXnGcMGji7kvDf7sHedCh1z08M15Nfe+JnqM
 Wm/sjCY7W68u/iC6wwbzfF1V+ijNzGD4pKCmCntAQLyZ7Vz2XpaJg/az4VlDx6zPDwtY1oTXgwd
 /yGwaExmZqtZ3ITSR8Wv7WcFltW7lV1VrUvoinm47IvSDv28KPlpazw+Xet3PfOinfjOW72wRKJ
 YF1GXrUQ3Cgw12AQvBUStI63yrfXOcmH+l0QrCB+wdjanXqZbKToXEe+8Woh92TZ6+PIqs8iAtH
 F+5xgeLR8zNAww+/AxMN4pz8mmSEfstqlYKzCyvRqmZiXYRIXOlGKe4ycnOJzMCK0V6sBg9Yiah
 CzPKG6HW1i5uJQx0qRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155413_612422_C0472CF9 
X-CRM114-Status: GOOD (  13.57  )
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


