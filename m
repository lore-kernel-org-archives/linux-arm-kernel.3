Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B8CC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 01:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=; b=YEkdD7UIVYFELjdP2Np8+DJRak
	dFLn+GBnSPrO7W4ACX4lrz6WMBtyxw/iupPhjL8wBcHLPae/VRZ4gfVYGHC40+CZLkmA1buHFeSDl
	Pwai4YtDjrdNY+FQu6hxCqAKrdmBPAPM7UOtCq4gumyNhp8aL924Jyb+FF2mGAEK5lo5/T/4dwuDx
	BW3wkRhN+NHSbOrxs7dR91foN2DIGe94vmPbNokOt6AHSMwWBSuhwtIOjwFJNtOpuSAeBnMdrVNf5
	g1XFuCjcu2gnhzGrskx3DE2XOOjmnxgZRX5VE/gtaWrUjSxSEtWDcga3pDEUXiWXUG0J6lR0VOSPC
	Ub7Eqssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZwZ-0000000DdPx-0LC0;
	Wed, 02 Sep 2026 01:39:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ZwV-0000000DdPB-3heD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 01:39:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTIJE3588606
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 01:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33
	yjHOgIFA=; b=hgdSUzTVcHhP4DlNZmc7x23iUVor0r8ac9MbSBElB9ce0iZrqEL
	NHtZE6l4w/FiRcUCzkSl5CyC02k1v4K0xCBDg0HirNay7EwBdyv5IrX4nuzs3GJ/
	fRtIBBrdqYBPBVK16IGf5Bf1i8PVSw/gu9AP7a241AJHOHnSgQ5fuSOuDBJRIBRQ
	BrxQemgYCJMW7XBkWoOBQktuDrkLu5Y+t0G3ubEtDzwSE1ldl6jMpHfDOMhwK8w0
	kmoCoiuDRz/Sx/UJtTf2vnXz69wVZMNFyLiyb2Kx31LzSa+CSWn2yk2lhBsSoLJj
	AxOA1MLrAe17HHm3RkkOKn7OM/Pw4g2TwLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm3sqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:39:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so734190a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 18:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788313150; x=1788917950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=fkQeARzT/fu/7m4pZ85mkVfxKKEwJXjvRwS9C7yXB5U5HwL6mN4Wqef/M2xrYjcuAk
         MSUaLRytmqm1R1r9yfc9HinkfJIbyQJRqAM++PU179+xUDfUtUOIRm9XJz1ZACn1Tbc8
         /AQTujys7ryWROk3vIt0l1Og+an1MC5S7h12C8fk7nvwgVeOBClvCL3HEBSoRFo3zq2p
         djR3LfvSeTmml9Irp1gETXC1nNIn7l9JmV3y+0vQxga+YOb/ob6/xXV0EORtde0q0SpL
         TaWYjMu4xNNq7B4iu+tLf+m1kdwVFIuW6XfiTx+bKmS89cegfPfqL46HaGDG0i2Xh+ol
         P/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313150; x=1788917950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=VdWsjIKD4lmTfetEPYfcJcTGQOLvJgoPq1libwNOk6IvYir6pQc0ua5yasbVhQ4Els
         x8D7tLPolzGEAs1HbOD0S7QDHUDggl2NMgApxYH7rHaGH7RlGT+2DT7e0RRFbxo3pZ3I
         xjJ004LiVt97YaokV1eQA4nTjErKvEV66CfxasijBhVk0lzaQeYcu18EQJBnFYCaNz9g
         dVXfoeInhZjZH6R04Bm2FwUFG2yX9YUTEsj7QfSZUqypMqqFtYNLxWTgBIP98kss4jxN
         zaHdHVgNOX8pxSLEhoe7PcOnZiR7Sumb7rH/CQqHYsUREoYrrK9kWNRUWzUO4Si6E77g
         mftg==
