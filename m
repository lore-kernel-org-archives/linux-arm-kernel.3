Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F81CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 07:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=; b=HPl7B5ngsM//rAb4F4mgulJh+f
	d4AvVwce3zA8zZIPYkYJhjO/zv8r3hZLik6wO51DwXnOBBf9TSbCMiMwj/rbIKPRRqcB1Vj169sQ/
	ydxbRPeXmPKnYossj9+qp7OVQXzAZlcEUCssVhCOoLt5Oy1pF9yrbn9b96++Rj+XM1IU2LZYtzyxT
	5ok3Y0N0S1+J5rBajn4Mt3mWddUahnkcTYnyynearD7CgXICt0VkGBqxeMyDxtiCL6PBO0rBDtPxw
	+id16HwFoAu8g8xAw0RaAPTJXcvh2klWX2m6xuotYgSrM48Y2OwHmn1Pr8gY/sLMaYLd3e9yVRHLV
	uKzTl9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPF4v-00000000XdV-1LAh;
	Tue, 19 May 2026 07:41:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPF4s-00000000Xco-445M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 07:41:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J1RYHF1146406
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKA
	zjC2X97Q=; b=L9yclq2KsTJFssy9xBXjxGmgSevx++Lfe3FTGOm1gtfRa9Ht2cY
	gRGTjyCVVAcY1hkH7scTOvR4OPkPz5LtQ3ibOnGVDEdUWvbTybs0NTEI8p4Udtvu
	/ybU+EqFPJjPXOZp5u77ibbSd1tVDNIVuPnzHrUDOGAYGpkWiCV2RQ5riqg1d6Mu
	6zwGPF2153Vnqf72MsW8GmnC4WZWJ68HaMEY/5wY57INNFwuhyz+mWefRb8QNQVN
	Gx7wY2B8pb+i0myu1tYkCgCqIjT8teNYivx+zO1S82JktFxQGDzwKBNPt9j+QorZ
	rCM4AX5IODk+HeJ8Sw2DTELRLDpC8h4dPUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8e7eh935-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:41:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so91187101cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 00:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779176481; x=1779781281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=ZUAYlC1Uv5AD6Cq6MUmeqD/iKz5jN+H2C2mtqwcRR0tt3wOhgsNRNOBvBjKtOvH5yZ
         XqA5RxLc9LvMdB39ginvcQZDo4TDhCh8w1L68ErlphiIZK7COrQwqRacWYeA6hOaO/Le
         xCnuR0U00WxgRitZz49B+MaZDn9IWNc5xSYrV5BAQOf0cDo/cG2aCiukE73KltFLJO+8
         e2IzLgZXECo21dplpvHWGqAffgKWzFpoXooGOVIavumkIL9diemoA/6m29/MmLgHGbKk
         HWeNGKi7ZERZxtPZBlrMgK+EdJwLa5uvOQ5yxGX/BoFINarXrWsETCuFEoHf/oyuCX4j
         jLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779176481; x=1779781281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J/OIJT7DRrHkarchUlhqWqh7n138q1ZhKAzjC2X97Q=;
        b=kqdo2ICO1JPNTVJSHBCdw7E339LEbkJBlvHPQaeJSP2dUlgqXFut77te9hRJNN5XTx
         pTRnLJG5txLkoQF8lPpkWR1bljowY2C/LpuOtNIDxhuHuvZxSulaLyOROpNSRw72TPv2
         fgx8iuRxQsSzDpQ3+houb8eoBSXFNetesrw5iv16SDIhCyyW6mKRpYYO67A3Hwjltt+b
         kXvI3s8q2neggArqgGlRiPqvN/Wh7ZtA5ZmFEJx3VDF3GnGp3NbzXjCMSsZkpcTsd1HV
         tABMb53wuHRaEOLUZOOyH3Hva7wJnhdn6tcHW/6XA8oV3jUEg4eBTFzHBlG+ZaF502jy
         tAVg==
X-Forwarded-Encrypted: i=1; AFNElJ+hGQeJ3ocBgdmp/uQEtEZ3H3vq41Gmkd8Wvy34cymRbTNvjpDjbUpGABKvGUNndvEoYL/2tqvrkh1j5pWrKVjW@lists.infradead.org
X-Gm-Message-State: AOJu0YwIjpDgdwVk5J5tZswEb/jUYrc7KogEM+EXe3AjkgijtJk5Kse8
	mZfKa7Y1RR9fuCuIFJH20Vz1Nh5SBZd9IOdZQzKspyiF1P3xZbepjNR20B05KxU2YHpW51o9pJI
	7gSD9+J/6yYCr2QnifgAkpTAC1xPbgOoBUfiJagQx8ETkSFq7Uu1ZN7LiYdAGW47ZRF9I/5ZJYa
	udnw==
