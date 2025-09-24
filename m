Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBFFCAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 23:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZvxXC1Da8p5Z7MQXHlGe285o1OSAb5AblyLBDzUI2k=; b=F+QmKd/dCvakdrfjRAYETN8Mr6
	k8pNDOjFY/XN5sCaISmLEfpldzdD29WykHqsrTobvP+iufGbepJxa7dqZLP0PTiccRmpbAgkykdwX
	uxH0+jrh2xu9KM/26RETxY0+lI1/lrQf5JhjGSZ4MvncFrS5iqLgKbyGFSsPrARFXlQZAvUsER61m
	1ixOmv1fXUDwnw9hJSz+WvoIf0SYxT46YGeUYPIyEKRY2FgS3ybrvvSbg2PEletgxNqOpldY5ZuCN
	S1LDbNZw+bGXxhnujw3UhoT93TkD8VB4esduuU7gA56qIrlgbrVBl9VQ+QtlVywa99/uNzEYicOcG
	7ofijrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1YlW-00000004cQD-22rk;
	Wed, 24 Sep 2025 23:19:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1YlT-00000004cO3-42WU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 23:19:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODKWki024010
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TZvxXC1Da8p5Z7MQXHlGe2
	85o1OSAb5AblyLBDzUI2k=; b=MwY/sVsJVD6gtds/mEHZ7zYZdaaSLO2R96JidK
	ZE9oC6rx30gptMSyiW8TONl3rz0P2Es1iQTFuFPUEyghCAShEFg84yOmEC3ESpd2
	XPPxLlhn5X7KGb7xPh661wY0jY+hupIq7Lk/cmYx7jWzIZsca+a/i1GEkeq2t/bW
	gdrmM2jVG6c2vjJeyUlxcHyMX1ufXyTCmGAc+e6gQ3r3dsBLBm8CFs9aOM8LCdO0
	XUTkOxCbGBFy2VcvECcuhPSWXRe0WP8sN7r53Zb6ZOFpM8XacA+5q2mG21zwLCuA
	p2JQLKZ1grZKKmo1HbD/EjbFKVaF8+A/QqQnYHKmmf41Z4kg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d1t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 23:19:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-277f0ea6fbaso3801845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 16:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758755949; x=1759360749;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZvxXC1Da8p5Z7MQXHlGe285o1OSAb5AblyLBDzUI2k=;
        b=ER+6t1q6af8tnl8Oz7Nf7VGOfzkOAvI6O5ZGNIwZ7qeyBntOHGgpiWFvq6dbrITkuJ
         FEccWuqEzXiJgin7qzfAW+hm6PGmMoV6WTEg7BPad/JvUpQnO16a+3rw37W53s/gJ8ba
         qdvIAQZzIw3vh4ZJ22JxYzmhxtKoyvpME/Sn5UDdTX1vaTVuldsqc2428kA8biNvLQUd
         NcMo29RID2x9jo8273CP0X+QEWjimOxkOL/QdxPozSQv30QPFN3wtrJ/EgDMpYWn0Bed
         uvBAHNh0rch3AoE+AsYgTDTK1+2ONn5kHX5w8KmFBeO07XPbqQKC5YAhNI2YZsInBUql
         qUwA==
X-Gm-Message-State: AOJu0YzKN0/jGGBXj8B10ZUcND61iAKmMg26KwO5N/Fu4XA+cO0KOFn2
	COzI+TuZ5HoT9fT2pVpgMhMcE3K43rcEwF+WwaGOrF3TeqTOBUFriTV9fcoiEIB1GNZHBQ6t+nx
	3s/y3wADejeht0cBPk7K5PUUUs1Te4gTilPdaa3Tw3ux/phWVhLe+SkqrgnE0RqBwn7uoXFnimu
	dZyw==
