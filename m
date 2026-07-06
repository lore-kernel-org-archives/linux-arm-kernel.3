Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7500FC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=GfRkfKMmE7QpQs/n5TV8CQBSeC
	jh18u9yGaI7exkXA3lzPGf3wTHZ2UbaoONGNGe/qt6T8pP2/JHq62odHgAm1yjoh40XKZowFqaJub
	Ii4QmVYpUhXWHO3D+Bi6oNEkl3qzz18XGFK3ScpW1vb9XI21jMtYf9TU1RevywpGd1P0gElJt3yMe
	x6Y52R6IPPsUcS2VhGfq4nsC+KtiP8cflcv57sKgHmke5M2ONTlokfSQcBNyUZD0wZ9/Yd/mp2//O
	rnOGUVypjfVg+V1jTdNeetrLpqiN0EoExnoFrrnCfFDQ5fZgl4rC0ll/D8+RS5DeiPS0zGlYO6Ucc
	Rrfoj2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr4M-0000000DfEI-49cC;
	Mon, 06 Jul 2026 21:41:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgr4J-0000000DfCN-2bZ0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:41:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KEI3H1639872
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:41:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=; b=aF8cCuQeNE/JRcAd
	bbZKBA9JgksxORNz0jvl+9V+WsgIqyei4LiWaABWQbKFSuc1ctnhTLNCBrqcGPiI
	NC455v2KZ5WRCVBTfiPwE031EFCZJrnYaIT61BxeEwlHjPkO3Qc1KqhC06XZPxef
	7Y0GASRkuIX2l2Ldcn8qEhv3eAmQZLSncEVUNNjE0I0JumatV4ZTY0i6fxOHt9Ib
	r9vCqAZclW4aTLVN2xklqwyKU0/9AA/PHLcAEszxSnR1uqaANj27lU20ZfyHSutA
	fBkS5gbEgxhclmFPZ1A/ic3Y7hAfaM+pCSFZWvFPUqNESZUxAhkl06ErXsETGFWT
	O19ZOA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3r2yg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:41:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6a20348ceso49262925ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374094; x=1783978894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=DfrCMxcqPNg+f2L3tg9VNtRdPsIFb3UDWgpj9fcMlDFAGUg8hFiOopezYBWsc2swRL
         LRdfpzrKvX3TmyQjac1/HbJ569pA6VJ/LLz7983cisMVrvdXWtZpQfuwPRDL7aorAVtv
         7mrHUry8XMHJjqHpV/cxnbjhoPUZKZyoMEQ6KTuTxqtIuHAGUauu7qOku6a+fT04XMPJ
         mVdIsHm8g5wwjgzzXd9rziCiTCAwQoRpInhR9ZHBLW2uxdM0Us8Ks/CD1++U5zOE8cY7
         CQrjBpXmR3qX7Hw+byTE1LwQsd/3//VqjWs5l/um3SGzmgS78KnBqW9kS2MPb7w6pCBT
         0Zaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374094; x=1783978894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C4mB77oGh7s9Y0Uqowh6UFsEunZgz5Qm0N6N+M/Go50=;
        b=SmkcI/euLJIRFN7NV/FtUEgGAiacBhNolbSHHEWxJT6wQtiHMA9/OfYqaFoETTzoLe
         04igQEoDhT4BQrJYT6UyXdVazGCbjwwySX3kc1XqFcaLYANazfq0tYBg+km1vYAkEMCU
         cEpmPXMPVqZ8GEcNrsauiTUxldIVikZev/4f5qvqecgbh4qOMy4AwgLLrkuErqO8Ndi2
         118BJoqzUdJ8Q8WX+nhdIyVGXAMBt06/wwL0CVma24/8dELLYbuk/LHlXAdAOtAwSYNm
         tWz9Fmh4nF9KEM2i4BQOD/N9bUQDE47V8YwrsW+WeHDxqUX9kRc7Za283k/n5nntQ3qT
         7NgA==
X-Forwarded-Encrypted: i=1; AHgh+RpN93wxCpzB6MZks7+6+Q+tmdQuo4owVHgMSh6CWIVccmwV9fUwq3EWPG6kp1waBk5k7o4KdJYUEQ68bMmf+BKw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz066ZlpAl+I3OBL4dlJJr1yZwi5w9NWolOsZEBSGd3IzK30yH+
	NfVvG8bJPy5WUFH8Vj3exmZUv4Rv5yo635/2AiTs0N6mUUj+YEcKtkIRlEF1CywkE0GOI9HwxXx
	DkF9NI8i4XDAgqZ83TpqEtBxE4mhtGwwCytQ+9Ks2YJhGSOH72rMqJidAsZhftRQ7YO5Fb3vXex
	Psig==
