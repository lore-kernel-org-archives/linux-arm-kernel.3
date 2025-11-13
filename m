Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC1CDB463
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=; b=dL5Ic2VdEm5KQSDxBZTk/UHNUG
	50/H+FtsIAxeHBO8Ji9OjmcUT9iuM/Tl6DwTMnqmLRZcoxiak+3WeM6rHycvx3KkC6YboZ4U6P+zU
	UPxa/3u4ufu8LK5EE4AnLy5J/2ujXLt9El/UkNrXh3l9vjBZP1EDlGUXNRrXhZvZf3dFw7XHyOqok
	BXr4mMIjldQKHILe/oXqdOBT/4InhoEQKQFqPbCbVmx43gd6z98RBNsRYLxsFkGTYMQ0G858ZBT0M
	d7CPDTMLRN5qRQi2u/c0wth1NuY34t0KqoMMThQB9WdqFLxPtY9TsMyEqS531OwuC2sUKSG+qNuNL
	E87evVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglu-0000000BGnQ-1ITJ;
	Thu, 13 Nov 2025 23:30:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglr-0000000BGlm-2Coy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:30:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaa7g1611894
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=; b=ImtBloQjs3VbC6QK
	+PNa3ucCYR4LChcWkDL/0pay7FCkI0Fitv0oEgepxh7a/E3b6ekwOE+DGRXVibez
	X7soR84lC1lKKXaCC2LPLCF9klr0oQeh7LByi5aTu6q+Ism8XJZPw2J/w9lWfy6S
	dQsLilzzvYJ7gnyNxXYr6Y180sB04B6Psjr94kBYn1woDUMeaG+bqj8l3LJ8kGs6
	Aai/RoKT1uX97Gqtp4lvZVVW2tE3qAUjybkZz3hWqpP9cIhgNMcxdbY+LKtoliYT
	aI93A+BVCxjvtZMd46+GH/lXu9lnC4+DJO58L1Is55xfTOpguZfkgGeG75LJI0DO
	+gSemw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9bg416-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:30:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a26485fc5dso1376406b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076630; x=1763681430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=;
        b=VObtL/DX5ta/nhxUy8HOOp8q9C0Q8lR7mwbsGamI4Vae9NjnJdcLMu2wY6hO9oez+k
         r0IGmLcFa4iXIUtg4J9joU+oQ2uGhv9t5WSKeXITfulKd7BsNVWtcUuc4pPTVKwfTkRH
         jJ/lmOwKB/TECK8ttI047uTxQKe+43dLq2ng8kWlCr6bvFaPo2Ie6pq3hUQXZ+vnS1qS
         MtCwX11ZkTmjMSkLzmlxM+WBiwAqOQcyZxDl7PurU9wfp0rKLbC5HgI1I1SkZKT33xGH
         8yss/kX5vrFIdu/atvODPp9t8qmZHtMl82nbnnm1Wwt7DqGZXmnyqkCLEbqGg6x+JM8A
         ttbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076630; x=1763681430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gcf5l/K/LPI1X3Fga8TbV7X9VmsrDisI7kJ0hOFQ884=;
        b=DM2Fi91JyUAYi/QN9F3d4FIYA7LiGl3j5/GE9Q1QHu4rn04FXmtdh2dqZvJ87qzRH3
         xHLfphtyoVhwbMHr133rThWilaiMnp6fpBpf4K9CI7mQte83V+GWWZP84XudVfdHcT/P
         +NI+9TxiCFgZaOSjbPT4WV7/DSf8TqMqdI30MKnTt8zegdiaGhZOaRyK6i4bKcMLa8Qp
         20ny79WbY4JaC5nV/kCN8HEy0Bo+P14lBOnsxAlc55ECq2AWdyT6cHmUBgTMNsuMk3HP
         Sb6VGIXnYhq5f5QSGmJWUB2CgtZYLfmtU/6W7yo3ckQeL4DH46NDf0F76rTyoXqObMG5
         N8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmdoQIMwmFlVrMw7Gt82gL6Gz6siZtA1omZxt/ZOSe4Vmn0aJUe8fcFgPRSaI+aTTSNWIzRL692rS7ooDETn8j@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZdPp0w9TZ/X2u2VEdZHl1zZiJ1M7TXKCJGk7kqcxih5YaRzH
	w19bvvAvOWwjKKu817fkFNOXvbuXy3aYKJ0QXF0eTVWWzUFiuKkOIz8w0tgnDKZv9TMDio2ZIxj
	1xK62D+mnA4+784GG31+rq9dKdL7GLn3YiPHwrkuPSDG26y2YXc9x/PdjGdjzaIv5wQOOw9Cidk
	bPTw==
