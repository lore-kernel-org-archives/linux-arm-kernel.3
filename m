Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4B1E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 00:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=; b=didxp+1Z77OlBmOmhjVKTF80sT
	hfofxWfZq1qr8qfoMkiLv/qeBHNY5xWfVanhsn8pKNpu6V76IQVVKz87YO3VoMBjTHpmCwS4KwMES
	2vc2gG60b8TXCPYrceyONBVWFUic9PYI7nKMoB/sifb27W7cvqNWLJwCI405Js80VefGwlDqW+AGd
	2Dhfh5GOJXOvPGaJSWagD0WAQTEvwSGVtWHkHXfSNzjwdQtEHSmy/0hwT+b3yUe2bYeBLuGa+ok5X
	ZrOjrqaXmoU025+1OIDrVP7WGkx6tjMm506hWldjifSiVSfiUlXGJ2NqmoQoUQQyXw785aKGYTda/
	TyXww1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRKFn-000000017jq-0JY7;
	Sat, 28 Dec 2024 00:00:27 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRKEa-000000017er-15pQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 23:59:13 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29e5c0c46c3so4156811fac.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 15:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735343950; x=1735948750; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=;
        b=LKijwtUcLWXL4GozRXl6iOCLOQtH0BKq/0QB6kwOvH38vPlq2nG8K9BVjeb6aoK84Q
         0NhLDFt1cT52bKWkTJDQzfBbJDeRnptjx8bviHx8Amy6vzydGkehh89x2ni7kW9ldOLo
         4Q7WxSEH76t0SEvgFCxJrNG8XwkmKN07WKSAgkNgwyIC6y+7A3p0zuw13j1iVeWyXpEd
         QND12UR/KLlBn98RMbJ1ZqmQ9ZoZeb3pTQVjCN5rUkjNT+0ue94TOfqZrc7ESBP/XZpL
         J0fqziGZcY4AyiLUlNyfOxwlCDF3v6pVhQMIWuU7vk1i/8SCAetx09kNoBjuOPGDR64p
         HZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735343950; x=1735948750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9GD6E8fp/FwvixoMNl/hFkENwUOIXNrn02wG9UqtG4=;
        b=UUe7HYVboI3TU8DGDx8EUBcGtcRCRydpTAd0B6R3+hsy6Ri9vXJUNSU7kbOeZiUFAg
         zE3BQTa0KNibSyaAymtqgrXpzozQfCMjy4DxVgx8hngq59UbImPZz0pXWKhu6hB4rgPz
         alhA5XrkgcxvsAf+Qkal1rQqxjcWqKspAGmafd8VfWzSHhSUvs2tm3RFzcC6ImNfAijg
         USUoUWqGXPP3c5LBym+hq4Z/IuEqH9NmzM94JFeljcyM9J6miSu67nXy/yzEPHOAPYfH
         y+ttR9aRoAicvgUupMCfx2VppolJNWMpTe8a366ixFBp9xsWk1Uf85XvMd8C6o2UXSUq
         IzvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAiwI2qKMmaxU4xVzCzf81W5c7rVOEIsTIXhVz44Fezeh9M+KRStiNRrfs9nd5PXYChp4jdyp31hAFFMN5c5rw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq4494GfS5G2Y/+lF5SCSlaUc1C3zTdNY6nD6ZljOz5kqgFfmD
	JTnTvEnJiAPfYoGtATFWLbksZtGPyJwTKDDplxOjQJUg+UzyLQVnJCuCZHIjUyk73PAIflAW8Dr
	8WHgbk9+mJu84EK+K09KNZIgxya8=
X-Gm-Gg: ASbGncviohvvHenR4zeIYEWAQY9ngLQ1cCwl4kIMpr+fE7VZvKNjlYv6Td75gCc17HN
	PsRo6ZOZRG7b+Dbv2qxqUYMcuFihGPU3i1tM1AbqV6eYocLMnTyNY
X-Google-Smtp-Source: AGHT+IHF+9y91xAzk0WeclG07YYaJBdE2gf7HVbMMZ/WpHgN7HlLp8WAPxiUjkeqzJKcsxPtIyGDxr+7m2I+WGbBIeI=
X-Received: by 2002:a05:6871:d114:b0:27c:a414:b907 with SMTP id
 586e51a60fabf-2a7fb4d0065mr13413322fac.33.1735343950458; Fri, 27 Dec 2024
 15:59:10 -0800 (PST)
MIME-Version: 1.0
References: <20240302140042.1990256-1-megi@xff.cz>
In-Reply-To: <20240302140042.1990256-1-megi@xff.cz>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 27 Dec 2024 15:58:44 -0800
Message-ID: <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present in
 A64 SoC
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Arnaud Ferraris <arnaud.ferraris@collabora.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_155912_308973_79B6ACF6 
X-CRM114-Status: GOOD (  23.13  )
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

On Sat, Mar 2, 2024 at 6:02=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wro=
te:
>
> From: Ondrej Jirman <megi@xff.cz>
>
> This series adds support for jack detection to this codec. I used
> and tested this on Pinephone. It works quite nicely. I tested it
> against Android headset mic button resistor specification.
>
> The patches are a rewritten and debugged version of the original
> ones from Arnaud Ferraris and Samuel Holland, improved to better
> handle headset button presses and with more robust plug-in/out
> event debouncing, and to use set_jack API instead of sniffing
> the sound card widget names, to detect the type of jack connector.
>
> Please take a look. :)
>
> v3:
> - removed all device-tree related code
>   (it's not necessary for core functionality, it only helps make the jack=
 detect
>   functionality of the codec be usable from simple-sound-card driver, and=
 I'll
>   send it spearately, because it will apparently need several more rounds
>   of review)

Hey Ondrej,

Has it ever materialized? As far as I can tell, this code has been
sitting dead due to missing dt-related code.

Regards,
Vasily

> v2:
> - use set_jack/get_jack_type
> - get rid of some custom poking inside card internals to figure
>   out what kind of jack port we should setup the codec for
> - read jack-type from OF as suggested here:
>   https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-component.=
c#L288
> - add DT bindings
>
> Thank you very much,
>         Ond=C5=99ej Jirman
>
> Arnaud Ferraris (2):
>   ASoC: sun50i-codec-analog: Enable jack detection on startup
>   ASoC: sun8i-codec: Implement jack and accessory detection
>
> Samuel Holland (2):
>   ASoC: sun50i-codec-analog: Move suspend/resume to set_bias_level
>   ASoC: sun8i-codec: Enable bus clock at STANDBY and higher bias
>
>  sound/soc/sunxi/sun50i-codec-analog.c |  73 +++++-
>  sound/soc/sunxi/sun8i-codec.c         | 346 +++++++++++++++++++++++++-
>  2 files changed, 399 insertions(+), 20 deletions(-)
>
> --
> 2.44.0
>
>

