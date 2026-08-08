Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEAABC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zCtw9XLhyYld5CLOFuXhhaanDpjQ78I0gCn1Zksv45A=; b=kLgUGz76LM8XcU4FpIG0k35O5r
	hVvkyUifDins1r/HZe9oktgxtVReAQM6DWeDuIHzd0TVHBZIupyiMa4HzBlXL7rEyyJB3671VluyF
	bgzpEtcaMXe5AWaiISR4IvX8xPmrTgJ6V6mZUJZ8ow/IRRM7Z8s1zaa5SLIZhjA8IpJsecet+Cqx4
	gIDZx8BgDLkCHV7+FPC2nRaIEvAqDYBzJptqLOEISsK8nlri89GfDFbC03U3ibMBDfIqj+BnjV1hR
	uL2+x2KokhmgVFEJDFbDRMbVORf/973qQU9c7V+RecB/wUu3a6FLQPtx3emlS0fnATVq51vR7c/45
	hnMn7NYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsg07-00000009LQB-2NLK;
	Sat, 08 Aug 2026 12:18:07 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsg04-00000009LPl-3kdt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 12:18:05 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so296239a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786191484; x=1786796284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCtw9XLhyYld5CLOFuXhhaanDpjQ78I0gCn1Zksv45A=;
        b=kethUHjIoyh06lh8OBShIxUsU+Guaw5vvRDU9J6uz4JKFj5vXBHhcY53EFIdGYqZAG
         MBGI7Xp/evkbOs5+8pm/pQhG/AJLzQxA3To0J3/MY59+4bl4cfzxJk40+vr4yGmZwKSx
         RZ4W0BxRwjY2YMD6gcHOLwO5Hgx/7cW1CoCkLUH9iHzhaCbmfymdrU9KzmAXYEJQHiqD
         Kr+7KkyH626V94JHK4UYaYBHMjlWhsPSQzsmf6UDxO634WZb4Imyd//mkpdzxnFROSwT
         gfQspCekI41dFLF7ZACPDlEhZvxgPE0rTv+w0EqNFA/XECn8MSO975vlliu7SKu3G1KD
         eKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786191484; x=1786796284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCtw9XLhyYld5CLOFuXhhaanDpjQ78I0gCn1Zksv45A=;
        b=e+Qa1qWeTzePgzl+4lRveQ1qr/3Bvw/AbhMLgguTcAT60eihOTLFW7JGICW2fZN4Jv
         0HhVVemquwiYdLN3c/6gDBVkHh0Ix6xKNVgLLYFaZ68tstyv9VLscybBjzSCEQYojcL8
         OQb145eQoVZqkWpiAtx8jysYFRLhIcn9PJF6CaUZsS2gFafHnAs+sKwpt4ztsFxcLNez
         PmqNoSmDS8at9u9PRAcyO1z5X3GXHyMpJ7hU0zlPfm6acmz2LLGNS8WU2OOm274tAwzK
         jQIhS5U1NKz1NzN60ZvaoDuIczTEA/RlGLvSGZ+BLWF9j3DIHUfEhR6CwbT4+svVftck
         7pQw==
X-Forwarded-Encrypted: i=1; AHgh+RptK0iLNBJI/k0Lf0WhkeZjY0bZDaeJ0yhhWazPhzsRvCIyrFrBIVvWthWKcw+lJqeiKaTwa8Y7tRk5slrxvXPL@lists.infradead.org
X-Gm-Message-State: AOJu0YwqgpLsop1TAyXa6I86ocXcW5P5OHI7+vfcT0lu/3L0svZCH+U4
	QeTtCiHEpI62kBw3M76H1/2A1howQnQSZiQkJslN3KgFJiPVEE78Zz3S
X-Gm-Gg: AR+sD10BD+wrPuDSa6DlNRMcU4+Sa0+gqkYMIWFvxHDaLl/wgV+Y96AIrP7ayJkaJRU
	uEn8Z6C1aNZp2DeCjRyBeYVlmr//WN+G9zTvJ1gYJ5OS8rToiS9lp0lx04XpViy7VLQhd4D8Fyg
	cm1y/E+vRBMy28gHMSTt+cIJI+LJYBzLJzcpm0mbMkmH1ERKeaur2ijNFwBfbGNXHFm/cKNZVjX
	1k0kDTZVa0ah+KVkdP8S85EN6Ct0msELuzN+hFxmojiqkyB93cW0rRZ41lIHmXhbb5c68BTpGd3
	n3SA2WX2jn8J0ifVqE3JE0MagnlhWclW2lY5VBy4eAWtd0rOPIfkr+Zrpr71zfM6HK0Oq2NBIal
	T/sI724QZRlTFZdVa4AlF8lPJiOijhjoELaWMGTGE+0JxIvPzgVpAlrk783uw0nmKtPXEIqFE15
	2TgxDa++u051+lS+FBH69O20X08nOw/HNQpKVOS37Go4aHF+9QOm44KD6umRPT2Ipc70Lj
X-Received: by 2002:a05:6a20:914b:b0:3c3:bbe6:95b1 with SMTP id adf61e73a8af0-3cb85eef9d6mr29740341637.24.1786191483645;
        Sat, 08 Aug 2026 05:18:03 -0700 (PDT)
Received: from lgs.. ([101.76.249.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1b04e9sm1781742a12.12.2026.08.08.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:18:03 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Joonyoung Shim <jy0922.shim@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/exynos: g2d: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 20:17:52 +0800
Message-ID: <20260808121752.2819486-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_051804_937724_92B943DB 
X-CRM114-Status: GOOD (  11.22  )
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

g2d_probe() calls pm_runtime_use_autosuspend(), but its failure path
does not call the matching pm_runtime_dont_use_autosuspend() before
disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

The documentation for pm_runtime_use_autosuspend() also notes that it
is important to undo it with pm_runtime_dont_use_autosuspend() at
driver exit time, unless runtime PM was initially enabled with
devm_pm_runtime_enable().

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: d7f1642c90ab ("drm/exynos: add G2D driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index e92a4d872c41..98a5679258e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1523,6 +1523,7 @@ static int g2d_probe(struct platform_device *pdev)
 	return 0;
 
 err_put_clk:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 err_destroy_workqueue:
 	destroy_workqueue(g2d->g2d_workq);
-- 
2.43.0


