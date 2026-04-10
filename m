Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB18F45A0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 21:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3wqhCT2PYrW184+42077Vlk22WDYcJROXdpI32jLbM=; b=1N8eDmm0+GPlOmehYgQQXWSpwe
	2hVr3XQoNXF0dcm7GgWrzArVOe84rJzirqjNOjErwT036LIt39EVJc9bwjeBO1ltoatNeQVRIvNjq
	CPTKnjI/a/V964gkQTHNjLjovxD5BN0pF85ppvowGztvBwBmG5cAZfCz8HtoCvX+CEkfyZxmpKFDC
	QPfH6bwFHp20jRahhxqZXZmhhStWKsmomCR2pB/2ywj2RVOUQS4ZiupzHXOjNOMU+YObMGo0Iy56v
	N10f+uP09MpmTMJEcKWv9XqIWfYfWsFkZdoF9ajm86HANX7sDiqYkRuZuqPD4Giplrjyi9BxkPeG2
	QYOVnlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJOr-0000000CpKH-2pDo;
	Fri, 10 Apr 2026 21:28:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBJOp-0000000CpJv-2NJE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 21:28:24 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43d17bb1c1dso1946299f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 14:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856501; x=1776461301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3wqhCT2PYrW184+42077Vlk22WDYcJROXdpI32jLbM=;
        b=rfCHAR2m5WogSCFKl15Gtt3wiAsBXaTBmc520ebmpgJYMIYvetbciXVNDSezmty+zi
         SLoSqy9NvkinjMBtFdVq3KlplsQXxH5/8eHrufFREPsm/GekyeOsNsfyAQ9pM8cje7Rb
         DCs7eJthwan+a5LW1Uw0OWkzpCVig4VBognFxRAWyvgSIAkFq2CXgDq5JEBF8g95NOSE
         KVVtGCwmiXS+GNqhv+CLqkjYMb6hn2m4JBjYU4hJ+zPqLEbQkK5la6ArIdAyXsVfeaeR
         YJtftME1UVi/bEadPazOVC3WLx9cJ7ZD0Jyu9gfX8kzQZeSLxprN+nVrL8HJCbMp+2T2
         qXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856501; x=1776461301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l3wqhCT2PYrW184+42077Vlk22WDYcJROXdpI32jLbM=;
        b=Hmr1Bty3uoTMvq5yTOJEnwPVxC0TqIZ0/DaxDvQPTdtU87XS5g6p4ZZvBOFByuZrv0
         Gu19X601OeGrML3vnmAbZf7LJlCsQ2WmipOJBwUkYKgiuTfOUQr3yGYoU1qGwFRV6Mt6
         jxrJmUEqZ/dQf5pmpeScELL4a0r5h63Ma5AVPCr1XcMVAa8hANH2sIyY+7wVWufcwUep
         WqFekozU0u85FFDQV5Wf7RkKGnW/wDclkbi82VxdGF9/n+jyDj90Kumyt1MJ7bWEseP9
         llEGo9wBFSiibmo2VeEIGWBUcu5OiDYSLtCBkwypWjT+V7fEFLzlI17VPev5UDLQuTK0
         7XJg==
X-Forwarded-Encrypted: i=1; AJvYcCVyGjKO706cpCIUz3NXRiA6Aochs6KnTTpHZ3FvHzePjP9iHEw+ZC5Ne9Wg+ECREv6z9JAUEX+nF32d6KIptWPQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxR6ENf/359esCvKLY/sHG4z9BXTz5llJaEOM++m7kLiVfYfruT
	SNO4njFycROIgQZlL4lBv7utoFo3tHMYdAp7VLVExLp7bt5Aj23usWqg
X-Gm-Gg: AeBDieuAwFOHpCyYkIrbn+B9hCVahqXPra7RG9MXFjl/+YocKwVMcTyjJFnOM2HL/kN
	kmxdWkxCrloojlBvWjTauqcE1xbTvEWco7x5yq22AAorMGoSbp9Z14g5Q27YLrCTYRgC/B/QSUU
	q3JNBrAvHTDnWS40uzvnxmdAw3sXlHDGn2hKtm5x0+R0ZCxEjb2Nbdp8wYswIWW4nxX+QdsTdpq
	PdSDU+MMBOiefv3joxcUuM4lcGB26hOSl62DRg5aGxgW+R40NpJ0VylEKffW8T4dIeOm4uwS0hW
	Tu1DoFVg3V/6TSdf6P3MZXF17Ol1TIPH28fbZ/lFCyaxObbWHeWlTeaqIvHEnAzemz1YgMc0ha0
	2cAVjjBMyZhzovC1D5NsbE00RTGRnPf8vq+q1J3DxnrPvEZy7BQ8v5G8rxgpMDbVOwUdwbEZVJx
	LoBUMUDlxTONSTCCOPKApcThmaUvUjRCmCG6eRfnyAOW2Js7V91pDhup9efBs=
X-Received: by 2002:a05:6000:2489:b0:43b:8f04:2ee1 with SMTP id ffacd0b85a97d-43d642c4ee9mr6929982f8f.27.1775856501227;
        Fri, 10 Apr 2026 14:28:21 -0700 (PDT)
Received: from osama.. ([2a02:908:1b6:8980:d356:742:cb75:6153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50015sm11205992f8f.27.2026.04.10.14.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:28:20 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: luca.ceresoli@bootlin.com,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH 2/3] drm/exynos: remove bridge when component_add fails
Date: Fri, 10 Apr 2026 23:27:58 +0200
Message-ID: <20260410212801.413827-3-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410212801.413827-2-osama.abdelkader@gmail.com>
References: <20260410212801.413827-2-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_142823_612798_89954859 
X-CRM114-Status: GOOD (  10.28  )
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

when component_add fails in exynos_mic_probe remove drm
bridge before return

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 29a8366513fa..5e771b236bf0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -437,6 +437,7 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 err_pm:
 	pm_runtime_disable(dev);
+	drm_bridge_remove(&mic->bridge);
 err:
 	return ret;
 }
-- 
2.43.0


