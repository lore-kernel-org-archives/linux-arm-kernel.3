Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51962CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=; b=0GqOP8q0+20SyWtbaHpIe81HoF
	U4vb/zXoCIZ/Ix5Ed0w0WbpJ1+i8ECHAhrpKop7D5sd/1DlJSWp3MpH2Vtlv05Rluy/NQfMnSXz74
	qHwuETJsyIrY0iHXt5ahlRS6MqUcaW71tKufEUD08L/tZonvtCeqID07rAW4M7S4oZ7xeA5L/0UM5
	r+dlL0QV0q3HjaeXQNi2AeF4RwVv82QgOiEGvKU+sbmRNXeKr+3UJc541kpShpk0j4f2Zu3nT4hTo
	J6UJdl6avrOnFudaGmAVEUZOXY6mgKqFoc5+zEYHMvuMmQ/vdWS9xd0dQIQ5eT2utQ8Jk3BKnCuII
	rvMX4bTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaN-00000001YfG-1WnT;
	Mon, 19 Jan 2026 08:26:07 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaH-00000001YeO-3Hql
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:26:06 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so30195615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811160; x=1769415960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=AjC9nxYbsk4c2I7ox1fuJRZTXfX1s68D2z24HxgZs/fWNyCg1PDqrcqknV5z+czcVF
         gEmKjX4IMDqK59W/KikAJ8XcSKJKsdpogxVpFnNvXST32a8aiR754R4SEj1nhgjs7RQ5
         y9zVRwiRdTFGq+hbV5aVyFV0XV16P6ORHcHj4xcqbgeJHDG4ye3kMOJl+qGqUoABiCua
         kmYMgmEw7Wl0HoP/yt6ud0BMvWyHwOzAUsVTZ5Ok57L4ijT9zaH6kwKm5HMeIVpsWXMB
         F7dakTV6MfmTsH2d6uqUT3uUrifHTNFnrzliJC9mcTeMjOu3cEhkytzdJo87y2XQPeDp
         JPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811160; x=1769415960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=dLRy0+CTqsabdrFxQ2QOUzw7VVNWkyd62CZAof1qWc/kRtl+/eQN1eTBbK2P+FAFo1
         cwHgngAVyLI4qHrdFWwYiLx2Q0HjDRNKelJNk6Byxb31d7mY/Lv8nfbZuSSOZNekrpJX
         0gu5us/r8xd3qxxinZA0NDC0OmZy2E5tKXMl07W+kZEnJrGZXx4NjrtroU5nVKwtIYO/
         kD30+/cRAqC1eJmqbFCnQqjr6YAmJ5j11S5TrYlZpS1mNXe5vvB/sTri75rBXUZCjk4y
         5SjABf1KR4yYlWp1hPMMTw2Rkdikys6RG3qQ52Y8sydmtNt+IQjIqPAcxPLbivefuAz+
         Togw==
X-Forwarded-Encrypted: i=1; AJvYcCW/LWfCIZX3E3FfbBJ8o79LlKHE2dNdlRTvchWlhsIRg3p1Biq40CJacext3WIGpjo9JPGG3wq/EvPDjb2XhNTF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1ccZE8PRpRJm4ojn/PtBfGPd3RUy6a93PAdqWacbGPKLl1qC0
	7tKxjHWZFQpwptCTfsaOc5TIF9RCtuYDK4cLBS+ONiGPnx0NLag4+yJ4
X-Gm-Gg: AZuq6aK/bNM0Em0+msefFT7aq+L8nIZcob6QoJqfoMz75FSfhRqHAkcExi8EDvT1tfl
	dCq7Nd97ntGasZwce7P3aJ6WIGqIpv94pqxj1fcdtA817u0lWCcMsACO9SV6XbX6nqFlR6FJWVf
	C3M00Pb5CjiRuuMlNlJAIJoSZ/iyi9A+/8fKFC2hDPfDpiHtrce3kQjva/J1QmNELXA8LWvAWQM
	OtU1J+xmtVRarqSoRFzxGd2+PWU6EXWFStKBCrgCQiioSyxpJZHMx3ZCi7vEsiapnQYF7X4d7gU
	HrvV0AaTBQvtAr3X/1FRB55ZvCZSMfC4PCYGETTpTl9lB9Cvvd11yAJOXfckHlHGH4dnHTDB7CG
	QXSq9q9brdnN4gJkD3wAY2gfjWWVIhJK3y9RwIFS+Byj1iJOvPak2iaCEeLKSa7qIXnlXH8Tlb+
	QvxZXLVg8zPsvB5DDYpau6KmHE9jzn3Kkb6m+FNqIqqBg9kWRW
X-Received: by 2002:a17:903:2282:b0:2a0:de4f:cad with SMTP id d9443c01a7336-2a718954195mr91095305ad.60.1768811160125;
        Mon, 19 Jan 2026 00:26:00 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:25:59 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 0/3 RESEND] drm/exynos: vidi: fix various memory corruption bugs
Date: Mon, 19 Jan 2026 17:25:50 +0900
Message-Id: <20260119082553.195181-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_002601_823990_565F985C 
X-CRM114-Status: UNSURE (   8.14  )
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

This is a series of patches that address several memory bugs that occur
in the Exynos Virtual Display driver.

Jeongjun Park (3):
  drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
  drm/exynos: vidi: fix to avoid directly dereferencing user pointer
  drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

 drivers/gpu/drm/exynos/exynos_drm_drv.h  |  1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----------
 2 files changed, 64 insertions(+), 11 deletions(-)

