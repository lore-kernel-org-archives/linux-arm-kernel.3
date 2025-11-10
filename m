Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D96FCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYQoLWih16jZnS20CcSbKmFoDLDQGHx1vZuPV45k5GA=; b=e5zy4yj0Lnn1gt851GAdn/R3Za
	UxnKhe5HcFCd/e50oDnPOT+Q2Tnp3ABActOGE3d8su4dfI6k2FTGm/zMu2T+j1KzM9ioUY4QOAAer
	NpwKJeUTyauoTueaCnerLssdKMGCIzxyH4Cwq2oYZcm+7jPjl5yuin69YJEQdIOlJW+Jj5UlllKcl
	M0aCVMPBZfNL+NRVagD2AZnKKhwqyhgR0qMDFDrs0Nc3PV2wVv0XnNrVolcoc8/Ig2FCkPFanMFZ0
	UmsOo21YEYOObx3pRoX9YKQ/aI8OsdfEeTpaVIJ1ZfkMMO6kG9l8OgMMeGErJWpN3z4nbOplBy5In
	VFYaSJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuv-00000005otb-2AQf;
	Mon, 10 Nov 2025 16:38:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUup-00000005opz-08xE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:38:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFiM3U1809060
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYQoLWih16jZnS20CcSbKmFoDLDQGHx1vZuPV45k5GA=; b=ATjFcpt8gXS6abCw
	dv0sXorTHx5sQcOzBjaiVGKNMlQqU7qHvAoL+5e01EMGIsSuZc5jF3Ttujgj52bo
	M2RfGDn+ld3piHeTJZYA7beQvw5PVuu+kcAgFumnnokkCwPm/7yXmsUUXWWzBQLA
	/s2MJ3/7ih/N74QNS/MaJM1RRKf3JtC0vUEkLdOezZ3PCkBcdT/x3Mumlyi/jBdp
	8CjlFWfvRmZO4AWT/JEj6ZW+TCnTLGtY7ywkOKQqABXk8QrVEskYLW6RhmJa7yRW
	3VnR+JC5pQJnnZK4Gonfzlcc/pcRXCsgsH9zzp9E58uNzuLX08sIVA7gSzXmStmq
	xnLrrw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab5m1jkwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3418ad76063so3774633a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792730; x=1763397530; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYQoLWih16jZnS20CcSbKmFoDLDQGHx1vZuPV45k5GA=;
        b=jh0F8T9L6LGX+B1AoIkhc+9AW0Q0FZKtM+eJRwRo/39f7qtPSA5uPdiz5a1sFXStIc
         FOE0KGPQEsoSdAu1Ot4viiL/o2IuEtFsAWMemnmpDYTBC7WXMx/i7S59wKFMJ+UJW+a5
         1PAaR8vfyZQ4ZWNw4Yt3CT1OLOIwllJqiKcSbVv1hZ7NiadDeVz87VefjXHZMbsRkCiR
         YxAn+OguhjcURkKsE3vboK0RH6Trey+9jRRAeRJmcAQugrLVltt1obxnd9dCCva8j9Bu
         mxS97idZvCdKQcALhUqoMTlNmnQijOwuEno8jV+3OUTfri5ixRjUN/m5Xvn2jWV6xq9o
         +vqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792730; x=1763397530;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WYQoLWih16jZnS20CcSbKmFoDLDQGHx1vZuPV45k5GA=;
        b=wOfD3QzeUi3rfmWRcWSmmbeKfBQ7LhtBsVKys5h28vUL9UFdYJLDX1zrWAzrSRhO8N
         vTOydKnhauT1EBpmb8LoPPL4wETl3QRVCs2G4YP5vYzmBdjY6sri9pNY/zREneisqgnU
         T01n+5kyCTlrCf/XBTH4+qzX6e0lbKSaDQpV/OMlt3u4QXO6ErPfWv/HpANYjfA1/6mr
         qPGzCGWiPbU11chFoZD3sHlBPZDqu5irDstvKgZtrpEBD1AXIxRzwex+hVWeg8VWVP5W
         N1NhWBd5INk5yMko94lNVOs1tgf+cEdrEg/uwHxDIWnnQqA55+zNIpLxdpRRALFfg7Zs
         WwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlVoJSH7eTDHStF4RwbTtEN+p+Rivr0dLAufgENISIQIqdd1c5XkuKcpwfYClEIVTqU2l13h+m74/COla9LzwB@lists.infradead.org
