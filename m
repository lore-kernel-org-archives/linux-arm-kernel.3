Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838B1CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=; b=lZTd4OI841Vj9xgC0PfBPlg/KM
	PH82T5Jltmrmv1y/BbpuztwU7gxzqf7xjgrVm/b1g2Y6GeuZwVnEUdis4c6UtpRMIY3h0kIpxvERf
	1vUkzntHRJy0LrmIhPdoIIDOPRmjwqMYT4m7J8jzIARSRA+Vr+9MVpcb18LPibX2tpxArRyxtpk59
	hZEK9qmg3sgfI288c6scaufrTOXrt/sXbCLneuwW1aRiUnzy1ZVJqRElFo59tT3TgfSepUJiew1xp
	E9WXcHFtH4N7TldMt+vbtICAWAFHvLbcYuNLOg1DqWT7W/cPXkw6rT8ROB1B3aujYeJRoB2yTr5bs
	Czg5PybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQNe-0000000HP9Q-2sWU;
	Tue, 02 Sep 2025 12:44:58 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP2t-0000000GsyM-14Vo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:19:28 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b4d1e7d5036so2508281a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756811966; x=1757416766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
        b=EpuSnPMLev1uRAf0c9OWsqA7F0fSLtOtF9CKFQdB2WIPhDEiVZHY9sawqcds+/H/Vr
         YTPUFYtG9XIsvrpiWXuNMCFU4qyM4oOlCrJTxNhd7jkQVHv9Tv/9gVdIrUKSZwb4vyhP
         Cz4xpRGZ3AGfM+HaKtfEmqK1c4ClDK+qODTX1NBEMVO9Irl0uvF7HACNOWfhr7sY4pnt
         6+jcOTMiH7XOu3oLX0bucSxtjMdYfmxjqHhTpkObUFMspsJ417UJsZGf0peWqoEZR8pQ
         M4dlfkL1907ceGuaLIBdJbCR/MRocS/eoEvTi+KWh+I6hat7/9WTpxEGxaoux/EiiQt/
         +Pbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756811966; x=1757416766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x2rcHOEeIqXUh6SmijH737wtMIpFUvfl+GtBU3P4v8I=;
        b=N652g+kO5KIaMqPDPyvalbMZ6Rn0dSaZthIAS+sxFSUkGksiCxScid0e8cKVH2pm1F
         JpmAYKlf0082/aC9bptUT+YQYyQWsd7rZaq6inw55Wwf1ORXUYsTXzy8nU/EyksWDmND
         0MG4PXD8B9xzLkY5K514FMgfnj8yHWSLqQb9AxF7ECoLklfJc5TuWzC0tU4wqr7kjPUr
         tzI5gPGuKcZ3Kfi4E+xpWi7mtVF4Pi3EGvzudZckm6LbsltO9c5wQYlYSvaE6uAXM7p7
         Yik5HPTvmpjFX5lXkp81WPVZPQnKhRMYKWZ8yxZAXIdiDVjqRj5jMMxYsXNCsfJRMcrj
         XPmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlVZllORgoI/hfmvXzQ332LjDxjtFqya+zRZtSNk+fqrdX50PJOL3rXO85+xqfR/adyV9kMvm6dF+SVOFRueU7@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Hz0IZNcothdPJAyAT8rfufzZdMpjnfwMNrXf32Zdct8bvfMf
	zlt2fPvcUpet9yAb0QuqiptNBpRkjbuNbgyXgs4DPQohW8wCuly4CP5k
X-Gm-Gg: ASbGncsHY+odoyn210+B4jynPApyjrBPKw7xjI1qCSrTATPz0g7QlO5k2+86rfTn9sN
	1bmiYnNMkQMBAEHWfSzW0kaDQw10ZNEbh73yJ1OWu3m+IMWEO9I8ShBR+Y9U9fBcxn+vyW9yU8i
	jf1Sh+kkQIjMfS5Hs+JT2ciK8ts15vqKtEOnvseXAvpbzQ5vgDMXoJ9uJfig4lIdbbez9KHTokM
	MJM3R7Tg4A69M1Hcc8hGtc0S71Z7TDFuWpAtmNbj+MOTxEniaO8Wy/vFz8Kgq5i8MmGhp/wehYT
	0eOUcPbHVnxb5ZJFU08OGgRiBWgvFRIlyprg0VxKTJ5p3crRLLdZpJFoiyFKS5EknN4naXBNn1Q
	vXQuz7KS9ywFTLId0u+S8gdg8laWxos6MsWrYD1yHxLuwiicZIA==
X-Google-Smtp-Source: AGHT+IGxnHS6Z8WCWgDFUeDJb6KIIEv4c0pLQBKyRBYltrfE2IaLwrI592U+lXunhDHTgiqlRjBU3w==
X-Received: by 2002:a17:903:ac8:b0:248:93f4:fe14 with SMTP id d9443c01a7336-24944b1b1f2mr128729525ad.33.1756811966169;
        Tue, 02 Sep 2025 04:19:26 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903705be3sm131325835ad.18.2025.09.02.04.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:19:25 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/exynos: vidi: fix various memory corruption bugs
Date: Tue,  2 Sep 2025 20:19:16 +0900
Message-Id: <20250902111919.3524799-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_041927_294323_2F7AB878 
X-CRM114-Status: UNSURE (   8.12  )
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 2 files changed, 64 insertions(+), 11 deletions(-)

