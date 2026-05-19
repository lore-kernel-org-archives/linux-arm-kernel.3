Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E97CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=; b=oVHoRZ50BxGRR4CiXWTQs2sqsy
	TfVoTr7dsGWooYrsWOcLJmC0Td61AD4Gpgco6e5IyomINFZuZ7m+oj+9KPNajjfgkMJxlDRiUMrGx
	nV7uF+d+GmmI3ZVzvnQZDtF6bEjpmMIKwDJwp2qexf4n7+nHdS1kaV36Rwoi1xTEGOD44cx7GHVcC
	uWOPyDoeP19mJrx289haIp5K5qYTndUatwMlAz/7rEa+6tU0eLlbx7uVf2J0DMJ6lnhBLcYJAw61/
	ekhtlK56sTudkzJRQfBlFiCkMlGpu5SuJ16x5kgqaO2bCfzX6Dg1CHD9bGLbWRCg/MZVgjn8ePH7Z
	0hkL53Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPF4h-00000000Xad-0uYD;
	Tue, 19 May 2026 07:41:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPF4f-00000000XZu-0H0q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:41:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J2vAQF2091147
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKA
	zjC2X97Q=; b=e4UKvTanqgcy25VgTXVn0puqZEdnZmvvQ52JHzKFqz5F+e9mT5y
	PUaLRzqRcSTMQmjYOLJpykOw0CJMN3FWLYxQe59iMq5f57cHfYHyZUgxaIehKqv5
	MhhjSwNLLgwrvf8HDQ0ND6VQhEj+zuNHtnw+2OZtyZCRcPyS01c6z0DDWAhpiTx8
	URw+dp3qE7MwZ7OQnCIR5BR5V0NRpnDX1a2+i28OlusjFN9/fRqz9mrqSC5ax1LZ
	g+86JPzSXxC2FzOi/eqauV/FNLK9D1RAoD5SAk5+MbSO4embb8BiDQ+9qgykSOWb
	Gv8uqOmuqDqblxsqGyvShnWbgthuzBdto6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpmctj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:41:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d890580e1so74366291cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779176467; x=1779781267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=X2XBS5o2E9ATYcagOyHUTLQ4f4sdnNjqGC6OOqsaAB1YOkIs17KnZn50LCDpSX2Ao3
         wHSCFJGNO1yoYplbs2lsVHp9m7HT1tLSI3CU4uQtWa4BdDh72P3lNGUoSDUc3m7NTssx
         PGdpqfQfSP2oKSScPGKXy9jfMZV+43B/hM/G0vTg/6hMFBQWEt64nAoDm/YNdjUDMHLb
         Q303O/w2R5XkTA0xEcx2u0rzbsGQjyfrziL8Yb2Bgy/DqbZ4wq1rqDlWVts7R3cPyZfg
         29WSaH2EUuaNXAakSJQ76kPulTBiV+SIsCSPq81YNZvFXwoZ8O/1+OTRDqRgg7OKvLQ9
         Fpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176467; x=1779781267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=rWm5vTRQSxPOcfX2rCWb3/EulolkyKybQFgextrLQOHzpPF9CKBCEgK8/JTs4tl2rB
         CngZ2aU1r1xV02WvaLQtFQe02ubn59itrlqo37/1hfJLn2kBkMCbQHr9MM+TGdp8Htb8
         4lB7fMChdZzFezbWeXAc04Qmyl2wyerOFQBqq1Jv/aenSqne95+ykd1PNiQcNFPJYFhL
         foCdXSL5qvMv1+uiHQxt1C+u/kNE6Qun9aBVpZbiy3nWCEU78K/PpFV8O6kaFuFuceSe
         A9cB0MQ+P8uT+CyYp9icn4ZheC8bZSWBnqdcvV2PgkH6Mc1YXLT9A8MMoqv1oO6kEau6
         sJzw==
