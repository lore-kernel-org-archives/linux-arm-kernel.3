Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BD1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 12:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=; b=eX4yMiZpMjbLSG
	dDmv+wHjkmClRiyY843r+jMz8tfmu7LnF9nhnHj48uYiaLW5ZvLh2bMEMdVX5ekDAjkS+997EPdny
	NWjkMcGojZzBetH+tpbWo4GXPCcU7dGEk64hTOu/DDAx+q2qlePPbS7uIwUPtpjaVhj83I6P9ZLS8
	h41EnwajLTt8q0KfwET4lMNa78uF/8UNCKFWxEduwOZVfHpsBNYvhR1v8zHdkcELaRf2SYCeT+Bv1
	2HcbBQdQUiUv+NfRpcS3N/9nYsI07AXiusN+h1oeOsokHoGAvO3fnm5Bp+MQWtYxsIRsDQG/yFpk1
	L3kSeTx0Rn7yzUiBJdlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFW3-000000099z3-1ohE;
	Mon, 13 Jul 2026 12:12:07 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFW1-000000099wU-08kj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:12:06 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc61541f8cso45632015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944724; x=1784549524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=CVQ9qVHrhpdT8Tn017WPlmouXXLThonLMGsGlWeG4yfXffo6W6yvr1+Ff4ikwIVZWj
         8TC2TAhrNKJH7rpMfSUUziL03H8Cfl4d04Blj3tf2/W7vB5RoPIDEa70GlsAgLT1XGeb
         5QNXd1EP/3Y4HoPqpMncDthlAKDwGeYgcRO1rATxcLqkE4s/saStWOKSdtgh2dyjJLJ/
         jGHmhfC1GM90ybKZKzLlxSJGf56kvHckWox//lBYzHDOSdiXlS8Ms5RQftvLgzw5ef8E
         mIo59an09WzCTVq+a/r4nibvfhbMm5fIvVA4jIqPcR43Uq85AP1wA5h7KbEdINMJUaAG
         Qw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944724; x=1784549524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=mOtbA0afhYNtyrRqchngVB5E1e71LYiwlu5p6lXdzOls6kvhp2Y1dXGjJQzwTBcnsN
         CSxAKCK83h0a9zXnKuKSHNjeiSulLOifRCQ1jpi8P1T7GMLVaW+Wf/Wxp/he/AWbA0Ve
         04Mzi0rZlVM/13lP4OzUtABtJ9BULl4YgKeMnbU1Kk0s1K7v+8lVXu+eVaTTDZHbuuMA
         lgiUif1Wfi/ZBPpLwLiuwvf5pfELgd65HuD1JJPPAcw7bVPDD1OlfabCqPknXdkrEa4w
         MQcAsHiIOYxtwyOuzd8TAE7N3kQamHNRHQ7tndX7EyKu1p1Wj+td1IMqt8vHKzpb0ZdY
         8/UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8885lYri1FWhOLXLMwfZX/5WD/BE0nEpRxtyCj+m7A8/axRZmWTwfIATo86cG6km6Xn9o+NRUnnaelm2hCw5o@lists.infradead.org
X-Gm-Message-State: AOJu0YxiBm9Zo1m77VRJAPyCheXg8zX3d7Ep/j6mO5HDah5Uyw54HotC
	BQJ9RjcLBc6w37fPZxGXXhVplqqLGLqGBMYOJ96GMls+Q5WtwJ2CIIQ1
X-Gm-Gg: AfdE7cmaV1JYTFPMLGjX65L210i3Klz2Ea2tfn2f8YjWCCG4+PfB4zXaNErU7HgbduW
	FkeMcGfTFij91HyXm7uuayDaBHPzatJxuMiX2QUWL+wVhlS2oprMCOf5beuCpgg0ce1iY1eZ1L0
	OuQ1OM++Hi4fLj10K+dVEiGmcs+puc2QjsWkQxJ6+xKj2DsonjNKNBR5aJxWDCJHQBk+6WU/d1X
	xpZkoo0MOUQXATlGvc6oTo+rA68HpUimEdFhZxUZRqlx2m4xv7fupDuX9hrZz8CoiodAIZ+rUBN
	zfdTBDnEVFG8UW9yCXgG/sjqs+Asj1Fri4BEUNFEbiL9inWWK4ApFYCSr9u8LtOBn95NcfiemB3
	SjPZyj6PnzAje+u85pO/wO7yyV1YSUl5bqBYMcqolS/j0taPHZdg7gvWopaOCfYDw8TEFyJyaow
	q/P307vKou7mcK60M2vSMgFQhbtYrf67U=
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15332791a91.4.1783944724165;
        Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:03 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 18/19] media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
Date: Mon, 13 Jul 2026 17:37:13 +0530
Message-ID: <20260713120840.17427-19-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051205_111665_CF801DF2 
X-CRM114-Status: GOOD (  15.31  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

During 4K video playback, the hardware Elementary Stream Parser (esparser)
can rapidly push massive burst data payloads into the Video Input FIFO
faster than the VPU decoding block can consume it. This causes a buffer
overflow when stream usage breaks past the allocated hardware boundary:

[ 1852.587956] meson-vdec ff620000.video-decoder: VIFIFO usage (16779003) > VIFIFO size (16777216)

When this overflow happens on Amlogic SoCs, it triggers an invalid memory
state, leading to stream corruption and fatal kernel panic lockups within
videobuf2 error rollback handling routines.

Double the parsed bitstream swap exchange memory pool (SIZE_VIFIFO) from
16 MiB (SZ_16M) to 32 MiB (SZ_32M). This provides a larger canvas window
to cushion high-frequency frame reordering spikes and prevents the VPU
from crashing on demanding modern streams.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d33cbebc4453b..824e2f156adeb 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -29,8 +29,8 @@ struct dummy_buf {
 	struct list_head list;
 };
 
-/* 16 MiB for parsed bitstream swap exchange */
-#define SIZE_VIFIFO SZ_16M
+/* 32 MiB for parsed bitstream swap exchange */
+#define SIZE_VIFIFO SZ_32M
 
 static void vdec_free_canvas(struct amvdec_session *sess);
 static void vdec_reset_timestamps(struct amvdec_session *sess);
-- 
2.50.1


