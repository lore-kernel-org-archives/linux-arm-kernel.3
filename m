Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18F3CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzMY867DBTN5pjOSjRIUSRzjlYQe63UJPO23K/q0Zy8=; b=3SCHvaJF35JTPL3CiMA8Dv8Neq
	LuIRp4cNniDTLjkDp0FOAgJ/AYSvxSOLKZsDbNQOE5z4MSv6cvqGXoF+RGeKs5ggoDBP/2Vyc8Sid
	DC0H7z4POluYR/4JKQBMcXoF8OmUqPBVA61nnPeuiQADjmGLMhFVj6K4bBwNpVY7jTr4bbxv7b0jS
	cMekKMD7CZKiUExy7MNvEbDxieQJqLxjfD31GIM25J40uHUNRNEuYEJ+Sb53RwCubG+oqMpXjPYf+
	jX4i9jy8j4zxIA/M9uzpk6+xb+zUkSMle6Vdp9G9YeKXMOzadtTjTnNDVUsLbG1+1bpLz8jtVzS7h
	dBQAxW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQwO-0000000GgzF-20oX;
	Mon, 25 May 2026 08:45:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQwM-0000000GgyS-2ea3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 08:45:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D3E7445B8
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D51F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 08:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698738;
	bh=HzMY867DBTN5pjOSjRIUSRzjlYQe63UJPO23K/q0Zy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dDlpKJe9ynN4tivU+0I/iVNXkmz8V7D8cY+DYo3vXqn1UYVshRJXYUhU9+Ggzr/rP
	 trO3grk83wo0wkCTxglQBfucaDHfctHTHb580BoJpX/OHzK4mljqCnxAvzi77zSsvh
	 ULf/bnWdghLs1mVRRxE0/+n4XlYuH/JD/kPtzEqOOYLjFcRdXkFID7j5sQqLzvYne0
	 AEC0IpDrGu/M2640NGZecMpy9+bbPYtf3J/2nTEDIZHhb/4ZMjehX7CQq2aq0fROxp
	 IEhrNH76zfunOn/96KhpiyzQkzzVlkFgnGNnC+YU7cpcRRWwcm6+2ynGgx9unWllqh
	 1VJWvK9b1XQeQ==
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7e603d0ee0aso1864801a34.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 01:45:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8lT6im9RBA+sk93kICYs1fJZck7SGA+Xj2rHDv0oGibqnOk/jIIHG93jQCITbiIxI6jKo74YVRVkt4UM1cju52@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZoXCtYoQOy15teObOqvoF5un4KXAWHCjHnMo6DOvCz2XARSS
	eqVDQHHTF+4A5wPdPhOJNxyFd45GEAa2xXdq7lRRf0UyxP23670M9vaCgovTCcmGRgH6s3vTDSH
	UsUxmXlrAY8gDWFbF/fqDstX0/xR1ybc=
X-Received: by 2002:a05:6830:270f:b0:7dd:e032:3ce5 with SMTP id
 46e09a7af769-7e5feed03cemr8122305a34.17.1779698737336; Mon, 25 May 2026
 01:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-2-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:45:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmhUPUxkP=RNqJGVJRfuGS2YXAYt7JH64sisk2MAMxFNw@mail.gmail.com>
X-Gm-Features: AVHnY4LfJIB0vsq8DdAkZL7tiUgsJC6U2Cr8b926VN452Ay9Gg3rU34cLJlAkLs
Message-ID: <CAD++jLmhUPUxkP=RNqJGVJRfuGS2YXAYt7JH64sisk2MAMxFNw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] pinctrl: s32cc: use dev_err_probe() and improve
 error messages
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_014538_689498_863E9208 
X-CRM114-Status: UNSURE (   9.53  )
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

On Mon, May 4, 2026 at 3:11=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> Change dev_err&return statements into dev_err_probe throughout the driver
> on the probing path.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This patch 1/7 applied to the pinctrl tree.

Yours,
Linus Walleij

