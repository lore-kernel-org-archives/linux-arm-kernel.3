Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FCC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=L54/2MFtwoRhs9OrcEzVoWS8/E
	KEU0j7FIWj/eTB1TZJmbLT1R0ebxO44mKezXBS248z4sS9nPjja7st7VLjlVPlM0YSBisXILQ9RVp
	NPsHVhFXl/oxg1CJFZxVSXeHRKuLwrfbiqtw5J1fylLroHw/jwJw/K3AYXRccj8y9P+g/wFpiNtQp
	og8nridzislMtYn+7F0JxRLPP1nZ5nOk9DRc8+3AfsgB3ERKoS+La+kYn0tHRH7p3NTupyGdyDQ5O
	tUEv/VicMHV84VzkU2Yivu1zHv0W1UIlmJuJNhksksZBTAugnRNKR/eBatPRaRgU+LLM6eOD2HQ/V
	bS/eOtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQn-00000005YRe-2TE0;
	Thu, 06 Aug 2026 10:34:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvQk-00000005YR1-46Ci
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:34:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769ndwX1578696
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=; b=hFsLlZ9bQOR/NP73
	Cd4tzSExM3kqVw0Ez5dlZ7+911bEkvP0Yz5fCgogyvT/F2AvyZESrEUGIVGRn3TA
	oNk4JoRNGu8PlOLAlJbcWeFgkLQlIdFz2+Zku3fRDB9RNimd56XF9AlscEUgmYYW
	UboXg6aY95cEmusObuG+V6scKNIemWIyWA03qgq842S4M510bKOVdjq7/nGInXkg
	riONp9HpICmia23gAHOFwmPABrM0PJaMPWla3aFYMLrlT9FRtVECTLWPUyueuV26
	RCCdkMVN+4YSZhVGFyAYrvTWTM7f8SA65dEwaheOe1+3D2KTmqm+LCGJbo0xOU69
	Sv6Dlw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hk89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:34:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7049fa552so1383635a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012469; x=1786617269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=D7h+oKqmMkGLU4eHx4IiWZ4Y++2uUa6uzcwQBJuPJ8svi+DQrZ6Nk1+oIevtylVZEB
         Z5ud2YZ7SeYyj5tEIVq9INhn1eg2NT0yTx8CZhPZZyTKTYXk3MKdQtM8GaEMao3Ek1ej
         MXDXOjW7y8wo4VnJep2d9Ax8kjYhhFqGNQc/s4PDG4J/SxNT9GIXg0OOQPKhLk5W9+mP
         v7/+2B8Q1tNRA3LxxhV16ecWZY2ODpJ1uenMOXe4MFYwwTy07RBO382XRDLlAIM4IKQY
         GV8U+EMOjqzfGuipB037oRzzo7ZK7vXLEfUOmORp5hlKUiWdmCrWcGxn9r+ok2KV2AMN
         R3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012469; x=1786617269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aka8zMnZUWdgbY/H4c3NWQK0JPmAp5Rg6iT0lDWOvcM=;
        b=EL8e7Gdf0qk/AwIPCCRxtINp0yzSTI4harhxjQ7bUHDP6ymj4TtKajpu0CNQ+G8M/R
         HMxEWl4ZzhhXEXTc9TzB0oq8q4Jrc7eWggVdQz78VoC/jpBiSseP96aoPzyGke5EaPuA
         cNcpspxjNNXQfu29/LfRhUlZpAycsYw8I1Wre8YtZCW/8nQu+JUGqqgddxBhSxFQY411
         cRBDBprBJLa/V/XWfZdN5wMSnxVSoe7SRBRnnyHMrUINMaDm88iB3cTdbeCGfhE9rxTh
         nyGDpy4rCene5K8bN1fnZc/iB5SmDchSnh0WQdKqGWTABB0jxiWWbzuv5DnroRwypggr
         G42A==
X-Forwarded-Encrypted: i=1; AHgh+Rq8NIjyFeOnYRF8SL+eG8gpkRyQz3eruLgHC4Nf1gwDGPP0KHUnlpqajzv6TNQEFgAZ20DHXxqkNEfvFwUQFAKt@lists.infradead.org
X-Gm-Message-State: AOJu0Yze9ArBQgojAsDCGcDieuADJb6kXiopcd9SsroKviOdirFL6O2t
	t/fCkyUxfH3ux8omKOGRkSpvF14s5S+Xw9KqYnnHBTduoQ5qCBHqK7oMizbKEmLPi3VcjrJHTJo
	LriKDoJurX6uKyVSp+s6Cy7tPNvgBW2PGl/5euKCq9CMCEh7I/xoYSyStA04WWVShD01baccBc6
	4w3g==