X-Forwarded-Encrypted: i=1; AFNElJ/vEAnFGVeyIYKRdBk44Nr6CRkfXBgxIQHpceDpOrxlqKvAGQjMktle6qKK6/stKfTxKbPBfTAhvcblB3HFZC58@lists.infradead.org
X-Gm-Message-State: AOJu0YyKolXDhlgq45wpo8MRIhEWJ9EoRF7z1dZsZM2gTcBWMqDZkOAE
	yBJEyS9Ac1ssL8qGeBUi2w8mY+WMMkqrAD4r10+13UMbov0KAYH7LJYJ7F4+VIrqz0TwCQkPx+F
	hRBKr/8wLbs60L5H7r9FI6cqB1fZ1R52NEaMXn2MhXcEkI9HyUP2E9xZhVaZTuY4h/nVctWPr1M
	LLjg==
X-Gm-Gg: Acq92OGVrb3w4RGNFqBzqi8sHi10QSzodjsuJBjxeK7/UGUS6XYVygpWv5voJFNLFUN
	APGH8iWPvmp6KI1uwQyb8/Knyqoo8ofxiTDP6KgG3QaI2hKoWCzayrqd/oCxHJyiH+0t9UYyxxz
	klgSoSw4VHiJDzSfE/nQjJeS7Ubdvz7/jx5caIbbuJNzr2CV088VigpwLgoaJGlMYV+k6lFcxfs
	rLhGg8tgtRoHdsH0UDzVDPCusGBrBC2oK5Zc5lPdVrHHvfTIugQ1X0srzxJaYhDvD9pKKJ1xX8l
	smG4LOCD2PbRn6lu5vVoX7kJB8cR3SIkjEn0T1zaNo4VtfcTegq7DvHDhsFNfiAUit4M4C2P+Zh
	zt6crO6g8XUlrAvxqlHqsh85q3qaB/YJ5rfTs
X-Received: by 2002:a05:622a:430d:b0:510:41b3:f1f9 with SMTP id d75a77b69052e-5165a1eb755mr196313921cf.38.1779176467160;
        Tue, 19 May 2026 00:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:430d:b0:510:41b3:f1f9 with SMTP id d75a77b69052e-5165a1eb755mr196313741cf.38.1779176466693;
        Tue, 19 May 2026 00:41:06 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe1a41sm47266843f8f.31.2026.05.19.00.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:41:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
Date: Tue, 19 May 2026 09:41:00 +0200
Message-ID: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KZnHZBSLSMpB3NoM0qPWgRe3yVcNSNMcooAkdHqMozc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDBQLmYb4h9fo1eUreNP62Frw+N5foIgep81TM
 ww/LLf+CfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagwUCwAKCRDBN2bmhouD
 15MnD/99fRBVxOlQj+DbCgE5EWma0FpIsoLv2jCf2Wt6MLsSbcfMVVGCxpjclQ8XHq65xE+2V4+
 nxfBf1u7I7Eu+c7Xgny1Q8BQ5UgRVVsjnN2ay5Wz/UadlmJq80pZfsRFhvKUcAFs+al7eDV9u3g
 T47SBuOLeL0x15kymqK9FyjvFgBRdXW9af4LwTGs397Rzp2XdjzIu8Tdym2A9dsJS6D83OUFz1M
 +SftOtopi+8INf/jxmKuTfm7wXG2KW2JtiREdhtTViPxcBvypkp4FdA5ozVUefLFvOdVbYD4Iyo
 8Hx9KhhMxeES3kk44rcWAZtUfHIAnkBkpp1ckqe7ghVAutuesu4WbB4/qO8t+KNXR/bQG1EOVRt
 bzCk7hcUwSARgxy8Pma7gl3638Y3+gV0Ze36ypjrUAhBJFgLN8VWw2meQmnj4CKUY4wKjf+VwY9
 pXcNiSGd9hQBotrd/GwQnMador+1BmopQuY3J2YpsinsSiWEe83o2HYHVZl7bZ3UOhZmsJAgOO0
 HzoRL1ZvubwzOaxxs80ZrPPUre7gS3Zu/ATdVqApZWbmfLKiomQFx2m4YaDddXCwl2OJUP74JT1
 qdjMK2muxcci2I+AfXHxY1viB0WkZ+beyXjcPCgZl10ciEBwOyc/jqRQBxwKzRBB6ZL4e1siicE 4vZLHF/YSXXUtvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: IFRK3KdbK6dKiS_lWoFCBhcZWSgMAA7L
