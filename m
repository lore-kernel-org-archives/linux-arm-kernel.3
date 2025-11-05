Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A08CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JtKwR334IOcJSfMe+jz0Enq6IP3LE52bXJK9P+kWavM=; b=c8QA5U+Oaxc21d
	Jyo+e0I9HJPg5aht74wY2NXnGlMjpwSN19xT+hytcxY+LQvVe4d/jEBs273mBAd3xkzvWpFoLfTTC
	+e62h1rJIRRbiCOZXRT757Aeo1ispHI/5vlgeqGsgTc6khxmjb2gLap0Qcoon0vOy6AGmHnsLMNww
	kISASLUSySbCwyU1Ughql+a0NTXBUr8AhKrlwgg0poQdJaiNXIr3IQ01j+ou/VZ2NvxJBRRpW7MLK
	cyT/4+PGzUwaRg2wU0WTVlZpJwvaBe+GIoX8dqt1ufoUaoAwXXGyk7KuaLi9CEM64gS6CLui3umWr
	RDUQZBiuofGj+hYIRo0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGerP-0000000DsE6-13OE;
	Wed, 05 Nov 2025 14:51:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGerO-0000000DsDp-2TYf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 14:51:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A46236021F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E90C4AF0B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  5 Nov 2025 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762354301;
	bh=JtKwR334IOcJSfMe+jz0Enq6IP3LE52bXJK9P+kWavM=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=X+8p8Q8jfvgeoUWRhIia0snZRJ+ZKqqo/hRQ0KgiupludUAqi9vdAWPMg+gaEbl5s
	 H5yYahlbc62wjGfemrYJ/Hu6YXxN/OLnggTOwRJLRo9Te/ROWElJTttF8CjHidP12B
	 abgK39PuSyhW1c5oWtAzFxjs9JgACIximtyVRrbnb0jxJunaKlmwnSbhORBC6F4l0x
	 GH/rcMxpmkougg2mrxUBIaF+u1EQTWK3l+buE8ugoSIle7Ji4qlST1C+CyXZRnfPPN
	 S5hpOmbeaT4enhnH7Qb5g+GlJ9wT0YWUS6nLhS+U8v2O36WNdvUduRveR95XAOR9MD
	 LLQsCCo4L9FKw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37a5d03b53dso69931fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 06:51:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQsKdUhJ/Ul+5Dm12hV+WOFCDyNA3J6fCp8auDp031lIwp5auiJD8HhcwDZcyhlbV0kOHHmNfQavwJ1BiW6SsR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy/SEMA1Zd+0uXiWHAjE04qok4qIEfNKhc3WjjKfUCtoQf3NwX
	DrVkrSbYOCcr0/MpFwtt+ZUIIj2tNcRChpD3C/DaHXXu5vu5woCu0e1X0l94DJKuwBSjwYj3MQU
	23RAP01wYGsOp2fZcfQR+T2trTVcP28o=
X-Google-Smtp-Source: AGHT+IGIEAVXYAC5/mxxWbiGcaY0AYo/5s9g7cRbmFp73EoeMVAloAa2YGLv9a0XjgeGIWx0S+GlkPfBvf0ZgrTNKUM=
X-Received: by 2002:a2e:be1b:0:b0:378:e437:9085 with SMTP id
 38308e7fff4ca-37a5148889cmr11360031fa.37.1762354299760; Wed, 05 Nov 2025
 06:51:39 -0800 (PST)
MIME-Version: 1.0
References: <20251104180942.61538-1-jernej.skrabec@gmail.com> <20251104180942.61538-6-jernej.skrabec@gmail.com>
In-Reply-To: <20251104180942.61538-6-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Nov 2025 22:51:25 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ETD-x=CW+xUCcz9xPv+MC4wYMu+BRXk1znCCp8cmMnA@mail.gmail.com>
X-Gm-Features: AWmQ_bkW3EOy2EHaeuPwKcFuf5kSmMWMiTBiqTH9At9mwTTrXhAJeB0YdOMrK5g
Message-ID: <CAGb2v64ETD-x=CW+xUCcz9xPv+MC4wYMu+BRXk1znCCp8cmMnA@mail.gmail.com>
Subject: Re: [PATCH v2 05/30] drm/sun4i: vi_layer: Move check from update to
 check callback
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ryan Walklin <ryan@testtoast.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Nov 5, 2025 at 2:10=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> DRM requires that all check are done in atomic_check callback. Move
> one check from atomic_commit to atomic_check callback.
>
> Tested-by: Ryan Walklin <ryan@testtoast.com>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thanks!

