Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB331CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=tX59o4I9VnC+EObT0VFOKu1zXi
	4Lug/w6ufvE3XHUlkJ0ilnkHwR9K2AQvR6RkM3rtSTia2Q37SIpFfT9JP01JYl5PAOMkh4l8Z3S94
	cnXO55jJCuW0l94yRh4/2y12FSTXX/3qy/eIsrb9Jx6ogqJA1JjbvVLNKcEuClu+n52qKVOJbWIUT
	GyzAg6TmFiGpN4puSNYABta4+9RT1UNCayBm1+6o/bgwI1vlSwAnAssP1yqGyZhjGZzGVblbUWfD7
	3xA+hIXoajA3IogF/K8qyvJmhmn2YB+rrJpf1Jw4FwbiKZvPj1hWCP31RGMAkxdAt30EaOujIPLrr
	wHOJBLNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWU01-00000002wEI-1hmi;
	Mon, 08 Jun 2026 07:02:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTzy-00000002wDA-1y30
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 07:02:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586Plb82733126
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 07:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=; b=DJ66Fx1BswjDUyEg
	+m9kBhO7qIXWhbLthFaXsPksqnt3w589fO8O6xJ1eWkLomEpC2nrTxxZ2t3o7ZhN
	DfpXFai3Q7Vby04dgnfSrdHzQcHaGS5O2SQ1stwlgogRAQ9hB7SSEWJBR+cGtYmM
	5MH5CWg23cSuXsBcLk31zDjKxgfCbYoOUllAbLTjgBHLyCbFEMyfFZguoxbnyFvH
	shA97w++ZxMmstGOOkcdxsjUTSaKsKsyTZRu9KCG9d+NwJqm6jY/E6Q4g4HGuscN
	faozQ7bHiIUUs1t/9pwf9mh9SPeVriOcvw5R9wXPDZqKpHIW73hSgapKMA/pzOMh
	asULJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6gv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:02:13 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8581f7723aso2335011a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 00:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780902132; x=1781506932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=Z8iMcBqSdEI7ZB9PWqEHtqmbJV2Gl3hSuhJedv3NvY7qh8p2mlgas4KKqa5I2EXPrP
         nMk1LBF7pOtCCptZmxNBK5G9KNWJsDASQJvFzPXWXD2xTI+/kUlQNonLEjdFTEBkb/Hy
         TO4n2OriGdlzxFT90pe2YxiLQHBcLS2/vWF25tJAZ6u8ZCZz0FbktztpXssYENAxhD1p
         2ZbItXqutP32UD2WJ0q5xLtgvVhh3ABMGmJbOHW38tgrGckKbD0ZbijMqzD8Vq6F5QDk
         wBnO2erUc3mjRF27NEgHWWC+CgowAqqiK/V8edADej3uE6k8C3zKxdKMAURIt2hxC8CL
         L87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902132; x=1781506932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jg/4zRj4OkceNTXlSoSEHKDpleifNPnfj3feVytWbh8=;
        b=WLPAv4Taoa604x5xLqpRT6cdZjC/p5iPUWXMno1fX/7ZfGSQ5EKJK1WpaaQMEleMsd
         zwkrbnadLS3ZtOuKQ1I1NHOvXYSsPd82v4TFnt9D7uNYm8yQyDam4yE+Dj6GcRSO2WyB
         nPFfArrBhDhmyWYoGh3ZQyEn5wQUKk6xwqHvxK0qFCIV0uyxA+jQZ1MH5xph7qYnP+gg
         +hM6CWS627znuMEtaKnR6CfyrWUlDRdbVlAYDy5HSnkhqliN1nIm4wNMwLr6g7wTLVX8
         0++nKFjKqevGoSPGNc8tZ5ZICHadqACrwq/o4NQhmwA0Te96VyKNqSoGpT30vhkRnNmU
         NEjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hIt25M9+I6ejwN2Q9rOvz0E5ZE7NgXqz4pmG6a4/YOReoliiZ+vxjJO7sxD1Kkdp7AeaR/Qtm5qUIXyWvOFbB@lists.infradead.org
X-Gm-Message-State: AOJu0YwjXFfw3tur9nizJ+S4/9a+OqR4Hv7pWdqSiCLA8sypXTxqSEXc
	5mgKk49N0qIFg01L42+7rJdT2N9MpvdnQJpW53W7usFeDUnMy+9hVpXi3R7fSEYeIsnA52si3If
	m3N5Eq77U8FGy3J4Dft1cvhXn7hYu0H7G1l3D7d/qRnSqKFSXWjximYyygQMtDGODoY5gaFyH4P
	JSwQ==
