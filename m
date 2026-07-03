Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2792C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsqcPanR1sYfdIVIFKnMQp3W9jlppvlZVAC/PYjhq40=; b=qQRKEi1fiWfr7s
	j96oxOPtimGEtqXMVmsUQggeZHF5drjN5PuWSJ751YfkYc8fuWUKzrVJHCeaQSXcE2hisrwAPAT/L
	r1p9xiJzG1KBTSNdMcHNADQy6guDbVYD0Xys//lPGBkGFgS9v8Hshlothcm6sYAwyz3AXRuTXB4/9
	AMsQ/Ek+XQfj5/TBHx/xQV5WhGMnqnziMLJ3wTXsHrOjJ6rDOjNCLWllE3b3SebYes4WYqUezYlq4
	0B6JANdBjsjr9SXKNHk2TaHiBQC+by+pS/OORsn5dQ6D84xSIwI7LM7PHqwG/5ynPPqvvHfg5D3a5
	odKQwOK+RQzjVptJ3ePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkba-00000007rsO-3Al2;
	Fri, 03 Jul 2026 20:35:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkbY-00000007rs1-1Dn8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:35:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPasx837944
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xsqcPanR1sYfdIVIFKnMQp
	3W9jlppvlZVAC/PYjhq40=; b=YN1Gzx2Wdnq1qGQ8sDcy5Ow8u9r1VESqJpr+Lb
	NLP4QsyOuGkTT7iDry/WSvYBhzoL1iolBtzEcIO1IcfFCQobXNkJI5z1PRm1rJNn
	TfEr8PVMO1yqYiwWhpAlSQkGPJ6uHNOt3IsnMsDOoVom98kEiavdLpJhig0f8n+b
	MHUKP5NgzWjuNC9k3g+0QdhZd02b6g/JtzCkx9Dth/G3CQ4YWJzZ40uDsCfBy2U1
	1rDA1X6mq2bMZhWHljRBdP4NR42UTVtPgCOTqc9e7+YTHOoxJnFzBD4+Gcns6IuN
	Ixs6wC+Fw/6mKkq++dYEpbu0kiSjVbwXfR1BoGbrrr8dhN0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jytqvc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:35:18 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-383b6012ba4so99002a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110918; x=1783715718; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsqcPanR1sYfdIVIFKnMQp3W9jlppvlZVAC/PYjhq40=;
        b=g5srtiMUs1qpskw6oyZ8q0EeggT68t0eMNRtLy3ETxwTxjl6fm67wnlJNQf4bOHf6r
         iqPQxhvNFS7LtRmZz31FrsIRbt5+du8C/nyXb+O37zp1FkO4co7U878iF/GfENAhal/f
         jNbskMDs4xn+451hUTt+Ok49xKkNdwUmx0d/iCeCPaJppGAD5n1dCz9CQyFNdLUVmNeb
         IvErAKWo9LfH4yBgR/JqMYjfxnSjQK1+AWkoN2NyKqN6DVMZj28Lz5myooU92xKVf/4X
         f82clvmk1qlakuUeVkc2O8pLcUN5ScbyiH7dayAHDTObkL4F5Bne8WRMVWjYQJDLk2vw
         N0Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110918; x=1783715718;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsqcPanR1sYfdIVIFKnMQp3W9jlppvlZVAC/PYjhq40=;
        b=pr5gzkZ9+uzMPPKFLYRlz2sBI3pwClvrb67zHOCH/+LxWFRD3QbEA7TRjBsuEzjbSF
         EFTp+3BJJV4NPa/zW+wP1x8SN7i2vL5cXbI62b+W/wBZji5A+Gimg9sM5y755ukY27lA
         T/1F1ev5MwMKMzdIWfPYuNqwQ/kh/RnmovMYvFiSE3f9tDBNAFUU268GgZFlFCVde8Iv
         2JCVy/vBIVxt2UXQyL5wHn07f3L9cWJHBWA+GFOyVAr7OjAp0Q7GF8GydrzczFrEcQmR
         GFfmWpN6cP9i35sLgcvvRO25aHC9b1oBKryoKxXWQUktIpxM8bKtbI6wX+1GtyEgaJgG
         ZCSA==
