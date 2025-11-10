Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE327CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=; b=tLkgtujNqW40Y6l8Gc0kqQCiBG
	wA10PUN9mVDjQ5cp9vgYbt/xL3F/nurZfJ8C/iYaFHxobzCHT48OSaVQjKf403CLIjBbZxKmW5FhY
	r98Yy/JET27DmJNKil4wzN7+T8S1S7MJJjNwGKq5P5p+OMh2NBb25nqgEyWxbz9SIDq5r6C+tZ2w/
	tZNzOfSTbNBd7AeWgCHmQ/B0YQh/ni/Y9gveJCMOKaD8CtDZLY0Z4BfyA3oW8nLCfRdMb+iVomB59
	DEULO7xHuR+acJUhI1odUdlXCbhMlYg7RuEx64qlOdxlvRUvmFCG5BilkJcjPxjy9AoNuWJEHkirm
	JiPc9Uug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwi-00000005pu3-1XjK;
	Mon, 10 Nov 2025 16:40:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUwW-00000005ppG-0qaj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:40:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAGINlB2868016
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=; b=BkyHWAyJEbEj1Kf7
	5qUO9kdpU6Q/9UbvpvsTyHJ39ZOeI2MRNpXnJaQUXsm5g9sVIg75ajCTwI3RChyC
	sYOfyBwNRjbFV+GiZo1TNoEuwP0pxYtPZk71L85dTL4NOoVD3eMf2kVsTkcsuoY/
	n+eZijX6DcMj+LmlINZaeDdMPdkFn3NocFqjGldaKuVSBKh5MgUsUU/UPnGS58Cj
	aSHqLKMdDner/Iu+JnY0wkKz6Q9Abb29pE2Sr5uXN0e6f0nQn+7q/M46YxpxBpBE
	0PXXJE86u8oR9CBACBe82+DgM3FM6YdDDx+MTRkL57pui6mYaevlv3g9v9gjctG0
	yLP97g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd761bg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:40:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341661973daso3663572a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792835; x=1763397635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=;
        b=RsA4hq6wnAK+pajpfqAZBh12fx+2mzIYukGNwf5UV+OUnlgRysyBXvd7xDer5Y/YXC
         jxoP/OH5SYki2fkqubzsTHluhHBWmYbaiWU+OTmKoKt5gQNkflIs0IBuBT2mG1y+YOYV
         8RMwHk0cLD/Dmuvjz1cZ+RqQKzZ9ZPGRLwgBBQD9UGB4fyyCTHTo5cehgXCUeZ5nQ+Sj
         hcfkwOIhMQ8ReHv2eGQ2/SPk5JS8xA0OkFRdRsm8moNNw9USGUx6GZnnl3tEBvmGbf27
         OLSxUh9yzXXYs6HdEuTQi2xmSa0IxBZgD/ZVPrzmFmYWAS54FjQdHOIriAVe18TbDwwa
         nJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792835; x=1763397635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tB9D/fdcmRiky3PhS+srVAJo4/Iv4jc0qDMbbq5Kk+Q=;
        b=ImRXi6qyWWqVup7eR5Zlh/mlJv94o99UwuOf40eN1vH6Yqd1Mx1Yy0zOVCGGELml1l
         DPMf6W1s/62I6vv7Vexwwi9i1mbypHomxplFkXOZlEbFkS9R0YjTQ/ggbd9iXZkPOKJO
         xJATpCOGKt70owH5bAWueFdZVd+YkNAJiIj7UpbaeKYgZvOVKIFP+iBK6mMHKIzJumdu
         ImhfhiuuUI0m5aaql/s4LywR/DMqRxxoXvqRFH/7A7waXKIgcGqZgDpOG1PSxjgUvZyH
         8S7TWuw52HPj14ff9eOamY+sXhqCA5AunqVdlTWApUO1DtXu3PsUeiAzfTV1onuO0Vbt
         tAEg==
