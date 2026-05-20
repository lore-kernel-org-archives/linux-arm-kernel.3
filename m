Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE89CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 04:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=; b=AUa+8Z8KyJ0ND/
	ifDkWpU/d5q5JvON7wpPO3z8qQWmtaPb5p7nsqjTvWnxRmNQ6t0I6BDWOYLOrrEyMcvjPg6+x8GQI
	w5vZSTcTudquk01MIfyd/oZyHzOWinH27lDtYpsf9x2d+oDb/K5W1JNzShK7Pg1JP3+D7Q6i+g/Zg
	UEq3xsZ1CeQDg/30XBAGHRWBtTXh1wDcum37/zHh8e07JLJemjDiUmR0yRKvAzp4kjD1jof+5aj2I
	3QZvz1p+fDzVbHlLheqmHHPU8bQzrYwjWxMelI7eY5sevaWy/K+ez3lJYuVZH5K7aJP7L4EujjWDh
	JFOh2QGTh0FeyjOK2isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYjt-00000003V2u-1bJE;
	Wed, 20 May 2026 04:41:01 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPYjq-00000003V2B-396s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 04:41:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-824c9da9928so1684689b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 21:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779252058; x=1779856858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=;
        b=qihSwO6mPfHWxqZhvnyUuKvPEVYGDIA0fmQz6PjlPKTmiywBO46xLNLSaHZqmdnS05
         WtcNcAI1Zv9Uh6hkrThIijxpIlDa9OeuomSinJzGQZLMFuwQAjg/X0Wngn5hk/+nobWV
         FPDSrfK3XGa49Sb8NFtxDLTP5WR5bikBc59pw5IlupwO9fEAmIp+EqMY8goSwejTLvLf
         WSUjZG5TckimCINVcIngVlwyP6+XgWnI8tesnonJq9qksJKcKELCKS/XxqscrElrjxCc
         1CPVDB5OAio52R7THM8AII0vbR+W6aOuEOWRawBp5aJ90vgGA/ZrehJfedprhWFwvOrv
         buvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779252058; x=1779856858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UawR2ecAAmpl5iNmgN346ehivn3mNf/9XSeJ91i6yF8=;
        b=k7oN/toddCRpOBMdR61tR04uqGcxHAHyS+3MM5lb70b8GTH4bmX99qgP5MKMZN/kfM
         cwCTJ1I++LlIROky3UJdeLQWCNRMGeHocjVBlWNXvheTY8J5kcyhD+9ad5iJRPeksnm/
         kJqAsorqo+feGaBVXH6M6iGZt5DUNYRN2gnOhiiOCEwoIn1wKso2Da+gU1elvL0Lkvzd
         Hj0utxalxTIm7qgTRZrMz4vD9H+z0cqIDSnQbraZcq7wJlqzgxcGZvCunWSNM7iCzRXh
         5NDAE20R82ct3oRAW5U1V/WOiw2nVj+l4Eo7e/s/B8yyiNmrjnlTrE8jid+za+bdNP2w
         r/HA==
X-Forwarded-Encrypted: i=1; AFNElJ/s+MwIuvZMz3XyBa/BcdbCzcQrMix9LEtBEuqU1LZtjgKpDY+q22FmDNMJ3RMjo8AUFRVdD7wo6YfKVbMe0mF3@lists.infradead.org
X-Gm-Message-State: AOJu0YxsSB8Xq3oTaGDgbGu+sNhdwE8r7w/GOdhl3HVWz/Qd+M55Ih5K
	xGW+Awir+/we1osi+0GVOA2qd3Z4rNVkYGVeQDjKMa3AfcRaVh/jP0lf
X-Gm-Gg: Acq92OHQtaugSFXTsEob1xYttvlAU8hNLDmUVhVTBNHzTn85WN9UpNSO6HD8zNkJgkj
	7EK9mT3CUc0u6HRWQImUps7hK/Yq9yCuIwRl+3lWc2RZ2Bctg2trFlziCONYoGpQ92YWg8W2kWQ
	4AK2qvGwD4AbDxksBuFtG+0fRWk1xFxDWartXUFmhag+PHj3otwyBEofDVJ2aVFUn1IfpSzpC+s
	PT3z2CKJpgs5oowdG+GtjrnmcNliuf9D21Y9Ytka1KFxj5aFTAfwW8NchaGJ4tj113lPATfPsuk
	NsVIaFKfastvpSHk6PiOdmJWBJ5HEFqdbdNpyU5C6ByRAJGwi1Ha5Qnh6ejc8ZJMnARTbje/3ta
	RCzoVVqFVBSre2zGBdcrfeShe9hT7yj7XbU0e7o9IDNzbKdq6IsQ4jcwNbVGbgF+UakdQNmysio
	X1k1+wu/NY2j/bAGctA18/J71A+JZYk5U=
X-Received: by 2002:a05:6a00:8c2:b0:835:a682:a6d7 with SMTP id d2e1a72fcca58-83f33bae2camr23163556b3a.4.1779252057807;
        Tue, 19 May 2026 21:40:57 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5be71sm18649802b3a.39.2026.05.19.21.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 21:40:57 -0700 (PDT)
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
Subject: [PATCH v3] media: meson: vdec: Fix memory leak in error path of vdec_open
Date: Wed, 20 May 2026 10:10:41 +0530
Message-ID: <20260520044046.7553-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_214058_860794_465C39C7 
X-CRM114-Status: GOOD (  15.60  )
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The vdec_open() function previously jumped directly to
err_m2m_release when vdec_init_ctrls() failed, skipping
release of the m2m context. This caused a resource leak.

Fix it by introducing a proper err_m2m_ctx_release label
that calls v4l2_m2m_ctx_release(sess->m2m_ctx) before
releasing the m2m device.

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
v2: https://lore.kernel.org/all/20260321065408.209723-1-linux.amoon@gmail.com/
   updated the commit message, applied the suggestion from sashiko
   below.
  [3] https://sashiko.dev/#/patchset/20260321065408.209723-1-linux.amoon%40gmail.com

v1: https://lore.kernel.org/all/20260304100557.126488-1-linux.amoon@gmail.com/
   tried to address the issue reported by Nicolas
   improve the commit message.
---
 drivers/staging/media/meson/vdec/vdec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..a039d925c0fe 100644
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

base-commit: 27fa82620cbaa89a7fc11ac3057701d598813e87
-- 
2.50.1


