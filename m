Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF68CEB2C6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 14:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=; b=csrb7w66GwJoEmSGnr8TY9b+kl
	wyFkzgyn7qAuNSocKcOq4CB+2DlDia2dh5Mgn/bp4fKbHsjrH/+qcvaI+z/DT9S3/HqcVuKmQDNZL
	ctHoMTy1sGm25JTfp1RRz+FmwqEDHUvr96PjkvBaNsZJPV1Bln8qY11czTRplfvfhbKx5ppThKOXv
	vx3w0lvt4Y8AYEAB5wlTywpyNnxH5mqpYcAq9iaJVevAUseJK4qtP3IKp0wHQPLIFov1JABK0Vhgy
	fJzvA/w6pM1UYMW7TH4GyZuCq371zRTORdzqO8uwx7ewaRn4YcnT8PZN+R82IboRRqQiTDAmMK4KK
	IcFXUPJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2g-0000000DphV-1vnW;
	Sat, 15 Nov 2025 14:14:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKH2d-0000000DpgL-0FBt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 14:14:17 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so4934124a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 06:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763216053; x=1763820853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
        b=evpRLuOhxHB11f4FQm39sGS3iUHWntCYsM7HSpS/BZ8IzvjNEyQB/4KIJYfYwS62Ep
         GCspyGoNj0LxzTyWTjFKmX0pf+N9rbjREEuwAd5TinES9U4M71dTaB6G3OwfY0doYhLr
         e8GNmN9PdoRA3GGAqMjwjhWfLzvTa08J8ErS1QPBAV7A9F+pnX0HsMqsqIwSiaeOH2Ir
         5a9Bg5aW65uAwVYvWrERoqPbqr8PGC0qR58nwjs51b8xI5aSJ/tNMwFzDh25UFOz7EVm
         vIQJp5eA9xKqnIJrlz+r07QDLBd5r9MllZcPMbbv2ZarZuwKCaiTFRbemfEzbBKWGTex
         WWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763216053; x=1763820853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tO9M0rK2lTwB71cTYp3Jpf3ChX0WRs4mW1Amu6CT/w0=;
        b=lyjd/ZDEzPSdDA8ucrFC901i0iKiYMUAbrAW1/7XP5OFXORpS6y07/JPUXMGTfqhNV
         FVx59V3VtH1KLJFhQ4rJ4gPe1DqoOIoNMKdd4eCn1bLFCIwVLfxd9JuyyiHQv1Ue3ngQ
         POehsfuXnp9y/ytiFDWHYZOxH/pujsvUXpGSgU0VnLI3E2SRxMnoVP9kQNcaIA9bto0n
         jNsexq2uQZ5YWHdmUU72YpW4nCVxJbEdAiDXv+AQVONwU1YmScyzdQplTdPzE314QKQp
         YqgpNpQenzrut7DdEi+5CLWc5uSnPqv6bHavBpqGsPUeiInCgNUeoVKY3SXzi4Kojw+D
         uPQw==
X-Forwarded-Encrypted: i=1; AJvYcCWixoKuz6fO78BzaUyEfAA+rQ0AaiLQ6WrJaEFsu2K1FoaGUbOU+DaKs1OcDdAr2jEYUxt9m7E0NyyBPkZlqTHB@lists.infradead.org
X-Gm-Message-State: AOJu0YzHLz+E3EAxLS78D/s+wRT3TJ3+gt4nWDS0Sy288tMVN2Ol9OvZ
	WM7MlqUNJjco6hvs/M5BGwnidNKdwvkp79tCqv9zoFRq/IneVO1EigoR
X-Gm-Gg: ASbGncsD/Sq3uOUgoJfUxrsk2fLbuh4sXpQORAEUsAxcmA4xpO6ZVEEaQg4TL1FaznY
	dc7kDSXx4ZH19ZiX2O341MB40yb5Zrfla0mv7sYaDrvsqvoirTobXCLwMOtfr2nIViSpi/4l0tm
	5ATIbUE0vtyyWBuEySHDOJR+nwF+l991MGozKlmUHq+z2wES4YIaGh6RdVorqMh/z1Spgk+eHSD
	qsJ66g+YIxqzh2VxGtDHrZKrpoPg56iH2bBFm4+Sxwvve0DNY3g2ctCpKmHACfwjqh42fWj18bC
	ONPUU2KF3TQmnt8blua1kpz1mNGDhJH2xzxDfx7ng+UTPf3XYyAVWHLeGny+N+QkpiQiEmbtv38
	9R5LxXaT+rg+yPL0qMyWqVsou6U3mfCu5ONyBJUJodfx8TZUrnpWSb1D5rUJ41AoPDqvOWInvqw
	nABtRdWxMySthGCBMViEIwj5RpKmpqsKmy0vAud19hBzV33CebA2Jws1Lp
X-Google-Smtp-Source: AGHT+IFp+Taw68EnwDXLkJFHgktvsI4Q2Kx6E5s2D/JuSsEx96b8Hqrxaybkmry8X04xeOfOSy8LRw==
X-Received: by 2002:a17:907:25cd:b0:b72:6383:4c57 with SMTP id a640c23a62f3a-b7367b79f4fmr713777466b.55.1763216052568;
        Sat, 15 Nov 2025 06:14:12 -0800 (PST)
Received: from jernej-laptop (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fda933fsm606189866b.56.2025.11.15.06.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 06:14:12 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org,
	samuel@sholland.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/7] drm/sun4i: update DE33 support
Date: Sat, 15 Nov 2025 15:13:40 +0100
Message-ID: <20251115141347.13087-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_061415_116142_CAA50A3E 
X-CRM114-Status: GOOD (  13.48  )
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

This is second series out of tree which aims at properly introducing
support for H616 Display Engine 3.3. Previous series [1] reorganized
driver so proper DE33 support can be easily implemented.

H616 DE33 support was actually introduced a while back, but it was done
without fully understanding hardware design. Fortunately, no user of
H616 DE33 binding was introduced, so we have a chance to update bindings
and introduce proper DE33 support. Issue with existing binding is that it
considers planes as resource which is hardwired to each mixer as it was
done on older Display Engine generations (DE3 and lower). That is not the
case anymore. This series introduces new driver for planes management,
which allows doing proper plane assignments.

Remaining patches, which introduce all the missing bits to fully support
display pipeline on H616 SoC, will be sent once this series is merged.
WIP patches, which can be used for testing purposes, can be found at [2].

Please take a look.

Best regards,
Jernej

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (7):
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  clk: sunxi-ng: de2: Export register regmap for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Update H616 DE33 binding
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  44 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  53 ++++-
 drivers/gpu/drm/sun4i/Kconfig                 |   8 +
 drivers/gpu/drm/sun4i/Makefile                |   1 +
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 205 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  43 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 ++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 130 ++++++-----
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  36 ++-
 12 files changed, 543 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.51.2


