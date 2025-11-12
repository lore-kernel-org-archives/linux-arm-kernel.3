Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34269CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 12:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuUTav2xUOTbkma3ItG1F52J0EZPCIhhyycd80cfuj8=; b=muX6MOcqujdSMvZeUKMqKjkVSP
	vwntB9LaVcQwKxjXVEJptc2hN/lQJ8ZbPAsooOR5u3+p1EV7HQIiEiTHtvh8xxbCnbMVOOe83hWUW
	yc1ZjR/8XWRI1eswswsIgwfgdSzk91CKsXCzCa/jsYMBGufVBV8racY40uguTrNoQeLxobHCkqAWg
	d3Jl+inxbKbFuMg1L+kAtq3VQqt7T6JbxXdU59q0CjP+Z8Ysu8MEVql9KH45WIuL0mMYhDSfDxnHr
	u8oepyZLNZabRo8M8cFSnRblKJBwYblg11VHdedHclZ7QOJ94eAH4KENgvtZ0z9hYQGap/RtRZI8d
	qtJJNpLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA26-00000008m9X-0yPQ;
	Wed, 12 Nov 2025 12:33:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJA24-00000008m9C-1s80
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 12:33:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-29853ec5b8cso3465015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 04:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762950783; x=1763555583; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IuUTav2xUOTbkma3ItG1F52J0EZPCIhhyycd80cfuj8=;
        b=P2Ukys66t3SAoPLHye61MIwxUiuwEAdIiqrUHlHLhCPm81M2ZwFqYo0/bK+FR3+xLT
         zO5k6dmt/F8TB1LvsQry462eyi5L00Qr6lNfoksqZNXWNvEgoK+qxGQ8InUhXS/IYYPP
         5Dzwto7V4XrxqHxcZ6AWuEuy6METf67a/YwPvjWapslv8njblhNOKNIDl+NTaUfkZyj8
         DqmAUgfOTD/vv8+5WFIm827mynLrqrrlT+QWwpcx9TEgUMcn0taaPmQ/KX+PLrCM2XLq
         crcXm3ngWp7aRgtcd19BkQE/2KQDYA8WZUGEvwDilGKDhDzL0ay19yHU9kTCp1DVQFxf
         tr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762950783; x=1763555583;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuUTav2xUOTbkma3ItG1F52J0EZPCIhhyycd80cfuj8=;
        b=kQWN2vCcvhonRsOkBhm/0vNRrHECyN+4BAs+E0otX6mXp87qzKQtTMLxKv5q9Phflq
         FRMO5Ta/BbArppM4dGnAhVaA+AA0jPprSMrqn7GRqW+UbR1yHPGLnpNY1KuJMvPOL//R
         icH/ky5GWMZRIl26/ZRhIEooP7JSpzUT1rm0CAzyOkGGDGh0cXQR6kwuILGFZEIfYF49
         k6ZHOi0NH1ZPyCREt+dtIAptVLyxNZypmEo9pAmZ1D6/kMIjyvooi+P2r3iIMOcqESzH
         3qIwMOy2xQk3F/JrhzFaL7YuMgffXo/7ZCX2ibAOoOceZO7KOKwmEWzQHffAKooYYfAp
         OvkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoVaRg5KRQkutyzROnvEElcmookin1LNySDNqic636FrbLEzji52VBXgvj32LsHoICLQhppQ3sVnXZ8TkC/+r+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9+u8RjnMxOpewpKZMLXaqqloljkBAmnNu1aGC2Bx/2ZBXm8Ll
	+TFgnzahphKMhyML509/Ki6ZHCHOqGNaTgvBnkz1MigEEr5RR8px9PrZrzwYRYKlktx40M8gfOK
	3XIxt8hhWahIUNK0JE2kiMqnXBl/rW2M=
X-Gm-Gg: ASbGncsZ137X159DF8IzBAhRgL5BFf/SpanT87XqzLYl9EQVo4pjOzxEgAO5c/ScHVm
	h/3hQLn141quBV1Uf4miRPlZO0B+F5v4v+u3ScoHJjaTjfeHXL6V327WM13l7A05no3bH/2Z0sW
	AKDm1Lmi6HkXTcGCiMiy9wy0om7uwYrV7t17WB0heTNBs6jdesjGceSbWYTSfLyF1h6CwcCpMpS
	vvN+ExwcSgJ41HXCKYTKE4B3fzQvP8kGRapYs0MaBSGukBPw0U1p97fWA==
X-Google-Smtp-Source: AGHT+IFabhPWRSsuZsSo5sbgc0lLZtsJguRmqpiSDLmiPKtI899emQH3LjICEzz3+Agz/sH6qEDUHd1ILnm2Zjkbos0=
X-Received: by 2002:a17:902:ccd1:b0:258:9d26:1860 with SMTP id
 d9443c01a7336-2984eddd8e8mr38233045ad.40.1762950783418; Wed, 12 Nov 2025
 04:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <9d48a54c-0585-4524-b9d5-30696f5ecc8b@kernel.org>
 <CAEnQRZCvpXzGt=7NGv7-s+y0gvOg7Jx4OqbfbW3uv8jDp-jroQ@mail.gmail.com>
 <CAOMZO5CU09fcBB8oUOO=qC=Du3Q9gnJOQacK=6v+pnSQViex3g@mail.gmail.com>
 <CAEnQRZCHKemw2YVT=WVJvUMr9CCWoZ3MORt_mU1V-62C53n-3w@mail.gmail.com>
 <CAEnQRZBBJ4PGDOk7hBP_qsk7bBiec8pHb0DYKs2mhOAahNyKww@mail.gmail.com>
 <baafb460-fb65-4cd2-9911-89d828199d9b@kernel.org> <2e160fe1-bcb2-41cf-817e-ac2a36959b16@kernel.org>
 <CAEnQRZDg0yAjR-a-4J2ZKAjh3mm8NeQCA=o2kyNJtXMAFCMLAA@mail.gmail.com> <56530f64-6ddf-4d2a-a079-0578db260449@kernel.org>
In-Reply-To: <56530f64-6ddf-4d2a-a079-0578db260449@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 12 Nov 2025 14:35:26 +0200
X-Gm-Features: AWmQ_bl_E_pJAreACwvdhcI2KJRqNKpXEYmnMwMcnpAuTrSvxvSsy1R2nTa94KY
Message-ID: <CAEnQRZD=h5qOC445U3_+HPh7aCE8TohSpZmg9hgkRE7mg5HUpA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Joseph Guo <qijian.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_043304_494645_60B1F1F2 
X-CRM114-Status: GOOD (  12.80  )
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

<snip>

> > We (NXP) immensely  appreciate individual contributions from everyone.
> >
> > We need to be fair, the v1 of this patchset was taken from NXP
> > downstream without
> > respecting the Developer Certificate of Origin.
>
> No, it wasn't. Please read carefully DCO. The chain here was not
> correct, but that's the only thing.
>

Indeed carefully reading the DCO Clause b) you are right.

> >
> > E.g there were commits pulled in from our internal tree without
> > keeping the S-o-B tags.
>
> Read DCO, please. It is not mandatory to keep 3rd party SoB. It is
> perfectly fine to skip it, if needed according to (b) of DCO certifying.
>

True. In my understanding though if one bases their work on others work
they should at least keep the S-o-b tag as a common courtesy.

Commit messages explicitly says that the work is based on NXP internal
tree patches.

At this point I leave to Rogerio's appreciation on which S-o-B flags
to pull and how much
of his work is based on NXP tree.

Thanks a lot Rogerio and Krzysztof for helping move this forward.