X-Gm-Gg: AfdE7ckJxtt1WmyAxJlUMlyhfyFv8f22mfA05tM9ocXEqIcGA6o8xOKaih3EEeiBrT2
	rISjyYIYuovGc3bOyq2TfbWmkITgX6NwmOaxhF8y0KQvK136+8oelotKsb5ZEzzmN0l2+vZWtHs
	nezS0qGIYzYUVF0ZhW2oZMhO5L1FviCNQLeAxGe3V8B7lG5ndeqMyQpFSDwUU+6aBOGncIUWv9t
	8znYfOvFRmkuBWtgkRtrDh5FcwRODXakjifY4Au93OU/SrwVsUz2NWAXMINUuak6bisz5mJ2+Pq
	S2V2f55QHUrQ+L6PW2Wia0NPetegOWAL2LYEcZJwCrwAUmTaIg6+X8eNv69PXUk0jL69WwFeRki
	xLsJQ8h/CbTG5MOY8ZaAjkpcs+/Fo+pcWCCg=
X-Received: by 2002:a17:902:d508:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2ccbf07a0bfmr24977885ad.46.1783374093653;
        Mon, 06 Jul 2026 14:41:33 -0700 (PDT)
X-Received: by 2002:a17:902:d508:b0:2c9:97a7:f548 with SMTP id d9443c01a7336-2ccbf07a0bfmr24977335ad.46.1783374093148;
        Mon, 06 Jul 2026 14:41:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:24 +0530
Subject: [PATCH v3 6/7] arm64: dts: qcom: kaanapali-mtp: Enable GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-6-8dac9a60dd5c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=911;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vUUf0SFe8a51kmB8FPrJBDQ5H++K+t9n0PvwI74fWXs=;
 b=aWOgXzjDLGOk6ap9wWT6nV8R25bUMhTcQZ8FX1FCMAyQ6W+IvA5VqINg1OxgXuse8gpeFkUWT
 zQiCbM3Ci4mBiSxjBmgJuTY4/9WT4cqs0AYsxWw6lJS2YMP3ONPEr6w
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX2xn423xIMmIF
 mTcwXzhbIKYtsHIizuLf16+Kf1tEs24VbCuMsCxvK/9LZElyH5kl3uR2OQmGDUKXJ1e+JzamUdd
 gR4NkntOf0DIQbm3hOr2dzkHQ7vEII5NnaNMu3emVssr4aOFGBwkgYU8tbznKXio3Nxo7Os773a
 iYYIKcwnnIWbvsh1x195rk+igFc3GVOcZ1wJZxy2XXOl/WzPZEc2Rx8BG1EntANCcKGz+hZfJk8
 PU92IcQg8cdAyZuq3pGQrNgLcEWIOw2Gb0Fh+BUFXhEZ7hkC5XadmCquRWzaoO8W+9FscWhqcxH
 rJ+apnEiU0LTB9S/T3qhvJMDwvtQN1z5CZORA7PULK/VWGTVVkKq3SJyQLWGUoLJtafcYBg5Lek
 /Z423TSw9/f+8ScXyevz+SHnFcW9ZEL/FGVwXd90Ih2h2Z6+EazhzXaTPoI9RkTJfDdlseoeleg
 2IMwToeKZAKGmeyqPEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX6NbXzlcKnG8N
 d6qkNeJ3fhRAs9k9vXIQMLolAwZTY13uUea8eF6fPGBaaoHWkJGl0Z/tkbC3/v7JiG/0NPeLOJk
 MR4/+SJdt+WO8tbW6KApF0Hk8/+IE8c=
X-Proofpoint-GUID: eKrTxK_LcgaMvuSbsvpvE6tB3tAIpUZz
X-Proofpoint-ORIG-GUID: eKrTxK_LcgaMvuSbsvpvE6tB3tAIpUZz
X-Authority-Analysis: v=2.4 cv=OKcXGyaB c=1 sm=1 tr=0 ts=6a4c210e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VHn1p_zO8-rooJRYzQAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_144135_770426_EDD36C7B 
X-CRM114-Status: GOOD (  12.84  )
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
Kaanapali MTP device.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..ba256039dd3c 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -865,6 +865,14 @@ vreg_l7n_3p3: ldo7 {
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
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";

-- 
2.54.0


