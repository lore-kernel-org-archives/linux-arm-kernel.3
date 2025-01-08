Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D404E77197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 02:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=; b=SysuhZoiV9XNSo7B3eB+nRhWnd
	SHgSHC/tAZ57T1OquJQXMMZ4TBKzGO0YBxM8zWw8b25KdyQseK4p/Q+2YYWWvnkIzOF4ehFIFAAIu
	dYZEoZ4aeWIRX6VEg2Mc23ZSMUxRko6zZocAhj3SZ+lJ57dLifJLLsvlmwtCiw0GNK86CujjM0A35
	7XJ0e9pucUBwSjAqYvO1zO1zp7G9G5N6xB3FATPXZbV1EZeF5+/OrRF/5k2TtNxvWEyODOftnr711
	HRJXDy7yDgJhUAxzB/KaaSMa0sm8mMuSfzxgNIomQqdetQBdwi9pzBnExer2MOiY0KKDh4Db2/ycx
	vbYOIghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLqw-00000006urg-1JZM;
	Wed, 08 Jan 2025 02:31:26 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLkp-00000006tDL-2ZmH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 02:25:09 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-29fad34bb62so8243378fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 18:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736303106; x=1736907906; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=;
        b=HSkzzf0DaHHZqwPE2vPUFerkzIQOGuMurT9bHMMb3qwDsCpUQPgcG/IM5AyctmO4de
         vExMELeBcFJ/4UmxP2keHhk8384cmykptuw8RHJGeY5kixvc5NjDQAkXivLoVDeB8HhV
         Cf5WB8y7prrYRVZqtu1cPHOnVTsBxn0wRy8aJBE+J2Spe9SmNkQsPTpSu7SP/L8R7EdP
         3TG2ErmERGso2cUhBpu2gtoeDZYdj7kljMW8xpUabfuiQQ0bzFXUGVCMLKSmvQN/hbg5
         rgPQ2XWTFIyboX0PH9WMF0MLehXbcf5eIA3kqmaH82W8vQVCQd81klaBcrMgvPaTeWcS
         KDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303106; x=1736907906;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+znau2/SxzOfAm5TaFDXUlYIMNrBzWX4AMaXWidTqo=;
        b=Dllz7rHY/QajIF0u2xNRIN96wK95OQEa5qMH1/quqOf57bPPvfRRb7va7NhzilqF9q
         wsIoRcCEZBOx17s8vetBs6SNZJwm8DbuQ/OK6mgxjowitd9MFK0EF18mznN+fbkYlY1U
         jY1vW4BJ2z42ARJsIEie8GdPBPfEbBbfOhbBJUdNUKgcsFavv3ED0tLJT6Gq4JM/UuJ4
         2ALU7ChyILqiFgzCOrUWQD8mTOmpNAEIBleSj9YQUQ+laxxKO1Sa/G1KmosIWrpc/R02
         YmOQQ6y5Ad/UVw/Xa8SCr8fq9zZjcjSY6+FQpAeSrxlo/zEHMBWCS9o8Ix2mHqqpqAGi
         5kEw==
X-Forwarded-Encrypted: i=1; AJvYcCWYlq+zp6QYWDbtBdrzVl0Cz8tsPLwCJaSsupYQRQFJZ/LQvVrAiuETU9mtycUe58xcrUxaZQgxoFkbtwC6rTEc@lists.infradead.org
X-Gm-Message-State: AOJu0YzslFd5k9v9dUPEvn3hIS0t9mtOUGQo2t+E3GCjh/gS2SD2m8Hf
	1H1vvlJ+x2534o7b6B6NI+HKYCJtqLG1mxezDF0m7jqFgDpN25TKTb680Q8apSwB57+/JLOMPHS
	/mcaSralHDGl5W4boJ/dZNvksiew=
X-Gm-Gg: ASbGncuuS3xFEk0w8eFG0F57XYIXxmd5b7dF0YWyDG9Cyd5Dx6SOQU7/tSPey4fe1DF
	UnaWCRjsEnNbu5D6HV1eA66RKHyDDrBb4OLgBHn7CHvjIYY89gMf7gn2nJPyBQsSbmRq4z+I=
X-Google-Smtp-Source: AGHT+IGimp31Q2+GIXmJCiU77kiAeGfSZMa6DDCh5lmqyMkyk3np84Arcp+XHpNIL2EKTQUC4MdlEo+8QKTb3zmsQGo=
X-Received: by 2002:a05:6870:2f18:b0:296:9c08:51a3 with SMTP id
 586e51a60fabf-2aa06998fd6mr540344fac.39.1736303106023; Tue, 07 Jan 2025
 18:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20240302140042.1990256-1-megi@xff.cz> <CA+E=qVdq7AHYj1scKbyGmarSZ7u=vLMsQ63nDTDQBu2UaL=Xag@mail.gmail.com>
 <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
In-Reply-To: <dfb3lsuqf4yowkovwwi6iiroslb4r357u7ddevntdk72ivxcjz@3spuwm24ubwr>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Tue, 7 Jan 2025 18:24:40 -0800
X-Gm-Features: AbW1kvarpSVOWiQEcu5eIaDkv8lEzWepv1weHLELLVGIQHmXGts_5WHJYUNkVAM
Message-ID: <CA+E=qVeDw=p+1qSmifXTscOUVSSXnrYFVNY2+-_DcUNXe51eAA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for jack detection to codec present in
 A64 SoC
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, linux-kernel@vger.kernel.org, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_182507_676377_676EAAAC 
X-CRM114-Status: GOOD (  21.96  )
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

On Tue, Jan 7, 2025 at 11:23=E2=80=AFAM Ond=C5=99ej Jirman <megi@xff.cz> wr=
ote:

> > Has it ever materialized? As far as I can tell, this code has been
> > sitting dead due to missing dt-related code.
>
> The code is used with some non-mainline patches. There was a bit of
> a problem with simple-sound-card not being flexible enough for complete
> functionality of audio jack on Pinephone, so I had to extend it a bit:

So maybe it's time to respin the discussion? :)

> https://codeberg.org/megi/linux/commit/afbe7688083cd1e3ab98c37e0fe0c28d53=
0829e1
> https://codeberg.org/megi/linux/commit/95552b66a269c2da434edd3880f9819c0b=
d5602f

I think the only fishy-looking part is using device name instead of
device node here, i.e. something like this would look cleaner in my
opinion:

simple-audio-card,jack-pins =3D
<&codec>, "Headphone Jack",
<&codec>, "Headset Microphone";

However, I'd like to hear the opinion of ASoC maintainers. Mark, Liam,
what would be the best approach here?

> https://codeberg.org/megi/linux/commit/c15070c220e7425dd0d0445ae0eacdb4a4=
872ad7
>
> Here's a bunch of patches that I use currently for complete audio
> jack detection functionality:
>
>   https://codeberg.org/megi/linux/commits/branch/audio-6.13
>
> But no, complete upstream support did not materialize, yet.
>
> I'm not sure about the direction. Whether to push more features to DT or
> just write a sound card driver for Pinephone, that would be able to handl=
e all
> this without extending simple-sound-card or DT changes to codec driver.

It's not really Pinephone-specific, all A64 (and probably other
Allwinner-based) devices can benefit from generic code, so I think
extending simple-card driver is appropriate.

Regards,
Vasily

