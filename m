Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49454C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=H5QnRbccVIBdKpzs3WhSstR0mm
	JPemzHCGNDgmYm4+n5yRZCpVII/lDmIXEH+BhVAqGDD89zlLH0/HqUGE7yvKvyBXFct4ON4nxuDVB
	oxdpSBbWtIFLVwXK9HVjT78i7uZ59yPjnkR6VrvK2I1r3EIOoHSFuVWpKUxN41c+pRsIYNFDVb2TV
	OqZ4AWjKWSXlrgHQPgl4ae1bHSZ8oI33EQUiEQG1Zqtt025bBCiTXLqCqdNLTiQ/mJEsEPq5r4r6P
	3Es7PPKIVa0QSuwxiW0IK8gYaBTCEbZym5GUtRwqlj8Hkd3G8YQ+pAdWsOeLtXkq++zPoltxkUnSJ
	Nl2lydHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ft0-00000007h7u-3CAb;
	Mon, 07 Sep 2026 20:24:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3fsy-00000007h6q-2Iiz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 20:24:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687H9eVa4065039
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 20:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=ly8bzrqQLmKCfTbk
	Dgegf9qo1/QceiD70j29Iro/J0WLlveKFwBBuAHrPaUkrs/qS4/cWBw2RsOzkZ5V
	vBpPYorrbAJe8yLF/6x8Czso1h2DkzgxkgoAaEt/mrIOwrW4iKSAuXNTi3Fg8U8V
	qEjMSYrUlgnNFYgOIrBBNzEjh8JF3jhfJ563iRCbirj4F+5AmqTjLmmlqp4jn+mw
	zduDJUZufrm1BFlD+PYz1M3orc2+DYiFyF005X0kfDmUUTrl/af4GLpJjisdSzYJ
	xM8KfmiGeBe4tQG6dkXVOx20PkPrSRW4l6osrnSXCaEnu8fhVvrDlSOFgmBfwc2p
	ZfBWUg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj077gsms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 20:24:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1792470a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 13:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788812650; x=1789417450; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=b6siTAPVe3cRlMmyE7ZygHakkt4si3BoUiItjbKJAKJpVurlINIumM179i1QGjT3aD
         aJRLiEzN2oDPSfnDMvf8bjGh2/dvq66f6uOpWIpKl3yZ3jDZDj5zn7K1DVX9InNMIEg0
         tvLI5z2/J8+bieBhxagHZFhMKi+d02yBZypE7XkSiCY+qU9BLgYoGC8zDuLRt9/vpg6o
         0KwQnF9Z0+G74KXat3jt0tbw0Gm8reMSHNF22pjkcalWrHRrMSfxDp2ihqmeZpMlQS0h
         3GDW0WnDv/nvs3X3tzg4TfWzV6PklhJox0RJjyRNVe4gW+rKW52wkQboMeKGB3DtBvD/
         Xz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812650; x=1789417450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=h22fiDiylEWuZ5YFH29dJHnC5aX4j3Ip+HKXdjSHJxBfRFQKBdNlb8dO5Rv9qbihIH
         MXhbiXUVBRd+zkVfHcNcekvjMsmttJ4+lZFIb4giavs53SB24dYI3YWUkYomMGnXYQXf
         VlVnrf/ybNUgy4ogOE9SggEI69WsEQXY81bafXFBreidUSgPZVMXZIsmNX7I5G5tx0F6
         hmLV3N4YB2UCcAL5iefaMIcSqofl49iVnVGdpZgkn4m8gDs/8d7esyis6D9KbCo8o6ko
         8wy41sZBsYiC+UGlexeh2DLcGmg9A4GiJ9Svo6mU8ax6KuaAs7B9drsbpAy9tf72LF8X
         WG+Q==
X-Forwarded-Encrypted: i=1; AKwUvBymSHRINwsQ4z9VTvPQYhVKMKfsCORCO4MIddrqGSdWN4kqklpawAY2U/C9pwuoh5a2daBWyQUYrYXX+iVnY+pH@lists.infradead.org
X-Gm-Message-State: AFuF++m5PZ0ndftesG0/cH/G0tPRv0xoIvdi7S7/nSHDKb4pRF9blAzQ
	u5qYcCcgBPzN+dIf0xi5evfpeqQet9v3MENNA9YAx5WrBbjH8uPHJYT0whEk5yisNXZMCavTxrG
	PAZSKyZvuhofsCNpG7asXAhqkATE7NCgJpv0+tbH/igMQQ60/TR+32vL+ReOVXtUN1So60gKxIc
	4qPsVHZNEpBQ==
