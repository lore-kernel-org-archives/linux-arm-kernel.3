Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD05CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QWA/oASaoEGszjXXYseH4EEvJ11J7t3dPdy+riQNNw=; b=FNZe/t0kXUbZWbuIS0/aqSDQo0
	FyJ7uEJ98UuR8+E3z9oeoOpSZS5uANzXXB0ncLrdHuExoU2Tm6b/J2J+y8rJxPQGk28/0AhR1M7EU
	p1qcE4o4Zvo4rAtl17Dx3SDBbbAwpUTInF6Ft3TkjH348ePjoPThL77acwDQ4VDPv0crIM6/e9cj3
	AaFOCEgznXBTwELlAgMiEI3QxBDCMxAStPKUBPI0Q9qjD7pOtiNFPSc32Hjq9FjSr1rhiPmJ37Z5W
	DuBZLmrEhbm4TaaVPNk8L7pqKh1cUyUAoaVtNjkdV4jRJTouWDcYtiThu6hFs1QjoyEjP/5lmhn5L
	cDPfBP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaGj-00000008v75-25ga;
	Thu, 11 Jun 2026 07:56:05 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXaGg-00000008v5m-15N1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:56:04 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59e23d70dfaso2614969e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781164561; x=1781769361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QWA/oASaoEGszjXXYseH4EEvJ11J7t3dPdy+riQNNw=;
        b=Y8sDme0G5Q0ouVHzdBvwnqfpH+ICY2v5kC7b7Csq/bd6khYhsL4avOmlMQQjY2DuAs
         vaB9ZbisxfCcAqPC39rN1BrC1wSJ5u1EhuFNpLip8HQBreeJ5UN3VgKO2o+SomEt+K/m
         M3xzhgWOQmlZQ1wFbxFfRg5I5Ri5mNewsA+8UmCKtfDsORGX12dS48gYWmhMOpaY1NTU
         sz1dvHHvNpJNYDjmhv5KSiHISeIeiRmNXHyBUtrGfJYF+I8nkMCGcl48OAb3oMwT4OoK
         S7bfUT0Qt23ZyFOaFmwqKftayorhGIY/BT/6tSxEw02QklrDCBKkDbJGuxUUvvdnUdMt
         1flA==
X-Gm-Message-State: AOJu0YwijlbgriG8tUoryogjF5rhULJeuLUov5T5lCNeE6uHyZqZeDGq
	XodGmRH11xOrvUFxafBOjW71y4B6fAT0eKXlQ/6aMWZ/zoK1bNf1wpjsomPPtXnuHas=
X-Gm-Gg: Acq92OHrgMnmJPAnImRHCv7YlxgsORUSJDLUd0lmzZGIc6yyaXtigAy493ZmrlEvU1V
	ddFFq3nMgfNIMVnpNJkckGnNy9FX17214+0hFyPbUoV5iA1v11t3hZjiG/NIZBUHZQzD/uwlIPH
	fIoHZSedb57lpU7tYxupPBkcJe4SDId5TobcELJOQkXJ7hp+ZZeiNzQA0RZa6UuNBTIruoaVpT/
	zu9ufXX8Qu5ABCagInF6WTd5lbomJOH/+ofSetC2314+9GhIv0HI1S2voxQUvIheSG1NCuyr/hk
	J+y7PZ+SozTSgy2dHau0+fr4qwly4h7roHktDelmPLeRDgexBuCYyOUlWUx4dshjAWxO9jwiPIo
	Bs25/uRNKdB3tIBP+yFEJHtpzMbYXdDU8JL1OyPn7boUwQAmAA7haJ8xx6kKwIbLfyahiX0SuLF
	VLHZwaji7Lbj07q4kLTtrNkSkVN3EhG21NEZRwUGgbSFp+I1iDpDLywhPw3MDeDaDbNE/julE=
X-Received: by 2002:a05:6122:83e5:b0:5a0:afff:78a6 with SMTP id 71dfb90a1353d-5bb02413694mr504530e0c.14.1781164560802;
        Thu, 11 Jun 2026 00:56:00 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb0d9b4a20sm728988e0c.13.2026.06.11.00.55.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 00:55:59 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-6efdb57db0cso2390040137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 00:55:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3e02:b0:6d3:aad5:6d2d with SMTP id
 ada2fe7eead31-71d5f2c9e58mr483488137.18.1781164558613; Thu, 11 Jun 2026
 00:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260611005952.146825-1-marek.vasut+renesas@mailbox.org> <20260611005952.146825-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260611005952.146825-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jun 2026 09:55:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZASW=5v55QqsSjt0y_0Cf-3H4xuVYcQO96spfvQevug@mail.gmail.com>
X-Gm-Features: AVVi8Cc4jIWBETm4Ynpi7szi6_VsDVkjFdXWa9mml-KaDUYCZmOXsqOLYp1ugKQ
Message-ID: <CAMuHMdXZASW=5v55QqsSjt0y_0Cf-3H4xuVYcQO96spfvQevug@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77965-ulcb: Enable GPU support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_005602_298251_8861248C 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, 11 Jun 2026 at 03:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Enable GPU on M3NULCB with R-Car M3-N.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

