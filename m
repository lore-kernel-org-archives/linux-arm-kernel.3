Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58124C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TkgRTuLVuCLYpIvdltmqBCjRKT4GYVnjKziTrqAUoEE=; b=ly8C9iSqVxtCBRcdTodQWCkjtn
	K0OTrO/Pas8N3uROJolfffNwWuAb3qSWTBUwMmr9UQwctQtIcjuhGN5+6dx2X/KSJtEfNFu8Mfi9B
	t3+7+lu9srm1Gsx96i85J+Tz6SaRQZ3japXFFm158Bjly2vtbuLDveQrkyKRrF1+T9bhWXqDafvp3
	d+DzIG1G77T52Q3t/UPMtxzUbp03GyiG/2dt0I35v1om3JLibgTrNt8O9ZC9XLgW2zL9ftXvF62nq
	ucelgKwICIDsx3yzLVv+LDykaiHHKDUvYO8qRQOglQsBMg/uWSXvHrTUwNLlePz/+5joawGKh6Asl
	MVH7xHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvFy-000000001cx-3ROK;
	Mon, 03 Aug 2026 16:11:14 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvFw-000000001c2-1Uxk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:13 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2572849f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773470; x=1786378270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkgRTuLVuCLYpIvdltmqBCjRKT4GYVnjKziTrqAUoEE=;
        b=AnN9RqhCQ7U51BcwWA4YT4fBjG6BrBsrwpHjY9MGtUNxKNtuSC0taRwHsd5KA70L+3
         HMsJK6LzK1E6Rkl+FyK/QiR02RLs1XucM+tzndj4DJoA2AcpAe0zdVrCkxSBgpvxOKsX
         ALD20jIAvYOAe7hKkwYsf9MMubiewuFY3wpj/7kffw+rV+6tm3FPVSh5jMozvZBw0onl
         KeHBB09KZxPEWe/oiBMCLqmNT+efdPwnPWCsNPyeuWPUhkkLPuTlcdzYY/to1Lgs9ZCR
         iTE8+MGSa6N/cBjv8DcgU9W5sIdbeNU+Mq356z1kWMktuwfw+ff8YnB9XeRfd2hv94QX
         SKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773470; x=1786378270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkgRTuLVuCLYpIvdltmqBCjRKT4GYVnjKziTrqAUoEE=;
        b=TPArRKi4in62NCJ106du6PDxYvCIJj1FKYazHQ1fA5e7+xaWR4wfBm6RpWgWUUtcjI
         4ZnfN11leBLbAPM1QQ8CKGW1ARPQAW2Zlif3QIlADe0W3RT7K/fCOGaTOjKkxuWaba2W
         DEYadbwMfAEvUE/pX8t1gY/aYJegSc/jJgORi6h9VulM65R/TdV85Y5Mk+CJTOFFGoDR
         KDT0H5iLuBiqQYD9E9dN9UrlaUdD1yzDaudLJDR0iI5VevBgrrpEh0UD0qx2n1tvGOWn
         WK+DgMx9Ju1CQKrY3ONpE4yxMNOds0ddqLH8ADbnESVzpCfyUXkJ9Jz9Wv986pWUdL3F
         802g==
X-Forwarded-Encrypted: i=1; AHgh+RrcUZT8t88MIhu/puVjKTJoXsZ663EVT6F/MpjBDLIeOL51uxhzilC+dich6yf/WSKTfHDZ3Z/qpd4CJVh5cWLu@lists.infradead.org
X-Gm-Message-State: AOJu0YxLxh1ECpLqFYCZQkNOmj4YRPk/bohDTNUdA1jFJiZTIY0mBX+G
	tagvO6ZdlKwfmN+657OopniYYw/bMQkQUDq6VYtqkdxOp6Uj04Jw6vUU
