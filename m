Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F753CD8C84
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 22:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnC7vLoGVfscXCXpbQMGvoK6eBuMzhRQB3BGZ5MGe4M=; b=P7UsXc139MAOA6LF1fGRu/3KMX
	VOH/aPqkZgG4An6SHovVlFvsCQqmDvU3pby3goGka1nZhdxCKI/fjEc/Z05GPGrTO4nokCVbylHd+
	a9aHmv3cDGa5vysr27CWPCQZuW9Kt0GEyfNysoIxk+rWV8X920qHzLMkQshTYtJttR/wS29Viuf9z
	Gp121mMENlDeAcdZsIvLlZg0ARn/uFXvWxsjKjnPmQeqYISD2TH45DKOL1OH//Uj0+Zytr7Kfnu5/
	aG/djZzoD+U0j1TlJ4ax9t0l0n4nW2JkyCXM9/v53gzkBAGLuZlVPo4uCzireY02CNvW1EoZZRpF+
	+ByJoNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciE-00000001EA5-0ZQz;
	Fri, 05 Jun 2026 22:08:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVciB-00000001E81-2fpn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 22:08:20 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wVci0-0000LW-Uk; Sat, 06 Jun 2026 00:08:09 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Sat, 06 Jun 2026 00:06:48 +0200
Subject: [PATCH 02/17] media: rockchip: rga: add comment about pixel
 alignment for YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260606-spu-rga3multicore-v1-2-3ec2b15675f7@pengutronix.de>
References: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
In-Reply-To: <20260606-spu-rga3multicore-v1-0-3ec2b15675f7@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Detlev Casanova <detlev.casanova@collabora.com>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_150819_681748_CFF112F1 
X-CRM114-Status: GOOD (  11.47  )
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

Add a comment to clarify the use of fixed step_height values for all YUV
formats. While the commit introducing the change already explains the
reasoning, add an explicit comment to improve the visibility of the
reasoning.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index bd0afd33affe4..efe5541078214 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -414,6 +414,16 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		.step_height = 1,
 	};
 
+	/*
+	 * Technically 4:2:2 YUV formats don't need a step_height of 2.
+	 * But for the RGA3 this is explicitly documented in  section 5.6.3
+	 * of the RK3588 TRM Part 2.
+	 * And the RGA2 vendor driver also checks that the height (and width)
+	 * is aligned to 2 when a YUV format is used.
+	 *
+	 * Therefore be safe and always align width and height to 2
+	 * when a YUV format is used.
+	 */
 	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
 		frmsize.step_width = 2;
 		frmsize.step_height = 2;

-- 
2.54.0


