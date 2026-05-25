Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72C4CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=; b=MRPCve/DNYXzH7
	UwOpQpFaDBq7aznQDj1kUnEtZtreb0hoIAe/D1L33DUpxX6zqWXr1OdUxGAt7LFFD332CvS1rX1J3
	lbtdfRglV1MELa+t35YdCxnFoqSpQw4BgpRdFchJ40zBtLwlJ+NV0/CeN1Z6grrYbhsB/MkUULm6b
	bLDbXwLXJqmjvKYP+5uRVf/Ov35cHhsxJwdZvc/SZ0pzuMqNy5tRXFH6iLwdfCMoi+Q0d7MSAI16x
	dOuL6QkDxjM1bZFbW9iIxFkMCDHkMeHFypPiMyxHSRP+FUZMd1jvXmHCt1sB6wmNb3C/VOINFKaQo
	guuGEOY1BlbNyhEZe1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzO-0000000GsJz-3bTj;
	Mon, 25 May 2026 09:52:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzJ-0000000GsGI-3tjj
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 09:52:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=; b=oAg8NSjGTMNC1t3McePDZRRbpi
	Q8DaEZJVNbGqrtnGSdUQVzGAipGcVOPu47BNmvm1QqF8KE8J3Vrn2H5MoVGTiLpX0kPvvPHDe7w6E
	DdM7UdA5dzPkD3eY1KfjYqa6D0YeiJTuuW6CgBvv8p2keQEn8VlS/M1eV8aMQory2pHQNB4Kau2B9
	qZTGARS4Iv7y4/0/6V7fzso3gyJpnppBu0Vc0OLBQGWLsnE6ncm4yMXCaJJQsiiZZdtz8yj4qV2vW
	+XIgV0RaSKsFOWrtwiJ5xGRMFhg8wWCxGuyINhnNu3gAj2WZEQRmG6JjfTKTdy88rRziIiP2NejjG
	MWD6GD4Q==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRzG-00000008wVm-1h4O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:52:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bd9c3b550aso65898565ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779702760; x=1780307560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=;
        b=mpmWzg5t/Pe9hty4+SAtQ4kmcXvxRwGqC2Y/KGAKm5UQ5zXjqUcQ1Bz6u7dON6BqvU
         GGL5GjpPb5YP39l1hEHuwjAcRH4VB6bRHxa32aWY5H8Yl3KqHUiPUybhaABEh6dzslkF
         g/jhEmuBuI2ZLLNkxJRF+HLmBYz4iwyZxPBZmZTkwF4fMj0s6no/xRFsXwM0P49V07hD
         HWAgpgWqHFp9XjWgLxP+5382njrHhvL5KDa/LN8aqNSffZ5o7bV0hxD5YU/fUDkjdCZ7
         TeRonUqWy1Duvn6gOzetYYT5iRH63zuny6oBwVnFGdsaXpx7zY1ftJZsTQ3+5LHeE/X0
         L7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779702760; x=1780307560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gZEIwW5TqIv7uy+nwwFRwQeWX+dkGvQ9eeETlxlcvg=;
        b=kkxTskIO7MyvEryVsaz+3zllxhisdlfbTDt8E1o8J4Kejef1iwHouLUDzbdFDnhk/0
         KSbSgyKDwz7OiBYo25obVzH9G1T6iauS6c5ecanVI5EDdub3ptxIyE7Grey4R7Q8JkN2
         JnK3qEpQURWsgbwIU2EDH5kr11UL/Fua8ZSCd1S5a5lRaCmi1Tp/b+2rw237STloSqeo
         YYvq0iseU/QIG/yMpHqeFB3g22v9IT4OgTodKBc+nNgEAUnoCmqFS3bafiOBjEx0j2FY
         VD+cfUoDXnfYnmqZ5ymk9Wn/377St7PXbmx9MFaBjqGE9k+BDFDF9N8blSGvdaGWpe+X
         CXJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/vUTmxU2V0qahcigQ0jclwHJ/8VARo23zHFI76abRf/aXFJ1lNn/b+Czyr6FPPR/U7/VUzxo0YxiL5ozyKBTNR@lists.infradead.org
X-Gm-Message-State: AOJu0YxbWHL/+XFbmt0ynn8c/zMyCZ1Z8mvRfxVMFu6wWIVPGCd6zX/0
	az9QeHJiBq9xiRRnKOe4Qt5dwUzo7BjNrouENknnbuZMnNAQZwg4+3om
X-Gm-Gg: Acq92OH+z2KxldHsq6zUd2METfLO6phBgblaUw8GJQ8Q6lz9lN+bV72HF1ogEeQ3CDg
	dCWu2lFZ2JTxkiAigPP5f+FWskRav4g57KznX3FkAm1g8UMwikxC8jyXd4JQQEkwluQtZgsWhBQ
	zBvAN6dw33tBvcgvEp51jUWrJSsEPxN9cchfwQinBWMrOS23zFs5yZ+189Yh++nJ6PeA891LyTE
	uszATlbxJKNRmBK3iVZdpDJwwwWD6DqoYhPSuVXUCcdBmyBbdo0wbAI2zTFVRrnbN/KD7J0tUao
	yM88Ds8yHykuEeMbiWmFoP1fBZ/Q7hsLqgbIR4TgC4N8nEZJ5Hy4hi/irsg1g92aARSt4GTGC7x
	AqgfqrRUHA56eIA46gjgrj803IjouLJeMifI01CnXUKU14WccFKrzVl4O5Od8FxhnmcRbpV2Czr
	VzjDw7XWUtjn3Y7ybGozKL3gG8qat/+rM=
X-Received: by 2002:a17:902:f70e:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2beb03466afmr148144335ad.0.1779702760099;
        Mon, 25 May 2026 02:52:40 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm92533615ad.52.2026.05.25.02.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:52:39 -0700 (PDT)
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
Subject: [PATCH v5 1/6] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Mon, 25 May 2026 15:21:49 +0530
Message-ID: <20260525095216.12078-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260525095216.12078-1-linux.amoon@gmail.com>
References: <20260525095216.12078-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_105242_909759_7286735A 
X-CRM114-Status: GOOD (  18.00  )
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
v5: update the error path for v4l2_ctrl_handler_free() as per the review
    ccmment to fix the use after free bug.
[4] https://patchwork.kernel.org/project/linux-amlogic/patch/20260521073449.10057-2-linux.amoon@gmail.com/

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
index 4b77ec1af5a7..18a22b79e835 100644
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
@@ -928,6 +930,7 @@ static int vdec_close(struct file *file)
 	v4l2_m2m_release(sess->m2m_dev);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 
 	mutex_destroy(&sess->lock);
 	mutex_destroy(&sess->bufs_recycle_lock);
-- 
2.50.1


