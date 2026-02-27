Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF46FD9E37
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=; b=MpSPfE1nNg0R6W0YkzSGWF86SN
	OyKX85vkOZUy98W5RnJ6fPGEtAgzpLKqG03pJdlw5tsZob9I6uQWL9Y92BFF4i2MQloKB4a+7tOwR
	+uzTGkcflAQDaHYhr90HfzLJhKVGCyOiT1fYut6LL4/7eTeg31T1fK5L+nOBWD+wbEBUnzF7yHJSr
	L89KCJcJaRs2yPJ1wMEK2lh90nOseHdHrqS0YwMjI/s/BVi2rmizM9W8Y3fExJ506YtoPQXEpNawb
	+71gxnCXDMoqESVfgEDvjChoaRWhmKtbrrFuJTYCDIbW8fHyP5+aVe+MpyI4JLPvJWzzoFUhxmsqO
	q86PG0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxJ-00000007fsk-2HhG;
	Fri, 27 Feb 2026 05:00:01 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpxG-00000007fs7-3V2r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:00:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-8274936d2c0so1068602b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 20:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168397; x=1772773197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=;
        b=njjNyWzx9NkdZc3rZiLrigmZWRXFJINxI0Z4ewgaqR8y5CN1pqyM8ZP8EqnpUfeImK
         9TQlvaPNFu2/qjV27GX0ANKj52ndFgaxBroaO5+ujNtdzPmiygX3fK6mJGONoxx9vlYz
         +xI0sidqBG0fnlWbRPihgMSSMDhg0i2Kmo7Od/fjLM/RsAc6Qxcm9VbbrfzDwqhKSauS
         XVTU5hRZ1Cqj+3hEAIgl46oLjx+q9VnifZ9FWrg0xXho8AhjfdZPUFPGFIqmF5fvGLuC
         LsRZdS5BjUHFFmJaQkaptLgKT5ZoQQKN0qQQW/5h2lAFDEl5GQgfiX4kHZinw4XlZtr+
         JACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168397; x=1772773197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9M9yKCPLn+iVOORDFLmMfOISzVgCjsTOG3aAkzJLHbw=;
        b=ppTMQk6uzcfhBO4zAV0h+/Gd0XMuZZqJ0hCfRLzRRKPVeW5R7J5813bW/2oPEmy34k
         nJoA2jngr8N82LtGAiEwWZLY5Vka9nfumE2OTJHlzmZSklUHqqUWygklESKJtriPHhub
         DbNFAzKvM1EsDRK8JeCyCjSoE4DZwTj6wFOHzN1jGBoFPpAIsGd9+nAuNk2CJRs/SxFl
         Zbcqmf5zx83NMPsV1KNsQvWByLZSHcKgd1/Sz854aYC/z9zePHPT2B5xLdoWcoCNXxPH
         O4Mbkm0irV0ED6o1IyTrnID3o1dXfUHX3odQ7vc1DPjuqgD0x3K226giJiyeM4LUYVtL
         CDIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHjsre1p+boG8J6uksVEO4iWPcJwtpj7vB4fzjFjFeTODkeDHMJ1AJn4PKPnouWlnYiSX1OspZELbzL5hTo2rQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNQjpT1bsblWGi96LGGELDp0/fDx3wzzKbp55AoMYAAQi+V6XX
	WfR1BwbyW7z5RoAbKjSVi1ACkC1j2wYo0LjdP/WX/vwuWd25QbPRW/G07B8UEg==
X-Gm-Gg: ATEYQzzH49oXdOlsyDUKk5aKguFkPyFU0ZJSMreNaO0+UppL/RHTac/MtOtGeeVU9m5
	DLK22Qia/o1EXIPskML1qastAW/VnX5yyuDuo9sncBKYTjnNMXhE/ujbepUO2wXoLD9jFs9rIWD
	zJRDqNP/rEHe5zK6HKZqhJBOGJ0enESZDbW5aA92ULEPFcSqfZQd0liNMF1EixkndTtU91gg9pL
	QMUrcyCt0x0KDfXMrRQhThmqglr5G7FUu5yU9G4nuegCPwwspWWwINNh3cBdDJWx30e9ZJOvf5m
	pvFR3b3U1fHTokLdxkusNNmWaqSBkjvY2J4kOYFlocvBwRh5HhapUFjUD21BeCGl4hhmaZWsG1o
	bxUcYyF7oa+sgJTS5vZoJhV5+TEljLZ4xeLaSGgLGGiKPXMenB39Rb0zrFtX4mn6Vy8dny991oo
	s7klfpOnY5cvYfM+sltdX1tcPmHI4yjQzQ+F27yq2vuwdGsi2CaA==
X-Received: by 2002:a05:6a00:4390:b0:81f:4566:cce6 with SMTP id d2e1a72fcca58-8274d969893mr1442557b3a.28.1772168397546;
        Thu, 26 Feb 2026 20:59:57 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d94de6sm3966543b3a.24.2026.02.26.20.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:59:57 -0800 (PST)
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
Subject: [PATCH 6.6.y 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Fri, 27 Feb 2026 13:59:50 +0900
Message-Id: <20260227045953.165751-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_205958_913965_D40ACA1C 
X-CRM114-Status: UNSURE (   8.83  )
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

This backport patch is for 6.6.y only and fixes a bug in the
Exynos VIDI driver.

https://lore.kernel.org/all/20260119082553.195181-1-aha310510@gmail.com/

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
 2 files changed, 60 insertions(+), 13 deletions(-)

