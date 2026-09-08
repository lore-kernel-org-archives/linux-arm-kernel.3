Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E730C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 17:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=; b=tlGMBgPdUu9EdTwSJj5WAuQ8TT
	BSr7bBCi1If6Aqdh+ODln844taDLvxaKn36AzIDMybr4JnLmk4Ai6kv/quYisREUCpreJEZASngEU
	rGOn0I0wPLiiLqmxy7cWakiVa42iibPZUI8RuHreJwZGpZ3PPtSbjf3FI3kvqDDu1vxsChty1B+/u
	jQdan4NuIUjAvbZTsYs5WEmeu115k/wmJyxBuFLrspuC2Hk8tECGBb+0ZrOBf/dNLxcCxVJOYN9qL
	xCLbIAS05l8XyDBcUw6ak20ffKO0xnY3xv6TH9Mg23e2dliUMhDo5/1RpBIj8eXsVW6P6QU3R48+W
	O/cafGfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zIT-00000009lNN-1jga;
	Tue, 08 Sep 2026 17:07:49 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zIR-00000009lMa-0RZL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 17:07:48 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so673875e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 10:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788887265; x=1789492065; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=gXn4NHDR9wYROSgZFvTEDIyJrVoOrGqCcyljsAu0sZNy45V2fWIC0YDUGG/PHWV9Hd
         qRhxZaGcUaPrh//bl3xAQdeBo0INPpoervhdmYwExa0m4AANAgSuEBbiUH1vZaTqXnUb
         9s6uoqVqX6Bkn4dBC36DMl8x/gZqXIBPWheBFEZURmfli35r4FXzSfU90l28NJM506SP
         XthMB0zAVDbwNsOyI5yRuRO3GGHb8jx6aDTK2ahwBdo/rS/zVzz87pM6lpIPmJzFs8nd
         UUtMQDh0mReEOrJZlcZt96SN+ppWhi3yAe3dVatdHFEJKDWksSUGwnOV+woljT6m8APm
         6BTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887265; x=1789492065;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMGCVsS43Or0QvhvusoStvupM2eWy3k0/84tq8T1pu0=;
        b=iVwEBOdd3C9W9dDpalfseIS7oyvqYhkCWPWOxJyEe4pRNpfPsPVJEmW0C6qaQRseT3
         AJfvRq88DtTASO3a/tEcwn4mkqKGdkDIJjZHC0C+7guVHP2DQC9qhss7OCqg5CieevTc
         23AIJhOG3fJIP+VeikDUzGzUXd0UmHqY7eu3su6dSlCGK02RaTQw4Xkp5m76zA42ljbr
         w+GpcSQWKHkKSWGVGi03Nz/5o0VdStTaduRwvEO66p5udkQtgLhlUR2mYv9VWeiaW+fQ
         7PMMrmvvTn+CWNutxxOoqekfMDAcINrJbUiuNtNkz8ufK3TPclCK2MGczNKb0R5i5eUw
         fDgA==
X-Forwarded-Encrypted: i=1; AKwUvBxOnES86QLOnPevIftDNtVge6mybuJkW2teRYB/GrmpSjX5X4faxl/oGxTKiqhhVGVNBrbV5aM44FXkPHGOVx0T@lists.infradead.org
X-Gm-Message-State: AFuF++kAEKPRF0z7wxL7Tf4BaMBk4tdLz5FOo85ELJJhsKyzVGTG/d76
	TgONMQfHKL3N+RbZmvgr3v/V54vzsOcnTu75X/Boue1A+owV7XtrcDJa
X-Gm-Gg: AYBFou1m1lpFyXjCrY94m2s/b+q3ntzNwxuR3bMun2mlr2yqO7Tno1EIHPxcFHzqGbs
	UuyDkCHs663r4BCxA8UkDI8T3zzbOMClIXyWgUSkVCQ/JVnz8Z/tJxS1SltINQP2CcROb15edFj
	u2tEKamDC4cxz5XaKswtZEVnrwX1wfWviTLNRISL/MsnVNKy6aVY7aGFY7Cr32U/1KsDK54owbO
	9AE5LRot4VYkZx4VCb8ycLpCjdXME6QSvRE3+BgXpEdbumECBjZyjUFShf5JvjVGKNuE+13T8Qw
	RM1i2id2dKWXEDJpUj5kIZdbtzIzmzXJxcEYnc0PYgMdvxQOCAi+92bonK+sGeyS2N/n5l+R/LL
	SGU+cy4MHUYp6xl8w8OzkXzI+DH6jziVwe2C/gkUIl8XManW9QZb2KFWMdKdUBDO/tiYY6iQQQP
	I2uweKr2ZvDN1Z3vbpvz9bvm0YWqRGv/Pacec/tYt8XAcBHD8UxaT/mxQ2rtszVIEOJUzJTiXNO
	/lHiyaBIcukybkqd1+YwUWaEOT5l8IJQXFDICMKJRZNL4EBohiEBH5RnX8U98hhrK+mgvG4+uq1
	9WjaooBmp9cjdZemS9C2xTojovZU+GAAZq6VHAq2O8WSX5+0lVpvLtSPu3zLyPQBMHAGei3LPnr
	2T9z/1A==
X-Received: by 2002:a05:600c:3f05:b0:49c:e1f1:3dd5 with SMTP id 5b1f17b1804b1-49d1f223e83mr13800115e9.4.1788887264353;
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm304804615e9.4.2026.09.08.10.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:07:44 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
Date: Tue,  8 Sep 2026 20:07:40 +0300
Message-ID: <20260908170740.276800-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_100747_159984_49B34434 
X-CRM114-Status: GOOD (  11.73  )
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

Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
call stack") added a shared Xtensa helper that iterates over a flexible
array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.

While Intel IPC4 allocates dynamic storage for the AR block, the i.MX
IPC3 path reads the oops message into a stack-allocated struct without
backing storage for `ar[]`, while leaving `numaregs` unvalidated. This
causes a stack out-of-bounds read when printing a DSP panic.

Clear `numaregs` to 0 on i.MX since the AR block is not fetched or
supported on this platform, preventing unsafe out-of-bounds memory
accesses in the shared Xtensa helper.

Fixes: 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore call stack")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/sof/imx/imx-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 7a03c8cc5dd4..436fe49246ba 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -34,6 +34,7 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 	/* first read registers */
 	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+	xoops->plat_hdr.numaregs = 0;
 
 	/* then get panic info */
 	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
-- 
2.53.0


