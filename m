Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D8C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2gWyMz65/0u8et/Acgqdp9Pg0w7FC3E041Xv8BfNcag=; b=qO4Ge3cRZENMZDImJVqT+4JY+Z
	NFZeK/romHGyKQmhSaRRtJy0rdKuCUQHp7TFZCX43n/ChPzKyhCLoZ4A4O5Ny+gscqGncD+ORAv8x
	+nrIOTCxMPD53BenMWIFBOfVGe03HKOULOBtj4Zh3wf4o4156l+t79aJJx9lIGdRE6NEd8CmmoYCf
	7yqFztiCe7oyLH0atY1uxXoJQK1EjMtl7B2ODQ9TAC6CJLf5axo9WPE313jCbSQTg6biseCmZnyND
	ABKn/QS9GJQAMS2zs+HRJBkds0NfatGhRQwrdVl7TZ+ROElYij+IHOzduQTJVTKVLsZls4X3erbQq
	nD8ExzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRuU-0000000Am1e-1YDA;
	Thu, 30 Jul 2026 14:38:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRuS-0000000Am1T-3Z27
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:38:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9D1C43C15;
	Thu, 30 Jul 2026 14:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453AE1F000E9;
	Thu, 30 Jul 2026 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785422335;
	bh=2gWyMz65/0u8et/Acgqdp9Pg0w7FC3E041Xv8BfNcag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O+eVplFKGom7sJy9vBsX4LI843OzFUmI80EosvQaJ6gpAPt60Ldr4W5V5VHCbNU4C
	 jRG6K04LbUhAJi8+cktqgeuRCezyAGRRFpMQLD9S0PAbilzTuXvTfpeFvAp4j9NiNg
	 n/MYbU68W1CkMz1rdKcaCjYEVPrOeAeVS7lIgNaM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Inki Dae <inki.dae@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 7.1 366/744] drm/exynos: fbdev: Remove offset into screen_buffer
Date: Thu, 30 Jul 2026 16:10:39 +0200
Message-ID: <20260730141452.064947942@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260730141444.267951807@linuxfoundation.org>
References: <20260730141444.267951807@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

7.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 760bbc58c2c833dec0ee38dd959f4f2f4084fc57 upstream.

The screen_buffer field in struct fb_info contains the kernel address
of the first byte of framebuffer memory. Do not add the display offset.
This offset only describes scrolling during scanout.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 19c8b8343d9c ("drm/exynos: fixed overlay data updating.")
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: <stable@vger.kernel.org> # v3.2+
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -61,17 +61,13 @@ static int exynos_drm_fbdev_update(struc
 	struct fb_info *fbi = helper->info;
 	struct drm_framebuffer *fb = helper->fb;
 	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
-	unsigned long offset;
 
 	fbi->fbops = &exynos_drm_fb_ops;
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
-	offset = fbi->var.xoffset * fb->format->cpp[0];
-	offset += fbi->var.yoffset * fb->pitches[0];
-
 	fbi->flags |= FBINFO_VIRTFB;
-	fbi->screen_buffer = exynos_gem->kvaddr + offset;
+	fbi->screen_buffer = exynos_gem->kvaddr;
 	fbi->screen_size = size;
 	fbi->fix.smem_len = size;
 