X-Gm-Gg: AR+sD12O04qQq6DKVithJhMpcjVIliNdE2i33oI5qi67VG8NthMKBDwfliw0cBtXgPf
	I8+8pkvIoPxQdDNMTYxL+UK7EL3HkYnet3PQsdxgj8an7THGjTPzrzBQwzkx0DZp/MFGjevdGY7
	aEfwpuq8N2QlFxQ28Qu6Z3tEV+TJORrrL7bJivNVegMesJzhVCFSfftbPIP4yexewr+JUS0YcNn
	ZNL6DLui8smbEbrle8qw5dLfy3UDWvGWBZPQBkECTABuvbB2qMi7OaRfnc1Iey8rp14viRIuJKc
	bWruLzoxvoYugHf/0lT5kB9cXsU4XnyKo6AXNtEsrcD4YqIRh3QrRxhlf2ldMpQ7VErZBX/kERu
	nGCj2GsiiAF7CBZo0ThFcCOZy
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84f4fd9f762mr441445b3a.6.1786012468755;
        Thu, 06 Aug 2026 03:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:b8d:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-84f4fd9f762mr441336b3a.6.1786012468266;
        Thu, 06 Aug 2026 03:34:28 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:06 +0530
Subject: [PATCH v10 01/10] dt-bindings: clock: qcom,milos-camcc: Add
 missing power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-1-6ba52dd14343@oss.qualcomm.com>
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
X-Proofpoint-GUID: xSmYU697u-A7qlvcDUr906xWhk4k_2Sh
X-Proofpoint-ORIG-GUID: xSmYU697u-A7qlvcDUr906xWhk4k_2Sh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX+OjU/0JncdKs
 pho1SqKpW/l2sqY4tEcBF8D9kmx41kNlYMxN8v6w9PBGFlSIrfXEhbic1+JLoe0w7vv5RBd0U3h
 kKski9PtfdBWJt/bAh0yRDGdjJiYQraujv4kxFah5tOSssG9O4vlDA0ZZ9ERvSk+UdT2yTl3BfU
 WD1QjSsawymn64srBzZg2qy9V5horIv4rwp+IZXCvYdkH807AYnDWNpFVhcHzdIeFYXGpHxCOPy
 kWxZAqzqU3t2Mfg8EyPWmPjgwXxQ6a9TmDrreh3Ozk8R1/k7h6J+JiC1ttc9+zSQjnis20YhMHS
 ekrL39A6eGEcmxm7rRZnjAdZ48DZXxfpbD3wPGC78M1P2ciLCnM/j5/mZEc0I+fEaaYljd2jXoY
 BjNxSxcXsUnIXQ5Z+bwTKExITmZezdk5qlRd/HqflvZCSewsHnNLgqG2YjzTrzb0d8nzCAlCUmf
 NvKmQ90RFAdI55qnMNw==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a746335 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXz4R0uYNxPm9r
 oAU/imoJK7SbeGpY+ZFMTIPB2pGkYTZ2DVUmDuBtUQE3KF8l6z+TTJAeETjvzxEKy23pXqbkNiU
 9tGhLZdweUVqyhOEvc+2dj0d4sG2Kh4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_033431_141037_54F4011C 
X-CRM114-Status: GOOD (  13.67  )
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

The Milos camera clock controller requires the CX and MX power
domains, along with their performance state votes, to be enabled
before the clock controller can be accessed.

Document the 'power-domains' and 'required-opps' properties and add
them to the required properties list and example. Since these
properties become required for the already-documented qcom,milos-camcc
compatible, this is an ABI break for any devicetree using this binding
without specifying them.

Fixes: dbb9d53b7197 ("dt-bindings: clock: qcom: document the Milos Camera Clock Controller")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,milos-camcc.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
index 707b25d2c11e601384b9b21b7e73bebf72c674da..c4aba40e316ca746c7ecc6955823c7d1292d5547 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -29,9 +29,21 @@ properties:
     items:
       - description: Interconnect path to enable the MultiMedia NoC
 
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
@@ -43,6 +55,7 @@ examples:
     #include <dt-bindings/clock/qcom,milos-gcc.h>
     #include <dt-bindings/interconnect/qcom,icc.h>
     #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
@@ -51,6 +64,12 @@ examples:
                  <&gcc GCC_CAMERA_AHB_CLK>;
         interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
                          &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
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


