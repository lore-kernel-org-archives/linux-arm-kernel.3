Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53861CA6CB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PetnM39e0LL4mZ/BY+88U8MSS+1uyIPhCOjYoVl/9eg=; b=jvFDCSKBTJB2CGlk000Yz7hoUD
	yimZfSBM3pigqpN4Uhm+3qjkXpYi1z0EHzFTl2wZfmXkmkzqiV79dz5VheCNbK+FmeTT1TMp+Ripn
	bVPB0NJ74qsSSbH0BUthvFERZ2SY1SItFoxlrmncR1pvUMAgGmj3gsExXyIGy8rh0D8tXbz9eYgjr
	jPYMegTNRvnqH0MOWbJzX0BT7ZU9iPyOFjqUTUdi2fz000cqX6Acop/3bX7wsKUsrQB9pPFEXcO4x
	prUC3uKGtJff0dsx3o9a315lSNetp3VYtsu36SMkJCaTL1rLAEnHvcCRyC9UUlCREYosCYIyX+mkS
	sLzCe3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfA4-0000000Duvl-1Ta3;
	Tue, 27 Jan 2026 09:15:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkfA3-0000000DuvQ-2Hey
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACF6560146
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D1AC4AF0E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505298;
	bh=PetnM39e0LL4mZ/BY+88U8MSS+1uyIPhCOjYoVl/9eg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NerVTX5cLC7ok0CGMkPxR2psYo5CcDWkmRe0kjDrqH7jF0+VXXxi3ktv5eqrSwRN3
	 WmhsFxynKOi5iM9ngE5MtCHdY7jFmWCaQxD1PK3+tjv2Vg9jfChOh5+Xy9JMEvpS1M
	 bE+0jrVSM+ya6qEZVMHN7nFwcZoT5DpEqG3o0yDEEM+eNY/blCGKDNmgrJC7Aki283
	 BwzINsEcFUplqEQP07KKGmlQeEwD+s8b4jnSQ9BgNpXB537XlSinfG3mHXbCdVxgqE
	 YIGSS8oR9FdZUDXV77A/ZzGcHCBIQrAGZHiwGYAOdMuIgjKauCjU5bxUWirjcDXgKP
	 +JnPLSPBPmw1w==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7945838691aso25362237b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:14:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZ4tmg4saVdmWobyOJEuXmNcorXSGJW6LB3L5oQ7LW6hc4mkT/fOI5yFQuKyct9D5z2b8OCE6Q4cIMXqHIoNNi@lists.infradead.org
X-Gm-Message-State: AOJu0YwMOI2Fxa7ktOEIU3TdlMaZ60EsMY2eX+hk4W+6L9WWtkNjRf7A
	N35LiU+arFs6l1/2Kb5sHTMDr9/pskOrwyPk8XvBHmP27FIgNaHWtH7fN927M0os4Sytgfbaxim
	3AQ+Bstyg+3jaXVVqcnaL2zrzzR3gCLs=
X-Received: by 2002:a05:690e:169b:b0:63e:34ed:a137 with SMTP id
 956f58d0204a3-6498fb11309mr617884d50.27.1769505297687; Tue, 27 Jan 2026
 01:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-8-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:14:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLmC8YJFz9wzPUqEGq2FW_B3U7LvdSpHMEV5ovAqc4WcWA@mail.gmail.com>
X-Gm-Features: AZwV_QhQbgY6YvrIiO44oapfn9_eWa0H_41WHPqnhCEB-EYr7dzC31pzMR8W__M
Message-ID: <CAD++jLmC8YJFz9wzPUqEGq2FW_B3U7LvdSpHMEV5ovAqc4WcWA@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] pinctrl: s32cc: skip syscon child nodes when
 parsing funcs and groups
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

On Tue, Jan 20, 2026 at 1:01=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> The SIUL2 node contains child nodes for syscon
> instances (SIUL2_0 and SIUL2_1) to expose register
> ranges for SoC information. These nodes are not
> part of the pinctrl configuration and should not
> be treated as pinctrl functions or groups.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

