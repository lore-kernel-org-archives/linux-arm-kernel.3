Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3BCFD5F86
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q/MofJKHc8I+/Pub8F3lPg5UDKLJc1Wt+gTwGRRfhuM=; b=dsU564Hv41nUspqiDXA9ehC9ub
	/IVWMiq0pXzvwIvOzS7I7RKz7s0pg82inlV1VecBHRGYYrrqs+AB47PRRdHVeI//reCUgaForkSq3
	1MQ8NZg213xwntd9gEE35nHMLQQKJir4tOB4YI8NQHjIhzgLvDJNG9RlChcoxu20lDYbxpZH2mpbn
	yAsrha1c1FSQtvG8LzG3dJ0fkjpvEWnYQeiQbMUIen1Voa6FtET8tb3o8YdFeYt5BzexQfDpbG/Xu
	7pOmS49nnwtKkCP5zP4QOLCdxUdDde01n8Tp5OX0n4GUoT7/mq0mzlICudWHgnPUTY3KnZm2UDEkr
	j8qp66WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMjX-00000008Mzj-4Bcb;
	Wed, 08 Apr 2026 06:49:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMjW-00000008MzJ-20rN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Apr 2026 06:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Q/MofJKHc8I+/Pub8F3lPg5UDKLJc1Wt+gTwGRRfhuM=; b=cCnIT9xVY6xmqdAC+h+kw8z5Bx
	h9dHrSg5k1MjBrsiWZEky0VfEjjrfaJfQY1c5X+xEt3BClcBIs1jvhLgt9e97OLllSWW/U3ktYwP/
	Enn25E3n+Y4UzAk2gpoTE1iZhxUl6JHyLeD3rKf/VC5ilptibggmQ/2O1CZfucivbRH5RadbB5D/H
	6vTN4jMiZLSNrUTQhiaBZmg5cUFQdLt2IDHIn/um9NSOJCQgtIxY/VZqYrhBCZH8bUvkxGJWyCHUu
	AHXE5FgGEw7mn+K4ZKdCbxiDsmXgT+d6tjrZ7+gjXvOXx18A5R5SKaXArdVROzsKhu7C1MW521EYM
	n6VmoiRA==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMjT-00000009ULJ-1N4K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 06:49:49 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso2068964a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 23:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775630985; x=1776235785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/MofJKHc8I+/Pub8F3lPg5UDKLJc1Wt+gTwGRRfhuM=;
        b=XMgmur57rWhU4HMMDyFNv4DM+U22ieuY6n22HoxEFF8Aqu9OSK7Xj6JS7n3bQK9x13
         0ygZiRTpSp6H3JPh0Q1eU+ET7fJZk+ZYy3Qz8ukYgqvZ1CLeDF1O3O3REN9mpNIhESYt
         3YNn01z3LANK9Cdv6271Y8dOOdjn+R7a8AGsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775630985; x=1776235785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/MofJKHc8I+/Pub8F3lPg5UDKLJc1Wt+gTwGRRfhuM=;
        b=ZFapPuZJlYtq+eL7kL3ls2/8fD167N9o73rFnZvx/froSsSSgIXBNrwUflymtoNTFD
         AvP2SpWdDe+922R9aogW/ThRDqBVpR+XvdHSVyDoZ9xxidl+70ArdW/fB411Jk5MhW3f
         TZBqEO3vmjXd6rr8pfc6qCC6gykir5egiJtaqRHx9qhLr00l92QW+VxlKkdM1SIIQJ0f
         jBuX8xZc++2VamR+72orMPnP09GYb2SdyQFuQrjVrgsyJCuZb6iVoUUZRBZHG6aVmGuT
         ebNyCJAvjNLKI9XssZLAL56JIVKSrx0C8tYzZZm5GDk3ZQGMsDl1X8fy/JHvY1W1fMpE
         vvXA==
X-Forwarded-Encrypted: i=1; AJvYcCXnowGh0+lDJmzclwGumNOf08vLktHPhNh63zbhAgg2jRXbV6SFz4xuFJugGAaQ7klKckOXK79qqxoYCv5hpY9S@lists.infradead.org
X-Gm-Message-State: AOJu0YyoIdLgc6h7eQ67GFe9paddoR4JWfb7rLiCcG/fWvASbhZ3YW9O
	x/0HsyeT8JWTWz5/hAPaRcRn/XUgLbLwel+zWx1iqXA2kPtNqrBGbL7uQ5nCsiwi/w==
X-Gm-Gg: AeBDieuJ2MOy4BLACWYjehT1aVrdQezZwx/pFN6x7hb0oGIGaV2yUz7VuLzl/UziCD8
	t3TGPYVNB00LWpHgHkb5nl8xYMQqsKQmytSQQcBgprYjYnTek6rdKGTRRb+5+a6Z8yJjmzJV0s5
	+803VHcBGjKeUVvEcFDHh6aCm9LVYC1oR6MA7gzICixclm/g9eQn1dRnkwCBPGwga+qVkoe6+wq
	8O8EHmCETTSKTcTxGuQCEggsWPTN1Xnq1NTTwxF8I2XIcVNFpel4bTomjYwsK/BnoefRBhb+000
	q9oRtz7Zkh4gq5+HVMioM8jdYZBDihKTg7v5UgUlqdDaDXLAAnIF/NK2jXEeEU2FRFEZ/IqKGg5
	td9MsqFDFHMwGya/qy8ylr8b/9Zep3OpyoIykAbvBJ4zpkxVJXoVMaoF2Y/aw5lKdDU1GSa7R0l
	E1c+sfNwOJQnkmwf+ZbKVZ7g8MPkMqqo0WURA1Tz2Ttuk3a2LFTeHflrUsMYqxNAnt957knCKGy
	mgxnz68
X-Received: by 2002:a05:6a20:7493:b0:398:9ae9:710f with SMTP id adf61e73a8af0-39f2ef7e3admr21007463637.13.1775630984895;
        Tue, 07 Apr 2026 23:49:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f0e3:c8b2:74ff:70d1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c6561fe9sm17036136a12.15.2026.04.07.23.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 23:49:44 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/exynos/gem: Fix printk specifier for gem_object.size and dma_addr
Date: Wed,  8 Apr 2026 14:49:34 +0800
Message-ID: <20260408064936.1342321-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_074947_549785_15F28B46 
X-CRM114-Status: GOOD (  15.15  )
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

In the recent change to use the GEM base object's size field instead of
the exynos_gem object's additional field, the printk format was not
adjusted for the change to size_t type. This causes a new warning on
platforms on which size_t is not unsigned long.

Fix this by using the correct "%zx" type.

While at it, fix the specifier for dma_addr so that the cast to unsigned
long is not longer needed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202604081331.jSJQSVmg-lkp@intel.com/
Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This is only compile tested. Build for ARM 32-bit confirms the warning
is fixed. Sorry for the noise.

The commit hash used in the Fixes tag is the current one seen in
exynos-drm-next.
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index d9d42809a1a9..f264e170bc26 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	if (kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
-	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 	return 0;
 }
 
@@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
-- 
2.53.0.1213.gd9a14994de-goog


