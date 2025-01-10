Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 538A0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zrOTe4P32MUWq2MQOl7BIWqEU3Y6SIXQqIMZmB2WSs=; b=X6VBeeY3ixLrXtUSoydDaLzag7
	nA6O6zed1ovHAEdAoFNnlbT61eYOqV1Ws7qotPyPpcnp8vKh7SoLPw+mopDUCZssIeK9H0UDWmUxn
	oP1KwRE7lSvrb12GnvtZS9z1sQwYq6+UhTAwN1m4H4jk1zp/rOBiSuR5/2L9hoMY9BKv88u9aAC4u
	DBytYHlhP6XAA9GM7aN+r4hDZAdFrEQIi2K+KzUVE3qw2BgOcE3VS9X4R/Qf9nP5qcyrzkxcC81el
	rJzi1f6LtI6ogzClGKv86/cSWnwfbYTOCL0+fWQHhYkg+WdZZHAPDMEmzc8vczhTMWsgkMlksb+rd
	2VVlTbCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHPN-0000000G7jA-0FKl;
	Fri, 10 Jan 2025 15:58:49 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGyF-0000000FwLm-0NST;
	Fri, 10 Jan 2025 15:30:48 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6d8ece4937fso16837896d6.2;
        Fri, 10 Jan 2025 07:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736523045; x=1737127845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zrOTe4P32MUWq2MQOl7BIWqEU3Y6SIXQqIMZmB2WSs=;
        b=KIEOBz/tL95dZZc+VLKUDbeDfI4W4XmksgpoezWuhXNfS9RlonQ6AArO/lIgU5yq/1
         Ro5mVz57xEUQG1ZsoKKAJ0p6IV+0BzMCzj0OJquu+agTUq/S0RuiF+/zOkGcQX828FqJ
         oPf01Ju7MzkriPPnJoTwn7tDgZh/y3g7ZjDWerdTe3BpeywT98kk7JCt7poisZFK8h60
         tN24EMj93WRYOEgjaQC7XZDassJHFYjzAfr7+9zzgZz6z/+z7UzUhp+zwFcc53QnxmyW
         XNCVD7+LoPkF9Mv8W2xSg7PAbB0g3RGemzIPgREbZ/JFtMIBwOYlsalrR1U/gzzSdtwO
         V4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736523045; x=1737127845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zrOTe4P32MUWq2MQOl7BIWqEU3Y6SIXQqIMZmB2WSs=;
        b=WTysg4r/ORZLMckPaooRTdLFwf4cPT9sh+ftbgozOsZ0iTxo2gAJrHN5hSjim3K44e
         2YNGC7j07rbx4kjXTGE/4Hn77e+tWpThrG/E9BAUplImoFuKZYnl0tDWhHHGKaX2YIId
         jUXcLuG4WmE18nCaKLZD8QtV7j3D6crCvNaZVAMHBf99/UWJ9MZY4hHa6hhbxBmnthR0
         AbuvRNc4P2DICellk3tpif2Ibu8rVNxz7Szvps3U9lvlz4VUoyI9S3EhzibEQMf2mhJ9
         C7v8Y5MOEMj9e1MU4h+2b6gFyH7cwZXfxpezFMhJYKzetDogHaf6slbE5qALvumfqgZG
         7rOA==
X-Forwarded-Encrypted: i=1; AJvYcCUqrRfrrF3NvhZMQgEusI+oPLPX3yo+aU9Nc1IhZ5vcMnkpIz0tkUKqeews7kPmBXXAIT+MsJRGMC2NCbNwDEs=@lists.infradead.org, AJvYcCUtcW4608WXqqj5VB0SRGid80Brc4xX+2B3d1KsO8O+RChak0qH+eflK7CUlL1UiIIZbT2Lnu1ocaId9MWYl6+E@lists.infradead.org
X-Gm-Message-State: AOJu0YyusrtxCOOaCiQoIVEvnBO2m9Vc0SY7EAtD974jwh0vMSBxQxgN
	Lb6JSRvEjR2NLAZdujbopK0e/je9ycyvUTHQLpHmORBVmPRxOv8sLuUrXp8rY1VJJ1h/qahz54y
	C387akE5OokZYxq4LmHmhfbUdQeFpKamMXX8=
X-Gm-Gg: ASbGnctEKV2eVjEuCeq1Oblmwk7+JJGNq+HFHCw+7YJ+RwywY40Fy6jDG5fyD8QyGPj
	8mg4B2yFJP5nTOCbRYuBMPHUzDDfh6b10M5FRp4WctIGRmXsBcIG1ANLqekTw5BQZiiEzyiI=
