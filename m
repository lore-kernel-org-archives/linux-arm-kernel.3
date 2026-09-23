Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F1C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=; b=LwL5hmqmPkY2AvKSmY3ewrlZmE
	pFgKkVVyhrIdHee8/ueCX09zyrB7LMjFgREgy/HTHLOD4n7kr5U0IG0WHWy8PfzrTVsR/QYK+ZNr0
	kQQySHd5MYceefUbUnW/Zy6io7rLDrkEkidk0jFcYZBX11e7OG3iHG9bpj0kxvyMQac5YzYIZtNKf
	4veL1A4Z0BDeVMKCf18DLPibLM6NsHQKRewzi48wAhTXgFMJKqxAzWOUhSJAIh2V0Ol6LQLYO7kMR
	jOREXmBIRAOOMIrOM1uP0Z0Xs6hEuQgwQyZBsIHqwRcDpCIFpwQlXwCTOjnubhK9nd4SrRkv6ynku
	K7dUShsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BTs-00000006pYP-113E;
	Wed, 23 Sep 2026 01:09:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BTp-00000006pWo-3vE0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:09:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI74T91509179
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=; b=haQFuzi1LBo6BuIa
	i9W3LQrr51X0ZbuVK2pQk/sqKknfeHMyzuVikBv+eFVJWmBGRXKeLXbAhs2Rebws
	F0Qxl9IzlCnRK5NxYphKagjkfhMwD814FfMRjJSCB+Pkk2yyxLUmjEjVnN65OZQO
	HvK01Kec7jBsfaLgedL9hk4pvmnbO1Gp/o+g73KmBuI/KF6J/B8SV3/a0qm7PJZN
	HtdiSo/GEC4msLvBhqk7l+ltnlTHVcQ3x9e7JSWScimDgVrUeoOL+1MwFT0T0pMx
	eWJxtNyR67IlnwxypnepC8/4Xg3HWhoovcSeFl8Rr6DoXgjw5H+BUSC/CH2khAAx
	Y2rT3A==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux7xsu7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:09:00 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-143580417b3so1319623c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125740; x=1790730540; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=;
        b=jgAszuf9aKO+RQn6MGxaUf/QVDAsXc+2s31lnHdgSLn1p9p24DPP3pcj6BLvVtKsNR
         Rl3/FI4Vf0RgXF1AN9ADHbWXnsvp6zyBOlmjPbz81K5FGJhDIybN6M96OdzIY0Kff+OK
         Ay+kJbnP+7lg9N83Rsh3+YAoa4PIgOWoH+0K1f9kk/TyrrOlkw7utyrele2JRMY3mZET
         pppMuQps7NAHlwj1FeMIz0hpdCoGikfWKOAkRKN9Qud8jkfnNddSjFmsyLA6Rl9uUZdq
         2hevM9SAarp8mg0O5fcFiwohW5olK8O9B6p/ZS2ehW4PHFE2XPilumH08jNkTvz5SBo2
         bigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125740; x=1790730540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBSU4sUpmq2QSmL7tgG7Il54FE/ySnXmTXvsaA9MtE8=;
        b=oUrT50swJKFh90P5c1aoHEHAtqxu18HPpALRwWEfpEu89DSjO55FUElSm97+z08XqR
         8Sd3V69U8WBHI624JFLAQrAa3bDzG3NQJD86rUC6qNrBwl89/dyf6mO685dcGO8L4lJY
         fV3+KEhUXZ9oTCVxLIJhRqnBx4Jk/lKRYfbYANDssoDOEGB8G97njJsFeeta+mtQMQuj
         FDD+797nZRuekwtaYTf0Gbpwjdahxg8A/zzg4ZCX6KYct7DBIWZcO6cJ14tRmTboK9+8
         Hm7ADHHrSzNw3c1n4JzuoDn5XS7obWEWtvYV0xFKCSdeeXZQCKPqX2GHbep/M3Dvyx5r
         Iw0A==
X-Forwarded-Encrypted: i=1; AKwUvByyF/NuWEHTJGKbgX+wL2pn+qr0MP2O2qxIn+7TVxskRT/HdUfETMZt9gnjT3KpaQzFXT8+Sh99AWVHkdwDZSvv@lists.infradead.org
X-Gm-Message-State: AFuF++mY8/NtZfyw8n7Lgn3UkWlCMK3UpxZ5T2DR+c8ROfsUqv7DP6xY
	F18SLSPzgrELk7g8I4f2LdqqA0jeIYsxBcuUiuSGw1Bm6icPWAqj00z7l1VLbXp4gCI6zTq53fq
	5uZ80XBnsayFiLtx6/3FJBPVlASn6jUhtIDpUaJ4ed63PYuNNFC5rpWy1IR8dElIADWEUYb76BK
	+dEw==
X-Gm-Gg: AYBFou3Bu+Fh75xjh7JYOV7ns6vziCzZzJBx7H8gKMfRQ8wqosnf5oTnpTYjqIKt1C5
	w/kxazSdqCiRIwHazQmhZZSqPnuP6NA6dNkT8YfFm8H+JQza6DG9pkSX1sPpZhYU3vsPE8+TTbc
	WIUkG9/6kpslYR2nuxAXxQmakEi7x+JDs3THg74yudwjjvpoV1cAxt3fbPWtJTjVbFQ2od7LOeM
	tZEUE01pmyiXT2Ab1H58Oiime2XOdVq3ksot2hEM3c6mDT67sfngKgoTj5/qeO+vzarEIgebutk
	YGcb2KFKmP//01NT8ZBGZhdZTqB3/y1UT6oYv8xjtGetFgrg3+hkqb+Q4G1guSz9klfQ0U1aVTb
	DxBWoj2KBVM+9/S7Uayetl++aMRZt