X-Gm-Message-State: AOJu0YwXfGghLGMMOjpSJkjWhukSRYOqXmLpIMzZKE9Pxqk83pyEdf24
	ZNJDWl+w7SHaaUhcK6QR+7/lMO0EwPNaRhTBBm/OYZo4nVNGqhM38bBgTp11CsFSbqbohkou0z1
	ZZ/S+I92ZmMXYEe9ZlR6WXQOQXSxoOX/Ae8/EiKzl5pGBofhxrQSkYeACwy7nlsjB5ILthvYnbl
	tpm2cnTsMEXQ==
X-Gm-Gg: ASbGncvrqCTlo96HeCK+1sehR5zfjAcjY6P4+247/6DMSYnnKhzsONoCUAEtIDid7ia
	5K8RFyb20lMKWZtQhcuenLojm666nkNIrtLCIIDVUofOh8CbFdX2CF2W9aZpKWFWJXzLKgh6vwL
	vCX59es01c34XuAY+Uq6qzWgJjVl/eNo9p0OsmJy4cgADKrUnu9VltFKrwQu42W6D6ra7pB7wyH
	ovPFPPwAFohdxQjxvXKlmJ15jUwKNwlQvQrmTCmI5zfiZbf1ColMg8ILfDlLZpPI5tM7+4iOdzw
	32oxbmV5FityniWkdQ2+sPoRLdumG6J8qw8mo8XnzmL1CpHMCReP0HVwHRM7s3tKb9Emev91LEf
	54xf+6De1U68e+774mJeNA1k=
X-Received: by 2002:a17:90b:1dcc:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-3436ccff0d8mr10898094a91.30.1762792729077;
        Mon, 10 Nov 2025 08:38:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9V44nTOqIckLiRWa8Xj7MAbUKb7fWDYksIcS1cr3kvV9rVqDd1mUH/nyNLIDpJf8xHKsxvw==
X-Received: by 2002:a17:90b:1dcc:b0:33f:eca0:47c6 with SMTP id 98e67ed59e1d1-3436ccff0d8mr10898055a91.30.1762792728365;
        Mon, 10 Nov 2025 08:38:48 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:47 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:11 +0530
Subject: [PATCH v2 05/21] drm/msm/adreno: Move adreno_gpu_func to catalogue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-5-bef18acd5e94@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=39647;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Nt7P/IamYWR2rDBeP6zf+surVXdLmKxlWgyputzjAS4=;
 b=oq7jes2kFol8aYani+Fr6oYu1M1N6eSD70cUGiscPyP3oZofBYu/xZtGautzcFhEsfUKtfLgF
 4sacJ3ygIMcBOE8g9zBlLNUI/bHg2nZ/SdmCpZm3gnmHou+wZsHrRuP
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXypzF18pjnQDh
 2AU1qVjcF5TKHd1FtS+44pdi6yKiBPwmmTEbEL9r2bs5atWs+BEOL9BTNVJeJeiFLplfPHCU0av
 WnHN9w9KCv7hV/53w2pr8yEWSzDclRyXgDKj0uwDYYT8idXpdT+eU0MTUKAz+zrJDych1nm/bmh
 9cnZ/LlVfL67SRU/waxdEyiy9vxulCSr6wKe5O959yiWFxBLlYahah4yv4Vza1cyLvIW/EKmsf1
 1qCCB120x0Hc2yLRBtJE5myBAkkHpNoJo+Rih2niFIDSZgvbgvlbuTzaPNe3Zhzi/TGHH9YfpPV
 14oxzqPI9MO94BtVPjHyGGGEBFMqzBzFt6KyWxpzjUydAnsHd02/0cowgG0oVpj+JnN8kXLveRC
 XpezRkg+Oir6ctEqYGTREB6WlYrrZg==
