Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E7FCD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 07:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=; b=xxbq9peDErjaui
	1jBaE5sOqd1GwwOdEYjUeCAJCZrRMAbfjrWfz4R27h5RxjU1vm4A2wPXMpHaSE6JrIxeg8XvRgtxc
	3yyf2ds50+fX0jTs2XpQ6LyLsZZN1ro/pnWEb5J4axsFQBHvUWPR+5NWrjDv6uO0Avi5zCBBxv355
	h+CsA6E/6iMwtjG/HJT/i7ogcM4xC065HFJzR47OJ3MyUNLa1toFPNiQ/c2OBZ4vB//1HnYJ5FkG6
	aImLjyyo1XCeh18vbx8qUkJtEmWaHN4YJ1K/eHe3C9dmtKv9TSEIv3fbBywIPwAWUij/ad1zUYrHG
	73T4xUP9VEudZjAH/HVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxw7-00000006yZr-13c1;
	Thu, 21 May 2026 07:35:19 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPxw4-00000006yYf-2BO4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 07:35:17 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3698e34a567so5060795a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348915; x=1779953715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=ktzam2IDvhWIUrgcLTiidUgd3jrylevkH4hgPiXO4bzdshP2eP+h4rsudhfubEEs9Q
         cYHPNTd33CgjLe3dXN4yHcs/qYOP9bNGRZaexL8vYcJoQsOoLqtODstkYWGmLNmFZJW3
         WOCqViq5s7M9IX1yZ9tvW1nZChZTCobde9TuAu0SA84o/g5EgYUMSBz+4btQXFp+28qt
         mlFr99Wv3TFVy0lYSOfsJ25iN8N9rOV5GUT78BDReAkXEwWHD9FQHGfb95GVejCXWmq0
         ydmTvR8m/P2o0h383NrWh/a1+e/Nb0uXaNypGhjAIzOMGiBqVFLQpDMxCweNjUBPk2Fz
         BkWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348915; x=1779953715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=62v+VUjFmSMO7xe18HMoRAsN6xnzoeMa1iqyd56dOLs=;
        b=eeNifhVDviE2ttH3+Uu9ijAhU/J6Xr7PPagmpdlLlC1DT6YabZHhcdXvgKt1zJVMMd
         gsxS6UmxdSmxUa5FSfPQJStaZ0fV3lzpiJ7XL8Z8h5eji4LVGCkUZ7LUAEjmOwozBRzK
         UnzxSzguJgvV/7X++ElDOlfajSdgU5RVyAGqtHTj0m1iUx7w2Z4y2F9yEmNeynw9Lp5t
         +OTmTubMx+GNizf4eBwY/C3A+I4rjDnJjU/z+ekC8XUMzAV95GYtgjMUwBjTju2Uuu7Y
         Y2P7THDEoeaPvb/g9+fnn2/wk0+83JiMsAefBpLIDNFDr7xbEk0fsi44bSfxQ1OAlBqV
         Agqg==
X-Forwarded-Encrypted: i=1; AFNElJ8XBGiXPmE7ntrHO0D8cqnwY3FJsHLzqr4Yxq9Qae3lYm3FNr1Dewvgq9tfzOlXvA8H7AD1LacHtDjsNkQL3Q8K@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn3VDDCj/YHZK0UF/DWeNGSE5tZvw5riwL6vuNHqfJlb77PB3V
	fUXFvIra5IgghT3UVbVcwAyYP9p3N+gHW8+Ud5jVRgmEatzAU4aRs0Zb
X-Gm-Gg: Acq92OHXIBPiOUuAvz/ZKUqmIikDY559vHD7qiq6essvmBMQZCqw1bSa/U6BpAHrIoo
	lAeuG4C4vAnnoYwmry4dTri8qF1gRhPF9kmZmKjzagGuZtyojUE+irpQAmMwZQLyphjxw4anedT
	1TE4m6jN3juVaDuesHXK5zXkd5qGztJCnchw6X6BW+pqE5gNtPqKUICZKVd9ns2F24ZwxwufPTK
	E6CIbng7fdVvI5qattJJFbYuVJHq1vBv3jGXTxSz2ZuD6/FIY3WIwCGBqkNEoKfb6G3/9/4vK78
	keB/FiprC4WgQQXzhXLZMG03aQ7kk2sy9YxQ6M6rlawviLWeKGe+aSv1lhHyLGAcEcca6HmHNSe
	6AOpg1z0WY1efDBo3Y2HfIs9rX9HISrxoexlz7GZbHKdSzsn+83bLeMWrmINciH0Z6W8HG9yw53
	R5saZFQk/YIJPWuQ9vsh8t
X-Received: by 2002:a17:90b:2c8d:b0:36a:2a9b:3fb2 with SMTP id 98e67ed59e1d1-36a45600421mr1777569a91.16.1779348915390;
        Thu, 21 May 2026 00:35:15 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:14 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Thu, 21 May 2026 13:04:11 +0530
Message-ID: <20260521073449.10057-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260521073449.10057-1-linux.amoon@gmail.com>
References: <20260521073449.10057-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_003516_563982_46737852 
X-CRM114-Status: GOOD (  17.69  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec_open() function previously jumped directly to err_m2m_release
when vdec_init_ctrls() failed, skipping release of the m2m context.
This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label that calls
v4l2_m2m_ctx_release(sess->m2m_ctx) before releasing the m2m device.
Also free the v4l2 control handler memory allocated by vdec_init_ctrls()
in vdec_close().

This was identified via kmemleak:
unreferenced object 0xffff0000205d6878 (size 8):
  comm "v4l_id", pid 5289, jiffies 4294938580
  hex dump (first 8 bytes):
    40 d2 49 18 00 00 ff ff                          @.I.....
  backtrace (crc d3204599):
    kmemleak_alloc+0xc8/0xf0
    __kvmalloc_node_noprof+0x60c/0x850
    v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
    vdec_open+0x1f4/0x788 [meson_vdec]
    v4l2_open+0x144/0x460 [videodev]
    chrdev_open+0x1ac/0x500
    do_dentry_open+0x3f0/0xfe8
    vfs_open+0x68/0x320
    do_open+0x2d8/0x9a8
    path_openat+0x1d0/0x4f0
    do_filp_open+0x190/0x380
    do_sys_openat2+0xf8/0x1b0
    __arm64_sys_openat+0x13c/0x1e8
    invoke_syscall+0xdc/0x268
    el0_svc_common.constprop.0+0x178/0x258
    do_el0_svc+0x4c/0x70

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v4: update the commit message to add v4l2_ctrl_handler_free() in vdec_close()
to adderss the issue:
  This isn't a bug introduced by this patch, but does vdec_close() properly
  free the v4l2 control handler memory allocated by vdec_init_ctrls() here?

v3: https://lore.kernel.org/all/20260520044046.7553-1-linux.amoon@gmail.com/
  update the commit messagee.

v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
  updated the commit message, applied the suggestion from sashiko below.

  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
  tried to address the issue reported by Nicolas improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..9244fb09eb36 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,6 +913,8 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 
-- 
2.50.1


