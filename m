Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D649CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=; b=JwpWcfLL2L7T8VBLe4Biw0+SyY
	nsY++hA3tkUlW3casEmjEyiazQw22+Y2/3NxoLFWh9p+jG4KhuKWuT4jGulydT9DAS2PlbY3yWj7o
	5sZELdm2bXnihqWOtJ5Y71gfyRWeAqbVB5/4xKKqcSNBZM+TveBRz1rk2Uuv5HYyILP5EZJF13M6c
	/JieGc161mp16KwJJfYILm+rSWVugurCNM8zIH3C0jKf84KCAi/mppyWZZ2rAzUqxa53TU6U+AJrU
	SH+G85M2aWWU4kMw1gcTwq3LZXbqpTE1dDOuY/MowifobvYRpxVgsa3qtq29gCrJCSGQPV5iS0qvX
	9/7Oh/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI2u-00000009ejx-1s54;
	Mon, 13 Jul 2026 14:54:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI2t-00000009ejT-2J9u
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=; b=oODjJXIfb0cw9Lw5tHatNCwe3n
	WtIwDr9mV9K+ETClONLIUmjfdiZjO6M4w5hm4Dx7PQEeXr5wcplfyXhUONkRHWXM83N5vcm/PaUQA
	Khi82CmC9EXEtI3lLQSHjV20jjoQUON6QDzea5OrzvjuCMzXf/e70/PlcTcLahLS2DrF0Dre7eOMO
	Y4abUOi51k7ZvBzNIYtggFdFim1czwBZ/MsvUQFnLN0FcJ6kpNu+rWzVhv6VjJ4ss8ie3BzbyDSWf
	MLmFLzXpvHkJeGnR0pf8MSn9l4Y7wno6a/uUouEbhT8QDh9ROKLU4bxbAH3kOLJb+4jzNBpDmR14v
	YTPVwchg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI2p-0000000BjkI-47Hu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:54:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvad1209957
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=; b=Nt8P/dPqInMsrXpi
	dlCDBMJQJzffvCbFXu8HxvCWfhNW7plselH09h1PpRF9ze7K24Nnok8hJOLAC86q
	XJ8ig9cfD9EUAlEDbpNidNqBua279ln77PStvNLQNrJAdOl6dBeCiXd59DJ+LPiX
	c77ipG65tx9+a2lgegLm/CRtblHxV5KK45yb5zUO4t5NngOfghrxluqSO/ZVF4ol
	ctlAXd+oncuPTfLvseM/tQPmljH8c8uh+8Dj4q8MJstnYmCJGFBR1THnZYzByzZ2
	Ihd5JEjkF7jOwehekW6pq3y0M94WIEhczJmDyQPNsl9a1YEGO8k9JPubq0up3zYV
	JSDbRA==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qsb30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 14:54:03 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d5182870so4318175fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 07:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783954443; x=1784559243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=;
        b=gz2AKahhJ/kJuiBdDCYu3Q/Gd2HZws3SdVd37IEUmLHrpU+15bLVdIzSUhHytz30xh
         aJx/VSFjCbFSrvRCE6HyuQzod/Klcjcs4rJUwkNUhsZ3YX/hp0XJZDR9ur9FpAkrcUDZ
         VPSG9urQOSP2lI7V8GRDlu3OZrJbj6E42KY9cI4Z6DphtHJoi87o8Mi/d7Z8NGkFZeue
         2ZgmRtgoXUwo67fVhZL21wiVtw8UFTpEiwpXt8z5fVpiV7qSPASIqa55/6yz155be/AC
         sSvw1/tkt5Kbty4f4kh6u3BtS9/M7ELk7iBURMpuaZxzg6ZKPNVmFf3E5NuqukOoTJcP
         wRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783954443; x=1784559243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3CJJ/eHOj/g9LLGw/rjTjsJLWXJTAnetYTrtihNqHnU=;
        b=LYkHZT7IlHL18qbW34xEhnbjbl22Djhp9KbjVdOnOaQz8jF164TFNGVBBUqc76MfWL
         aP21sATP+olKXyz/Fvo13p9zjMTtBOR/ZVJVMfDJvaHVml31zvcefavPhaTjoGQrUvcc
         E3E3hBWI6T/Tqhfxkuwdz57B3uKcKTB4vE6P5M45o0vEX+/+8pOVrOdYrJtsp6Deyk9k
         Gnsr8WSlwgGw9Wkk9Oug9kY8ZnWLiqgx01FKLWC2hlkfaPZJOlzMx8nzfHTHlT8gHf3Z
         6ZXYKOVGRLahd0gHjr7movqSv7ta6czR6mbamn3K1ojwkDkd9Fy/p2pmB575GAYwY/SV
         IV/w==
