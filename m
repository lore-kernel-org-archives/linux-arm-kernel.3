Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1107FE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzW/JtCH00KsxtW/vWSFPSj4+ptoInfVhNf9UaERk0U=; b=3NvV1Ogr4rtjFN9JlEFLubmqFe
	Wn9AYySckgOpdXY8GIkIYjS9Dz+5wUN1l7u7ta2ekSeT94m7JS/oIYyrH3cNrbHVTQCH9rlrrAQDb
	hMEPux4/IYc7e9pKUYnrfhSHRU1SYr+FqrD2JqzicfkY3v4HoxH/N/w/YIrsGxaxTifuOrkwzbsYj
	V4F9zOLsY57nomWCh2zQ5+uSLLas1Ie+nZ/UY2zR5x06PheNoezbtkrL3aS7N6bMRhjHPYvf4QJYy
	/hbSfFGRUBv2qOKrmn5dSNa4WZM6zAxnx8/MPGAmjba0IIFsvcxt6NiIhPTOHHWqWyqg/W3aWchpX
	eCpZYOiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIq01-0000000ClAZ-2B9E;
	Wed, 04 Dec 2024 14:05:05 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIpyb-0000000CktM-3svY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:03:39 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53e1c3dfbb0so1067992e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 06:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733321016; x=1733925816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzW/JtCH00KsxtW/vWSFPSj4+ptoInfVhNf9UaERk0U=;
        b=sS0TuhXFmKsbDPeAiiJ2l4bBsYwqPLs5UZs1YqdhEr/nHlElQVEjVOv7TSj7K9oWKK
         ORXjAiuX50wybZJHtAjotH47KQKrmVn/3Bs7J7zfiDFHXbDmEbvAVfoy3+DUZX0aLKYy
         s8Ay7sjWmFLJX344/FyXIm6DN5HPMvx3ZQKTn+bL6d7j7S7qrmd1DKzSERYsL9zHRhUS
         2kVEOBDj6E7DqrY4S8f6maXSe5hEvT5X2o5EgPzxYpf4WRTWPCOcWAH5NcAq3AGuUchK
         QcKMaK1888uXwaPXkW4/yuOiBRdTr5bu08gUhyiqdTCgh+mspWyg9NzcKs4KFWpBILaE
         sLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733321016; x=1733925816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzW/JtCH00KsxtW/vWSFPSj4+ptoInfVhNf9UaERk0U=;
        b=ALdUm9hstR/a9Ft/vqP7nxDndJa2h/n2GwgzTSEzlVVgvU4ImcjRCuE+SQjivGA6tj
         ED6+fGt+t4SZySreF8gLnKPzEPx55Lo0aJnTEH4qpn4uKwpMi+wV/zA7hM9CGEfhViZ+
         M/ecrZ6wGaf470uQMjYZ6ZYWzO44gXXhlY5Q44Tc98kmLUXvEh75YCWQgCgnRloVJLTT
         24Kjtb6iFJq/+GaJW+mA04e6Bg4vsxj6K/kPnZzS0kNdKMzAwN+wcOd6yvM5xyXXIwIP
         Ut5HRVC+tdrJU8KgXRBleIbTGLNEId3Fty7MB+IBXmuSTV5ElJ7gcrI49/sfEqUxenVL
         vsIg==
X-Forwarded-Encrypted: i=1; AJvYcCVct7faUMVCx+Cb0KZzPLsGHYVgcd6ebo17WjaXI1CnHs8OWBZ8e+DGYOWS7bTTcCXBmtgwYX5y8YWh0AR/U8OD@lists.infradead.org
X-Gm-Message-State: AOJu0YyKnrPpi4pt1CzXB/FTjgSOBknGfVwTucECLcTlDDNmlYsp4yPZ
	weS/Iy8rSie85p51Sw6qkUA6nk4/Kf9BtDNgE2MeKY1Nymbo8FBXKOGOO8OEqh6Fk4vJ8oxx5h8
	U0NrPRTU/pOIWI5WYCzcjhnhRyCJMadG/r4xnVw==
X-Gm-Gg: ASbGncsw4MLz1j2xGlzoXaAWJVqcgKt43NygJO5HfH7HXUeRdaphC+ufSAjntNv1yro
	OjkMSlNeHo5YYgyCnNsDPnN7zpITO8w==
X-Google-Smtp-Source: AGHT+IEt8hy//Qrsq15lWQdoGs4MkH3N9p07ErAD0IhQ0ETz6672nArlbxKict87HTx275FZUH7Fy/W4YCbrdpI9H28=
X-Received: by 2002:a05:6512:3da6:b0:53d:ec93:5a9d with SMTP id
 2adb3069b0e04-53e12a3426cmr3864178e87.49.1733321015399; Wed, 04 Dec 2024
 06:03:35 -0800 (PST)
MIME-Version: 1.0
References: <20241204102904.1863796-1-arnd@kernel.org> <20241204102904.1863796-5-arnd@kernel.org>
In-Reply-To: <20241204102904.1863796-5-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 4 Dec 2024 15:03:24 +0100
Message-ID: <CACRpkdYN0b9LqpPzrw1Xx-A0sUzUhjevT_J7S-sOyLE7Aeym2A@mail.gmail.com>
Subject: Re: [PATCH 04/15] ARM: deprecate support for ARM1136r0
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andrew Lunn <andrew@lunn.ch>, 
	Ard Biesheuvel <ardb@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	"Jeremy J. Peper" <jeremy@jeremypeper.com>, Kristoffer Ericson <kristoffer.ericson@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Ralph Siemsen <ralph.siemsen@linaro.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Russell King <linux@armlinux.org.uk>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_060337_959555_EEDA557F 
X-CRM114-Status: GOOD (  13.71  )
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

On Wed, Dec 4, 2024 at 11:29=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> This CPU revision remains a special case as it is now incompatible
> with CONFIG_SMP. Only the Nokia N8x0 is used in practice, and even
> that one is fairly rare these days, so let's plan to remove all of
> them after the 2025 LTS kernel release.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For:
>  arch/arm/mach-versatile/Kconfig |  5 ++++-

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

