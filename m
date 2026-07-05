Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AE0C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=64k8OwOX7AWdYCpKVex+exyN30K4FzzL3yTqY9H2RBA=; b=eHOjYxJroBy3qj
	TTSfrwtnQAngD6g7+571K2Z74+lNEpboOS4PvViAwXoxnse3FFUTLGvf/zUUa0ERQac5ZJhUMJIFQ
	+WHF5h/nTbQPDf7A0bsfh6vWRD4tYYnO08NtY59zuOnNr+D2MhvgMnY/Xoco7B3+VjRnu1DVOy22E
	TbmjpK39FzM7gmldO9hZfhnl28ek8rt8F0vTT8JgFNbV/V7wD+eFssXLpY2YHM5lky60kVReKE0Pv
	p/KWA6ARXUXv/0YyFZVLKWHCP6oYUQgDtBmL+YLxEbZW+Xu8ORd/vvawHRoD9Lv6rktZG/v+c8HjJ
	8Wc1PBu/NUWz1tIkNjGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmY-000000094ql-3sLO;
	Sun, 05 Jul 2026 08:00:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHmW-000000094qN-2tmC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:00:54 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6650xeXO167999
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=64k8OwOX7AWdYCpKVex+ex
	yN30K4FzzL3yTqY9H2RBA=; b=g785812MkR0jeIIjz63it8ak8hMvZM23hCqxHL
	gAHw3y0GSU5IGzSsY9Lpyq5hDQM1iUrR3VIVHkI5EMkRn1WCYAOjN9DqbHyXNOnw
	b30ETVxc0qcs+HvO79XUz2kfOSqW5FmG2K2pCfdCRf2+qPoMoN1ocrj4DpNH5HuP
	+ckdGGd+ebrMBZz6AQ0SPXxi7KtfJCe6U/vEfPRVbB8ue4zM5vqJS5uuzPQIpT09
	I6kK4oO5obWjDAceULaMtaTmiUNjvrO9zw0XS+dYxXBCMgxukVlRPdiSWJJAaBhD
	FmpaGiSw2DWjUnQvlM0ljmJvXB5T72eCVAVgFDNayaM2ctEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txej7j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:00:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8620ee0971so2327234a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238450; x=1783843250; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=64k8OwOX7AWdYCpKVex+exyN30K4FzzL3yTqY9H2RBA=;
        b=eQLSIGh+3CZMB/+nnaMsznvIu6sBQV+rjOof1eIM7hL020x1RmXksh+QxDvmJt0xpD
         OpwWTz/H9AQN1xF/6QpQ6vlIAmRKDyx49NfiD4jSH4D8UaPPrguYcG4AoKxOq8dxkxdt
         uY1LjAsCK9geARd2hpej+WGexGtqrvwhPQsR/8bICQz7lKWjKZn9Kg3wkuCgPhz0uBcF
         ca11ulDzRncpcITzjvgW7RO0OFva8HM3p8d2OZTaRXWsmWqMiPCF/WVjj95bkNo/sBxM
         O1dGukAvU+YyElUu/ugDKfqjwN4SIoOYXgxSBgSz2nFoZXDAjUZ8Z2LXxACqPTiEqhEG
         +uVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238450; x=1783843250;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=64k8OwOX7AWdYCpKVex+exyN30K4FzzL3yTqY9H2RBA=;
        b=Pn52CNo9zDR9X9BViZ80SFIPajTMrfensLxiEIQT/LZOQfxyshaFByjsTDMVqh9iYK
         caCmK2Y+kdnDAUAwfrEha8ksNHmqLLjHSTy66iOCvckIftIXRInl+4ETOZAvW8LFTjn8
         KYq4DClf0RxHvibsdKpuEbYd9uwITYqZFD4KH34ANkDTZ0+XAmzkUU6sb0RfZBxpnCkZ
         Triqr9hlRBTbRlLOfnYMPRCIl6BZ7qnnWVqtJR4nC1g4E4OdTgj8ZGQSiz7dpSqTJzMJ
         eYLezfh63NZXfHDkWi+apAB9wNfOxVFVyDTwu+6q0RMvFejx1IVoDE9IYms3UH8qqdui
         PDrA==
X-Forwarded-Encrypted: i=1; AFNElJ/mKGm71H0N7XqwVzC0laAZkZlXBDaQoqp624aKEfIPXVlSun5b2xfAOlVMPQmaHOCzKGMmHgHfFqidbUq5Ej7X@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Jjqh8tMTULGN6fYtIN6sVtUVk4e0Ovq1jKt6d2ijFtK0gyzx
	1S9QcbUE93hOSYJM96dTweo9GLqu5Mk/SlbYyhS02f6ZKdx+xWSwP5rEvjI4K9zMRDfLYFSltx6
	/ziI4PybZTIqUcWigs1qNjTpMBhB6nLgerLORjOGmN+JJyqE7VhlXQqSRgF8fdwUn8exw5/cLJg
	/GUA==
