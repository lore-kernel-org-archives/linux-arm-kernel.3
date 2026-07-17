Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439C2C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=; b=hNGAcbJIslHoAN/pdsLxChQj31
	BeQ7DrSKbSP5gIvrfHod9OmcLuKW93mVeY5zl76WoM7kCcFMm25hjK22lETGcZERqZmOfPFX5+XW2
	cd3ctpYuuVbq/eNclXqcN6k4Sv4a0cSDv4+OXu+YWB2EMxYsjqyuEdltjL/kXHi1jaXZhCN0SNAKU
	pqyByxYVtmAO+KE5W8yAtO/bX4JYg4o1NKerik38JZeivA5l19BTw5QUnjnu9spYEeFpSYSnpKkI7
	N3GI75lcsZpXDANIOdp2ZVXcI32Ep+ZllKThPk7durC/GgPfbdhP/6iUpJclmiEUQg+T0lO2E89mW
	Z9T2/XzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpO9-00000003DTO-3kUh;
	Fri, 17 Jul 2026 20:42:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpO7-00000003DRr-1rPT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:42:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtMdp2906085
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=; b=g++Cc5C0YYJJ8Dk/
	LGGXvFZII+10CKTxAg7HF5JIbEdKqq3swihLsV4xu75qj91gk24AjmkNlMAn1T46
	bKHViNP5g+EgJfvw4HQ1Yj6S5B7PgNsc9MXj0nMUMawOTNXcLHN9NjGYYK9sB03I
	jVpxCcYB2HE7oW/VC2M/v+n7bqZAnLMLLMxBfXh0bRSOo9HWNbmH8fKe7BFpyVPF
	reeNtbuuZSEuDFa6IoC0ps+qDgUfO/hMOfYiDLQmGlLpRcGf7StQ+eXTkkeQ90he
	LaqVIZsYu1Z7UWm2FUq0fGUDMsQu30VBdhmw7LEQDizPgwI1hrIgt3Oajs9+JBVm
	XJOrVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffrsq8qj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38c7e26ecabso4638210a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320945; x=1784925745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=;
        b=J1NdDZnoRvenCq1RD+t6LH+nSgEBueJ2HrbkF0eptVM8gq5/0y/h6bAX7sGyCjrXzv
         747SDZ4GJcMyXoO3wa50T/I6v7VI6u+2InW8duq41z76eK8O4Xqs6OIYd/HNcAKvkBDb
         piT3KAhS+WAqHBvdvuvuu0BLyIHRpDkUR3I/5rO0CnS8IgqTuCo0CYyYP+dDNC6KMt9B
         XNKL3Xjcwc8s94ercE6b0SZsFG1IQJWFM/VeCEeaf5VeShppzeYQSKBxhqJfzCdHl+pr
         +02Br/h+NYdTuMaqiJoVmDfAL+MaW2q6PHefc+3gi6StzEOC7A9QlPr8s0NPxD5QmmNL
         NSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320945; x=1784925745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jhtEkaAJenJ0hU5bVGOGxpv27XZDgT+ujwuT8/gsZBo=;
        b=KGK3PHxYZrJ4VINd7h5pr4fAfzCEjhT1bXEngrmI+RBifzukFveaFaBidqC9/LmJ51
         sOGeRGKQcph4KcXRUPtaPScQRwvAzHm17pWkpBHUZ0XSLK3l+U+LSED6deVowJsh3fmI
         NlQKK1xu7BT86jVMfo5SMLmRt44kdQtQThxP9fvlqYQyecmMyNrM0YWjJfTu1UY2R3rT
         8WJxl8yp4s5u7Y8ZNL37ymXuY3buptn6TcRrN035/HKifxBiuaSAsMRKc1vERs2BynsD
         Mu7pF21JU8FqFjKC9F2BuKqDW5GBmyMl1YTs5cFNYJ3/RoJFruA/CffYAe3l6n7vVIK6
         BM6Q==
X-Forwarded-Encrypted: i=1; AHgh+RonU3WUvwYT0r/gwr7w6m3W1PiZmGlqk3gc/pBp1N8bu3+NDap84EFAzkJdhZXJbqLrhbPFdoZzuCS+NTuyXlzy@lists.infradead.org
X-Gm-Message-State: AOJu0YywyoLSAXzyckKw/ZNniY5bhVGI8qyp8IZpr2iGNTRXZdJhHRjx
	BDxqthwoYRjCw/UOocI1Ec+SickaXXCpByQKyDLT7i2Chi2uHiOswEjryAcekhAQhzTDNrv+NBr
	iWbM3YO5ZPEeKWJdg1lYvRNmU8Nf12OudZtmbIJDeCyH59kXdO4S6OV7g+MwNOLyWXcAr/7+D8G
	byFA==