X-Forwarded-Encrypted: i=1; AKwUvBwxMCiNmtEq7sMyZTJ9qDkBXK60kcZkKh6oBse+4XmozUi3g3Bl0ERH3V7Kx+mmJ69YhwJrPYwZUpa5eCSBi8Ia@lists.infradead.org
X-Gm-Message-State: AFuF++lsgJoZMIUUlpO4pK5G2u06oZJCj1/omsRry/+7cgN0J9eb3A10
	4/U6F5WvBV9nMkPUGRY6lxa2RmT3pnkIcFEyApOXaDBuCVycc0mHYbwG6E6k+9fLlEDVnIq7AzA
	+126liQHxo33JIBvH6BJfSZYS0tAl+FFQtXW+SR3HoKYuiTJAIkatodGjr5boVx8rTLgYDq5xNT
	CjUg==
X-Gm-Gg: AYBFou2JH2owwES7yjdE8iLLCY9F7gmgiLK0bAN0iNdxBK6aA1+A8Ue7pLyaZcfdEfa
	CFxSPI9nhL1x7sIHzMwmW4OxC4SlTXAV3ThFR/LjPqGCel0nlLay3/XgCAeAvzVYSPtjedMhyhd
	YYncrsLerAjjZjNBo+i3gOUNqQuenMeIJ19H5Hg7e33JYCKfLGkmRe0ftjj6pEHPZzmk4+23Qa1
	lipgllh0gM9Glcr4CkfhKQl44flMu87L/HTU7CqpYEpw40vWWpoyku6AiUggZXnUaYxZPYVqvdw
	6QdINplJZoRIX5oSANSiKEn4n6JV6SD+4ERt1eCLVeej1Bzeh/NXTr8jAf8N7WMmHbnMeakaOnO
	Zgx3K+T9rpQQuGoqSsPjWutNq46M7+7PrOlvmeYf7dif3/HTUZ8f/TROvMsJq
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958085a91.13.1788313149597;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958006a91.13.1788313149121;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm3140404c88.0.2026.09.01.18.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:39:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Wed,  2 Sep 2026 09:38:58 +0800
Message-ID: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aS-bdwh2sF6GcG29E3GwsMdzoNHgBASY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfX2+WdWBOiYxJ2
 p8p/AXDsDt6KIkfbfV8GSMhdSa+OfIIzOAP95JUUTBjlX0itF4skvfUIQR9us5RuAMNXH4rMRer
 yzD50iauZPsHc66LM6/1iXc+KTSw7AQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfX1OI/ggNvqsMh
 OspgJESM3ES+6mt4AZ2ppPwY+MeAJFW+2B2KRdADc6C/BuGomrNOWBzgOCg9BQNQfodPZXleW/1
 xu3umLYFnTAraO2gd7Rhlk4L1awb3u7T7uWxmYMJfuJp30ZpUeN0zWn5Y57xhJS3d787k2AVBFl
 p3YhFcrarypaTMFET4c72Uv9KYaijjrwZLt9/Iv9Bipf0CeGP4ywLngKfhAJUZOk//10QkZcm67
 qCGAdBNfBZa1WE/AHsa5VrsCwWZ0exVpemOKfbdELq/H16u/xedx8BZycPSIgG8n0tpcN0XqnEe
 e1zeB1FO/BCJExiwKwCB2VF3h4wsJ1nU2pDQYRV+E8EvETTCeI59ClbkkIJb6+f4KfyifbyH5cn
 JHEV2h7OfajbUJp2xupdHN05C2omAtuUyj5LIwYlg3wvw/OqRYKNisg0GdTfolFEGuqmgEGJ3s3
 HectaFIG91vnii4ddxQ==
X-Proofpoint-GUID: aS-bdwh2sF6GcG29E3GwsMdzoNHgBASY
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a977e3e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_183912_039896_48914EFE 
X-CRM114-Status: GOOD (  14.49  )
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

Add specific compatible string to document the GPU SMMU present on
Nord SoC, and constrain it to the single HLOS vote clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add the missing HLOS vote clock constraint
- Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..214a9c051588 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -579,6 +580,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,nord-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
-- 
2.43.0


