Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FBAC5321C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 20:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kdLdmVA9n/pSsrP3UeU927I5NGczIynaa1kz7iUykO8=; b=EXQOJlqJiHUfs/
	57ocOsxHaZPjdGLXIKy137bJ/u3QMI90GRFoTpznFk0yPq+MKh6cDir1lUjxPhG5MR26fS7VF5Tr+
	6bng7q2ICgWU0R2a4WlvDkl33dCw8I5wnpqnq3BQWtOrnWTpFV2nA/eXs6lZ4VjiC3l8CSSciwWZq
	lKU9Txdgbk3/E5cLy6BMymICf/yIeU8AQnDuXb5971JdBdogEeuTjENODKw3kjZj/9gWCvvMe0FJW
	P8UeoR0YDgg2rZGMxtuBNLZgGsExLZQHKNf63WmvHFiYvWyBaXu2aQalx7IU19Twgx8knQkAnxjPX
	sdcOlVx8oSkrukMXzbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sp-00000001ayp-2sPo;
	Sun, 26 Jul 2026 20:28:47 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo5Sm-00000001awZ-3FPx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 20:28:46 +0000
Received: by mail-pj2-x0b.google.com with SMTP id 98e67ed59e1d1-38dbe53179bso663897a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 13:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785097723; x=1785702523; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kdLdmVA9n/pSsrP3UeU927I5NGczIynaa1kz7iUykO8=;
        b=KxCHJqMV5/L0qjjuKOCulPAqoDtP9alt6+DcrCjnCmpydV91jO9UwsK0/QkyylyO48
         aovJ/Zt7d1+twR9IweOHPzwuJWfEAhp8KsGStbVaKrhl90nxe2Haf9hXzY/xO71GI8dv
         RWjAntGuSVpZpgg4zxmJCjg7UQmxmmkvabsUXNsSLEdesQe6DsKMaWb2flfk7a1/opVo
         3cpoPdJ0u3rBQfNORGBueO9/ns5M8w8CUr6cdbT+Tu+XwYW8+IrFUYEKjpzq6jhperqi
         vDB1HeO/vB74aEiE6y4RrnOMKFMqEJFf8GnQyMO2D7PAB5awQaLTI3egCPYsd4jBZYIo
         7b/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785097723; x=1785702523;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kdLdmVA9n/pSsrP3UeU927I5NGczIynaa1kz7iUykO8=;
        b=EdZgshiUKWF+t1/c4KHjzjZZagMM+aKRG4H2/UCCavyOWzjopvYuoPmj41TZ3QSbE2
         jly7UUr3mz4YkNZYk1gWc8wYPubEiUP7CbsXE43KunjDp5Egs45d0mSdRfOAKplpUJN4
         3Lv550oxcVCFxS0UoSo6GzmEBwVIHTQDuoN3jn/3X/t7OsMa2aiI8R++GtHPW1yE0oJS
         qxffw++l6aQkleSbYr0GMrBiI93auH3n2vR1/FicUUh/ReAm9kpDRK/s8xIHbDwO9jY3
         2e+bd62ouXM/rJ3tpPQeuOj6DXVctIz7zQTcJDAAl3G0k7rJDnd3bT/YP/iKNOVYhjMW
         a/yQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop4J5iiN74LtnmN6XjLr74Yo2o4+56MOC6woiy/bJymX9GiPWJEeQ71e5HjoQYg3ZCPNUpgbOPn9dAFJWd2Aip@lists.infradead.org
X-Gm-Message-State: AOJu0YykqEZl7Ubvx00VGaHOnDoOqxvoj+ECzKAOUROS6M2SlTx3CPyu
	5zVHZxCU94DyvdBCq+XvNpHTf3+MsT2sMC+25lXLJ6moh/KJUhR+sI6M
X-Gm-Gg: AR+sD116jFXCNkPW6biLxJLyPfe0ETIvzxbboNVLlNH8q4o6flkqnPCuHr96tCKvwjm
	xx+k6Qjs/SGYXTxRipqJ+17rE81j58EwSC17IY9Z75mW1iLXEfZyQaHA2Neq9dtTo7nojPu8RXO
	M4g/z47HRdP2XIM0HzzOs6ttQQGlBfaOuxvAeCWzc7iBB5cR3SqlmR9xjhzqh+K6lNm9VGFMyCx
	+CT3bXdFJ8TtGl7l8Uk8bdP34zQBHfVNTxoU4Xrd+Kk3A2ijRj0V25OhNM858LXHCQPk6V12jZl
	ogXnQ6RSXE2Pt0vZz7MnAGhSINcEx3gpDMjaS3zLvW6DSi6cBKF9XUhb2S2G/83He0NVQ8llJ70
	ZcomqDmYjA3MXR4F5pu4nBV4wVkjSpkU4Z7T18vbUHUX5EVRdo9R7f/ANFUu/tPKkMqT87Lj4LW
	qiKpz10HMDyo/+P+F1g+aIP8TdpZhXy6Nt6a9dbQ==
