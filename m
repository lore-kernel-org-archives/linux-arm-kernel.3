Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D65DD730BD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 08:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnNqFP61cks=; b=wdxxLeiPFi2VgNepAcN3SV9CbM
	nZgTOZLtFAyIVYAQl6bcpTTB/p/TWtQtHJQqs2BxAA/5Nk93btWd6S2p8e2zR20AFtIQXTRFepbD/
	WZrGJaZNE5PSBGs2tYekK9eeNDWsghMYNibRC1y7H7tpMFuFp9MLjciZ0AfAYDWOeARNsH+Xyq/tM
	iV+s9jakfMsP9TFrVRCCeXKmeWkZa1myQAv5ed6oREqirQdK0diXcPwpwOXTXhtoIKWcTwRIgxdA4
	rYnGtw7wgSCPWjWMTo8S1CEsKc/BhCkN79TG7eMOwRRqCkd8q4dGHHB+XgTfet3FZqdb7dYcMMsi/
	3Axqk92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZbZ-00000001gPe-3gqS;
	Fri, 03 Apr 2026 08:10:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZbX-00000001gOl-1QT3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 08:10:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6337b20N2707033
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 08:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnN
	qFP61cks=; b=SAlay7OM5cJHl5zc5svK6HLlTmllvm6qvO8B3OEMGUNL2vx+R/m
	9imWmfELIzjPpHzsJi0lgYxXqhlxKY/2nG/4oRTSl5MYmvTyj5yunplFH8vYf4Za
	WMsIFtieSLkpiorWwQyj/O/bF/sgvkcnZ/8zEQKhXBbVSbMxdYrCdul1yubbc+Ly
	2oGl8U8jqB+/iCbcCPCTVWVlAo7mzT/+whJNxd+zjxD7xvSSzS6kBhppmUCKXZbU
	StM2x2oKzmdMTeszpDl2b+QMvwdWUfpNHDqrk77Lou/toiBH9kSJKpI09DqjkDzh
	DDcXi1c8jfRJaG+n0BeWrA672wkxfSSoZVA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9yfjhpks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:10:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cdaf0f934so2067157b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775203808; x=1775808608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnNqFP61cks=;
        b=BETQejFDzlEwiTP/iGMjefkblo+ENM/nzdW0pYIBLplChMjidwG3nc2/asOmVKM2SV
         WKRayKgr2QwyB1a/jryTpq5Asg90iOclWiwppdwvXcoc6ZltY34D4ayanM2qnb6wXA+r
         Za7kmY8ZaYbeI+mElw/BgGM3z7lX3+gnehxHXzXduTl5fVamxWVr0MXafzE1EqebWtpy
         uiNuj/DQOLc3cWLQsxcWLlR9lUMojaYVFgn38di7U0Arvvd/0gV+X880v0/NYPjH3lcR
         pi7TVzuJEmXGhEH+Tc6mZLsQoh52AyVIOwpGcC29UbjneWcwy97dVFmGFmsOlfAZVf9e
         17pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203808; x=1775808608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yxxuGjGRSktiOSFeurkfNMNMudjTni1PnNqFP61cks=;
        b=SjFJCCrWixA0nF9a+8qSLWM50wCzpjZchK7e5KE7qwScMssj5kbGXb8gg+anrNdK22
         7Ofq7PEAfCrJqLDnEJbzRLjj+74l31BgpZMpQGk0kyo9hMS41gpIofIWpDgE1PihicCJ
         hcw+wNDH9AbTyIm5MpH66u96nJ59fX0KTYVrOE83jVJgnshP2Z+FhaAZb9zty0YgFInv
         6PZg28luXwH8rAjeWrRaBhzXGKWlEL6wJjCJFprkNqBkq/WHrYjad+kXgrctB9c7z3tk
         /UcfFfQrAQQ+7U2m4QD9bhHxNvAryCGuv4Z0ysw84eWUqoJdU0qDr0NZSYQrxVwhfWxr
         Ehdw==
