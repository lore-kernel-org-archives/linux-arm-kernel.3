Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36164CD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+jgtwl5zYo=; b=X6aZAWP1c16s3b6CYnpBP6JyaP
	XJNBhb9f10o7L9D8N3BHRZH704Xz6F0mgC+mskYn22wtApGYlIepNb0Gi2YcLCYjOtoHNlAp6xPGV
	UY9rcn8Xb4vnq6uhHk0Iw5JKZ5BPSs2QDw5N5+2r4EJBPzPjPdRVJhuDhIB1OSy6PMFBSFfQnl50H
	n1EWjo3M0PZwy+MwwRCmwbVyMbTJ4WcTHuT5hPuM9sVX27pwNTq5W6hu3z3+VWgQFhL0tDT81Dgdy
	xiQFc7pNudq5V0VPu5Fgt03XoDQ6Eq2ugWQcg0CdnacbGRjBsoupNmKnx3fdp+iNV+RYmwP8BbPDd
	kR5UuPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9zz-0000000FNi5-0WFI;
	Tue, 05 May 2026 07:15:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK9zw-0000000FNgY-0hR4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 07:15:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64574Pe93467704
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 07:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+j
	gtwl5zYo=; b=INtSzHHb+MXnQ8S3/6AXKi6M8NPaz/Zc5XdjEKBWk76TpkwegUS
	4m9cqzIIKCCusmGh5JnfsO8bYo65WAUhlBFVfrNavDGOt6RU3/AaMPwOnbRy/0PN
	VoFcTsaivs1hgX7vcfljo+KSU5polX/2kGyS06UBe4/2mXdWXtVlKNd1ej+Me1ie
	M2c/9pfziXaSPnZ0Eh8Rkf7o9EzHazq8nmeYHzPghwcGtdESzZW54p+U+9zBKUZX
	Jb/gNTv5om2BHY393hjQ+iGEOtbW9COUn7Tlwor+QWAHEHQ9ox3ebzOkyvuIUj/O
	5cT9lbn2fOqipW9KwLVugA9F6Gzcm2AtLQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtju7u8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 07:15:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so18770921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 00:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777965314; x=1778570114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+jgtwl5zYo=;
        b=kHf+ecc4tLvvGOqM13eI13fXYgZq2mc8Mi8RJ2gvD+pTdW8FjP1v0rWM5RflxlQNnN
         kT5uW7eCuVIqhkDkrXnXU6Ex32UL4gHo+SP5GfccApsgORfh1yT6WWxq3pIWV3xpeOt+
         8L9Av2lGxGNKRM6BuZ8N2nQEgXGoTU7Gcvwprha9hLvhg3hppnuDrdIQ47WzwxRSp0if
         Fp5QmoLC6HqWRBjwjvsebaGH4VDtzRF0VpPAgcOrUlRuggm8oPZJBF74gY6ixL0Nnru7
         QKKWqPuzE/9fF020kN+TnciuAxcjIP78mvE+ZF++7NaOowOxKjFyETYHDsEHMyxsRTW2
         9zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965314; x=1778570114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GNzLk/F53WBl/rRiE34Stecm2fn5k1JBi+jgtwl5zYo=;
        b=d9+oNLnV+xkrl87+gfmPxMDC1tWreZoX6D+CSt5GmwgvDYKVh5TmjdB07crQ0cDva0
         jeUTdEAi0UO7Am28sVEO/H5OQZBHh6lE6IOX4SVisUtFzOla4LW32/Yp77q2yb/kXKJk
         LOVVYi1PtB5jeIXQoxx1eyPO7pNoB00rQzBarstHhtn03BzDdr5xMfK1rpocAVE6MUnQ
         6tkaWN77cynTwh/Sjx9VAsdRprX79igIjGFFEbUOXrPgCriakI2EfSiA4BdY5h7Vt46I
         W7w2SI3yy8rJ5+UaSkiphKkic4JA90AC0nVEOJ/oFrFGHRUR4pL48zcgidAtRZvcoHmE
         nr6g==
X-Forwarded-Encrypted: i=1; AFNElJ9mxx6cX4ZrZ46kOzRhYxmE6+WN0zk31sghEEUNoKlWO/bSDmcyrCi0xWIXoB8TXVWU/TqEidTiMzHyRZ4W+X6q@lists.infradead.org
X-Gm-Message-State: AOJu0YwcLkf/pc1Sfu8qvG8k46mY1sxOhKhJb72CLAHdiyQ9jmhCchiw
	am1L9oqwvZPF2wswfANWoG94Ad9uMq6pFk/fO3W/DteuNLNib6B1QswoSE8gAWnPzcVX3VqLtgl
	iuXfPdJhH/TE7p1Y83FlfPqvN6wMIaIWFSLu+Qjp2F5tv+4H/ZyyJU2SslWI3DSdZjue9Z+Rke2
	0eaQ==
