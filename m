Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69DC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 07:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=; b=20J2KBnxUVv6k5bFlcafCfpDvI
	e5/Y0U39kY51+sod5dRN4y+O+6A9DbIS5hbKfvBmRpNgWkmPGpSGHdWdS+uYUSRGlPAR+oosOBsbw
	AYdcdFEmh5loLu56C+AXdoQR6GDqIUlvoS8Q7aP/XdABZa9pTIMs3h49ztdOSf5jI9dGbHvO1XROd
	B7euyW1o6dUc8eroFCKm9Gmk5/CGymwOaDWJ9u6rT8S/mCHocE41+EapbDdPNXC3LS3e2ivNIR5oL
	6jN07qTHmSmGbufrxuISxj0jIvvOZbOQZO/yiLx892el3l7sCtFRerhDO/1H+W66D1Tmx8BBny24H
	535yOS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3K-00000001STS-0kIv;
	Fri, 17 Jul 2026 07:32:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd3F-00000001SS2-3crQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 07:32:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cfnv1078349
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=; b=JzpyDCic8QmZQxeS
	ytNwJXOAQf1aPGgP6UoQhbaROFbCwPnWAEpp80oSs0NSgoaajp8lioe5BVJlOg0W
	XP0lrcMvFV0QAEFvpjxS6+UgBT59tqpKmDxHb2HPD3gX2iyOSQMBijG4kvksAFsW
	bp8GVayxVJWG8LmIEPsmXg5JJhwcyMpACngFDHtMNW4K1a32b/S5NptvAt+TXIUp
	3e95eiLaslPWaF9eQX2pFvZQAGaaZHra2H/ze3HIGo2JM2UJv7Eaqe9/oO1Nvxp2
	a15u3gQRojXBzfuUnaSUsznFQw1i23nRHuw1WB5Om7KoLhFXF1vQ5V+LLp1uuGDC
	lbxZxg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1byj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:32:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cae455cf6dso104325615ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273524; x=1784878324; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=;
        b=dC5Y87IKCxoX6rPb3f+y6dWUc8KoWGrjbM329KlyfIHERnzTwwuFCjpZQh1kqjdPD4
         o/oZU22LlVTyJID7byNzpvJMqhIFAMwu17G+iOwHy9siOkVmC2X1DAa0kSm3lijnZiQI
         oGnuddYHNfFdvKvEsmpgDLbIrO6jY2OS1FY3YdIjIL0CV2T6S7wpZI+yF9DN5KjMT48A
         jrX2dT95aV5NWMkTgYM/aynKgMLaKBEjAqsMgsY6F9hrnwrGxhbX69uED32dzCXByHhr
         7xnYkWjECPOiv99XTobxAXDwiYZuWlWibHwj6W+alOJoMguiLGyueV/Fx9QCVAH2ftw8
         rRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273524; x=1784878324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6cSMEyKRh5Yb7aSvXdUBKQev/vl7ZJs6RT901GK9RBY=;
        b=nnZ9Z4cRPiPg9wZhvjk7cQiLKuSsBbRkYvRmpFQsoOF4rQOyB1cDz3pwBzMBj0xCrJ
         jmQCREZ5naQArYPSrpTGUQ31bc+RN1ucF/OrNFAJlGmHJwea7/uRjxd3XNfTy6ChAaNT
         VfFfIZBpYTkmsRw4F+eyi4unLrZLB3W3yNNwbXJ54n9ej5mUWInsLMj/HQgITh+SgNRn
         7hPw7nKMWxQKI2/VPv1o+IULsTDgwaE+74Pnn6uRD13ZsEmdapWZFVN8sbWH2J+omf7O
         G1UV8QV95yDFBtd5FBllvKzjNz49PKN8RPeFD2uxXNo06WGeM3VDhJPyZ9yTRjLT4Mz2
         ymOQ==
X-Forwarded-Encrypted: i=1; AHgh+RodZOhGOMTrevmm80416vavSD5n/Cr1zOYax01iDjxfILYsYcPk7IZGGi+WAwfnwB479xuu3trBdXbxO5AH5z+R@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc8DZTjMQtx3HFsuJnEd8ODecxSE/D5QM9RfcCEt40ytkXTBng
	NNJA69Oyqw73eRqQLlTQmuYDgLdRXwd5lZiJjsIRiJLzhR6XBIJVKhpw0nxGuhch+Dtu+OlqmEs
	pVH1mqZ9HWg3rytx0OsamWkhwSBVxUMqw4ZJ91ZRIp6YQyJYUq2gKszIKamhyBKopctO7rYIRcU
	xOeg==
