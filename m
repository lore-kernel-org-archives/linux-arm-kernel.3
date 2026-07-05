Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C51C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=; b=QMiY5LA83kSfbYRxYpMuBb2U0x
	3GQvgovn0nPj6i5S1vIJ3qa7dYM1MTdX9f8fBgvtPQpSZ+MSrqC7dC6drH1Mpfkud+nvaDpn7GUjm
	p8rHqYy7KKSCdsr8pjTOQhlwV7OdAGXJRBd0rPmQRbRPmF745ciFfnn1nOy9XEfO1+PcVV+r53nOs
	mA0cjL3K+9o+Am7TLXJPLiRmMKNRAAj6UHUE8cspBZ0kPsWk5O0Pv4Q4D4dTlUeBENvf0cJ7kbpK2
	d+9bnOnRPwq/0rmF4GeD4T5XESDO+n87sf09TB3EL2swtFJWxViSjNj4u6QD8XP2Shfez+shJpDTd
	hEFhWwxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIL-00000009ans-1uyg;
	Sun, 05 Jul 2026 19:14:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSIH-00000009akd-0q4c
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:14:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-471eeac43bfso2560340f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278859; x=1783883659; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=;
        b=qgg+McEaMWsBmmZF/FGKJNbwck83PfPu8A1Gday1TnE8pctOHMjF1Z1Y3NafezTI6P
         7FDLdtDjAl7I8qMrhPllJI4K15JEkiIK4eDq1hgy2k2ucdo3PvGJdL9EQnjWwTKxEOYq
         FA5gXqE+9Yufp9IXueA7fFn5AuCIiION6lycnz/ff1gjNyhIWGlabwVOSesdiKxyuBCC
         pIzTic87rpM+8N7/HRYztvHo9UkgZ6uuTcbtNSpg5C0iudde6UgEFsxxYEIzDvm3+qc0
         JiriF6XEjaMsPdKDLqPl30DNGucocnSfzN60//vWA6MH5mYUTaRXCkrcmJy5TUBAvO40
         mN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278859; x=1783883659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDQluHb0hl8HpKdUOUtAwKScA61PoZ6/9MDK96/p22Q=;
        b=VK7HKuh7ky/bBSBuPCdJAQ1XpgycDAGyLXcRUrPZ4jCbI0KeQkiPe3mGxZJ0/Xb0mH
         TrCq2PzQY7nriPlkClXHUVMpv5cfTJRXJqaI3Jy/WJBdaaxKcRyz3ekLDFaKyfOUq/pH
         dD6OMbBLoLB39Z3iiXJVIA8ZtY86Habh6UPWoDJ6EVksZgi9fwSZGkzz5aOuAkAZ74ni
         E01zQKCQIr0Vg92k0c+OvdywOxy4LrWjYQNC1yBrRf4ik2bMyUWBhLdnBYWefxCSmr+Q
         PhDR7ISquYUnfgQONOGwiGAhBLnLgOXGI4aojLZVzdhfvTXQYpckgzMMpIijEUkkI6I0
         jjaw==
X-Forwarded-Encrypted: i=1; AHgh+RoC1Ttyi9OsOnEQDqpX/ezQw3G+VI4l/TLEPwrppxA98uBkmsetW/B9KX8MHy9E0zM1puOL2ZosWIcijq07vI+K@lists.infradead.org
X-Gm-Message-State: AOJu0YwCcAa/jjWCrYWBMq/kotN5tXFGMYVuNOFPZUIYykwRu/DjgfCr
	BtmOQBw6ybxkTktmThFIOEkrzVLxa2cLoF5akp4P3dlaNXqkijDkiH8=
