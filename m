Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68037CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=; b=ya1GjzE+u1rDGWx+1RVwPbA2hh
	7wvKYlR9kRto+38bpR4YUJ39vy4j9n76oIhOBsktbZP/Ed0tSxdvxEq6DqM4oBENbtQ5kJVmY6bpO
	PylPKrXmKJ1IGawa5X6ExmqNO5b3cRGoXCf1d/aOMiiVhy0vODqurDDGPI5C+8Aq5LOsdEldfNIeW
	WwBO1YkhzWTwkyt5Y1DPr2HDjm0bxhYRZLUTlRit0SUf/Ewi9mQYlJEuP+zMjKrFpNHW+w8YbGP/M
	EPiNnqOtO+eF7y+SDa2fsDLRldOJb77l4XGLEcUK+uvPU9Xch+bRLgN7ae6k5h0fS54gz38TMeJEc
	EMrzIk4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBz-00000004pcg-1lz4;
	Tue, 09 Sep 2025 06:51:03 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvj1c-00000002M5s-2kAH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 21:03:45 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-336b071e806so43137121fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757365423; x=1757970223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
        b=glAt0GnZ5XXzlkMmGLL7rxKW0uL+XTHPtiocSmX6RJo+OPEAHppg4IGMM5fagZXryc
         bMfzCIH7PB7vSx4C2s/3PGurNwU9uGdXndjmGqAU/UzHYgjuroFca5RBvaAB5Ivkevce
         zzGM2dwEeKfaUdYZWrsowRKEM5A5YTSTxwsIjHD7aGbmlRVIYesbLTYY4mEgwU29JuzY
         5tbG35wq4HxPLGyHIPV8V8+x5c/uRojRGCWISQrOf05qXzw9Ejiq2HiepOKELHSWvMo1
         RvxyrcJGk49jegUVUu1oBoTpNFifr/E7m4dfW0vgORc0DtKP11ioFK3MmyGR449YfsxN
         7zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757365423; x=1757970223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy3RayiwfBU1/zuQfXQ+IdwaYW5zap/grmBI6ndAc0k=;
        b=Um1c+fuKR/87qIkSSh506Y0ko0bJmf6iuswTpBEklgFubos7Y3wj3oPcSFuqAz7r0n
         pWX8XroXVEEll1o3WTja8vG0rQQvDSl2c0hxZ0CKQNqmHJLSnQ6aaVpyGkUeJlMmkD1g
         iNeAiQRuoUZX11eACAe1H02Eh1Uj4hJOth0IE9vVVid3X76bz4VJeyWmDuX2LZJ+G5oE
         AhilwjDXy+R2tJfupzoZsep2CME8mT9OzAAb/nlkogK8+yOjdxXdCDxVk4srrlaXA9de
         JhF2s4Atc1BTtQyN0XbnL1800g6S+FX3qQRsn//rZ8vjzd3cOWkqdrrtVEcK5IW3UH2x
         1QZw==
X-Forwarded-Encrypted: i=1; AJvYcCXLRkfR+TXORu28uh+GRffpQQ90NY+GSEko4i5an5GCo6bLkDZGMk5ZU44Q1DQbFGOohCNvy6r6Do/jXdoS7gvL@lists.infradead.org
X-Gm-Message-State: AOJu0YxOtQ2VvjEY5YJlJj4GSEDXHy1lquxo3OserfwQmQPV5siqgPWl
	3phatlrxLMCN06SZyUe5G3DwXlbHKo4nfXHCrgOr7zmKP3WTvb/s1ojVavU/FzjsLWY/l6WxIsd
	+/HXz2bvFPXgL/9JqKCbC4xCRZhjGqV66iiDZHl4Yyg==
X-Gm-Gg: ASbGncvfJ7YUA2sYGStcFCQor9p+bwQuHxTdZWE+MmqIb194MGaUpSCi7P647l2RSnm
	j8Z6klrK+Y75B6e/Z42a+jg8G+HHSVKeJm1g+yOs3r9n1Aq/2WX5h3OeMmMA3mX6kkTLtwYfOBe
	fNtaa+J+FxiiNDGAhrWFwAY6MsaVYpus3qBXrlIg8LyAJZfVtY4gpJ1dF3B53SMIigO6TZnKB1b
	EdaKJmuI0P3SAlmyA==
X-Google-Smtp-Source: AGHT+IH8+J/vFeWhw9eoYEb1/3GvltvNA5l3205lsYcHvwWXC67kAnznt4uB6zdL3+zg2WYqt7lJoZenJW0OZDDgeRI=
X-Received: by 2002:a05:651c:4358:20b0:336:d915:cc5c with SMTP id
 38308e7fff4ca-33b4fe4da4bmr23851571fa.3.1757365422821; Mon, 08 Sep 2025
 14:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250908113723.31559-1-ansuelsmth@gmail.com> <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
 <68bf16e5.df0a0220.2e182c.b822@mx.google.com> <d1bc3887-5b88-4fb9-8f89-4b520427ccdc@lunn.ch>
 <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
In-Reply-To: <68bf2b2d.050a0220.7d5a6.b11c@mx.google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 Sep 2025 23:03:31 +0200
X-Gm-Features: Ac12FXzsPzr9I2HjnC5t_HYUtDe_Oo71i-LHOVM3Q5owLY6JPkPWVDiLSF9uLf4
Message-ID: <CACRpkdYuT0x3JSFWHMF5thH0UyNF1Cse+W9joE12yQ0iAAXjuw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_140344_702977_62946CA9 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, Sep 8, 2025 at 9:14=E2=80=AFPM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> The usage of GPIO might be confusing but this is just to instruct the
> SoC to not mess with those 2 PIN and as Benjamin reported it's also an
> Errata of 7581. The FORCE_GPIO_EN doesn't set them as GPIO function
> (that is configured by a different register) but it's really to actually
> ""enable"" those lines.
>
> Normally the SoC should autodetect this by HW but it seems AN7581 have
> problem with this and require this workaround to force enable the 2 pin.

In reply to Andrews comment I copied the two above paragraphs into the
commit message in the applied patch.

Yours,
Linus Walleij

