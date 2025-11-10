Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC0BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=; b=3rfdUA1HShOBiX7idRKv30UVv0
	bAPeOtqD5VryKoTEvQ8ZfwlLdaTe7bHIFTr8ZjR3ryueAoXBjd8x8jMdb16XHSHvulX5Q/iHBJ+oM
	Ykv5G/T9QjgvYf5kAyv7SVOVLFOeCgRV1G6Ao4l1yHhNGvHozdrT1KxxPlD9GeGUGIA5ZstZSkFqw
	cLGz+hGN6H4LWmox9g6PVQ1vCGSyEMSa6UMygGUDVEowLH+9gg9/0pWzoHruSvilU7qjGOFRVBCh/
	suSy75ePHhr4nil483HkNjGKMOlPQ/dZWiRxELY9OwQwGEukixiuy/940nT48mdWgAOp7arOlSRmd
	0n6y6VWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUv6-00000005ozm-1jXf;
	Mon, 10 Nov 2025 16:39:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUv4-00000005oyP-1mT2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:39:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFkdCo2867907
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=; b=EQUKhzqokJW3UCgb
	lUStWYh9MO6cD+zNjSDLutwBmspsn+lVBRiz3s/hwSJFUslCm9kDSciti1HaANoP
	0LCGEVCgprEznyG7HIHI4yzb3CNH9ki/rmaDjF+b/mHxMAS9/A+2uLhYNg2i5USw
	55F3Yd5/SwwrbMy6zuvZy6Z3vta0X9NkW8xCBjUY7GT3i66/VXXCB61IczV4prcv
	hrt88dFaLWyyB74vxtE7p7xfkSuJ2nmeuz/9W57knNx8O0cb1OQdfGHuQr8bNO1x
	VAxGBvArQLAf3LpRIoNimzupM5SOqYGfRMSh/YWTJQqtTwOzQWJH2s1w8FBb7nKJ
	3N2Iww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd761bbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:39:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-341aec498fdso5189817a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792745; x=1763397545; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=;
        b=E8jmTJ7lpTiZesInva/PbXuOW1prg2abu+UUI1LNY2/p85bdNecJyPKuSo+71I5JEw
         gkpJ+qVAxmu3vki27V90XUU4AiiDgC8opDAUcmUsGHlGt2WVO7yQyIWrdvRgD81WV7pE
         X0BMrkgMP4XmJSz/JRlfr6tEiK1lUhptr6WnerJy+TU+e74zS/P4XffkVl/Ug3wvVqwb
         SYDiljSm3t6z+rY27aUPYJAC5ypj+xraGxbmy8mBHLFglaxN7tuJdNfOtz37hWoORqN2
         Dx9Jb9N/ywk2esRVwov0CQX6vBUZTh8hTfXgVcJUHaTMegyNPtt9FgqLc++975yYRWW6
         UCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792745; x=1763397545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WKibWSrUWripKfBtWsfTympYKLBOlYD+nhQZn/FVCxg=;
        b=ZAnEZQbfuk5p9DG7CAeOCOPXTetdW1Y2lLBrRoVgP/axwAFUgvvOLyrumRJppzhy22
         AfQoCN94gP19wUAHIsNnVLzEXnOxtdG+QrGhSBWLgWrCLWoWaHAkO2K7sbURXHzK1BbH
         HkUyOZfPXLqjkeghwjPLc1kHnfyU2VvspYhbJTGcYLTQdWpquifcr5Q9qIxsTXwMrs2A
         buGs3HOlse53E8mR289tFCpPjMdUQbR6T6pAFRmydVTGti4YVdUBs4t54BRiek1/Pghj
         pnziVflwBwfJyHgfDJon/0yUApuel99QeeTI9MNPiOJUC1TLKhn+zkKQDo5akX2PP4fV
         Ifkw==
X-Forwarded-Encrypted: i=1; AJvYcCXyykBiR4CwJYBiadH1+KJYuODCmjEv/uuUe0PTCgkhAdA3CQ7x0KQ53X80Oz1NVcntYd0UCoF9aLVX+cCdk7qA@lists.infradead.org
X-Gm-Message-State: AOJu0YyvnMpKMQXPQSZIWblI7UmXYZE91nBBgFjbCDdVp6jQF87pB6KT
	+ggb3Oo+EyLAJTP6W80VwJu0m+1KriHyzDRg4/DapYB5zLfnI01Mv6cZ61cKquSqV+puAKUmWsY
	LOgCHc2W2SaUnHjHUXNxMrBn9Pdjj9Ikv4YlPULWJ1TU714KLODIFjLsW095/3e3A0V2Srag8vN
	fv6w==
