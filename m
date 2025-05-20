Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4987EC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 22:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=; b=PBOrRm1Ywkuws8C2taxvr6hvGK
	tymKa8IFxQm78vi/3SuxBRRexP8rBokT3iyW9jNsMaMVNAnAZuup2+2NfUjNmiPRkPtWNUBsbC/5G
	990swVzWkJqsdsUuHC50lhfhQHPIWXv/1Jn12i9Kjrla081M+5F3jEabLQAW6cO3iVWohSjW4UR7x
	8IEu4hQdbO/3vY3iyENDmtolyvbrWNU9VKWrxO6R540vxjyHKuk7hHaTS72vRpqJMKZYSFB5Qi/BL
	vuOxEydAPZ6XjCMaIrBqDCfmZj6V44/Om+yvEYlSJlgsINyGVUL8Ub6tnJFCqDthgvYN1fhgHhjwM
	2Epdbzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVGD-0000000EFVY-0suQ;
	Tue, 20 May 2025 22:16:33 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVE3-0000000EFNP-2VQ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 22:14:21 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-328114b26e1so26433621fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 15:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747779257; x=1748384057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=RXWhPkzZWxXSNQN8joNQo3KZVZ749tu2XEvRiMF9jLFv47oQxVRVQKDv3QYmgm4Vg6
         HF9vI44KI8SH6jZQgrWqeH46Anse0ej06xxyEuCnRrCjGfb3Nvz1HJ/DZfQiJOoEBCmS
         70ujRmUH+1BpSV8sWJ/Tl8B9ewynhChothyOA6lH4+cInBqXJowY7NM9Zq8mXoOU2f0h
         +tXpcHiQiwIqo+6iuTKYdpr0S6fj+Rw8gXyqodW7T/haDuUzdY+F/3FUOtj05LSwwZgm
         Acxnz6WlPrM0Qgmbq+KbzDShhr6e8GVVopaqOU/92jb/L52Bx3O29GqTUhJaPZGm/iOy
         qbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779257; x=1748384057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KKxr0NhS0ebwaZO5bcBif23znaAXOSTxXvDT9vZo0g=;
        b=UAYCrrf16QcKOrrDbgH+6x++Ui6DccrV9d0Q7Q7SdlQxu0sKjbRTJtnd4FngeDTO3F
         nIJ312ZONGT3htLivbyQRnfnDWuGbS2x0k9GzTBd6ToV/viLhZuhdC/+4Qk1EAld/whF
         I+u2NONIQqh6LMP5x4FNrzZE89D6fV/M+NGjn6x12bnGHXV8Zl0sF4xezWx+9ZB+mqHH
         Gl/aSc7X4Qxbqqt9aPvEYXetM+bNWxYYFfv/668ZcDEthFA0lqr/dG0qRTmPn/Rd5vd5
         8Pfj/vLOFKBUDBNmykYqT4kgImI95EVBr35GBcyTSrJq90ATeXq/v4u9l85oKvRJ808p
         rQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCWqgm8EQTnITrGYl2LcqlHceu2QV+RQegW45nKZInSKEvqcxI63cIdtIAkQIHZ0ICtofnB5uMgD6DDm/EJdM/cY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj6JeeLU9cxgQXyHlI/Jr5oX20+sB5RyM8mtlpP4nyowkxfC/z
	nSo9nwmjnA2vX4ksjDGUHPFFG3zU9bfbrs62zH8LFzMIyJsuuL/eV1k56lMsCmXRViPbi9R4eFB
	gPw1mKi16TLxR1GZ/mfkFFptz5VI+Yn3slY7h2jqvVw==
X-Gm-Gg: ASbGnctEUdVT7YE/FKP+VFxg8WFRsDATJficTHIG6W3ZEx2SVacDpuCdGR1H5LwYjRm
	3ZkvkhfqnBVG3combLpAD2EDPZBPEatlzeU+xbgTYee5SsUI2wkNgUd3ABmx21QQSyOJlgu+xPr
	dSFc+1dz/YFmgaUAQ8KpmgvbUzCeokHYku
X-Google-Smtp-Source: AGHT+IE2I9dkpHJtUzuV3F55HIcCy4H/0xE0bIT2P9EiCFLTqHbK469GeJi8kQXTq+VvjFFqjzVGAT63GH/fgS+P2nQ=
X-Received: by 2002:a2e:bc1a:0:b0:318:7f36:da6f with SMTP id
 38308e7fff4ca-3280974b19dmr60101281fa.26.1747779257574; Tue, 20 May 2025
 15:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-gpio-dts-v3-0-04771c6cf325@nxp.com> <20250520-gpio-dts-v3-2-04771c6cf325@nxp.com>
 <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
In-Reply-To: <f0017caf-8fd7-4046-ab7c-71c6560b7a95@gmx.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:14:06 +0200
X-Gm-Features: AX0GCFujWmK7RjwxHirjq3655UF2TsXAVvYT5SDx5SrWKMcU6UcS_lP2iMrNx4c
Message-ID: <CACRpkda1OKXnma11wKTrBsO_AAXrifVK8RDCKmufdHXBMmtMbQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ARM: dts: add ngpios for vf610 compatible gpio controllers
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Haibo Chen <haibo.chen@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Stefan Agner <stefan@agner.ch>, Bartosz Golaszewski <brgl@bgdev.pl>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, peng.fan@nxp.com, 
	conor@kernel.org, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_151419_649212_9E2FF417 
X-CRM114-Status: GOOD (  12.11  )
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

On Tue, May 20, 2025 at 12:54=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> w=
rote:

> sorry for asking this dumb question: why do we need the redundant ngpio
> property in case there is already gpio-ranges defined? AFAIU the last
> cell already contains the necessary information. Or do I missed something=
?

Not all GPIOs on a gpio controller have to be present in
a range.

The ranges can be multiple and have holes in them.

The ranges are also optional.

The fact that this DTS file, for this SoC and on this controller
happens to have a range mapped right over all of the pins
is merely a coinicidence and not a general rule of any kind,
it just apophenia playing games on us.

Yours,
Linus Walleij

