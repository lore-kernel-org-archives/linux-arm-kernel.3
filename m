Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9762BCD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=; b=uO1viKQ1F/VS1fSbpRKbBgqZN+
	6cXv5I03GSCn+98HNjhV14N9eov5o1xQgV+sfeQZGyr0jBG/XsQrBXKz3lUy+0U3FWmytddBslrPd
	34XqbpXNnTB1G9t/JJ8BJx7XodCvILyVyKU4qJlFsQisypTu5r/BTjTfbt/oUQe7Dx5icyRlC/Hos
	5AvAuv9PsIgd8EJJVnElTwuNBMz8EL/1UgQEJGC+2fkKitFPH7jwQQ848yVJiw2Gb3Tjr/kQkJ4hx
	DDm7JxqfRA5+xc21p9cTz13aJSfEfhE5EwvY/6skmIxyGcbtXNPJAR3s401CWBo7421vjqq0UsiJM
	nsIodkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgm1-0000000BGrf-2gyE;
	Thu, 13 Nov 2025 23:30:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgly-0000000BGq2-3xrZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:30:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMasVG1629677
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=; b=BfMAHJwY5fxflr8P
	IXw0KyTixDRZMxONIjC8C5SVj9SF0YbfculQH5Q4xUy5qHHqli1kA7y5jhD20O/c
	pUG5GfnGViNRoG4LxV/HVdrwP8NKJvlgoN9gT6S0ZmHxCETGdfmjQquvxqaeWJm6
	us0rc7eUJM7sSh+2yEuhjeu+nOYohKRDFDS5kttL58rDPgbqdgEo5lJk/HUCCqvR
	iMBfrQWPMspWTEx+O//AyKxez+HIvs6zB1eHQsAs3vzGZ6KeXVIHNv+aB1NZRqY1
	0BdPBPDkMx/HsPhy93CyflRAd4f2rNqtLfjHQDqNY2Sd5WH/l7N14hm5rau/zu7A
	jSkYbQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d83ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so1167468a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076638; x=1763681438; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=;
        b=L5Gnidb+znj4VsBKTttt8gYnY4Qh+DHDTOOSi3njKhhSPnSTeCm88CzQe1YGLAmcwW
         ttSVK/pHywBO2jYw5IYvMdCY0UjRGaZ3o6cUzWQADZ1+geDg2FwWALdCwCa9tTZ0W7f8
         MalgDD2we8ZGhVjz7QyhZFZe7AV6XZ8yxkL8r+Jn4mDtIrkzEtrB1qB0QMw6SN7Rubk0
         pQg4kECjdie6JaQDTfskxXmKE9kw8XGP20Yd/T3qQuiudNgAIa6auR7yl4ReQXo32n3y
         DOTmhcVn/8S71ccoA0Hy2F7BcmDZ5VA/WLajZjxCq8gISLGLFoi6P93v79XScnQMwPiZ
         vWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076638; x=1763681438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhSbfQfsXDYo5k86Qy1lI4a/r5FL2WPHyWoclA524Ig=;
        b=mrUJF76k9Yhf2iex5kCzkM/b6gJ0X2KQTQWJn4wHpCUbReY8Zic0OP15+hnfrVvBi7
         I7LQLzuaxzcNpwJCW0OLZoqG291Yef0lvXi9iexeoJ8ly4dU6f0Dm5xHMZzOuPyrJOzJ
         Rg89U32/D2ZuuzHR+ajqqFD/lzu69EXh48QUF1pKD5wef29yoeZkjVsURZewZGBs4gpV
         y3WfoOCFa8B4hC7t0LzKjRzGaAwwdiOXhz4g4n93tI+0tbQfYoIE4Wa1yvL+EgFsTINR
         7uJWVPV/Jsz+xgmUguMhs4QcHix9aHZdY/ACo7r8DIvYGmxOeCvuruM0FJ9Cck3JroeA
         V06g==
