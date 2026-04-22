Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A2EF9B5E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAacDsKHAGzg=; b=UisZ5VzLffrnOxzvHazpCOrUTX
	xv6W5sUCeEjNOTU3zWtA2d8te9MjIr4WQ7hIzJ5DM3pzZebKtM6CTd67d3TKPdaonp21WQBXwA2wD
	QyOa+OEtdpMWJmCsvVRefcuY8qWfYphwBeDqOHbVX2W6Udb3B8yjULkfTKfVsVBL0HqSY3mKi5USQ
	MsGJwBaDUZBI+8Nvr7RcbR3K/Jg92vJjB695nTrirTdr6gXqXc8QRly18/JklnPYKKr76WWJWTBFF
	KnERUzEe2drauUPtKtmui+9NdRDIePHU8NyNM00y2CrmeQnu5SuY8fC7wbDemo7R6bcJHwj5mcK0J
	ZeoY4anQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT1j-00000009mcl-20Ai;
	Wed, 22 Apr 2026 08:33:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT1h-00000009mcK-1WQ1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:33:42 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5Mh2F3730787
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 08:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAac
	DsKHAGzg=; b=nHf8nnDFNaHnaHZt7EGeYYRErDn3vH2NPZ3WbhusYfIhjVT0v5X
	tl0fo6g3sdHzDDU/g57I+VbEd0qdp57tDJf6uEATLDJOK1WDfEPQ9F5GIELCzqsc
	x80yn3vlXIUHQbJtKCusBVYDcfG/4YO5C81pXA+51iNstNilD9tuUEKZaAJTxDaY
	7s/+tuXGaCMYyXyJ1GT3J9IZyK8UWpm8JA66yja23K7L+ZIJ+8xgRMPf3OyS/kO9
	0v72CVkAHBt20S3bzL8CSCIiyEPo6srNUh9gVuHLK2LSjRqRnq2Y5YO9z2RgWrMj
	NbTNdyE9IWT1gX8LJMdkim/PACXjQ3el90A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftfbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 08:33:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7989b7cdd0so4566186a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 01:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776846818; x=1777451618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAacDsKHAGzg=;
        b=XS5ViWlhD/1mHxWlvst+w1XqCypW/1CzKJAmVBaTBCYmAMn07wv33dafv3xGOAUoCC
         7YIE2syGxC4RIE5xhJ4VUhfY5tH8IAYm5GfvFL21AU7XIub6yYyFYX8dL5sBBgFqRwuV
         virr8+WIwYQJYcNi0h+eVBAHWmhANmVOy/yvFfm20I/ftx9wvPb/eN83Ep7Ig2a34JNh
         kooT1MOeQy3e222+yyeEXVOyDp+Ll0WI/eK8q7+dXN0FQbGI6Jh+0dqO9ZyIy46oBbX2
         as6nDCz8DqJmkpWgvojXKsTojzTmAjOeC1KZUlsm+qt5O1RuQj3JoKhRU8QrGKjPoE3J
         YQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776846818; x=1777451618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORoTDQr6cK4leZzidTtpiy+qFbY0ke5tAacDsKHAGzg=;
        b=giFvy0ini7NBcjwxuRjufIZsnJkmP9LDP3vFY2RqPlMFtwoQRK5h0T3iXmkZjL47yY
         /qQ+utm2OD9ZEnOJjsh3uu4MUQkzOB3aEoK4m/ihnN9gT2p8bGCtAMeaOiwdCoId5rpj
         AFkZZYtNbJLh4Y7CRZtdHI5axE/lmeeL0c+9qXgfHHB90RVPrAAtXfuOjptwo9rspNlh
         T6e2e+nitTTGOlKf5SfGwzASRndMsAmgIp17okXjyF6t/63iCEsZ8SZ/8lR+ce9sJN1M
         PeKWRrvJf9BrGwCjwjQLHV9F56Cvy8MG7KeE8Cc6Yr5NWrEcw5aPBcOmD1DVOa4UFlQR
         dHEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8acwyijkU1AtOlG7Vq+Lx2P6H0ndpll0XqaUirF0jw+8SaNjNZA0YwjTQfnZRzri3epjT8awHeTJsI5SkCmTQF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp4KUacEV7UjO448xsdmIwnKc8VZfYsY21VSWZDN2JdSxhs9j3
	f5H+u+a69fXCOEbWnPgp2dj6533n1+1X8PSXzZ05hp5xXEYu1tg1W6PkufZRYkPcmOh7h8re+BK
	RqIzsJtbGQmFBoL51F2QY6FFvWw2+5PYki7/c1Itcl9xJb+l0FCYpwsYCm7GVccdf/EZWJo4EqU
	y60w==
