Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361CDE7315B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=; b=CHEClsrOvitXyhBhSe++erNEht
	Kt8vhKP25AyPfSsNVkWlVownUH+vne3d9uu2Q+XN1AkQ03q9qL48xNPs2WeAQF2MDm2KXpTUtYHM1
	hc0dmbvvvCdwEObOrynMu4jSH4PFhNj1Oy4bxFbFyWzF+J+38buuYxx7YAfiGHPG/xdRh3RzzWQMo
	wGndtxMiMmRHjl02RHcQRheGDehwFdrrAf5ukic7/WCHb/IHFVvC0/0DDMPrLgEBPuLd1ShS51v9J
	BU+U6Vsjg8YcS/GTqqZVmsY6lETB7LmGVgBi7DVVbZxPD5oJlGZg7fy1UOVAGGGQl8QQ0+wlzYM1k
	FiA3DxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAd-00000004u6C-2Der;
	Mon, 02 Feb 2026 11:32:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAa-00000004u5i-2m3N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:32:42 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-81f47610542so2362974b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031960; x=1770636760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=JM74G5+VskX7B3qxBuBMtmRn1qsaQi+Bf6iEhxuy7pS/CgL+b33ZUOv6o/4QdEgF/a
         /J5HphYYSnFFQf8F8SRwTeD2ddivsIPqdStjSuX4yKUsMlsy50inqHNL9+ygOMcExn+O
         yoAXwSKpNJk7aoXD1GxjV7zLrr1YQvq9ywxWM95xmkmcZam4HkVIXPRN43cOie+y7n7Z
         6Ao33cqfJTBKSjGuBrMynCUEOPdMg6ytSdAq/BXveoMrh9fc4lakXPo/KEzQ1dcoSTYT
         G5aWLcSi/WqjZDowJg7qXQ8H5rWMw9PEgD6ei7dsYBgf4UolXWLMoJ4NHaZga64i3lzu
         6r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031960; x=1770636760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGF3kXNpuFGfHRZ/a4i+Y3oSMznaAZtKKSwOANieht4=;
        b=M4qdayVUiNfmDP8CEIA6msDrTuXa5nyo2kw8c3eCaxajZE55lLFC24nnsm5g9dAob1
         Gu70rk8kOrnPMmX2zhvbL2e2H8a7IFrUgyx0SsNlFlpy5XbXfgsez3BwWsV2PwUnRMvr
         e3a5LUvHjNDMDySgu2F2gZGWZT+7o+VsHCobxv49oS5yAkKVRw6ha2YV7nGnGW/qIYpg
         8IlBoUajtnwnHP9/Q1AgAAY6mlqovquHbsHH91u45W6bPRAlSHRwJEt8zj4RSTQ432qy
         np2sXxOO8xf4zNwGr20Yzbkaw/dBIqdH2R15UMQVwESNHOKgMa7nL26pFqs6ZySjoV3U
         WlOg==
X-Forwarded-Encrypted: i=1; AJvYcCX6XejZs6o2KFhwNauefUPYrEPB4fCM9b6gQO3+Dp+mr96z2w6goOL9O5rc8/Qyn+RX2oRxwWWqeVLhqX/7HmMU@lists.infradead.org
X-Gm-Message-State: AOJu0YzB1SKudbiKLuX0ivmKFmy2HmYSiKq7AU3ki3V0fuW9Yu9nTgXa
	VNUh0PTY9WqpKKV53PFEKOMy71xsqPet3ScjR8fhOA6s+iv9WUqulGm3
X-Gm-Gg: AZuq6aJFtEBuLSPGO+8t38i3Xy8z8Ee2I55zlCVsTsDRYSASUqsnHge/LnLaUo2mCAL
	tWTeOksL6Z2pjLkAmal2HIp3+YTsgnTCT5G9qzD7Dd8ScmU27wbHujWAIJyKc9OQWkjEAqajPc9
	54KaF0NzpPahbxnbb7iZMCON28oW+CcBpjXP7DUIV5g7hnRZy6vSM5HRUTvmWisFbUm8L7/EewE
	8UJOqgZKbWLNxRdSKbs6MxnAAi9oQnLtS7P5QreS+mbi+UR8t7v7rolRZ/hyuFA1Cj9/IooUs6I
	J1TJNjPqbMC4aHuhnoPT903t7EDM94xEuyLtzXuqt/9p5a09pb08HxCZsaU28+Mj4ZFJUxHWOQw
	vh+UPM7jvhjOQvrMdp2iuJz+aa7rzrw6SARhTJ6urTxNHzvXlAud1R0EvM2BwlZIwCKEPgPmgSE
	gRXQB+KN0XHwW6cn5YvXThgotKXPnM07oKGbzTBg==
X-Received: by 2002:a05:6a20:6a11:b0:38d:f405:709e with SMTP id adf61e73a8af0-392e01097aamr11107034637.48.1770031959822;
        Mon, 02 Feb 2026 03:32:39 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:39 -0800 (PST)
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
Subject: [PATCH 0/3 v2] drm/exynos: vidi: fix various memory corruption bugs
Date: Mon,  2 Feb 2026 20:32:31 +0900
Message-Id: <20260202113234.183393-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033240_695518_8EF0111F 
X-CRM114-Status: UNSURE (   8.38  )
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

