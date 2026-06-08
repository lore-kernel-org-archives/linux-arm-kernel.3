Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13E3CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0zPEFGhfG3QKVaGDZG1h1mxGzWJiUcHgpOMB7FKbFE=; b=VpnyfxpMac5iroYr6xSrk4mQY0
	hNYBz97ogrMWieP07peEz6Dc7AnjcUnv+LtMOirUzcSKZWwvmKglAVyPI5cAtpqw+xDqs4R/97oJi
	0Dp0A+6GAUrs3hUQnbcZN3sAwuqjGqyN99znb++6sPQuz7V8A6nKTfYIvUbVZa9tWge8VNVRWavuL
	wLYI9+JRU1LcAU9TjSsauZDN1YqESswBr0+gMv8lQD4BIGeZnW9f8fIcrOgucLYalwIXBPAhvLqaZ
	8WJZ0ddGe4vAwsAmqiAVGIoAu+cf+1vh/tcqyCerDsSOj98B3PBqhACMF48TO181vXMrFa5GHGNpC
	ynJAlbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnJ-00000002j3Q-1sSj;
	Mon, 08 Jun 2026 02:32:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPnH-00000002j2Z-2w27
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:32:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0b9328c4aso26168005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 19:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780885971; x=1781490771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0zPEFGhfG3QKVaGDZG1h1mxGzWJiUcHgpOMB7FKbFE=;
        b=Ds8L/FJQeWwIBwd+m/a+NSv5VaXJIoOuDkix314r/Nie1DhGCjtixQGi4Gsbqji8ls
         Fwesyl/kE5QIZ89uM7QQlyTnFZHYrvtII6MK0rF1fdTQecM6hn7AR/5Cv3YM/JHUaFV7
         c30/EsB1C2CSqr9AtSi/YS8atd56Rkx0JZonPmdkBtevCuHq7FMzHYHb8lPmdnVj0ITG
         hJOcCRhNb0yaNmZ8khj2Gxn1IpayYBouIMSFAlwh57F8RJPFoUM3xeOnK5CZzHOt/Y4o
         8up+wMVwcmPKyhWUVbddMpESJ47z9f5VEQ5/yd0m8MwKxFjz+D4+F5qYsSlgXWxONbuh
         NWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780885971; x=1781490771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p0zPEFGhfG3QKVaGDZG1h1mxGzWJiUcHgpOMB7FKbFE=;
        b=cAZJxW+P89oMIhPEK9wmSgWoGE+RobtDTDk8MmK5bIaOtUzSxdY00RZUCkh2qy88J8
         mWJPQPnsaeclK3NHyESBT8q4gkMcvXg8lxs+cH7Mfeu0hoXt+0feN6uTQ5fyG4KE9km8
         IJTe0KcghsHPAup1dHUGqzrdAc25t2q23Iuk2FnUTmzB9Xw9yNjH3C8vmhlb8PUDFyR6
         8FCaB6TC9UiYi3iADbXDr2TSMxUwQPe4AntZC5cRqKArczYwAo9OoVOshTA4kYr6nPRE
         csUEfqYBOdIB/q+3J9EkNalvnWjxOrPMLQv4/dtJEnzB0tdR9sWRGmvPj+QbgzZjHBap
         irTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/NA5TzJiQul5Z/4vYQDqGgs1Gw8lPNfCtbgVIgiFTGwE8DWy20tGg/B9Ag53OypYJ9LyGgbXCHvP25EXj9dYMH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+E0ann3Acvn08e5dPGCHVEfcjuAhCZJ9LN2Ie5L48CiC6Ks+
	WxjQtZYLJN1zCOLo5cM7x6M7nQY5NHpdu8nceClkr4LIQnPoyMDyGYMS
X-Gm-Gg: Acq92OHjWoR028vmbbYSr5UTXmGZrHBm1McWl7I1OfPeL2daBJ9sd2exjlzAzbTfLC1
	sTMfxFPYvJownmPU+oIub5ttavv9D+WxCyNquowTTiZvHlyCSvTjpNfSlUq4vPKOwiKkxFVKqnE
	Ojn8nU0xTKvzyhi3teevoD/IinHTa5KCASHCXWDii0ty/2sVVf4rA/p2V7XM6OEycxmcNELSRyx
	/t8Y4PgrXZCPKUeAMG7tIHFMCbzaUqSK/CBSakJI8t39x4fdv/FOEBcQKO0xD5BNFPnCbQEG3sv
	XQZ5chFrJ2Xpk4X2WoU8RG/C5a4KqzTTJEaO22+49b/Y6X0jyLQLJlWOx5IkPe3Tt+FBVtYt/Wl
	b4jNCFD29fKPwsUh7Y0WLfQfP7oK0bxv1EnjdJqwnKfLaxGffq/ELeGHBEnv3txHZKVTvAFgwT1
	Ih82X8/AI9jYWzEuMDBQoLw//2xDi9PcsqoewPoJXZtXcrdjkMkfsdJ6qSJrC8Y1mcE6/CLmb8a
	CA6CBWyCyRxxJUQWstOjSg=
X-Received: by 2002:a17:902:f606:b0:2c0:ccdb:e02c with SMTP id d9443c01a7336-2c1e7b3fcdbmr158771995ad.7.1780885970776;
        Sun, 07 Jun 2026 19:32:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm38143485ad.81.2026.06.07.19.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 19:32:50 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v3 2/5] drm/verisilicon: add register-level macros for DCU Lite
Date: Mon,  8 Jun 2026 10:32:34 +0800
Message-ID: <20260608023237.305036-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608023237.305036-1-a0987203069@gmail.com>
References: <20260608023237.305036-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_193251_746940_E6BE4FD7 
X-CRM114-Status: GOOD (  11.46  )
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

Add register-level constants needed by the forthcoming DCUltraLite
hardware ops:

  VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h: bit mask for per-output
  VSYNC interrupt bits in DISP_IRQ_STA (0x147C) / DISP_IRQ_EN (0x1480),
  which are the IRQ registers used by DCUltraLite in place of the DC8200
  TOP_IRQ_ACK / TOP_IRQ_EN registers.

  VSDC_FB_CONFIG_ENABLE (bit 0), VSDC_FB_CONFIG_VALID (bit 3) and
  VSDC_FB_CONFIG_RESET (bit 4) in vs_primary_plane_regs.h: control bits
  in the FB_CONFIG register used by DCUltraLite for framebuffer enable
  and per-frame commit handshake.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635..d4da22b08cd5 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b39..67d4b00f294e 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0


