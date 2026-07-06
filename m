Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49544C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ep/7FXUXye2OKnoYYBiKQZ+RJlOWy5+Z58OqDRKG4fc=; b=r0N1s+UrfjDEt5
	JFQsXMJEehtIJxwwB65BIjefqVPO2SFIfaTTBiW5/f7sPeJRxmnJaZWh/BYqcbN6OCrGoAoKaa5+N
	reSTacOlNh7Tf4IesiPRD7dBfVTkJuZTpESTPeKAY/ySywScScxHkF/fwsKhAqjcFS4DLz4jSR0D4
	ZIJQASPR9tyNS+PASFFHhq4RtVPSdL0GthukeDNOpln1mUcpdJj54Ni6BPLzIv8jGN3k8zB1ztW9F
	h8qgdCBQ5Jow/4rp6BcdpVJc7Y7/nAtYkizH2f8+3dA2ZAopio8TkLo579nbNzfqur5u8gPQ6tGF3
	/QnIG9+8pEZe6NZd7Pkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqUz-0000000Dayp-1caI;
	Mon, 06 Jul 2026 21:05:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqUw-0000000DayN-1fLh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE3UM1665118
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ep/7FXUXye2OKnoYYBiKQZ
	+RJlOWy5+Z58OqDRKG4fc=; b=OB3SWaDO9LBTQVdXvsoTybQM5DNmjh+hVAKx8o
	W0n+t4T6jBlg2tfMKPOqsbbZZcqpYOv8bT1UBMrTSQmDh2iZNlbU54bjhEcC1onX
	en6ym0K/r/EIGD/AO5fpgD0UeSDd0bacInZ/6GDgSCmo2zLNNSqLeE+BHPKDerR8
	df26PIxCCq7XwJAMYg17imKo/3OAJicj3JKSUZIx5OQAL7zEba7/CVOG86tD8eSx
	4mCekkVsynit1B5J5JoFKOYazxFnUJwos+eto4Hz0677GvTVDv4TUy5qj+pvaSqY
	0kzcwd1D49akvH8tQ8Ymv96Oq3O5GX3ObgzcSmmAhb30kuog==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtwgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so2547144a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371901; x=1783976701; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ep/7FXUXye2OKnoYYBiKQZ+RJlOWy5+Z58OqDRKG4fc=;
        b=EFyx5wGaSoiYrr8c45Nt2jF3LfIekHMHpqVcOyfJy8i1zlvYcUTPJpvrax2z5rE4JU
         WZ7kOvvrLXe3M+rwselDb6HAbVdb8EKkuzJDJhoGA6g/fnplyEYcP94xQXdLLHlrvQKP
         +g+upJ7cqu7/A28s/0n29Zd1OyLi8PJ/47fyZyD5d6AsRGuDGII1ALZ3JoFgicWibUpP
         /2N+BCbHoQITscPUqLPb1b0r4D2CnlTRhI2j3rRQx12t7FqEK2BDzno5Qy9+K/T+IGn8
         2ZQhzE+uiJbK35rjnKHGiM/RD0B9fNCA/GzwlLXwwH0ES5XHPwtR4E4Kal7fqcFBGU+G
         M6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371901; x=1783976701;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ep/7FXUXye2OKnoYYBiKQZ+RJlOWy5+Z58OqDRKG4fc=;
        b=HIGYnRJqwNSMglTDx/pX5zm6rVqtRn6u/gFY5ijjWhvihQVCrCghKWcl6tU/cRIrOH
         LKpzOxBkO45A1zGqddHjPVj/UyCd48cRLbTbR0viWZzd7Lrkdl4Cl9Qv4NWqYcrt9Tw8
         CN3L62Pjs0wKetfbiZbomDrFA1dXbmFgJZBbkoBpDZqI4QjLtkKQzk3+pDKmKD/QIC1h
         14W6jT3z5qHE+WU+WE3PkL5JFrYU+ygFifUyxgnUEqvN0/lKw+3C1U1QMZagbxIKyNuo
         5NlfTGz9aM/xB2g/5Y0KYzIhdVd78cHFSZRCjhRT2nmSW+jxxacjTHN5dgkoGLhRrNU/
         4ZaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwheTVrPrg/dDHjVD8a5K0RyV3lDpjJLeJeRuOW+JbyAW0ubf7HX65RoTz1qG3lAvwOxQ3O+KYS2fSKmAXGPN0@lists.infradead.org
X-Gm-Message-State: AOJu0YyH6EbK1aB7bhN9B4BIqXF/qcIL/TWl3mF8F3dSUodSq2nJ/D40
	wnUlaYXfx7r9McDvGRpxa6bsioHE79pzuxho3PxpdOZIXuyaXVsGh/39XMnzQicFfbFthu3458q
	Px7xKNChDamh+ZIEqC4qaWwlY2X9GhNu79fqcsMFaYOzX/isz4/kSg2XI/e93lcFe1finDzHA1B
	9spA==
X-Gm-Gg: AfdE7ck/zzb58WGDh8dwI7psdtn0PUsyya9c9OQVhbgKxLE02f5uK1+pY8MjSLDNbFN
	32GeByqRJZY05POykfzNA1E/xptn5f/PQ9qmpEDMhtxXOf5xeye+U4LwjjuadLWaJTHlp3QdgAi
	GXPOySSnnMHfQK02A4k/rBB1vF3XzR2nIZiHs4ALfUgVweHb3KldAcEETpQS/rVzlkCIs1+WXEa
	1kdhw7CKpgjcqvZ6fkehPQIyBNAccIgQ/+zqLTzoi9pSFVRGJc5PHSvEF9uhsCwhtVd5ziwCwRS
	gZxzb6bUax8daEPOJKtVKaGelfMb1lRsjJY+fAykkmj20UvLb++924M813ekcKxdby1mWMXVq2z
	cDzAaUb3BrdAbY+Ir8MnvbizABCpGHonxnIc=