X-Gm-Gg: AYBFou2XfdE/PJ9mWpjrb8YfiUGMJYtu0x6p1vv9scsZYUVi8PQZ0l3nE4nZ1Iywq2q
	nyRsBbFo81bJVjYGlXvAPNyIqtvS+4qiI92UgF/I6r5cjgelaeBOkCwFgE5nnr0D7blxbQyudKN
	CZvzbies9pR8W+Z2zn/K3PTJMWLsKtiZeHzIFZPvmotwmhNNlDoYscyDllsCXXDtB1SV37/dISt
	RyvFVavZQNJOF/Uny/S2blAgMmiE3CSSdadK/88PaV+n0gNqpePkMWgCtqSrmk9wr/cpON+z6DM
	zY3fCwR7TZKn/u0hQMYbz5HmRzoaSLdWbDF0n63rRyli8SQNLbmk6Xcz2QLMIcZu7oNNHZWJIK9
	usG2QEYvJcLlwkTe8TaNrRdRrS/9DHg==
X-Received: by 2002:a05:6a20:1441:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3da39cffff0mr39040592637.3.1788812650419;
        Mon, 07 Sep 2026 13:24:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:1441:b0:3c3:9070:96b3 with SMTP id adf61e73a8af0-3da39cffff0mr39040530637.3.1788812649993;
        Mon, 07 Sep 2026 13:24:09 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm30482259eec.19.2026.09.07.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:24:09 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 01:53:15 +0530
Subject: [PATCH net-next v2 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet-v2-3-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788812616; l=3972;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
 b=CrUJsHdZ6c2FYOwXEPMoV00IX+6Ep99Hv0mU9sSCTtavP+7P0xPU00RHkfInYorGHLTw+7fko
 6sEW89emChQDJtjxcn+QfkPpX09AxlVlDL6j/LdQlY8piS4N+gGFkCq
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX+KceJ4bhUgJE
 zj7F77Ww0QENEdVRwc2qptp117qAW0AU9CrJOMAHC5Z+hx5MEE5f1YEYGyoPF/SCFuguXJAwNl8
 dIVQzOty4cz9p3spEZEvw+2rSRixyhbrByZ8S/kx/dEOVdI+3nDtTof8Ecs/S7W94Io36iuFCc2
 NQ6cM0iYgatsmjrik5SFMRAh3YpUrhIujck2DkK9OwCHFxD9d6JtWYnluHgmlvQ18vjQIFF5FAy
 vnILfeXPXB81gZnrb2/Nf+mF643L+rDMEU1/BvpGUFluMtY2JKZsAtbiL9EkjouW9B5akDDb88t
 P+NTXCJN81RV4bxScjtV3ltnD3/86dU2AYoeeTrNwyRBg3yiITBtQ2jtmynT6lnLIIpL59mcGmM
 opiMJAJIPILKWRUeT7NtpLMXJERcsQKyDpW8ON4Z+dDSrbyoSs2HGcnopvoE8Rrq+8ZSoJv+rTC
 5lsTNAyAXJyliHX/d1Q==
X-Authority-Analysis: v=2.4 cv=Xbe5Co55 c=1 sm=1 tr=0 ts=6a9f1d6b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DJPLBmofjJW9p3Fp6mMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: XnDNyPbj5r0y96NVsL_bH54ISQm9vL3j
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDIyNCBTYWx0ZWRfX7GztUHVIGXYa
 R1lXQ/rBKggw0pHEN2BPNumGWMdQoy9vTdQOI9jX9bma/I07j5RnYvXI7w8KSAmNIDR71c4sZpX
 eUxW8d0wKAEEOc8EM0mOBgWoUe8qMG0=
X-Proofpoint-GUID: XnDNyPbj5r0y96NVsL_bH54ISQm9vL3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_132412_710544_4919C4AF 
X-CRM114-Status: GOOD (  14.70  )
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
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 50 ++++++++++++++++++++--
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..ad2cc706fa74041486cd90c3d0eb1dde0acaa27c 100644
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
@@ -92,6 +99,41 @@ required:
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
index 2449311c6d28ed3fbf8c92526ce8b872900653f4..6a1aea371c0b42ef71f90d89276e15159c3b3277 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -74,6 +74,7 @@ properties:
         - qcom,qcs404-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
+        - qcom,shikra-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
         - renesas,r9a08g046-gbeth
@@ -632,6 +633,7 @@ allOf:
                 - qcom,qcs404-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
+                - qcom,shikra-ethqos
                 - qcom,sm8150-ethqos
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a

-- 
2.34.1


