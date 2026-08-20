Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80E2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 07:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbeURsaZwGloOgSd78K2HWYyPVGuc0pVvEWglrxrqL8=; b=n9Licdy9lS+gr1SJDRva0oYG4t
	em+D8UmqG/de+O2wx9u+ad/Gf6soHhWWz4hlffaz7X7uPExnXjZdvGLWZiOwTDr9UGR4QhTcs91IQ
	T0IRDia5EsNhL43kT80XjPc2XcY0Io2DYJQDI5IG6VSxIKHkyb3aacaZRY0wOB+yPQNDJL5jl/Zk5
	XDt/dhTdOQIL1ar4ie/xLQrmscavDeZHNB+3IF+bjR/g9QrNIdgCCKv9kRJi0C3P6S34WkSOuLgpr
	Sgpchkzlum8oFZEDkUG5g6whJybMU3qjBG86FA2fPRDrpU0DmlgeF+BPvMY3OsGep8DrhIx8gDe3f
	fJv/dY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx06-0000000B1UD-0Hr3;
	Thu, 20 Aug 2026 07:15:46 +0000
Received: from flow-a3-smtp.messagingengine.com ([103.168.172.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwx03-0000000B1Tg-033J;
	Thu, 20 Aug 2026 07:15:45 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailflow.phl.internal (Postfix) with ESMTP id EDC6813801CC;
	Thu, 20 Aug 2026 03:15:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 20 Aug 2026 03:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1787210138; x=
	1787213738; bh=NbeURsaZwGloOgSd78K2HWYyPVGuc0pVvEWglrxrqL8=; b=K
	0jFb4/d1CpcKo1HX/8VfKwW6Hx1vZvvXrEyP/5yrN6/x855ZAo0b0CtteyxtSwwC
	bmQ9H4h/AVW58NuqwBy0Gp6o2bgImawTVG7Do572SnOmJZ5cAr3pOAX52RrX91ly
	eWHsX+aeIaz1gzGsPoEQOxPD8UYiP1jjh6kxvaFN6jaO5ejaFqIKqLOTN5DtUJOI
	89440oOHstaRlBBZvej8MWe+gxu+4L0gNd5SA6YAlLtcG/qNPkBGCXg7QYrOQoIZ
	0RBiCo95XGrWDo/5cqraU7yfWVQy2GbzieBcOuPtEDtc1Z/W0OS6G4duwYM7iUWN
	YWCCmI72D03M5jrlQZp0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1787210138; x=1787213738; bh=N
	beURsaZwGloOgSd78K2HWYyPVGuc0pVvEWglrxrqL8=; b=Ww8v8yvGKVvatvN/O
	gZzat9OSkbxvf8jFfIAXI9ZPXHDQ6CFew7M9RqsNA3V51E6sCsnFvI5WrvHgHUQ0
	t/7pHUfF4Q+Xoib31628HqpTN+bEjcSn6Vts6iZh48WGAfz+SOeUzWxZ0G/E3BAF
	7b3aE91dtbYKJBXZFVctFl5JYZm+11Ve6qfqtquMK17mSjbSD0IpVTZQxv7i7QoV
	1smT0l2DLPfovxuxwNkbCxIb40SnoDrbdh99RWBqNocJ/VzC0xbPZz2YcBDLS7O0
	EnI9PylxV/qEcFaDTsgnO9JHAeqLB36cMuni0ZUoejiwIrJkxGxyN1ZGyl/bgJQ0
	rJhow==
X-ME-Sender: <xms:mamGaq-mYKwMCO8srK4m4uhRjgpdRY7S3WxBt6HqonLW50scu4fb6w>
    <xme:mamGai5DrmhbAE0qTysfaDrfmJG8koKD7DRcYSeyqqkWGXjcCOGMgvWeVDIIkUZjt
    1DecO3ybuyON_FZDY5DwiR0bZ_v_LwJZXBgFPjpVULIhWvho2m_gD0_>
X-ME-Received: <xmr:mamGarmwcH4jjfSI8J6azEi0HnLk-qkSYz0mb_0er-46TwljcwK2Mq71nUBUSKVM6FCtJoDnwA>
X-ME-Proxy-Cause: dmFkZTEbYH6W/Jv5EOcNU/UGNKbaWHlpFKgkOqoS8ZOY+6lUca42/VT52V21DIAmzf0VLp
    4JL2Nbtbpbc7wnwpGlPR2NEaTg1SPaHEcwRx0A819CuKT+V7dDvirA/B7+thaB1YYUenNu
    KIQzCZMCTa/Gqi5d2r3V9/5eo84OsFlx5p16ca1JOtzHbNJrqNVh796xW9jpJYjmfhxZC2
    +YDQIpT01UxJ8v+uYtlcKjSsc21iLvXBUltDr4/zG7AHitTRnLvidCKouvqLoYLX4fq8iG
    e4xNWQvEbyYMdim5z6TObfkGR+UJX19Fe+lyOgUaTJ9Qu36wo0kFb1y9WRAr4xIZ3sLAbo
    0JmaEd/HdiTeMgVAAVomxfF6pP95FnyvD4y6fpYOi4T26ciDecsmym7m5SBITmSWYVwUSH
    DWowJnn+6MggbJxj98BckNKTy0zidZsKncFWpSJ7RP7SX2fc9lxE6L68cIIllR2mhNkiJW
    IWhaQIgqqUCnTRj4oGIt70qMZg4tkgfSTaL3GTjm6yHRnKSL4P/4wDLZO4jzHic9qkIkTa
    fGyYEXY3lARrn8U7iPypffN+D5/N1qVpscFCAIH+lWNUv6BeMlxwrTIiMjX+TT0K027O0f
    +o/lzfkAn2ZUrCXoXKDhlDtNeC2KkrEDeO2CTqFdqZhvjvW1zSI7LOyQhTOw
X-ME-Proxy: <xmx:mamGatH6xc9SJVl3qA4rVQDPqgoIuy72PE5xTra5drleDMWCxpmLlA>
    <xmx:mamGaq_UncSb-IGXx0ZaER7Y1PxNW5mHDmVYEDFYA4UrIBPoaRpYTg>
    <xmx:mamGammbgU58YYswSD50WKrNCaIK4gQuUC66HJC3fonxhn7FHMMLsA>
    <xmx:mamGatCcZgFkHCr20WCp9fk2XZnu6thKyuhRmBSEPM9Ln8yNnoLK-Q>
    <xmx:mqmGalvoPelhOEtxWfc98y6fufa2Kg707HV68t7uAX7gqGlk74TA7Vnw>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Aug 2026 03:15:34 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: royalnet026@gmail.com
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	chaoyi.chen@rock-chips.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 08/10] accel/rocket: add RK3576 NPU (RKNN) support
Date: Thu, 20 Aug 2026 22:07:15 +1200
Message-ID: <20260820100715.750660-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819184838.6723-1-royalnet026@gmail.com>
References: <20260819184838.6723-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_001543_525180_8611C221 
X-CRM114-Status: GOOD (  15.73  )
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

Hi Igor, and the list,

The single field sweep I owed, and said on the 19th was late. It is run.

Each of the five fields where my 0x4050 differs from upstream's 0x124 was moved
to upstream's value on its own, with the other four left alone. Two shapes, a
5x5 convolution at 128 output channels and a pointwise at 88, three baselines
across the log with no drift between them.

  field, mine to upstream    output                    completion
  RGP_CNTER   8 to 0         wrong, 0 of 128 and       no hang
                             14 of 88, maxdiff 255
  RESERVED_0  34 to 0        matches the baseline      times out
  SIZE_E_1    0 to 1         matches the baseline      no hang
  SIZE_E_0    4 to 1         wrong                     times out
  OW_SRC      1 to 0         wrong                     times out
  upstream's whole 0x124     wrong                     times out

So four of the five are load bearing on RK3576, and they fail in three different
ways. RGP_CNTER is purely arithmetic, it computes the wrong answer and finishes.
RESERVED_0 is purely a completion field, the output is identical to the baseline
on both shapes and the job still hangs. SIZE_E_0 and OW_SRC do both.

Two things to read carefully rather than take at face value. RESERVED_0's score
prints after its timeout, so the hang is the result there and the number beside
it is colour. And every timeout landed inside the entry that set the value, with
a health check passing after each, so none of it is a hang leaking from the
entry before.

SIZE_E_1 is the one that does nothing. I have left it at 0 rather than moving it
to upstream's 1, because two shapes is not every shape, and written into the
comment that it was measured not to matter. If you would rather I match upstream
there and shrink the diff by a field, say so and I will.

The merge request now carries this table in the comment above the register.

  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43804

And something I should have said two mails ago. Thank you for the v8 Tested-by
on 1/12 and 2/12. A differential base on the same machine in the same session
was more than I asked for, and the row that matters is the one where the two
kernels agree, 12 and 8 induced resets against 12 and 13, all clean, 48 of 48
both passes on either. I have written to you twice since without acknowledging
it, which was careless.

Where it lands, and I would rather be exact than generous to myself. 1/13 is
unchanged in v9 and your tag carries. 2/13 is not the patch you tested, since it
folds in the interrupt mask you raised, so I have left your tag off it. When v9
posts I will say so on the thread rather than quietly carry it across.

Have a good trip.

Regards,
Jiaxing

