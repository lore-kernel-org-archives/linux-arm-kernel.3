Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F2DCEBF92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=; b=uPzQBZCyOXwM15AM9NKVwcy7JF
	4TmIpVNT8TOKUbrrctJSrEf+cpXvudYZUIlc5nbHZLiwdUbIQC67ljLHfavppobDrcMPepzJt9N2z
	yiqhxSTfFD1Qs93AJioAOtoDctcmNaoQH9D3Upg559rUj3W97JR1Og7UgS8QS4n5l/pK+ut2Vj7iQ
	0R7v649OwsnqeoXKaEvluTMcnAWzHyg8c+3dZ95XJHfa7pH9zNJp7vz7jD6yF5hD42T/5w3hzgT2Y
	48pIBL4r6a8YgQr4be0Il00UjbKxLo1C8NNz4EpxbeWm+BwG3OMBTrgxmt6rP4LQY0+DcV2KuY6kr
	tBdpNGUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRr-000000005c8-3EXx;
	Tue, 18 Nov 2025 08:52:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHRl-000000005XF-2mzM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:52:26 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI5qNlF3916357
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=; b=PbrWAn92/UAvnxop
	hVL8WnJV+jyrdZzcyx1IT/cxgRshVWUIpNNYmpgd0uNI8bQUiI6E/wR/5qbJuMli
	g4WnDzjNychYcH1QO3cuNwZ9T7MUPXucS7v5Iks/Yf1HuFscEtsB/Arevxk0WlIy
	dzHEaJFVzJevTlVtzBF9+JCLxTJzJUvvbkswwb4TtyTKWKz1PCrkDHJHPYwpoTYC
	CIBzRN8fSp1fVTZPmm6F5vrFtfHBbhXPb4TWUNy5HZ4OCW2ckXGxtk0rU7rzzB/t
	GebM6rn1rYpxTwISucZzRRXNd1PkicUaaqIHjuNqrZiakCW4N002lOqMde/ZBhbn
	bz6J7Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2fxbd1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:52:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso177392155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455940; x=1764060740; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=;
        b=UOLXUvyBCrxwVdA5zm6JhxBEk63gw5/JOh342VnxDzo0TjR84RSPR1owr5ToBN+Vi8
         cpiXGRoKHAs50BXG3e+V4fokb2OsD6LSl74FGiPRyvhtElILbjhuX4rgJTGY+fRKfQSa
         O+qoOs+u8bKM99JWpZ1UTrT9aTXpkHgHUs0kxzt7AiHOLjPqbHW23fm4btqbiOhtvbJZ
         lW06V3zcNKHzhi/+SZ9seBOBWACT5IowRZkwHDpKdN/b3b66vsMvzOa5fSvL0ORI6OG9
         rPGGa4o1vYm00ANw2+QYFCVz+wIMyuNJ+g68dRyE4XYxkJbOkSo7CGEt5WyFB57Z3vEq
         pdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455940; x=1764060740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knMij2ystjWIyfW63qfz5ONy7pXmsUWRejuLgPEDZyg=;
        b=EyzlSR5zTnZkk5qlj9GeiJo9DbgggMdmZp756NtmTD2YDc4mydk2m560VMXzEcGLiK
         B0Cmeq/WH5DwwTys4DPqhPrd0wO9dCCYqMpZTHbNobBm/A49wWRZUWEk/WogjJN67Qwc
         CWHF/SAHDQaoZHpuIevgCQfL1cHqvEknZ/lemlbD81lOkRdcWiyIu1+JXYtE3DDQX9fW
         hozPgEcVT9YFlJxvZLqvbt33ZhPqe278jmUBHJlqS2BcI4kVnFy82sCYBLCXdweqoXLG
         h237oCIWlE8/m+oGJ3GBK0F0dl30sSf/nrUOBmuMTwT8fCdsfFVtkGRpgIoR3OfsPmkd
         mm4A==