X-Gm-Gg: AeBDieuwxL4Rvk7BMpEN3bX3VmFIaQlejVYA6u5Oa0APoUxiWc+OI946+fqHOXjPDSR
	dcippS0tiEd5vwcYh2pIAPE2oYkL8MiISKw1pJhhpPCJqz2U8cfhUaRUOfONyz/POXCC6XnF2HO
	GH0uOc4XS/giR/1O9Smufclcnmm2WV3Ox79Axn+30/wIAwfoXHmeUrjECTeiJejd80RhgEbDjqK
	sLXxIl/Y9G/pMoNbEXwl8ZTKNZC4lrl/K/7XLd4v0uE5dqzJD/1wWy8+vGDVdRVdNr3ut4io2rf
	rppX8+ymWLC0e8AtTyVs6Yqs1RenXMDFdQdcbNqaVVCmd8BodXwr1hF3/22yykDXUmz5cCQA+I7
	ZAJrT0vWsDbtZQBntrkzbPzO0mGD5AHh9gcVpdLtDgLMrUntFkZTEvxgT5kg=
X-Received: by 2002:a05:6a00:2889:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82f8c7db2bemr22952349b3a.5.1776846818353;
        Wed, 22 Apr 2026 01:33:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:2889:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-82f8c7db2bemr22952305b3a.5.1776846817705;
        Wed, 22 Apr 2026 01:33:37 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981c12sm19736603b3a.6.2026.04.22.01.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:33:37 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Robin Murphy <Robin.Murphy@arm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm-smmu: qcom:: Fix Hawi compatible placement
Date: Wed, 22 Apr 2026 14:03:29 +0530
Message-ID: <20260422083329.885979-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OQ79DEdRUzd3EulBziH8k7UJGUWrv5Zf
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e887e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2dDrt6dFNNLvW8Gx2gAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA4MCBTYWx0ZWRfX7LA66UTBe280
 4JjL/B5BvieoYT7+uS3dQXR7iyRAtr8Oaus25YFbIF4NXSK+CT2giyoo+5/+CT5EEfs3CPkmAP9
 GaQWvw9MPv5Y3n/viMPn7Kil/TznqzdGQulL2JjJ92wLNKuEH98+g28iUrhBL955Ycr7Q81GZgd
 0GmvJXUPL1LyEv/AwZ9VE6nsGAzg1XbOzEvLuI4dL7oem7GB/inIVGMZjz464T6ZATeP6j6dqwt
 iTtVrrorKIdX6vfOcSFw2rUpF2IZ22jTEl7ofad9U69K/xMVX7EzuRaJALUTd/9Gdo/4bphQ7mM
 wpQ1Cl51+vJ0swEyAWzOAUjJxxdQ9P79tY7bgCEpu8GpwuD3UYvw3b8OTowX5gFQIxSLkf8qGjt
 YCtRTqKE7+NswAJ2d8H6NNxanwDrPF64oJ0MnHcUV0OqTxJVa1LMowUBbhuVU9gQWNeYmMWranG
 ezHgRETQ+pZ/amMgfbA==
X-Proofpoint-ORIG-GUID: OQ79DEdRUzd3EulBziH8k7UJGUWrv5Zf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_013341_523290_19D21495 
X-CRM114-Status: GOOD (  13.11  )
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

qcom,hawi-smmu-500 was placed in the wrong enum block of GPU. Move it to
the correct location alongside other Qualcomm SMMU-500 compatibles for
CPU.

Fixes: 5e8323c3d528 ("dt-bindings: arm-smmu: qcom: Add compatible for Hawi SoC")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 06fb5c8e7547..ba9ad1f5a8ff 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
+              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
@@ -93,7 +94,6 @@ properties:
         items:
           - enum:
               - qcom,glymur-smmu-500
-              - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
-- 
2.53.0


