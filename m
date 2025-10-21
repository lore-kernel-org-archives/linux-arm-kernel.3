Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D826ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSakgJYM18G6wqB1AWi+f/0YzbeIxq1/+lx+zloEPc0=; b=PdbLJ2iARKHHsSXSEiUcm/j7XC
	zswK/+ksZ8rqgxMix2gRGjyBk5CWVMedI5MLns/bg9u9bkLm+LYfEk0YdCj2Yu5B4g83neFWHVq4h
	eiRrvYvEbPCM7fA4WQQGBy1hBKgcqN/D0EMXraBPczr/fKN/xa+O9S4sQ77m6pnqWMe3ob+qygGVM
	8pSjpMXGproHExNCZSpXNhevJ1fJ3SCZTDsirWv+0Cvs+J5g9wMyeE/FQxjMSsxi3G/rIyEowa2Nx
	tDuzZwEJsR2FV3sSTkQODiQGjTnVUoSWLCRxAv0zF5KJuHru/orU1DtsAa8IdaRqxhO9lXV39z7yG
	DAHhjGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9Ss-0000000Gb12-2OEH;
	Tue, 21 Oct 2025 10:19:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9So-0000000Gawh-0vtl;
	Tue, 21 Oct 2025 10:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761041971;
	bh=waDB8vYtdQBNKPeuHj9GmNwB3+DzA3ILMPqCkgoY4QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N5dMcJEBWenjFfMhSfSW05POUd4QU56PtqoDPzIPxpqgfYVuw5ijoN4kMY1sKUbLy
	 wW8XfMjHPjnAV4FPWTK5uwbcULd9EzgzlyurJJFw+Ru67WcwfHWzC4adaczraBGO1j
	 BuJ33aQYscsfQ59/AnuGoCdYt16VR4NfRIoEorKEH1pzsYvBM8T14KEUY6UmL6Vc2Z
	 gay3qBmQ3NxqTE+ncCjRSgtSOVlYwM/sGenapLuXH91E072VcSXQyImC5JlNwIBvBL
	 8/O+tyaQKj+KDF79x6fmDJUBNw5xjh4hRn9XmPccdAvo8D9Ht4HeGa9rTSAJHwFpsD
	 wr8ruxA1So9IQ==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 6B52F17E1413;
	Tue, 21 Oct 2025 12:19:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 21 Oct 2025 13:19:17 +0300
Subject: [PATCH v3 4/5] drm/rockchip: dw_hdmi_qp: Use bit macros for RK3576
 regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-rk3588-10bpc-v3-4-3d3eed00a6db@collabora.com>
References: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
In-Reply-To: <20251021-rk3588-10bpc-v3-0-3d3eed00a6db@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_031934_444066_19035766 
X-CRM114-Status: UNSURE (   8.69  )
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

For consistency and improved readability, redefine a few RK3576 specific
register configurations by relying on GENMASK() and unshifted values for
color depth and output format.  Those are not used at the moment, but
will be needed soon to support the related features.

While at it, drop a few other defines which are unlikely to be ever
required.

Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 04e18dd9102a..ac5ec697b9a2 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -39,21 +39,16 @@
 #define RK3576_HDMI_HDCP14_MEM_EN	BIT(15)
 
 #define RK3576_VO0_GRF_SOC_CON8		0x0020
-#define RK3576_COLOR_FORMAT_MASK	(0xf << 4)
-#define RK3576_COLOR_DEPTH_MASK		(0xf << 8)
-#define RK3576_RGB			(0 << 4)
-#define RK3576_YUV422			(0x1 << 4)
-#define RK3576_YUV444			(0x2 << 4)
-#define RK3576_YUV420			(0x3 << 4)
-#define RK3576_8BPC			(0x0 << 8)
-#define RK3576_10BPC			(0x6 << 8)
+#define RK3576_COLOR_DEPTH_MASK		GENMASK(11, 8)
+#define RK3576_8BPC			0x0
+#define RK3576_10BPC			0x6
+#define RK3576_COLOR_FORMAT_MASK	GENMASK(7, 4)
+#define RK3576_RGB			0x9
+#define RK3576_YUV422			0x1
+#define RK3576_YUV444			0x2
+#define RK3576_YUV420			0x3
 #define RK3576_CECIN_MASK		BIT(3)
 
-#define RK3576_VO0_GRF_SOC_CON12	0x0030
-#define RK3576_GRF_OSDA_DLYN		(0xf << 12)
-#define RK3576_GRF_OSDA_DIV		(0x7f << 1)
-#define RK3576_GRF_OSDA_DLY_EN		BIT(0)
-
 #define RK3576_VO0_GRF_SOC_CON14	0x0038
 #define RK3576_I2S_SEL_MASK		BIT(0)
 #define RK3576_SPDIF_SEL_MASK		BIT(1)

-- 
2.51.0