X-Forwarded-Encrypted: i=1; AJvYcCXjgL5JkW3R8O3Uv5AZPu0tiCrUypO023Y/8ClBDwnBO6772OpUZMoRO4KOvciJ+iyuUl5D33z/nyjTsFAwLaMk@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp2Rh59OEKJFfiqJd7cgu+qjiyojzWZjV6BEvrJeAFB6V4W7UL
	3E+x3D4Sb3cgLbsmAQaaOnzX0Fo9gbVZYw8e5LfUcSS4rIT2zwzOTG2yYIl+ZBKSR6RtHGdRnml
	gCSHyVZDXZjCkpK79HAL8yb6RLk6lWBtlOusKgKzSVbybTPjTQytRE2VzLqRmrT2aifNO1BP4xR
	OzBg==
X-Gm-Gg: ASbGncv50JmAQzC+YxppedTwdYrTZGWoB97QC0N9dFYUCUS5MOm2nLq9AdBjrr1OICD
	b4HsiBZUNr5Hes/9vv2t0gvW7+wil01KfKOh7RvyBYIb9qRTM+H8bidSUwedGZuudC3yusGUgCc
	Rl+1rldlaQ8Ai1yOAAB3RkCyT00roX0tvOgFBMd0tTtZUCNbAb+jC1GZZLzPuicxoqR04P5dw8t
	zwOohnBIzH5YzX/pbSpemRB7C0rkhg30HV8mLgytxmuBaac6+bwrCddxr9kcX6Ru5e62Tij9qM6
	pkN4lJClb8O8tKcxkhRBh9Ylu+3VPne8bkrsQvNfL6ZAeJt2sovfIRhTyWuSXeUWQl9hJGy9knU
	qcMUqqgDKWU7Cr7xPHKFw9Xk=
X-Received: by 2002:a17:902:d4c4:b0:26a:8171:dafa with SMTP id d9443c01a7336-2986a6d225dmr192584895ad.21.1763455939680;
        Tue, 18 Nov 2025 00:52:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFY5DSlIVYM8XbzjgfaGaoj0qv84BBjOFWR74NO9yqLaQacZkB3oED8rW587lTo9DK6YDF0CQ==
X-Received: by 2002:a17:902:d4c4:b0:26a:8171:dafa with SMTP id d9443c01a7336-2986a6d225dmr192584645ad.21.1763455939244;
        Tue, 18 Nov 2025 00:52:19 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:52:18 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:35 +0530
Subject: [PATCH v4 08/22] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-8-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=2452;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ye3E3o4bkNQLrLn0I1sQjG1xLLVdg0W9qxVP6kAlZGU=;
 b=uO/b3x2yM+ErviiHC5Yiqi/gnDy9JSeF3Bmq3OXfo8eK4rnUn7HPMORG4OtVFdsgLXpz3DYe2
 wILpk1MLNgzC4XeeECdd+yI2O2WBC6cJabZuE7vqvTFBDIx8LII4tbD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: bkELlLar6J0RU4kvlENQ4VN-OTG6PLQl
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=691c33c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bkELlLar6J0RU4kvlENQ4VN-OTG6PLQl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX0Saqkg/IqTJF
 FKrtFXaUe/zgIEZEwX53FIzLsLD2n2U9pQQ8mNtI4EhkXOv8r+Qnf4FaA653LWPYe1gUxkJ6voa
 v8hGHCffEnlRej6rQkASmaD4xWzwr8MdRok3eJ2XyPWkhEbZD9aQ2O4L69NIJBF0Qjbrx9O+LEO
 itrbx4lOg4xn62toK7o7zRtvlOlDi9+OSA8DdWEoyjd5J26JPdFbljk/j3zDCoueODO/52jqZR5
 8jaCkVNG/Mk8G+t64LZf2n4p32d20t28gtN+kp0qjY34YU4iQcOH8YInRpwgJrZDgVf+a7hWqrk
 RrKO2fqqYqDplI0pd5Wd2FTtB5BaUAZRbXvOI1GYA2Ke/u79XFtYwNjJd/0EiWIYGsOFWqJOLdB
 XKqHARuSpVp9Mqo4A1sl5HftKyLbpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005223_864220_FA9A7C60 
X-CRM114-Status: GOOD (  17.25  )
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
index 575f2f9d3b1d..9edd23d419ec 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2641,7 +2641,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2686,6 +2686,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2717,6 +2718,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2750,4 +2752,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 08bb601b3bd3..922d2dee70fb 100644
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


