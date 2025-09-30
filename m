Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=; b=exKyOqYJ8VDKcfoJj/+OjfkKDT
	289bPOc75vfNX/xmCIKxsFyQF2+33dSd24reUClazGhAZSYdxvvXihVk0Wu036MaUNMdhFkw/uOh5
	HabOU2mda1s6CR22IyWSM+rDTFqM7fXs/zuZaiz2zBPhfmyLT9zWjxwwoYsCF1znCl1KpO6a1++KY
	H+9QUN1/b9m9Cfvrr5wlh4wcFsBNn6dBzmrA9yEGMbWeRi4c1xf+JqOWGtR4UYoxZedYX8szGmRaz
	z7xhwTv3saELXPmK1M8sUg1d/QsSG/YSaK5qukIOi+PpvTxftQ+GvzPyT3+luO4UdJjTMUKweCrMF
	6EJWfHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFm-00000004HQA-2eZ7;
	Tue, 30 Sep 2025 05:50:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFj-00000004HNW-2LKQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:50:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HZMp009336
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=; b=Lt/QzqV2PX0S0ruc
	9FWTfzCCUYcj+zhi2JgJw3zmuSYHFNZMybigdd8EJV3x4fVNPlNqnx8UurLNECAW
	gws+NNgNM9/UKdVNpMw+M5b73MCaGr0L/HqhJ9ZwxQq35nnQ8RHWG49xjbtKmt7X
	rEbUWklmsdd+s3bePJey5K9eVrBmJuhyw7E37nQG7VjF3YElTsNWiexjeEE9CMNK
	GQEGJUyhfpn/h8Nmq19Y4JX0NUD9LdSvQvG6N37/TQN/xaUUH+VpDItV9NL+3GLv
	0IgqdowmcND1Fd7UBVlF92ASDyBah9lThER1cUZj/TItiDw5UO3I5tKaAGYRWhiK
	WjCcPA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977qhxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:50:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32ec69d22b2so5152807a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211418; x=1759816218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b3KVfEGjSay2MX7CoJvLOzV1CqboHslXk9pdc9qozsE=;
        b=CYAzrhJsTAzA5WxjYeuhRUyo6ZyFo+j/xKHgeB346S5/zb10ooGI4qA2pFDiJ2LnJc
         sjvkvnxLm79+DJvaUPUvEabvtAKNCLaj0IcznB3prs3XWBKKwZdeoTLwPfdC81sLtlcU
         kxV/kndLh3Y8T/arZbaChcmXYfwoYRfS/czL5CY9Zn9PLg2WxiXFarBr9Aq/Q49TVYm2
         u+TtIHAi3up5SYc8X7F/5E/+CQADfLOmJ+3uK2thth9vYzjbRAogq0j0mDesa632fVUe
         WBuHCVCIBY6Tdw8L23xCQ0NlVoexK4N6eTjnHZ+qDddr1qDW0sQ5KqMX3Q2rIv8evjjx
         USEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZVanWLZyhrNe3c9x2aVo6B/ctUwv/z9YeLG84aAvqAzbpNF2O7F8uz/Mz0khy47DwvU4yL0QUmTzgisDP4E7g@lists.infradead.org
X-Gm-Message-State: AOJu0YzOeazkbNsJ15gwpFf/Dk0rstTJmttEb0hwRkgM5mJW+pfrPQKG
	2xLP0obOU/saKa1PC3bduioH9S9UEpCssPRbJdOLVlyROEz85bV2Or2efw5UxrGgaY4IMdJF/g9
	mEyOQe2cAq9z4bpFldPgcP9Pwh51ijWIQ7KqCdHh4cFZ0Z+KhhNNWhFsEQejGUMGIsb8QuI8/TG
	Wzmg==
