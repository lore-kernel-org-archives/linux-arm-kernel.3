Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5811AC55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 05:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ge0zGVB2WMr0FkBsLt/BnF/YfcascqnH7BAZ+KIoMU=; b=XbPDlwe6c4Ky0olpl4/4zsogPu
	cks/Q8K5hFm1uDOdCoD29ZmvLdoBFfmb3137JcOAuJSmFO0T090Y09CrbX7zJpcxJSdtHuvAEFfi6
	MHbVx/R257S8F5xHc+qt6/hg0qyTdL+IPBQa/FqkDpJKr+4RPGyKoeTVfbU+zjHVmOkG0C/RE/oPZ
	EYgANcJoB2cy390Lm/mPBjujLyYp1F9lHKYiudmlA8p0lGwRIdjAY9iEU/L2wYJOaeeGTYbunBIqh
	UcNZb+BRghhdpvyzIK9gd32etTV5iuJw/uorbZhlIeI9JfeQJM8+b9nLsCpZ0ejjc8aK/n62Mtid3
	ktHttGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfqS-0000000BneV-38hM;
	Fri, 31 Jul 2026 05:31:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpfqP-0000000Bndt-3Wq7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 05:31:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4v4j83146973
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 05:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+ge0zGVB2WMr0FkBsLt/Bn
	F/YfcascqnH7BAZ+KIoMU=; b=QDtnA4HCCjMlHLFZh7gRoTQdkUUJf6P6VoZ6Ck
	1RkmMZRvKR56/hprrAXhtga/smz/hoL+pF70ukVctX3Q9euEVNq5pjUrvtJ39nB+
	F2O+uM+QmlwK0zuNyvRLnjnAeJ4lEV0xYixWBF5f6MxPKzEF3PdDvFpwG+xhwwgt
	cQpvNvcPfCBCTDfswBox4OdqGcMCJ+jpzLH/EuTWCnj93WhFwbIwu/YvPdGpqc9S
	AIpAUmwOciN0LZEdXKFl/FEsT2sNBR6IbK4hym7PRON/fjC86cuVBf848opZM0Vt
	SUQAqNGxcV0/LbWY+Rsmb+wQoAGvOThfX+Iy7+cDJo5X6wgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0e044f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 05:31:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so11958915ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 22:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785475896; x=1786080696; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+ge0zGVB2WMr0FkBsLt/BnF/YfcascqnH7BAZ+KIoMU=;
        b=JVEYqr3gbAzTEU0KLUirQCt+ssu2upRLfczRJCnRUpeGNRJhDxrrZrhl9vIP2wzhYh
         Gnfk/vMJTFA+0EFIVknADQurf/lojTPYGAiqOnyLE+XgUC75dN1hgHNHU6Z+Mebkt2qz
         H4o1BB9UUnWiRS7fb0z8IwYgPP6W0ADWAwg2PrsM3+DY4A1jWv8pQRh15kfUGBv7FAtf
         jEeeuMwUUxRLxbLl/1g0w9NehIj+GLLu99TuFiwRH8gQ+GhzIwRTivlA5jxg4bTfxLab
         GF6CqJHbV+Ln4hCxYvwug2nqpLGnlYt82VZJl1+KrVRrPipMHIa43bhNqSQeIRV1LgvV
         1TFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785475896; x=1786080696;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+ge0zGVB2WMr0FkBsLt/BnF/YfcascqnH7BAZ+KIoMU=;
        b=cjtGHUwgve4dD91ErWgBVNH5XXjeFSRcP1kBc5VDpvCSfGG6JlGqQRFrnQfq7VmpZz
         E4/7wvcixU/evs72lx/IiYdbLUDCZ9po9YNm7ToOvfmAbjTn6E7xkQiCEN3hNyEImHyt
         RgxkaKBs8ioeFBbPwtUnBFALOprRzoFn4ok7F4+/9e1oNcSocReXNgpoMtd5N+2tkPs3
         NdK1ys3PjAQF76M7fHfePQqA5E888hhkT+ar7GqkVg9rpzJ2o9Dpqs1T02rbAdXEUl0w
         l99woZ/+gPoCAeY4ztaJQW0WR6pOTtOEORwbLQanSAtN+Yrgm2hNEIOS3HAkWacfkoXZ
         vg4A==
X-Gm-Message-State: AOJu0YwVJS9x+YDGsxZH6gZI+H86vCR/S+IjHps72IQeptKQFKmiUdLf
	0mlfiJOaBeRs4zG2qM2iDAd3AkD7loF8fE4BJspL4OJp0bZaV4D2EI15zpVyJRKnM7ZJ4Pa1TYy
	99/LWaOljOYYMloe301dSfeeuCceO9mfytZeCt3aIx/oLU6KVf0DB1B85SOaW1Ml+qM8rewN2Vj
	S3kxMT0Bpv0Q==
