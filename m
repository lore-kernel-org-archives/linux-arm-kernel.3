Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A751BD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 10:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIDm7KBT1s0AbOc3yV3TQ9ohvs8sUqIvua5HhBI5V8A=; b=MxBiltWpntB7ca3h8BtUxHeTWk
	YmpUwTaBMyKMkqP2tgg+pK1syAM0Ti+b7SbJUEFGu0rw9Kop6uPozBjCj7FpvF8ZXCi74hqucXJXg
	KxhpfVDvOvbtqrhiX2Ba/RduDkpUa+RBn3BF3c+EohZDkJv3q2evdOMu8i/7gmzlrP3FNc+g+ARbF
	L4poCJYxBbnlZ8hBD/q+D42e55VrC9QRjqjyy0HCJutuAylA2zo1QqSahUtXK+t4jwCsCXX6ZO1M/
	Vy6bMxFpXrytiqhZ4aeETL93BY9a2uArdxducfStqOMlFiX1bP2L1kGWW85VLZVh1pI+EOb8tErEu
	HCZwAW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5N6O-0000000APzj-3i8V;
	Mon, 28 Oct 2024 10:36:00 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Mx9-0000000AOSN-1Dth
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 10:26:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a86e9db75b9so614950466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730111186; x=1730715986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIDm7KBT1s0AbOc3yV3TQ9ohvs8sUqIvua5HhBI5V8A=;
        b=UoSxzFggnBHuBMowTO6/zmAHT8dNHP1FwkSLDrPl+xPBH5bIz69LtUaLeJ6dz7mtJb
         irm7bkk/MYuw/5RuOgBD6pHS3VOQFUOYTPRscTQnvmNq89lJ+cRhmQ3vEwdj2Im/ZnV0
         Ry80qZMmM8D1G2592iFH4g++DQBB4D1uj7Wu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111186; x=1730715986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIDm7KBT1s0AbOc3yV3TQ9ohvs8sUqIvua5HhBI5V8A=;
        b=AIqG5QcySyyG7KA7uxAGSp/E3ekqp96hSU27hFiEIdvJaD22CPtGKA21o75gLlWvZK
         5SLWXIlMAomPZqR0Cv2SaiQkBOWEl5JzJxkhZWdXrrAFxd/KopFw1pWkqYxekyWn+t2N
         Do7XssbEH1ElckLeYuS6tA9BhxKL2/zoIERZrxzCe1Fe7XRbi+u9vH58+vMcnBb6xJmh
         aT23BFz1BrD8S9he2Y50bdduILN6yzefQfLXqW4yLph+II3XOuAuVfljLmc0VeG6f98+
         XHOi13AfRNJQGxysOS8CgCv7GY66T38LEHL/M3LLeWUctqet4C7WycILKvbRAaBvoyUv
         J0iw==
X-Forwarded-Encrypted: i=1; AJvYcCVqPzrmabFslQXQsdcrZohbG5+p6ud8zK0/7DDzZv3NoYuDkczfx/whAT3HwSsJRE7ah66mfrqKoH+FHqvzTi19@lists.infradead.org
X-Gm-Message-State: AOJu0YwOiAyFg+orfpH2NLK78/MRNIBrEJTO+qF9keWKZUjwp+3W5t6i
	1on6WMjD6XzgzXCIMdMg3aQg8FfeuN4v/1I1K+NrVLM/4PHwUcxvhFdChxqLbco=
X-Google-Smtp-Source: AGHT+IEA5nCg2j7DVomJoAqNLW+z2Nbv9V6XM3cl17RychbK0FRUPkeqVCDGC4TH9y5e5TfNamZx8g==
X-Received: by 2002:a17:906:da8a:b0:a99:425c:c653 with SMTP id a640c23a62f3a-a9de5ce24f6mr866426966b.22.1730111185881;
        Mon, 28 Oct 2024 03:26:25 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.121])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f297b04sm363613966b.134.2024.10.28.03.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:26:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 10/10] drm/mxsfb: stop controller and drain FIFOs if already initialized
Date: Mon, 28 Oct 2024 11:25:33 +0100
Message-ID: <20241028102559.1451383-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_032627_357905_B13028A7 
X-CRM114-Status: GOOD (  15.70  )
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

You can't re-program the controller if it is still running. This may
lead to shifted pictures, so stop the controller and drain its FIFOs
in case it's already properly setup.
This patch is crucial when supporting the simple framebuffer, as the
controller has already been initialized by the bootloader.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/gpu/drm/mxsfb/mxsfb_drv.c |  3 +++
 drivers/gpu/drm/mxsfb/mxsfb_drv.h |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 14 +++++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index cb5ce4e81fc7..38c94cdc8f6c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -10,6 +10,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/of.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -221,6 +222,8 @@ static int mxsfb_load(struct drm_device *drm,
 	if (!mxsfb)
 		return -ENOMEM;
 
+	mxsfb->enabled =
+		of_property_read_bool(drm->dev->of_node, "fsl,boot-on");
 	mxsfb->drm = drm;
 	drm->dev_private = mxsfb;
 	mxsfb->devdata = devdata;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index d160d921b25f..0f9ae4ce450c 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -47,6 +47,7 @@ struct mxsfb_drm_private {
 	struct drm_bridge		*bridge;
 
 	bool				crc_active;
+	bool                            enabled;
 };
 
 static inline struct mxsfb_drm_private *
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7ed2516b6de0..d064a2bb65df 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -202,9 +202,11 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 	writel(reg, mxsfb->base + LCDC_CTRL1);
 
 	writel(CTRL_RUN, mxsfb->base + LCDC_CTRL + REG_SET);
+
+	mxsfb->enabled = true;
 }
 
-static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+static void _mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
@@ -221,6 +223,13 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
 
+	mxsfb->enabled = false;
+}
+
+static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
+{
+	_mxsfb_disable_controller(mxsfb);
+
 	clk_disable_unprepare(mxsfb->clk);
 	if (mxsfb->clk_disp_axi)
 		clk_disable_unprepare(mxsfb->clk_disp_axi);
@@ -354,6 +363,9 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	u32 bus_format = 0;
 	dma_addr_t dma_addr;
 
+	if (mxsfb->enabled)
+		_mxsfb_disable_controller(mxsfb);
+
 	pm_runtime_get_sync(drm->dev);
 	mxsfb_enable_axi_clk(mxsfb);
 
-- 
2.43.0


