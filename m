Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC16C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=YINLzoFXyskYXh5GgTKbt+jsPB
	FNZZcdi7tCcrWX6TwQ/8L1pUkSoWzAikSOeShq3WpCvOHaRjQoMEmeFVjVNX0RBhRirjOk9hTm/fZ
	7TlvZhJ7C57vLu2uY0JEE0k5xmI5zY+Z2uVZGxcBKOasx2kvjL2PYBI/FQwgt6a+k0nbpsIGeQoyS
	mfCVMtV3ExLoXYnGlY7HnYUaRQMDcriAVUJvmJyUbaDiOJCuNtAcmj/MdZZvNErYsUq6lh1EEbfC+
	B1IC3t8eoslDXS+JXrHKPQ4pnSSPxtkNYqNYkOvN9W92+qMN0ItqqJwtMjla9d6NAuWGDjGHPttMT
	L+ywo5mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr4W-0000000DfJR-0YD1;
	Mon, 06 Jul 2026 21:41:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr4R-0000000DfH3-0l0i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:41:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEoSN1652618
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=; b=o/HVbnMKBfWdPeGE
	YfYaoyoYMuON7hNNIrCJ4qeYkqm+0GAX0x95cvU6wFADsAFvB14Fg7zY9I+x8Kr8
	joP6cPJGyqRiA2M8kFUUJFkdngGFLDD/FbnO5iF12K0FrpsN328ZKuLdRNaAmppE
	Lk5BNaJEPm9ZNgfYqd28qCKnJ0VssVdquZ3ULhDf2f7u2NutjYXufb0qeY0r7OfO
	2SUgzOKo2bCWgmJUOh94Qae41HHid8+OyPNjuFM39zDUfO6vkNyzabNEfS1CXJ3A
	wnVtwXbhmXRg9vnusIQ0vIjuEzzoi3Vv/2JBOXKeQS9Scbm+TNTayATWFB55E2Ua
	VJnhZA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgu5vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:41:42 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so39187415ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374102; x=1783978902; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=M6CW9z8est7Lwo3stSqtOIGqezmc9M180PnILL4ucpS9yvJZiS3NwzwDFq2RN+q7Mj
         gCl5R47YUVUWHt8Q7y1JpL9Mv0SzWEzHlbISQv9DrkwdCShUqLWmS+lQDilDIpWOXU17
         kz+ChN7ofqes9AkS74sMLgXhVfAcSNUlxgcEqTqJQ+68DvVdw6AYO0z7D3PAgjpBfffw
         u8jFTtKPDDAObvGd1N3Hn8q+O1yS1Rc9wtSnBv59Yd6fG2nR+ZcsNN7NM6xeQHoqSIwc
         BH3Z/aJfZ90d1kRL1w0JQkcvaBmVrhd1GobxYrxcHyaIl5RXd8qVz7aLRqgFpx5FqO1o
         t9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374102; x=1783978902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kJCEGFaL2BWb7t2hrhNOF7E5Nh+JxpjT/H4VU+ffr1Y=;
        b=XhGtcV8Hs7gmcGliBTlu9SviIPVD7wD19D1jSlCGB4rY0lvBEoB2yCvzmXqUBwSGMl
         dXH2YjWYOmcofGAEqFXoWDPAdW7xJH7lpa0b5TK8M9bVSt3AR0EP4QDY0jCYkcs9C9YV
         eH2e+EFNqrL3DkfOkfq0T0aFhYF8vOR2dntkYLDeclpb7qcdrzfmC7euu1oSSgG5GLC0
         /NYaaEf3h9AbrhQ8MERusvNvuV2es6cMRPP1Q37Nxx2srIbH0GxIUpcXwBbYgjZ9JtN3
         3bDAIu51OvrTBHMQUTd3zTyY1vr12sySqxdv1dZ713eWcujDzymgg6OpJp4BgQDrr55l
         K1Zg==
X-Forwarded-Encrypted: i=1; AHgh+Rqqjba3IeTku/axaSnA+gwfnnT4qq93G1jw7PULjtfKM4XCv8yDdL8Hp8Re9cjPXtmtz7wGJhbklrcyfZVi5m58@lists.infradead.org
X-Gm-Message-State: AOJu0YzeXLGC/SdkoKuqHwt8sTbKal+hJVKiZs+xyyhWj+CFYToBWWQJ
	aRNAzIfFCDNObcw1wt4ibwJSUp3nmai7xM4kUPkNPxZF5ruXE/Gi/7Had9yC5gm/VPCUlypjgsp
	kQL2Aerp6xYbm9uN/kD9uNZSMroXmQvXMVAcSM5zn7zZLSAtd1IF1A9jN+hYvgEiigP50IhyNc0
	LX7w==
