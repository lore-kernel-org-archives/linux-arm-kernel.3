Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565B0F43699
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 12:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=; b=p+bqTglwAaGYHXJgUT7mDGLiE7
	yXfGMr4dmesPOZmvx51rHhZxcJjhY1kGptJIxnGBBzxbS1H1YjdqOdgkU/+O9FfpcqQtUDDAq6R/R
	OnAQZn5fyTz0mdS4+C7L4iX4EGcZvIr2+OSX/dZVeswpLmTkew14iW0mrvtYvZx+ezilWxcGzDoUV
	yKt9RnPcFUIJlBV7D/3IUL2QFLP4Qz2CN3VtlClK5oJw2Pm20bNBPZZ/aTAFkGqddF3onXbaREkoA
	5VCeCWUK9FUcTxh793EXnrgdZSqAiGqbK6411MfLFT2t4Mpw3KQZui5pZlh6pHpUCRE4xdLejbJ+e
	WlVFhxvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiIP-000000042Ng-0dlJ;
	Fri, 17 Apr 2026 12:27:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiIN-000000042N3-25YE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 12:27:40 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35fb7c1a455so277178a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428858; x=1777033658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=TQyBmzyLdtQxefCrD1tM5MaILqwaLbbdsitLG9nTf9s+q2bYSq2MCx/eDNxAZBUhRw
         qAqS16SKDQWQ4dAJps3K6RC32JxzDKMMYuimqk6NqDWrSkbh9wzLMeXsRgyzwEwW33Iz
         ngOWbN48tWpHNEJalHTCevUU1q94NIyfKtD/WXceIHqJgRH0kj+ezh2Le+0a6HfHp20z
         715HxXPRh8eZHv/6fk+2MHCWMdZ0daJoB2U27kgRrzCmrtlxzK9NO50zU1Wknsn3rY9+
         xlO4xJSGfhNLpwyzSxZ9otBYxPNNGiqyxt42Z7ny1zMvcBMKppE+waNcAvfoRtHOyI3f
         Da7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428858; x=1777033658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=WECBoQmjV1p4hNuOt17aQDut5gewfK9AGBSAEqbuB5SsLCjK2v3w+ino4QzMTMlfSE
         kd6E1WQZH7OshgFOLD3tcZNNHNR9HW9CI5GwlTB5LJjZsNE+poD7maXC36Cyc3SiRwyT
         idnH4ro2GoMS73WbJwWxOkCzHjJAgR3pXWD8KHJBr+g9+FYRXpZhcVbdsnGStyXL8cKf
         ykWsWOFGyzDqg8Cywf/fBPfLdYYpOuP9I/k0kkSy44N2fB5n5QaIUjGtS1BIhvjS4JX1
         ZiAP4YA1Xrw+Liads9iESaBVxMi2xmMTlByK7xP8pt60IL5yqaKQJdybsUXiPMMBys7A
         WTkg==
X-Forwarded-Encrypted: i=1; AFNElJ9LDRn95rgUOQmSvoEALY+eXheMRgsBpUdNUEOFcfgph36/VLaIgfQV/333fj9453vA0CMaSftr1toyXEkRkgG8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb/qciGXqOCTTtvhFjxv9FW1Zg9qARg+fpvpdsIExl7lD5TQOw
	3oyrSHhcM1Oa/J6z/RZbKih1KqYFwr8pPbBOeQ9stsAHux7Q7Cjts3n0
X-Gm-Gg: AeBDiethdYllfBHqMkMo2xsN8FiPhFKXkbT64GzddFKIwv/V4+jLebZsDnOParEmGsx
	6sMqxh1aVo3qRtmpXExn4jZcpPhtc8XoGMamjnSOdhPpczvT61vMbGR0DURvEs0UgiWA94uix4U
	8QaYbsnzIjbI/1zqJzDTPXdyQ+/DPbyLhIpjG0C/LB4kIt7isThpNwuO92nsQnnyKTret8l3oLx
	Z5FU5ZlIyWtoU1HVWxYlSdTbLjvgxSaTVHypFLyIrHvYIDNiaSfVpQpnwKdNqz0Gq0dMPFAyyzl
	XAbZtfAFaWwwiGd/+SyUGfbajpuPxzdPszDtG5lW4XBJlz4YLI/0etE6gcFsJkuYR4JUE0/qZVP
	flh11Yb94QDbII2xOgRf0qTQaCXW3qKz7pyYShhxgbfeqfAJoeYN38RMlXhNScsNwRVvwSL41WJ
	wvXcxdoHq7CxfvltfIZnTjF9ImLHBBWS+sWRWMN2BsPQDMAaO+qE9/MQ==
X-Received: by 2002:a17:90b:1e0b:b0:35d:a542:2dcb with SMTP id 98e67ed59e1d1-3614048a731mr2630632a91.16.1776428858176;
        Fri, 17 Apr 2026 05:27:38 -0700 (PDT)
Received: from dbc5pt3-os.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410cc196sm2074491a91.17.2026.04.17.05.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 05:27:37 -0700 (PDT)
From: sai madhu <suryasaimadhu369@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>
Subject: [PATCH v2] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
Date: Fri, 17 Apr 2026 12:27:26 +0000
Message-Id: <20260417122726.2948518-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_052739_543106_29BF6282 
X-CRM114-Status: GOOD (  10.42  )
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

The DRM_ERROR() macro is deprecated in favor of drm_err() which
provides device-specific logging.

Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
driver and pass the drm_device pointer via bridge->dev.

No functional change intended.

Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1ea259854780..4ddcdbf7bc8c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -981,8 +981,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
-			  __func__);
+		drm_err(bridge->dev,
+			"DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
 		return -EINVAL;
 	}
 
-- 
2.34.1


