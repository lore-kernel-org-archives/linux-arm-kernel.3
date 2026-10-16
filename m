Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58502CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rby9aMUP3wS4QVj+L75VJHl3m44mIgdEySaWpDHMJtU=; b=VCtXGI7sSC5JMx7yv8y2Kln76v
	QU1OK5auGEZqitRjcfqjkdWOL/MFxIr7clUC/PLBfXC6mjpSLLzsDiQACDp4CxFSUvgnO+B/AF110
	jL2RY8lf22EH6LukejuVQ7bMTvxBqavvN1VDmSqhy1LzbsXA68e1QfSYhOwPW7hd3iKvjyFNO2JmR
	lqGBeRIZzywmkX3kHoRxWBMPN02DLy1Y1om4y0/Da1BAqnag8VSMaLw796mxhlRnNIogyjvZ+FVG9
	XOGvs708pKk/uWrW5+V5dt9dqeflKgjryT2+eeVrKcv+8CftBZnWamaFUnwNsLrOj2ukUCldqHvLW
	/I6SRsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAs-000000033i6-1NAI;
	Fri, 16 Oct 2026 13:40:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiAr-000000033hP-3ynU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 13:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rby9aMUP3wS4QVj+L75VJHl3m44mIgdEySaWpDHMJtU=; b=AYVcUBa7PP8spyOGaVejvJNoCf
	aY0wv9gad1UKybP+AFJCHxqtRyG8T0cWEXYDZRuVg+w+yIK/pVoCUywzg9DQKfZxEKODXJSrlT8bm
	qqy7ft1xFlaH12JULvH18SW/C+DESrdQr+2o+eUdAokI7txgjql80DQQudm7L/OUpmQ8Fj0oJbe8D
	70c8t23XSf6ivXp3t9ESNKmFX0wwnzFXo7+DzPeh7UWwMoH7OjBLuRk0oZNDH0YIAygSQ2BWObozu
	V3Wb8PLtvMDj3voBCiZ5iapY6R0AvvXdfOP33FRx0qoEpYRzfn7XD8GFDHSGtHbrFv4LhL5b/2n/8
	nqoW8S8g==;
Received: from smtp-bc0e.mail.infomaniak.ch ([2001:1600:19:7ff8::bc0e])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHiAp-00000001YZF-0MJN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 13:40:40 +0000
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4j5mKZ1rZTzbDV;
	Fri, 16 Oct 2026 15:40:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1792158034;
	bh=rby9aMUP3wS4QVj+L75VJHl3m44mIgdEySaWpDHMJtU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PJ2jYvhCE2ltzTYfbPhrdNhg7OORW9X6b7wwaaMvOTLdJ52mTAP7qj7z/BcNMrf9c
	 Z1KpIBAZwlzbFIkECW+Zj8TBQhulMcAQV4483QXizeVdzjnfWZ088VB7PpfF1NPnM0
	 /Mp76YRHtzQzWER6TJhTZ1TjCs1u5Q9oa6a5FqMq89LeE5A10hfBORceq1dpJVMY9d
	 XCbbX9JyfX8/60eR2xhz91bDBZLN/625WG1stsw1At1UGFxpPF7LnZD8y6AW3ze1pk
	 0jzXAeL7l2a82V0p3recGqJbxUU80chlwcZnQKhXT2D7DA3CldNONQtubQPtirIDjn
	 OsIznf/31S4QA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4j5mKY1fMjzFrp;
	Fri, 16 Oct 2026 15:40:33 +0200 (CEST)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Fri, 16 Oct 2026 15:39:57 +0200
Subject: [PATCH 1/3] media: v4l2-common: add V4L2_PIX_FMT_Y10 to
 v4l2_format_info
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v4l-y8-y10-csi-vicap-v1-1-27bb87aa745d@cherry.de>
References: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
In-Reply-To: <20261016-v4l-y8-y10-csi-vicap-v1-0-27bb87aa745d@cherry.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_144039_274763_09B1C4EC 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

Add Y10 format to the v4l2_format_info table.

Co-developed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 drivers/media/v4l2-core/v4l2-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 65db7340ad384..2c36ae15610e1 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -333,6 +333,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		{ .format = V4L2_PIX_FMT_YVU420,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_YUV422P, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_GREY,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_Y10,     .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 
 		/* Tiled YUV formats */
 		{ .format = V4L2_PIX_FMT_NV12_4L4, .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },

-- 
2.56.0