X-Received: by 2002:a05:6a20:d494:b0:3bf:a11c:176e with SMTP id adf61e73a8af0-3c08efab30emr2850779637.57.1783371900911;
        Mon, 06 Jul 2026 14:05:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:d494:b0:3bf:a11c:176e with SMTP id adf61e73a8af0-3c08efab30emr2850727637.57.1783371900307;
        Mon, 06 Jul 2026 14:05:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:04:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/7] drm/msm: Add support for Shikra GPU (A704)
Date: Tue, 07 Jul 2026 02:34:32 +0530
Message-Id: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGUYTGoC/6XUbWvbMBAH8K8S/HoOd6cnK4yx7zFKkKVTI1I7q
 eWEjpLvPjkPbbOlkG1vBDL2j7v/SX6tMg+Jc7WYvVYD71NOm75s1JdZ5Veuf+Q6hbKvCEiDBlv
 nVVoPrn7c7molBbWBXYRoqvLBduCYXo7Yj4eyX6U8boafR3uP09ObzB5rqG0AButdi6i+b3KeP
 +/ck9903bws1aTt6YOA6kqgIlCkgEIaL2L7iSA+CNRcCWKqoaXGiRa1YfxEkO+CAXklyEkAH9E
 pYiXsDeFwCmng510JejwlVbUucz29lMbFrOeXsT77NIXacc7uOIbF7Os5vvfSva+HbVdW/7TO9
 V5NNUjPsWRJzOKPGr7dJhXpM7lM3i/XftPH9DhNBmuvGhtaCkDC3/a2bvSro8YNsDNWQmsbNFJ
 az57QRafZspSCAQxqHW9XIQVcGksdd3Wb+pD6SxnaGk3CRgvx7rYAL2D2v3lWBBNdxNY08h+80
 efhGgSPQge0Qou7Qf3eMQfnT1eBGtMKEoIkurshfKssjKdzgCA4kHaNInsvYwBRK1A4l0hEypa
 +1kPKq97N17vBlUmnv7LISDWXZbII+j8sDeJyPnmb8/JJnG6s8MTQGqvZNPfXRR+i6vCUVrSIz
 lsyBP5+SbxJKW/LLSw/grIeQV+OQ0M6yKBuTfHhcPgFEoR3UHwFAAA=
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=6748;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Ahu8xNvk1lKmwpQNy6Y+IkeezPJfKbRhhPCuckBKhAU=;
 b=WpydgwWDk+cqu4ba6ffFGiuXyxIISbpArIe/urfxSv46q2Sgous3Dv2YEqyjhe/SD2+d61v+V
 1T1uNMT7AUACSxeAtPQfeLve+4HP+mClMJ/qfZB6QA2DhKyoCoxen8v
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: FZ6SBULwWXDmsIZMoRqti0e21ZcA_xHb
X-Proofpoint-ORIG-GUID: FZ6SBULwWXDmsIZMoRqti0e21ZcA_xHb
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4c187d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-nh9RajweDyCoOXDqwUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX9zp20dWeeUeP
 0BVUsW2X3SS4WAUxpS86w3HbcbznVMLvUePseQtuEBfcDcWMvSR10vUQ3L3hwidROl2sSBYMtvN
 4HbhR4RQGfLf+2tb5Yxgk6jN2N0g/87WjI7z30lZfFobI/Ox8eX4uGEgWyJUe45VeCXd6//z9m9
 2aF4r1Hy58eRbQaknKSB17+1otBWegnghHVC+gWpr2nNhLpQoyz+ChETtp3d1j0iVfymi7eKRgs
 TfbdEPKfqqBozq09qX5R9jvsOYuy+cDEtyZUGYNmpniTmLPcmiIlPnNgDwSZXGk9FufzojmCiuu
 PHL0itblZZHbZuAQnqn9claqI2dWUeiSIuROszQ4ptsxYeF++FsPiM/V5CBV9O/MNUUh35wdg4W
 MTh1+zx7s3YMbZ0ZtjsH+s51/zAeEC1jaKPSXma8mxPxB2Fk90Gg6Kp4WmiO6aMwKCQDdV++IIP
 Rmu11Z8BeQfM82gnC0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXyjn7MrOAaPPe
 l5z/47GhrIYwxB2Mk4Pq7FeXxrcdqFm+D9qNATwV9qHWMCIL3v7d7rDo9tsR+0xcuuryHiB+ANz
 6vonJYD3/D8SL764Tq9ogTIavugTZdI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140502_489896_152E7F12 
X-CRM114-Status: GOOD (  16.41  )
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
Changes in v5:
- Drop dts patches and enable GPU DT nodes in shikra-evk.dtsi instead (Konrad)
- Update commit text of GPU cooling patch (Dmitry)
- Link to v4: https://lore.kernel.org/r/20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com

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

Aditya Sherawat (4):
      drm/msm/adreno: Add support for A704 GPU
      dt-bindings: display/msm/gpu: Add support for A704 GPU
      arm64: dts: qcom: shikra: Add A704 GPU support
      arm64: dts: qcom: shikra-evk: Enable A704 GPU

Bibek Kumar Patro (2):
      dt-bindings: arm-smmu: Document GPU SMMU for Shikra SoC
      arm64: dts: qcom: shikra: Add Adreno SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi           |   8 ++
 arch/arm64/boot/dts/qcom/shikra.dtsi               | 143 ++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   2 +-
 5 files changed, 154 insertions(+), 2 deletions(-)
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