X-Gm-Gg: ASbGnctLTcvc/b5jZ+t1x46UgUXiw+66Bi49VJjQZ4F6mIR0GpFr6YE93UN1teXKJoB
	K+H/kL6SCCLNbl9oyaEzQS+PWBxQsoETBV9qjMCYkViVKw+eKS05MGMjN3gH7jbQInUEyruE4vV
	lh2Dq1tqwGANcgPFIyC/zFgaz8Jg3nDeK44hmf1p7gCuFAaBp4lWi3mmbITmFbh3XICG/YAlj/O
	Yyl1oJOTfe0XI4tpGkVrJb/lMBw+pVpvN+RoCfRDnv3dE1xSBzDmWeTbBfO3QT1GbSNDX7BtRWC
	LjqLd2XSbafcyDvanmy9Gu27ROIvCt6apQ94WdCA+D3PWIz22Wuz185C58YoUV0y8SlZ9rzF5zB
	BGBjlnUF3EIpLcrA=
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-27ed4aab57bmr13504855ad.38.1758755949323;
        Wed, 24 Sep 2025 16:19:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0g9Ol1DLkKsMps31M+yJ4FciPrXl+4Z2aimAO1Euo/GJz88L49z9jFp2vZBDSGu/BXgvxkw==
X-Received: by 2002:a17:902:f786:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-27ed4aab57bmr13504645ad.38.1758755948885;
        Wed, 24 Sep 2025 16:19:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ae5742sm3780325ad.150.2025.09.24.16.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:19:08 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:19:05 -0700
Subject: [PATCH] dt-bindings: arm-smmu: Add compatible for Kaanapali SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-smmu-v1-1-c93c998dd04c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGh81GgC/x3M0QrCMAxA0V8ZeV5gHYjMXxk+JG3qgrQbiRNh7
 N+tPh643ANcTMXh1h1g8lbXtTaEvoO4UH0IamqGcRgvwxSu+Kwbeik75pSjJJ4CM0HLN5Osn/9
 qvjczuSAb1bj8BoX8JQbn+QUtQnCRcwAAAA==
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758755947; l=1108;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=gM91KjfpF6IH0eLa0TrXrZO0nOEVZnjXw3GmCGYPcTY=;
 b=M77WsMOYGM4ezbvcuE0+jwkiEKDZIc5oCGJ3kWAinG6Bm2tIh2U9P2cMYSNVuetK16WO7HN15
 E0WuBxhINLrDwbwXlqCX5PI3z6xeRZuWHmUVd+MZj4ScpV0tFVAt4xP
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d47c6e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=67qX4AuaID9EHpsuXEMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: qwDBRMHec86b0-zGdmI9NIv1kxEoESWc
X-Proofpoint-ORIG-GUID: qwDBRMHec86b0-zGdmI9NIv1kxEoESWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXyEH6I9K6+kS7
 5o7PYR45DbEYPZBLuPRlrLCYZ2CvRwy+aJsy606IQEypNTTkcKGpyc0vs7V9UP2UZShoMBpwyKQ
 T2txU1MO2Y13P+6QUB5LWqzzfOQeSb1VsJW1fP8ca4Vv+3oEF36zhvNEocUV9JnvfsPErkqtHM1
 Ga7l1oShD2bx6DZxOFSg24zBKkoSiDUhpHwuoAModQ+AM5d+cP6ZSmRIEcjFeQVgOjI25rl75rQ
 2QogQri2fhYYRVpr+31v4AhMt8dIzrk7qS+CXfjBloI7+hWDOqKl3kX9DH/y3DWO/+EqqY5VoR+
 5cKIcXFltWd1x9b9DVvz9voDyQwu/+CPe+809Pqrv/4kzHCgF9lZLUDVCHqswHVui4y2vCsIjpp
 LcvltYyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1011 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_161912_119051_AB5CB7E0 
X-CRM114-Status: GOOD (  13.03  )
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

Qualcomm Kaanapali SoC includes apps smmu that implements arm,mmu-500,
which is used to translate device-visible virtual addresses to physical
addresses. Add compatible for it.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 89495f094d52..261c4c699a60 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -35,6 +35,7 @@ properties:
       - description: Qcom SoCs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-smmu-fdfcedb91bba

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