X-Gm-Gg: Acq92OHHRey3imHiTQ/P04WyH8xAHlax6h1DZNVxoaix4AXHffO79DX0GmeOP9RuvAR
	uS7SrBzYtj/q7Y2T24cBmhb7GMnSXIPrK9LflsM3C53+cOi9ipXq4a+WVXpm6QNcbni9ImrZ6LI
	a8FUM9EQO4sapEZqcMw1RZfArCooyhrd/0oZUHD+kg/kMmtIS+5hsn44NeNV7UHD/wn5dy37iME
	vEicm0IGrt8XZH6o5UT+sANfZdVrhGAKjgDvEwH3ZkVGeF4vvTKPePZ1ZLJgmoaTYb4AfPfQP2/
	EEs29dWFT/ygxmo7tBxDk2XGIm7EMC+89KQfTw0LxB8Q1g5pIPxQzIbN0oYTRJwAo8/Qf4WwuvS
	1UfCFJKINKK+2c1lIvyjlzaARK6//4BlCYtBxKiIUu+llHF8=
X-Received: by 2002:ac8:5d45:0:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-5165a2112afmr266765351cf.40.1779176481246;
        Tue, 19 May 2026 00:41:21 -0700 (PDT)
X-Received: by 2002:ac8:5d45:0:b0:50e:a1ab:67e4 with SMTP id d75a77b69052e-5165a2112afmr266765081cf.40.1779176480807;
        Tue, 19 May 2026 00:41:20 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe2464sm44999231f8f.32.2026.05.19.00.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:41:20 -0700 (PDT)
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
Date: Tue, 19 May 2026 09:41:14 +0200
Message-ID: <20260519074113.61464-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3108; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=KZnHZBSLSMpB3NoM0qPWgRe3yVcNSNMcooAkdHqMozc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqDBQZmYb4h9fo1eUreNP62Frw+N5foIgep81TM
 ww/LLf+CfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagwUGQAKCRDBN2bmhouD
 17/xD/9SxWFwr0hMlyKbr2w5eld0df0vviii88YLL7IVd+nKEcNHKnBzbc2KsAeVLdJTupqLlwa
 X4FvnxFuKmcJoSIOjCcXyLPmiZ83vnRo49bqjv2qSGuQi+mItHaOuJSdQfZM6dBujW1J0kM0xql
 XJzxJsmEJJF48z0GG7lGMmkCzp7hCUhcNdf69m4b8AAu4M/OC54o+gpo5dCiBik54YEOn4SJa7z
 zyBcrxLnRIWtjQEy7U3/2TYuSZwI06XPNUfgwQOcOj4WG4FCF9SVsrdS0YjxGjtqLlWxfCrG/2O
 NHSqkebM6IhcKT5QUPxU6fA06YFEIIwX57SQo64KPXm3NnlWm9TeVyZAIfTxwMnbylZzPgHrffA
 iqaUGMCav+lv1JVFHeF55lC1Mr67fFT2YKasRWM+FayCSnz1f9IcizRxzCeKDb7jNQ1bLuxG5fL
 s2uLrXXV2cg6ljWZL/eYzuKN6WuqwfoqyaCPvNhCioWd6S0IgXg7SRoTrb/NKkkRDYXezqT5HTn
 dpSsA0zefRZWDSMs7RdeXiA7uwRq2HN128ij0HJytyK08/iG+ULsGlZH3mFCpUe0B0Q80HgxrAs
 JlnRuSPX3cCjEGiVCXb0OxFC8UT2YpUSUBYVHrTz6CT6l52owrDlwxmwkEd349Iyq+gZUz1wtQN toMWRpDVtxjKjgw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rt316imK c=1 sm=1 tr=0 ts=6a0c1422 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rJxAMVKw8lswYMJXinYA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: J38rjCgXV9--3OYZ5W7xqdPsKziNXE_c
X-Proofpoint-GUID: J38rjCgXV9--3OYZ5W7xqdPsKziNXE_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3NSBTYWx0ZWRfX9noVbQ4yg0Wt
 WEbxsTHsKCy480ptGs/b1zTk1ncQWgTBhN5QIRnDs4uBf1wnOC9C2ph3fiW3/VkoMTg+HOyIvfd
 ++snh9O9xWjT4s9benZ27Xtkry1jl11V2IEotfwePGnCbQ9mgz2+vI4GsRoexnJ2WmP83ICaxkb
 SwzOyuB2gZuwA/XOSQMSB//ZEeLFHiL8+Lwx0qUjzWP60nmvG8izWzjhnfu8vIAUUk/gjJXPKL1
 ziCyD6AUt0tZKRoXVTxsFTwBzv9mMQCR3onRmwp4OmNCquXoayCGiYUEksT9aeSdHBtkZ5QtfX5
 RKaE/GHRo6c4g381OslgowXPCUxIaIMOcfrVyj3PXVS5irV8KAPyl/lm3ZrcNF9hwCDVTFhjGwC
 WSxrRuVSOIhJAqkYcEi9Ru1j6rWBPsEw0LJipvFh/1Sgn+of4WceJtgwAu0LfWC3DmmAjzwONdc
 cCriNF3EIHwK+P4OO7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_004123_026014_0691A00A 
X-CRM114-Status: GOOD (  15.85  )
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


