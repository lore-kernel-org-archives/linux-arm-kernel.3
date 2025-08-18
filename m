Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEC8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=; b=oUfc5fzZs+lo3oJTqCP2rQHXiS
	U7fG9GjD8cdtizPiDbDbp6v2DmvCaUW1Xl5pu/pdCgkmhpll1GYfk9mz+9sb58xO7L9pDORjWOuIZ
	Cmf+g4BhImZBFTU0phvoZ795iXTA4rG4gO5FnBDWdjdfhzZbQ2X8M40NNb/8HmnyKZluIfJxStt99
	YAldESQOh2u7pbL7DZVTApI0mUu363WebsDgatW3dvsYpckhQLSdoWBUVdAlvwC8DHLlF7YDYpqFP
	ef5j3euan1gr/nbGOoN5REP6l5dxE30XGRtPnmuElt/+k+PH1TQQFL2MF2+KQwZqNjIGb3KpBdfCe
	mMtjUFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06d-00000007ZVV-133N;
	Mon, 18 Aug 2025 13:40:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwDp-0000000749M-1BJf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 09:32:10 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b47174beccfso3342110a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755509528; x=1756114328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=;
        b=ctAghk/mzg+RKqasJYNy7RhDbHJRU88upFqVqox0sFZpS/onn8JbuMAkRgbV9u/Q4/
         ZZ3HcFchaF/HvA1wotJTT2iO/wZgxyX1il0MpUhbSwcbKYXTyhBOmRWTaOdMANG8bfPc
         CxNA9bxEwHm9EYeSHzMZqfpUecA2/+EwIYKZbmXS4Co+MZRpL9m4awPY+cObu77nRUGX
         h5dE3bsLfx/MHrO0mt0QzkOk1wboKK/txKouJQNtI6Xk5fTeB4VNlbuLZ37qaYte2djb
         wv1B7e+TA6qMRIj+XjL48x0ik6lQtJ6lZpzdW5osi1oYC52hnMTU1b/ZGNfAqOwqKO/3
         EgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755509528; x=1756114328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHfYVwbmP+gPFXz8CWcley05MtbRCnNcrivNbsDjwVo=;
        b=WmdoAOtdeuyHygpvhbEjTIQM02eT6OJde/5nWQ/FZlubBR03LthW+ukV81Ql9oZibd
         r8CMOJGcNVo/B13EgLdF2bGE5UZNq4U+p/GV5AGaGMOm/QVyVOIRhXvrh7F49q8guQam
         OBk/vsyjvRAQpGD+Sd6cVGXhEPPxMMEpB5haOahmlaGYojPC9GE/bw5ndn3mka4zc0Nk
         u3v7Y53BnIbogW8St7EQYIAvfv927kHfFBg+gx1QuI1gbtw+QPH1S5abO+Nl3wzoBW4M
         UscxWJtoR83TVe/xVJyMwePPF8E41yfoh8mf/8kaB8nV15BsLtd1UsrQPzYd9Fv8x8iJ
         LVbg==
X-Forwarded-Encrypted: i=1; AJvYcCVAlXQ2YRHj2YsuKZtbdRhrkTbWrdJ+KDvYqIrVu5wGS6Pt1Pk6CLSZlC5+/Iq9a0PIiDOPE4Y3d7NHczp/kIkj@lists.infradead.org
X-Gm-Message-State: AOJu0YxQWr3FC5YR/8wKnwi21P6JSjd6uY66Kh6jeK/xVjbx+rCrhPao
	EiyXBaOrnuYQg/OUVvkN8z3xyuJf7K2iJg2zTRwLGBlNRTEIaSk7PIgx
X-Gm-Gg: ASbGnctAyXuS/me9y742VdFfHbFvI72TJ+3DtYfTEJ2SQHNKHSECDOqqBMgGeqSIilX
	ZT4+xELyvjQC6SxkViEKKm0AhYQsu97Ej/GvSyLfOkk/u4EIgZ4k7RxCtILdZD9lIkqWeFiG7mN
	kzuccsd4+GsdEK1RQb/GCCXy1WCRjmLebAw+FeO5nj23UdnR6OgWHIwLy9Mq9BivpsT9OgC24XH
	dkMw+1FvsRNNuG5PMI7c9Cs8YCdpyPburm1rjPoFoUwLSopsinL4C//8tweYz77MPkVOnchUSxA
	8Z3oWe0i+TTqt2inRM9/qfytuZHX0Tm273RHiTU6kUJtubqnmH+ezaX174PK6X2YDBhzOUxc0Rt
	aqoFkBMlW96tcO5SdBuhnWzTQsejG0YdzrIObwUVzPMMIpVpLEy9T
X-Google-Smtp-Source: AGHT+IFCRtT2UOKN4GdguapaDt33D0B736i93LRmByQ1B2I3PXdFqVr/n+fJRYAuoJpHAa/pY3mMdw==
X-Received: by 2002:a17:902:e88c:b0:234:b743:c7a4 with SMTP id d9443c01a7336-2446d8b67f5mr216185465ad.38.1755509528108;
        Mon, 18 Aug 2025 02:32:08 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:46d9:adba:d08d:ac6:8cbb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0f007sm75092045ad.69.2025.08.18.02.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 02:32:07 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: alain.volmat@foss.st.com,
	mchehab@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] media: v4l: Fix dereference before NULL check
Date: Mon, 18 Aug 2025 15:01:57 +0530
Message-ID: <20250818093159.612208-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_023209_322141_C85A3679 
X-CRM114-Status: GOOD (  14.54  )
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

In 'stm32_csi_start', 'csidev->s_subdev' is dereferenced directly while
assigning a value to the 'src_pad'. However the same value is being
checked against NULL at a later point of time indicating that there
are chances that the value can be NULL.

Move the dereference after the NULL check.

Fixes: e7bad98c205d1 ("media: v4l: Convert the users of v4l2_get_link_freq to call it on a pad")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index b69048144cc1..fd2b6dfbd44c 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -443,8 +443,7 @@ static void stm32_csi_phy_reg_write(struct stm32_csi_dev *csidev,
 static int stm32_csi_start(struct stm32_csi_dev *csidev,
 			   struct v4l2_subdev_state *state)
 {
-	struct media_pad *src_pad =
-		&csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
+	struct media_pad *src_pad;
 	const struct stm32_csi_mbps_phy_reg *phy_regs = NULL;
 	struct v4l2_mbus_framefmt *sink_fmt;
 	const struct stm32_csi_fmts *fmt;
@@ -466,6 +465,7 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	if (!csidev->s_subdev)
 		return -EIO;
 
+	src_pad = &csidev->s_subdev->entity.pads[csidev->s_subdev_pad_nb];
 	link_freq = v4l2_get_link_freq(src_pad,
 				       fmt->bpp, 2 * csidev->num_lanes);
 	if (link_freq < 0)
-- 
2.43.0


