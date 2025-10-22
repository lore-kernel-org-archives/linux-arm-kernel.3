Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ACCCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Caa5vkwdw4xHZraI3/8RKSxtU2t5kpfmIZu41KBIZko=; b=zpAp2/L4bnsxRHvT6dLUHVcy5P
	KhWV8E2QQ9eXGCv6S/CBPAHTjhA2IIFBrBue12BmMA7x0v4TVAOsTXZ0e0FbIY1D3Tr+8WwjAvEKA
	Fmv4rpSaYoyKK5C0XrSooktaq2rfm/lIObtoMpTIWz7ST+Dpne04pXlfF4IDGEwHQG1oVRolCm/it
	Zx9oMY8FuOXMpgb19jbQ5aQfi+r9AhTwYCvCbCYvT4UsVoDxvgZt/iQPqp4opVKmPjnwnfq6E9qSb
	85meeB8d4WDyzR68EuZwgdwIRbRjyEa+rhXM/H8Zg7QZAYI6JoAdK0eAewn06XRzrQB9zWUCDRz0D
	yp9gmaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBS8p-00000001cvR-3cTh;
	Wed, 22 Oct 2025 06:16:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBS8j-00000001cu3-1jBZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 06:16:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M32CRC030308
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Caa5vkwdw4xHZraI3/8RKS
	xtU2t5kpfmIZu41KBIZko=; b=J1twn36ENOg0CLYJn5k195VQx7r9PBIhcu/dTY
	g9MQjCHDDznAe3zmAXA0/5UjOLKhtoWYcuzaClRs3a9VPGZiX0UuW0ZszR4eb47J
	2C4220ZUQ/g5pHjdZr6x40CLvnYqo3Yz8OwKYNbYyJOJHIxJl7M10UqgVMlex3w0
	aE9pcyd2toLyOTjnBKL/NE/ZnISo/xd3/9C9ojzuSdbGwgNFObMrR7Mg/lRaLXwe
	HUlRifK864+q0qYJkWBX2kobxw/GsKALg6kPD8GJ7OkUrVM7PeYzjVYxxxqNStaT
	/2D81rMREznd7bprcurqpxiMhDfth0zgHsjZvV572ghISqtQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge3etf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:16:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2930e6e2c03so2049275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 23:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113762; x=1761718562;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Caa5vkwdw4xHZraI3/8RKSxtU2t5kpfmIZu41KBIZko=;
        b=IkOyPIXWEBKrjpBRtTajp3a7TCj9drGileBnzajCSupNSOoPyRc4hmGSipzJT8rbhS
         m07A9MM/5POeR2ZdVCdHiuFCfQZqiVhRxM5vHGfzLjj5IqSGhQXbs5T3eYp6ifuigG4G
         6Kmn+MA35l0oPydmyQmJgSGc81RIC4Ma/Ycyta+IKAuAGr0iSvxNiGVEKlMtgBYeyaz6
         RLFbukMQ0PKixFB4tF7fQwqaoOlIH9WGZtu1k+SjxAdJ1zcjx4xlawYML2DjwP6RC9Ib
         boYkD5lQ7tNHEZd9K3xM4ExDFzGrzbPsH+0DY4okTU5AC5/j/YyQ9zaWk6sbZebAeFqE
         F3NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD9bIILvP37wWSAOlaRhGSFwVIjNDUB5LqsMVQos6GMVaSO1a8ohiRSnKp3lB4AIHgrNSAEIh19Aj+LZSHDlWW@lists.infradead.org
X-Gm-Message-State: AOJu0YxEk6aoPlqOSTWeNFyNU4uyhpb8yf4MmtGXy0I1uwBA5i+vaL1b
	8Xm4WNUJs/9/9wDUBbRyEg0YpwodfG0nwiK2PECR+K5d9xOnq9drhX9DMQUjDE85OJVKiOyVvoq
	XMltfTEdy9Ewpzjbm1LvqvYVvCBd4anQimG5YxmrrzpDTuAPLsXKWGkGIFQnk5GPoEOHsldC3V1
	PVUQ==