X-Gm-Gg: AeBDievCl82rOmqocnXOXkhXFkjUy4Ims/a/654S/9TDDQBnUvVp8k6hkZrEz1EGqa0
	GT0hePsGZs8EUbEIzdvIz4AY4msOobcYWKs95t/xEk6gthx9JMmCq+pnri2bz82QHVVTGFelE0s
	1+LCqmm0nSxayT5pqMOAlFEbOoWOo9O5JmPS+mjDp7nOPsGcX1pi17wwOxDcLpiI1i51fXDOysd
	D1lhZ8h7snOwau9Md9PkQpzMyGto5A5VY8rgZLRQBAbBUlRyosft4jVRMyUUkOeGq4N5wp+OEoz
	YNwZf07QnRuVT+XwaQ3uu2lkoa6K/xi51NznAZ7RXftIaEjUV3RjerA8PrgDRy3gkTgry1NIaMr
	eD7SLaS1nIo+vD8iUWt9YI4RZWgeGb9B40vbnnc9apmNI0ho=
X-Received: by 2002:a05:622a:558a:b0:50d:86cb:db75 with SMTP id d75a77b69052e-5130695bafdmr28103651cf.7.1777965314054;
        Tue, 05 May 2026 00:15:14 -0700 (PDT)
X-Received: by 2002:a05:622a:558a:b0:50d:86cb:db75 with SMTP id d75a77b69052e-5130695bafdmr28102171cf.7.1777965313243;
        Tue, 05 May 2026 00:15:13 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02f76sm2210535f8f.23.2026.05.05.00.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
Date: Tue,  5 May 2026 09:14:54 +0200
Message-ID: <20260505071453.34000-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2935; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=u62PmuJsFC53eibE16AfNNhsuEadr/Bcjjx+Id9tJAg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+Zjt0XAduVeRYEa/7OpETJeNBP8D6y9vWNM/T
 +QqfyGIYXyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafmY7QAKCRDBN2bmhouD
 10jgD/9J01XMkz+LeeUYM1W3mC4zKGc7dGAm/Bx2FVH5akQYlMgkbIEpVS3Ogc5mjsITedSD/j5
 fAubOMCzqSwc2ruOoFZ91lpk1n8GmKMP/6bxoN6BhW6we+pL2Vm+xGMv5vALlYN068vZDIdbjpo
 pBvCrzDFA4w4WR9LwXdRLcl+cfQS1+QO9M2mj9GTQ4g28e8xeeQ7KblUvrJzNd31BdijCzqZ+XD
 MVsWQopo4t14DN6sJ9w7lcvcrTHVvmI7X1y8yHacfBZL1g/Fsh/FCTXuK7nx0m8/G5HUM0F9Ug+
 FqtZ2v7FUmMXdjofB4Z1rDwkaOCPB4nkfrmpJ2lX500HpfVpoZ329gHBTM/jI3VnhHoVJztJijI
 NxRm6vahaM96AZNQigFNbW9OvDZdMIkrnGvS6T0JVNSyZjBiOvLV4LdM7Vh6s8XKS4KFDVWWZAD
 0doyi+nw+f0zPC+InA9rAh1mfzqE4iHeRORws3iql3WRXhpE5GVFxEnu7GT+NAlMz2/w93oVVR/
 3gWD2YdHd5d3VBGARjGq/9QZVtbUIRH9CsWC26wqoNhwDrqXV3OohztPNRjGe0gXGdwBgs1HPhM
 /+yl6YtY17BKRzCWqex282CV4nnU9aiZBkHojfXwT7A0a9eS76vUZz1/GeEq3oWmoLkL3NdHVAh RX79Aam2Vbn40zA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: lXgnlKFIxTwATa7S1Uyj5O43mkpAyVU9
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f99903 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=f71n7wxJgtiWRlcSn5MA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA2NSBTYWx0ZWRfXzEVTQiOalKTa
 V2JUz9w21zP29sLw1YvAgsFRFKSySWRxQZ5JpTM2sNpmYQ0imrhOGSVgx762ycqN6bu4mouuw3u
 uk0gAXpQDA+xf9Iehc5TOQ7SIeYKr/ecM9MfmYc7oH1qAvr4bPP6HomKQUA2LZhbi84tWqp7dJY
 UcUjHOnPN5nQbiMRhGZ6QHivBNrUqYBZfy0E/ZuBhwGvq/Lwx/9Q7C4G64iAez88rFLJPBqu0+6
 8r3rzkQ2f6Zt3X7GOLTIpchyDVR2B8Rt5XkJtUpn/nxlyKCu4BilAU4FrEq6iZGukg+PfWg/DQi
 yXWj2ASLRNOfoUWeZ/eI/Oq2u3cfroXMjEohqQTZUnz9Ul5wUy1YNUy+IVWJq14KVksRNWZP62X
 /dc3/pN3xZ29nP4HIpJVQCb1d4Rxjpdt9Ffw9Vfg557L7lvjnXYwmgO8fFM2ZCk7InY000MpwaH
 3sMSbwtbV7ifTdcbaXg==
X-Proofpoint-ORIG-GUID: lXgnlKFIxTwATa7S1Uyj5O43mkpAyVU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_001516_250307_4A282437 
X-CRM114-Status: GOOD (  14.08  )
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

Many of SMMU on Qualcomm SoCs come in two flavors using same front
compatible but a bit different fallback:

1. For application processor, usually without any controllable
   clocks,

2. For the Adreno GPU, with some controllable clock(s) and using
   additionally qcom,adreno-smmu fallback compatible.

Add missing constraints for Glymur SMMU on Adreno GPU and several other
Qualcomm SMMUs for application processors, to restrict the clocks
property to a specific value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