X-Forwarded-Encrypted: i=1; AFNElJ/lUOtV/f1+gEjnDjrb84WDl4OKXiqf66Nfv7uL+5cLnNVY96dMUfVbA955AcUHEpC7YKyAKfKJcsLPfeYtLWlH@lists.infradead.org
X-Gm-Message-State: AOJu0YwRTkpWGCssn+lk5ZqQBq3g0SIUcIVMlrGsJO17A1bZtjagU5lJ
	BBPZ5y3AFQBikjGjMIfPatz++LrozzZD9dY9Tl2K30SfLCtowYPHecLME0Wr6fA1wdyqHJiVIdM
	91W2rXk3Qvrqo3xO1aH/OzOuph3bAOQwcDZXvv3SjWYgHtQc71ZdFCKLa79qwmGBzAkMQ0xdvMf
	m/Cg==
X-Gm-Gg: AfdE7ck27k7FBI6aMRINaOaJgST1SpV74DYWVyaLORgCTHCkI7R0YRbAGKOFMMgVFzq
	xqrltz6m3DrTMon3R4xhEUAZD4fTLq+PqGz5V3lZcC7ie/hwCeVzBvEM+4eRXKz2LWg9SxTUrps
	W4nNKzazETp7H5aqiBPjPkMLRbPxy9sXUNlk1AqJ3n0hkPUn7CmKxEH13ZAgCDEGt33LdLZ0XIY
	t5lmtSV0vhkqdixELdVqC1EyoOC3dJ0qbcvqtQF2KwGPSY44dej2ATCtFixUICICMlCzEosIdjT
	3fUj+fK655sy2HAIyzcbPuwVzNNvwPUxapKDLaYpIwZsVEsIg2IGl3OA7rNZov3Ifp9uwGAIG2D
	YFAAbXieL816PtQR1i602ZJE+TrRpFlJbOjo=
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id 006d021491bc7-6a39a5c80camr3402654eaf.20.1783954442860;
        Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
X-Received: by 2002:a05:6820:5710:10b0:6a3:7701:660c with SMTP id 006d021491bc7-6a39a5c80camr3402630eaf.20.1783954442465;
        Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a38e9bc8casm6728746eaf.2.2026.07.13.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 07:54:02 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 20:23:39 +0530
Subject: [PATCH v7 01/10] dt-bindings: clock: qcom,milos-camcc: Add missing
 power-domains support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-eliza_mm_cc_v6-v7-1-4d91bcef50eb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX1qrMBcT90ALD
 5i/rCbFCAiwH94Pw1MMv28fVvBKYPWZYyGe4eoA0F4xXFBhcYV1EeUzQvui1ehQHO3ildrSnsK7
 Qw5Oei4n5XWNUY/seIiYZgjMna8KjmoisXH4moB3VV6LybkIZjjHdpfKGE9ZQvIlNVMU4f9KnVz
 It9ze3jbZpcoB9ZHQ14ls0N96crYgluINAd/c25h9L8ZwtnW0Ax+/HSzq22PS0SBz4WVbe2XHFx
 Q4TyVj2KpHkmFhiSKu98Mg6MsK2PcMabeeuX/yca3+Vmi0tkhplufnGv4a+ZlNm04Jvl06ugZ9L
 X2d3sHXYMfMCQ63Y9Ah9etATOybnFamJAzsVtpthJ/xYUYu37+zGqb2+BNRWQObMBzIhcJbXUEG
 VVOhNs145HvBTwfCUW8zHUYPKXOvFUGZyKyeMPjFQxLmouTy9+8VH7mLRnXttsYC3Gx1joMtjhR
 YY+3ntk9kocmXtRi+/g==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54fc0b cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=90z41mPHMHFWLCXoM8oA:9 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-GUID: xsryKaCRJnjuti9PIqFo01dCGw4jH2Q-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1NSBTYWx0ZWRfX6K4kBjKN2eIx
 zys/BL+J2T4dVMeUi+lmS3bQE2u8fHuU5aDgXjmhRLF+swchC8y+syI9jKIM58fzLKbV3GchNCM
 4ICuK+2qtYygzNdbApSQX4daZq8OCAA=
X-Proofpoint-ORIG-GUID: xsryKaCRJnjuti9PIqFo01dCGw4jH2Q-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155408_469200_E5B0F451 
X-CRM114-Status: GOOD (  14.05  )
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


