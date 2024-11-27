Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D329AD6D227
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKtZKcmXb2M6spKPqMefrmKou8p8fKIrTlFjEhi5x+Q=; b=bZWvNJzh6p06bypKmQ/6DJmi9a
	TCBrauYLuAebHkcP+5St1iNHaLidhbMy+EJ0xPRZQ23+QeMj1yjlLzEkiRLGxjNWYkFMEwH54TJ21
	HvkO5W00xvZGLNHr91/PNfdMEnXLTcJB6sH/WY3pUY0YfVSV9v84EG8ARiBo3azjJGdN/2xgKViWc
	C5yvbFPhfIpuL2UEPrpTVy1wdykYyMRUWiGgdgfNT3GoSzORXfHXRJNcdt3VrgNCbeA3VYpabFSeE
	Vn1PK4cagg7MHmmyxi4kOr1P45MFYuRpoRTayme/T+tseFTT37KaQia7/jvARGfMvmFP3HXnlSsBS
	5oNb5xGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNqo-0000000DxZI-3CpM;
	Wed, 27 Nov 2024 19:37:26 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNpq-0000000DxMA-2FSG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 19:36:27 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so992031fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 11:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732736184; x=1733340984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKtZKcmXb2M6spKPqMefrmKou8p8fKIrTlFjEhi5x+Q=;
        b=Eqz+l03nrqFXuXahLtFB3fomJHRShE2EnKrJmrA9NHRHRVtclCE0LN3xu5qgrvAOmE
         8RWSQIa+VHINPNSJNpz+JhOHwTVb393CteqwSPB1tdnUERWNuVRrXHGJjzqKQxXOYmZR
         zwHf0GQXrQHvki07AP51mzcLDOkpcbYpTx0b8Oo4P3ah10ky54HmGjZNuJGoX0K7ySG8
         8lO6lz5t2If/8nKTkjb+HCRNNZx5dM/TKh5/Uo/3UFZgJwsN4EF0kzV2oeMK8NcDVAA5
         z6AGsqW8oHFbjdyeQax3k9T6qw/l3ssQBvptcAlUcD8HxMOdDyrVSpYVNd/fy+ScvOGK
         gDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732736184; x=1733340984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKtZKcmXb2M6spKPqMefrmKou8p8fKIrTlFjEhi5x+Q=;
        b=WG8EO+1PvewEMGzJv4Agu4IBIYt+K2jtwwx2w/dYszJZbKFur/UhTm4huDZtsLVRc0
         hwEWHjo3tXSZ/vTIAWlA3Bf3fjTGkIJNu9MrxoruimT4/uXe1SD+5XFiJeZf6C4+ZiWo
         OOuYJV7xaK/RqyqXUY0sIEejNTppJeNlwPPN2D/I1vNtzM8vPjjI5S2ESnm9BF0N+i1n
         caRZ+UjpmCiFVmF7YZ2Y5eIEXBrP5sKr8zgXVMGOPUrw9xA+bD86kJjScl6WlilBsPaj
         CbzsAP0uK9W+rFfnkiQb3xKI/r5P5Ev1Eh+b2S7pZXVP7ltVJpHzKpNy8mTsLwJaus1K
         mZlw==
X-Forwarded-Encrypted: i=1; AJvYcCUKcX4d28O97t81bpFkbhZ1zICUstv8i2mDH2CBig/QROg6EULAgoRpoB7Cv4zFrrfRv9waaw9T+9Ofb8exeUpF@lists.infradead.org
X-Gm-Message-State: AOJu0YzZFHnwobr9INfbu4/KEhU0sVhlMoMT6UqzMRuG3dBvxa1fhHnW
	tRxByzCJOxQrMZym0HWGMPxlIhN8uSRv/N+OUV4LFBJMETvsM2adWUP9mdHXCtXBumqPuYlPBGf
	KWIVVc+WOw5Wnht09Ohwv9gdRgEM=
X-Gm-Gg: ASbGncvI3N5EN0xGk2iRVDzeVbNPvGLNaL8FbOjO0eF9e8Hp6FRyaR7crTRcyAQL2wx
	LspcrTa602Ycabl0WoWrIeHPoWywcHZUVgUdCEVUH15EFpQI9ddPhqEKddeqidg==
X-Google-Smtp-Source: AGHT+IFPeS8nF9rsPbtVwAeT0yJgfR0bmbDXQw0nAIv58Wn7uVNgUUVKZ7ZtSZ3kSyKequY0RNGC6L25fA0S8ZLitnQ=
X-Received: by 2002:a05:651c:2119:b0:2ff:a8dc:6fb8 with SMTP id
 38308e7fff4ca-2ffd5fcc1f1mr40204551fa.8.1732736184044; Wed, 27 Nov 2024
 11:36:24 -0800 (PST)
MIME-Version: 1.0
References: <20241127-imx-pinctrl-enable-v1-1-d3431a98253b@kernel.org>
In-Reply-To: <20241127-imx-pinctrl-enable-v1-1-d3431a98253b@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 27 Nov 2024 16:36:12 -0300
Message-ID: <CAOMZO5CbgmGpJvurf0Ctomj5dDOt=dC5X8XvwaqsM9Ce_uXhUQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx_*_defconfig: Fix i.MX pinctrl enablement
To: Mark Brown <broonie@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_113626_575234_68EEBC21 
X-CRM114-Status: GOOD (  12.61  )
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

On Wed, Nov 27, 2024 at 4:25=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> When the i.MX pinctrl drivers were made user controllable by 17d210018914
> ("ARM: imx: Allow user to disable pinctrl") the select of pinctrl by the
> arch code was removed. This change means that for the i.MX specific
> defconfigs nothing enables the base PINCTRL Kconfig and things that depen=
d
> on it (eg, audio on the i.MX6 UDOO boards) stop working. Explicitly enabl=
e
> PINCTRL in these configs to restore functionality with them.
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Signed-off-by: Mark Brown <broonie@kernel.org>

I submitted the same fix:

https://lore.kernel.org/imx/d718ddd2-d473-4455-b21a-15024e46787c@roeck-us.n=
et/T/#mc71dc21d99e0b013c5ce46c0d90940fd8806ae9a

but as Guenter pointed out, there are other defconfigs that select
ARCH_MXC, so this change is incomplete.

It will also cause regressions for people that have their own
defconfigs (where PINCTRL is not selected).

Then I came up with a v2 that simply re-select PINCTRL as a minimal
fix for the regressions:

https://lore.kernel.org/linux-arm-kernel/f65d65b3-b60c-4c5c-a002-81370821ee=
1f@app.fastmail.com/T/#u

