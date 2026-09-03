Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E315AC624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=nbBwLDrWfJK6YHNhntipJ7gOzt
	0jcOD9v3kcFOy4s+qe/YC80tmBDpY2IlupO4Pe7KRRhd/6mfYyV5/Wi/GhBUzHcQyI9gqzcoMEMcd
	v7BvRhqQvhYvIIsnB8tLse4S99E6Ih2zD2LOnzCEMwwYqVJg8Pb586hpI3Jd8pkjhDL7X44WqtCwR
	nUEaH6dXo+2YMLdg4jihiaFKACR7IOTOHvrWajHWhiF6/vkLpF85lPZU6SD5HSUp11lbHJLqyZDOs
	tR8Jds4//vH+EscKboErDlj8QvWc5+E7bsamtn9l4q2Qw2RKfP9HUqQkJOGBPRNtGzwcv1BY4AlGE
	CC0MViwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZs-00000000OaC-20dl;
	Thu, 03 Sep 2026 18:54:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2CZq-00000000OYt-1zEs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 18:54:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3eqU820224
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 18:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=; b=E313RZY4M8xF9E10
	U6BrPtcvoIRnxtIOC+OX7G777UqJ1Y7bC/ZxTmQppLcTY0htJDiXZXhOyT8x+j5e
	/QE8/msIOVGDOq61VQ53RbZCzg6QaUFkwyGYwh9Q+5k6SP78UtbSxQU2FJj1bDMN
	SDM7OXjcrqyaxs2xFICbreLzaoFg0Qlwb4B4AJDkr4FXSKx02vMUqwIBXHmu1bcy
	wcSvnNHLvmavQn6VtFFthmarBQktRaygiQDW2BDhlfBXmOlj5NyfR8FUFQ0MY5hF
	LEP25+e1gbz/aCygEgEF/Wa/93yZsFvHX8Yj6nPYBhCX1DYhV3laHEVN+Y1UkxR3
	BSICgA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf82ka342-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 18:54:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso183612a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461660; x=1789066460; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=UhT/PSjobLEjwMn93EF99KBAvLhoE3TfeX0G0DMEy6zYch/WTy4PQKPGy/+mscZzGq
         6YVmMNe61aeDnxjJ90GEDIyDMWSelfSds+0nGVRMG/CVGkIo+F4KIksP1u94G1zIM/qf
         jtrIkGzDg84stB4zNpj6GnPinfVh6KDNDOp7rAV7r1RTDeR2HE+dnCHBDaoOWO231CUN
         GUlNbDYAeuq7S7JZ04ncdvBqr037PCwyhAxmK9ymXrX3mrntZjea84oMeJEUVguMBayT
         xjkDLbQSbaXNG9DA3TZSq+Lupsv+6Bmq7MLFVxuIB+c++rTjMuW4DuWB99fZFHvzDepk
         54Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461660; x=1789066460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIQdmFx4PDOd5O9ixmJ7nfhs+TOQEPZyJ9aGwi2TRlY=;
        b=UCHEBq5TiCyimJLOGZvgWyMPeTCvY8k7UwsBGYoDvrNcCMg8wZsiRPE92CJpY9gvTQ
         mg8jt6HecLH7UuIusaC2lKwyNyXB/IvzEhIziT70i5+tDIS3xSkrl6TsN+lsoFHI37P0
         fVW1srbRLFikkOj9C32jNe8vEdWA0J9bPUqyJqPckTaCEPKG4QPlhWfEZM90UKKstE23
         SuYVJgNNr7kBXGDFW4N0TK48RQCIn1RlBBtgcaUrK4yfDXWoU4HRvZC1fby2/A2krPLY
         V1K2AjmxaixoTWK45PLctmE/9bwEbDz6O5yda/g5rsB/ERoVPZOAILNF7Lc5XmjWBiVe
         eDuw==
