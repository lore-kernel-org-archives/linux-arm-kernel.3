Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E59FC982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=; b=J5qv94J4BRAIYlJj0Y6l0uRLcP
	ylY/1a/nsErsstyZzDMnwHFL0p0Lj460soDNNUqMZu9uDBXJaIlDYmttev7PAJPe7Yi6UgmQF+jy0
	fvM5C4zBDsUCFwqnQNN6KBjjFD1ll+9SdCbQ3K3j/AvnWSf8LTXLmv2FMfQ7Dyzpi1SvvHGHkulGp
	ppa/xneIyNHvn0yGSZk+jEWLZTzzPVnKSPWxvnQ0pkXBvsah+yZJOht4xq6s19VmGRMpHX1BiQ2nF
	Wo71lOfOSUZLmJ70GJ/J1DlztyvrUQ8Ml4DAym6brsrKGaAGsAnwVZ7a7q0GmsGCvLK7UoXtIdwq9
	tv8Pu3sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JWo-00000007mqK-40Xo;
	Wed, 23 Sep 2026 09:44:39 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9JWl-00000007mp8-2QOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:44:36 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso370736a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790156675; x=1790761475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=Icm64x4U3zdjFN3FNl1urb2zVgmn2VREOuDHZ7k5PBI7hxsU81gZEgaLg4guKJIJ/J
         2TaJathGyjc9srZQfNt0Bid+xraLPK0NVQ/xXFRQLiiQw0G/Z/o7LEDFxL41RmFJoqCh
         /jXTsef+Ct+JgdC65bhbfRgXHDi2VaoiPotEjqrFpZhIm0lX3yWiBZrVSRvxUfI7KN3y
         TYpA8lq0ilGQJofneQ0hmPQGGCqZlOwRhquq6C3zsLJvZmqYYtBNBUGnkWk6HW0Z/rOe
         eo1u4u+rnwzshsQRuHwWazxg11ojilY0JK3VU0nVg16pSiJ9VD8mHDHhfSrVdCRX4w9Y
         nuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156675; x=1790761475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwEzXtz3NNCFqU3FWhb/zI4kz8S9UO05RDNlkWDHdYw=;
        b=aEhPa6UdO9DnK+LBJUvtK/6zan7lcOK7+zhtVI+7FRvwDjSFMH4kz3tTbCh7fC4p8E
         c4vbs6nI1O5sWKWwdxrvqHMK9/X2bKac7r9hpeujhHzldFf+XkZydH5zKcmPHh8eRSpK
         KnnseGjKo/4q7MVzH6lnMbdMXMUMTBHKTOldOs9dNDGp0/wM16kKbU1cKWyZLb91uOSF
         EXQhpYZsf+uvaEbC6A+9mCxZMx2MbdrRXr4wUnmFqAZmKd5Xwfm/0NB++jTmlm3fYgeI
         3usnO7FXk8uqVNSmXx0sUsUMOnlqFR0TgC2whMCEX++V9bX1rmeDQKiooeXcDnSz7jB7
         Mpmw==
X-Forwarded-Encrypted: i=1; AKwUvByYJNxqJNSTMmin9on1Hk+tzwUdq2ZIjLNENLodnilUnhDSD+zO1P2n9gXmWQaj3fVmDTfm+A/86+7v+DM9ZYvh@lists.infradead.org
X-Gm-Message-State: AFuF++lzzbZWalMGIJrQ24WSwCe0lVN/ME6AbO2zT3u1CNwbAc9kb8zz
	9B4AnPtE3W8RM+CxoqGIOaPCEZa1Bxi8z+Kl+bsLiuiOeGD/CW4ocMvb