X-Authority-Analysis: v=2.4 cv=TsXrRTXh c=1 sm=1 tr=0 ts=6912151a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZW5s_5jsAU3U6Z_Cp8gA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: _Q-594nGb97rRliUszXrsibZS7Fau-GH
X-Proofpoint-GUID: _Q-594nGb97rRliUszXrsibZS7Fau-GH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083852_086445_75A066CD 
X-CRM114-Status: GOOD (  20.59  )
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

In A6x family (which is a pretty big one), there are separate
adreno_func definitions for each sub-generations. To streamline the
identification of the correct struct for a gpu, move it to the
catalogue and move the gpu_init routine to struct adreno_gpu_funcs.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h      |   2 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  13 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 ++++----
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h      |   2 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   7 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h      |   2 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  17 +--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h      |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  46 +++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 207 ++++++++++++++---------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   4 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
 17 files changed, 277 insertions(+), 261 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 5ddd015f930d..e9dbf3ddf89e 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a2xx_gpu.h"
 
 static const struct adreno_info a2xx_gpus[] = {
 	{
@@ -19,7 +20,7 @@ static const struct adreno_info a2xx_gpus[] = {
 		},
 		.gmem  = SZ_256K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
+		.funcs = &a2xx_gpu_funcs,
 	}, { /* a200 on i.mx51 has only 128kib gmem */
 		.chip_ids = ADRENO_CHIP_IDS(0x02000001),
 		.family = ADRENO_2XX_GEN1,
@@ -30,7 +31,7 @@ static const struct adreno_info a2xx_gpus[] = {
 		},
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
+		.funcs = &a2xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x02020000),
 		.family = ADRENO_2XX_GEN2,
@@ -41,7 +42,7 @@ static const struct adreno_info a2xx_gpus[] = {
 		},
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a2xx_gpu_init,
+		.funcs = &a2xx_gpu_funcs,
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index ec38db45d8a3..7082052f715e 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -486,39 +486,18 @@ static u32 a2xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a2xx_hw_init,
-		.pm_suspend = msm_gpu_pm_suspend,
-		.pm_resume = msm_gpu_pm_resume,
-		.recover = a2xx_recover,
-		.submit = a2xx_submit,
-		.active_ring = adreno_active_ring,
-		.irq = a2xx_irq,
-		.destroy = a2xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = adreno_show,
-#endif
-		.gpu_state_get = a2xx_gpu_state_get,
-		.gpu_state_put = adreno_gpu_state_put,
-		.create_vm = a2xx_create_vm,
-		.get_rptr = a2xx_get_rptr,
-	},
-};
-
 static const struct msm_gpu_perfcntr perfcntrs[] = {
 /* TODO */
 };
 
-struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 {
 	struct a2xx_gpu *a2xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	int ret;
 
 	if (!pdev) {
@@ -539,7 +518,7 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = perfcntrs;
 	gpu->num_perfcntrs = ARRAY_SIZE(perfcntrs);
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
 
@@ -558,3 +537,26 @@ struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+
+const struct adreno_gpu_funcs a2xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a2xx_hw_init,
+		.pm_suspend = msm_gpu_pm_suspend,
+		.pm_resume = msm_gpu_pm_resume,
+		.recover = a2xx_recover,
+		.submit = a2xx_submit,
+		.active_ring = adreno_active_ring,
+		.irq = a2xx_irq,
+		.destroy = a2xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = adreno_show,
+#endif
+		.gpu_state_get = a2xx_gpu_state_get,
+		.gpu_state_put = adreno_gpu_state_put,
+		.create_vm = a2xx_create_vm,
+		.get_rptr = a2xx_get_rptr,
+	},
+	.init = a2xx_gpu_init,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
index 53702f19990f..162ef98951f5 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
@@ -19,6 +19,8 @@ struct a2xx_gpu {
 };
 #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
 
+extern const struct adreno_gpu_funcs a2xx_gpu_funcs;
+
 struct msm_mmu *a2xx_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 void a2xx_gpummu_params(struct msm_mmu *mmu, dma_addr_t *pt_base,
 		dma_addr_t *tran_error);
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
index 1498e6532f62..6ae8716fc08a 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_catalog.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a3xx_gpu.h"
 
 static const struct adreno_info a3xx_gpus[] = {
 	{
@@ -18,7 +19,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x03000520),
 		.family = ADRENO_3XX,
@@ -29,7 +30,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_256K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x03000600),
 		.family = ADRENO_3XX,
@@ -40,7 +41,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x03000620),
 		.family = ADRENO_3XX,