X-Gm-Gg: ASbGnctxnKzegR/XUveqHzQ74hFvzTpSSzLqBMt/N/AAdvoE6Pj+sYj1yWubpwdwG62
	xdeVCA0ua2YSgPjtlSqPeVz0PfjFNi+c1kmV+4v10Le8kvB1G8eZZJhwUVFEPkkkksp63lf99wt
	SeSGTJ2vptbfivVQBYLwueTVbV0osY9V3qbTS2GXMjneCyyXOBaxPcLtLYYMgISBTGNo4x+P8TS
	akg2BlmCDaBEvJIcI+chE11Q27PKjfXqevYKHOm9Y+MHJXkjv5UzdCK946SdxTgIkVeJWZ/7RvB
	wqkLk2ggpT46M9t6DcjUESx5vh7/vGZuoBo4mxBiXX5Wi1te8z/GAC1A2K/EBXhmumVvjjbfUvj
	pm8QqeQltVnKtkGk9cCvrHQA=
X-Received: by 2002:a05:6a20:7f81:b0:334:7bce:8394 with SMTP id adf61e73a8af0-35ba2c7f49fmr1558600637.51.1763076630336;
        Thu, 13 Nov 2025 15:30:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF7D8yPEUPkp+NbY22BN0Y1kfgJd40q6G3P0giPrxIE2bqHGm6311EF07g9YkzAqUjbYGJXQ==
X-Received: by 2002:a05:6a20:7f81:b0:334:7bce:8394 with SMTP id adf61e73a8af0-35ba2c7f49fmr1558536637.51.1763076629730;
        Thu, 13 Nov 2025 15:30:29 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:30:29 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:03 +0530
Subject: [PATCH v3 06/20] drm/msm/adreno: Move gbif_halt() to
 adreno_gpu_func
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-6-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=3572;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IGpokplXYyShZVLotE0neZI18HJLZ3KUnvDyUGOCvso=;
 b=NVUVcDEzAp6sPGf+/YDVc97AOPQtMk6i7AKTEir8UVywiJ16mJrlqBXgy1BYJHHWn73Ng1nrJ
 TotY0EkaIRQAalvppoalIedeEivFRiO8/utpOvZ946ECcbG8esPdnuq
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=aJz9aL9m c=1 sm=1 tr=0 ts=69166a17 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W_sW28Yvd0frASqVc48A:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: hx5OGUChWz5c4GFeauomFZ3rbZIPqLk-
X-Proofpoint-ORIG-GUID: hx5OGUChWz5c4GFeauomFZ3rbZIPqLk-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfXzFiBTzmobKx6
 Hb9FtNaxXWEU5vN/FYiu1d5yWYeuaikIufPuZl/Y1REHy9qUdaMxHJHwLpOsQ/XYpT01sJgeEj2
 BBmgdXmVtemlOltyGVLK5CyXBdpE4VyNpyhcnXaXhg/DAIH+X2oNHr46KgrBiMjH22a4nwv0rDs
 eO6FtacfaTlcO9Gk2Iirk16oMk8NLsYEAXiyXdkHkdSFqe6Wy+dm/rQHwrCOetzLWqAG187gsRI
 3Ff8OKROPusof8IVu3HNcz24V9m4geJESf9lMtwNxIFGCT+KZ22RROS4+LF2ziuj5mxduUrQgNv
 pm6tCU3F5QjMLrIshu1fv/Z70KlIwAQMNt6aDBKoX8tLasUXrKZEu3ZifWm1SMCpg3aurBXlO0F
 GbEq/dvky57DDagKliKT4SsRkBvUNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_153032_152104_20EF6B78 
X-CRM114-Status: GOOD (  17.59  )
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

Move the gbif halt fn to adreno_gpu_func so that we can call different
implementation from common code. This will come handy when we implement
A8x layer.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 605bb55de8d5..306fc08492e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1053,7 +1053,7 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	/* Halt the gmu cm3 core */
 	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 1);
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	/* Reset GPU core blocks */
 	a6xx_gpu_sw_reset(gpu, true);
@@ -1225,7 +1225,7 @@ static void a6xx_gmu_shutdown(struct a6xx_gmu *gmu)
 	if (ret)
 		goto force_off;
 
-	a6xx_bus_clear_pending_transactions(adreno_gpu, a6xx_gpu->hung);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, a6xx_gpu->hung);
 
 	/* tell the GMU we want to slumber */
 	ret = a6xx_gmu_notify_slumber(gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e9a0ee1262cc..9c6af226b076 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1580,7 +1580,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Drain the outstanding traffic on memory buses */
-		a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+		adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 		/* Reset the GPU to a clean state */
 		a6xx_gpu_sw_reset(gpu, true);
@@ -2291,7 +2291,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
 	/* Drain the outstanding traffic on memory buses */
-	a6xx_bus_clear_pending_transactions(adreno_gpu, true);
+	adreno_gpu->funcs->bus_halt(adreno_gpu, true);
 
 	if (adreno_is_a619_holi(adreno_gpu))
 		a6xx_sptprac_disable(gmu);
@@ -2659,6 +2659,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2689,6 +2690,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2721,4 +2723,5 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.bus_halt = a6xx_bus_clear_pending_transactions,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2c8b38eae7b6..19a1a1f699bc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -77,6 +77,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 };
 
 struct adreno_reglist {

-- 
2.51.0


