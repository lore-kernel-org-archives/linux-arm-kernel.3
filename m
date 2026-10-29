Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vWcfkMdP;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zewEYWpn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=; b=vWcfkMdP1M1Y+o
	sWAAB8ulwtp9ef04iYxX5EyspeBYtTN93l1waYx/Px7N9lMwBDITRnUnmTp0SqQqf15kcFHI+hhHf
	HW1iKEJf3fJg+5TCFC0noUrsMDiKI2PBQu3L+E1iND0oTot4HXrSCVPwkuBuUWqRgpeHVxLTc8HrY
	EAXH8zMILAb8AY1R33KjI1ePhfNgpdSBlhsayEqYtwWtbI0oNI0bPnASvejhEWigXxeb24uhLL57B
	pOTgGsfjFpgS57Pp95ZRB029JroF/Fi8vvJV23/RvpYqWeFvXmtvrrz4eTqDpiKdzX2XJTYcNcdVd
	7CWAEiXNfAW8ZRlBEb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZg-00000009SQs-3Wgu;
	Thu, 29 Oct 2026 13:53:48 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQZU-00000009SAz-2vY1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:53:39 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1767990f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282014; x=1793886814; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=zewEYWpniypnKSTrqUBvT92B49VKToycpJrjStPBw+l3CNJt2gGkuoFtkK1qY5Lo3N
         /5e1xthz6jX5cwOGPcCm+YF+q5hMHH6WTnGu8xAbD8cy6tJiWntXYLOJGey0ynmb/2xT
         p0JbjlbdyHtubke01WHHJPmEIiml78ohJd2/JJzpxP29TrYFAR+FV6+eOOepKT/3DqJ+
         JRC8O28+ZNSTiY8wV2hvW2gBxJ73NUNS7fGVbp5tbltouCMZ0gLd5J8co3eX8LKHp18h
         Ge+ZFroPEl+++MpOqebswBAT6sBHJkapWdcQ/8K/G7t3gd2ZDDYVdnWX0Py1WXu9hg3b
         o7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282014; x=1793886814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhFC/E+vn7Ne1GmfoUxjx/snlj06M4a6yUZTElbwzmM=;
        b=QHBaokilIEH3vK4O3h9GXnxKa0BRdjp7qqjb1EIRZMabN0Ld/BPzv+mA2h9YpzIxPz
         2xGQgLInodx2X58lMMuaNfD3k37mG7Vj2zvOH0J/nqQRjWGktsTitiPiDwnybZS1vUuQ
         9BVqO8Uh7deEYCUL3vRz0LhB9yG0ms1sX06XyybYN+a8sIOEGVh8BWZ+Rh4R9fwlL5cX
         XPbQFxKBvvRIdVLTnkt8f6xUKBfnaQTRsiepBpY6VqbOWQRiHlw61ZI5DxH+5WlYXY+7
         g/GYAuXr+k47+T0MhMcqTBH1RaCW5SHtx8g88kBL9A4yp8LPFLpB5V3LPBDKr+PEo5a4
         qWcA==
X-Forwarded-Encrypted: i=1; AKwUvBxcS+DfjGr549a8gG7gEQu9MMBDD7aywzRBrrXHuFayw1MYH3jfqr/nPv8fK86bK/rs7s4pSnRorGdYzstPB/Bg@lists.infradead.org
X-Gm-Message-State: AFq9FYKFch9dx1zIaujdNOULE2OFAq6ekvxadZBvqt9w4LQMwh6l+GlE
	xTxPExUDR8tFAQ/lIoxDr2NHdeOb6R0Gxfs9/yt9tsxWKHkMelpp6KTubQjo
X-Gm-Gg: AYBFou1vDy7F749YzU2MjfDuhTaATAY8YfebQqE8lj+Jq2zXoFF8Mu8K6w45VOKSLXZ
	tgmvOB82mk3knlL8fMelqjhqWLvvF6yMHkUYXKoQ5Jqp54aSAr0BPvHnX7vZ3u6Uq4TUrkyVNnX
	UGZ4bFlNmPQkiwUk1EuxeVikHTE+PrJb05POlbwKZFUWgG0Pz7qthWc6UPDHT0K7/kB4BRLMDL8
	UBYHWrXNY2SmF8NFapzfEBve7NASqQ+JqX1FXUZ58uZ7QL0OA1PjKtVisYu+TviyPZyJBEh1hWE
	54kiCJUdPjSz1bVW87IRK3aF6sFP2mOUwW9lAi8wiH5OCyNp3M6D0EXW/e8mKoZV0qorGUdF8Xr
	xJkLSMwSmtJD9rYNUPnlk0B7+x6YsuwTL0vi4YAo9mvyTMPH63jYOO/0CQDfkoLf2W7AFHF0oUO
	C/q6TV7ASTBdy1HU4PcFHZ+uv5ZmZyulWRl5NnZn9IVepn7nMZdih1Cc2kqbyeftHVMZSgDlKSs
	ET7e+yXOcF0sG3COb/MeeLg1h2fKmI4B7wkIdlJVzWehIEleIhGnydhUEgRMP2UDpbL+gCaqcI7
	7RM1c1CcDH1erPJ6nzcxPWXUtVGsAW+4TSRf6R30MZefRw==
X-Received: by 2002:adf:f491:0:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e5d5909aamr9182569f8f.18.1793282014126;
        Thu, 29 Oct 2026 06:53:34 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:33 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:50 +0100
Subject: [PATCH RFC v2 13/14] drm/msm: gate lpac behind modparam
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-13-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=1928;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=ZEwODnTsRSIiQzAvYlWfm8pmWhNZkrTmOspw3E7UZvA=;
 b=Z9dhvvnQgx4S38zM+b46UTdfg9SThPOIVSdAoOz7EGATYLcY7dL9exHHWjN9XuX2BOku7wLrT
 FTPWSEv0DrrDpKLv4feGQ8Wj41R/cQfHXOM+Z/TSHsGDJf0un1xYOaN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_065336_767043_6A699673 
X-CRM114-Status: GOOD (  12.76  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a mod param to allow initializing and exposing the LPAC ring.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 drivers/gpu/drm/msm/msm_gpu.c              | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6e2333466d7f..51781a2e8a00 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -30,6 +30,10 @@ static bool skip_gpu;
 MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=enable GPU driver register (default), 1=skip GPU driver register");
 module_param(skip_gpu, bool, 0400);
 
+int enable_lpac = 0;
+MODULE_PARM_DESC(enable_lpac, "Enable LPAC (A7xx+ only) (1=on , 0=disable, -1=auto (default))");
+module_param(enable_lpac, int, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 4244d9324cda..f6927c797fa5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -889,6 +889,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const char *name, struct msm_gpu_config *config)
 {
 	struct msm_drm_private *priv = drm->dev_private;
+	extern int enable_lpac;
 	int i, ret, nr_rings = config->nr_rings;
 	void *memptrs;
 	uint64_t memptrs_iova;
@@ -1012,7 +1013,7 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		memptrs_iova += sizeof(struct msm_rbmemptrs);
 	}
 
-	if (config->has_lpac) {
+	if (config->has_lpac && enable_lpac != 0) {
 		gpu->lpac_rb = msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iova);
 
 		if (IS_ERR(gpu->lpac_rb)) {

-- 
2.56.0


