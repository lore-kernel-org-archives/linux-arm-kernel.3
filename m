Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B33CDB463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4iw0I7W3mqn5fxj/Qx1BIFB2Igjy2lSGReQd24IBms=; b=WT82Dp6AwRBsMZsrA9NkFIuvYm
	2dSx54+2ZT8kg299NYa9WRtWodP0AkyCWPCs60koyTT43Zs61jDzUHN/3WqRUAXBxTFjz98YpsG6J
	XQdZMEaQgHWPu3WWZ/lzf4dsI+w92aftLej8LLY7vszU3bpU2zpWSnYjUkQDznijWXRCUvOg1+ZQY
	CabZa3HXfVI82xOSjAl17waCQdn2TDKbGVFwqiAC0a/Ip/4a3JaGZMl9RzpVoqBwtuoGMamjbQSca
	03/oU2UTa3bDCuyqjWykzvx+upsHo97UrnTtfXNfdcz7MWRQg/kgdoh/IYIypx1orA+eFviPsL4Hd
	2zT5vGsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnK-0000000BHln-1GqQ;
	Thu, 13 Nov 2025 23:32:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgnC-0000000BHfk-3o9B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:32:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMakNL1699539
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x4iw0I7W3mqn5fxj/Qx1BIFB2Igjy2lSGReQd24IBms=; b=CZtm2hfu0Ep2VauJ
	QiE4vlFULP/FUUdZ0PPwzJ3w5WgYVpBIX4nekIVXnO7ar+zL9K3c3ddh5KiVNf/6
	NnJfejMILoRasJ6T+F8Kk5V94OdqSwNSE6493eu3NiruaIS0bIxw1SIO8ZRbGwxT
	Xo/a6naEvxxNQsUNg9sq9idPeghUcmN08+wOUsKRo5i52Ktrvwb4B/cmO+DUosfC
	b5WTNoPulcVXz+bZzHwaYW3UZ1GZgVWuVt0UhoKD049vuAjpviSIbtzUbjqpL9EH
	5sXqQ/5XI+OsueA8/PlR5n9vsBmvqa9HKixMB9F8q+/FiNByKzBrEhJpXZEMeGo+
	1UJ0zA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e048p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:31:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b98e6ff908aso3263594a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076714; x=1763681514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4iw0I7W3mqn5fxj/Qx1BIFB2Igjy2lSGReQd24IBms=;
        b=HE/zs9SMdYIFP4sBxjVpJTCpnfkJQ7Xu+RFuU3RWUyJQcKfIhabPLuIyqB9k+rMF53
         4ed01DEBOfdXP7npzM2yZ8ewfo011Hg3Chn0MRsTgkFJymTUn1AgVwM7T7E2aF/gre4h
         OX0ozI2Do/9h3iEyqdFXeCI/hr8aQW7w223CjBlJwCUR2qN6jAwyn9+pAQz1yOKDlFRx
         sd6wW2rl3Xyt1EYgE67ZcLDVYBTUlBnQx7/Bx3Z7ezgPKbuqdPPbXtEjPvVdzcYAhawV
         5nXBdxAV+VsvChXBonZ2Z5dtE4JE7Id4wbmO+g6K6vqQOjerfZNVNNVnIAYyw6vEq6rN
         L/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076714; x=1763681514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x4iw0I7W3mqn5fxj/Qx1BIFB2Igjy2lSGReQd24IBms=;
        b=B/U9sptDDQVpToNpiYZpSdp5JJAwRbFbuLnO15ul93gcBEeweooDVHCmhXb/ntrNSM
         B9USVEYAm/wKSQESGuC7J96Vu1V+pv3gJW6HRkZcrTgo/KGu4AWcnffM1ydqESiK9FN9
         boHu5YO8/WCPu6XN7aPunNaDaXfzcXF2QoPJvwJ21U4DhNhZVTFy0958uZ7zk3AWABPZ
         YPOWWKkylHFF2p5CJNct+cJXlLSFkPk6D4G/4EN/R014f7SOgtHD5JH9cx07M3IAFt5G
         TzX3KR7udMlSyJbPD/Z84xe4Rn+A2CsmxwieTH0DqsLhQzsfESHyVm91wV89uN4F1tWi
         eM4A==
X-Forwarded-Encrypted: i=1; AJvYcCXoRZYle+fYCOPM4ZH8axhu/CjJQnrykq+EkXHFXs+U6XkMB6kOxFRlVzLjcK8YdK0lN/cX6QF4go1e25BDqiMH@lists.infradead.org
X-Gm-Message-State: AOJu0Yylg+ti9PMTjc6IoSLQ922OKImuqTbGRa13A2KCybIeURMS6tu1
	lNdr8xRUKpsAHcMhjkzkC5s9VOQc1wvrmvpRCZ6Z1aAqwqi99/49OHM+bVhUjR9IjbvvymiVoK6
	W++i4vw2Tae9++LNivZpG04+we4U/C4bcXfxToZxWjT5C5+LWWBrCltjfqevqzpHeC5uwp2JXHj
	nE5w==
