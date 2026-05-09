Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480D8CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 19:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=; b=0xH5Sa6a/geV1ZN+OkM+HB4zub
	Dj5hAKEybhI14S4ahUXGrDG40/NZ3UgxrNdMm7nFFFxvKy6zDRh0ZtS4GRynlvg43tDjxB/Q6jEsb
	OGtOSismlRJmQo1uqvhRde8huu2aKQ02FRaUXnIF586dnSMmGsb40ikeNVTDuBDAS8AG4+5gJxKsK
	xyvMUf0wzOBZmlLe/+qf/HoQULhyaMTzivP3lWsmxQPfb19tNw/VnZskGoO+3P4Cwz4qnAmlHinJX
	mdO3L/2DsZMeScINqc0UEGKnXwDt8/a2acp0ITrM/vfZ0rKmRDA8bfl3gLyr15IjRv0Wck42FFXpK
	3Fzhc67Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuX-00000009TCW-114E;
	Sat, 09 May 2026 19:00:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLmuU-00000009TAL-2Vyi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 19:00:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso39518515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778353220; x=1778958020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=;
        b=ex9dpIAbKn9pdGVmgzq6ZooSNUT0ALHv8bAev0+FM96jJ7edepN3X2KzEkcqf9sd2Y
         1o+LY9qlKURP68BfK8dzQ9U2siRKD47RCWBFK4MLx92h2+M9wyVSW/fDGmF02p0f88lK
         zB32v8hH2cHU7eaE4UC+yJgkoegt3h/tQtLBnZ+Fj/zo6zNn+Kld1Msi27tHYVajtEi8
         StA+wmpQzA1QrSYQGxzmn2zsd3NLk45tm2V/5aoZYE5/FGTVCwgCrup1+AZaDJgPxWPB
         LkmFmhHOecqxMEiuQiPMwJ8FYNW7PPdAuGDJy5TPvq3UPgZuB36L/rpwg0EJqD/foAW3
         BHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778353220; x=1778958020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJOgLdtwku62ymp2K2MnoFiWaCIU8dOodRBTGK0ZfaI=;
        b=cyEUoR1g00Ixa5HbJD+O/HpIV+LqPNqnYZV2Lg5AkpNuSQ4bs+ESohQ42gnGk4HqC1
         6ULHPB08Vmly3nwqu21GFIdOpUvgylpRLsH3TSo9r+DYmDXCSyFhHTHtOEkTSMdmMhcN
         TEgmE7zeqhfh3QwgkRaNDMuI7Itz+lCDXTmBJfvwN9/zvwAkIxVQ9oisI465zqnZmbMK
         n6eCzG7mp2C5ayRqywnH6ItArT6vDODHgb9d00VwPKYjCrWe7iqSZ/oqa+cvB9YNKyZN
         q24671CgOsSUPy83ANyVvi/xvXvrgABN/ww8IKFjHingsihGuR84YjMQoAmHc+FYUSMq
         7eCQ==
X-Forwarded-Encrypted: i=1; AFNElJ8w1V/wV2yTcm4jbDBGuvUeR9sXnjmhB/vjGxJepzEJWXq5O3ZtGsKrQaMq6N14B+6Zr9ydAe+b4MmNOJN3+lDs@lists.infradead.org
X-Gm-Message-State: AOJu0Yy219uHRbt0CSRVGemVWRfXA3F1axHJFMF+BmjogReB35BuM0sQ
	LVS3/X8SuaIVodRxCC9Cpzh4u3vNeq9df0/IaVQUEwGUvS60K782f7Cm
X-Gm-Gg: Acq92OGn+IuqsW9VeYbvOyP/eM6vtHqk64hbskTPvFguvSFv8ics0W3yPOaD/JPxgdl
	+aKtVIIFSxw2E4ueILGAkGDBgqCf4mRjrKsXmbBFf95+3rwJvhJm2rAu5xX9xwe9FRDYwBT+7Az
	ewchwaVVNiETcI6q/oQL9vC63aenXtcrLPcp4pD60iZ8C8q0P96OkeLvbBqPUS0VIMMlrYia+Zl
	8zMTXjP6tmNS0jGwkDAMx+Tq8PpEMbzPxTUTBvfYUuvOk6rz6iq7hHJASdC3uy+rKPj9K66XBXp
	Pd7uTnY8TdLZXBR7pf00/M5BWAeGtlC2+IFSaOmQolUDD2+6gEcq/28ThsCaWMChrPkNrW75/7H
	212xnCYQFAs66mpNBljw+9BVERpSdcIr4PqfimpluzbdHce0K9YBo7bas1PkMGm9glSZOEdH1/o
	4t9LvZgXB/moEMRBUITEM/5zK3u8jH+IFw8KQ8SPeez/goh9mMoSK7whcM+P+v4FENXhI=
X-Received: by 2002:a05:600c:3b20:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48e5dfcd4a9mr171071145e9.3.1778353220094;
        Sat, 09 May 2026 12:00:20 -0700 (PDT)
Received: from jernej-laptop (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454913049ecsm13254407f8f.19.2026.05.09.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:00:19 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
X-Google-Original-From: Jernej Skrabec <jernej.skrabec@siol.net>
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
	jernej.skrabec@gmail.com,
	Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 0/8] drm/sun4i: update DE33 support
Date: Sat,  9 May 2026 21:00:07 +0200
Message-ID: <20260509190015.79086-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_120022_654411_C8020C8E 
X-CRM114-Status: GOOD (  13.67  )
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

Link to v1: https://lore.kernel.org/linux-sunxi/20251115141347.13087-1-jernej.skrabec@gmail.com/

[1] https://lore.kernel.org/linux-sunxi/20251104180942.61538-1-jernej.skrabec@gmail.com/T/#t
[2] https://github.com/jernejsk/linux-1/commits/sun4i-drm-refactor/

Jernej Skrabec (8):
  clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
  clk: sunxi-ng: de2: Export register regmap for DE33
  drm/sun4i: Add support for DE33 CSC
  drm/sun4i: vi_layer: Limit formats for DE33
  dt-bindings: display: allwinner: Add DE33 planes
  drm/sun4i: Add planes driver
  dt-bindings: display: allwinner: Split H616 DE33 layer reg space
  drm/sun4i: switch DE33 to new bindings

 .../allwinner,sun50i-h616-de33-planes.yaml    |  46 ++++
 .../allwinner,sun8i-a83t-de2-mixer.yaml       |  16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c          |  87 +++++++-
 drivers/gpu/drm/sun4i/Makefile                |   3 +-
 drivers/gpu/drm/sun4i/sun50i_planes.c         | 201 ++++++++++++++++++
 drivers/gpu/drm/sun4i/sun50i_planes.h         |  41 ++++
 drivers/gpu/drm/sun4i/sun8i_csc.c             |  71 +++++++
 drivers/gpu/drm/sun4i/sun8i_csc.h             |   5 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c           | 131 ++++++------
 drivers/gpu/drm/sun4i/sun8i_mixer.h           |  10 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  40 +++-
 11 files changed, 567 insertions(+), 84 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/allwinner,sun50i-h616-de33-planes.yaml
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.c
 create mode 100644 drivers/gpu/drm/sun4i/sun50i_planes.h

-- 
2.54.0