X-Gm-Gg: AfdE7ckN5Emo68SW3mVJzB81ivhBWuJ2lsMKJ4Axx1eM7MDNt4g2g0IoKnQB/cL6EFu
	7tQDdX2H/nEkQfpxgJDboiaVbv7fv94PvdjxeSxQRBpSJSo4L1jdjYYERVLIVUq6/mEnvBlS/sJ
	OIo3DOSnOU2nusECJgrNFUdw1WE5HonRVrc2JGPnqnVVZ7oJJAbEp227waQPZt3gbnIUiw11roF
	eq0O0TIEizHDyJm6XUpZtOVcBGAIVeOucBREwpbFMlf4dEu6GCjRkh25xXvj3FqQ+fljACJngjT
	XX1wMNNR8p9SaYqqXBLYSzFEwGpLqf/SN8lJA5UJQmu/lHzDp8ebfQVUUwhM52dgCX2FzAvpLIJ
	Fd+COhXELP1tS27y/mc/WNsTiXiHVN7WC59w=
X-Received: by 2002:a17:902:db0b:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ccbe6134e8mr22172635ad.13.1783374102094;
        Mon, 06 Jul 2026 14:41:42 -0700 (PDT)
X-Received: by 2002:a17:902:db0b:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ccbe6134e8mr22172395ad.13.1783374101635;
        Mon, 06 Jul 2026 14:41:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:25 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: kaanapali-qrd: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-7-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=851;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wcNtHiPt37tRcLONgZr/t6X+o8Dp6m14w6rdasOzENQ=;
 b=/vxFPiWhExDAZrwWpa9l5y1Vh5+B3MHCEDcTetW6Rnsi8OF+RTcQYPZQUwPmK0SL7uCCDX+zC
 BZENeY9M3FPA6/x/6kAZHbvTkjGW6EySXdhiV8xYjlk/ovPvpLvmdhJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Fq2R-e5TJGU4WtH2bM9gnHXf7aDZTiuC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+nNiDirdQOsZ
 AZiSxSGAyexC/lghtAXtSZ1H5cq5GdDj3vsZ8pmRBh7NBsV1rQTS3urxyL2t0bL6N76ElGEg4ye
 9P+t9oHNdfn7jploNItkEzdA1WPqjObRE9qX8h897oAsdTjwj/zkYDBAqB0YmBeeDru9dc47q0P
 tKUpK9B71EaXbaf9/Kq9x+C8ru+lvzWe5XdU/XEre5ZVUDexAG8dlrB3Id7lo4uq0hGYOU6aXp8
 4Gtufti01TuxgZkPUteJ0Ph0JGCauYvXG06aikIUCMClEPO8FT/a6ej0OYYXDVrUk+Yw4UZ7if1
 1+g6UY/bmDLzs949G0njnMikALRIygc4TGlcNg43RLYSQG6QUMOUIe9REKJZHXkKf9Z9k95baWA
 us+FvM5oak2fhfr1nXmxG4PlY9z1/PtOJbJbdUjR8FB2rO8weVyPboL2j07xQ4yhkJnzDO/Ztcq
 ym23e4+OgivjahMT4FQ==
X-Proofpoint-ORIG-GUID: Fq2R-e5TJGU4WtH2bM9gnHXf7aDZTiuC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+mDMSEzYl/rz
 GwkcYbI9BjDJGilxoS1al/pKnyJdcHcW8lcWGdrF50CRcbupuAdh8FElJbpriCqVyOPxz4aql0R
 L9ONFSNInKv8PneFKcF4LMI61oL2Up0=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c2116 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ckKq4DLX54o5ySWhiFgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144145_800414_D23928D7 
X-CRM114-Status: GOOD (  12.51  )
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

Add the secure firmware name property and enable GPU support on
Kaanapali QRD device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..6bef8ec151f8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -693,6 +693,14 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
+};
+
 &pmh0101_flash {
 	status = "okay";
 

-- 
2.54.0


