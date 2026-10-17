Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A504CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=; b=GedVMRGF25L68WgA7miqwtj/AY
	gTkyLZsVcDRcfiUjbPuh25sapBgPmjJv3VUc5QM4BuWkJgpDyD5GksWa9oAhIfP1GvAEFg6ME8JNr
	TRnZYsi2wcoMX9TgjMz98p2S8DO83OVbeqaLTBEz7oBhquFRW/OGHOb8BxFIMJ9QXoLkXm+vydL9n
	aHeL6JDzUjqAGSGGFaL3cNbluaFmIgbTNgq4MV6MotGeWPLmHjV0vp90bgl1XjCQlDUbQ6KhO4FE4
	Ap1bc44QwWBX+bjYk114vNg0RJI0co0o4dSnmG9ApIC/zCXZtnQoMwrAyHnHgEZpbdgzQYpduQqHB
	k4WqD1dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zH-00000004dOv-0Bxf;
	Sat, 17 Oct 2026 09:45:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zB-00000004dLd-45so
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:45:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6o1qw389388
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=; b=XJhtJmtcW9wyS2D8
	wluey3x0dO8JuICXbqhbYG4oCdepQjsu6hB4XndxdZzr9uj18X56jb/hi1xs3rM3
	0ypTyLj0083+4OJNwU/MX37RBzmNZV4sFgfLN21VU6kPqc8Vr4fm3WqNuvjV7NQv
	NZyTtPXjzNktZdjhP1xV+DdUNW5uFY4ow8KfvPfBQcxn/mClzLgbTlirtK52Ih7V
	K4XPNPmUhXGe4u0/htP1PtCApsqrLCEMJna8OZ/U6Kx4QkSX5qgMFTVLad3W5FlN
	l1Rwv5hpu9TntGMVbgQV35zxL8r8p72ENtTZZ4J+5bHc/cU7zLms43insmq0b2hu
	YUocbw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1838mjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:45:53 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1186628eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230353; x=1792835153; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=;
        b=TjMj13fq6LqAEn9uqmmp8NVd8YIj7shYjG/YgHjDkRobtYDHRGUDgYWP1SDdZRbaap
         Ns/tyDaur63CeaxTztHq9KVH+WvQr4OmZJRX1kMjNAcYzBFjp53lpHIQzT5Zftjl2CTy
         h9+Nu9NUq1pvNLZl7Obit9HV7hXluIv6p50/N8rLca/pQ8BtaDQXrTq0pMTdhib2w+r0
         4z9gY75l0qxMz0S4fqgirzFjSJhPJIVRirVvqH+WjVGG9vwSwnqgPG6NNzIL8bWLPsV5
         nFOnOuVlspjvxVPe3KhIc1xrVx8PrXXNo4EYVyYaCrIMtc0lnJwBVlYLV65dz9TzWnB5
         HZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230353; x=1792835153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5JsDfOM/FZljuyIYonxoFSWj6Bl/lINX9Srt6X9Eks=;
        b=SNKxw5VlsDEA2y09IaRJ4ORy9yCgBQzqH6w8LYwFecfm4Pc+6ZhCsyyl6tWOlF6vJc
         7KDOKzn2UalTpvihEZ+8l515OZoYc46Yix2qKwrsszAYzzUCANXw8GRMCEiT13OQ7cqt
         VbHLkCkFVYFudtuT05XkUDoy4CtjzE1iqWnn3sa2h+YR2FxLGi86Gs4N3J13f8lHZ4Gy
         1yvfN4MLcuET7+8sDtH+MnoErBNr/s6MR5pu5xqUN/5WXaIQZAewYbWa4HrUlTc5/cRE
         bVuKgmtmCINy+/Ap9+9bif3G3dNCI/RyvIM16JOqqPAc71YI/HiZsPZ8zDLl512efluM
         793A==
X-Forwarded-Encrypted: i=1; AKwUvBzNfQgvYKRvMgzoVISL+nSK3cT5mRrn94/5ShCNeNiwHQ4DK08Fk+8PZQ9Q51HwKKA046TVHfwRqe2j8zOZfnQs@lists.infradead.org
X-Gm-Message-State: AFq9FYLjl7TLxUlju5yc//tTE750X8A/qstbYkyTAEFi+cp6fvQiRi4f
	HhYGa/BMt0CA6wSildceKGQ2294p3PPPQge2S+zfHEFAWVfnqzqhKLAHq1INAL2Q79+eYMCx2AY
	GQfZuvfQ1QZxsUe1H2gL8UiyKK8cVg4fZIn2YzxiVbD67gmTnUSDbQW79gfYqp5rfcMrR5mNhJp
	AqLQ==
X-Gm-Gg: AYBFou2lbkRE5FM23qB0lrOM6GgPn/Kg/G91wzwUpNaBV8A7Sr+Qp/AmFddCdNxGolZ
	cqtSaelLG2vbNsylmTFU3S+qtdMvLdZkzEwTexHhi6QJ/i/PZq0jVGTdwRamKz0J4/y69JplWR6
	Mb5LljKONDZCcl2S+ELo5Drp9ktLy/xDzcultmfbI759xaJOTMfWgogwSbvk6u6s8ZIBRgRCK45
	63m8a0jt0DZSkz+cgMwm07nzrtJZkYYCAlvh0PdcNu6dsLU3sSjThO0hzFdhNmrKCtIklIKN8P5
	S1FJ+JbifuqHDGFtaqKwyhM/DqcupLzBjroH8YMUVBmxId/T85+7/tmZ8IwerNlKpztY1xBai4c
	8VE42mKJ4IimigVzbs8CbVpZ6aO6mxw==
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr3299718c88.42.1792230352667;
        Sat, 17 Oct 2026 02:45:52 -0700 (PDT)