X-Forwarded-Encrypted: i=1; AHgh+RrJHe4x+5xb9MeMhADLJfbTi4+yqLu+82+9NAophHlts9ns7ag9zxAj13FBQSi2Q5qPQkgX9Zhgrb3LEqjrp4ls@lists.infradead.org
X-Gm-Message-State: AOJu0YzY7RRn1IfG1JIyZ+PMuQbH7PC+BrfR7OsDB4m313jKY+eXWLNH
	Y5Oz1B1PecpuHkug90HI8wyTNmgmmkBJEMbg3oZb/tKTfnDs8FyF9SAfLqr7JBKASBAde4umKKJ
	O/vzWGMxUygK4WrB1RElNlBeQ7psUtR6tdlcNuUjiLHW//WngcPMwoKMH3AH7UD9JQen9XCbJ8a
	hq7Q==
X-Gm-Gg: AfdE7cll0kf4FZd82oRjchUwucdJAicW9BFDU/OFV5ohr/zH/OdBpQleZyU3DlqquIn
	aBYASEzFG4qfzm941l669nUQiv75T7/qGVnj/DDwypiikiLt6t3RtASe3Eb2crm+8JEDxd6U10V
	jJtXB6DMga9DkHI0HIPky8ZmC9/84lyDbHcNJMfehPdD17+7vqIHYEAMCAggl6b9SUQDXLCOopx
	ZuyPyNkL6qYVeZbV1TThg756KpIeY14/Z4MaSEIj9BGk8jC6NPUaxTJjMXupvLQbsVCSOVaotIQ
	fSvVyulrfD6h21ZShk74HkCqJVlcLbwfBtAAWNKj8PKHKs4leSuG52G11FsbTYmzsgaKBq6IpXT
	3t0zS/tKF+S3OXstwE82z9/YsN18F8loO0ZU=
X-Received: by 2002:a17:90b:4ec5:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-382808b3454mr824528a91.9.1783110917775;
        Fri, 03 Jul 2026 13:35:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-382808b3454mr824493a91.9.1783110917152;
        Fri, 03 Jul 2026 13:35:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:16 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 0/9] drm/msm: Add support for Shikra GPU (A704)
Date: Sat, 04 Jul 2026 02:04:26 +0530
Message-Id: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMcSGoC/6XU4W6bMBAH8FeJ+Dwi39nYOJqmvcdURcY+J1YCo
 ZhEnaq8+ww0bbIxiXVfLBnBj/ufD16zSF2gmG1Wr1lHlxDDqUkb8WWV2b1pdpQHl/YZMpRMMp3
 HfTh0Jt+157wQHCtHxjOvsvRA25EPLyP24ynt9yH2p+7naF9guDrLXCBnuXaMmLamAii+n2JcP
 5/N0Z7qep2WbNAueCdA8SBgEtCjAy6U5b76i8DvBCwfBD7UUGFpeAVSEcwI1yliR8/n1KZ+ypl
 VJlI+3BT6zaqhlz4ffcVwaElNMZqxiZvV17fwHy+2Nu/aOq32eIj5pRhqEJZ86gQS8T9q+DZPF
 ijfyG2wdnuwp8aH3dBXyG1RalehY8jtvNea3u5HjUpGRmnBKl2CEkJbsgjGG0mahODEmAIp/Xw
 VgrNbsFBTnVehcaG5lSG1ksi118wvjsXgBkb7m6e5U954qFQpPuH1NnaPILPApQPNJV8Myo/E5
 IydBhlLVXHkHAWYxRC8V+b6aQ6AcXIoTVmgXsooBiALVsBaACIWOuU6dCHuG7M+nDuTTjr8k4V
 KFGuRThaY/A9LMn6bT2pj3B759L1xi8QqpSWpcnldeNeqGqZueQ1grEaFzC6X+LsUYpu+wvQjS
 OsI2jQOJUonXDF3ik/X6y/JdGQjOgUAAA==