X-Forwarded-Encrypted: i=1; AKwUvByF8KT+nzMbcOpF5794OPAMmnfzYCqIwHzjAuKm1vN+are2VbMVjaLrM5N8BCAqBclJ9ZSaPBTW6RtaSi/MYOQ4@lists.infradead.org
X-Gm-Message-State: AFuF++mrFK35zKko3D6y+Xj1xjihlDOHgPwgc9Oe1Ze8yqUaJKR+9Aql
	rGaqXKmcoUcYR2Tfl4bk8FZFKpNsEukXoRIclyVbqQXC8FOyXcRD8f9muSYE4uhFymrutBnt2Nm
	4oP9J5vBxtrii8V98XjqU+yalrv4YpZk5w16ONlEux5mmOGbDo4uD6Lz8Gfne1r4wAxTdowxcSA
	hR2g==
X-Gm-Gg: AYBFou1cuNYD6O5yEPFtp2X/oDpgqFMYqq2mRDyuju8VgLOAh5tCH6vh579IaYRW4at
	iIzqV9084EDz0d3QTqaZuo2Iepogexj0RvE+bR169vZoH8rhqWsezAW5+2zEF9cqd0zvOB1dedA
	d/XQnjlOUI2RTuj1PwLP1cLnsGzaDOI62vTElq7VTqkpA+y0XZcXPPLQ3I/i5G4veMH27vyrk1J
	GdNq9ii+MVo1+ixDPKu9FmG/K53BkqAsc0pmqb88QiST9HvcItTBDlBhCdyQTwICl8dASe78Loj
	ABKEmPAgScNZoufgWZGzGykEfY67rQNpkS3HOW/oqFYP6EwSVaV2x2hDV1UvC/EBPOitD0K84h1
	aDU3yiOym9jPwFnxtTDHxzdQGEeKtKw==
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr821287a91.4.1788461659979;
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3d89:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39b260d2ea8mr821208a91.4.1788461659491;
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:19 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:45 +0530
Subject: [PATCH net-next 3/9] dt-bindings: net: qcom,ethqos: add
 qcom,shikra-ethqos compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-3-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=3972;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=1tqS6Dvk6HqdQruGW7WjMOOIlEWgJQuXPAL9e/OSA7c=;
 b=uzzl30Innk14VtQSk9wQipDRrLbmYFSpW0vMYpn4cBqiZtNV4lHQqwUJ3zYEt9gFMIbtiq2Xc
 WtYNlxhoAu3Dui4ZaxT1Cs/tTxLtdD+4EBW3mDPTd6R8AqCrTDYCtsG
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: SakYnyb9qtLgQIWYe8TP5_8l2SIMU0C6
X-Proofpoint-ORIG-GUID: SakYnyb9qtLgQIWYe8TP5_8l2SIMU0C6
X-Authority-Analysis: v=2.4 cv=OuJ/DS/t c=1 sm=1 tr=0 ts=6a99c25d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DJPLBmofjJW9p3Fp6mMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX2cOMTUph9SIY
 d86Nc7vuSP7kx66ylQ1K3jDiiDWSbWHl9V1dtvwzzmqyUodAUhQMw/LOF1aRZf6qGEKFdYUR47L
 di/dYOuMMthBn1OHj7cv+7weG4p9VL8WCnN+BRnVdUh75ig0/i7Iwslw5rcj90GOwk4UXL7xW6y
 PtRyOPLkIQE/QMKqMp4FEAA1ufz2X/fjQAHMCdz3lwErHlSCnggy/Dp49ZBbwm5uDa1ZplYk9Mo
 7hy6YOy1nQ1o869ZGkkETambertSGxdtjzuP07PNZPVVntO5kiMqpTq4Ki/WznYWO6Lk94zzQrM
 0DQI5myxNshTtG+YcBBM8lGhEJWA8oAesP0ObSvGP4c79QYixvS8fMUj7TvFa5O1itJ1s4n9hkG
 KjaIBzbmEVnsRD4OV+gZ2FCqqbNU5MW4I9K++njSIEEdDzjNyjECmRTW4XyUhuBBNdRUZNkn6LR
 j/dYAse+FBotcpBSyiw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX+dyUD2esJ7Mn
 SX29DL9QEkzJwJ2FwBYca/LUnT46djY5habHJBaxwhPYTJBT7wlmxLY8obYfmrVjbEOtD0dVqfZ
 nJZQAvGavw3kNmZZP90fzMR9wY6kS1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_115422_634259_F15F6AB6 
X-CRM114-Status: GOOD (  14.30  )
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


