Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13FFED3517C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmDeo+icNTY=; b=xmR+3uvqd0EaczrK7r4EHIoYBF
	Ot7s81y7+vEq30I6v1ysuTDmaRnLluiCzpEOOOFq5lANacpTov+lKaXNanp1Tg4sxJszMtsMYd+M7
	E+lxoeEqIBV5vwCTlceUULTTRdEiUVZgt86LhHebefNdZDCIX5AMlpem4uly1McskRgNTpTznuDsf
	oS6z62ODe6zNWs2IvXOQvoPKRzRWmn0xMkaGis3SxU7vbuLPrGSusHDuN/pMCcy7L12xzawFvRFQD
	BoawggJmZyWq+ix6tngY0YRRSSfn+CqyyzS8cM1dQZaGMrMsjvCjiLwzxznfucOo10WDBv0z+R8ti
	Xi2EoBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uzW-0000000FFX6-3N6q;
	Wed, 01 Apr 2026 12:48:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uzU-0000000FFWe-1CCF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:48:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6318YiAJ1459604
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Apr 2026 12:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmD
	eo+icNTY=; b=QpYMs11laMI31RYpLv2jpCaZVGt/bSV/CtoLtJngR8pAvpJjmsi
	rfEXyYFHlvg+9SlSfKSqSIrmMz7S+cwkSSd6tVpTCs/+l9v2ryKBDxYxEtYdgGiS
	U9eEJcEofgXt1MlVEP1mgc717xnZlJRHitepPXr6ktXVMrKPHUFbZ9SGvW0khAAq
	5zuUKRhaIazL3vqmBdbt1plm7orRbQ6ZfUj30ctLno8he/eHYD/4wWHHaPrAPKst
	8VVDchZuNpTx25f/Yap1gr7JoXzVF/ZG13rftDWjaC874ev/aHKF8BCggziJDuR+
	E9W+FcxSKRoimkCgnqgg5PmbijsYRw6imaA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg298u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 12:48:11 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c76b15a3ccfso1270434a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047691; x=1775652491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmDeo+icNTY=;
        b=a+sVWFiTIj6nKG1Ery4W/QYP3NqgtgpIc2lt+B6qQuXru4V4LxRJ9LuLGoGkSh7LLR
         Cg7XrtiDIkRnlJvPyo4EH9/+4jWficAoSnGvolRCCctd7Rr+EqXYzNhJkKXw79g68lmI
         GseyY9wXtrrZ7o2x7jBRGOaplRBI5U8BXFaCHXZe0J9wDt9KqSeRYAOwXh5L3pFLw2H1
         Ga0jlX1ykvSep7ognWClj/9spbk2GSXBSJZYXMfMc+2Nz3X9mgyZnlJli4ngqDMhky51
         CyKE6v7u8JxIQF/GncsBinj4LlV1xwfG75nWmx+/9GxBFIfAsBsQB1yCxAnRK2VHs+2C
         MoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047691; x=1775652491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=37d4Ftbfq3heDIcxaZtHZqx7NKWVEylKGmDeo+icNTY=;
        b=nbq6mE1fp+5HUz2Hucw7Dlj3kCORdsamnhxMY0ZYye1HUsQxsfhFNz1Dv3aEfaO920
         Jw/RtmCZDB1L6cF2X3GufEl2VMA/I0AihvsSdm0FkMB+YgctHD7Ld/2X8uxmnpT/Qnye
         pv1U6I9+acFOZZ/7t76hI6QufjkuO+22aOgJczWCUgxtTyC9L5EbvOw1NUiZox367Jb6
         r7kLAJpB+sOfGghI69U6cycrxs4OCIWucA/Rr1bhdugKVL0+piAYOFbdXbG2FgsJ3nSx
         VN35JxsGTg3+avkwqgTYAnI6aLhE3jO2M2r005IMgtqANeoz4SG7YzXOk6/ZJiGSCyvd
         qvow==