@@ -51,7 +52,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03020000,
@@ -66,7 +67,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
 			0x03030000,
@@ -81,7 +82,7 @@ static const struct adreno_info a3xx_gpus[] = {
 		},
 		.gmem  = SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a3xx_gpu_init,
+		.funcs = &a3xx_gpu_funcs,
 	}
 };
 DECLARE_ADRENO_GPULIST(a3xx);
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index a956cd79195e..f22d33e99e81 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -508,29 +508,6 @@ static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a3xx_hw_init,
-		.pm_suspend = msm_gpu_pm_suspend,
-		.pm_resume = msm_gpu_pm_resume,
-		.recover = a3xx_recover,
-		.submit = a3xx_submit,
-		.active_ring = adreno_active_ring,
-		.irq = a3xx_irq,
-		.destroy = a3xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = adreno_show,
-#endif
-		.gpu_busy = a3xx_gpu_busy,
-		.gpu_state_get = a3xx_gpu_state_get,
-		.gpu_state_put = adreno_gpu_state_put,
-		.create_vm = adreno_create_vm,
-		.get_rptr = a3xx_get_rptr,
-	},
-};
-
 static const struct msm_gpu_perfcntr perfcntrs[] = {
 	{ REG_A3XX_SP_PERFCOUNTER6_SELECT, REG_A3XX_RBBM_PERFCTR_SP_6_LO,
 			SP_ALU_ACTIVE_CYCLES, "ALUACTIVE" },
@@ -538,13 +515,14 @@ static const struct msm_gpu_perfcntr perfcntrs[] = {
 			SP_FS_FULL_ALU_INSTRUCTIONS, "ALUFULL" },
 };
 
-struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 {
 	struct a3xx_gpu *a3xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -569,7 +547,7 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 
 	adreno_gpu->registers = a3xx_registers;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
 
@@ -613,3 +591,27 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+
+const struct adreno_gpu_funcs a3xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a3xx_hw_init,
+		.pm_suspend = msm_gpu_pm_suspend,
+		.pm_resume = msm_gpu_pm_resume,
+		.recover = a3xx_recover,
+		.submit = a3xx_submit,
+		.active_ring = adreno_active_ring,
+		.irq = a3xx_irq,
+		.destroy = a3xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = adreno_show,
+#endif
+		.gpu_busy = a3xx_gpu_busy,
+		.gpu_state_get = a3xx_gpu_state_get,
+		.gpu_state_put = adreno_gpu_state_put,
+		.create_vm = adreno_create_vm,
+		.get_rptr = a3xx_get_rptr,
+	},
+	.init = a3xx_gpu_init,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
index c555fb13e0d7..3d4ec9dbd918 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.h
@@ -23,4 +23,6 @@ struct a3xx_gpu {
 };
 #define to_a3xx_gpu(x) container_of(x, struct a3xx_gpu, base)
 
+extern const struct adreno_gpu_funcs a3xx_gpu_funcs;
+
 #endif /* __A3XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
index 09f9f228b75e..9192586f7ef0 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_catalog.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a4xx_gpu.h"
 
 static const struct adreno_info a4xx_gpus[] = {
 	{
@@ -19,7 +20,7 @@ static const struct adreno_info a4xx_gpus[] = {
 		},
 		.gmem  = SZ_256K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
+		.funcs = &a4xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x04020000),
 		.family = ADRENO_4XX,
@@ -30,7 +31,7 @@ static const struct adreno_info a4xx_gpus[] = {
 		},
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
+		.funcs = &a4xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x04030002),
 		.family = ADRENO_4XX,