X-Received: by 2002:a05:7022:628c:b0:143:2e98:6755 with SMTP id a92af1059eb24-144f92e1d83mr1598724c88.30.1790125739872;
        Tue, 22 Sep 2026 18:08:59 -0700 (PDT)
X-Received: by 2002:a05:7022:628c:b0:143:2e98:6755 with SMTP id a92af1059eb24-144f92e1d83mr1598654c88.30.1790125739150;
        Tue, 22 Sep 2026 18:08:59 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:58 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:32 +0530
Subject: [PATCH RFC net-next 6/9] dt-bindings: net: qcom,ethqos: add
 Qualcomm Nord
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-6-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
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
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=3918;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=JmfcMUWRFg7uwuqJn/I+vT/M2s5OTkmkeDXfFHwZyUM=;
 b=bHura8egutoriSJuZ584QkRcA9ab9QGIBdhgfJq8hSxei7Foudo4HEg6ZMe0mWyWdyuhzGtRe
 dVv+cdsngD8ApJyNaSLnVTriGNN6AQ+gT2wP7jQZPVl9h38S2pmFW70
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: tMJCmBLR9FSllf1mnRG0d4E9Jvv66Vcy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX+0lfyIifmSUs
 UoiQs9rBr6ZvlywPWD2z0ZsfIpLHReOkg0Regrm5HoJm4TrsR6gy4/lfuugabtdDer43l1PWBt6
 0+Y73Ob9V7N4rKBpxVLRQbA+aZfAdcdW/k94EQAh2jA3N0D/akgdoSUoadz4iCTm4GD8YUUZQT6
 MrWmlc1UY5WBhNeu70CD3pSpkVQ3HAwHk1UC0YwH+bRPsNlpXCgTnGH8UkiZ3/aqM+PtgAmfTOU
 T4vb6mJ7Irf4opPnqfRSdc2/qgUzkN+nYisbywqKERZ1zmHvm3+FqEigmisybh14L5rxyaHshUH
 H+wGF1BUk7CnzFdsVoRf4rYbxz5fvh6h5XgjFUNPmDuXrmVPVEX4ekkeqQVC8a9eDR5JRIBu2Pk
 l0Hlm3i5d3t9kjlvlKF1gpocKNScnWJuZtYbK3fyejdFIoDZja/l8xFPJz8+asc66iRdLb4Crk8
 N4OOZH/nTuzqobIsbgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX/x+dym5xsxw9
 86bHs3JBuo7UI9NhdUZUs9plN2r2b0pJaosgFdvfK2s//oHXp2UFHqhi/PbXUf16r4u7HkOrxp7
 HwlOo4PjDsZjqdLPLBxhe7+wdD7sxs8=
X-Authority-Analysis: v=2.4 cv=QsDLTlyd c=1 sm=1 tr=0 ts=6ab326ac cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=S-kI9GOj7qxpsU4BLvsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: tMJCmBLR9FSllf1mnRG0d4E9Jvv66Vcy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_180902_103358_860767E9 
X-CRM114-Status: GOOD (  15.47  )
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

Qualcomm Nord integrates two ETHQOS controllers based on the Synopsys
DesignWare 25GMAC IP. Each controller has five clocks, one power domain
and ten SMMU stream mappings.

Due to a hardware quirk, PCS link-up depends on the EEE clock being
enabled.

Add the Nord compatible and describe its platform-specific resource
requirements. Also add Nord to the common DWMAC schema exceptions used
by Qualcomm ETHQOS platforms.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 57 +++++++++++++++++-----
 .../devicetree/bindings/net/snps,dwmac.yaml        |  2 +
 2 files changed, 48 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d945aa3e758a3c803d12bd61ec42b..41de2ccd56458ed20620905d5d3716b3d2568531 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -11,11 +11,33 @@ maintainers:
   - Konrad Dybcio <konradybcio@kernel.org>
 
 description:
-  dwmmac based Qualcomm ethernet devices which support Gigabit
-  ethernet (version v2.3.0 and onwards).
+  DWMAC and XGMAC based Qualcomm Ethernet devices supporting Gigabit and
+  multi-gigabit Ethernet.
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-ethqos
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 5
+        clock-names:
+          minItems: 5
+          maxItems: 5
+        iommus:
+          minItems: 10
+          maxItems: 10
+      required:
+        - power-domains
+    else:
+      properties:
+        iommus:
+          maxItems: 1
 
 properties:
   compatible:
@@ -30,6 +52,7 @@ properties:
           - const: qcom,sa8775p-ethqos
       - enum:
           - qcom,qcs404-ethqos
+          - qcom,nord-ethqos
           - qcom,sa8775p-ethqos
           - qcom,sc8280xp-ethqos
           - qcom,sm8150-ethqos
@@ -57,19 +80,31 @@ properties:
       - const: sfty
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: stmmaceth
-      - const: pclk
-      - const: ptp_ref
-      - enum:
-          - rgmii
-          - phyaux
+    oneOf:
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - const: phyaux
+          - const: eee
+            description: |
+              Due to a hardware quirk, PCS link-up depends on the EEE clock
+              being enabled.
+      - items:
+          - const: stmmaceth
+          - const: pclk
+          - const: ptp_ref
+          - enum:
+              - rgmii
+              - phyaux
 
   iommus:
-    maxItems: 1
+    minItems: 1
+    maxItems: 10
 
   dma-coherent: true
 
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 0ff9e3284a06124cb0a3ee62e2ea6d0b1f7f646d..e8c2911d9817cdf64e426a5a02d5f335a0fb8241 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -72,6 +72,7 @@ properties:
         - nuvoton,ma35d1-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,nord-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -631,6 +632,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,nord-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos

-- 
2.34.1


