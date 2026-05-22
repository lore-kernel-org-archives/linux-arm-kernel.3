Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39497CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ygzXnRmnIfi9PfYTeE5iFbe27GiW5AXsmvzhwk2ysvQ=; b=JA2YlLNkEPZCbM
	dAX83YrwxVdotkq5rUZyo5F43eAub+0sTSt/E1DvSGiKG5nyvN/t9ZRdXFj0SjabOOc0hAcTrKBhP
	y+Dw+h+HFI4ZznueYVDYkEsFf53N6yB+c54rdeotNmE62E6C3+xqgksCX7xZu/JJwcXczLAIMuf5Y
	dB9MD4od2pbLQSzZAWn8GmbxYBsylvILUCJWw3zWqD8JthMlZFjlahsfAx2XkGQAXnFftT02eg59J
	TWK8beSWVYpjkNvMM2hKXXES5GmsO9EgBzOZF+/6pUyp/4yt49Or0++jy2zm8IcxEatBno64tD6P1
	xv/tWzYelQmyEm6Tfo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMrs-0000000AS2v-30PL;
	Fri, 22 May 2026 10:12:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMro-0000000AS26-2Ez7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:12:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4AGC3947413
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ygzXnRmnIfi9PfYTeE5iFb
	e27GiW5AXsmvzhwk2ysvQ=; b=GeyoKsJL9AsFkrxFikRPNe3HPwuc2BB+UxDYAU
	VnsEI2Pni8YvCbejT4sOZr3ukWkukbsi2Y87g7L9O0qXX4F2QbpAzxS+rKpAWo5m
	sjr/D6EP4yB/+G9x5/FqLbn0w6f2h8lOVcFvFejj8kFp4VnnNSIm97we2HRFFv8s
	Y12dlxs8RnEjZF8dmNQXVG/lnZOFKvGstQKsY49NAo5Tt6FKZD4ogJx6q0XQEW6F
	3iJKsgka3W4y3C7nKJNOmV6z6uUFPIn9gNGBShys1OMBFCfWdCqp5cZ0c+Cj6MGQ
	XbhyMWnzwU41gPfOpKyEjCuk/m/CQMVCVwUfYxNwiCrMTPLQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng134-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:12:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so7900518a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444751; x=1780049551; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ygzXnRmnIfi9PfYTeE5iFbe27GiW5AXsmvzhwk2ysvQ=;
        b=W5ml/G20peu9IR8NK73FtApDkmxZMFiXkV3jdcUqGGDEHT3CBoLlnXewZWC0/jC4LH
         HELAM5r4568B0MN51v7Sa3BIPsFjnbpydbTpmqwpNE8KQtQ6iIS8N+opHt1OKkMlSTxf
         FZC7Oc1B7ZS/+tIRS5Dz5IJRpSKeknelu8Jc97+5wM+YgExwSnoLtxUi8bjEmbuboFLu
         6hdeYo71cPiymXieIb3IOp41lPpqaXzySv6/Km1uv8R2fhVSEFcZrAIn4cLEzJoZRP8r
         6zQhagHb2LTjQ+4F5fFSA00qoz+pVgg5AhAWhHxp2pnfoEP/t6tr5c7J9HNUlI3eb8q2
         Qnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444751; x=1780049551;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygzXnRmnIfi9PfYTeE5iFbe27GiW5AXsmvzhwk2ysvQ=;
        b=JFTikavVnxFhTU61SGln8K/Ki1N6LlI+sAxm/wvJXupx7h9zcf4xVaw5mh07TzYTKS
         EdRlQ6YHgGqly63mRPrxGiT7QVB5Vm3BvK07MsLWdH7J28tiJVuRX940fiPlR3G5zGDb
         IfsQAwNJOK0LZdzg6ZISGev89VlEbuY7JM6NdAP44j8gAxnjFioYJTChLnDzB3HHabzS
         56fYHFc1tarRDFRPh37bVqA5BhZArjILnQ/C3sf8V+gu2QqIvmovi+TFkss4700psGza
         LHExMv1bboG6MQyF0JQP1UaNO0H9w0kKkQlD08wAypkh81+PgPxauXa7i+ECvhZWwKkD
         vdDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/G5tjDUrdTR5KKR8hmuWUaSoNkcq+69/eQsmNBwaJ1yrB5G9sJSYSfrxcCgTFbg4b2nbng1jPTjWMui/aW0wYm@lists.infradead.org