@@ -41,7 +42,7 @@ static const struct adreno_info a4xx_gpus[] = {
 		},
 		.gmem  = (SZ_1M + SZ_512K),
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init  = a4xx_gpu_init,
+		.funcs = &a4xx_gpu_funcs,
 	}
 };
 DECLARE_ADRENO_GPULIST(a4xx);
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 83f6329accba..db06c06067ae 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -627,37 +627,14 @@ static u32 a4xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a4xx_hw_init,
-		.pm_suspend = a4xx_pm_suspend,
-		.pm_resume = a4xx_pm_resume,
-		.recover = a4xx_recover,
-		.submit = a4xx_submit,
-		.active_ring = adreno_active_ring,
-		.irq = a4xx_irq,
-		.destroy = a4xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = adreno_show,
-#endif
-		.gpu_busy = a4xx_gpu_busy,
-		.gpu_state_get = a4xx_gpu_state_get,
-		.gpu_state_put = adreno_gpu_state_put,
-		.create_vm = adreno_create_vm,
-		.get_rptr = a4xx_get_rptr,
-	},
-	.get_timestamp = a4xx_get_timestamp,
-};
-
-struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 {
 	struct a4xx_gpu *a4xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
+	struct adreno_platform_config *config = pdev->dev.platform_data;
 	struct icc_path *ocmem_icc_path;
 	struct icc_path *icc_path;
 	int ret;
@@ -680,7 +657,7 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	gpu->perfcntrs = NULL;
 	gpu->num_perfcntrs = 0;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, 1);
 	if (ret)
 		goto fail;
 
@@ -726,3 +703,28 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 
 	return ERR_PTR(ret);
 }
+
+const struct adreno_gpu_funcs a4xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a4xx_hw_init,
+		.pm_suspend = a4xx_pm_suspend,
+		.pm_resume = a4xx_pm_resume,
+		.recover = a4xx_recover,
+		.submit = a4xx_submit,
+		.active_ring = adreno_active_ring,
+		.irq = a4xx_irq,
+		.destroy = a4xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = adreno_show,
+#endif
+		.gpu_busy = a4xx_gpu_busy,
+		.gpu_state_get = a4xx_gpu_state_get,
+		.gpu_state_put = adreno_gpu_state_put,
+		.create_vm = adreno_create_vm,
+		.get_rptr = a4xx_get_rptr,
+	},
+	.init = a4xx_gpu_init,
+	.get_timestamp = a4xx_get_timestamp,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.h b/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
index a01448cba2ea..71b164439f62 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.h
@@ -20,4 +20,6 @@ struct a4xx_gpu {
 };
 #define to_a4xx_gpu(x) container_of(x, struct a4xx_gpu, base)
 
+extern const struct adreno_gpu_funcs a4xx_gpu_funcs;
+
 #endif /* __A4XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index b48a636d8237..babd320f3b73 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -7,6 +7,7 @@
  */
 
 #include "adreno_gpu.h"
+#include "a5xx_gpu.h"
 
 static const struct adreno_info a5xx_gpus[] = {
 	{
@@ -21,7 +22,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
 			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000600),
 		.family = ADRENO_5XX,
@@ -38,7 +39,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
 			  ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a506_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000800),
@@ -55,7 +56,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a508_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05000900),
@@ -72,7 +73,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		/* Adreno 509 uses the same ZAP as 512 */
 		.zapfw = "a512_zap.mdt",
 	}, {
@@ -89,7 +90,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 * the GDSC which appears to make it grumpy
 		 */
 		.inactive_period = 250,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05010200),
 		.family = ADRENO_5XX,
@@ -105,7 +106,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a512_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(
@@ -127,7 +128,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_TWO_PASS_USE_WFI |
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a530_zap.mdt",
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
@@ -145,7 +146,7 @@ static const struct adreno_info a5xx_gpus[] = {
 		 */
 		.inactive_period = 250,
 		.quirks = ADRENO_QUIRK_LMLOADKILL_DISABLE,
-		.init = a5xx_gpu_init,
+		.funcs = &a5xx_gpu_funcs,
 		.zapfw = "a540_zap.mdt",
 	}
 };
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 4a04dc43a8e6..56eaff2ee4e4 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1691,34 +1691,6 @@ static uint32_t a5xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A5XX_CP_RB_RPTR);
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a5xx_hw_init,
-		.ucode_load = a5xx_ucode_load,
-		.pm_suspend = a5xx_pm_suspend,
-		.pm_resume = a5xx_pm_resume,
-		.recover = a5xx_recover,
-		.submit = a5xx_submit,
-		.active_ring = a5xx_active_ring,
-		.irq = a5xx_irq,
-		.destroy = a5xx_destroy,
-#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
-		.show = a5xx_show,
-#endif
-#if defined(CONFIG_DEBUG_FS)
-		.debugfs_init = a5xx_debugfs_init,
-#endif
-		.gpu_busy = a5xx_gpu_busy,
-		.gpu_state_get = a5xx_gpu_state_get,
-		.gpu_state_put = a5xx_gpu_state_put,
-		.create_vm = adreno_create_vm,
-		.get_rptr = a5xx_get_rptr,
-	},
-	.get_timestamp = a5xx_get_timestamp,
-};
-
 static void check_speed_bin(struct device *dev)
 {
 	struct nvmem_cell *cell;
@@ -1751,7 +1723,7 @@ static void check_speed_bin(struct device *dev)
 	devm_pm_opp_set_supported_hw(dev, &val, 1);
 }
 
-struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
@@ -1781,7 +1753,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	if (config->info->revn == 510)
 		nr_rings = 1;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
 	if (ret) {
 		a5xx_destroy(&(a5xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -1806,3 +1778,32 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	return gpu;
 }
+
+const struct adreno_gpu_funcs a5xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a5xx_hw_init,
+		.ucode_load = a5xx_ucode_load,
+		.pm_suspend = a5xx_pm_suspend,
+		.pm_resume = a5xx_pm_resume,
+		.recover = a5xx_recover,
+		.submit = a5xx_submit,
+		.active_ring = a5xx_active_ring,
+		.irq = a5xx_irq,
+		.destroy = a5xx_destroy,
+#if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
+		.show = a5xx_show,
+#endif
+#if defined(CONFIG_DEBUG_FS)
+		.debugfs_init = a5xx_debugfs_init,
+#endif
+		.gpu_busy = a5xx_gpu_busy,
+		.gpu_state_get = a5xx_gpu_state_get,
+		.gpu_state_put = a5xx_gpu_state_put,
+		.create_vm = adreno_create_vm,
+		.get_rptr = a5xx_get_rptr,
+	},
+	.init = a5xx_gpu_init,
+	.get_timestamp = a5xx_get_timestamp,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
index 9c0d701fe4b8..407bb950d350 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.h
@@ -133,6 +133,7 @@ struct a5xx_preempt_record {
  */
 #define A5XX_PREEMPT_COUNTER_SIZE (16 * 4)
 
+extern const struct adreno_gpu_funcs a5xx_gpu_funcs;
 
 int a5xx_power_init(struct msm_gpu *gpu);
 void a5xx_gpmu_ucode_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 44df6410bce1..9007a0e82a59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -683,7 +683,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = (SZ_128K + SZ_4K),
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gmuwrapper_funcs,
 		.zapfw = "a610_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a612_hwcg,
@@ -716,7 +716,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = SZ_512K,
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -747,7 +747,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -774,7 +774,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a630_protect,
 			.gmu_cgc_mode = 0x00000222,
@@ -797,7 +797,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = SZ_512K,
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -822,7 +822,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.gmem = SZ_512K,
 		.quirks = ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -847,7 +847,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a615_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a615_hwcg,
@@ -873,7 +873,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a620_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a620_hwcg,
@@ -896,7 +896,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a650_protect,
@@ -933,7 +933,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a630_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a630_hwcg,
@@ -953,7 +953,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
@@ -977,7 +977,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a650_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a650_hwcg,
@@ -1003,7 +1003,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a660_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
@@ -1022,7 +1022,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
 			.protect = &a660_protect,
@@ -1045,7 +1045,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a660_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a660_hwcg,
@@ -1072,7 +1072,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_4GB_VA,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a640_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a640_hwcg,
@@ -1091,7 +1091,7 @@ static const struct adreno_info a6xx_gpus[] = {
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gpu_funcs,
 		.zapfw = "a690_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a690_hwcg,
@@ -1426,7 +1426,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.gmem = SZ_128K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
-		.init = a6xx_gpu_init,
+		.funcs = &a6xx_gmuwrapper_funcs,
 		.zapfw = "a702_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a702_hwcg,
@@ -1452,7 +1452,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "a730_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a730_hwcg,
@@ -1473,7 +1473,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "a740_zap.mdt",
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
@@ -1507,7 +1507,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_IFPC,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
@@ -1548,7 +1548,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
 			  ADRENO_QUIRK_IFPC,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &a730_protect,
@@ -1581,7 +1581,7 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION,
-		.init = a6xx_gpu_init,
+		.funcs = &a7xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.hwcg = a740_hwcg,
 			.protect = &a730_protect,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b675a512e7ca..6856b6faf6c7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2533,103 +2533,7 @@ static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *i
 	return 0;
 }
 
-static const struct adreno_gpu_funcs funcs = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a6xx_hw_init,
-		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_gmu_pm_suspend,
-		.pm_resume = a6xx_gmu_pm_resume,
-		.recover = a6xx_recover,
-		.submit = a6xx_submit,
-		.active_ring = a6xx_active_ring,
-		.irq = a6xx_irq,
-		.destroy = a6xx_destroy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.show = a6xx_show,
-#endif
-		.gpu_busy = a6xx_gpu_busy,
-		.gpu_get_freq = a6xx_gmu_get_freq,
-		.gpu_set_freq = a6xx_gpu_set_freq,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.gpu_state_get = a6xx_gpu_state_get,
-		.gpu_state_put = a6xx_gpu_state_put,
-#endif
-		.create_vm = a6xx_create_vm,
-		.create_private_vm = a6xx_create_private_vm,
-		.get_rptr = a6xx_get_rptr,
-		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
-	},
-	.get_timestamp = a6xx_gmu_get_timestamp,
-	.submit_flush = a6xx_flush,
-};
-
-static const struct adreno_gpu_funcs funcs_gmuwrapper = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a6xx_hw_init,
-		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_pm_suspend,
-		.pm_resume = a6xx_pm_resume,
-		.recover = a6xx_recover,
-		.submit = a6xx_submit,
-		.active_ring = a6xx_active_ring,
-		.irq = a6xx_irq,
-		.destroy = a6xx_destroy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.show = a6xx_show,
-#endif
-		.gpu_busy = a6xx_gpu_busy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.gpu_state_get = a6xx_gpu_state_get,
-		.gpu_state_put = a6xx_gpu_state_put,
-#endif
-		.create_vm = a6xx_create_vm,
-		.create_private_vm = a6xx_create_private_vm,
-		.get_rptr = a6xx_get_rptr,
-		.progress = a6xx_progress,
-	},
-	.get_timestamp = a6xx_get_timestamp,
-	.submit_flush = a6xx_flush,
-};
-
-static const struct adreno_gpu_funcs funcs_a7xx = {
-	.base = {
-		.get_param = adreno_get_param,
-		.set_param = adreno_set_param,
-		.hw_init = a6xx_hw_init,
-		.ucode_load = a6xx_ucode_load,
-		.pm_suspend = a6xx_gmu_pm_suspend,
-		.pm_resume = a6xx_gmu_pm_resume,
-		.recover = a6xx_recover,
-		.submit = a7xx_submit,
-		.active_ring = a6xx_active_ring,
-		.irq = a6xx_irq,
-		.destroy = a6xx_destroy,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.show = a6xx_show,
-#endif
-		.gpu_busy = a6xx_gpu_busy,
-		.gpu_get_freq = a6xx_gmu_get_freq,
-		.gpu_set_freq = a6xx_gpu_set_freq,
-#if defined(CONFIG_DRM_MSM_GPU_STATE)
-		.gpu_state_get = a6xx_gpu_state_get,
-		.gpu_state_put = a6xx_gpu_state_put,
-#endif
-		.create_vm = a6xx_create_vm,
-		.create_private_vm = a6xx_create_private_vm,
-		.get_rptr = a6xx_get_rptr,
-		.progress = a6xx_progress,
-		.sysprof_setup = a6xx_gmu_sysprof_setup,
-	},
-	.get_timestamp = a6xx_gmu_get_timestamp,
-	.submit_flush = a6xx_flush,
-};
-
-struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
+static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
@@ -2640,7 +2544,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_gpu *gpu;
 	extern int enable_preemption;
 	bool is_a7xx;
