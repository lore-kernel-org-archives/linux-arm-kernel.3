Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16578CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 19:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xDsrez4hENrmsOP6DpqaPlhTbFkmYHTO8HsVENUs2Sc=; b=iCjnZ1DD79k+XwJineqpgi7yIX
	7R6S2W8zlmjLsQ+THJvOzmxu1y67sxEymGGDMWHAZOtk3lR+RigbJyBHQEGyjUADQ+YU5fQjYCG/L
	D/fWCmcXwYn4OIZgjRIxVhXDy6StGa99Tl4OTr0mrl04RJdkqsSIUQRFVXZ8oRkKIhtU/J4Ut6H6+
	9WN2YF0ozqmsdaAfvC08Mtu8QXibda9j+ZHHhkdJJgi+Wc2UUtRTEslbfJYWilvsA1i7ttSiU3tn/
	DfwFQJgxg5tQW7+LpqMJgUbFaEUJf0fb9TpXeLrYzNwI+b6qHHH8HTVjDUNGBC1MNrSAF/Nc61rhM
	DLqlZ4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPqT-000000092NY-3BdC;
	Sat, 30 May 2026 19:59:45 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTPqR-000000092NC-1LSr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 19:59:44 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so31541a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 May 2026 12:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780171182; x=1780775982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDsrez4hENrmsOP6DpqaPlhTbFkmYHTO8HsVENUs2Sc=;
        b=FrozTfH5KV2iXHRTmPEoenpbFUDLVpT9bsMIXqa1+kX5oYVgQUkkEkSxz8GcOHORfm
         FTp8WVolQzjuB436r+Bxv9GABfTv17rz7TbxIf8uUgwXYOuOv5ADWvWyOorHj/xmGZVK
         Lh23cIKQ+UJdj1JofaXUJ2Od0oQcy7+3ZWuxW6ih2DFu1BmLnsKpCB8B0ucBfiI/uD2y
         RnYVNllzvkCxRFdLpNZoZbb4inw5vnBhHXRM75roNYR/Q2KrF3hK/A2hePKEpCJn23f4
         DdHS5C/QLr+JEPpkQo9S/cuu5TWba5SoR3bNz6HDR/GbQ7fazjkuew8smoz3ZJamxzCD
         CaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780171182; x=1780775982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDsrez4hENrmsOP6DpqaPlhTbFkmYHTO8HsVENUs2Sc=;
        b=OQEXYgO6tR4T/N40qk9m5ltpdsHYj8Qamxu5P2DnJKKDq3H4jpY9CfWtFX3tOA6vOL
         ry02SOXFo+LA2Cv6kMvtducLAN/WlZFaEWKDc9Eslv5KPNMA+wtwQfb+kYkKUHS96jpq
         FFQjKHHGFZC4VidWHkSsY6bpi2wgHBV3AyNxOrwhu4npRbIUCUojIZ60wHC/t6ip3Ymy
         R5jR1SyuYLPYMZmAw/tk11iqLjoX32wQVUsn2kG2o30Wb2gotbxgj+uAjm9h1t43EPpo
         RwfScGHp72DFMa3a1Lk6i7Sx5kXf1q4Pi3taMTjpcGfyb+WAEu59yds5XypYHC2hCfo2
         OVaA==
X-Forwarded-Encrypted: i=1; AFNElJ9IBVaJURQx6bRpZ9BmV7J61bS0oCfwVq4Ii6Lk87FywV/d1gbPRRvP2GCuVNFNBOqPuLjtwINg4D4tmTFQo+Qr@lists.infradead.org
X-Gm-Message-State: AOJu0YzIRC9wY0bIZRMQmJNN7XPw16ckykPxCaQZCYzSPPRWVSMsstYf
	7WhhLYj+1sIo6o/+FVztm9mr1jXC2TPZiQPhqz1VmV6gbuwWzbOHhabM
X-Gm-Gg: Acq92OEOBWYucwhhh4FaF3H+JwwCwEi0iBm0E0LBdiXnww+EUknvaxyr+UsBncAZBC+
	Wv6a508CqAK5OlVK3lU9dLLyelqWC86LLgO/xZn+9wQGg3P+MFoE0M/owfbvNYpeZSnCaXf3PXX
	LnnuIRnxi5IrgEiV7TRxWdfsfJImO4zJJsIST6VU/Nx+Iz6oxRcUgJG10Nr1I422O8ToRTI/c5k
	30qxlUIr9VqGISHJcp+VlOXIVYZHpnmnHSV2aq+IF5yRRtWpC9VhG1Jj6tsIPSdnGvTcBru5dIX
	NaXAlbxtY567tfiWz94rrQwOYaCFVn58vLj9rJNtdlYnfAPExn2vSzsiAw68osxOkLF+p7Kh0P+
	5t+DPhiEmlbYiXh4m4CGm7UPFDCBqhO4LR9WJtDwaQ5CITZdumHG0t9y+zID/bgh9Yl1Kky+W/R
	h08vjF/rgT87dKp2k9X35ILi5cKfOLjiQieNfWHo18EFhamWuNdsBVfUTx9eMu6U5+HPMDeuo79
	LBROD4csn05THElgIg/Pq8Eh1yT5a7tTMz2Ym3x5Ifalw==
X-Received: by 2002:a05:6a00:4296:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8422575fed2mr4382838b3a.49.1780171182401;
        Sat, 30 May 2026 12:59:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422b170f31sm2682850b3a.33.2026.05.30.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 12:59:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/imx/dcss: add missing kernel-doc parameters for scaler functions
Date: Sat, 30 May 2026 12:59:25 -0700
Message-ID: <20260530195925.5477-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_125943_366790_5345E69E 
X-CRM114-Status: GOOD (  10.41  )
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

dcss_scaler_gaussian_filter() was missing @phase0_identity and
dcss_scaler_filter_design() was missing @phase0_identity and
@nn_interpolation in their kernel-doc comments.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
index 32c3f46b21da..e48b3117efb9 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
@@ -166,6 +166,7 @@ static int exp_approx_q(int x)
  * dcss_scaler_gaussian_filter() - Generate gaussian prototype filter.
  * @fc_q: fixed-point cutoff frequency normalized to range [0, 1]
  * @use_5_taps: indicates whether to use 5 taps or 7 taps
+ * @phase0_identity: use identity filter for phase 0
  * @coef: output filter coefficients
  */
 static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
@@ -262,7 +263,9 @@ static void dcss_scaler_nearest_neighbor_filter(bool use_5_taps,
  * @src_length: length of input
  * @dst_length: length of output
  * @use_5_taps: 0 for 7 taps per phase, 1 for 5 taps
+ * @phase0_identity: use identity filter for phase 0
  * @coef: output coefficients
+ * @nn_interpolation: use nearest neighbor interpolation
  */
 static void dcss_scaler_filter_design(int src_length, int dst_length,
 				      bool use_5_taps, bool phase0_identity,
--
2.54.0


