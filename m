Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CCCCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LsohKq/Rcry2lOpzgsvKWq/Zyk6Dbf/1HfO9XNIHJ/U=; b=Ng9+RHCQTZQT6uiOb9VTZalHwf
	0gHqulqYn4QjiDSTvZrX/v8wCPBy8Xqv0On1SiY+RK8fVDNj0EPGPzUsYpmw5gar1NAg723yJoMSb
	CjB5XNChgVmZmBE5bm93Z9DHgIGtSx4gQ/yFkS1ydjVALVdwMaiyB9x449zLCN3oy+aZtFgQMD7pm
	3w5j/Zu2aOexxDZ7YaV6Ta3XSNeTsEre8VqIfyxmmM+lQIw6wXMTkMaxBBkIXea2doXM1tH0NcV0L
	sKv5hBJ+VzmR2N4V32FTSFyQc5/XV5S3qb6O8qIY+YbK88gr4BSAQhr0SZRnEVDZEzQSzriEJYxV9
	KXtEXT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbGQ-000000030l6-0HEu;
	Fri, 19 Sep 2025 13:35:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzbGN-000000030kR-0Weq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 13:35:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDOnQb030556
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LsohKq/Rcry2lOpzgsvKWq/Zyk6Dbf/1HfO
	9XNIHJ/U=; b=Cflv8X1XBA878cmFDyF8jMcedeFgezI4IJyz0GSsHrNhRxpzuq/
	XHBzVq9AyotS7Jp2Pw2PNjCwUS6C/1kB8O3zUXNelc/pCwK4Ak2rH5KhrFNIqTji
	204TOCgdXJOzJp6Azb9Txd6V0oXhejzRKENVT/A/71Mqzn4aRI7X2Hbz2+ZyIdGf
	D8TTOx27O/gN/sQ1LSLDRBaH7voMd/ILyisBmFsjegY6Bq37zmUUOgxBsaNwSJbh
	ZIR3HIYObO3oPpmT8cIdPh7PeZ2M+0zpIvY//Lc9EpVHyjt3L1jip3CV1OgsEItE
	1cx3f4qsSsRRkaHim8Q3zG5w0Je/S6OwI0w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x1dgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 13:34:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5527f0d39bso354036a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 06:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288897; x=1758893697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsohKq/Rcry2lOpzgsvKWq/Zyk6Dbf/1HfO9XNIHJ/U=;
        b=fji7gfZd3Xfc5Ft0YRWX518cb2/lt8TjjJsx3W6WZmQvd9IpSMGLeNu9KLLgZqfQCJ
         sxikIy+yizMGnGr79IIJ135V3rVlwVm2D3a/3pwx7xIsnBm0n/ARtOVBPVFzCBfs0xez
         ZZQmD7+922dgU3vkMdSV86ANqZN1pghpk3cihvjzTenVVcuKyXUnKvCYhmtBQ8n1O4bE
         jofVP7pAp19Yhx23/ZkBJ3ZULx0Zq+oNycplyRC2OnSiZY+jD23UH8HVWK1rXz2kZC36
         wIP+B+E35ldsl21u0ywjgyAAOT82m0o9qT30tgedKLCkUtZe+wuW2nCbsXdfvK2ecfls
         mAvg==
X-Gm-Message-State: AOJu0YxlAZPj82rZ3TwaTIRWqcSfZ8hqcWnDnUvHWOmi/ykIBXJGmyEY
	o+4Tu+dYpeq110qF5iSMR47rsQONWIK0bSfxO1cea02yu90/dXr+2sBGVTIfxtpSRAfquIGqevY
	NiWc5Fl504NArjAldCVv3dzfPle2LT9t7PmfY3ZvBeK6cyU3mQwiXUE+8Dooc/w2wFSRbrgpAHR
	SNsw==
X-Gm-Gg: ASbGncsiWlimfv3hrVezIT8GOm6n1G89BwTis7CCJezIaVTiFS31/oIuYwatzHDqL9z
	gh4+IRqQhkyTuNHk3LuO3sulCFdpHsGF/4Y7NGqP/5X/YiXLMkQ6cQW7Y1HyaJ4wxDeOt6g5Eco
	vSjWKL0B6RXJ+FFcJ1idxrPFji7z/lQGc5fW9HIV5y2R77rm6fIim5JDIJ58sQpI15h5phXP+Us
	8Bpxl3CpQhf6ZtqYvLFKZsBfI65+3yn/5BDKgrFxlV9+p9lRWx310HUaAx1n6r8iQ4+J88tlmgX
	phKB2B7SFb9avXzTXs4ZiGNhKFNZBuPg3CaZylI/OM/C6XXqr0AmB5OILUrzU1imVkVDfOEKRDz
	tF+dvVvdUNAu11zHUbcPWNy7lo7AEtwiyrTBD0wBbKaULGGeOvACBzk2PBOCl
X-Received: by 2002:a05:6a21:6d9e:b0:283:8139:b613 with SMTP id adf61e73a8af0-2926d9da17emr4653050637.35.1758288897379;
        Fri, 19 Sep 2025 06:34:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO2w6MVcEvV+deoS3kv/zg7PSgK+W96l5OJ7rnwVpM9/jXjSZoCX9M+C/TvZkhd7xzo1aF5w==
X-Received: by 2002:a05:6a21:6d9e:b0:283:8139:b613 with SMTP id adf61e73a8af0-2926d9da17emr4653017637.35.1758288896951;
        Fri, 19 Sep 2025 06:34:56 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55219e34d5sm1558940a12.7.2025.09.19.06.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 06:34:56 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm-smmu: Document Glymur SMMU
Date: Fri, 19 Sep 2025 19:04:39 +0530
Message-Id: <20250919133439.965595-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfX64oV9u6rhHdV
 2BhL4TimvBSh+lCz6ckgvAYWakDfb8u5D0gEqWm/NFvKmYIJU/op9oKvuQ69Sln45Xthu2xQEaP
 aw1QLxqSvDWF8uL6RJpfHSLFG6F2n9kFbyMoQs9+5EpjCph5rjI6+2GvjapG+tz/utJ6UIUCshY
 BGpRb3gCGVr7p7fW+f/ZKNnPnTVc6sq1HaQRsn16FWtWJBWJhvX/CxbgmeUSITocNA4Fg+UQAVh
 S72skrf+2rJHLNt7Ai1zrmu2CdcGQzUcEFdPgyY+UDsCHSWQpNXnPXsGyRggN7oPFWCP9WBL5BY
 FyXGJf0oW8zn08H5F2V8blz26VowKb9OkuLBWzZmn+yNAGR/XhVanH58gXVrIgfchoRlD1rOhqt
 wJEpVgBw
X-Proofpoint-GUID: GsIOiU5B5MVjUOOUufrrie9jHERUcj9g
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd5c02 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8Rycb7W9lGZI8AMxJXgA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: GsIOiU5B5MVjUOOUufrrie9jHERUcj9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_063459_165458_86D7BBB8 
X-CRM114-Status: GOOD (  11.47  )
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

Document the compatible for Qualcomm Glymur APPS smmu

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..6543fe68a819 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -35,6 +35,7 @@ properties:
       - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,glymur-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
-- 
2.34.1