X-Change-ID: 20260609-shikra-gpu-5432bdeaf0f7
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=6744;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=cQJUfOffyGai9cYWh9giX7dcXXxXozL8g2Y76wATJv8=;
 b=6MPdCPLdvbaVRwPFgJwT8h7lc54fKYZDTWvxTXyMLEAx2uxd046XLBzjHsBetoh/wFXk54uxn
 PBiu2ywmBWeAi9C5n3TB6+M5jYuHAsz93EbDcFgyBNOHJl/bm9YmecI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXwzAnAPT9LvtM
 OW4X8bgydOMIya5nSC8UZoiVccY3pjN6RjMDeK+wqd8LF37U46/fG8HBpsSL4V4xzF7uLmgEvxh
 HNl7vZsPnIC7X/ehKsrwidULeAukkDH/yym+4kQdYi9hPKiGSooBLjHvvMUShHvfpqamlB5cACa
 g7KjsWj8OCUQ8XagsFXscw1oaDN20w0u0jL05Zlv9XinEfHlMEcGOHK0kbnHM34cPkndLtVISCF
 N6UGX7MWJZrH1k3+S8L6JRvPBG0WgfcgB3SXMzd5n4DYqRg0+XNYQEdVP/9vG3yIa9Gjdo90fSa
 g51zHAYejtb4s8/4UzuVq433M5QP1Heis1tzuqFlJyCB+2ZhcLL0JDP9X12mOv3gJY07HaKm25K
 iknsuSdPEH/12XYsFLjEPGNo561yaYKwdvG8suY86I2AjkhotPlg1BXUyM4taGNDbZ3L6Hp7SZs
 r9EMWYZcJjYfjT4MSvA==
X-Proofpoint-GUID: t4fxT1J2s7DRmo5sKvGVT7ZCf7LsKMzU
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a481d06 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-nh9RajweDyCoOXDqwUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: t4fxT1J2s7DRmo5sKvGVT7ZCf7LsKMzU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX61EZD+SCocZE
 zP9dU417zRClVLABCm6PNr9zuyuqeHJgqfoOEv8tK1umyH371PmJ7A78HuwFFjdJr7VYd7fRIKh
 AzdevhoaYD2IZtTk7+Itd3mrU4yXzbY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133520_345421_4C2DA056 
X-CRM114-Status: GOOD (  15.19  )
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

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very 
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Mesa side support is already merged:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41762

Included the DT bits in the v3 revision.

-Akhil.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Rebased on top of next-20260702
- Included additional DT patch for gpu cooling
- Link to v3: https://lore.kernel.org/r/20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com

Changes in v3:
- Rebase on top of next-20260626
- Included GPU related DT patches
- Link to v2: https://lore.kernel.org/r/20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com

Changes in v2:
- Add a new patch to document the GPU SMMU bindings
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260609-shikra-gpu-v1-0-9d0e09cab115@oss.qualcomm.com

---
Aastha Pandey (1):
      arm64: dts: qcom: shikra: Add GPU cooling

Aditya Sherawat (6):
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      drm/msm/adreno: Add support for A704 GPU
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
      arm64: dts: qcom: shikra-cqs-evk: Enable A704 GPU
      arm64: dts: qcom: shikra-iqs-evk: Enable A704 GPU

Bibek Kumar Patro (2):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC
      arm64: dts: qcom: shikra: Add Adreno SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   8 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 143 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   2 +-
 7 files changed, 170 insertions(+), 2 deletions(-)