X-Gm-Gg: ASbGncu4WTi7EjmiGrUBvXKviC4t+cnLcMvFeYaZQA5yN9Wyfn6ZJOqFafJ8NpZ6N+a
	Xb4m+lQj4Tzu7dbZa9RxnwVbsq0zyzdeDDTZ3Rkb9qG6EuZNx2HRfMjRfcjuq9k3lYInpN9UfwN
	ORWNkJN/DLg9EDRJjiRvtWyfWZMFtprrnxNXCpUE/ExZiiNnUY+lZOpRfLlJliafGH6yu2VEkoz
	eVzb9Y7o2Z7se4vdPmnTGxgae10Tv2QuRTCNSoCELtOXzJDS6a0PtLZcnozT27mG2xHKepVG96C
	tRr4Mkjo+wF5prXDsgcBGCfDXHRRsKgWlaW/1ASK6lNl+fOMojxQrOyskuPsdQPMu6QDzQ==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-3342a29906dmr20304948a91.18.1759211418003;
        Mon, 29 Sep 2025 22:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo0RE2YKa4ZygxZu6kxjp8Q2RIAaVkJ/MyZNvDXmSDipKXnnMeHOY/Pjn5S54HjeUH61NjDQ==
X-Received: by 2002:a17:90b:314c:b0:32e:96b1:fb6e with SMTP id 98e67ed59e1d1-3342a29906dmr20304912a91.18.1759211417534;
        Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:50:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:09 +0530
Subject: [PATCH 04/17] drm/msm/adreno: Create adreno_func->submit_flush()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-4-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2662;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=HQNn0GpSr5MaoATHj12j1OfeIQxkRKUAuDUx63OS8o0=;
 b=R/N87ADKLI885gc4zTsGjeVFnAH7lthAW1ze2DZJAlARQpSnNO9Y+gAiY+MUbS9j70fOi7I4V
 Whw/OBdpDLmDwFAQAOu1zNCO8SxfWv4eBVJ1taJgS1R0W3pl7D4FPDR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: _wLhDTn07KvFmmmng1Qox5kHYFDYUfCc
X-Proofpoint-ORIG-GUID: _wLhDTn07KvFmmmng1Qox5kHYFDYUfCc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX++6TFGDRrG9o
 n/GVnpsxuOW2QeY02EYVkGP2ZJ0rIvf2510l4MDH2lsU4vsv9wZKTGDcpZF20zTKVAzwp4uS99h
 C8r2jFgIZ0aRMTI9QpgiKWWKk4WjZ+KmTYncKvjZuWHfccvncbX1CSO35L4E291ysNhYXG6z49w
 J98M0rwkhwQQt0s6Wtusl5Jq/uau68JQFcpeTBhj6kqT/aZFskHlqpedH0aWr9lt2o0Stgwti6n
 mrCQfbABKo4WcxYNzrvs+8iCbEahuEJDMYnVhmA9rzLEyYq/aCzRkwUj66qxwF1FodvVbw0Bd6n
 rd/a1dHmTxc4+JqIAiX7qlKGFSRhADNS6YAuD25JgkpIzqs8s8T08XdK4HYgsK6DPd5oGYtRp8b
 oMIsIGMdnWz6Krx28rwJXXFKE7xdMg==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68db6f9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=geZ1VMdEqvdXz0YL0KoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225019_635907_854170C0 
X-CRM114-Status: GOOD (  16.56  )
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

To dynamically decide the right flush routine, convert a6xx_flush to an
adreno_func op. This will help us to reuse a7xx_submit() along with
a8xx_flush op.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55f5578abdbdec6bf1e90a53e721a5..9cc2f008388929f0c8e8f70a3e3e79fb4d35ab38 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -391,7 +391,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 }
 
 static void a6xx_emit_set_pseudo_reg(struct msm_ringbuffer *ring,
@@ -591,7 +591,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	trace_msm_gpu_submit_flush(submit, read_gmu_ao_counter(a6xx_gpu));
 
-	a6xx_flush(gpu, ring);
+	adreno_gpu->funcs->submit_flush(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	a6xx_preempt_trigger(gpu);
@@ -2557,6 +2557,7 @@ static const struct adreno_gpu_funcs funcs = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_gmuwrapper = {
@@ -2586,6 +2587,7 @@ static const struct adreno_gpu_funcs funcs_gmuwrapper = {
 		.progress = a6xx_progress,
 	},
 	.get_timestamp = a6xx_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 static const struct adreno_gpu_funcs funcs_a7xx = {
@@ -2618,6 +2620,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
+	.submit_flush = a6xx_flush,
 };
 
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 390fa6720d9b096f4fa7d1639645d453d43b153a..77b1c73ff8946fb0f8ff279e16c973cade50c130 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -74,6 +74,7 @@ enum adreno_family {
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
+	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 };
 
 struct adreno_reglist {

-- 
2.51.0