X-Gm-Gg: ASbGncsJgYW94IyxlLnBfHBFtnFsvyo8QYNLRfVQKMnUaLQUxwTRVOtamjYI3y451/z
	xGbx8bE9yT78UvZmFTDhrOPr35JSuAlMEi7cnzLBdJSi43Xf+BmTuTTn4nQk9t787gamkLoHeM/
	SAQeuoG80gk742pGKKlaAmbWsacoiEQoOVBkR+mfPkYZlLoO8bsx6sh70gTKS/Fln5AKbIWdNN9
	qXOmDX7bXIMnrY0RF9LXKr33B+/BplLkfr5801w4KsIgYLMWLpnTrODoBPQLieSrKb4zBicgOZC
	SB04jZOCccd60nV7jY+s+5C94V8riDC5DM1CpM0lrg/0gt315k74DD4u6J+fmJs6WZoxHrjcLv/
	xY3Owo0GPtV1QF4A9o5Q/lUNIao4l5JtIGSt3w8y1Sirq0YO9TA==
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr228745575ad.9.1761113762291;
        Tue, 21 Oct 2025 23:16:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2AgOSc86y2gtANDpKitSqnm917eqTcvN+6mopis8vmZnFgELd8pw/IBae457LATXi4NWmw==
X-Received: by 2002:a17:902:ce0e:b0:264:befb:829c with SMTP id d9443c01a7336-290c9c8a738mr228745345ad.9.1761113761848;
        Tue, 21 Oct 2025 23:16:01 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe2cdsm127890045ad.95.2025.10.21.23.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:16:01 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 23:15:54 -0700
Subject: [PATCH v2] dt-bindings: arm-smmu: Add compatible for Kaanapali and
 Glymur SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-b4-knp-smmu-v2-1-88774e6d2def@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJl2+GgC/02Nyw7CIBREf6Vh7W2A4gNX/ofpgl7QEgUq1zaap
 v8u7crNJCeZOTMzctk7YudqZtlNnnyKBeSuYtibeHfgbWEmudwLLgV0Ch5xAAphBDxqcxAWlWo
 UK4shu5v/bLZrW7gz5KDLJmK/OsperrXe0zvl7/Y5ibW86bmWf+5JgADUDWp9spYrvCSi+jWaJ
 6YQ6hKsXZblBzREBLHBAAAA
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761113760; l=1520;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Mdp/Hc2CfLvmDTYkA2DMn9LW5Eg9Clkn4+zwn1SGkTM=;
 b=xSrVO81Lo4lXRQpoQOgaTHn443ZBp7YKlNGDYCQt2R9bVirX0XZP4W8nz4Z3dr7Y6jmiGfP3x
 wucPu3qrWm6A4Qlc9956K7d9DiQvi5x1mODNtuPFMrg2CVgr9ECtyBP
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX4yA1wvCWRpbT
 b0QSOzIn+xceTHP2QSZeRCNe0engDDs5IPa0srN4UpNHX+EE2fQOflgP3nDNv6Wwsm0szRf/Jd0
 yvofj/GqUlvnBg1K8wvJgKHhcnLSFnYJ2ArtbuCZsHxraPJqKwc3y88bWxK4TDulWsrfiaodriI
 khbegVHmXCHi8lfxV/Ec1GIH6VtRzFUFsTU9+LbT1EDdUcqAvewfUqFyr0s7qQPWiu53bxnbdj4
 qMResUv0/TJODUxVClhA6wXcOKPLLXe2vpCw0bwJVmn6wrlKlQl5f9HtmKht03F7nm71i2T8LtT
 DmgQOMn3tpQPHk7GujgPomvIwN/+FcZDlMmCIuqFAX9rzXZ2IkIfulUU7uOohWW5iV3OT6ze62o
 RdatG8d02KQh5QiMpMeIznJfbAy54Q==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f876a3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: cAyOlWJLBlfmqCb-MOV1SjyGoo8pXRyR
X-Proofpoint-ORIG-GUID: cAyOlWJLBlfmqCb-MOV1SjyGoo8pXRyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_231605_574594_5F0705DA 
X-CRM114-Status: GOOD (  13.93  )
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

Qualcomm Kaanapali and Glymur SoCs include apps smmu that implements
arm,mmu-500, which is used to translate device-visible virtual addresses
to physical addresses. Add compatible for these items.

Co-developed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- squash glymur binding: https://lore.kernel.org/all/20250919133439.965595-1-pankaj.patil@oss.qualcomm.com/
- Link to v1: https://lore.kernel.org/r/20250924-knp-smmu-v1-1-c93c998dd04c@oss.qualcomm.com
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..2ffc48a276df 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -35,6 +35,8 @@ properties:
       - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251021-b4-knp-smmu-c79a61dc4434

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