X-Forwarded-Encrypted: i=1; AJvYcCX0biZKtqUJpHandIpKsqFLzWs1Y1GV8wwnUN3NOezpQPFgU976aeYm9tpm3nO7+RrepCEHZ6P7pKrR0araS5ZS@lists.infradead.org
X-Gm-Message-State: AOJu0YyQXf6XZ77W2Ene3FOOy7GHqVVtlPkFOIRvqifsEiV6Af149xme
	BiPAbYUXl2nM9RrA11kIVR12W7hfF2tVbzRlbneQEP874OAo6rs2NmAjP4lAo8F3CemoiRJqHLt
	ppvbKucjWu+jABYbevcCXNICzp7SyhBrp+NnYFKlU9KM/ak2da7n4Ioi/Zyc9V/jmRij9vq+B5O
	odtQ==
X-Gm-Gg: AeBDiet6GY2DrD5MPT9xkmNsazBV4MbL1Gqr+juseeyZWuzf/8Sty9Il2fPJfndOWEA
	SR9UOd2rFFk6Zg9UzTQCR3HC7JuhQRAbanGPom/HPaEuMgbBKGbNS0nYxpDe7Azld9w5vQ2lI5s
	79mbZyr6QKAf0AhEh1Tkqwl3nh+fMChHSRaM44lt9Z/svOlEQcYfR+CDizbAiX2qhSNMtEtP0oJ
	ylN/ixZ56eYr6SZ823Rh7ScI8ZgC7H8qyocl1JhhlFcuildQfzfwF4hXM2NFnYZj7hwoO4J8kIO
	s0QG/CEKMLgdsg4j0EPrP6NCUoikb1MEXLf5BwA80o+FjEHXL3T7ulIZx1Z5OqJWwVZZtASbOP9
	6Tq+IqVpDQgiQ6bUPwf+BQnM7DxujXV595BubBIj5O1lwfY7t
X-Received: by 2002:a05:6a00:2e85:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-82d0dba215cmr2162803b3a.45.1775203808246;
        Fri, 03 Apr 2026 01:10:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:82c:6aee:b21a with SMTP id d2e1a72fcca58-82d0dba215cmr2162769b3a.45.1775203807745;
        Fri, 03 Apr 2026 01:10:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm6989864b3a.10.2026.04.03.01.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 01:10:07 -0700 (PDT)
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
Subject: [PATCH v2] dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC
Date: Fri,  3 Apr 2026 13:39:56 +0530
Message-ID: <20260403080956.2714415-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5hiKedadCKc3WdtCuA2yWb3qfGtkQlyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA3MSBTYWx0ZWRfX2b4a2ON0DeqK
 lxaFiWDX21LcOBEZivjoM8++H9zCyXm76moRlmoBrSjnFiuMmrPeIVvSdppilH+lISgceGTlK67
 Tnx3BZWfAsTooxSZPJ+ebXFZUetVnyr9WaSGZPgSXEdgC5uNlnzlSCqD84IIPTfHlXVPZ4XDhQz
 JfGacSiXbDiYLORWSKiMCzeoS/T0xmNGz2+LjoXzzReECXGnllVH8CENwWKMr6yi2THXGtsU2eP
 6CRpmTDmo41XLnIdg3eDlAV/cFIO4aRQl1t4h5S15V1wetFZCcaFG32x9Hn2/NNbT7R+BTSTkkk
 nRW0H9YGeNJIifHhYCTQnaFAqyV6AltaMMlKfea5JdjP1qVw8rTJaYsPVio8oFyYdpRHzGxA+//
 v00DarN7ndduSqNGpQktLfZkYjc+WalVVX4peyxwBSPItfSTDTvyIr9F/rDq7qvewq71gHRaQct
 BDZJZHDTCErm3cRvM9w==
X-Authority-Analysis: v=2.4 cv=OrpCCi/t c=1 sm=1 tr=0 ts=69cf75e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=V65sNsENKvr6zZljLJ4A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 5hiKedadCKc3WdtCuA2yWb3qfGtkQlyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_011011_515697_71AB908F 
X-CRM114-Status: GOOD (  11.40  )
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
Changes in v2:
 - Added qcom in the subject as Hawi is a Qualcomm SoC.


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