X-Gm-Gg: AYBFou2czmjsSSNoBNfVCLOpWXDnfvYDbNPwbdVakCkHvEmqAUoxDu2hlKzp4wdO8/F
	Y7VCDwafGKORFdf1EwhkM2RwBkOqhAStC5Cu+IbZUjH/mUHFZC7xln4Gh4aZUgG0hUucfzHNOb8
	A+bFlZjay0LtnlYXIZphytklYkhVj97rCUqfw0Em01p9zKjgup7YTYoQKIvtcDPH4KRvgURXv9R
	VvAx56ZYA4qN3r24hGZxQp+A7N9ehmc7vpdtgpANGpCV+p+3qbgk0/mW2DDc9asNAt3LkLWUgrj
	sA99zcqLK97Ah0KYZvXrj1PXjbUXolkL3GP/HI6twc00ciWoJwLVXA+9TzKjFEagpsd+/h/DrJz
	FUjCk3pwycT27obfny9rpMJhXot1kwKLVr702/3FwFrFfKgPX8EEQBKbB4m7hKGIRQuurftoQiv
	xZ3WGzZ065Y3fvvZaPmqYrRMXGmNEvJoNNC3L/ie0Jk5B1C9kPIZ2lk7RIO0i8yNZ+Vsu0uXoR8
	ARWmOsUorFSOUkQRA==
X-Received: by 2002:a17:90b:4c88:b0:3a0:3d1c:2dc2 with SMTP id 98e67ed59e1d1-3a07e6df035mr1828489a91.66.1790156674636;
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
Received: from localhost.localdomain ([2406:da14:10b4:9b00:211e:3d68:8776:5ca0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c741sm7874725ad.80.2026.09.23.02.44.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 23 Sep 2026 02:44:34 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org,
	Frank.Li@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: milbeaut-hdmac: Fix deadlock with the channel IRQ handler
Date: Wed, 23 Sep 2026 17:44:26 +0800
Message-ID: <20260923094426.67872-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_024435_630703_FE95F00F 
X-CRM114-Status: GOOD (  12.46  )
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

milbeaut_hdmac_interrupt() is a hardirq handler and takes mc->vc.lock with a
plain spin_lock() for the whole time it runs.  interrupts are disabled locally
in that context, so the handler itself is fine.

milbeaut_hdmac_chan_config(), milbeaut_hdmac_chan_pause() and
milbeaut_hdmac_chan_resume() are called from process context and take the same
lock with a plain spin_lock() as well, so interrupts stay enabled while the
lock is held.

If a channel interrupt is delivered on the CPU that is inside one of those
critical sections, milbeaut_hdmac_interrupt() spins on a lock that the
interrupted code is holding and can never release, and the CPU hangs.

Take mc->vc.lock with spin_lock_irqsave() in those three functions, as
milbeaut_hdmac_issue_pending() and the other process context users of this
lock already do.

Fixes: 6c3214e698e4 ("dmaengine: milbeaut-hdmac: Add HDMAC driver for Milbeaut platforms")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/milbeaut-hdmac.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -214,10 +214,11 @@ milbeaut_hdmac_chan_config(struct dma_chan *chan, stru
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	mc->cfg = *cfg;
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -226,13 +227,14 @@ static int milbeaut_hdmac_chan_pause(struct dma_chan *
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val |= MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
@@ -241,13 +243,14 @@ static int milbeaut_hdmac_chan_resume(struct dma_chan 
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct milbeaut_hdmac_chan *mc = to_milbeaut_hdmac_chan(vc);
+	unsigned long flags;
 	u32 val;
 
-	spin_lock(&mc->vc.lock);
+	spin_lock_irqsave(&mc->vc.lock, flags);
 	val = readl_relaxed(mc->reg_ch_base + MLB_HDMAC_DMACA);
 	val &= ~MLB_HDMAC_PB;
 	writel_relaxed(val, mc->reg_ch_base + MLB_HDMAC_DMACA);
-	spin_unlock(&mc->vc.lock);
+	spin_unlock_irqrestore(&mc->vc.lock, flags);
 
 	return 0;
 }
-- 
2.43.0