X-Gm-Gg: AfdE7clLY3cKukI4qjheV5NsukK5X5nGZ4DBbdDw8A7jKkjRcYTSbNcwg+g0OIpuKeH
	7jufLBpOUxdCJfGrPMFYqT1Wf9A/J79eDXaEgXX8HNVL23Gej0sCakmVFPJE6HPZlY3lyMCgMoo
	UjbNcPohtSLlE+xx28+1WrBiu2GnjrO358mIaoM89eV9rpRBMy8YR5OTIS/b7T5wIyEE1JG28CE
	s3t2q+Nxq5kO/XBaJZxgzifzIV4Fy3MKwWW/8das5XP99sfZP8MdUjBLhAt+1QHrZkDmq1872pH
	sG28vDx618CW5QPkvlNT3PcQ+bjYQJsw1Xczw9mQ7DjLHEcKhdqutMjqClEgr/OG0QNRRz6bnLQ
	hCJpBfE00tvl2VpCT0QBMS7Wz
X-Received: by 2002:a17:90b:3f85:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-38e4b3dc094mr4230474a91.1.1784320945467;
        Fri, 17 Jul 2026 13:42:25 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-38e4b3dc094mr4230426a91.1.1784320945021;
        Fri, 17 Jul 2026 13:42:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:29 +0530
Subject: [PATCH v2 4/9] dt-bindings: arm-smmu: Document GPU SMMU for Eliza
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-4-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=1190;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=A2VsonGAk/WOFU4rW5YOJ3BUlJlJl5QyL5jYHngu07I=;
 b=zrhPOCHooo2chb6Nfl5XD3FoSGfFuqiqKsCyL8WnuhUoa9KSgaCthbOm2ZQw1aKW/dQRH6TOg
 Li2Lbjrd7/DAd//jYP+/4uSrdQB0BTkMd/1iEzhPHbwlXmqJKEUSKvp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX8dB1vwSOfa5Z
 8qnZLAMKHcrni+fy73CS70pcarH/wnjoDrw4OB9aBT9RjSTPjnn4VLeSZJkDkQYRTxIXMd+MH8P
 ziLeXXy2fl2CwK2xJBWpLcrUspPLULk=
X-Proofpoint-ORIG-GUID: QEDD-nRJfFoEtp5qusQxluPNZHfRqOgk
X-Proofpoint-GUID: QEDD-nRJfFoEtp5qusQxluPNZHfRqOgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfXzuV562SrsnaQ
 /NkhpGfI/WKUTBpk3Nh4s3MB/7FBsjIEt7q5oOuYemZcpD+sWLzyOUHM0S3ZNYRpKga4+Utkw6p
 KJJD+FjFwFe/pZ1dY5VgVoYVlMjSNYb5k9LZL+zYTpTdwW2Z+/rJU6KobLdR9ZqwOqUZFwwsMUI
 EccIrfKPldhFEzd65xrofwbxEtBdVXFBAYWUfjyjdojm4IuWN8pF/GWiAcfH5G3EuNW5931pN1Y
 FLsOByrT/oqW9A/0fU0L97KbqbqicRgb5asM1LJumS3tkokBRVMkW9+hpaXrXeIu+nFb3h0qEiv
 NRarDTspqSRzrH8gp0achLZhYbvRTwJ2F9RBC0JMLxLCxa01ez6WIKFc0jVtu55hHJb/coDN+Rh
 NvGAplyhTcFcqR6WprCMaK1kg8Fnfw/jsMUQXKNmE4bWgezrN6f2Qe+JR4IjSxDXbr3CPqz4Yy/
 8CpCwZkfeHnb6jp5LiA==
X-Authority-Analysis: v=2.4 cv=OJIXGyaB c=1 sm=1 tr=0 ts=6a5a93b2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134227_661828_8E7BA446 
X-CRM114-Status: GOOD (  11.15  )
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

Add specific compatible strings to document the GPU SMMU present
in the Eliza SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ed556683817c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -95,6 +95,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,eliza-smmu-500
               - qcom,glymur-smmu-500
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
@@ -570,6 +571,7 @@ allOf:
         compatible:
           items:
             - enum:
+                - qcom,eliza-smmu-500
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500

-- 
2.54.0


