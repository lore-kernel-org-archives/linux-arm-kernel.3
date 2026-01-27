Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFECA6CBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41rVnxvkISTHwRblA2rsSFI+6MXia1K7fzxYtKEjBpk=; b=adeUpKJ1If3jScneVwQuXDmwxT
	+F9bgVkqNBpKhRAZ3CJxEUnHLXzO+d08Lau5TXcwZMpj8psDUawJmdTNnwoYzgmyEPPLxm6FCmpOF
	1USkaOhm/WAQHQT4PtTy8C6cXGfEBuR1zBponG6dbmGeuoWjM56vAa5CC4GCv74IPwKkONJ2Pnq7a
	eZSxyzNcTlaIrTDC1JeJnQvXY2tePW/vt/M9ZqQ3d26B/k2VLC7NEWcHIn1YKJW2Tg6Rizh44CF51
	+d8zBvSuf+i/uNfnh5vmYw11n6kllw0llrErrzxjHy1LbJ8m4RX/0DT0OksJqLYc8QHlewRI9pLxE
	KeRsSmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkf8o-0000000Dumv-2mNx;
	Tue, 27 Jan 2026 09:13:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkf8m-0000000DumY-0Xvc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 09:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 67142444E6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9C3C19425
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769505219;
	bh=41rVnxvkISTHwRblA2rsSFI+6MXia1K7fzxYtKEjBpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dYQLFVSx5Rfyajg72DgFUkh8KsjIpNoWUrOwqIIqV2okmnImzo6B+K2I7sW5Ic2Oa
	 HSUzebOo00gTTt2CqvBiDPsiJ0g/+OC4CTjgDsoIzxTKEQ2xEVV1G0EPCc3X6wOTYD
	 97Usj4ilzbDHnP9S9FFEKuP4efdRxNjVLqE80GuO0GGkUcb6kvNJjhO/6HQKAfckVA
	 k+RwgptXkEFDmHpjxaDo3MlVUlJmWaaivUb2dC+fnwEbQjAa2b7wYafv8mTAC0QFBY
	 Li2aQn8CBDe99s+Gvy9D2IL7SV2BCZAplaXnJfwxLwtpGrW/RwBI4ivrvBBhjqSuB2
	 DVmjtGkJ9pY2A==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-649488dc7bdso5099683d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 01:13:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPFjfEBomkcXxHuDSnHnlG8OVc9dkYrxu7k2NCCivGNg9KI81DkOEiYfBW0Z2J354FXt4i1P2xTIcnOyBmzuZ8@lists.infradead.org
X-Gm-Message-State: AOJu0YxV+yoPygMMcfvF6cp8kXvGDgMNOaDImkQ3AKH1CR51Fso2BcGV
	Nxl9dtaVaPAK/uMkLFsskRfwRPwyVywYOH0agyjfP/g/mGD2SsRtG9txKJptQNfQuZQEkkhpJSk
	4fuOBX5kj2C606x/xisleDntudcqjFuI=
X-Received: by 2002:a05:690e:12c2:b0:649:6ae3:59f0 with SMTP id
 956f58d0204a3-6498fc3b237mr547352d50.50.1769505218201; Tue, 27 Jan 2026
 01:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-4-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 27 Jan 2026 10:13:27 +0100
X-Gmail-Original-Message-ID: <CAD++jLkJCoSWM+cy2OTyF9BigRcP-4iF1oGxGzEX8_53YWhArg@mail.gmail.com>
X-Gm-Features: AZwV_QgSaniB8mBIbI3QW613Tst6pG7m7pLrw8AiZD8eyiExQaEqOjZBG8ImutQ
Message-ID: <CAD++jLkJCoSWM+cy2OTyF9BigRcP-4iF1oGxGzEX8_53YWhArg@mail.gmail.com>
Subject: Re: [PATCH v8 03/10] arm64: dts: s32g: change pinctrl node into the
 new mfd node
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
X-CRM114-CacheID: sfid-20260127_011340_219266_B1D1957D 
X-CRM114-Status: GOOD (  19.26  )
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

On Tue, Jan 20, 2026 at 12:59=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> This commit will switch to the new mfd node for representing the SIUL2
> hardware. The old pinctrl binding for SIUL2 will be deprecated in a
> later commit since it doesn't correctly represent the hardware.
>
> SIUL2 is now represented as an mfd device. Move the pinctrl related
> properties inside the new "nxp-siul2" node. The latter one is now used
> to represent the mfd device.
>
> This change came as a result of upstream review in the following series:
> https://lore.kernel.org/linux-gpio/a924bbb6-96ec-40be-9d82-a76b2ab73afd@o=
ss.nxp.com/
> https://lore.kernel.org/all/20240926143122.1385658-3-andrei.stefanescu@os=
s.nxp.com/
>
> The SIUL2 module has multiple capabilities. It has support for reading
> SoC information, pinctrl and GPIO. All of this functionality is part of
> the same register space. The initial pinctrl driver treated the pinctrl
> functionality as separate from the GPIO one. However, they do rely on
> common registers and a long, detailed and specific register range list
> would be required for pinctrl&GPIO (carving out the necessary memory
> for each function). Moreover, in some cases this wouldn't be enough. For
> example reading a GPIO's direction would require a read of the MSCR
> register corresponding to that pin. This would not be possible in the
> GPIO driver because all of the MSCR registers are referenced by the
> pinctrl driver.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

OK this makes sense.
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

