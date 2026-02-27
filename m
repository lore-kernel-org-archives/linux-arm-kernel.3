Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1548EFD9E3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=; b=082SGmSOUIpuQx65aYt68HDvU9
	ZlZv/asK/QNVJipkXDRCEMwYwJWeMY7LwjwMwU0APxpDTEM1Is4XTAqoXIfqzlEc11GaPstUnMifT
	4pHrJIjsRORmqCnzIN6Hbup400BnEDQpbNXkXaVvBcjW1XXePKgblkmghkMJH4qkUz2Brz0dsaimB
	ANf/OHNr4nyMm6oWxOGycxEauzAhKYKdKuOFphvMkrqAD0P/7ABhjQC9DHUexLpwcifcDHtWLnKDB
	o3qgc0L+/5KG5GrEGxjP9OHUJd7bPDcZNFfIFwiqVR3yf9XAuN+enZIbkCnzqF2hN4S2ZEEMJLTVC
	Uqe0YKMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTc-00000007icp-3sLh;
	Fri, 27 Feb 2026 05:33:24 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTa-00000007icX-0Lvh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:33:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso685674b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170401; x=1772775201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=;
        b=VyIsUl9GMa9pDRnI7IAMIs8MHJCGQ72TxuPFNeUyWFCxZ6g+Eqkid9WTy2Dc7/Xqvq
         uQ2pVSxXtU9OG3aXNksTHjae2hrZ7lMH51SF4qXOXelPl6xFE3L40KgDVpw8EfLoOD/a
         Dl/wji1Xov6CB9Zgi2be4pP9dt/sfCL0EgLTiJ0CiGchMRTd41ktm8aVxn05q9mPCCxl
         pP/eRzMKq/iFHhAMDvfGA4MUGP+bE8BHqPuPNpS1m/po/Romdd6c1+O9QLcSrcpZqqE5
         t4/wAxjw4BgSJEdallrs5LBRQzD5LoIGrsFDuLatTXNVCFS484Zj6CL76m/4JIvthKJO
         JySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170401; x=1772775201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWxM/NY1WZY/R2hcKtz9Vxhb3ZZqeiMM9SHyVrFFUDk=;
        b=KC8MUq3hmc7wbXlJew2VyPY4wd42T3Qx91CUZSTdVph/4G7ooT+OI7BSA2b6FcGk/1
         wuqPJOyQcXD1l1dCBkTcfvC/BGPvB3KX2dIUhRpq+vT49i6/dLSIC/LeCB5a2UL5FCxK
         tWyYWdMOciFEnwZRTdGEQejoHtJHyBjO8G/xHdc3CX5CbF/mIxWEWAUg+Chl61CFtbVf
         tSkpTz0MJ2aRfCIOXvIAgU4F+kHIou790BNmTmf9b0DVK15VvEkulfDoS1nWfmJ3998e
         KPNtHnc3cRfxnI9rkySVVL98lqbmrJMJK0G9+x4lUqb3CKHRfAb3Sgp/FEGxey5GgrVG
         0Tyw==
X-Forwarded-Encrypted: i=1; AJvYcCXYApyvNpXz7QZbgmbgyj8apNDEEikRLGP3PRrcIrcTfvu5gvmiu3xm9J/REJRl92ZzcPfAEHJYGtAx91+2LJLu@lists.infradead.org
X-Gm-Message-State: AOJu0YyXfcwZ4VHcGWN+k9CJryil7ZlMrFD3+ovtFx/vSlRRezyIuxlB
	5pABgHvtXAnQXJ20Nj+vkpQVxaNYySeExQGJt9G6cc7i5wjVEQRGm+sK
X-Gm-Gg: ATEYQzyp3q6fOJ/f1lFMwkX9KpLHLJw9c4Ybog44DORxPJzE5t7VM/FjDOYbILZ87K/
	xIkUJhW7uv29Mq2PZtiteFd52Tr1uEIzhXb41rgfUk942lOBz6VkNMG2Vv39xxMytYvxHWBvUyA
	QtOqRXeq2XN4PGcRD6f9CT6D1rUfJ/jnT26ULHr5mjdSSzF4kDcnB99/2c/ZcyXmpPZNLd90mGk
	pldQsU2CVCq+VXEIo3oN7gzfUw1McTvi1g87dZcNyOmRTGyODVUP4AhzIE3egQ5UqPUspSsLs9b
	Um2efanHshNtxbLkQbEnuOsBBN+9xKbKjQS99/MeuIcM/L3gErUuTRPvlGhhdu8qJZQ4lOKgfNP
	RRFwPp1b+H/wWMdkkOShs+3KbdJDmC5DOgdrrugM5vkrciDqPQK7imCRRtdInAN0D/kfU3weJCP
	XCeEflXKIz0N1Eu50kXXXkJTDR4aCnIagXEXcBQ1xilsegpIVuLw==
X-Received: by 2002:a05:6a00:4143:b0:81c:c98c:aeb7 with SMTP id d2e1a72fcca58-8274d972743mr1365727b3a.7.1772170401133;
        Thu, 26 Feb 2026 21:33:21 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:20 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 14:33:14 +0900
Message-Id: <20260227053317.426000-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213322_122231_37FCF9D6 
X-CRM114-Status: UNSURE (   8.76  )
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

This backport patch applies to the rest of the longterm kernel and fixes
a bug in the Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 60 insertions(+), 13 deletions(-)

