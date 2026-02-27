Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0F7FD9E37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=; b=ZRsN/DKtZzKhLGMf+n20bm2bbr
	TcaNcG2SW4EC4mh3VGTLh6o1+BLWbIJAj/NRezBLSgjchPgzYA6EDIh1O8OhvDxKGaKJAfhq2Qg2O
	GjktwdhIuHBegp+2478pnHZ8wJ5GyBEMqvSs6oA1pWUL/gvOhXT1EvYV2zikyRAHgSycONFmFxBIY
	DTIDF6WVdoc7xUCy46PAetZ47zm609fM0NB1KxuV024DWH2BNLOdbl2l0kDRSpW1fvHncbH28CxyR
	GIp606VbKhjo4y0lRObTMkxrypUB8orvVL/0cuHOZsgC2V3d7eUZFB9yB5yDEUBD3A0arlQMv127e
	qcYcCk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxT-00000007fwM-2f0a;
	Fri, 27 Feb 2026 05:00:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxM-00000007ftf-2PBY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:00:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-824af5e5c81so1819305b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168404; x=1772773204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=BiE0PQtY66qyRLxA3zh7HvvAWtHeCES8Y/OetPKoqdq2eQEOqWbmzs8diMyjfmZWeB
         pfK0llhOQj0DFRSJGvDKEJxOO57ngwHO4DjWrbP1BoXf4JvoVciYE3RgDCbLNyOzLSp7
         36fHtB2ViMtGo+eoumvgBOv6HOyasf+UFB3HY/2phlPp2KRa9blJd8fnrbFfmZcXAJVk
         73vP5Ernq9WybOf13IlnIBms12eQey/OzA7MspTFN9YHjpYpgnv/zWObiwNzSiUJHp+y
         p2sz0H1VbNESlMcjLbbUzvToPB/z5Db40t52SqYduEbes2jWeiXmESCUxn8KXaGUN2Kd
         zrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168404; x=1772773204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=XsmBvsxtfDBI1kM4RTmpMiaDbFrxTl2qvPFAtAenrgJbqs47SXrFpdWajRkliSeldc
         hdldO3vEkGAT6D3D+mqSmOaFfCw0F/16TdnJzdLeArZo8LEWdW4eug3VujkNPXUreWo9
         Lnyxd+G1NF2oSf6JDsdeq5iuBJ1XiXvgAD5Lnz8V3wTlQ7XJ4NGwswdU0qTSopPAOLOS
         rLcDjgMxCxOImqOq2VzniBrUVMWifuh8Bn13imzEj1SFgyvqCg1TSg2WxjAzwVGlKLim
         3CiLtSfS+V547trPgXJDoH/E7Peq+1rjxWFDx7mJHh1TblImJv6RhzGqNh4kQC67wd5+
         qbjg==
X-Forwarded-Encrypted: i=1; AJvYcCWGqC0eA31YUutMfcFjjWeMGKuynTdGNtBJR3wdVa3uhsRBpmiUyznCxct/blXqCqUf/rxh2YMJBDU/yZ+vKJR7@lists.infradead.org
X-Gm-Message-State: AOJu0YwxXzRBVGQD238nXvFsvFAagccowNii3bCLQNSQ11ilaz5gugFh
	RYjaps0/jDVmZwkJUtPXem1QRVjoKDGiQtN7opZ2+bHLVMbnMH2UuIBh2oJFUg==
X-Gm-Gg: ATEYQzxXbqZNb3Rm85TNAhXdqUkEP0whd5RQ+5CiEUAdP1HX8647n+pIIkFCQrOxkrH
	GE1ijOlU8meuSN9pBl8JdEsZB39KoWZaa4a23O3hkcJdJBa/RDaqnE3uvO2dCTFlDm4bzgGA75d
	O/tLyWZE0zxsG4agJdboJg+1XzvKZhnIzr9pTYMj0r/Sl5RdsUeh4C/2S8zO2O1qEALrOHjZsrk
	1pFxoSbShmXIr2B0UuMEQ6nczOe7j3uZV/iPwaz2UGv6KHklP5/KQ486MsVXpTMZjmGZTYVRYf1
	NIFLphaBQFBNRfBdqvlOsDPg12CuEV7gaH/e7B9qOb4fOljPdgSm6BePX45V8vR5JcSUXO46NcY
	sRS1yTFlh8j91u4z1CKrtzujx/xguyG1rl41RcBfVJoudWHgLoFpbVYBWEf40PZ2rAcHHly66lC
	F5Bg0TlEacceeMeDOnBBSbk7bYhzMAun2letql7SbQtqu2KnN5rw==
X-Received: by 2002:a05:6a00:1a0b:b0:827:2c11:f137 with SMTP id d2e1a72fcca58-8274da7a4f0mr1480551b3a.62.1772168403587;
        Thu, 26 Feb 2026 21:00:03 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.21.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:00:03 -0800 (PST)
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
Subject: [PATCH 6.6.y 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 27 Feb 2026 13:59:52 +0900
Message-Id: <20260227045953.165751-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227045953.165751-1-aha310510@gmail.com>
References: <20260227045953.165751-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_210004_614863_4B55E146 
X-CRM114-Status: GOOD (  14.98  )
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

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d0e394397eca..576d79ebe9a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,19 +252,26 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
+		struct edid edid_buf;
+		void *edid_userptr = u64_to_user_ptr(vidi->edid);
 
-		raw_edid = (struct edid *)(unsigned long)vidi->edid;
-		if (!drm_edid_is_valid(raw_edid)) {
+		if (copy_from_user(&edid_buf, edid_userptr, sizeof(struct edid)))
+			return -EFAULT;
+
+		if (!drm_edid_is_valid(&edid_buf)) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
-		ctx->raw_edid = drm_edid_duplicate(raw_edid);
-		if (!ctx->raw_edid) {
+
+		raw_edid = drm_edid_duplicate(&edid_buf);
+
+		if (!raw_edid) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		ctx->raw_edid = raw_edid;
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
--

