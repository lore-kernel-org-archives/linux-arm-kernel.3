Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9B7CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQHfX8YL5xXEZVziuA62Ay9qSJUTkht1j/yzkz0Phi8=; b=2fzH6y83g2DAuC7vC76t3k3s1Q
	WQkV832YKeN18gyspHt18K5EAsmYiNoxMxpvfn9aD4/156KJfg1FEF30Lx0cvsKg5PZIvBxDlNGDN
	4tNTEP5YesD6sWTIxTazjD9oa1VWby0dM9lwanQldBmpRVou1t28kbJzqgjRGz3oZ5dHaGfHojQur
	Ui/l8rhElSgK6cx8/IgGQgHOMi/+226WEVvPE87ce5tB1RmbNEtuM2itFu2d3mplUqAE5V+WtYA4U
	hI37ysjqTqeLdr/GitC/WHPPvvi2MIWiHfScr8bCJDyQtIxQ80RCucL6mchtnvvw72a4QvfJEV+m7
	b9mlHrKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637x-00000001YQa-1jed;
	Tue, 07 Oct 2025 08:32:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v637r-00000001YLE-3f79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:32:53 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1v637q-0002Hb-C9; Tue, 07 Oct 2025 10:32:50 +0200
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Tue, 07 Oct 2025 10:31:56 +0200
Subject: [PATCH 03/16] media: rockchip: rga: align stride to 16 bytes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251007-spu-rga3-v1-3-36ad85570402@pengutronix.de>
References: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
In-Reply-To: <20251007-spu-rga3-v1-0-36ad85570402@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_013251_910703_A5AD6A20 
X-CRM114-Status: GOOD (  14.76  )
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

Align the stride to a multiple of 16 according to the RGA3 requirements
mentioned in the datasheet. This also ensures that the stride of the RGA2
is aligned to 4 bytes, as it needs to divide the value by 4 (one word)
before storing it in the register.

Increasing the stride for the alignment also requires to increase the
sizeimage value. This is usually handled by v4l2_fill_pixfmt_mp, but
it doesn't allow to set a stride alignment. Therefore use the generated
values to calculate the total number of lines to properly update the
sizeimage value after the bytesperline has been aligned.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 6438119a6c7aeff1e89e7aa95dcd5d2921fefa08..3cb7ce470c47e39d694e8176875a75fad2717f96 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -459,6 +459,25 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
 	return 0;
 }
 
+static void align_pixfmt(struct v4l2_pix_format_mplane *pix_fmt)
+{
+	int lines;
+	struct v4l2_plane_pix_format *fmt;
+
+	/*
+	 * Align stride to 16 for the RGA3 (based on the datasheet)
+	 * To not dismiss the v4l2_fill_pixfmt_mp helper
+	 * (and manually write it again), we're approximating the new sizeimage
+	 */
+	for (fmt = pix_fmt->plane_fmt;
+	     fmt < pix_fmt->plane_fmt + pix_fmt->num_planes;
+	     fmt++) {
+		lines = DIV_ROUND_UP(fmt->sizeimage, fmt->bytesperline);
+		fmt->bytesperline = (fmt->bytesperline + 0xf) & ~0xf;
+		fmt->sizeimage = fmt->bytesperline * lines;
+	}
+}
+
 static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 {
 	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
@@ -474,6 +493,7 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
 		return PTR_ERR(frm);
 
 	v4l2_fill_pixfmt_mp(pix_fmt, frm->fmt->fourcc, frm->width, frm->height);
+	align_pixfmt(pix_fmt);
 
 	pix_fmt->field = V4L2_FIELD_NONE;
 	pix_fmt->colorspace = frm->colorspace;
@@ -496,6 +516,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
 				(u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
 
 	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
+	align_pixfmt(pix_fmt);
 	pix_fmt->field = V4L2_FIELD_NONE;
 
 	return 0;

-- 
2.51.0


