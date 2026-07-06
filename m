Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC60FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=p0zUS7OwasawSBJe2+Tbu5BU2w
	pueb66NPk+fEVs0NYTPAVj2894mcsZrOZUqVez/8bgNC8WhhhXTeARKW7bp9R/HtRcoA4IU5PU7Lv
	MKtBN4bw+xMAzq5XBLzxTmPaFF4sfNrLpQyhP1e8OkQvi+T7gGcH7w4jCBD9dpOnVwr5/l5QbQumR
	GgG8EQ8ppOFIx+p4VK6QwVCR3TNe8upF8ao8bcQgEMgQML5HavAdWqnKHpEUSJmjKavbNmrLDSth3
	64h8upeqLIrgdC6ecPIGZm1X1/X+22s5hmZpI/uhiiTEtoDnCALT2qocC4QnkZucFx2ql4bxZfefF
	kRxgkAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqV7-0000000Db0S-2BUz;
	Mon, 06 Jul 2026 21:05:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqV5-0000000Dazz-3kMU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KE4IF1650822
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=; b=lkb4D/1XuVf9UMpQ
	BgU+KGNhS6iWu2lcOfX5GQ36WYrsSl18R5ZG74JTkUIbt8g7M64XiGMIgDLGMCmF
	8PjEYu/uy0TyMoB7bcj0rENYAY1HMLQhHKwXsHGY73TTMqtlPFSTsZA86gLqU3JN
	14VgrVo2Eg+mXxFka9uofvowzG2FT/gddAJfxxj7+nDP1hXyQ8LleIY8W6MIblMz
	dzXbGoALDZnzvHPZr7XeA5ArlwYHJoMFcywOfZvxj60WrfIlXAURgFKxYP0HCx4t
	WX7BSPXHvMvlIwwVnd59NQDSxl2geVbVvbSemyyk8NEoPHtVb3At1KO6y5Qjp0v/
	aD97iw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgu1hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a20348ceso48805325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371910; x=1783976710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=TZKk7ekdkYpQTT7RzO309jV3SxRElhNl+XezdteI7uQ0kTrc4m60QBCFUjmKkV4koL
         1DjH3UodKe93KNJa1wTfQgGZLDIzoqDutT0teXsX0sWwPRz6fzjy6pwD1mrpcFgew8RE
         i6oZsejQBaAMulMnSrqH2oM0tWyv9OEmIGgZAk2yueA//7WqQ0keeTgJnAxZuv71KIih
         dXcMbpu+klYKeqWo+JAzCJrmq2kngWbGb+pMuBhpN4w+OArj4NkeWuO4rBaaaH9utKOU
         rzLoUYMPi5RQLH/APeB6m4DOcN96QruR9uP8bPLElUzN3lZv50fJtUKZ/6GwmyaIgue5
         HNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371910; x=1783976710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PRyyWybhTFXDYdqUvdU9HzDk0XM7qXOARMEqjkTcmss=;
        b=NengnSAt8777XnT1ZmCOGRe90d8khiMAuVIgPpc7GnYhfeSKWp3h91TxsFF5bgj5i2
         6quIx7Y+t+XYo5FI3DHrAY7bSlQS+NGfw/1I/WLdqEmKyIPJVYcJ+JNra81k6U9R/tKV
         DYKCtODdGTflpnCiG84XzCR/Q7Vly8fCiRIyLMexI2obZZx0Y9HQLxraKR1Es2Wfy/+H
         YqJhNRiyqqO0fuyPwL3AqM3ZZeUVDunrPURyule29HdqTnc4syvIDDgqI9zofeNHS9Tr
         FGrU25IQlpFjxptuAvIujecInqIFGekA+TzfyqtQ8TwZb4O2sgCZn6AYFqpmB0vghSLE
         A4Cw==
X-Forwarded-Encrypted: i=1; AHgh+RojCjTHroETuI9E0dWQ8Xe4JSiGf7ZrWRQPolCztdE1Ljl5THmsK45ErjkwczodyD3sajUMqT7Y83LqvPZ2T1Xy@lists.infradead.org
X-Gm-Message-State: AOJu0YxUH4p2ZUg29WBK2eLeadF/3EceZ2w5X2BXhXMk+EXB8WSekxk+
	xkux8oIz/jqrtq+wxbgPnjtJ5AoqUF9yToPWVITd+bdv8gFRmtokeIoVdgo9P2INoKekfliIkMM
	lEA24LLG9eAqBVZw8VqSv5lpPlX4Wmr+KFiGb8Fsvz6+Ob9elCVcH6YpG9dr5hTlDGZOhMl7dOw
	Q7NQ==
