Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A101ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 20:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpQUlKH5NGXNx4BW0dbm4YRXddq/maC4M14dxVlc6zI=; b=g4PseXjTblMVvH7dmIvTYXPlSb
	E2VtKf4zyo2Kwf5/oENkvveAjS5PGI2vJQtghgJ2ZcGU+5QzUJjLBY8eNMCHLZO0ZAx8Qr/oNUkn9
	cl2pV3OS6pYamjjgSkdudgSI0Zzy9B2uAB6DKddWITpxvmc9R2MKwHG5Ia4qsW8D8jVdYK2S+U6sv
	ivUvQ8fiAacveZSp2vMXwf4NlLz6ys40st8XEdROjs4hLyU4FVOMWe4uqfa++dMQILb2t+4AbQuAs
	MtZvhW8R5x8H5t/6JEPd/LT19k/3KENSWbvAYjDKtHSggiHX92XW66oLYYW1UUdcJUQhjNAimZyL0
	R88DJUuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3OV-00000008Cad-2VEl;
	Fri, 29 May 2026 20:01:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT3OT-00000008Ca9-1Vtg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 20:01:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DC8840363
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117B91F0089B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084875;
	bh=gpQUlKH5NGXNx4BW0dbm4YRXddq/maC4M14dxVlc6zI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f8YuViiZM1UMzDAJAq1lo0WoEGF7KHuV4swKSDdmjUkqLe6rdRSf6jcLcu0HT2JBf
	 XCeA1y8RrLdjDQEmLWvITnnf8jy51NYHxyRQARI9jnVrkfNWoojnRufmxYeuuIJPix
	 bqzpnLfAT8Pb/w0qjdFhNg5ezIGs/24C1/dJ/qNWC+ko6x40oF0p5wNA0fyvNWLtSp
	 +xSRnOq+jNRZZa5vvnsHNr8ddDvF2lw6GrH4MwVFRYHicvoySQR/svBmwffiHS6Zhi
	 WcxZo6wzF41oz/KvUdFCJm88oFGQ8Og9uSpI8fUgwnPzNt8/9t9Jh6+EobMQdudF3l
	 5wXsJlWOjW3yQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa5f06b16cso384807e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 13:01:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9+Nwh2nEqgcT0LO8qybLcdSsmBmbyynTN4/sR0aGP+3KVO+NEa2nneuIPbqkGN8Ql021L92OtNH79BhB2Ug7C4@lists.infradead.org
X-Gm-Message-State: AOJu0YyrQG1g9cbrm5QfmfPn3h9jtna1yj6I0wPZ++IIr5QStoDhKprp
	Er4wIGNSAZg0YE/35mQwb+DovQ1wfXmXn2uiCv8Cp+9oeVEXK2BXHQqlSurTMUuzITFVlgXG2Ja
	fsYHNOhW6pxV1C7mTjos4Z6/u2gjS2Nw=
X-Received: by 2002:a05:6512:3b9a:b0:5a8:778b:7df8 with SMTP id
 2adb3069b0e04-5aa6092fb8dmr422996e87.40.1780084873900; Fri, 29 May 2026
 13:01:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
In-Reply-To: <20260527-samsung-pinctrl-maintainer-v1-1-bcebada27279@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:01:01 +0200
X-Gmail-Original-Message-ID: <CAD++jLnAyHeDD5w0Wg2PmdFjjcSa5s3gN=du6edQhGtfsc185g@mail.gmail.com>
X-Gm-Features: AVHnY4JOm0-WzW1G9MqJXGq-A3i7d7XKJ22NGKYBCGIPn2yAsSH6lKQkt7oHVSE
Message-ID: <CAD++jLnAyHeDD5w0Wg2PmdFjjcSa5s3gN=du6edQhGtfsc185g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as co-maintainer for Samsung
 pinctrl drivers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_130121_424112_53F1F680 
X-CRM114-Status: GOOD (  11.09  )
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

On Wed, May 27, 2026 at 11:09=E2=80=AFPM Peter Griffin <peter.griffin@linar=
o.org> wrote:

> As Google Tensor gs101 is based off a Samsung Exynos design I've been
> working on the Samsung pinctrl drivers and have an interest in helping
> maintain this code.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

As Krzysztof is in on it, I'm in on it.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

