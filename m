Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339951099B54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 06:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=; b=vCLc6Gs5H+zCQh9Xaah8U/R8ve
	PZ1GmLQF7d8ZVx3Sj3iPjdJ4wS+DG+172j4MIKzzLJwtiq2cZgMfs+XqGhEIIXCnfxC3CS2fTEUnJ
	/jcMo5QKekx/JcJZyr03qyckk/MrE8VDIxO1U3Jy8qv5jR7L79hhivHJeH7cLO/RMt8modO4LZClx
	Nyvt+JUQdaCn1sFnJL3tWiqbmpUO12rI5sNr9/yQ0PrdXlvBDBIEDRrcQ7UJjqWtr0IOTGF6xfvxb
	oNDXKnw+GTigZVUa6AaiMI2LnCkasW0JZe5wcua23UItfJQbUQ49sb31DNIRmT9qZ6As0EIoazBcE
	DrwJom4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qE6-0000000EAhm-47ow;
	Sat, 21 Mar 2026 06:54:26 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qE0-0000000EAfC-3sNs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 06:54:23 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c73a12af63cso868468a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076059; x=1774680859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=;
        b=bBQ/rwkyS7OCP1XfaKdOzfySUiHbYbcoIgAKRIdAZJzapRiP9p21Xkpp3+fvx2u2w3
         m4ejgP3c6BMRP8mO2H+3PgXWm0J3iY/SwmqtE5v0ESfu83fOUTpmrfhtu01SRP4S3SoN
         OulFs0yYsFEEQRaDpoDcsEJQpQdPgr7Nx56ieDeAo8hlhVl9txmOYzUgIaQ6dMoKqzCW
         E4xi5P6Z7/HY8CZYYyNRbQONUj1Zyspmwz5SeIjog/nfcipBj6A7iQ30P41Iw4jRf54f
         Fn+MNWV4asxTLah+OOfWtVtjUQHjGzoCHLmAn23YOs7dlxUKJMtUq4lmCOpGY34slShp
         4dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076059; x=1774680859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGQQXI1iMDOQW7zjWSA3/NeC4tENFjL25ABxgm3fCbk=;
        b=Jv8Hb+Lxzhlpn0wP5xSmLF9IdqT2IJTj8+HwZxI9c7gBG3/BAg9Ev1g9/vEk+3H7wG
         DlR/BSM9vHv7owslKWEX90gjdSwXI+C0/zcO90wKWmjDPP6XgJ8oCXpmFTKwP71ZGw4+
         OQ7AwgFotYurbZUJMdjlIoPeaDYUx7FbvKhIFwvsZmHvwLSavRQ9DVGSoG+XNwcL4prA
         fo8gUjusGtPKD+9UXsKtFJLK5h7YRfCm8KvIqVc/5wJm3NxP/ftU7KQi4rkDYqHNokRv
         qJrodunQn3DTwE3pILMsNft+IZ242Xq24nU7cHmjM1cRJi8iRHiYA9/NEtqa1QCe6Y5c
         Fmrg==
X-Forwarded-Encrypted: i=1; AJvYcCV8NaNNr7HIAAnJk+83ca8/9fM4XxRQ9Jm4Tp1pYMWPHNk3nL+SCl3aTnjBnvgmenL1vCWrlGwJ5RzRT0RlZkLU@lists.infradead.org
X-Gm-Message-State: AOJu0YwyuGE7YDZhTD6XdnDTPyzhlAoXefbHu9d883oHD/o7LVNopvmx
	B198oqGu0q5U6KWDrjh634J8oV04ZEgHxcFBfWou4A0xr2jZyxq7zgio
X-Gm-Gg: ATEYQzwCoxcMCo2YGwm7Hb7UCxOZUrxrlFpyUYkBoo2+nC2zqBiQ8EsybsLLYnAO2KH
	CJ/wOFEBrhkxfmoZ3EGyW0WQQdeBHNB9RN0CS0DaKpOvMmiiK1vZMam6gvH6L5smm6Q269ryib7
	MB7MSApyiAP7ro1oNWw8169mgqrnnj5Isti7ulnRVPYSAKUodfcU4kB4IjXIeiy9QePl6dKfYg5
	hu+JHKu7WWWgd30OkfQxIfCxiXPEqMKlI9cRyNoOQJCrEmYKa8oUoibNWf2GXrwCsm0OX76AmkF
	71OgoZxNaTD+TTAuI+SXlcnV2dC+isSR8/wokFcMwhAIa35hPWb24SYRdRITbVn2lWPWzbYJaIP
	9GsNFZAJk5gEV6J4uuI03L0/r9E3FV+lD36w3q07M3TIOXJbgqn9mZsJe1FP7Jo3ENMNzsXNCQc
	dE/+sV2PwkSE0Reiy8eC9x
X-Received: by 2002:a05:6a20:401d:b0:39b:e0f4:322e with SMTP id adf61e73a8af0-39be0f44141mr2372219637.62.1774076058629;
        Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74456fbfb0sm3188114a12.29.2026.03.20.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 23:54:17 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v2] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Sat, 21 Mar 2026 12:24:06 +0530
Message-ID: <20260321065408.209723-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_235421_137284_3EEC42F5 
X-CRM114-Status: GOOD (  14.67  )
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

The vdec_open and vdec_close functions in the Meson VDEC driver failed
to release several resources, leading to memory leaks and potential
use-after-free scenarios.

This patch addresses:
- Missing v4l2_ctrl_handler_free() in both the close path and error
  exit of the open path, preventing control memory leaks.
- A leak of the M2M context if vdec_init_ctrls() failed.

The error labels in vdec_open() have been reordered to ensure a proper
Last-In-First-Out (LIFO) teardown of all initialized resources.

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
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
   tried to address the issue reported by Nicolas
   improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a76..3a5e4ebe0b34c 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -877,7 +877,7 @@ static int vdec_open(struct file *file)
 	if (IS_ERR(sess->m2m_dev)) {
 		dev_err(dev, "Fail to v4l2_m2m_init\n");
 		ret = PTR_ERR(sess->m2m_dev);
-		goto err_free_sess;
+		goto err_m2m_release;
 	}
 
 	sess->m2m_ctx = v4l2_m2m_ctx_init(sess->m2m_dev, sess, m2m_queue_init);
@@ -889,7 +889,7 @@ static int vdec_open(struct file *file)
 
 	ret = vdec_init_ctrls(sess);
 	if (ret)
-		goto err_m2m_release;
+		goto err_m2m_ctx_release;
 
 	sess->pixfmt_cap = formats[0].pixfmts_cap[0];
 	sess->fmt_out = &formats[0];
@@ -913,9 +913,11 @@ static int vdec_open(struct file *file)
 
 	return 0;
 
+err_m2m_ctx_release:
+	v4l2_m2m_ctx_release(sess->m2m_ctx);
 err_m2m_release:
 	v4l2_m2m_release(sess->m2m_dev);
-err_free_sess:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	kfree(sess);
 	return ret;
 }
@@ -926,6 +928,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 

base-commit: a0c83177734ab98623795e1ba2cf4b72c23de5e7
-- 
2.50.1


