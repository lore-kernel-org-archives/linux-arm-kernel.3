Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67541CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OKo+B/N8OpvVSgOheqCo9k1dnTlp+LYue6K4y6i8Mc=; b=cDnBFItYAGRBb8bD1ESEryq4eI
	yac1pU6mQwihd/1inMRKyiQpwXd3GsdXBOh6zxbBombRJGa+vXOYyt9s+xjafxnAhz/pJm9jcIC+k
	K1fkLmB4vTOUsxvAAfhhbm6EM2w3nEVJEDT8/ZXN5ShuaGsUieFiA9V4XKb70tVnQtY6Y6nNHWtJq
	AxehPG2KlAl8y7RA9UahBuuoKNvgmfVKsPfwQn6G3rnYku+CdbCwRIfZmvr8c8Mo81B4tTdXx76Dk
	2aNXwen2/gQAXcuG7ZVAumw+lqF1/JoMNvmtO3c54zTtL6xDeZ8+yFu2jSl38D6aFSlBzooyg87cl
	vlqLC32g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P1f-000000050dS-0L59;
	Thu, 16 Oct 2025 14:32:19 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9P1c-000000050cX-1dw4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 14:32:17 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8fb58f2b820so514012241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 07:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760625135; x=1761229935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7OKo+B/N8OpvVSgOheqCo9k1dnTlp+LYue6K4y6i8Mc=;
        b=pTJ8dFr7yjZq3TQDwnrVNwutb19E54WKOaVykeqxu1EksHja060h5d/zB3VWwj89dj
         /GnHLwSuc5QIyW9NjW+ZyN+EwQpVgkUBSvLW/xaqeBX+P3R3qwibw/L3e+Kyp4NYE/77
         IfueDtwGvFDwzgNpvNOlqtpfcOxFM8mdQ7vBtnFkoadEi/8Vo06dffi0BpSnO0KsssqB
         yg/+d3Xc06Q67EA+IYCQIeplssBlSJSSMAcxBzOTmToWgPOVxrvngB5470bOsGc4BkV0
         UlW9mpv5VPMtdAMBz+/ABppk4De4PBeRk+J9WLso6AwrEtfFYYoAqy5zH1nctXUDLgBY
         JOxw==
X-Forwarded-Encrypted: i=1; AJvYcCXfRc0eBdEiyI2r0/GYxhGUk4pBKCAhxsroSfRUNf/gPRj8g0uxQWqxUZLonEvnz0xi6HPQZeHU6j1qy18IM6jM@lists.infradead.org
X-Gm-Message-State: AOJu0YyZxWLPhU1OAZ4blil7XFo9/L7mrThsNrunZ9k8voEdvmqZ5qzA
	yDRt/GEPA/yyHIoQQU7f26iTLGiirYkTyhO4mit73kzfwxA1yTlLDuyL5oZJ783H
X-Gm-Gg: ASbGncssBULXdNnTMgLx/C83Usxp7P4hG0iqc4XQ9EqNNrsssfINkDFH7wgVLTiyYkE
	6h0HLSHgKQ+RCH8vlKBz/nrJzmnyD5fMvR+lJSvYS9w9ovpIDQyV1xj+1W1eUP6yHs/yMb6Qc3H
	9mTk5MtQOytgxm7LwRd7meTU2vF0PiJbtai8zDz1vovxkc5NG2VNHqCJR2PJRRk4IJg+QJ6gBn4
	sPOr/2/6e/2OH5ye/1zcEmemd+vdc2qYQ1ruWsWwlyTHMth2WYKaypLxWFZSgzqojtT4+osqu7W
	TLT7kScd9GY92AEAXFltcuaABVqbPAEjoHJJzzAHWZ4lVZ+Hy5GhWCv5Bjvex7DxYDfO7+kSwTv
	EtT9AVCNPaf+olD58SifuIuL7uiic9SccBxEhL+m151YywxJFLW6l8UStUZVgLV42q5n/4simNw
	ie6GTOi58+Mr7Y9nDtzi9A+BuR0gnI1XvnrT1i6lDOIeRdyW9RQTBsdoeCGFc=
X-Google-Smtp-Source: AGHT+IG/tAbqSaXpD/sSMfov3OyzN9QgmkLxZ5vLuLx6YqwHh1WYRO0EbwRYdi2v/n8C3cutfSbeew==
X-Received: by 2002:a05:6102:6cc:b0:5d5:f6ae:38ec with SMTP id ada2fe7eead31-5d7dd7143a6mr215160137.45.1760625134501;
        Thu, 16 Oct 2025 07:32:14 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5fc7126c7sm6448706137.5.2025.10.16.07.32.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 07:32:13 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-556f7e21432so544746137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 07:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmwuuT0qfDQiA4y7NsoJNGt3AUMZn+WLn7ZQUJhEfvSojsjeY5AXSqE0LXbn21dfwuUOzvx8C5ukWn21mP7WRu@lists.infradead.org
X-Received: by 2002:a05:6102:54aa:b0:5a1:3bcf:a93f with SMTP id
 ada2fe7eead31-5d7dd555922mr220616137.4.1760625133095; Thu, 16 Oct 2025
 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
 <20251015153952.185249-2-marek.vasut+renesas@mailbox.org> <CAMuHMdVdW+tMA1=g9D+BQV0fk0kis8FzyQgf7BpN-u=pi5eQfA@mail.gmail.com>
 <51ff107d-126d-4481-b94a-f614f31c7bb8@mailbox.org> <CAMuHMdW+_1NZYdXrGsNcHkuvh_ym9148BRB+d0Wbz1oZrpWCdg@mail.gmail.com>
 <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
In-Reply-To: <6f29d7af-a2e5-4412-9575-6368621c1178@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Oct 2025 16:32:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
X-Gm-Features: AS18NWBZ0iJCimoz06t01ILJ3nlCiaOTwnBjpX9tKhkz8DwVN2SfgQuIjQCiZ2I
Message-ID: <CAMuHMdU9xSeFtLB-jUSUnJb1JHxYDXLe91GhZbT7QVGzYCXkRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Matt Coster <matt.coster@imgtec.com>, Maxime Ripard <mripard@kernel.org>, 
	Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_073216_435338_67EADA9C 
X-CRM114-Status: GOOD (  31.79  )
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

Hi Marek,

On Thu, 16 Oct 2025 at 16:13, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/16/25 12:14 PM, Geert Uytterhoeven wrote:
> >> which are also never disabled, do we want to disable the GPU by default
> >> and enable per-board ?
> >
> > Yes please. We do the same with renesas,*-mali GPU nodes.
> > The board may not even have graphical output.
> > Or do you envision using the GPU for more general and headless operation?
>
> The GPU does have GP-GPU compute shader, so even headless system can do
> compute on the GPU.

How is this handled on other SoCs?

> >> I would argue the GPU should be enabled by default, so the GPU driver
> >> can do a proper power management of the GPU. If firmware is missing, at
> >> least power it off on failed probe, if nothing else.
> >
> > The *_PD_3DG_* domains are powered down anyway when unused.
>
> If the driver was bound to the GPU node, then the domain would be surely
> powered down in control of the Linux kernel driver, without depending on
> the prior stage to leave it powered down.
>
> I think it is in fact better to bind the GPU driver to the GPU IP and
> let the GPU driver power manage the GPU in a well defined manner,
> instead of depending on the prior stage to leave the GPU in some
> specific state ?

The domains are powered down by the rcar-sysc PM Domain driver,
hence the system does not rely on any prior stage taking care of that.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