-	int ret;
+	int ret, nr_rings = 1;
 
 	a6xx_gpu = kzalloc(sizeof(*a6xx_gpu), GFP_KERNEL);
 	if (!a6xx_gpu)
@@ -2679,13 +2583,9 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	if ((enable_preemption == 1) || (enable_preemption == -1 &&
 	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 4);
-	else if (is_a7xx)
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
-	else if (adreno_has_gmu_wrapper(adreno_gpu))
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_gmuwrapper, 1);
-	else
-		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
+		nr_rings = 4;
+
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
@@ -2732,3 +2632,100 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	return gpu;
 }
+
+const struct adreno_gpu_funcs a6xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+		.gpu_get_freq = a6xx_gmu_get_freq,
+		.gpu_set_freq = a6xx_gpu_set_freq,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
+};
+
+const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_pm_suspend,
+		.pm_resume = a6xx_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a6xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a6xx_get_timestamp,
+	.submit_flush = a6xx_flush,
+};
+
+const struct adreno_gpu_funcs a7xx_gpu_funcs = {
+	.base = {
+		.get_param = adreno_get_param,
+		.set_param = adreno_set_param,
+		.hw_init = a6xx_hw_init,
+		.ucode_load = a6xx_ucode_load,
+		.pm_suspend = a6xx_gmu_pm_suspend,
+		.pm_resume = a6xx_gmu_pm_resume,
+		.recover = a6xx_recover,
+		.submit = a7xx_submit,
+		.active_ring = a6xx_active_ring,
+		.irq = a6xx_irq,
+		.destroy = a6xx_destroy,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.show = a6xx_show,
+#endif
+		.gpu_busy = a6xx_gpu_busy,
+		.gpu_get_freq = a6xx_gmu_get_freq,
+		.gpu_set_freq = a6xx_gpu_set_freq,
+#if defined(CONFIG_DRM_MSM_GPU_STATE)
+		.gpu_state_get = a6xx_gpu_state_get,
+		.gpu_state_put = a6xx_gpu_state_put,
+#endif
+		.create_vm = a6xx_create_vm,
+		.create_private_vm = a6xx_create_private_vm,
+		.get_rptr = a6xx_get_rptr,
+		.progress = a6xx_progress,
+	},
+	.init = a6xx_gpu_init,
+	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
+};
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 0b17d36c36a9..ef66e1eb9152 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -216,6 +216,10 @@ struct a7xx_cp_smmu_info {
 #define A6XX_PROTECT_RDONLY(_reg, _len) \
 	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
 
+extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
+extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
+extern const struct adreno_gpu_funcs a7xx_gpu_funcs;
+
 static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
 {
 	if(adreno_is_a630(gpu))
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 28f744f3caf7..cb4113612b82 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -235,7 +235,7 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	priv->has_cached_coherent =
 		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT);
 
-	gpu = info->init(drm);
+	gpu = info->funcs->init(drm);
 	if (IS_ERR(gpu)) {
 		dev_warn(drm->dev, "failed to load adreno gpu\n");
 		return PTR_ERR(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77b1c73ff894..eeb31fbc69ae 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -71,8 +71,11 @@ enum adreno_family {
 	(((_c) >> 8)  & 0xff), \
 	((_c) & 0xff)
 
+struct adreno_gpu;
+
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
+	struct msm_gpu *(*init)(struct drm_device *dev);
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
@@ -102,7 +105,7 @@ struct adreno_info {
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
 	u64 quirks;
-	struct msm_gpu *(*init)(struct drm_device *dev);
+	const struct adreno_gpu_funcs *funcs;
 	const char *zapfw;
 	u32 inactive_period;
 	union {
@@ -674,12 +677,6 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 	OUT_RING(ring, PKT7(opcode, cnt));
 }
 
-struct msm_gpu *a2xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a3xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a4xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a5xx_gpu_init(struct drm_device *dev);
-struct msm_gpu *a6xx_gpu_init(struct drm_device *dev);
-
 static inline uint32_t get_wptr(struct msm_ringbuffer *ring)
 {
 	return (ring->cur - ring->start) % (MSM_GPU_RINGBUFFER_SZ >> 2);

-- 
2.51.0