X-Gm-Gg: AfdE7ckejAj7XSz3ku0OJBocaAYv8NRWrKz+wh5x/yrcVT/tjf7yHbZmeKJAdFKVI23
	1z4w4ce3ftD6YlWSZSoRMoky+wIEFNNefvnErUR+9jf7DvAzqsLnQSWID1lhPAewyO0WSL0GUSw
	ziEr54UzapGb2OmH29tnNpI4TE6FvChNnQ58WJau0NEC/tP214vdpjURcI5h/A/3ck34avabtG6
	RSi7Evg6rNPbLZ2RPSoBZVM8wiLl9+QQdpuDw5N7SejXulcptS6Q6aX5dP2fkkxEFzWV8apqqkP
	HtQIbmVS13/Z1Uhzxr+1ZyxM5iqYPiLkW/wC1BfvTxsjXuI2+nn9T/LmpZbJmEIvvwmGJwZp/lb
	dIwL3+5xFPzzfPQvZZSp9ylIE
X-Received: by 2002:a17:902:ccc8:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cf3484b1d7mr17097075ad.9.1784273523783;
        Fri, 17 Jul 2026 00:32:03 -0700 (PDT)
X-Received: by 2002:a17:902:ccc8:b0:2ca:e9dc:7357 with SMTP id d9443c01a7336-2cf3484b1d7mr17096775ad.9.1784273523334;
        Fri, 17 Jul 2026 00:32:03 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:45 +0530
Subject: [PATCH v8 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-1-5cca1bef2e48@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59da74 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX0rsR8Sx7+ulI
 PoeQzdWBCEOizcKogG8RCEHOJ0klKVhFDWGiQU8dgm2VLjphH7pK+F68N8d+pB9+syNJ+tjKjfg
 /28R0F0LkBKL12mShp4kjwo2ZUT+5YqIpXsoUNDYupTJn+5a95UrUFibCb3YQrmcLpelN8hEH3B
 hOxc+NBS5sk9WGgOGwp+82Bix5/bDyJHfirfvQ63C8Z1ATQOp0nENj/26/QbNG6eKTUsA3IL6N9
 +zDwFwIGd/Ska7XUbIWeSoPZkNI3FC9w9PHGPY9oB7dogAYY1/S1W4En+XU0lZ0tSUVnAZ5Trwj
 cdLWB9PTyfwYt2LqCmxvBX5VWmm0CuctYugTZWdnvJix3mXfxQooYSlSH2/6+CDloyCel5DpxDA
 YQk4UzTJ5xlRKKPFuTFmOBNbdx9LjNN8+E4HlFGaf71gyMAGJCL21HuleCjqdYjcczB7xOlyuem
 InuYYLoIwVe1OzNZidw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX9bkIpbnSSYEV
 vrr2UNAxUAU7PrVHzcLiSQai6ZBCLRdIEHJN4KcvNdW9KmOuP8IKzrGJjKubLXi+ZDveyM32+KY
 UQLNsumKTcZrCUVxHko5riQ50b+gsDo=
X-Proofpoint-GUID: WkaMSKRAQVcj73yXod_5xnYmZiNq7vaA
X-Proofpoint-ORIG-GUID: WkaMSKRAQVcj73yXod_5xnYmZiNq7vaA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_003206_039684_5DDD1AFF 
X-CRM114-Status: GOOD (  12.89  )
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
index f63149ecf3e1b98e60dba27093737ec84b66a899..2295e7627ec9feb6a67f3ca952e6192a31cce593 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-camcc.yaml
@@ -25,9 +25,21 @@ properties:
       - description: Sleep clock source
       - description: Camera AHB clock from GCC
 
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
@@ -37,12 +49,19 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/qcom,milos-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
     clock-controller@adb0000 {
         compatible = "qcom,milos-camcc";
         reg = <0x0adb0000 0x40000>;
         clocks = <&bi_tcxo_div2>,
                  <&sleep_clk>,
                  <&gcc GCC_CAMERA_AHB_CLK>;
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