X-Gm-Gg: AfdE7cn6W4xAKUzQwlLjMj4KYTEytbRLh5gu4B4nT2ttV5q+9zxsFnKh9cg0Kz7S/1K
	692MoepV1t90GU9juUlb6lupZ0DGTB4CSEG+Nog21snWOuxufKfV8RFWTgbWHrYU/uGxvmFD1f5
	L/8qXhAEqkLX4nYEPeZPVYu5oAzCk3iCkHFohctmYFTBbsNbQenhZwFNmcIsWRU7o0BfpRuMBlc
	vD3B0CpjDI//N4csKWWmfNUPytx/SdtCyZF981EmwGoZ1MA1c5zuL7DBBxP3vyrPxbCO3CV00Yx
	Ab2OWhV9rw2xjl0xJQKHubp+l5pGpKTghQq5BrDtgaFcDQ4KLcZRyT6ZzGjncteR0hOMMDq0o4I
	KVJ1SY8eyzZhks+F+CCRXkqKclpIHQdHfErhR+nXb39CPve21nKGZCsss0VnR2gcjovAtthwQOP
	uFoVxeBIdYDbuCkSvkaqc8Jvh2pt+nyw==
X-Received: by 2002:a05:6000:41e2:b0:46f:ca9:465a with SMTP id ffacd0b85a97d-47aaa60d512mr9236488f8f.21.1783278859133;
        Sun, 05 Jul 2026 12:14:19 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:18 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:37 +0200
Subject: [PATCH RFC 03/13] drm/msm: look for lpac from dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-3-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=3023;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=bbKLUcBLFub1tb5TatUPZPAkNtWF5490OkNoXJdO3Uk=;
 b=7V8X3RcC17AsLp4EvKV8VBh99CxZsYWbT6DX1+PJ1oeSqvZHrZHxSjd1CzKlfExV5zUSLhrW1
 hjyiu/P/E73CA/bsNLALt50GwglEelh/PKZjB7H/Z0Rc38c39U6bUFN
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_121421_277243_E7041CD7 
X-CRM114-Status: GOOD (  18.47  )
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

In order to associate the SID used by LPAC to it's own domain and
context bank we need a separate node on the DTS.

Add the code to look up that node on initialization.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h           |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f3fc7032fadc..71ce4cbbf27a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -11,6 +11,8 @@
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/kernel.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
@@ -201,7 +203,9 @@ adreno_iommu_create_vm(struct msm_gpu *gpu,
 	struct drm_gpuvm *vm;
 	u64 start, size;
 
-	mmu = msm_iommu_gpu_new(&pdev->dev, NULL, gpu, quirks);
+	mmu = msm_iommu_gpu_new(&pdev->dev,
+				gpu->lpac_pdev ? &gpu->lpac_pdev->dev : NULL,
+				gpu, quirks);
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
@@ -1187,6 +1191,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *lpac_node;
 	struct adreno_platform_config *config = dev->platform_data;
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
@@ -1200,6 +1205,20 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
 	gpu->pdev = pdev;
 
+	lpac_node = of_parse_phandle(pdev->dev.of_node, "qcom,lpac", 0);
+	if (lpac_node)
+		gpu->lpac_pdev = of_find_device_by_node(lpac_node);
+	if (gpu->lpac_pdev) {
+		of_dma_configure(&gpu->lpac_pdev->dev, lpac_node, true);
+		platform_set_drvdata(gpu->lpac_pdev, &gpu->lpac_adreno_smmu);
+		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
+				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
+			dev_err(&gpu->lpac_pdev->dev, "failed to link to gpu device\n");
+		pm_runtime_enable(&gpu->lpac_pdev->dev);
+	}
+	if (lpac_node)
+		of_node_put(lpac_node);
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_has_rgmu(adreno_gpu) ||
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e2291dfe3ca8..271956e7f870 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -172,6 +172,7 @@ struct msm_gpu {
 	const char *name;
 	struct drm_device *dev;
 	struct platform_device *pdev;
+	struct platform_device *lpac_pdev;
 	const struct msm_gpu_funcs *funcs;
 
 	struct adreno_smmu_priv adreno_smmu;

-- 
2.54.0


