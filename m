Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EABEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=; b=17vf1F0+S3Cn+zP2WATC5VD+br
	6a0aARtiiO8apCV1TmBW2zwjU0sbQMCCyNwQRsT0EZPw9zRtvV8H0GU8dsegxE6BsloXfcPiSA2qZ
	nLu3lSEyEyNdb2XMBcnun9O3J43G3/LdqoMT0XUrBJxyGxSpPn8xYUsaOfqbJtACS2P+h18MmPK6s
	3fG5X6RgIgGL194neyNBJvuUfGIb9aH+ao6UsGDO6LKEwxUyyll8pqCZAiPtja5OCgFqMOzzHuW/k
	ha7q0NTRcZ8AevVV3eKu+RnHmTfaXh30cEUihuANTzvyCUIU14DN2TG40kqJsUA0+upAvoqNSzmQR
	1ubdsGZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmcu-0000000D7ua-3QCP;
	Mon, 06 Jul 2026 16:57:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmco-0000000D7sV-1t2g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:56:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF1Tb825622
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:56:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=; b=AmrSm8glcCZwplQ2
	kXIAQik2uvZ8/h3mi703MpqxLdCkgdpqj1ps0GSiQyIGlGTn0ILnu18URKd/cjRN
	WhQZDRhT2cVSrva2EAxPk2xZP81Agj+1fimUphBuOFAiKoQnp01kDhjrOK46meEw
	S4dcBYQUWmfSSaFR/m4dcpcv8XF2EnRsqSaG4utXvWnk4IlsBEEabnY91FaI61rJ
	qUzixP3cwI4PFsj5kjjunutZP/QojESs6+VU5mT+bfeQtciFL7utXbucj7TSXDPZ
	9n3eB0rgxHhTl+tF+I7xnbUrC69sNC9h0fQdsxDZGShXeEPU+OevA5uFf9R4QleN
	BuJ0Gg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t8aaf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:56:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c9d5a5b63c5so5028872a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357013; x=1783961813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=;
        b=adXYWUrxcJ97dEgQayakDEuL8SjYgJYJXfCIJop3lTA5UAnqpyWl0alWB3M25HiIEO
         KMPeR1cx4VZljySCv4p0QZtNE1Q9VzJ1YYeLZZ1UAjIKvWhwBnVg+WMixjGFCTAko1ms
         n9uhfv2DA7E5KqhS5+pF5mYYi2u/Y7Sx+SlzaWI3n3rrW8Ul+a/jctKPZ+tmk2eu4OCf
         QeulKdQR4svJx9AXHELkuxb5wkXiYp+7XQ6b0F2/nN+P1dCWDlms4Hg9Ikvo8CvL3Tdr
         JqB9NxWYJQyQh1g0jtQ9GWkxlQIO12Eydaz4awe5a1Cd+fQuzKAWBVSU8e9YEioqVTUy
         PL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357013; x=1783961813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZWfEfDHzBncv/pi9+AyhHfHT0HYBarl4vGu6Az/nXSM=;
        b=pnID+svgc1iTyBCbX6+U9ad+Ng4TmZMKJNhjhjB2kpU8ioe+IonKD1Rgq/R+wWlGo9
         FWxPKGSPR38zSABBpQ4aB3OfmXX7FflrGoeUGS2Ay+PxM9f4EOvziS51Gig7iuK/sFP1
         liVBC8ItDf+Lt/6iqmO7fsuV+sszjyh12D8OopeTUBKTzlxB/sE34Hvvb8rFW9/7OHrS
         UuF7a6HLgAFgEqfAtvf+BV/dCB9GGoWSRT0PLmwO1padAgbAbUF5ztJnDJiRB3MJShWm
         rEV/vgNsGJmsDk7fBmn2+Uo9PnOMAy57H4AZncrujx4XHE0+sr0xs/hzXOLd38JBnrGm
         r8Zw==
X-Gm-Message-State: AOJu0Yx9guJhrNMW6D+X4jkC90lJhd3WczvJ+pssZAVSVlNPJDNKXJsE
	60b2pqvrVi9Y/CLJDKRp9IyKX8oZ4N1bIszdjFCdL/9N5qiRg/0Ltjo/b3WWkr5HtOElJ3/q4Cb
	snhUDe3YYmr13pAxv9k4fcm0WwvFF7c6us2+eYhrL6IN8LbIAO0NymYFyGz7/ahVxlVB6az1DDt
	lh8A==
