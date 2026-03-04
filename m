Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3782DEB7EAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=; b=njZmhDjEZJJQXN55DwqonwWy/m
	bpNhmOrfr53NQWg23TAFAnJFjbbw74hIWKmj9U0aXLJlp3O99Uk4Y76SOSrDgrUeifPBGNi5GjfFF
	a539etMSGYi6lF4QDHA/aZSv/IeWo6668p13MPxdi5+r3tbpOzYU5Nn+YD83/25OfaAiYG9110/fN
	Nhcx/tMkWMFXlY6RfW7hlD7w/WZ+LWZFQPECsPSVX1z60J0QruAI4c0/HEMkq0T0/P15O3gdCvzBZ
	C91VGSiUHnYkLbf/kuxgQS1rFmfM5blYC9jRz3bChKBCGL4aa79g3BIeExzhMdag8g8eZWkYBhZfa
	N4VsP7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxj7L-0000000Gx3e-031y;
	Wed, 04 Mar 2026 10:06:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxj7I-0000000Gx2W-2fvQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:06:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ab46931cf1so49246435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 02:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772618767; x=1773223567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=;
        b=SKWh/u3g0ZAGb1Q/4rsGg9Wnyt9uswTWiFBkXqDzH3mUQZemPdVDEyT4fPizSvIg3q
         jXoeHGwP5V7xHf4G+4OFx8LLaFL6kaq6KcKgMKz1cuKHyEDjGhfJOkQI5AyDUjGe/AQg
         9qn/xhMpT71OT86AqEAVsa7CGfNEidoHQ4GMFgAda2KtGTXFz/EHmh0stHPoVNa6x58R
         at/WBfwNxnR+KDX1RdQnIP7Hcpusw06I/urUsDBTVDlmmMF9NuL6Ere03gAKz1ggPTY5
         V7Ui3LL8qZL3a7aAA2xVR3z3iUFA7P/7oIXFUWKLuUPQ56lXPFD12/szsOLSZexv8LT/
         +63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772618767; x=1773223567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsGz9NobNNMerVOOjKKJ0LgJD2SxFYXhHAVBSa0LnTg=;
        b=KZoqf8aFqM204JuKg+1selGCs7oWrHSPURBZiD1OakNjjEIACYyQ9P3jZl8lRml7qC
         uqY7gm1eoPHNv/SkYVbQHnX+LuJuCz6PX597+oHy2cYJZzuHI8dBFcN0W2R8lSJGGG7D
         Ld6cnLxxnBCir0H6mi6CcvpErolaQ2I0kN4RmjjWW3oF2I8vFS6CQF3F+VClyGyMqC6g
         hvev9Sv2MLUyHHbBPBbHTEDRH99HrVTO6PTcBCaO3c43q6lVV9G2ybN9/6OGkbq8XGlq
         wJ2zvmozvV5vaJJ1DuYOF3d5keweEpJsXv8yuKcSQL0SO8DCA0j39xUOmZ13dwuf+zf9
         vOJA==
X-Forwarded-Encrypted: i=1; AJvYcCXh0vP+pjeeYVV4nV65Tkr5wyvXBi2bTBA0nog6IwauUVZrWCKmafyYZRFtBg1mFZ6jx+n10dkA6+Lhqe9jPPxZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyYACBf172NP0NdDlVeOa/4AmetwLr2kI3CcBKsXj3YiTN09Rbv
	25R9bljednBBSCHExxQvqZm9Pz9f2vhhyphnVQSZdoY42OWzaviHE+9y
X-Gm-Gg: ATEYQzznTYv+CeR62nkHM9ZGU/LDObf9jAoH7Bx28H5OyWqyIzSXU/hc63d8Vop8ugp
	KJg4+if6mzMvirZc+8jlzUnq3c4L6tPvjdfq4BhUXqdUoZdfOYj5ib5lbKLILIakr8M/D+anPaW
	26JMR2SMXkZf5YBoWNv+usoq5a+zBM6zulN60Q74adMuVKtMj8nUrqQaMqFg7+KPS+4BtnXXNBM
	g9v5ThUVNDjBP8zr6/Y24q+We68IfZl35TSaxOYlYtlcg1UTxfY4l63AW07jFQUxKPLi3nG5Be5
	dut7jarXLECeiYlcbBMgxp1QcraWJwnj20TgDj2P40NK7OnXXTsjXPkXhrjlhmG9HQ4xTotCh9F
	5NeP7ohNZCUG07Fu4PqI6IlKDGT3OtvB15e3m+e2j6ACOwCZY+Jvj5rovOLTJOG2+EmFP9Lbzes
	oTrLYdXczwEKzoChxENtHq
X-Received: by 2002:a17:902:fc87:b0:2ad:da28:8c7a with SMTP id d9443c01a7336-2ae6ae0bfefmr15253245ad.8.1772618767233;
        Wed, 04 Mar 2026 02:06:07 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b48f4sm191220555ad.13.2026.03.04.02.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:06:06 -0800 (PST)
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
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Wed,  4 Mar 2026 15:35:53 +0530
Message-ID: <20260304100557.126488-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_020608_703701_69BB777C 
X-CRM114-Status: GOOD (  12.89  )
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

If vdec_init_ctrls(sess) fails, or any subsequent initialization step
during vdec_open fails, the control handler allocated for the session
is not released. This causes a memory leak of the v4l2_ctrl_handler
and its associated control objects.

Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
path to ensure resources are properly reclaimed.

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

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a5ab0c2390f5 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
 	return 0;
 
 err_m2m_release:
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_m2m_release(sess->m2m_dev);
 err_free_sess:
 	kfree(sess);
@@ -926,6 +927,7 @@ static int vdec_close(struct file *file)
 
 	v4l2_m2m_ctx_release(sess->m2m_ctx);
 	v4l2_m2m_release(sess->m2m_dev);
+	v4l2_ctrl_handler_free(&sess->ctrl_handler);
 	v4l2_fh_del(&sess->fh, file);
 	v4l2_fh_exit(&sess->fh);
 

base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
-- 
2.50.1