X-Gm-Gg: AfdE7cndm8cokViUHZ8AZiKM0s9CaiMxLdwxDPwJ8Uqm43jfrZYjsRTFLQyNeRQwJmS
	C2NInsj8zCeFANUm1dMFA5kIVGIo32xGiAsPECZFjZBG/NZUwbz2e1n3nEcotNEQT/j/kSih58p
	GXFb+5oL/+BL6fZQOwJIEtH1rQT9tJ3V1ZVh6FT4jPJ4lCRChJemrtv736vPQ6ATcKOy8uz4Fis
	ZBpyY7HeXPtMPAaWM/Z1AMAuGAixJZWdw9q/e+Mv9IoExdvW51Bxu2lXSuZwTm56215IptlBy/H
	bLnH8nAty1JlaTMcKmcx0egDf3AqtuxcthHZ0rCYSTgLBiC+2XCpxOBaysf++1ctkUklZfZh0Qy
	EuAzIjZfQV8wCklkWLg1R+Xc5Q91NouiTEf0=
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:6c08:fb8e with SMTP id adf61e73a8af0-3c03e5916e2mr5801023637.48.1783238450103;
        Sun, 05 Jul 2026 01:00:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8f:b0:3bf:6c08:fb8e with SMTP id adf61e73a8af0-3c03e5916e2mr5800919637.48.1783238448966;
        Sun, 05 Jul 2026 01:00:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:00:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/8] arm64: dts: qcom: Devicetree support for Kaanapali
 GPU
Date: Sun, 05 Jul 2026 13:30:04 +0530
Message-Id: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQPSmoC/12OSQ6DMAxFr4K8rlESppZV71GxSIMLUcuUBESFu
 HtD2HVj6dn6z38DS0aThTLawNCirR56D+ISgWpl3xDq2jMIJnKWcoFvKXuJzThj7fCWX2XBeJI
 qIcBHRkMvvQbdozrZ0DR7qzuX8JSWUA1dp10Z9bQ6DOaCJXAEWm3dYL6hzsJDItyz/88LR4Y8I
 a5YoQTL2H2wNp5m+TnksR9Q7fv+A5p/DTXgAAAA
X-Change-ID: 20260412-kaana-gpu-dt-968a70134c22
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=2164;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=URQVb9Hu2fuzstaA7s+Dd/pLK/dbkCOd1kpmgoOBjng=;
 b=A5ueMO6pkv7W0jq9M8lYGlP/UQ+N8qJKQmdwVe3f2yDx/gBZObWVIlTiApffHVD2KMvafWnGI
 Wc6rXJ0SU5iDxoEkZ987rQGNfssS9UD+04+9JBd5Mg3XhOBdesECS7a
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX+WzcsODyBbnX
 S6UYtt1/TwrAxWm1FmUdw5SuRAu6TgnounmguR2uG1AKV7c9vgRWPgVlfaRClRmqs7YNq1/ynog
 V26TVDJp1OQPrc44Ojo331Be9SHOxEs=
X-Proofpoint-GUID: jD2Uvpjn2js0N0tb00JBhR18VRbdCq3g
X-Proofpoint-ORIG-GUID: jD2Uvpjn2js0N0tb00JBhR18VRbdCq3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX6PsVrOaTJMzz
 gDy3+zp0rpDnJBjaQU5WQ0vkSHeCupBbHpDlsOENDewMfw6RiH9i7nTxQfQOFDq/P921XV40q5r
 W65WyyaizDtdwLto0PdqmSrUxFg2zq7NVpZm7M9aSHGqoIWEALTf7EAs8TYttDmiaUpxZWBMWaw
 mzTOVkyBzRKBTKDfHWiIKi6v1cizQCTG8uImMVaYyrhX0Q4HWri6M/nuy7Ti1T6o8RSTnfSxT1M
 wuCAuJQ7cTUJNTlCBWlY5tR78Jd/QGqfi0xbB1QVo2J2N8YLpZvM1w97v3nWqQwPSjBJsT2EE0E
 sid0ZOcyJ5ML0n3YbIOICWxR2lV2V56vt1DRXBfF7rgv/CwwO5d6+lSrnqFSWNjnhLVAsqtqp1D
 1FRPP6vpv99V9zth4SQN4IoVquYcTmYYwNZdyHb0Shoyl5/rqrXd+lBH9bBvHYbuZ7dubpROku+
 n48UUvTqUcl00wkZRUg==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4a0f33 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_010052_752819_16B0FCAE 
X-CRM114-Status: GOOD (  15.49  )
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

This series adds the necessary Device Tree bits to enable GPU support
on the Kaanapali-based devices. The Adreno 840 GPU present in Kaanapali
chipsets is based on the new Adreno A8x family of GPUs. It features a
new slice architecture with 3 slices, raytracing support and other
improvements.

This series includes patches that updates DT schema, add GPU SMMU,
GPU/GMU support, GPU cooling, and enables the GPU on Kaanapali MTP and
QRD platforms.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Fix formatting in DT patches (Dmitry/Konrad)
- Update cooling patch to lower the polling delay (Dmitry)
- Keep both passive and hot thermal trip points (Dmitry)
- Update GPU OPP table to match latest downstream version (Konrad)
- Add a new patch to allow HFI related structs to accomodate >16 GX levels
- Drop the smmu binding doc patch as it is already addressed in linux-next
- Link to v1: https://lore.kernel.org/r/20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com

---
Akhil P Oommen (5):
      drm/msm/a6xx: Increase HFI GX perf level limit to 24
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add QFPROM node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 461 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   7 +-
 6 files changed, 484 insertions(+), 4 deletions(-)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260412-kaana-gpu-dt-968a70134c22

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


