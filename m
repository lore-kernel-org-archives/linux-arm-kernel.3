Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015B4FCA16A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 17:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=; b=PWUB+CMEbfvCgI5rCU9ppxo+bd
	O43SCcyg+2iZvoqAfkD4lAh4TzP32knD48iQBUKNexqjoUUa3Ua+d3dlpjuo4NvWh3Ke43yG9RAWt
	16d9Ttox2nbbNw74TDm+LfYWTZkUVNVDTm0DSxtY/HalF9V80ScukkXyW7w01tJHx5x7bZ5KeU9tF
	734Q0uLHFtIPrAisAjmkXhqGNdk0wMVDW6YG/esCaiEbbVe3wX2Bv4kbhKEo85FGNWEQflzBGLZTy
	qrdiyyDjBjzOLhKD0Jd6Uzr0Vvw4mQWzRJiO2hcGp9fM2rM7nlPI8vkySnTDu6Ye0kUBKI1FmHGU1
	iDM3Q1Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzerR-00000007rOb-01Sp;
	Mon, 09 Mar 2026 17:57:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzerP-00000007rO8-0u2E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 17:57:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439b2965d4bso6969492f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 10:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773079061; x=1773683861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
        b=WDJuT51bMyiRCeKfabUPjTACt/znGCYnXP5Va2B+TxxzapfcGi8vvdohJBhRhheUqj
         e8FNkBenBQGGdZW4ed963267EAECfzexBtJa8BuQbeLBkdXCvJLCN4Se2ktgvCsnH4TJ
         w2sMr7U8hLJ1DFxMt4pGWVNtnxPh/ZWf+R6cbtyyj/c0ZE4jtZH6SDhqyPQAaXq540Jb
         i4G2X7HoiObMujbofX9sQp9Sry5Brl5WHCQAvc/7wCW1u9crdOYQWGAVA0jhkZ1FibLG
         6eSOWPRX9SaRT5nrovI+DqsQgcqMltAAOmCaqx1lnc9OuNojwHLnptRrNfeUETd4zbDW
         6DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773079061; x=1773683861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nUKSwJnAjG3KEbJmiO+Wt70o4b5Vf+pCbPEIwqMHXPE=;
        b=megRPn3Bhu/y6wH9yaPgzwLgIDockKj9VaNJTa1UwTRWaRh1dThTwQVSQRbFmv+Aet
         ZUKtmVDqgVlqxdS42I8m+JZrA2NBMbD8GUPx+/xlMp1vt1hRb2PLkL46EhhymBhBAi7n
         x/IGhLTWVqQEQ5nOHLrNZtBLZJCquTrSYh3XLYmYiesYveJN+iIz3+fDiiXIUWGOmjqX
         OWWihKu/xyB72JITO3z3lCWFasUF6yrpBnL2ZEgAXLts/HLVznDsSb9G0tL4a26JevG9
         xfHc1nBd+jQGVW7aGRRUXS2RrD9HCEid8zDwaPm9PS+2GAND/ARDr2akm+FQux8GQfYq
         7tYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxWPEQfw8wntCB9zzxz96cOMB4pxO4phWYVeEZNWUhF8rk44d4ZKYP0lvXc7H1pQMTTcHSuxK3EhppoeIpdY3x@lists.infradead.org
X-Gm-Message-State: AOJu0YzqWJjGwggsJ/vrceSqe9OtEKzATG/ecq2THzBy4PaL1bEoCq9m
	DWI5cNCQjq8e389Q0nCI2GPNp8sGR/LkFxhF2owOLgOARWEMgM7cLuXO
X-Gm-Gg: ATEYQzxae+g/kDrmEmzJQx7jQ8om9cxhmqOC5Z+l/sspCe8g1IsGBNdLSppDhJQ5AgJ
	enb4k23y31MosIOHcEEVQ3wKbkUp3aY0pa8BV2lKEakrh0L6hul3mbBAUicKLJ5QfX8ZVmPcjWe
	cM0dP7+WXIJAaFiIwmyv/FmbDOIFRnPT7weez9z1mZs83wEUNjOKwzcvEefS8wpNtQ8LF1cZaq0
	m7EHY8aZ6/OZ9oRXbo/eSHhB/tRhOliqhVzLVoQMe4b2rASFB/DE5rD6oSnzxDNgkkPHfSpQJ/h
	b2x3+ZGO4mS0zT7MJ5LR6KN8vjl7Z01EWQNooXuRvb3FYWBwOYLf7bPKAbBDBZiCyH/i97tcw6y
	YIyQyNM/CSVPVti/LNj8zKwlq/X8O1HWKoRcNSA20v0nX1mX4W6MpOfUVACONuvdCestF2/fDut
	ZMXw106yv6N/4vxaMZcs0OS6R/TlL+9xm2k6P9HvGBBErH1j5mdtP4EhVwtA15tBWhsyIniArnJ
	1Eb7g==
X-Received: by 2002:a05:6000:2506:b0:439:aef4:944b with SMTP id ffacd0b85a97d-439da351a36mr19860816f8f.19.1773079060736;
        Mon, 09 Mar 2026 10:57:40 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97da3sm31230324f8f.12.2026.03.09.10.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 10:57:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: layers: Use drm_fb_dma_get_gem_addr() to get display
 memory
Date: Mon, 09 Mar 2026 18:57:39 +0100
Message-ID: <2820486.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260309165635.1138413-1-wens@kernel.org>
References: <20260309165635.1138413-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_105743_294505_A231BCF5 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Dne ponedeljek, 9. marec 2026 ob 17:56:33 Srednjeevropski standardni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> Commit 4636ce93d5b2 ("drm/fb-cma-helper: Add drm_fb_cma_get_gem_addr()")
> adds a new helper, which covers fetching a drm_framebuffer's GEM object
> and calculating the buffer address for a given plane.
>=20
> This patch uses this helper to replace our own open coded version of the
> same function.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Nice!

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