X-Forwarded-Encrypted: i=1; AJvYcCX3yrE/RfnN/RGAEVWOGzn/IVdjMUbA3sPHd5UDf8CZPKyUyNc9hiPn3jZZx2DnjWSs39w8JNPyHgTC6m0j1p7O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2rg0hYzaM/ilAx3coMigDPsAbQU+ySzbFltSZvVN0mRuDGdCz
	pRJMOK++21eU/ZjrkowQfZWmLHAVoChMzukWatyBy4iUoA+dUYgEJF5s+JCWfymuDCop+AV1RXz
	8umTfpnw/zb1gIW1ghZy62/HGDv3ziUuHSl3le8Vja5mhUtrivrzXQWAlf+5Zg+u0sqo5dLbSc0
	FiTQ==
X-Gm-Gg: ASbGncttVZjcaJ+LIIheNGHmvyTQY1JDZkji5kSzFnFb0Q38JL2HF5rIRIxRr0+oh60
	xehTF6ohvzkATyfDHOwnzGgmsy4r1Uw/jn2Q/cf44tSxMmeJZR0j84Oyh+2PabsWCq8Mp0tb+LZ
	lxpLUt1pqnKyB6wglwrPKBtPT6G4WuRvcPCYcvx7R5yB3MMu8sMqHj9L2+yfLjtHb1AUYwNvvVQ
	yZEt1zmhsWd6/i1GuFLc5iG1Q0LcLVA5tG2cdHHnHC2F7mCCanzBgeMXKGjlDoK/68pJS0K/0PF
	QBw1WvkjUVvk1TdL+rq1RhpXqIt96cmmWg6rH5XUZgNVjigLCGjjUVBvNiCRTKxZmVoWGTtmSFc
	lb9/iRETlPpygFxC/gO3CtmA=
X-Received: by 2002:a05:6a21:6d85:b0:334:95d7:3305 with SMTP id adf61e73a8af0-35ba22a4e5cmr1764921637.28.1763076637802;
        Thu, 13 Nov 2025 15:30:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEn2fDftnkPr0EHpOpGMZQLIPAqXnlxWXCkdgBWD+7nx4rt/A++vHmEwuulwWe68hN+6xKeg==
X-Received: by 2002:a05:6a21:6d85:b0:334:95d7:3305 with SMTP id adf61e73a8af0-35ba22a4e5cmr1764869637.28.1763076637246;
        Thu, 13 Nov 2025 15:30:37 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:30:37 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:04 +0530
Subject: [PATCH v3 07/20] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-7-92300c7ec8ff@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=aLTgU8jaf8pYFojJF1knRYGUYls1un+XUkalxDsrrq0=;
 b=Tk4URntM++zmLSb6MOWmkLrsE9HFNdTk7nCYDUKwhHi9SospA9oJhyJsDSjF4eU3RjzsTrddk
 U5TuaRXL3yADupie5aIE/4U2SHV05LRHE+SWVpJw7MFgF3uJWO4lapH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 3jAsynfO9Plr2Hd4W0W4SmO6h5bVCtHy
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=69166a1e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 3jAsynfO9Plr2Hd4W0W4SmO6h5bVCtHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX0mHRYL43kKgz
 hUmG21DoSXOmRM4HW43XfssKUUbRXzsdxWubjSm9RslPr+2KLh9fkzEDmimryAT5ao7C4+ilQ9Y
 uqJHhK73Z6ztjQNU3M6j83cnkBWCGWg1SRf+jZUAv40aDYBg11ZV96coXRr5Vjw5/VFsmTIjLaZ
 RMqk5fiv9Iz6zx/WpLD7ofh988m1KhmjIRB0TKWgAcOdyncjbRvVyZh3vxhI+0aj6rB6jVKAvNJ
 t6jSiG4JCk5tiisbyMrnSAZKAB0hVAEo0I+Id/9+C/Nqjc130URfWCG/wQcBt4EIU+PN+vvXgpk
 7c2s1YDQ8Y0wSaAY2gXLoJaoSfqrTHF/BPljSLYf2Jicnqqgim4p9cn5S7ZhiQ2qr93A9jiDpWm
 Gk9vlBHNmF5mM7D5i3A1V7hwLMoeOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153038_998676_8C795506 
X-CRM114-Status: GOOD (  16.33  )
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

Move MMU fault handler for each generation to adreno function list. This
will help to use common code for mmu pagefault handler registration between
a6x/a7x and a8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9c6af226b076..685763c12690 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2615,7 +2615,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2660,6 +2660,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2691,6 +2692,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2724,4 +2726,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 19a1a1f699bc..34b09cb127ed 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -78,6 +78,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0