X-Gm-Gg: AfdE7cmaYRhW9I6pSmi0jPpRCFbz4QJKKGDOYjoIiQamrPsgeTxfzRCwhtf6TTScc3i
	SSPK/DA2bGIU6JhPpWd5OsPzlx95J7xio9J8AIu8Qc98VuleXtIl8Me4WwIlJh+58t75itmj/Gz
	24u3gHXIy3CJqcutdK2D7qP4mVkBStq4VrQUnbeggNqcdzv/f29PC8WHuLQkVtmZtXmXKUKo/4z
	abv4/eTk2sIv0LDg9fJnH7T6aNiUL0UtBVqHtaeoopMsipo9RcUBzXyNu7R6QmQu1wTVH2WhpHv
	ztMrz0laYt7oI5fB2SXdzNKnuuhNU2ZlungM8VDFZMjYfKYyq5G0pauhdNbVjvXbAWevfzAM0bx
	rATaALNc0LMuBHJbSV/DLIIG7tiU/9cbuCqGiMPUs/A==
X-Received: by 2002:a05:6a21:9206:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c08f00256bmr1778667637.59.1783357013398;
        Mon, 06 Jul 2026 09:56:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:9206:b0:3bf:6c08:4ec6 with SMTP id adf61e73a8af0-3c08f00256bmr1778641637.59.1783357012962;
        Mon, 06 Jul 2026 09:56:52 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:52 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:34 +0530
Subject: [PATCH v3 1/6] dt-bindings: iommu: arm,smmu: Document
 interconnects property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-1-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=1911;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=G2Cd/UHUeBLQN2fTTAlASpH57IU25h8iXlFD+D/JrHk=;
 b=E3aaeHiOrUd5FHK/d5Be0RRksYkwbu7lJwMG6vthS+PW3jji0kN6C6H0hq9Gx21ucOO1ddRs4
 U/2VitKxsIsDyjaUbkpDSupX0WqV+pJUrxlFbLlgxX6WmpHhkLtmKX0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX1qZ+hMiVo3Gc
 TY1bOgZzcLhBCOega4ff7bZzfcVcjNE20lZlfzCTgmWCpw7el4/lrptFlA5R1EtFBOVGHdGkklW
 uEXFdPY1b/f7UCk78+FZmAgghpGXC5g=
X-Proofpoint-GUID: dq8f3VLRIcuFWVacEMAyCe7EKcFwTp6g
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bde56 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=h2u_PYqE-o0iKWOXq5gA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: dq8f3VLRIcuFWVacEMAyCe7EKcFwTp6g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX5XYYVqyG0Rbt
 oJDYw/70cfnKjnB7PX+vnbCFnnhq9C+m3gjs9nM5jBQUe+WYsKKQXiIzghIaAI4zK10zz4nnTA2
 OzsbcrsTKNRsKXCKwmHeZPeHUXx/Ij4IECrpb1V3VH/uD5h3Myxk8NzlqGK73wrVCrTawLsmbQ2
 PXPmOnXf9UTgqzf6ZYvhtYwoEM+QFElZQ9hbjg5y73uAdkGx7WtBxkBFOeRdSCqK+GSbcbbi8PQ
 S8zODtQHBZU/7gnr3zx5pUQmJbSPGR67vet+DpCKFU18z3PyoZt5YHH19XPQx62lPGZ8YvyC2YO
 UIggKvYlXXHMK/HkCGZa4g9KOF1TRFDeRSfh6imQWOOfHyMEYIQ3nCYiTffWnsmTl2EZmWe3Y9F
 oz5nKPG6wivIeS5Np7f4Wl3f0HbNZgOaoXQdtL1Hy1MJqkW1j2Tk5o2lwBx0CvWqmENNB2nuyG0
 NYvpr5w2WW89C7bJpHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095657_649249_63D3819A 
X-CRM114-Status: GOOD (  15.68  )
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

Some SoC implementations require a bandwidth vote on an interconnect
path before the SMMU register space is accessible. Add the optional
'interconnects' property to the binding to allow platform DT nodes
to describe this path.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..fab8944d7b63 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -246,6 +246,13 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    maxItems: 1
+    description:
+      Interconnect path to the SMMU register space. Required on SoCs
+      where the SMMU registers are only accessible after a bandwidth
+      vote has been placed on the interconnect fabric.
+
   nvidia,memory-controller:
     description: |
       A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
@@ -644,6 +651,26 @@ allOf:
         clock-names: false
         clocks: false
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+                - qcom,qcs615-smmu-500
+                - qcom,qcs8300-smmu-500
+                - qcom,sa8775p-smmu-500
+                - qcom,sc7280-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        interconnects:
+          maxItems: 1
+    else:
+      properties:
+        interconnects: false
+
   - if:
       properties:
         compatible:

-- 
2.34.1