X-Received: by 2002:a05:6a21:d8a:b0:3c4:5f94:f22c with SMTP id adf61e73a8af0-3c67df2078fmr5956185637.43.1785097723352;
        Sun, 26 Jul 2026 13:28:43 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4d7d:1e60:c46f:4bb9:6cdd:73bd])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e6461ef84sm132697c88.14.2026.07.26.13.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 13:28:42 -0700 (PDT)
From: Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>
Subject: [PATCH 0/4] media: rkvdec: Add VP9 support for VDPU381 variant
Date: Sun, 26 Jul 2026 15:25:33 -0500
Message-Id: <20260726-b4-add-rkvdec2-vp9-vdpu381-v1-0-180fb2d1f10c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD1tZmoC/x3MwQqEIBAA0F+JOe9AarW1vxIdzBlrWChRkiD69
 6Tju7wLEkfhBL/qgshZkuxbgfpU4Fa7LYxCxaBr3dVf3eHcoCXC+M/ETmMOA2YKh+kVGlIz9d7
 ZxrdQghDZy/nm43TfD7d6/pFsAAAA
X-Change-ID: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Francesco Saverio Pavone <pavone.lawyer@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_132844_855473_F9B3A340 
X-CRM114-Status: GOOD (  11.81  )
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

Hi All,
This patch series adds the initial VP9 support for VDPU381 present in rk3588.

VDPU381 supports VP9 Profile 0 and Profile 2 up to 7680x4320@30fps.

Tested with fluster (suite : VP9-TEST-VECTORS, decoder: GStreamer-VP9-V4L2SL-Gst1.0).
The 224/305 score has been reproduced independently on three RK3588 boards
across three kernel bases: Orange Pi 5 Pro (RK3588S, 7.2.0-rc3),
Orange Pi 5 Plus (RK3588, 7.0) and Radxa Rock 5B+ (RK3588, 7.1).

Most of the remaining failures fall into a few known categories:

- All vp90-2-02-size-*.webm variants where either dimension is
  smaller than 64 pixels fail because the hardware does not support
  frames smaller than 64x64:
  vp90-2-02-size-08x08.webm, vp90-2-02-size-08x10.webm,
  vp90-2-02-size-08x16.webm, vp90-2-02-size-08x18.webm,
  vp90-2-02-size-08x32.webm, vp90-2-02-size-08x34.webm,
  vp90-2-02-size-08x64.webm, vp90-2-02-size-08x66.webm,
  vp90-2-02-size-10x08.webm, vp90-2-02-size-10x10.webm,
  vp90-2-02-size-10x16.webm, vp90-2-02-size-10x18.webm,
  vp90-2-02-size-10x32.webm, vp90-2-02-size-10x34.webm,
  vp90-2-02-size-10x64.webm, vp90-2-02-size-10x66.webm,
  vp90-2-02-size-16x08.webm, vp90-2-02-size-16x10.webm,
  vp90-2-02-size-16x16.webm, vp90-2-02-size-16x18.webm,
  vp90-2-02-size-16x32.webm, vp90-2-02-size-16x34.webm,
  vp90-2-02-size-16x64.webm, vp90-2-02-size-16x66.webm,
  vp90-2-02-size-18x08.webm, vp90-2-02-size-18x10.webm,
  vp90-2-02-size-18x18.webm, vp90-2-02-size-18x32.webm,
  vp90-2-02-size-18x34.webm, vp90-2-02-size-18x64.webm,
  vp90-2-02-size-18x66.webm, vp90-2-02-size-32x08.webm,
  vp90-2-02-size-32x10.webm, vp90-2-02-size-32x18.webm,
  vp90-2-02-size-32x34.webm, vp90-2-02-size-32x66.webm,
  vp90-2-02-size-34x08.webm, vp90-2-02-size-34x10.webm,
  vp90-2-02-size-34x16.webm, vp90-2-02-size-34x34.webm,
  vp90-2-02-size-34x64.webm, vp90-2-02-size-34x66.webm,
  vp90-2-02-size-64x08.webm, vp90-2-02-size-64x10.webm,
  vp90-2-02-size-66x08.webm, vp90-2-02-size-66x10.webm.

