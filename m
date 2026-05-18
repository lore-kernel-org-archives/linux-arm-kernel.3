Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB0DCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 10:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48Kx0iKo7H97lbhZCE1B5IEQpKBdJti198RF/vCNjEE=; b=bEsCXuBD5ZDKfU/YsDk6oICllv
	A7fXW1H6MjNPuHfHyeVf7FHC8JPx/eVRc5pHexOR+M/mc7O9qUe9Sk5duqFnFLT6XTXsfXF75vzyr
	QdsnAd0hZ4y6FKCQoW6D8Ca+qYhXMR/FiDSUnpHI01tyvNs+NilaSgHT2WUXVWZcXdXY/8bRkJYM3
	I4D4pn2CIiVCoBilR4tU6a1p3EH8PX4/99/WDXWpvuTL23w3hvWoohSASMEKmZTzDIr3mwtk+8LHP
	YoIyk4289M0CYFx7u4hJ/XJggUMNtfGwcs1V3tS6529blH+TrE7IsKeTO+7qB4BeXayGMg+r76daQ
	FVr2Ytjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvEl-0000000FEXn-133M;
	Mon, 18 May 2026 10:30:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvEk-0000000FEX7-1EUq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 10:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=48Kx0iKo7H97lbhZCE1B5IEQpKBdJti198RF/vCNjEE=; b=kXs9HgSns4XGPivN1TqFsZY2pp
	t37b3zo2vd5NTf3LhNHwHOd7Z1LTGXLzIwERx/fTDgFwgoNqlyD+APL6bB3BuiYYowvGA8nbCCh/t
	A7JK6bZd4RuuCfr9g9j4qwrj3YjL7Bjf2ziPB6sYXMjNiBSIlsmvgrFSJk7rAE6MiJ37s+kWf8E5s
	hVipvOctA7ca8HmcB2VucM+KRcU9x2yegbLUJVjPCkRVVVIgSu+eNlytt2zrHZg8XShVeM0wp4AaZ
	v6OkWa+GaDwZdCl9GKpfqSxlzD0bFT0qcyNsbc79gfBSmEvOg79Xwx8qYrvMZhtx1tH9vdwzWg4i3
	/tssOyJA==;
Received: from leonov.paulk.fr ([185.233.101.22])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOvEh-0000000Alhu-0Bm3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 10:30:13 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3DDC81F80044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:30:10 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B46CDB4081B; Mon, 18 May 2026 10:30:09 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5C629B407F7;
	Mon, 18 May 2026 10:25:00 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH 10/16] media: sun6i-csi: Add support for MC-centric format enumeration
Date: Mon, 18 May 2026 12:24:45 +0200
Message-ID: <20260518102451.417971-11-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518102451.417971-1-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_113011_620160_B8EC6602 
X-CRM114-Status: GOOD (  18.12  )
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

Use the dedicated helper to check possible pixelformats against the
provided mbus code in order to support MC-centric format enumeration.

Note that multiple pixelformats may be returned for a given mbus code.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 38 +++++++++++++++++--
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
index a836fa7f081a..409c28621093 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_capture.c
@@ -773,14 +773,43 @@ static int sun6i_csi_capture_querycap(struct file *file, void *priv,
 static int sun6i_csi_capture_enum_fmt(struct file *file, void *priv,
 				      struct v4l2_fmtdesc *fmtdesc)
 {
+	const struct sun6i_csi_capture_format *capture_format;
+	const struct sun6i_csi_bridge_format *bridge_format;
+	u32 mbus_code = fmtdesc->mbus_code;
 	u32 index = fmtdesc->index;
+	unsigned int index_valid = 0;
+	unsigned int i;
+
+	/* Video-node-centric enumeration. */
+	if (!mbus_code) {
+		if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+			return -EINVAL;
+
+		fmtdesc->pixelformat =
+			sun6i_csi_capture_formats[index].pixelformat;
+		return 0;
+	}
 
-	if (index >= ARRAY_SIZE(sun6i_csi_capture_formats))
+	bridge_format = sun6i_csi_bridge_format_find(mbus_code);
+	if (!bridge_format)
 		return -EINVAL;
 
-	fmtdesc->pixelformat = sun6i_csi_capture_formats[index].pixelformat;
+	for (i = 0; i < ARRAY_SIZE(sun6i_csi_capture_formats); i++) {
+		capture_format = &sun6i_csi_capture_formats[i];
 
-	return 0;
+		if (!sun6i_csi_capture_format_check(capture_format,
+						    bridge_format))
+			continue;
+
+		if (index_valid == index) {
+			fmtdesc->pixelformat = capture_format->pixelformat;
+			return 0;
+		}
+
+		index_valid++;
+	}
+
+	return -EINVAL;
 }
 
 static int sun6i_csi_capture_enum_framesize(struct file *file, void *fh,
@@ -1076,7 +1105,8 @@ int sun6i_csi_capture_setup(struct sun6i_csi_device *csi_dev)
 
 	strscpy(video_dev->name, SUN6I_CSI_CAPTURE_NAME,
 		sizeof(video_dev->name));
-	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
+	video_dev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
+				 V4L2_CAP_IO_MC;
 	video_dev->vfl_dir = VFL_DIR_RX;
 	video_dev->release = video_device_release_empty;
 	video_dev->fops = &sun6i_csi_capture_fops;
-- 
2.54.0