X-Forwarded-Encrypted: i=1; AJvYcCVnXiHdpjhOOPw5XVBbVTrgn2XazIxAyI+ddl0PlKQhp1u66JEx6YylpkTejxsXL0ERkIn+PthbAYGWvr9Mecjl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9vm+xRS9Yo2WshmkVKThkNDttwIdnsjXx2WTKFON/ILhn8Qzc
	ggXQTPIqvYEN9mJe9ds5IK4B87m6fB2Zprxi2I/ePp4FD1fyZR/ztt+psAsvzL5R0FhM1g9EwtF
	49hZTT26X/6pwQIZAOp5RzU1jrrxDE2goxDq/cEoMAhUw8J3fjGvHJOJ3YZaVOn8gPZrFGLySK7
	vlQQ==
X-Gm-Gg: ASbGncsBFJLKS2FMf815C7cgvup10rJ4T5CQfNSF+Pb2XwZn4Wric8JSuwOAZrKpoDB
	zFvrChePitidh+g9oOwV257zR369/G3ntF/u3nyrUyTCj9YnW0VfrjHOeA+XRflSNbzjZJSD2KW
	dGp8B2/se5D8+IBXIrs/0LLQu5AasxuoRtNTU/egWtmqZYyvvTedgwinA64aBv2D8UegLDaILpf
	qvXIBY6jv8Eixq5Us/iydGOt/eBgPYyh/0ub2y1VZzXeCJI0tj/FZA1PFsoWLX+fimxV7YJ3gLm
	9QKyQD/6KWOSRWivDMEq6lF7EfTbvOXi5o0nplnP3G/k0PhpXsgBxVQRgMbCheG0qnoW/R0jmyQ
	nj7SRjwOoqssN45gcwrwWAXE=
X-Received: by 2002:a17:90a:7786:b0:343:87b1:27a with SMTP id 98e67ed59e1d1-34387b10381mr5172071a91.10.1762792835073;
        Mon, 10 Nov 2025 08:40:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWFnJwABxwEcbzLA4NNn8jcaHApPxbRaToXFtfQE+N3nOzqp3Zff9UTtgGElCKztEpfLbq5A==
X-Received: by 2002:a17:90a:7786:b0:343:87b1:27a with SMTP id 98e67ed59e1d1-34387b10381mr5172042a91.10.1762792834452;
        Mon, 10 Nov 2025 08:40:34 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:34 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:24 +0530
Subject: [PATCH v2 18/21] dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-18-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=916;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G2l2DvQ06Sbowus5yA4dZFnVkOMl0ih94brxKuiwNUI=;
 b=i58PaWIJhvP983kaIcMBq4mEfOd2Dd/WK27M8EkgEPM8e2wRt8CP0MDcNjfuquTO36mYLtIal
 +hsVHf9IYi5DvmUiLKDu5icK9arFAWOyRczHm6SeqUfsEgpnR1BfIU8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: HNi6HEOx3vVyvuKCmnjivtit50knFwP3
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=69121583 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mFHhPm7ftKKhVARBLukA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXyZ7PGELzJMHe
 hs2/K9P/h/ywHwds/QVs0Ry6FNHaHthc0CdqJiZzZHO/29h9HkQ2AfKsA4o0smVtBZ5fsajWgdR
 Lrl2yK+v1nbyAngUtp4sDSiaIsR19+A/iWFnFjljMqFPl4h1SeSETi0npH1Z6Ch99Y2bDQc5CMs
 kBPxRqADyfMKqEU1XRdXEldj+ViZtNwp2ppOgz1g+1+1KZOQYeF7w0z5ZOXaEJGLYlHc8RGKzL+
 5QuAQTmzdYjHHojcZGw0xqKSSu8uEWMvjeanO5MPM0J4iOUd2QIyGVQQT3ndW3sgojIXrYkAzK1
 Lrhc7WnKt5uqobrq0tMT/T0nklC8dM8fAVSgu0XQTexzIQyICWTRvmL4C4eE9ludyZg430TJZjy
 Ke6/if2+63mtJTY3ieac5FIWHfYRLw==
X-Proofpoint-GUID: HNi6HEOx3vVyvuKCmnjivtit50knFwP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_084037_728174_7C8E8EB6 
X-CRM114-Status: GOOD (  12.41  )
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

Update the devicetree bindings to support the gpu smmu present in
the Kaanapali chipset.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 59bbd20992c9..14a9624e3819 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -91,6 +91,7 @@ properties:
       - description: Qcom Adreno GPUs implementing "qcom,smmu-500" and "arm,mmu-500"
         items:
           - enum:
+              - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500

-- 
2.51.0