- vp90-2-05-resize.ivf, vp90-2-18-resize.ivf and all
  vp90-2-21-resize_inter_*.webm variants fail. These streams change
  resolution mid-stream on a non-keyframe, and a reference frame
  from before the resize ends up unavailable by the time it's
  needed again. This is being actively looked into:
  vp90-2-05-resize.ivf, vp90-2-18-resize.ivf,
  vp90-2-21-resize_inter_1280x720_5_1-2.webm,
  vp90-2-21-resize_inter_1280x720_5_3-4.webm,
  vp90-2-21-resize_inter_1280x720_7_1-2.webm,
  vp90-2-21-resize_inter_1280x720_7_3-4.webm,
  vp90-2-21-resize_inter_1920x1080_5_1-2.webm,
  vp90-2-21-resize_inter_1920x1080_5_3-4.webm,
  vp90-2-21-resize_inter_1920x1080_7_1-2.webm,
  vp90-2-21-resize_inter_1920x1080_7_3-4.webm,
  vp90-2-21-resize_inter_320x180_5_1-2.webm,
  vp90-2-21-resize_inter_320x180_5_3-4.webm,
  vp90-2-21-resize_inter_320x180_7_1-2.webm,
  vp90-2-21-resize_inter_320x180_7_3-4.webm,
  vp90-2-21-resize_inter_320x240_5_1-2.webm,
  vp90-2-21-resize_inter_320x240_5_3-4.webm,
  vp90-2-21-resize_inter_320x240_7_1-2.webm,
  vp90-2-21-resize_inter_320x240_7_3-4.webm,
  vp90-2-21-resize_inter_640x360_5_1-2.webm,
  vp90-2-21-resize_inter_640x360_5_3-4.webm,
  vp90-2-21-resize_inter_640x360_7_1-2.webm,
  vp90-2-21-resize_inter_640x360_7_3-4.webm,
  vp90-2-21-resize_inter_640x480_5_1-2.webm,
  vp90-2-21-resize_inter_640x480_5_3-4.webm,
  vp90-2-21-resize_inter_640x480_7_1-2.webm,
  vp90-2-21-resize_inter_640x480_7_3-4.webm.

- vp90-2-09-aq2.webm,
  vp90-2-09-lf_deltas.webm,
  vp90-2-15-segkey_adpq.webm,
  vp90-2-19-skip-01.webm,
  vp90-2-19-skip-02.webm,
  vp90-2-19-skip.webm,  vp90-2-22-svc_1280x720_3.ivf,
  are still failing and not yet root-caused.

- vp91-2-04-yuv422.webm
  vp91-2-04-yuv444.webm
  fail because the hardware does not support the format these
  streams use (4:2:2/4:4:4), only 4:2:0.

The base vdpu381 VP9 driver support was introduced by me. Profile 2 support
was added by Igor Paunovic. Francesco Saverio Pavone fixed bugs in
the segmentation map size calculation and in the altref vertical
scale factor. Igor Paunovic also fixed a decoded-frame stride bug, aligning
bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt().

---
Igor Paunovic (1):
      media: rkvdec: align bytesperline to 64 bytes in rkvdec_fill_decoded_pixfmt()

Venkata Atchuta Bheemeswara Sarma Darbha (3):
      media: rkvdec: vp9: Changing get_ref_buf function name to get_ref_buf_vp9
      media: rkvdec: Move vp9 functions to common file
      media: rkvdec: Add VP9 support for VDPU381 variant

 drivers/media/platform/rockchip/rkvdec/Makefile    |    2 +
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h |  234 +++++
 .../platform/rockchip/rkvdec/rkvdec-vdpu381-vp9.c  | 1067 ++++++++++++++++++++
 .../platform/rockchip/rkvdec/rkvdec-vp9-common.c   |   65 ++
 .../platform/rockchip/rkvdec/rkvdec-vp9-common.h   |   92 ++
 .../media/platform/rockchip/rkvdec/rkvdec-vp9.c    |  121 +--
 drivers/media/platform/rockchip/rkvdec/rkvdec.c    |   73 +-
 drivers/media/platform/rockchip/rkvdec/rkvdec.h    |    1 +
 8 files changed, 1537 insertions(+), 118 deletions(-)
---
base-commit: 1229e2e57a5c2980ccd457b9b53ea0eed5a22ab3
change-id: 20260726-b4-add-rkvdec2-vp9-vdpu381-3d1bd8fca4f5

Best regards,
--  
Venkata Atchuta Bheemeswara Sarma Darbha <vdarbha0473@gmail.com>