X-Gm-Gg: ASbGncvXbgDrr7m9I9lhZIE9aR+KQrF/a639TtxzyLqBb457UEtdK/2l2z7YBe8XxgT
	2Oe11NiLurElsHlt9vfswbVCC6bSxZE8bfDph7uL9MIlfhiY5+G8RQJt8zGKfbwdbZYUBwXp6f5
	rsxYWbRxUD6CPBndaOGhsakz5XgnVtyBKcga7S2Td1NsnQgU9S/xH2cp1evaJ3ikd1iLLydDWk0
	qyywUD0uS0IEPMzf2Gt2FlutGuJuhc3L8E1fPdMomboxObEFXgbqIFUumwjQrwUtetfxDA2oLhT
	wKEAowbLjL43hK4/lDMjP+iWoyBEySiI4dnDqp/+tKBrggdnZy+W3gGxi3pKC2D/lILaAwFaJ20
	e4hqVi86tYAa69133VZa7xok=
X-Received: by 2002:a05:6a20:244f:b0:342:3b8a:f33e with SMTP id adf61e73a8af0-35ba1d8bff2mr1514846637.39.1763076713662;
        Thu, 13 Nov 2025 15:31:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmwgXSLz02FWNkJ1X/On5Tf8zKgGmJbzhu8REJ1vhWtxFUkvZ01iBmyvIGhB3FIDzn2Lj7cA==
X-Received: by 2002:a05:6a20:244f:b0:342:3b8a:f33e with SMTP id adf61e73a8af0-35ba1d8bff2mr1514797637.39.1763076713120;
        Thu, 13 Nov 2025 15:31:53 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:31:52 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:14 +0530
Subject: [PATCH v3 17/20] drm/msm/a8xx: Add support for Adreno X2-85 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-17-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=8789;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=yV2Eh2BxPAIz/kC+YJkyf4flz+m5iCj31pjkURNFVlQ=;
 b=qqqgIhwm6BzPVKPxN+RP38o5Z6wGhy7cKXrIloZyDBKSZptL+ZhI5UIdyc+J/vBHV4tptn3TO
 g/nijUlTXswByKZ+/Z6beynypl62ajNE04ciu6wgFHo37u2WaeYLO+G
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: NPpNNHAnQ0Y5AwwlgXulKC0VK8p7TSN8
X-Authority-Analysis: v=2.4 cv=SvidKfO0 c=1 sm=1 tr=0 ts=69166a6a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vUcRZ7zKRWKu6Gx-IyYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: NPpNNHAnQ0Y5AwwlgXulKC0VK8p7TSN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX893LD1xYD5lB
 RN5THtvHPx2sJNaLcfRosbZ9XF+FhxERYvglmpqQ0D/eNm4fP9ynsClm2sPmXoblcKS5w40d651
 keWgwfcS9loOfVD5JDTIEATBiGiSfyQfd5b5O4disrA7fuaMXXcIJs855V/M+tByA7cW04tdrb8
 e7pIveM2L2UbJyLhq7nK0NK/W5W3WqSvKjG1L+eyquNb1aQRYVcMlq9TInU41gBFUWFRDj9p+2H
 JY3GW5PuT6Ha8GSN8Qebz5duxwNhI1J7bGvOsQIMjSBUzbrjZj4k9rtD5dLPnTyfAJOuQ9SEMZ9
 V50e9uhpgBv8jEpeLt1In8daIrU4dq0PE/LM4uAzJT54DMyNxh66wzGUHHK+Kxk1ZfFp7gHWJXx
 xro4eGHgIofmYTNBHOZWICiQd78pLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153155_007983_E8CD7A2D 
X-CRM114-Status: GOOD (  19.27  )
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

Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
on the new A8x slice architecture and features up to 4 slices. Due to
the wider 12 channel DDR support, there is higher DDR bandwidth available
than previous generation to improve performance.

Add a new entry in the catalog along with the necessary register
configurations to enable support for it.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 132 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
 3 files changed, 140 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index f064ef6b8be1..abd573381b7e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1634,6 +1634,108 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
+static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
+	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	/* Disable CS dead batch merge */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(31), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
+	/* BIT(26): Disable final clamp for bicubic filtering */
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ },
+};
+
+static const u32 x285_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
+	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
+	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
+	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
+	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
+	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
+	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
+	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
+	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
+	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
+	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
+	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
+	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
+	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
+	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
+	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
+	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
+	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
+	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
+	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
+	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
+};
+
+DECLARE_ADRENO_PROTECT(x285_protect, 64);
+
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
 	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
@@ -1766,6 +1868,36 @@ static const struct adreno_reglist a840_gbif[] = {
 
 static const struct adreno_info a8xx_gpus[] = {
 	{
+		.chip_ids = ADRENO_CHIP_IDS(0x44070001),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+		},
+		.gmem = 21 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &x285_protect,
+			.nonctxt_reglist = x285_nonctxt_regs,
+			.gbif_cx = a840_gbif,
+			.max_slices = 4,
+			.gmu_chipid = 0x8010100,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
 		.family = ADRENO_8XX_GEN2,
 		.fw = {
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 386ee1207622..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -190,6 +190,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
+	if (adreno_is_x285(adreno_gpu) && state)
+		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
+
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 450e655f59a4..a44331dc0003 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -568,6 +568,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
 	return gpu->info->family >= ADRENO_8XX_GEN1;
 }
 
+static inline int adreno_is_x285(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44070001;
+}
+
 static inline int adreno_is_a840(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x44050a01;

-- 
2.51.0