---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260609-shikra-gpu-5432bdeaf0f7
prerequisite-message-id: <20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com>
prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
prerequisite-message-id: <20260526-shikra_icc_kconfig-v1-1-c589db2d023c@oss.qualcomm.com>
prerequisite-patch-id: 028f3a3c64f57a611b6ddcfee947c56aa6251e3b
prerequisite-patch-id: e80ea7940b9817449cec21afa6e9e443e007166f
prerequisite-message-id: <20260430-shikra-imem-binding-v1-1-c6976239f90f@oss.qualcomm.com>
prerequisite-patch-id: 80d8ab865b7b0663c5b2878b45b55e2e4fde9c19
prerequisite-message-id: <20260501-shikra-scm-binding-v1-1-93d7faf1b784@oss.qualcomm.com>
prerequisite-patch-id: 8e645e1c6ad6182de4813a726c293654324de1df
prerequisite-message-id: <20260501-shikra-tcsr-binding-v1-1-0c136d193634@oss.qualcomm.com>
prerequisite-patch-id: f6781d2cf0829ccb32f1400623c95739972f2ee2
prerequisite-message-id: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
prerequisite-patch-id: fb821179cbe1fb1a97b987d04acb5a656aee9c14
prerequisite-patch-id: 1981818fdff444d3bfbe15f5f52a654a73b91c81
prerequisite-message-id: <20260611-shikra-dt-v5-0-103ed26a8529@oss.qualcomm.com>
prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
prerequisite-patch-id: e9f8fc7688e5b366cfbd2449856c0aa524424051
prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
prerequisite-message-id: <20260701165051.4122259-1-krishna.kurapati@oss.qualcomm.com>
prerequisite-patch-id: 0cbcb69abbbf83da785619c266c96af624c38a87
prerequisite-patch-id: 1d1ae48f09e537312052f93bff8d04093addc996
prerequisite-patch-id: 6126fcda921fe53b86b3a18c649fd8ff2e1f43d8
prerequisite-patch-id: 3a0482207e363349423f81ee7589328a84752de3
prerequisite-message-id: <20260701162745.4043106-1-krishna.kurapati@oss.qualcomm.com>
prerequisite-patch-id: b4d2580ed983cd0262302ad93304dbe5398e5d6f
prerequisite-message-id: <20260603-shikra_epss_l3-v3-0-3c2e0b796e78@oss.qualcomm.com>
prerequisite-patch-id: b5d7f75df02fde56181f576a936baf09d0a72276
prerequisite-patch-id: 3ce52e07ae57139c2e2b71a29ed7d7250f6fcc87
prerequisite-message-id: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
prerequisite-patch-id: 48ecd66c06c4fad81f91283c26ec57d95bbde29d
prerequisite-patch-id: 7d92e5a301d09616840e54dc9e4a81f30a64383c
prerequisite-patch-id: be1a16f53e23dd5ab90210a056c9da3559c6186d
prerequisite-patch-id: 3eff04500c55100c763aeac1f1f8c5768d500500
prerequisite-patch-id: ab22c5fdb2fa65b78ffef76bbe4459c8d5ffe7b2
prerequisite-patch-id: cb24efedb648271ef5c60ace96e2366d89254e8f
prerequisite-patch-id: 8be7df0395c5847a988c7e814c7db878b5932b11
prerequisite-patch-id: 0510992d022cef7317b6efee6765ac78c0225356
prerequisite-patch-id: de4327fcbe81f92a337f429b74e8220969a5b79f
prerequisite-patch-id: 968bffc36646412f8289b917f37e762a4297bcc8
prerequisite-patch-id: 35944403bd4480caad12657342da15ea71c6afbd
prerequisite-message-id: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
prerequisite-patch-id: 23b24fb512c882a045ed8339b22269bfc2c5d02c
prerequisite-patch-id: 0e79e46bc5a88849a2f0a410b39c08f3244dfed3
prerequisite-patch-id: 17b412a37859fba801efdbe451db31e5bd77438b
prerequisite-patch-id: 0396ac157aba73a5afd7ba4a8a744847f5a7b433
prerequisite-patch-id: 2b1aecd97b9c073a1b323138cd7a98cb34e3715f
prerequisite-patch-id: 823bc7bc713f6fce1b9de47a266307f1829636b9
prerequisite-patch-id: 1b990e46422307e558300815c1166b90d96fbb9d
prerequisite-patch-id: d78e0b95758b82977d80c7cf18da49661cd181e5
prerequisite-patch-id: f62b00cd64ac3191e0906514443dd43e88746818
prerequisite-patch-id: 0fab99455f954a917fb65348656505cd7ab45bc2
prerequisite-patch-id: b59fd05f9b62bda86079c9d86538b80289110862
prerequisite-patch-id: 71691d8b40e36cdbff6a52c3999ea8bb2c164d70
prerequisite-patch-id: b2868bc50d74afd13c8a0d0fd62301fa9546a211
prerequisite-patch-id: f83f24719ac475317507af09bf08b4a69b02d429
prerequisite-patch-id: c9f2942207341ad4f450b20f049199f35188c02a
prerequisite-patch-id: 3a6e9752793f2d7b084008b47daed10ea572064a
prerequisite-patch-id: 3338cdc5915c1e6b991067d3a7afb734c182663e
prerequisite-patch-id: 59cf68a3a49958a60833aa0464980f8c8d879961
prerequisite-patch-id: 5d146a518f2f76bf9fe93e23a2cfa63c73731883

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