X-Gm-Gg: AR+sD12tfn4PmpA1AK+N1cEtJ4Bz7MlhVLjO/O2gE7JQf+FR5KnOiNqbFBq7M4mHkqN
	tDdsv9QQQhFcUsSf42RNIkMp+1Ky3VrtVV1HxgsPOYXGGJS9Z8taGO0yAK3gZkz6n4j9Dx6iCzj
	RBNoUSAN5sdd5C40DZLoFz+jBWt0GzalqRthtKEs4ZrGlFsOodUsoshqGxKJXFoD7RqfSprD4tA
	wNsShbsAvpf4pI1iDENh12lkbJ8/c80h/sb2fXF7TNzgXGn7Tku/7gKbIawGiTtt1oXqtnVJAZL
	gfVfah1IqstIHF+R24Z9PK2khiwWnnVcNZtlJlpnYI6RuuEFhXv0UtsL4tKOtHRS0KsvpFnSCbL
	YQWEabrnMLxkiD1v04c20u1/hN86NQlEHkjIVW1IJ9TkLhBpxe9iBWJGJ+gXPOUOxYOvb8n7uls
	57Q29e2JEc0sidA7zreARg+KHrtsMp+k+RB7s=
X-Received: by 2002:a05:6a21:918c:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c91b3ab625mr542268637.68.1785475895814;
        Thu, 30 Jul 2026 22:31:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3c3:cf9b:fb8b with SMTP id adf61e73a8af0-3c91b3ab625mr542243637.68.1785475895416;
        Thu, 30 Jul 2026 22:31:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm1983434eec.4.2026.07.30.22.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:31:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:01:26 +0530
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: add compatible for IPQ9650
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAC0zbGoC/4WNQQqDMBREryJZN5JEDbWr3qOIxCTqLzXRfJUW8
 e6N9gDdDDyYmbcRtAEskluykWBXQPAugrgkRPfKdZaCiUwEE5IVXFAYp1IWrMZhWOoGnAHX0Uw
 azQqTlVfJSJyOwbbwPm8f1Y9xaZ5Wz8fX0egBZx8+p3flR++PYuWUU5Yb2xqleM703SOm06Je2
 g9DGoNU+75/AVYSpJzRAAAA
X-Change-ID: 20260512-ipq9650_smmu_binding-36dc05d39860
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzNSBTYWx0ZWRfX+EwCl/a53ov3
 w4yL1GrFfrR8mMhetpqX/e9Z/fyio1DDVbBeinXqgB0YdrfjDD3YBKxh7jcJtD2uD0maVsejchs
 8OnyT5UhJjRS58BR/tU6W7EAUpEwXYC9ICQ0ntcPU41iEv6FXUjWMIOE3+O/idzwVCvX7qcG0lS
 KVp3DDL9w3xl3MGcEkK/0Kc1ION9Lt+wQqBhCbwH0QwS+D/uaEbXZCfxYkf42nD5i32sHryzXzk
 pY6zsSbivu/8Vwy1fm879vCM88FFOVtLnJRCj/yxiC8me5z/YTh/XPJrVhShWiqodypz+ldTgE2
 cEXaPoR3Av2Dx1UhT4pFE5OuFkZT+za34dzqMTQNRYsbm/18wOpzXaGoZH4vNemez88CENgbON4
 kK31bhYBIMU/5maPdsjV4nOz177Odro8OPOS8LPclh69MiAHbPNkXTTuS1uCTNkaf3oiuWSE7hL
 GBf4ooTNpHuUJo8EXLA==
X-Authority-Analysis: v=2.4 cv=MNtQXsZl c=1 sm=1 tr=0 ts=6a6c333c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=tA7aZXjiAAAA:8 a=JfrnYn6hAAAA:8 a=pIFn9JwG4DboacuzgAoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=kIIFJ0VLUOy1gFZzwZHL:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: D4duJss6LS28Bij8twRCSWN1IQHmH8Ot
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzNSBTYWx0ZWRfX+e146k58Bk9s
 SgI6886fh/6hwMd2Vw+hOMs7DyYGZCMaFrhW8SgtAtTHN3Z6N5wrHv+mVFKV7IFuxrg0zi3cPah
 4hjAHGJtHXCZZKptMkosQ8QUQMG9HW0=
X-Proofpoint-GUID: D4duJss6LS28Bij8twRCSWN1IQHmH8Ot
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_223141_998927_BDDD8A4B 
X-CRM114-Status: GOOD (  14.65  )
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

Add the compatible string for the APPS SMMU present on the Qualcomm
IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Add the proper constraints - no clocks needed for IPQ9650
- Link to v1: https://patch.msgid.link/20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com

To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f2188942f877..ffa33b7f4a96 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,7 @@ properties:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
+              - qcom,ipq9650-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,maili-smmu-500
               - qcom,milos-smmu-500
@@ -625,6 +626,7 @@ allOf:
                 - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
+                - qcom,ipq9650-smmu-500
                 - qcom,kaanapali-smmu-500
                 - qcom,maili-smmu-500
                 - qcom,milos-smmu-500

---
base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
change-id: 20260512-ipq9650_smmu_binding-36dc05d39860

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


