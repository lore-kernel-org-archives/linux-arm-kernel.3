Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB1CC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=; b=Zb7Iy4KsbssbM8aUje77czLBTd
	bH3yfcQ53LGcvdQUQdW3VJIZt00/OaSSs+lUUXxoGau+drrUoLjDUfGLqT1/sH7Sk52uT7e0dyjK0
	Cuw0EpLMpZ5GSHHEY9ZWjTD5KbXzehG9gFYwuvFjwq2WAt15ZBmJBnicOxbfsmM1LCvj7MCs+GAfN
	vLYjUjgVDvBMtlRQ/MCtPIXeKwFrpJ4cSuXy6tWJSXQGP25FJ1w1+1zKv4/aWEKRvdWuAou0rg8FR
	lUjzV/Fd6jr3OlQK+mU6vdxCWfSr1okzs7cGSwNxZSO8HKht2XUDqw66d0yvlYtHCTTlbyF7aDJIz
	0TXqiQRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TuW-00000006t2c-0MaR;
	Tue, 15 Sep 2026 14:13:24 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TuR-00000006t1G-2YNV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:13:20 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab222dfso444564d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481598; x=1790086398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=;
        b=A0LD0BtxlQHdJeOVOwBon5w20BR8OicU3gmFzXNVu6/WyeC2yG5A46waFS1mqCvpzD
         wRCwT50JZPIVoyVvEsx/ZqKjGyNvrwIMKEOpm4gAZTEu1inv6dC14KkT0QkM3SRiukmk
         ySfYApZBX2oAbz2j9gFxMlT86DXgsKlgaizjSC6Xz9C5azApz4KPlh3WVvFaIv3hVvBg
         JYZgg7+jZw6fDgta1qtj3dXKYpWmK/3savvZeJnbj8kWZEftf2LIgIUZddM5InBOfvqW
         ehS5uhHSMuyc2KfJlXMygf1xTNCHCiGX1Ux73kk9rtxG4qCuJg8MUQSm2fsEwtR+YFeZ
         UoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481598; x=1790086398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/dvc0f8jIgO60uW57rTwjvHY9CDCgJCM89WrVhajN4=;
        b=m7ZzcOeIyZEofDXkYGkyrKP6iQdvlngisQbH4gCy9Qi7CVWcEGcNIB/vK2JpYu4Mgt
         T/JAnSYji+t+mZ5yECFL4STsv1GnF/piA5Ve05Sufl30wBzeDvO6kZtY3U+zNMzQSUHM
         qTEInwSYyBTP8vXyJgtHdLvwxNeoGL3VUgyBIlKZkKIQt12qvQfpojif/dI61W1yWiDX
         c3y/dzsFzu4YiopZy6kdYQzX53NdMAYOgBAtLcAsR1nFk+tIQkHTyvtYiryJ2zSGmvjj
         Oi8+Pbqbi4WFXCXFssWTwuo/BPUcE8QiNPayJLDOrSVMG1TIehDunCjT5MTm6/rBecFc
         chbg==
X-Forwarded-Encrypted: i=1; AKwUvBzv7D0J3sr/SwNQ0FHseZJciLYWUdGSa89K+kjiPeLwdaH2VfqBTcy3VVuSMKDJ5hpz9/xD4YcFlQWTP2v7TYHP@lists.infradead.org
X-Gm-Message-State: AFuF++ldiFSgqgiDr7bHdsPswV7Y9Lm2BQAw6wf1ppnumr9Pik17aywU
	oCQbeeNs3x6avITNT2LaUGj6+mxRztR8yxNsSbM44oeVlQC+8GJQoWVqeKgFUC2U
X-Gm-Gg: AYBFou2kzhvjpLXubApi8J2RoiSEnrYpXsBg44NimsUskq/1HB1Q6Rj9RlCmF1bVec8
	GP6wGpdzHhFWz5eO2DtyYxTwm/swMrwvHHSPE8ZhGFPkaPy2HklZevZuQfP5xJ+r3I+z6bpvAer
	1OoCY8rJoK+mU7fcvwTBxyRHfAuoptL5djJM17P8rWoKVGmz18f4I20rnHbNPEszMrgFrb3LlJB
	vxnviTQFOJLJp2dtE3QJkQYmnch5VtOE96L1Er0DubrIfNHPdXwejV9sqzPqWns4WaOLj8FGRnb
	jFAJw5bW7+TUDqKH0uD4RvtSd+6RoXdHHyWD7aVBLDwGok1hgDc+nv1tkg/m50cNeQOYkiOZezZ
	zXr9s4F+azNwUiTHcaEkkC3BC97SYH2Ul4AznLHRGXTIdXtdjNioLPyIKPwG5HYKzTEmlcnzbuM
	XCvz2w6o7A8SM1smNLvQiAzANfwXoBxdNrHCQS47sfCJ5aQlCX92b/9aU=
X-Received: by 2002:a05:6820:8c7:b0:6b8:1306:8567 with SMTP id 006d021491bc7-6c739c76dc5mr719865eaf.57.1789481124343;
        Tue, 15 Sep 2026 07:05:24 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6036fd7sm7020010a12.0.2026.09.15.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:05:23 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: rkvdec: do not destroy borrowed SRAM pool
Date: Tue, 15 Sep 2026 22:05:11 +0800
Message-ID: <20260915140511.2429792-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_071319_650103_2FC4133B 
X-CRM114-Status: GOOD (  12.31  )
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

rkvdec_probe() obtains a provider-owned SRAM pool with
of_gen_pool_get(), but its error path incorrectly destroys the borrowed
pool with gen_pool_destroy().

of_gen_pool_get() returns a pool managed by the SRAM provider. The pool
is not created or owned by the rkvdec driver and is destroyed by the
provider when its own managed resources are released.

Destroying it when rkvdec_v4l2_init() fails can invalidate the pool
while the provider and other consumers still reference it, and can also
result in the provider attempting to destroy it again later.

Remove the incorrect gen_pool_destroy() call from the probe failure
path.

This issue was found by manual code inspection.

Fixes: e5640dbb991c ("media: rkvdec: Add RCB and SRAM support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..4541ef9ee3b9 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1857,9 +1857,6 @@ static int rkvdec_probe(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 
-	if (rkvdec->sram_pool)
-		gen_pool_destroy(rkvdec->sram_pool);
-
 	return ret;
 }
 
-- 
2.43.0


