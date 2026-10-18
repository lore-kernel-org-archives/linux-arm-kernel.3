Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C29CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 03:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=; b=kx/AhPb2l/Y6sj0qSb1s/m+xRe
	ItVL2ZpErd02K5wjhL99EoGQXgva58i65goVoJJvYSwE8pu2YaeVBG7S0nu5dsmszu5bqR8Y4dKpp
	/jI30bsGXuNv1S/e9T8pRiH4NihE2OqY1XLdSU+8ePOcNkCIdlFD/f7Ah32bwQ+CEaDbZXgxqrRsC
	gFBe0Hql8ifPBf49KB9LInK5fbf/366TTUcwwJj6mbsP1efgReBXCGpLbnkSLQYH3lMTNE6eeBdcc
	Rsr5pgFd1L3LZxoaUEdPUhUwVf1YvysDRTAdgw6y6uPxKaLbLT5iHErwcFePaHtVYDj1Xur/YGiwv
	w2vRF9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIHRc-00000005Tj7-2tNd;
	Sun, 18 Oct 2026 03:20:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIHRa-00000005Tij-23tz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 03:20:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11899435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 20:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792293616; x=1792898416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=;
        b=MR97Hg7AQCuLofLhz4x9MJrCmMrqYTnaSoSkrBeOvirGbG+S3IGxjsPZuAfi+k1SQy
         tP/0MwcxVA+hgfkjlWxWJm+UAuQqqa07ezxe2eFdlVQ3ydDzksAnt3/Qyax0MnDXWyI3
         i4JJ3X1BejIbOaTiget8Zp492uL758aGPocPxXJlWr3ffVf7VfoNz8+EaVbNP/3LnAQx
         70LORHhQataw6aaC7yuqk5koJeV6KjSZRCnL8TD0kDaoi2xRS+Sm+IXNThmrn4SJXa/J
         eYBd1CEXaiYsRjxzOM3W0YJ6v0EYuUn4WFvhAFaCnU9EQayHwYrkzGvnjz4dLaDM+jgg
         EN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792293616; x=1792898416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLQLjdJW3G4Tj7KDthqH3nXbpV2+UVQVNC1UrvvZv74=;
        b=E//drbCfFu2V9hJi/Uc7VxNPeITVBNwqgVoP2oYzzbb2NoxS6jBaZJyS2nZr/I8PWM
         kT/+gSjZRD0NBWTzqK4N7gbuTAJ7RPg/ff3C23yZvJ945P2ZRyQ6nqa9lM8MPLHnTF3W
         mSza+jFbZGDtjj3z1utGzUz4YqzZDE09+koeNzC/iCUOn8hnNQ4qeJLM/SlSXhDsIbLx
         a9HU0dwBJUxQm1O+lSOVUzSaIkrUKffGNrZoDpy71YJCDkMDeGxzSc3dVBWz6IBtxlgC
         iP6DQdWUEFmCdfRAitSHuG3jtha8dywJnFxAPqHzF8jxBn6vigLu1hZwBzHXDV3AKG5U
         Di7g==
X-Forwarded-Encrypted: i=1; AKwUvBwYl3oAeZjLbqTLRjmNbtkcXge2d/Bts4gafTEeSjiXTVZeM+oNdC6twtXk5gO2yv6o1CdZpZsLZT56RUpB/ze1@lists.infradead.org
X-Gm-Message-State: AFq9FYLzwe3ZpF+dOQq2ZYc5KImF8EUYGsxfbjga6epcehcR/sWf7ccB
	Si8Wie3HexzVoaPYFzj3VUxq7EmsvzwZ1JumNSSbkoAbRCHgowxuqF1lyzO6NklB
X-Gm-Gg: AYBFou0usG49QrCfuibEvSvewz9V1+Q11ivT8xgYdeRjJYFZgy7xyX+zub/rLifqKUT
	+TNEz+h/vvMQQOBoj4FAIprZRGcJD83pbhIhNQrcJ+Pz+Vow9ReAdiuYTWzp+ZejRFu+2bbqQZW
	ARYV//+wl4fYiDCeNgD/NltQvxY91BKVOWfh6Wz7IhJS3GQiJPaBvhIxi/4/upplb7GY9VCpLUF
	itFTK6uLWqKumVZ9B1BePjbLxaAUj50I9MIKA1G1TydqwrLP2bhpEpDFRTkND81dYo3VQrJ3yel
	ttTtHNw98rSY7CZDwYTcFVVttIz9AKY76e/J5TrYDEihr3CbOL0DPUQEnJ+i8CWFmvERqooj6Cv
	OHQ/qfeXy1uKI2YyTrTVWu6MZbT48FWbGrP+dj5DvQiTEkBOSNuMmnHmfxAfmg6UgnN5cYVmrG3
	KPnjAvXDVxYA3XS3baxzCJxvRBO3F6ifAz3QUf08ePYpnmNWbD/TwGG494qpRqWAlY0kqa1SEjh
	gU7trlHABE6BM3BFj1URRwFHqn+t8ERACz/hWrnr2vCNJ8RShFgHZLuGZo=
X-Received: by 2002:a05:600c:1393:b0:4a1:d248:25b5 with SMTP id 5b1f17b1804b1-4a1d760e327mr80710125e9.24.1792293615541;
        Sat, 17 Oct 2026 20:20:15 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5008e7sm14202266f8f.43.2026.10.17.20.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:20:15 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: stm32: dcmipp: pixelproc: Round up the compose lower bound
Date: Sun, 18 Oct 2026 04:20:11 +0100
Message-ID: <20261018032011.207050-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_202018_553207_748A3A09 
X-CRM114-Status: GOOD (  11.39  )
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

The minimum compose size is crop / 64, rounded down. A 17 pixel compose
on an 1100 pixel crop then needs four decimation steps, which overflows
the 2-bit HDEC and VDEC fields in PxDCCR. Round the minimum up instead.

Fixes: 239cf9e5fda1 ("media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
index 7d8e5f0863bf..9055682481de 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
@@ -597,10 +597,10 @@ static int dcmipp_pixelproc_set_selection(struct v4l2_subdev *sd,
 		s->r.top = 0;
 		s->r.left = 0;
 		s->r.width = clamp_t(u32, s->r.width,
-				     crop->width / DCMIPP_MAX_DOWNSCALE_RATIO,
+				     DIV_ROUND_UP(crop->width, DCMIPP_MAX_DOWNSCALE_RATIO),
 				     crop->width);
 		s->r.height = clamp_t(u32, s->r.height,
-				      crop->height / DCMIPP_MAX_DOWNSCALE_RATIO,
+				      DIV_ROUND_UP(crop->height, DCMIPP_MAX_DOWNSCALE_RATIO),
 				      crop->height);
 		v4l2_rect_set_min_size(&s->r, &min_rect);
 		*compose = s->r;
-- 
2.55.0


