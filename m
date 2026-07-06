Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=; b=AJ7fM8Ym5UYLfA
	x6hpJcaqOplt2CdZ27Rr10YOy2Z/U0OG+9ZOGirExrWvqV6DHGhUHq9qe8UVmc2gB8IMxiU/aRZlJ
	u5xSgvTs/2+Qmz70YBFWJZ0COBIvQWS1dgI+NdBWmRf87P56JvIZA8wpSVhGCcA0kDv8AfErgDsir
	g8Q116RDDcUsdWXDaUmuU9LzJZX4+/4Ic12mskk3QIdJrRivibbH6eNL2sClXawldzDY3flvTMBbf
	GQaEUWNI2dZNUCllUQ3t8CBtAW82F1zep+ExBrJpySvSAQEgjCX9thrbZA6JQP71izwkPwdH87U7u
	5CQvVajtAjGKsWvHUIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3X-0000000DerM-0XSE;
	Mon, 06 Jul 2026 21:40:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr3U-0000000Der1-1lTj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:40:45 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE3Qk1626297
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Sl1a701shpBJWVBwhh6ZP9
	Kq23RhfGUWyGD/s/IZgbw=; b=HJ/ojeK+rNwO5/4jDzx12MhnRCZul1oJFph8di
	W8Yl3e0LfnHow40KFW26JFj3+W3qYKDV0ThdvEkqL9uRdIcNbMlTnSrTI418lKoT
	HcS+0WsOkarsXHksd1jH1K+4H58sfNwi9+PMddDszR+cbSV5IgeQyDJ+ntG6W7Iz
	zeZrGa5oMyDGOs2y7JVLfXrwhK2cozLNPX66JchWQXlZv4Majx43CqdEbnpXmcCK
	cbRQzCkqDVWxSd4aW+JHVFDzexafSnUjkxgEIqVfvwlrRRVwzJxNQB9o/DOW744U
	0UHJJCZw8g3nXyosAH+SDzix1hWlNzdUwB8TOcyBa8nOt9Jg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9bfu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:40:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cac01e89e3so452265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374042; x=1783978842; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=;
        b=TDvT+7qOzjo2K3V03zcDkEbKzF20Aba85eM8L5pCtaZ/lTO2SUMUUM5u7u5oLH5zYa
         mEgkFfEIiEKy5maMK/+ujvLXOYL3KX3x/WBG3AKdf3ZzxmGzNtP+ocYF745wo31BSx+r
         m2E1JrJjg6VEMHLeRhsON8UxnuPfMlj9MHWl9CaWynWUDWf9Kaok9VouccWWSB7qyPEz
         8xIjNUL2etbK9gv6l9/D5Ln7edGXm4OuF0913hIhBade8xbzUG1hKmtcTYArqjERKwSm
         ycgF5F0bmj+aY4sMx9tVq7IobVUZQCkw7RGJcNIVPDMwLaVeRx/j3BA3V8uC3172O3LL
         cGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374042; x=1783978842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sl1a701shpBJWVBwhh6ZP9Kq23RhfGUWyGD/s/IZgbw=;
        b=PgqmA6hua8CN8cmi0xEoHgACUojvG4treM6VkWT1ZySC4x2zZZZungtczWiQQDMbWz
         StqIDY0GGAsWPsEGj9zLv6HdPlXaZVLWA47nukWp1E7cJuJLronC9Sv2vwDmmKFNGRCI
         S9xFZFHwQnZn7rl1zPIKTDjlRhqa+ePTXXb3PJjft9u9vHEwZhWUJMpwsNShAoVYTPy8
         YLIZ8btWo0KczIh9OQukELMQNyq8/pTEmjOvSIEyLuDzqV2F8DEABUeDSBNFGtIpYGL0
         Fi+iIYyWrVVTgci4iEmy1ktjdEmphl31yno4NXVgBZDHG1MgDaCaOi4ZDFJ7SbMQRC/h
         MH4w==
X-Forwarded-Encrypted: i=1; AHgh+RobZLFkwLGHwyjbpAA+KOVc8O4JHdsj/3Zql8RXOPCvmWlNsQJCt53JWUVbz+Zf0s3j/HiPKmoB/DAlEu1w0oWT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gee/FFJzxnva5eCCms+rSA+QghdMs83ci28nxm14sA0kdh2q
	f+WJuULWWaZqVstAsMQO0dWoYmpptPOBq3+G7tpMm4CCJl7bYLBQCci8YeNRTeeM72n3yTidMC0
	OfbdfDsjP+3ruUha14f5Ay0/Pchs4Tvb34Eud9LdnYnMM1UTPuwA66LIIKHgW1WBxKkAvx6nGRB
	dmTQ==