X-Forwarded-Encrypted: i=1; AJvYcCXfFJjrnepr+bkEJjUv1mpR84mwPTitN6O6Yvl6n8BJLy8bwTRDmDB7R6lgaciyBX3zmsw89S9yjCoXAP+A75q4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjj0veYJrWpS3YXJj2+a8gqt1p8d9zZlpxmEefhPLIh3VCd6UG
	hsWlZDZvGKKToXkiU9Q1+MOybnYkCDvAJbyhU7qwukh3cOYfI4eD5Z9ay9wpKX9KmY/g+buliTi
	IwGgjaNRFceIZBp9f8KyfoB9Kb1bZPmB27LcQ2w9g0/EBjFfBhXq6k0g8wbl7F/9oPUUdoPJmxV
	Rw3w==
X-Gm-Gg: ATEYQzxyu91OLkGTK7KcJmcfBT8y9XUb6EZcrs/w9BHdZgI2ZeddDk3Q2G0Y40u6e4N
	if7AKnuOMIdT8ajhewIUSez5TuPFjq+mlXlz0HPvetrbsRQz8lSx2TJVbG0cW1y24Jz2wLfwrHw
	vVMRI3y3H3JISDSlxtteoCbAsXWo777cH9yuMVFCX514F2/7f/CVYNtjnGKhYEnNUipEBK3P6cW
	owD2hdNGmrKiQjJAqUdidtpF78ODeC1Rf4HyJDtcAI7snbariSps1xQg+FhScw5IIhmF9/ZEwT8
	AGgtW43wxazyW5WozOEHfzNDI2EtVKtp5dfzvdLXjD1Rfyvzo9F2bptSB/gDFyR1tPPdHLCAGNT
	uUfrCWSiXxZqMBL8t5aCUOQDmMvo4qbn3Gso13PWx+rxLNnY5
X-Received: by 2002:a05:6a00:a1b:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-82ce893ed22mr4151771b3a.20.1775047690639;
        Wed, 01 Apr 2026 05:48:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:a1b:b0:7aa:a2a8:9808 with SMTP id d2e1a72fcca58-82ce893ed22mr4151751b3a.20.1775047690108;
        Wed, 01 Apr 2026 05:48:10 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fc6e9sm15507903b3a.46.2026.04.01.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:48:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for Hawi SoC
Date: Wed,  1 Apr 2026 18:17:57 +0530
Message-ID: <20260401124757.592343-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExOCBTYWx0ZWRfX6OLAIPKn7DUa
 t/97ea2sj5vtbG6ShDz0SubWAKaFGysmRPURHezepNFmqEp/G45LM4Pa/E3KJ6XUjQlIl0Ss3Pv
 SMobdg3oHCC4tAhqDIEmF6+AVdG5vrSOs5GFeCjWiq4qvIr8vKnhyWc79RLyqGIya9ejyJuhAnO
 2adwOMnFV+bZvEPwuVY/W4ZOcTTicH8MykBOcZ1vTksFFPVfFXw3mpnAC7yU/SxLBMGmnEC2xU8
 uM/Gl0QRiB89GpDWgXWoJ5b0a33tv5UwyrPbw8CkGatbRp7sOqLWDtDXF8TZ5uXilJmYH+d7/AU
 Lh0iW1lZe3dtkA1wMURkfklTRWfM4fdt5Q8eXCqB6vjAeQs8+WUWpT9Con2p+JP8u+0AUTopaHf
 KPoUcLHHPzpq3dJAE4KtwIkcYYPAtCU7JoQSda7W3fpSXThkvmdtWVE3WajX8HE9pahcLusa4T6
 wq5kP8kk8e6Cb2k5JIg==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69cd140b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=V65sNsENKvr6zZljLJ4A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: eg-qWMQjJBo9TSfZsNzjnu5hgSTAXiiq
X-Proofpoint-ORIG-GUID: eg-qWMQjJBo9TSfZsNzjnu5hgSTAXiiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_054812_343261_8469C7A5 
X-CRM114-Status: GOOD (  11.54  )
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

Qualcomm Hawi SoC include apps smmu that implements arm,mmu-500, which
is used to translate device-visible virtual addresses to physical
addresses. Add compatible for these items.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 27d25bc98cbe..06fb5c8e7547 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -93,6 +93,7 @@ properties:
         items:
           - enum:
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0


