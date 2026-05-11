Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2025ECD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=; b=fXR82S/DBzMXAf
	ZqJkDrFKh0sENq5E8E/614ilvO21FboqgmAwwgVkUuFVdKzvGnLwj/BcAgxPuI9dRFGQr/6KLFpRi
	FQXKmHFgf+6yBPNnZU8yqcwvDbOPQcuHwc339p3sRXSIhAbyZtSdKGM1jaxYcojyUgR4uGNmjgIYv
	BUBb1Ud0Y3RJtZULQQx2yigB9pdJMn+Rzq9efJfi3LSnBFAkwtzTYlHmRHzBMmNdGst645bDHoQnE
	mlySy/3m00WQ7EimC/YDBC7jn0SzU/UyZbJVG9Qmkm2aBltQVz67imuwLL7Zwh4luSyzIJa2OhVEl
	plXzBHHp5MKqHaclBspA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2J-0000000EuNr-3ct8;
	Mon, 11 May 2026 22:23:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2H-0000000EuN3-0T2m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:23:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6WC62994871
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vmbVJwi4WaTGTVT0i5299u
	LCIqKpaUV1SdNvk7Z+siM=; b=evefXYKDR58EE9T3OunshXF5Ag+pvmQjvcM4kQ
	/C2aQdBk4x4t4yp0Y9EvNxSWgefhejdByw0vrsLyZHHW31twNC1yTVo2FNmJI+3T
	1n0zWuAhS0srW0llm+bufiJpv3YLW+NZJtyUl5lc+Y4GOm/4zPTTfe25RtmJCLyg
	Oie6jsmKMjWuCLoiZ2GhbDJE7sU83vxxDb9YM+q/2aBCkpFIDAyZEc1Ei2m5SamM
	S6yHKLWU0r+KVpWWOFYwZoAvCbe1jbpJ+60mdXuIXcIS/GpzVcGBYuFc8hrUnZ/c
	eWFnkEyDH5hbBE1fnwcI8LWMTqEKXbUZq/Ty24gV5U/JUUSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv0rfx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:23:35 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so2469545b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538215; x=1779143015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=;
        b=TvvS0Q8vjvveFiR6VN75wSagBxLf7gclOMtkIXq/LrfC6xN2xca9StEKw8pzNzGnnO
         prWMqQRRvmUYJteh/MR962LxbLUeDeZdJEES6U5Qtncre7/XwY7kukCIdUJY1Q8J4WKX
         klQg796hjDBoLqarBdKpnj5sGNSWX5mMfbjCKOsIqrMhms7QezxGqUEJwONQGRhTGzT7
         BjjBvIm9LyPU0hnu40qoI15r7HMfN4rTYSeKjUUH13/BNuOAnrO6R+XyfiL5rg0U38Vl
         hPXNAGnTFkCXPSmuLjCFRQ+Iuqm1O84Heiin5hLwClXvFSTW1ct6O8nSRtxfbi8GxhnY
         ebZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538215; x=1779143015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmbVJwi4WaTGTVT0i5299uLCIqKpaUV1SdNvk7Z+siM=;
        b=FJFoLIWn2HNeUv8ZOt+m0gTbIUd6pQYEWGwuuoZq6gX+apmjhjc6YPmpbSkn4gbvhW
         XTV/6ADBWqo29t/otn0qTDEg8UC8BUwZu5Tgqowb/cTVQeKqfBaR0XcJRV5+dGVQ3qLo
         DRz58tWpvrS8RrfF6hy1/3KfQjC3ytHpr2TPc+w1p0PgOFJzs6G1qGv0+uyJ36+NqEkc
         lj60d6g2hDhyLTHDa1GN/JiMCRYtR3IrskcVPbwT5f+0entasHXwdNUY+TQ6aFbbB4rf
         AWQc9LzmuhfEhT4X1Dui2QYDwUtEDTXGTzwnwcdhneMsCXhspayU2fedB6wcvB9QxDbM
         Lc8g==
X-Forwarded-Encrypted: i=1; AFNElJ/KAcYrDys6hMPHk34ARRszXGB9ykhKeZa+q7bIq/VZKcjGAgxTJS4r/k6MAtrmfEXBKz5XMVnKe7ZJHmGgjv5p@lists.infradead.org
X-Gm-Message-State: AOJu0YzgA1kmim8g43MivmhYp+EysJymG7PDI7usDA72JGATktODd15X
	O/KHk6q6buUxLYBBrqhRyFZOEYkR+ez0kKU+oJjZOZXbTKSqY80X7meEFonKXocmMQJqG9xuEkA
	GaMakHiU1Unq0aBsNs5X1BJH05pVwo7jwwqm60rw5ci+ySkTpiWszMuMXFC9y6JwAO4pWsyRZFn
	Zpcw==
X-Gm-Gg: Acq92OFtl1p04gzrDqxJ2OFzQIy3WzqGw6u3hL1Vjn7FlXb4tqNL2WtFemlolOFd9om
	ksZ8HgMzEWcKQK4SJlNujv6jcmcVqqIOB8nhAVtfVcvaWby0kxGB7PPAIwyvQso5L/3w4Kitdhx
	Uf6JRf5OMkdsqguuy1Pqa1aCvzUjJ90HKmNECr4vqCQ7qotd89wXTv13x8YQRuOhWuBYfZ/yU1+
	3Yj6n+Yql1xdrGYWvzD4WmdwA3nCheYXULR8MWn2kfDk4QH5JlI+BzB4RNVjkupTk/GLIRfMqYB
	0o2LFwGi3qFEzeNiN4fJ6+vPiru3JjmOPS296+92mVztzD1gws6jxkfZW2hLjWBLY7+O/qFC0LR
	brBuvPId+DAtyK0ntKuLUsMVi+mEYN6bPACo5QS3A6naZXw==