X-Gm-Message-State: AOJu0YxNZQqdL4o3kH5s7k+rufA34nH1PRmQP90RmI3EbRF5GMv5say/
	Z2MwIINq/F3jca3qOjjAmb6Y2LphAkAiFHmn1Cv8FnxjiLqNXNp6LQvOpuGsRYk3l62kQV2PTOi
	pfKrLFLNA+EgZWkgmjD4ZmfVCAgyRv4gx2Q3pIZLu/QmdCio8t3MsrOdwcb8ZYRebm6NE5ySrxF
	nK5g==
X-Gm-Gg: Acq92OHs5/ZrDf1ui5nyYfP1ikTGYZWEgya1zVdU9SyAPs2kAYUBTgb/ryBh9JSz4AV
	3wIZfaU4tVHh8da04GGPi0oAc9qQbiAZT67mWcBzdE+NVjh9ySVgEytPkhkStzMzV1+15F7NtMs
	wwvZPEhne2f8W7iKe2MSVsxE7EpHqvTmGckzV0ktfwLo3MVixUPOgMRkeVaqdoUmIEiw9Yio2/U
	UoV8VEwq/M8UWsq7iNQCMEe/cnIh5Ei3aURnF2LDvH9cYRIe6hjLxxHNvFQRaFEmJEUSdEAV5hL
	CM5BNJru1xMdszvwfcuvop+akcUfBK7bE3vPZkqDWVBOx9/j+BoQFxqtt5EFXCqKNjUJhzt5X/T
	UjIadowDW6M3fAWs3Iq4Q16JVmzTdA1meeTduEzpZPfbNCgvtoFpR9uQP
X-Received: by 2002:a05:6a20:d709:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b328e4f8d7mr3008459637.26.1779444750755;
        Fri, 22 May 2026 03:12:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:d709:b0:3b3:c28:45b3 with SMTP id adf61e73a8af0-3b328e4f8d7mr3008398637.26.1779444750288;
        Fri, 22 May 2026 03:12:30 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Devicetree support for Glymur GPU
Date: Fri, 22 May 2026 15:41:56 +0530
Message-Id: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwrEGoC/3XP4WqDMBAH8FeRfF5KcjFOZYy9xxiSxNMGGm2Nh
 pbiuy/qYMWtXwL/HPe7uzvxOFj0pEzuZMBgve27GORLQsxRdS1SW8dMgEHGADLanm5uGmh7nmg
 9UiEKlKyItUyT2HMesLHX1fv82vKAlymy4/ZJtPJITe+cHcukw+tIVzoVbOl36L1ah5bJ21bg7
 Gdm5ZwxVT1Wpu8a21YBaBCUUWUMFjVnGb7CR+/94TKp0zLhEJ93sqxxtH7sh9t6ZeDrHhvO5O6
 gwKMIXEjUnBuZ/RVXMMAvIhnfI7AgDYdcS1lkWj9BxAPCYY8st+UpCKgNcMPEEyR9RMQeSSPS5
 CIXYIQ2hfoHmef5G/eD6xwHAgAA
X-Change-ID: 20260226-glymur-gpu-dt-339e5092606b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=3476;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=kTZkqQMBsGBq0RgXdzBTEek0U9w6bkU5wpcpKO9PBwQ=;
 b=CHtXeQDP4hxrxwaBHy1GmF0IPY/324K7voescovnfbeHnVyH79TDAQ2nGYRnw6OvjvF6xeUS6
 9+M9+HCmwDFDj10U5kVChHguRZKqP5hOlDjVnNs+DcPMbLlLdR2EKjX
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a102c0f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-08r9DDlpfC4vgu8VQ8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: MIw2PulQ5bS1wZzsB0mh3rzv077pDGnu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX6hfWR/GCq9Gi
 FRhxn4cCsECDpWlVFnSG/KEDfiWbfyd0aN5LMGyFNlblzvSFqSTv2gjgC1yRbZqu21Z9gu70Uaf
 I59INQzE0ty5DtHuhvebyWDCHjHKYCTB5AHWGuTIIbcuus9f57/dceEuW7qN/X9r5x/NOpKNlRl
 Qco/C1btZWe5mp33CTEpX2PCnwkDKtlvbhfbBUUPWRmdj2Hj5BKCmkpDLTvzEctsaNtYPVLXS36
 tY9csYDYOunD/l5Q+3d2PdhKi0HGMZyj3PwKKkR/SvjwZz83FGPSDKSpI15nf6ezPNMlmtUvIPU
 Im6Jk6VbcuSAtIZKyxqOjR36zCsS3Bi1AZT5oVXXVBbL+xPVmuLf3HUp8LuWbcmpZ5wpdNzDZ4n
 wWHltk+yXrmdJtRi5ah5NDmCpNxpIX6gLwFcV+gSqsJcfVC+pVF/CmmuDnHU9mO0rYjDIMaruSX
 ikTnkRGIEuNx5lSz78w==