X-Gm-Gg: AfdE7cl2pesAxKyBj9TYmIoytiDmKraKH6nXK+ePi0uHsNTYBpTBYO7csa58bUN9mX4
	McbD/efe6e1d8OA2a8KoteJSiL2B5G+29h+7MezwPSkXQ/vF3Q+n445kPBjJLziGehultbPKTlI
	T0weQkhrManpri/+cdGVSqpJzUHrx41fD9hoF5kznz+odS9YpmSmv5EwATYt+aU4KVYLEEA+ynA
	KA5OgJAbgTCgcrlxUTrSLyNLK7qfWus/MiOwUB5xwNdPGr/5gDN3pjaBaGW2QBiwTOwjHKyWmGw
	j0lT4cQNzLLksATR168++k/xQy7dOxdWv+e6atwjJzN8YCH3ETTOlNSekokww1A0cZTOZYnxU4U
	gKTP4VvuqMToxhZyi03DqhE/w4qrOr0+UTxA=
X-Received: by 2002:a17:902:fda5:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cccaf33717mr555735ad.30.1783374042029;
        Mon, 06 Jul 2026 14:40:42 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2c9:994c:9a5 with SMTP id d9443c01a7336-2cccaf33717mr555215ad.30.1783374041497;
        Mon, 06 Jul 2026 14:40:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 0/7] arm64: dts: qcom: Devicetree support for Kaanapali
 GPU
Date: Tue, 07 Jul 2026 03:10:18 +0530
Message-Id: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMIgTGoC/23OQQ6CMBAF0KuQrh0zbSmoK+9hXNQyQqOAtoVoC
 He31IUJcdPkd/LfzMQ8OUueHbKJORqtt30Xg9xkzDS6qwlsFTMTKArMuYCb1p2G+jFAFWBf7HS
 JXOZGCBYrD0dX+0rc6fzNjp5DVMP3k120JzB929pwyDp6BUhyiZIthcb60Lt3OmfkqZHmar155
 IDAJXGDpRGo8Nh7v30O+r7g2/gkbxQ/o0S1MkQ0Cm2UrEgVkud/jHmeP/+t434kAQAA
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=2226;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=bs+iDFNnM8Jvg3DP8d38QXtbWpKTJaOmfgrbI8NBa80=;
 b=aOWgjsH3Quqy/Ba4njoZ6uizggyqsh282W4b6iHuOyw2JsdoW3L0lnBNH6TZEF9o3L50kD17o
 ubko8wpOpbwD/Y9jUT9CfcTBibDg0S/mj6CTh3/lk6huCzK9uduPgpM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: _gj6tF_gpROKBhW19ZR0TEb0ZuExK-Vy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfXwYaVpMqN2LwE
 /EkkSwtmgVNs/PrdX/x+GNBrOuaPnx8uiOgVJi5jqq3mp7gDP2DoRRCKeugEIXMnTIIM1MQPguM
 B4bhGEIVKz0g3SL0SqBpOUGyOuWLz0s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+Cfij+4BlcUX
 otAL5185j33ovT4Z2MM9Ko3MsEJHGorMEAz0bMrrz91t0q2yIf7ciqRP32QCPI7DBQobwEkCU0t
 NR0psxM/XNniAt2jSuPWdo85K3RQqsPDyj2kOjY6UnS0XroO6cUVBJWThdOtD875lQfzdb/Yy6B
 XvcyowPmxo4yxrkQLmxb1X1WQKWvxANSqNGBowRB/Kw7iJm5OMVHuPcBf0nXts153vCV6LKR0ab
 ZjAG4vw8ImPLrvi3wxTwcQfWX4OlzpTzXb1YBAYEoqgSTAJ4BHmfRLuRfrFofQvONyCkYYVpIEk
 /Ps3s3TupmiJPg4lp3KKWCf/jlGoLlqvO4zNRzaNIjiU65GN2FQtrRS8kU7BpiMxviaL6Aqa9HK
 /0coes6CMaCgC56B49YIrRRYNKJG0seF2OMTb3+JZSIAVQ4YeQZxqxp6M5IRnFofCycfz5Dak7i
 vv6korslTZ7JvJnubGw==
X-Proofpoint-GUID: _gj6tF_gpROKBhW19ZR0TEb0ZuExK-Vy
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4c20db cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RSuC8zd2ZDaJPqFJxW4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144044_589731_AFA3D98F 
X-CRM114-Status: GOOD (  16.50  )
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
Changes in v3:
- Reorder properties of adreno_smmu dt node (Konrad)
- Drop updates to the HFI interface as it breaks legacy GPUs (Sashiko)
- Capture trailers
- Link to v2: https://lore.kernel.org/r/20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com

Changes in v2:
- Fix formatting in DT patches (Dmitry/Konrad)
- Update cooling patch to lower the polling delay (Dmitry)
- Keep both passive and hot thermal trip points (Dmitry)
- Update GPU OPP table to match latest downstream version (Konrad)
- Add a new patch to allow HFI related structs to accomodate >16 GX levels
- Drop the smmu binding doc patch as it is already addressed in linux-next
- Link to v1: https://lore.kernel.org/r/20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com

---
Akhil P Oommen (4):
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
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 458 +++++++++++++++++++++
 4 files changed, 476 insertions(+)
---
base-commit: b96de4afaea292f70aec05d40def1d993c04d71c
change-id: 20260412-kaana-gpu-dt-968a70134c22

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