X-Received: by 2002:a05:6a00:4f96:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83eebc25edcmr287611b3a.28.1778538214775;
        Mon, 11 May 2026 15:23:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f96:b0:834:efcb:12b4 with SMTP id d2e1a72fcca58-83eebc25edcmr287547b3a.28.1778538213840;
        Mon, 11 May 2026 15:23:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:23:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] arm64: dts: qcom: Devicetree support for Kaanapali GPU
Date: Tue, 12 May 2026 03:53:14 +0530
Message-Id: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANJWAmoC/22OywrCMBBFf6Vk7ZRkkj4sIv6HuIjpWIN9mbSlU
 vx3Y4s7NwNn4J57F+bJWfKsiBbmaLLedm0AsYuYueu2IrBlYIYcU64EwkPrVkPVj1AOsE9znXE
 hlUFkIdI7utl51Z0vGzt6jsE6bE921Z7AdE1jhyJqaR5gNSc8/+Yb8l6vnUV02Coxg+o2g6kfs
 KphQuCQ7TNK1FWWKlWnzvv4Oer6q43DOf5XJWF9Vb+a0f3mTxIE5AollgaF4fKP6vJ+fwDNRLh
 fJQEAAA==
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=2499;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oZ+yt/RXidFRbw7KkVC6QwWQB7cStOb9OIQ+8ARPiNA=;
 b=z4wkKaTXNXkeDYdY4GxGX/+MroUPOcH6t63HZ1+4kb1hAZt+BGI/ky1jTgoA18Fcdd3BMaoDx
 M+k9TYb3CyQCVJ+t9jflHnoB2osAaht0heuWefIRDO4XXuijct4UNzY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=PN0/P/qC c=1 sm=1 tr=0 ts=6a0256e7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: TCN87-Jub4r8Jxepb0A8qA1t_nB7ssGL
X-Proofpoint-ORIG-GUID: TCN87-Jub4r8Jxepb0A8qA1t_nB7ssGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfXy5IiH0g0HQ3Z
 frQeVz8bNwTbNPjxrx2OjxqFtAo6aLHKaNkyt6mLCPiNRK0YqpulAWX4pX36R+nBOoACAnPggRQ
 OrlK19S8qVWFh4mZBEpSC7ZNluE6dsUrN+1WSCNWmuBr6xEV7SLkTLTC5KO21Avbbh79KILVLPU
 CZrzzm8oduhXR3UwkY7uHjJRmax1hMmCAlt8K/XNoUwnJ2rVYmw7sPwyYG+GmBmbZefIuGlVajj
 6ST5JPYDFuLXY2kNRDtQuClPG117YhYGK+gNYyfwbOeZzvDiDERSVZFSaWio0w+bCfKtMcHV0dQ
 Al5/KU9Pno0SlYIX3CQnESdasVoS4ORxBa5ys1CqXyYwKmfVWqs0GMmrp8zFIpL9GqsWpSbLRmJ
 LTGBUkwS0g+dqK+ZgGeWlA6n2y3xDjE9mdwIISKYNFUcXjAElqUcR2XWNfKQP91CKssSI3wTJ3+
 XrIJuNK8n9gFprymbPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1011 spamscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152337_284305_900FC09E 
X-CRM114-Status: GOOD (  13.58  )
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
Akhil P Oommen (5):
      dt-bindings: arm-smmu: Update the description for Kaanapali GPU SMMU
      dt-bindings: display/msm: gpu: Document Adreno 840
      arm64: dts: qcom: Add GPU support for Kaanapali
      arm64: dts: qcom: kaanapali-mtp: Enable GPU
      arm64: dts: qcom: kaanapali-qrd: Enable GPU

Gaurav Kohli (1):
      arm64: dts: qcom: kaanapali: Add GPU cooling

Jingyi Wang (1):
      arm64: dts: qcom: kaanapali: Add qfprom node

Qingqing Zhou (1):
      arm64: dts: qcom: kaanapali: add the GPU SMMU node

 .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   8 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 450 +++++++++++++++++++--
 5 files changed, 441 insertions(+), 31 deletions(-)
---
base-commit: b462608de92a7cac450781f9d8d4c7cf3ccf82db
change-id: 20260412-kaana-gpu-dt-968a70134c22
prerequisite-message-id: <20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com>
prerequisite-patch-id: 82e142b3d904e746db0e288fb7ea6812661c3537
prerequisite-patch-id: d141a83ef741d26b03d931cf120b8b541ec51b9c
prerequisite-patch-id: 5bdaf78fd75be779d4aa73b85a185a10d8458366
prerequisite-patch-id: 0263b47f4e1aeb61fc96c6dbd9f7168ffe0eb04e
prerequisite-patch-id: bed1e449dca0167ed99e8c4f1e544ed60ae17014
prerequisite-patch-id: feda87721f22e443f38165787b2b28fe1a40aa18
prerequisite-message-id: <20260512-glymur-gpu-dt-v3-1-84232dc21c03@oss.qualcomm.com>
prerequisite-patch-id: 9175e9ae77ac032c2f0502e2c63bb7b7d1ae4ead
prerequisite-patch-id: a29ab9cea24f74a76a69f144f76f9860e014ad19
prerequisite-patch-id: 6243ab821a3d9cd641a8dca8cdab167fe9da8735
prerequisite-patch-id: 36f4bb7740fd65d808fa6685bce4b03798a547ff
prerequisite-patch-id: 054631082c45d3ab3117f541f0d4d90b660dac73

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