X-Proofpoint-ORIG-GUID: MIw2PulQ5bS1wZzsB0mh3rzv077pDGnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031232_584823_847D9764 
X-CRM114-Status: GOOD (  18.53  )
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
on the Glymur-based CRD devices. The Adreno X2-85 GPU present in Glymur
chipsets is based on the new Adreno A8x family of GPUs. It features a new
slice architecture with 4 slices, significantly higher bandwidth
throughput compared to mobile counterparts, raytracing support, and the
highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among other
improvements.

This series includes patches that updates DT schema, add GPU SMMU &
GPU/GMU support. Keen-eyed readers may notice that the zap shader node
is missing. This is intentional: The Glymur-based laptop platforms
generally allow booting Linux at EL2 (yay!), which means the zap firmware
is not required here.

There is an update to the gxclkctl/drm drivers to properly support the IFPC
feature across all A8x GPUs. That series [1] is necessary to properly
support Glymur GPU:
[1] https://lore.kernel.org/lkml/20260427-gfx-clk-fixes-v2-0-797e54b3d464@oss.qualcomm.com/

Just FYI, on top of the linux-next, I had to pick below series [2] to boot
the device properly. But it is unrelated to GPU or this series:
[2] https://lore.kernel.org/all/20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com/

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v5:
- Relax contraints for reg-names property (Krzysztof)
- Drop the smmu binding doc patch as it got picked up
- Link to v4: https://lore.kernel.org/r/20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com

Changes in v4:
- Add a new patch for passive cooling support
- Link to v3: https://lore.kernel.org/r/20260512-glymur-gpu-dt-v3-0-84232dc21c03@oss.qualcomm.com

Changes in v3:
- Add a new patch to fix RSCC base vaddr in drm-msm
- Remove interconnect property from adreno smmu dt and the binding doc
- Add a contrait in GPU binding doc to limit the reg entries for Glymur
  (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20260501-glymur-gpu-dt-v2-0-2f128b5596bb@oss.qualcomm.com

Changes in v2:
- Keep GPU/GMU enabled by default and drop the enablement patch (Konrad)
- Drop zap shader node from DT
- A new patch to update GPU SMMU dt schema.
- Adjust reg range in dt nodes to avoid overlap. 
- Removed cx_dbgc range as it is already stable across chipsets. This
  region is now part of kgsl_3d0_reg_memory range.
- Link to v1: https://lore.kernel.org/r/20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com

---
Akhil P Oommen (3):
      drm/msm/a8xx: Fix RSCC offset
      dt-bindings: display/msm: gpu: Document Adreno X2-185
      arm64: dts: qcom: Add GPU support for Glymur

Manaf Meethalavalappu Pallikunhi (1):
      arm64: dts: qcom: glymur: Add GPU cooling

Rajendra Nayak (1):
      arm64: dts: qcom: glymur: Add GPU smmu node

 .../devicetree/bindings/display/msm/gpu.yaml       |  16 +
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 461 ++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   7 +-
 3 files changed, 427 insertions(+), 57 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20260226-glymur-gpu-dt-339e5092606b
prerequisite-message-id: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
prerequisite-patch-id: f7ab29f2f0241b6536d3b0c0593f0baa0e435221
prerequisite-patch-id: 56c830b7718129323b006e492aed9822d7c30079

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


