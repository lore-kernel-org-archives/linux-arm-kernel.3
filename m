Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7329ECA6CB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUhj1h+j/Imb2Ww2zabIdlu+x6HIizJJkQhZly5o+rM=; b=GJVVqAVtE+xtOzYRHflVTXBgXs
	u2+3dIbsClBYHETE3E4uBsIqITzmYTsxNei9Nxc7+4Z41RO86aVxpE33HcXgXMmQnhGYJBHgLFwfw
	t/1u4z68xuo5kolO87J8KAQ/hczdZn2pvjTEP/KoMG42IbUgcdmMGeJi7+fRNkkZ77G7ecZnSyQFh
	bf+yJLxj1yrpEEYZ6zEbBCuXuKHo4GGVvB/6yZySsV7waI026wyv7VOEBh4R3MfRJTSH3ujaR1mwb
	sBItDw/zzSx/a6MGmmmrpuhI4zFU7ezqdFjP+oAZ9KXiZ29Pa4RzrnIIbZ6LXgvQdh0/lEnb3+R6I
	uKB82kYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfD9-0000000Dv6I-3rw7;
	Tue, 27 Jan 2026 09:18:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfD4-0000000Dv5v-12TW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:18:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C7356444A2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD760C2BCB2
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505485;
	bh=yQ966Njn+FfjMMlR6gQsKtYlPJxHyIq42u5ygQh+r/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YdwzgVt2AxlbYuTOspMFsTHS/4X8Mp0UFv72qD4KPLeL6kxPy8MuO5TavGiSsolp2
	 /j10zvQ2CF8KVEjoL5nLxHAX4lqc1n2dKBvI2PWqKjjhbydTERJlUw+LxZ3DyAk8bI
	 H3uHvi0xr0G6DYC2bBy6ENLy2dwZJf39/ioG6bylXKhrWmY80dmb2fAmM22G0hR7Nj
	 P8gn7e9gxTJM+iUHamfexFDglK9QB/0dj+UqGBN5d3zQpu2lxdtPXpkdAMHQn24a26
	 a9PX+TCcS6FvU+QSUtAibUYbxCNE0Z0zY+PqS5pFUR25xNwMI66pOEYPtuTduUS+5k
	 Kn77ddULPA8pA==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78fb6c7874cso50505477b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:18:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVodXU0PELvSIKC584Z8XC6mKW0SJHpnigFB5eynD0nBKB2mAbzRonEgCg6rP1XrRQ/4CqBKLhSjmkiaGO16bNZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5MsgH842uZHm3fn7ayWWwO3wnN8KB1vNSuS2iqnLocliIp0Wz
	CC60nWziTmBT3MaG1FwtJB7IUyu1RBdlRRcXgcA3N1XdYVOWsMY+47AAiCp3It6kZSbXocL5SaU
	hVepeevPQl8F0ot4f2ng/nb8fxx/5JiE=
X-Received: by 2002:a05:690e:130c:b0:646:7a21:f03c with SMTP id
 956f58d0204a3-6498fc67a09mr562209d50.81.1769505484808; Tue, 27 Jan 2026
 01:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-10-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-10-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:17:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=oAyWmP=2LhqK4rdQSOb5WJvCTGRUxSdEnttX6i5s5+g@mail.gmail.com>
X-Gm-Features: AZwV_QgpziPUFNsf8KU23ZSvXoPFeeWSMMPX1f5j49l0bdt4rKMCsorpnxg7oYA
Message-ID: <CAD++jL=oAyWmP=2LhqK4rdQSOb5WJvCTGRUxSdEnttX6i5s5+g@mail.gmail.com>
Subject: Re: [PATCH v8 09/10] MAINTAINERS: add MAINTAINER for NXP SIUL2 MFD driver
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_011809_466153_6477F3CB 
X-CRM114-Status: GOOD (  11.77  )
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

Hi Khristine,

On Tue, Jan 20, 2026 at 1:01=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1b020588597..37d80ff0ea4f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3183,8 +3183,10 @@ R:       Ghennadi Procopciuc <ghennadi.procopciuc@=
oss.nxp.com>
>  R:     NXP S32 Linux Team <s32@nxp.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml
>  F:     Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>  F:     arch/arm64/boot/dts/freescale/s32g*.dts*
> +F:     drivers/mfd/nxp-siul2.c
>  F:     drivers/pinctrl/nxp/
>  F:     drivers/rtc/rtc-s32g.c

Isn't this a good time to also add yourself as maintainer for s32g?

Yours,
Linus Walleij