X-Gm-Gg: Acq92OFOwPnmnll9CkVaYHSZCxo2s01WlSg/K3xFzt3prGr8gBWaiY72xBRy+LFqZQA
	jxE5VSiT17Md9Tu/Edbme9deG3URym+BxH3tthTL1THQ5N010uiqa7QiK8Iw2DfSZ4/wBz3CVkD
	T27+khn7VmTLDlEDBANykA05C/JuzgcqTUXEkFux7jckmVOnQ5485zE7br2JkcHhkMkZIUVdkKD
	ZWWvNEDZoubcP/+yqwzf56+FcOQtCvmG440wBqvnZ/KoQF+SXt1B7pHyot1M/851BsRlIjxPuxB
	2yMM1gQgVZIowpNI0Zka19VLuVEOL1B4Y0P/d2cu1o+kH4Dl1mo7pCBUe5EV+hD0ryIXorApKlq
	t4who9VUZqqQ/oB8X/pLGVVeUS8Zq/ZidowBZxIheoswjLq4javAHoeQR2Dg=
X-Received: by 2002:a05:6a20:3282:b0:3b4:6cae:4a51 with SMTP id adf61e73a8af0-3b4ccd60b95mr15783346637.11.1780902132550;
        Mon, 08 Jun 2026 00:02:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:3282:b0:3b4:6cae:4a51 with SMTP id adf61e73a8af0-3b4ccd60b95mr15783282637.11.1780902132028;
        Mon, 08 Jun 2026 00:02:12 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86151154a8sm6267723a12.22.2026.06.08.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:02:11 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 12:31:43 +0530
Subject: [PATCH v4 2/2] soc: qcom: ubwc: Add Shikra UBWC config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-shikra-display-v4-2-88a846afdd5d@oss.qualcomm.com>
References: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
In-Reply-To: <20260608-shikra-display-v4-0-88a846afdd5d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780902106; l=1072;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=rVf9yUiI4s1YDWhWJ0K07qBAlGQcKyt9Ku/bgoySARA=;
 b=ny50TIyWUidyGAoanv9GgdCfanSDF9NUNBpKf2lLq5HsfD74oor5jsEU2fR/ek82X97Y7wl5a
 pQpTBxFfCAWD6I+WS5VaSGpScGu+HZgiinG9WqdVvLOmKN6/XspjrnE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a2668f5 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=XuKMx7f3ltwE3Y0lsuMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: zf_aY3we-4cfIK5DZ8xFnoOD7Jg59tZ-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfX8rUhq+Cu2S2K
 ybd4q1OfiCj5gE4wFLMs9rDIJ27RTBjDNLJcFzDu2PuM+8Qeuog9u99XKKroeuNNgfYhVOoyXAy
 2qIrhkmUMKwHlgMDccqiyfTvGZW5Xs0VigGyNyIUeVfaZ1j8ghVMSS6PSuZHGBAJkuzeGQU4Vgk
 4ENBvI/pzBpIyEH+eWCWsHQJJ/mLES4cwW5GP8mmijLJGDhd4LnpNazZVf3vkpZF383Veg2aSC2
 6v7bg+A6z7SK5c8+f9z1sllTOQ4RWwoDmTaGeM+0g5+NHTb5XQ6Y7myw5WpPlOLPDNyoke+1IAf
 +cKsFdmT8kcxXvQiCyQCDPyfrq1cbg8dwaFN49SHceA2QHJOJWeiES8CsFAS8U/ArdrZB0XG7oR
 mfmg7QBgY9X5qxEi/P7yxRtq+g4bGYDtzTUhlMi8mwBTFIMEEk9KVFN00S/CnEwGtqHgdtRq4nx
 VSKFZQ0k22pVxkcL4WA==
X-Proofpoint-GUID: zf_aY3we-4cfIK5DZ8xFnoOD7Jg59tZ-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_000214_625573_CA6E5B3A 
X-CRM114-Status: GOOD (  13.25  )
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

Add UBWC configuration for the Shikra platform. Shikra shares the
same hardware as QCM2290 (Agatti), so reuse qcm2290_data for the
UBWC settings

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 3fe47d8f0f63..1a2e54c6480d 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -278,6 +278,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,sdm660", .data = &msm8937_data },
 	{ .compatible = "qcom,sdm670", .data = &sdm670_data, },
 	{ .compatible = "qcom,sdm845", .data = &sdm845_data, },
+	{ .compatible = "qcom,shikra", .data = &qcm2290_data, },
 	{ .compatible = "qcom,sm4250", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6115", .data = &sm6115_data, },
 	{ .compatible = "qcom,sm6125", .data = &sm6125_data, },

-- 
2.34.1


