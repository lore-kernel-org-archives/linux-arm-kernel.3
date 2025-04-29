Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA9CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=; b=kFO4XxhBWUHup2m5V+pFn2a18E
	s6mu1N1s3rOFR6MxKeMLwkHQNzSijJ1+CCi7QUN5a1yp6EhoGc79xWtQZD9V/aHDw0ZXTqxHtERz7
	ZEDAzKnNZ51cSOuzX9s2N2FfL3hrv468k0BTCdONJu8mcVvSeq2VcfRYcwG7mc8B/eOp/KRgTPvpq
	JvnXEqDfUK71xjMBZcr49wD6pf+nBZoTDtFQAgtJaRlBhfIp1JnfkRU7THtjGV//yVLCo3LtzZab1
	3JTLQa1cBBljImKrf3nTtx60DSsjRui5gZLbmYYv2pI0gSijKpuphTx1DWEEO4791ju7P7ifN73pk
	LXDeVoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gVD-00000008yIZ-09rY;
	Tue, 29 Apr 2025 08:39:43 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gR8-00000008xa9-0dBV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:35:31 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-317f68d0dffso60742541fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745915728; x=1746520528; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
        b=GdpSD7gduNefRzc7LPFbxQtS2B08aMc9cnwUru+MOZh2GpyhZgMKrTpnjFeQ2OByy7
         Q7r+bXO83JIf59IEROR3AcvfJjWTuTDRinzgI9aw54W9+CNHUJRJRCZAUaC3HdJTJ66N
         Mb7wsXwQxUmd/2QFHKFhULO/bqOh/h9ZUPKTrzR5+onVof9MyKrVB1E0QYjhFUnEZAX3
         eIrwVz/mgpB4vOWkPDsUZA+g3669TRjuHbq+PK2HQ66vHH7CWQzCTk4cmXLuJ1uDad0Z
         /Kfq62AF1w1yUTr1qoWZs9uUyyyP1RqFWV6BHOcWW7+vxKK6/K+5CnD76XBVGeRUpKS2
         E/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915728; x=1746520528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
        b=Xp7D5+5uXaJfIVMXwZU3ElPxUiMo7ET18ro5OU/XZYyPvJBXD3dVo3KB1qQlHFWIlv
         sk7A9gRFH8VqGBPUAKdUcX9499lxDXocTh8DJILVDauVj0fvRPltrENdfjLiHlSyn/cc
         luqe6gyCM6i8WUsBDvNmHsQGYbyRbkB5lcuQtjiYI9IVL4t7JtnJ2eBqvy9/jXND3Ra3
         dbYc9WbEBI9XJuR6iPerHfVWKqSmVlMD2k+lYT1vWpUog3PJ658iU1AdwXTjGsHewTsI
         KGoIiYpK+b57HhBno0kPVDUvydqb7O0CTX9JuMAP40AoeAYFHpkjCrCHcFhOGbYCD3ER
         otJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWrncVVlHZ6WXr6pvQrNuzrDefUGMy7sd5Q6RDk+cI/3BSmnj7F2JhCrPPKStQ/fZKjJ+MuMqc4/A49+6cZaFm@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWOYKvVD+/Hez/8hzEp+wT9Ch9u9j1TEfroTCgU3Osb1s1pVs
	OxBGeayTySzdU03+0zDthtmhbCizf0vgE1aAEwdWDwunzqRm8Z3DET7yNZQG+yERy1qMIHrSSuH
	GGI2BSBqBg0NOD+JBTnRLwEzDMMZJoj7C0NL1pw==
X-Gm-Gg: ASbGncupDIoVH0sdFTTAyrOoKjqlb4POp398QIw+4QdM/YePRGg+Xnj5aiHIJJoXazX
	gnZ42QRVeQ7Lxe81WVxJhF/UbFNs1v1YhQEQdllp4U0er3WRLJRvAGC8GZDoP+muaCCCAjv8zYy
	aBuu2tGR6T+M+2EHaWNwwNFw==
X-Google-Smtp-Source: AGHT+IEsezp5muMVAY/lE/H7DEdH8WV2VmTWB3mmT7yKNRZ/0B58jZOoyjXMik/+mxI9FIbD9XZIJdk/S7T9DrPLhZQ=
X-Received: by 2002:a05:651c:30cb:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-31d5b13bdb9mr4753431fa.18.1745915728423; Tue, 29 Apr 2025
 01:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
 <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com> <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
In-Reply-To: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:35:17 +0200
X-Gm-Features: ATxdqUFfjlFyz-8zlCBHswKX86tkhKgqvxLDp3L8XiORh1-aFhf72vJ7elWy1Tk
Message-ID: <CACRpkdYRCx8_zLa_OtcFwjmL6_pCsU0hcUe0_PP3=EbukbM7Jg@mail.gmail.com>
Subject: Re: [PATCH 02/12] pinctrl: axp209: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: wens@csie.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Paul Cercueil <paul@crapouillou.net>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_013530_185961_D211E979 
X-CRM114-Status: UNSURE (   8.94  )
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

On Thu, Apr 24, 2025 at 8:55=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Thu, Apr 24, 2025 at 7:43=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrot=
e:

> > I guess you could also drop the curly braces, but otherwise
> >
> > Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> Right. Linus: can you remove them while applying?

Fixed it!

Yours,
Linus Walleij

