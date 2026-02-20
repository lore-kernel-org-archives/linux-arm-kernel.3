Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DF6C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 03:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=; b=Tj2id4eS6dm9H+EO1O/ZiMpWy8
	fRBhOfvVzjeCCbXDRtzII1A0ewQrqyy7otYbELShfVgZDsa+cF9NNtLyRh+/zSZXidi/ZThOJewCd
	31814qOngPxwNCuvpw4Wi2dQhbhFE0CY888trcUlciJms8j3Jgj+ZO1Z+m1l8DTFAFe88PqI1P/gV
	gpEodFc4ezhrj8ast//6BKXXNDqP/f0miSTtJ5VVqxNXPG2233bwbQiC8KftiCog/PxgzybYz8PkO
	zW3yNQR9g+PfouJSFN9Ru4WZjnmzwrEaEfaN80UQ8AForK7NoX1tKIw4trWLtPN+RaJdx1fU35F2q
	PAjtmgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHJ8-0000000DBFH-1WAL;
	Fri, 20 Feb 2026 03:35:58 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHJ6-0000000DBEQ-0HYH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 03:35:57 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aaf9191da3so10144075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558555; x=1772163355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=;
        b=ZGg6ux/DJ+H7vUjuGc+7MrgXX9MsCF2rfPAlS+pgn8U0hHdfvIA7SssBvXSHE02H8H
         GyliiHnLc3lTem4CQKbulc55Ea8fnTXke/19d68PS5KKJ1BTDcPT4amTbDr2nYaU/MYs
         241CWzVzF21OSW5yc7wr6NqFb3iCcQep3BYJ8lEEimEOjVbwVjeERZUSqlpzo2v+VsKy
         jELpHb/rStfiY+PuKQqGz6dlnD2iHa8UFXfYaY3vVR13/0HygXWW7SKOjZ2S/l8Yb3FA
         PLmpEAkD1+MlCyoTvppAxDA7S1eoWxA29helJmoKU+IsvbEOu17vBvYhncH6bGMDEXcV
         9BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558555; x=1772163355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9RtH3VDdHvCGowWw21cotg2dMzVihzJvU6s07yH8n4=;
        b=i1faB8Xz3boMLeIN4xdYSXEoDgGn51sJozC4n78C9ICDR9jO0u5QsgTMxHoPCz2P7p
         ByL7SarPbHDhI9IlzBPwZcQ8sjQfF0wYaZ8wGXTgCcXvdcKMLK7eg4lfgNt+mLapr9TZ
         9U2unLVA46nUMBzdChGZoilslFujDEqoV8v/MXhkM3WDVIZ+HQ6NNUQTaEm4hKBRWlwI
         SXvxcckEhIlRHZrLr0Iv6dacOCbr5VtFGGvzfoC1JaqxzDivkGkfG8x+ES/4AlCYx2bR
         RaJG0VLzEhABHgLp/W3ujxOFSxIitpGbJEfaRodCk+HRJNJiwmQ4CBM9I5V+bDB/2pCr
         WepQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1PbM6a3ai5eEOZZP1HfNpL0Y03r7eCahnery4EnrTJrmr3wp6BkP8HXg8hDgZyiQz+uEHazu1HPDeKH2t5lNq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9sZlyqrg8F5QL+Kh3QkWfoDmQFNQag8ZOjCc3wqTWElJM2EIB
	ls2T1KuuMVLGRZ/xpNAoaL+ezl6ytpOmavUF4YQZUfMw6VaiXsxI6coq
X-Gm-Gg: AZuq6aKf0ty78N3jIyCIpwiW34HEdmOVkDEejCLSrbATpCxwA5m0MCtI2gm0RxBqNmr
	OvGWRcGd7pFcE1S/nI7MOUly1ugjpWPhFZy+D2oy/ULRkuiaBVLvC1mVX92Mks2S8g2lN0w6MQy
	0sBGOQ0bxxmvcMX8nYu/ufzx2M+u2xx1TP97e9tTNgqhAfj50W06rsoGpanp/6Vqh8QmrpskU3u
	+DLw+jhwUxGd5CCBckI/pQjcPSfEUQ6KaxFiSxtmaMYreMfwIB22oqwn6F1WSJBfAxFj383cyWO
	hbdtAPSb4Ts4IxjYTwqE8jh7hJjxLtsGUXU9A5wp9NjrS1rawcDbLBGhiWTgQZhQsStUHTn+pfv
	xZAvs2d3Iczux0lcPyWnMkkDRy1/HgvgmwYWUNee5kG8UD1uNYYrkRgJo0kUKW+H5xetOO5/aF9
	QFKQmiSOTwhYSRRV6118Mnt80acQHDGviu771KRnIRh7PAY7SxuhXNHzwEDd41
X-Received: by 2002:a17:903:2a8f:b0:2aa:e285:f249 with SMTP id d9443c01a7336-2ad50e757a5mr67786975ad.1.1771558554897;
        Thu, 19 Feb 2026 19:35:54 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 19:35:54 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.19.y 6.18.y 0/2] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 20 Feb 2026 12:35:48 +0900
Message-Id: <20260220033550.124346-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_193556_155014_A2A933CA 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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

This backport patch should have been backported along with commit 52b330799e2d
("drm/exynos: vidi: use ctx->lock to protect struct vidi_context member
variables related to memory alloc/free"), but was written separately because
some commits were missing.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

After this patch is backported, we plan to write additional patches to
backport to the remaining longterm kernels.

Jeongjun Park (2):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 36 +++++++++++++++++++++++++++++++-----
 2 files changed, 32 insertions(+), 5 deletions(-)

