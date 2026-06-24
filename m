Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF8CCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 06:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=; b=3lbQ5uONrOsSrEBWzy5cd9ohE/
	WkCGKYOGzy9FRBpsq3MI8j5BeS0TtixgPm0qSQw9J9EE1DPuw1vtpwVv+sZJVZWD7HoHWioKfUmTa
	yF1bBtC6oqFx3wJtLS8JjDnnLhcj13G3SuOqGyFvCbwa9rEB3x0QnocWYlFh9EoRxiHiuLIWCSzAf
	DkJzyJu3nSqbgZgZbciDJdgDG+35+oaod3tJ2dTZlGZ3Et69wBe/8NVJ8IJXam3jDPBCz6KR1abq7
	Am5Yl+W5BFLPVIeuP4Q6IfNHXwfKY31hp/hqdcmMSHzpNX68ArQMeaTjbGCxPa8LPcYmSlaWjdh+B
	iCOYxhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHYz-00000007GHf-05wE;
	Wed, 24 Jun 2026 06:58:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcHYu-00000007GGs-3zDc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 06:58:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso7196635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782284294; x=1782889094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=ctVUHL9TuBRdYy+RplqmPsPT2gSQG/mT3EFH4blmkNuzCPCz928KM25l07c1GzmFKE
         lYci9+th6f6L//wFxkO5vXU8D8coa0imNeyG7DYcWysq0MXVUiQMiHbIfAvQK7tSrtUh
         12RVWgk4wOMdqsutKl3JFp9Gactrfi9pL6TEImPXXPatjsy4awE5lSuzFfrUcf+jmlCE
         Jk2MCMBHQNTcL2UlEEpsJSKSGI+Y55As4WxEvXJkheippQjw7oZxDVsaADK2pL6SV9y6
         mcqFj0lKgkeGaxuPJu8GAxXKBhmkVRHfazMCSpIqMD17TO/zeMpQ4o624f8CrPS24TqO
         7Dzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284294; x=1782889094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHjTaNhWGw4oT+1H9Ma8AJEBTl6gVGKQowJPh+3SQpo=;
        b=BbKImkFOD+QG5sIjwmGiMvjoXXP/cTm70tlO+rS+x8zKC+1XnKoAvWUFSrADID+NKO
         W1szyKn+5U+8juuKxLNDoHyiSxPQHBIChQjE3RRYrO0xeISAjeByDHL+Ij5GqNJgsGpQ
         ZlB4uufz+dJXymzY58mtBErDnZ2t2MwIWgxq/N1eK/Tq4e0DAWrKyJJ1DHH5RXsHyLpQ
         aXzIkSy5/QZcpKUy3kjg+wtlnzbANQQanb2d1JVh/9RBw51AcUp7q30FY6FTOePm1vCO
         A8GJGfS+We3tBnf3/myfc5hh1LDNLbsVLr2YNMlzu+34+8foPH+cWL/dew+ZfB1+SlBG
         hZ3w==
X-Forwarded-Encrypted: i=1; AFNElJ+yyXuBcZJhxp/X67Ou4dTMIP3Tsg2qTpEcfkhHokkpHqCBrOsDRH/KRwUbJ4mHRY2QGa1uTVyPpV2q2jj5+PH7@lists.infradead.org
X-Gm-Message-State: AOJu0YwSKqdTLx320g5LEzDeYLyO2eEXAvJkjOpFtUxVa5vqWIZObmoz
	HhqO3emWrayKCwO92j/bht2bH/mWEoQWZai3oQC10B9mzTB7Zy2Caemv
X-Gm-Gg: AfdE7clTz03P6pyv82bnMyNqzn1YmvGFWGea2jemjNy78KJugo3riNM1H1sC4NEpS5c
	cnTnCW+uraxFNswBdoJz6PHqqOGvPpV9CCBhgWfihCbEM698STeYaQjfzAylkj3EFtcSyyst7aZ
	GN3lcw+E2vFPsXrLTqVrxV9MGxTuj03nndPddtYJEvqtc6uXyDVl+yx5sTBB/M+LMz58k8rkNIC
	LNauozWc4lBalkZquvRipzSIMzdLRO+yjVp/BQeV7HhNDpAX+of1Tbm4KN8M9Uo5i4aQzdyWiY0
	YY4to/ZXIwBcBiuZnA7KTLrCOPSPdYl8yqwlPiUPetaLRw5DbryGcz0ojHTpL9TEuUmjTPN4PNb
	5B5MOxk2hyjwzSn+IbiEviolTejIQcyadgEIn1GzBNR4D0VCZSH2e41m5M+8Qi6m6vxQ0czlV3z
	yPTfBGMbLQcreDR5t8
X-Received: by 2002:a05:600c:a49:b0:492:4b68:c80b with SMTP id 5b1f17b1804b1-4926084aac6mr23722445e9.1.1782284293970;
        Tue, 23 Jun 2026 23:58:13 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49260d77e8asm20013925e9.1.2026.06.23.23.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 23:58:12 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: fix NULL pointer deref in vdec_try_fmt_common
Date: Wed, 24 Jun 2026 06:58:08 +0000
Message-ID: <20260624065809.2460720-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_235817_044455_665AAC41 
X-CRM114-Status: GOOD (  14.20  )
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

When VIDIOC_TRY_FMT is called with an unsupported pixel format on the
OUTPUT queue, vdec_try_fmt_common() falls back to V4L2_PIX_FMT_MPEG2.
However, if a distro has locally patched MPEG2 support out (as it has
been broken for some time) the platform format table does not contain
MPEG2 so find_format() returns NULL and the subsequent dereference of
fmt_out->max_width triggers a NULL pointer dereference.

Fix this by falling back to the first format in the platform's format
array instead of hardcoding V4L2_PIX_FMT_MPEG2. This is always valid
since every platform defines at least one format.

Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>

---
This fixes use of v4l2-ctl and v4l2-compliance tools when MPEG2 support
has been disabled via vdec_platform.c - NB: although this is a fix it's
also a rather niche scenario so there's no need to backport it to older
stable kernels.

 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4b77ec1af5a7..f3e7072f221a 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -504,8 +504,8 @@ vdec_try_fmt_common(struct amvdec_session *sess, u32 size,
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 		fmt_out = find_format(fmts, size, pixmp->pixelformat);
 		if (!fmt_out) {
-			pixmp->pixelformat = V4L2_PIX_FMT_MPEG2;
-			fmt_out = find_format(fmts, size, pixmp->pixelformat);
+			pixmp->pixelformat = fmts[0].pixfmt;
+			fmt_out = &fmts[0];
 		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-- 
2.43.0