X-Proofpoint-ORIG-GUID: IFRK3KdbK6dKiS_lWoFCBhcZWSgMAA7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MyBTYWx0ZWRfXy4aiqYiP1oCK
 xXMDLRdoKStLzMIcOhmfrH/jfAlI4ag9quUtpfBL9dJEK6UgVYkZAsTzh8J8XulZrU6OhRwIv9O
 0GZp+ASujI3xLwkq3pTX4bLPfsltrqV6+WnPtwkt1RweBnOnZnhnLyzyXNLhwpeL9Gy8adtZvkG
 qO6gYlqW5wYtseyz0TINmNsnzhYEVBY4PA8nW8luRr/79WKo5n2BINbw4SBKDjs8RBJNkM6VwoZ
 LWrxJOi2FNlpfnIr7/sXDBLkgVJXRSfZYEx/WR4tcO9xZGp7QkvIHVh0VToSGcgur1VEggIIIbj
 2oFV9SoOHPN+afwPqCtR0KlxaTv2Lm5/FMxBB+6GNSWVYqg7n974jfB1VEsTuiimFY9JBfs5Cce
 /9uL/mcNOQSNzVQma7QUPRyDH49SrOmkTD8raE+cQTaWAhf1y7/UceTl+7Q71CEQGZKD8uc4tAh
 xxC0YUUtiwQtWQwfyDw==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c1413 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rJxAMVKw8lswYMJXinYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_004109_220359_6AC4B066 
X-CRM114-Status: GOOD (  15.65  )
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

Many of SMMU on Qualcomm SoCs come in two flavors using the same front
compatible but a bit different fallback:

1. For application processor, usually without any controllable
   clocks,

2. For the Adreno GPU, with some controllable clock(s) and using
   additionally qcom,adreno-smmu fallback compatible.

Add missing constraints for Glymur SMMU on Adreno GPU and several other
Qualcomm SMMUs for application processors, to restrict the clocks
property to a specific length.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Tags
2. Fix grammar in commit msg
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..ed0d10157bd6 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -566,7 +566,9 @@ allOf:
       properties:
         compatible:
           items:
-            - const: qcom,sm8750-smmu-500
+            - enum:
+                - qcom,glymur-smmu-500
+                - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
             - const: arm,mmu-500
@@ -595,6 +597,7 @@ allOf:
               - qcom,sdm845-smmu-500
               - qcom,sdx55-smmu-500
               - qcom,sdx65-smmu-500
+              - qcom,sdx75-smmu-500
               - qcom,sm6350-smmu-500
               - qcom,sm6375-smmu-500
     then:
@@ -602,6 +605,39 @@ allOf:
         clock-names: false
         clocks: false
 
+  # Disallow clocks for all other platforms where specific compatible is used
+  # with different fallbacks and only one combination has no clocks
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,eliza-smmu-500
+                - qcom,glymur-smmu-500
+                - qcom,kaanapali-smmu-500
+                - qcom,milos-smmu-500
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sm6115-smmu-500
+                - qcom,sm6125-smmu-500
+                - qcom,sm6350-smmu-500
+                - qcom,sm6375-smmu-500
+                - qcom,sm8150-smmu-500
+                - qcom,sm8250-smmu-500
+                - qcom,sm8350-smmu-500
+                - qcom,sm8450-smmu-500
+                - qcom,sm8550-smmu-500
+                - qcom,sm8650-smmu-500
+                - qcom,sm8750-smmu-500
+                - qcom,x1e80100-smmu-500
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        clock-names: false
+        clocks: false
+
   - if:
       properties:
         compatible:
-- 
2.51.0


