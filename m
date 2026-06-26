Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002D3C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=; b=lN5zi3NSRV5aJIMRRnHN0xdTj2
	DqVsxEtWUjRla54PJI/JqTf/eUOZLXJa8I8ZP6ee85CGyQgjV4GaCy6JGnri/A15jde4QRuaFDEmy
	X3MxzLvTmRPqW8+wXeiIvGiyxIau/h0mh6WrGDQqR/a5t3iVukwu9JEzP+9+RdMbjpqubc3iDygoV
	dAqXptRbTqAvFouojEKVb4COvD3cjOKxKWk7H1uYlGLblvfVftZX+QO6pC5/4felCF3fd6hkwwy4w
	csCZ5X5et2ratf2DFSzzlES8z8KNagbtLi4BqEtTE/vHQG9mqFKZydW8WN8yZhIRN8L/ml2VNRMmX
	LPQqfXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9bW-0000000BdzK-2dH8;
	Fri, 26 Jun 2026 16:40:34 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9bT-0000000BdyV-16pA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 16:40:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso15358925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 09:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492029; x=1783096829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=uBD/e5LiE4YVhI0zOgrUiAgETDdvNbrn79RscwnjUQ5YsFzjI3KfHwYVDX4LweR6Fj
         3J4MWMoOJ1D/aFMzoFdSmWPu2XR7+wP1mVSsEedAznpRzMnwKACjQ3eOe/GkuAY/IJiM
         8p/Yeya/a6RmlXQurK6zJvGSkeZPCpqa9hdn0qkjUnwUCffPDDVvyK19KXtFi1pjudvO
         UlIhOdXDfcaVfQGZAgy0V4KfgHgByA+QsTX1J5GVvDqBWiatCbzWWTzOlVZiDX/Wcnj5
         YulcgvnruDwbZL1XRoY7/hBGu1zByxWEUNvvg7PUDNZhefnxJUKzqLFiP5Hji/B7WhkV
         eULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492029; x=1783096829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFdrr1aj+JZ4LS4KDt4mRxZWjc/rOk51r42pgK7BZ1Y=;
        b=VC9gyd015EO3BPR4c+BWR4P7XCGPnG0fmGZsk+m2W1IkRCOl76dPwswM03KLbuZ4Ri
         Vr10ie6EOv9xntLDkhC2LH3GpoRKyEw18u8I1U0RRF0y9NiOpRxLauupjEEWI5WXxsus
         QywqOHlm4YqE5Kyu2YFBHIMra2objkD0sWCsojEhAKWBgHhOwLsRjpbninSt+2sL3CfQ
         QevuZqWCqhDpGIGmBHmPsNo+LEnPaT4/p+s5sufkQGKXr23Si7pftYf6fRvyFOJeiTSN
         FJxAJqai1wZbFU9O6o6dU6605rTzGo/vLLUshDw2metlnf5EJWH0fdKeWkvWki3R6On8
         JpTA==
X-Forwarded-Encrypted: i=1; AFNElJ/sc3m+z53DAU0/vcEg3GLIWdruMXuv2koifQweVFkY/dTsVuGiZqu4xx0GvuShuyazBIqFiwIxY0kRw6JxcIYw@lists.infradead.org
X-Gm-Message-State: AOJu0YxU48ZSNzIeAb4qNYoxxu+M4O0Eiz2LoZJP6603NoO2LPe8VJCb
	UkWdZB/uKkMJxaMPc4QM1EQRRc4Fu07cwlSLcn+dscU8+qCdGkEXXjxIMjmdcF+GobNI
X-Gm-Gg: AfdE7ckKQqirUAatIaM/ipu8eii/j8sFJXqU3BRI0qrqoh8fyA4c4Ur11cF3dAOqtOT
	Oy5oV+4G/NoGpgQDKnxo/+hmAap0RA/U3/+SK9nbGop4JW6xnm7270Vj9OnRYTuTXT31jTDnt3N
	ndnZldDhlvJbCAPdoEM3XIxcgoCvnAR5oNZ5z68WJou/DGO1wI6UsTA6fsvj8piPVJnUYliJy9y
	RyMhji9IUNxMKCCuqHlwz4t47kLKkd13zzOTvbgAeLvsDL8xkZYJ3EoU/22unODTyh78K2XHHHo
	YAcyugIdBQtuOxXIYFcTJ9gxCuB+0vUAKwLMFwD8yLuvukVOFHrE7HuVDTXcZMaIRIM4vFl16pW
	6jTSh1hCvp9aMtjgkQ0G8GJPLE387XEjJR5KmGL2z+oOD48PrqiY8vW3gPSfF/xdmxNE6w4PV8Q
	/btSkl4YdBFsNLVRp7xzHMkVr5GdvKVsvu5U8fVM3FZU+9e9ecZFxXBgDjI76IraXUkwTyXB4hJ
	LviNQJc6UxXqlkgk6Y2sxvcaAU1zNRcbDk=
X-Received: by 2002:a05:600c:8109:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-492667ca5fbmr116117235e9.0.1782492028118;
        Fri, 26 Jun 2026 09:40:28 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm30866825e9.12.2026.06.26.09.40.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:27 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] media: meson: vdec: fix use-after-free of prev_frame in codec_vp9_rm_noshow_frame()
Date: Fri, 26 Jun 2026 18:40:25 +0200
Message-ID: <20260626164025.52694-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_094031_351210_2E320E30 
X-CRM114-Status: GOOD (  11.37  )
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

codec_vp9_rm_noshow_frame() frees the first non-shown reference frame on
ref_frames_list without excluding vp9->prev_frame. When the previously
decoded frame was a non-show (alt-ref) frame and the current frame is a
non-show inter frame, the freed object is the one vp9->prev_frame still
points to; codec_vp9_set_mpred_mv() then dereferences the stale pointer
(use_prev_frame_mvs and codec_vp9_get_frame_mv_paddr()), a use-after-free.

The sibling cleanup codec_vp9_show_frame() already guards this pointer
(tmp == vp9->prev_frame); rm_noshow_frame() simply omits the same check.
Add it.

The fields that drive this path (show_frame, frame_type, intra_only) are
parsed from the VP9 bitstream, so a crafted stream fed to the stateless
decoder can trigger the free-then-use.

Found by static analysis; not yet runtime-reproduced (Amlogic Meson
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 8e80ecf84..572f418c9 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1247,6 +1247,15 @@ static void codec_vp9_rm_noshow_frame(struct amvdec_session *sess)
 		if (tmp->show)
 			continue;
 
+		/*
+		 * prev_frame is still referenced by the MV predictor in
+		 * codec_vp9_set_mpred_mv(); the sibling codec_vp9_show_frame()
+		 * already excludes it before freeing. Do the same here to avoid
+		 * a use-after-free of vp9->prev_frame.
+		 */
+		if (tmp == vp9->prev_frame)
+			continue;
+
 		pr_debug("rm noshow: %u\n", tmp->index);
 		v4l2_m2m_buf_queue(sess->m2m_ctx, tmp->vbuf);
 		list_del(&tmp->list);
-- 
2.43.0