X-Received: by 2002:a05:7022:ea47:20b0:143:2719:566e with SMTP id a92af1059eb24-18515a66a98mr3299673c88.42.1792230352015;
        Sat, 17 Oct 2026 02:45:52 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:45:51 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:13 +0530
Subject: [PATCH net-next v3 2/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-2-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=4186;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=7H1dQan4dtYXbkBmTtDxfLj4GbZbSaGELvYCjH5tXhs=;
 b=Nl8ymVl6J93gLBLMvJKMojOsdAWgSXv8yLIYcYzfWJuRm11xD4pZL9pkdLz2/iYRlOwWCptYV
 MA4l3Neu2TABWN7m0CtopijlW4CzxsG32zYUmwWQPHuy19ER29nM39W
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX2Bc66z9SyRAJ
 /xRfjb1XhsebfMji6+IQYkr0JbqW3GyLahhMCtOIs2A7zgdlP/Da617yvJQ2nkvfd+6n7bFGCdb
 9CnVRzlB4HvUgLG/TpASzUyh9C/ltQo=
X-Proofpoint-GUID: yiShvSde2UAZDyOrMiLXRd9x0LzlL1SB
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad343d1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iZY8vWlYZPOy4iMPn4IA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5JtsEJMFeH69
 67Z8hbrABEDVe0YW6QSxg6H7DVtIEspjGFyRovY+e3a530p+wCx6TDmUkyFAO8BkSbObShgLRlu
 lEPJqNhr7kaV1v1V3WxhfRi5wAbAvOScGH2xT0t8K5Ew6XE0nu1Kbrl5StWb5T5OpZx2lfkdBQR
 sWJPp/Me4f1mCGhWiZbtpxiZ/57YN5WWKC692ZlsNHJky0EVEdD7GjWufxQQLpkX3yOLdU3CWty
 X3PRed3oM5GsfNaBRN4HzTPbJHyjX3ijNL+hrjC2Xy7UINWOjMVza05Lu7/AsZPJiwaw+y7hVVr
 BAY290t6YKKAJZiG11RGKcmQyGOzm7XbUtmO4BxhltEAkuGe2omN58eu8JavzmT/Pikbx4xrEFa
 U7aXSBxf4/F7gsMtHXBm+AFZWsTCz8FumZv80bdEpzVLerKMnb3ieLHyBu9Q0PkUTiVjOtmxzuK
 Mk6ZtFk6RzjS8k+RkYg==
X-Proofpoint-ORIG-GUID: yiShvSde2UAZDyOrMiLXRd9x0LzlL1SB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_024554_710921_D89517B8 
X-CRM114-Status: GOOD (  13.13  )
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

Shikra's EMAC requires two additional clocks for NOC interconnect
access (axi-noc, pcie-tile-axi-noc) beyond the standard four, and an
OPP table with required-opps to vote VDD_CX to SVS when the NOC clocks
are enabled.

Add qcom,shikra-ethqos to the compatible enum and use an if/else
block to constrain Shikra to exactly six clocks and require
operating-points-v2, while leaving existing compatibles unchanged.

Add the relevant compatible to the binding document for snps,dwmac as
well.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 55 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..1167f11adbf30c234186a415004a75a774aa4492 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -14,9 +14,6 @@ description:
   dwmmac based Qualcomm ethernet devices which support Gigabit
   ethernet (version v2.3.0 and onwards).
 
-allOf:
-  - $ref: snps,dwmac.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -32,6 +29,7 @@ properties:
           - qcom,qcs404-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
+          - qcom,shikra-ethqos
           - qcom,sm8150-ethqos
 
   reg:
@@ -57,9 +55,11 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: stmmaceth
       - const: pclk
@@ -67,6 +67,8 @@ properties:
       - enum:
           - rgmii
           - phyaux
+      - const: axi-noc
+      - const: pcie-tile-axi-noc
 
   iommus:
     maxItems: 1
@@ -81,6 +83,11 @@ properties:
       - const: cpu-mac
       - const: mac-mem
 
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
   phys: true
 
   phy-names:
@@ -92,6 +99,46 @@ required:
   - clock-names
   - reg-names
 
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,shikra-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - const: rgmii
+            - const: axi-noc
+            - const: pcie-tile-axi-noc
+        operating-points-v2:
+          description: |
+            The OPP table specifies the rates for the NOC access
+            clocks in "stmmaceth", "axi-noc", "pcie-tile-axi-noc"
+            order.
+      required:
+        - operating-points-v2
+    else:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          items:
+            - const: stmmaceth
+            - const: pclk
+            - const: ptp_ref
+            - enum:
+                - rgmii
+                - phyaux
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 2218a492817fd3d864e0bc529b83fdcbb4ed023b..20b1da2f1096c94215902834a1ea014fb4ae44b2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -75,6 +75,7 @@ properties:
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -585,6 +586,7 @@ allOf:
                 - qcom,qcs404-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1