X-Gm-Gg: ASbGncuhJiEogOqoc7nAbqvnwVscVAQWsMWBw2VgGE0Dn5v+r7zOvrb3IEU1UDXIbS6
	KaaN35dg8/xktUg22/tqw5NK4dN6/cPrHrNQOejf6hSbQo48X8ltrC1Vk4R1Wt1WSXwfOSamK+T
	QmZCMw8CaGdvRJvEs5LP3ScBayF3GqpJGkYhpN5YYAwtwstr9uWRvcLlYui/IbIR4zpnMmw7Cdb
	uQNGPjXSefBqAmLs8ubGDbArZnJtKSN5Q4htxgqOTnJ2nMQvg8DtAXr2zpYJGOQ5tOBarawGUr6
	lTfvC+TibFeCmj1eicKVqp3rszPVmgdvY1rgn2xtojEMbjuIklbl7JKE4ABs8QVkmDKU4LCLJq4
	zsMx3eYa4xW1JQO/noeLrcyI=
X-Received: by 2002:a17:90b:1c8e:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-3436cb1209fmr12752608a91.6.1762792745221;
        Mon, 10 Nov 2025 08:39:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGHQA2IWMXamJLpaNer6zgOuLzI6Ik83UCBpaA75HoppwknGF27iOTm6iO2NwkR1P9RuzAm7g==
X-Received: by 2002:a17:90b:1c8e:b0:340:ba29:d3b6 with SMTP id 98e67ed59e1d1-3436cb1209fmr12752559a91.6.1762792744693;
        Mon, 10 Nov 2025 08:39:04 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:39:04 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:13 +0530
Subject: [PATCH v2 07/21] drm/msm/adreno: Add MMU fault handler to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-7-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=2490;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=FV6xLDthA453vaD5oogIe+3kjmqh0dTIHuw+y3wfzsc=;
 b=TbMQN2jeHbfSzsXvNtITuiiGmAIjAd8wamkBaIOa6vE0PSVAN1N+TZjArgXIn5hVVUYEREIPx
 e9HotsFB4BODpcPk1sAT2+SANyLk02r+uI0pgfpOwVIuHYPptV6085/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lEa78VQuv2IQjH0ohiM-Q0kpla5r-srS
X-Authority-Analysis: v=2.4 cv=OK4qHCaB c=1 sm=1 tr=0 ts=69121529 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=i9YFFn0sWQDpYGFnbDoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXxpArkUmkIzcc
 OeHzJqQqoeqo9w3ETEfvNhEBLDtlz/3qKJ04RRXIKKyzhl2mCFZoNAjxeHluMDBNueO2ppWTDGX
 YD3tpki7E39jJKq1mfwYJoL3qxaEky5N8KQFjgFoeuXBaXwDq8DJ2oHJNxBFqI/U3mbQyKKqYaC
 WkS8jQc00aUln8pHwBMtbMdao7Yu4emBfTzlAPD0aut3J4QNW57XUqpiAdeyTWRfKHR3syD/TDW
 TMSK++/C837nOU9PkMdRq6c7tCAEOWdULhNmlgtrFXE3zyw3SWkxrPwjunVBp8moB6puW+c8/W9
 aW+wDhpGrWI9za8NHjY4xnC0kcIfw4JIbqwMfVUNp3QYl3GF3ELe574MMunvW1sAyVmsB+cGh1A
 Z0HcPCocwET/usATaHRNK9PYcADLrg==
X-Proofpoint-GUID: lEa78VQuv2IQjH0ohiM-Q0kpla5r-srS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083906_473753_A6B9AD9A 
X-CRM114-Status: GOOD (  16.81  )
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
index 7a87f6407abf..51d32c66512e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2619,7 +2619,7 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
 
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
-				  a6xx_fault_handler);
+				  adreno_gpu->funcs->mmu_fault_handler);
 
 	ret = a6xx_calc_ubwc_config(adreno_gpu);
 	if (ret) {
@@ -2665,6 +2665,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2697,6 +2698,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2731,4 +2733,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
+	.mmu_fault_handler = a6xx_fault_handler,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index acdc51dbec79..50359f2be5d5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,6 +79,7 @@ struct adreno_gpu_funcs {
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
+	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 };
 
 struct adreno_reglist {

-- 
2.51.0