X-Gm-Gg: AR+sD11w8PfSR2Fwg9btQ2YLAS3ghyptYV4tL781Qj1NlcbFTVaB3GonxOosLUcCWBW
	ASsAm2eRj/D74LUqS1QFg2T2O7qEEJN9nW+XTkSTdcS0bFHahGaRgcU6+XHgmF7Vdg9hC/pRiC0
	VQOx0Q+kdRCmGwQRQiOlE9QZJzEz8hjoT8MEVuTEMOeZNEInFdCLQZE+XGb31lREDLYasHZwDgs
	vEHke4ikUiaL/mBeM1l+uBtmFzkIi7+uUzoXCEx9SKEvmH92PXy0ciLMGy4yyrvKunM6LjiFeie
	o8mgzEYlVldyPVx7Frbx+hewM4gdskq8wSocMlDExdQ42+TqVTJ6i5L7mrbiBbYPEBlcUXJ6Dp0
	PqRhzy+t5UMjYvSYjaUtAjUNRConqHBJ+sKO0PhyGIIk/3pwaJRoZgmypUCltXtC8lpLDzElq85
	Pi+sTy0e8Yc9tWf4vOxQF39UTn2YbuIvWtOJ24ridKZmSxX9eFmh8EQN+dId6pCyt1+xWUs1h2s
	GINAAjbbyHsqLouFTUkPGI5fSt95Z/MR5bSdbfiRFDXOOrAlZ0XvohPscgvZoSxmcE9VGJRWYGK
	FUZybLMa64JO2vKcUwDzCaTrhfPcXBGqDSYV1SPx4L6qS1EebLTVZjVkWkLhOW+gmfiyD4IxtLy
	W22zCgaVeo41n/FBxrUv9Si+03ENeutl7LUVG3LOGxjX01YrF0XNlOAENJ00ylZIjiyimlquodF
	sLkw==
X-Received: by 2002:a05:600c:468e:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4980c6a2268mr222728085e9.18.1785773469919;
        Mon, 03 Aug 2026 09:11:09 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:08 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 00/13] drm/sun4i: Assorted display fixes
Date: Mon,  3 Aug 2026 18:10:38 +0200
Message-ID: <cover.1785770165.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091112_407853_1B5CA496 
X-CRM114-Status: GOOD (  15.40  )
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

This series contains fixes for issues found while working on the DE3
and DE33 functionalities, used on H6 and H616 SoCs.

VI scaler and VI layer:

- V3s advertises a 2048 pixel YUV line buffer, while it only has half
  of that, so wide YUV layers end up corrupted.
- Vertical scaler coefficients were picked based on the horizontal
  scaling factor and chroma coefficients ignored subsampling.
- DE3 mixer initialization clears the whole register space, which also
  clears the scaler global alpha. Since video mode takes alpha from
  that register, subsampled YUV layers are fully transparent.
- Since the conversion to drm_fb_dma_get_gem_addr(), luma and chroma
  plane addresses no longer describe the same pixel for odd source
  offsets, which the scaler can't handle.

TCON TOP and TCON:

- Both mixer selectors reset to TCON 0. If both mixers end up selecting
  the same TCON, output is black or corrupted, so park the other mixer
  elsewhere.
- DSI and LVDS never called the output mux setup, so on D1 the mixer is
  not routed to the TCON driving the panel.

HDMI:

- sun4i_hdmi_enable() ORs stale video timing polarity bits into the
  packet control register, so the AVI infoframe is not sent for modes
  with positive HSYNC polarity.
- The 594 MHz 8-bit MPLL entry doesn't lock on H6, so 4K@60 8-bit
  doesn't come up.

The rest are an error propagation fix in sun4i_crtc_init(), which
otherwise oopses later on, and four patches fixing OF node and device
reference leaks, two of which accumulate on every mode set.

Tested on Tanix TX6 (H6, HDMI up to 4K@60) and Orange Pi 3 (H6,
TCON_LCD0 and TCON_TV0).

Some of the issues were found and/or fixed with Claude and GPT.

It would be nice if anyone could test V3s fix before and after. Testing
other fixes would be nice as well.

Best regards,
Jernej

Jernej Skrabec (13):
  drm/sun4i: Fix V3s YUV scanline size
  drm/sun4i: vi scaler: Fix coefficient selection
  drm/sun4i: vi scaler: Restore opaque alpha in video modes
  drm/sun4i: tcon-top: Keep mixer routes distinct
  drm/sun4i: tcon: Set output mux for DSI and LVDS
  drm/sun4i: tcon: Drop TCON TOP device reference
  drm/sun4i: hdmi: Don't leak sync polarity bits into packet control
  drm/sun4i: crtc: Propagate layer initialization error
  drm/sun4i: tcon: Drop remote endpoint reference
  drm/sun4i: dw-hdmi: Drop TCON TOP port reference
  drm/sun4i: Drop node references while building component list
  drm/sun4i: hdmi-phy: Fix H6 8-bit MPLL config at 594 MHz
  drm/sun4i: Align VI buffer addresses for subsampled formats

 drivers/gpu/drm/sun4i/sun4i_crtc.c      |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c       |  3 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c  |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c      | 22 ++++----
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c   |  2 +
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c  |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c     |  2 +-
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c  | 71 ++++++++++++++++++++-----
 drivers/gpu/drm/sun4i/sun8i_tcon_top.h  |  6 +++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c  | 20 ++++++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 20 ++++---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h |  1 +
 12 files changed, 119 insertions(+), 34 deletions(-)

-- 
2.43.0