X-Gm-Gg: AfdE7cnVLDmkMOkkgTfdEntAw++TaIecAZxzObtaJulo2rwqRfg80QHfQZsGVNUoqAR
	Ey9m3/MLEQukGvJYjoXJov6m81LAAUUeICDvYAcpM5uHXm7CDUK5c6dCqTVxfT1ZrEjp6PUgrA7
	haqwW6xvElfK+v8kAUTTNQVrBogMXZQcq9kEU1Q11gO/duma33nZC08qGPpKJcDqfyAkkKbUoeG
	fm3Qr4rJGVhM1KjSXD5JXt7yyE+GWydhOBz4e08uhYO6+RD9feN1BgAkiqGsGoTCEcG5DdgoEy6
	0bYGUbnUNdiMZFZXF47/FfMOHSwxmpTWwyu1qOKylHBgpmkJgxsGtPmUpAyTXsxfi6AWwE9qJCr
	BjibgKQ+br4DfCozgzVZFBpBotDEaGvL6sR0=
X-Received: by 2002:a05:6a21:2c11:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c08ed578b2mr2371344637.22.1783371909926;
        Mon, 06 Jul 2026 14:05:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:2c11:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c08ed578b2mr2371304637.22.1783371909486;
        Mon, 06 Jul 2026 14:05:09 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:33 +0530
Subject: [PATCH v5 1/7] drm/msm/adreno: Add support for A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-1-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=1210;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=vmi+IpVwDwItd0JsdKwDI4X0C7GvFEMaBv3VFip4Ixg=;
 b=kpXC7qkSjgoy11voEpWm/qgJfUAZ4c17t4cpkQg5YXZd8lqbz6loooMhL15RODOHIRwzyL6tK
 a0+2Ku8Tb9eCjyNtiMNg36/Gls2eQ6ZhlTTCxX7OXHZ2QxAnkps9BWj
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ZKNwtiZaYvYLs6PPtrPMHRtqaoV0GPc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX6uuA214fFeQ9
 CX89xE9pOYAV7hyQpw/ZK0uDvXGsZVFEK2VeSimEO7bk960HdoWQ3D3/EdAujERAP5pH4piuZIG
 VXCCCkMZvSZW1yXn2ML/xUn3PGxfJ4e1fI+K5arMpYZB6XujxbVAk/mK7TDpBzn2CSnIcDOIHtR
 ZPjeap8L/BCDl1zIGx+62I8lo/n39FZLRmQ4h66xFqpGR4rL041yKT16ePe9KRD83i6WO2yyavD
 CQuEGJdQ9QnS9AEHENf25Q0NUVfSQKUv9Tru3tVpBzA2mfhkSqaIQSvOmnO6vMnnO7ZlW+Ea5Ed
 kEa/r38ARZAIfou0nUTOWF3uqa6jBurW5gfWuziYoB2Tw4Gh/E6f6DElKThwu26me0JkegV2xdC
 TLBlsFhdNap0Uc0aea8e5QVucxAI3b39jXqRku4U2/qTp8GjsQMrg1Me7sKGGXoMxqUmB2Yq8hW
 EHDODtYK5hC8RxGTmOg==
X-Proofpoint-ORIG-GUID: ZKNwtiZaYvYLs6PPtrPMHRtqaoV0GPc0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX2vMifJq0A4bW
 XMgUJubEhMnMDfSMz4+iSFx0FSA5ME40JK9uoBp1djRsjHCdm1RRe8u4KeT9d3Jjpf5YzrYMgZa
 dRq90NQ94+xGkiwAZOsaLd9gtdSBIZ0=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c1887 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=XFVbiEAxaSnpWCc0n_YA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140511_955585_B3894A93 
X-CRM114-Status: GOOD (  16.07  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Adreno A704 GPU found in Shikra is an IP reuse of A702 GPU with very
minimal changes. The only KMD facing difference is the chipid and the
zap firmware which is specified via devicetree.

Just add the new chipid to enable support for A704 GPU in Shikra.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 3e6f409d13a2..2de3ab010135 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1454,7 +1454,7 @@ DECLARE_ADRENO_REGLIST_PIPE_LIST(a7xx_dyn_pwrup_reglist);
 
 static const struct adreno_info a7xx_gpus[] = {
 	{
-		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
+		.chip_ids = ADRENO_CHIP_IDS(0x07000200, 0x07000400),
 		.family = ADRENO_6XX_GEN1, /* NOT a mistake! */
 		.fw = {
 			[ADRENO_FW_SQE] = "a702_sqe.fw",

-- 
2.54.0