X-Google-Smtp-Source: AGHT+IEnoFFUcCDxyWMJMccGcHdpcHtEs8d1tHvHYzHwmCtEP6B4k/qEsVE4N1SvaESd/DasJz0P1wR/TvZ73iY/h6o=
X-Received: by 2002:ad4:5dec:0:b0:6d4:1425:6d2d with SMTP id
 6a1803df08f44-6df9b2d62b2mr177775706d6.43.1736523043867; Fri, 10 Jan 2025
 07:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20250108-rk3588-h96-max-v58-v2-0-522301b905d6@gmail.com>
 <1950286.IobQ9Gjlxr@diego> <CABjd4Yy4Qd1rD43u3B-s=HxVBnaQt7fSgP9NFY2YeY0eKMESvQ@mail.gmail.com>
 <2731770.KRxA6XjA2N@diego>
In-Reply-To: <2731770.KRxA6XjA2N@diego>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 10 Jan 2025 19:30:33 +0400
X-Gm-Features: AbW1kvbKtZndFgN6a8gaF4CRnBwYqi1xlW_2MAE9e2Mp3DOEVgrwl-t4iXkVcz0
Message-ID: <CABjd4Yy48dwZA83XRps_L_sowA_e95PcXYqvAo2J+xVydSA44A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Add SPDIF nodes to RK3588(s)
 device trees
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_073047_135652_8ED8C682 
X-CRM114-Status: GOOD (  30.66  )
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

On Thu, Jan 9, 2025 at 2:28=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>
> Hi Alexey,
>
> Am Mittwoch, 8. Januar 2025, 16:30:35 CET schrieb Alexey Charkov:
> > On Wed, Jan 8, 2025 at 2:01=E2=80=AFPM Heiko St=C3=BCbner <heiko@sntech=
.de> wrote:
> > >
> > > Hi Alexey,
> > >
> > > Am Mittwoch, 8. Januar 2025, 10:09:07 CET schrieb Alexey Charkov:
> > > > RK3588s has four SPDIF transmitters, and the full RK3588 has six.
> > > > They are fully compatible to RK3568 ones. Add respective nodes
> > > > to .dtsi files.
> > >
> > > While it may seem that way, we still want soc-specific compatibles,
> > > to future-proof this.
> > >
> > > I.e. going the the
> > >         compatible =3D "rockchip,rk3588-spdif", "rockchip,rk3568-spdi=
f";
> > > way, so that now things can just match against the rk3568, but if som=
e
> > > fault emerges later on the code can be fixed with the DT staying just
> > > compatible.
> > >
> > > The spdif also has an example already for all the spdif variants that=
 are
> > > compatible to the rk3066 [3], so it'd need another "items" block for =
things
> > > being compatible with the rk3568.
> >
> > Hmm, if we are to believe the driver ([4], [5]), they are all the same
> > as the good old RK3366, which in turn is software compatible to the
> > good old RK3066. Same seems to apply to RK3576, given that its current
> > .dtsi just references the "rockchip,rk3568-spdif" compatible.
>
> I was for a short while afraid that something slipped into mainline :-)
> But I guess that "rockchip,rk3568-spdif" compatible on the rk3576 is
> only used in the vendor-kernel.

Sorry, didn't mean to give you a heart attack :-)

> > Does it mean that the binding needs to be restructured so that the
> > required fallback compatible ("rockchip,rk3066-spdif") applies to all
> > variants? Or shall the existing ones be left alone, and just RK3588
> > and RK3576 added inside that "items" block?
>
> I noticed that the spdif binding has had an interestings growth over
> the years, with some socs being outliers.
>
> I wouldn't change the whole binding, especially as that then touches
> established stuff.

Noted, thanks.

> The question would be weather to add the rk3588 + rk3576 to the
> existing enum marking them as compatible with the rk3066, or create
> a separate items block and just saying the rk3588-spdif is compatible wit=
h
> the rk3568 one, like:
>
> [...]
>       - const: rockchip,rk3568-spdif
>       - items:
>           - enum:
>               - rockchip,rk3128-spdif
>               - rockchip,rk3188-spdif
>               - rockchip,rk3288-spdif
>               - rockchip,rk3308-spdif
>           - const: rockchip,rk3066-spdif
>       - items:
>           - enum:
>               - rockchip,rk3576-spdif
>               - rockchip,rk3588-spdif
>           - const: rockchip,rk3568-spdif
> [...]
>
> With the RK3066 being released in 2012, part of me is amazed that that
> block survived that long, on the other hand going with the above snippet
> somehow feels saver ;-) .

Let me first submit a short series dealing with RK3588 alone, as
that's the only one I can test at the moment.

Best,
Alexey

