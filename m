Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137E6FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxaH7JEkFGR4j8g8WfN53Ub/nYRVGDBMMmwqa0ku9Ro=; b=YQg/P1ZdH2M20sJEELfdS54kez
	rGA32TGMSJiHEfDKS+PeFvfdVFFVztldczY8t2V/6aMaSu5fXzMVo6d5e0idUquwg6RXdK7C+7aYs
	PZtgJNsMIQBmyWF633pnxM3bcNewcRD3Sh5R01IbiwqgxtKswCNDUkGhG/ZLgbdh3JmzS5FELOWQp
	RtQX6IpiiEhshxNZEP4wrqha6RtyNCvlscqF9fOqXbB0n3J64IpdNMzmAGO8L3wgiODYJEV++Sbc4
	+MXEaJ52+oorPkSMPYQke/bUATyFVWNRLFvMkPJ6qrhLm+CLc3yEyHa/9Dl/Uk080pK6jCET4IAdn
	XJvlLzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCUG-0000000FjQD-2sDz;
	Tue, 05 May 2026 09:54:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCUE-0000000FjOo-3kzt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 09:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A5BF43394
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6652AC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 09:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974882;
	bh=PxaH7JEkFGR4j8g8WfN53Ub/nYRVGDBMMmwqa0ku9Ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iyjhw2LdsncUd1w1Gr8k+i+Ps+3e6h+F5hs6sCYhAgbXsbEr+/plWEpJaqyz/FbBs
	 1HCmosWthE/mVgageM08fXD2GUvFqOdVDMjvAHAQ2QOhIP9RBHchcXjDrXgj8dy3PH
	 br2eS8SqFwFJe0hpo+HJ3WTxVxWVCeiEbR0FuLoj0IkwMvKyr2rMo6EDrhN9ZovemP
	 poWZMvVlY+UFVCx8UzuWQfve7XFMLdU79kAHcZ90xTa970ioeO7GozL0H1W43oNGY1
	 HtYKuD/hhX5Ka8QA9bnLnAK+zytKsb575CazAjxo6VdrC4HwZLoQnKLoI1S7cV272O
	 PkH4A1kq5vsVA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a62f43b76aso4569992e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 02:54:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+DtJ7jFtLP84xGUZdHK6wku0G0Fz0VARGI0tyhIjvMurDf9TnX7UyUdTVje1n73Z9Z6gc2ShLlKZSotvZZQfNM@lists.infradead.org
X-Gm-Message-State: AOJu0YzNhbQYG38fHU8dQkk5TLvvqqVCBaR2l8ROIEpRqUTcOJUZFdAG
	sbiWRhy/RVoXSoG71GimluQ3nJwMW6ZOB+5dAZsrzaL28J1KxPJXGdO8GdMfU9tkL/LGh6dp4G+
	lLWENpdj/93Cc77Qj5DW8SvMuHRaON4I=
X-Received: by 2002:a05:6512:31cf:b0:5a2:bf50:763d with SMTP id
 2adb3069b0e04-5a8631c8222mr5342230e87.38.1777974881162; Tue, 05 May 2026
 02:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-send-v7-0-b432e00d2db8@gmail.com> <20260429-send-v7-6-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-6-b432e00d2db8@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:54:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
X-Gm-Features: AVHnY4LKgP4azk8C0fxvoRTN_Zgf5-T84OtwL-usSAdLEb83x0Y0BnN24IkSneU
Message-ID: <CAD++jL=S6DSOuC-PXFn76SA7e-Lgueu9Z2wuF7icXCVX7MBpJw@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] ARM: zte: defconfig: Add a zx29 defconfig file
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_025442_951665_32CCBCB0 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, Apr 29, 2026 at 9:14=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This enables existing drivers for hardware that is present on this board
> even if it is not present in the DT yet.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

I'm in favor of this, mainly because multi_v7 is pretty useless
for this board, it is absolutely too big to boot on the machine,
the board is odd and need some ARM64 stuff.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

