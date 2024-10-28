Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0D7D5B845
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 22:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N+/R+yMClr79iDqjsc7AHBZ7heiAvpqxUMbmqWtWYw=; b=4oat7Yw97hdDxP+rtZiuy3ElCU
	ScYSqvsMshd43jRw4ZpJA6zWTc0v2Mdfdw0sWSkTv4pJdoZOnZm10uVHjbX5Yw6fBeFS0cbb9U9yC
	+PhyngMtoObzuOdYejzeLKuVz1ZMmNoJuEt2C+Clb4tXBrzWt9WHX4bc3/flpLxPuIMv0YWC2SNBq
	TDtn9dKeGmfTYVhEizNcMPaslFjMrM7lxX+xiTM7+CTjD5lmMLQCIE1C/FMxjLHl1INBtprZ1OaYf
	H1bvchCHboFJC4hws/vBY589BgfYW4LpW8r6QwvNud3YOK5uRDiPZkUgHgWVD635CWJRXfk+qbjzP
	wU5b9I2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Y6o-0000000CVSj-3guG;
	Mon, 28 Oct 2024 22:21:10 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Y2H-0000000CUpR-2kw1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 22:16:31 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so44162301fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730153787; x=1730758587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N+/R+yMClr79iDqjsc7AHBZ7heiAvpqxUMbmqWtWYw=;
        b=UOt9ZnzKqcWyFSi7jFub0Ny/0y9VEXZTnINlsou6erRz4suqCSCda3uT6wurbZt6BO
         gh3OLhMofMC27lVTIUVWE9gxh/io8E13iELxlzefaq92bDhJzWqRjewWWYhSQ9LyMnCJ
         GkZg3Meffm4l/6nFGy7nMslOeNQaS1qER9jPcrotKHB0GcLniBNnrESDJLrbhcbL1q5Q
         ECWs02IGy1HM7/x3TcaxF9K8cbARw4wfKtMkFOPfMV+n6dBjzqUSOWsVDvGc+ZxttQnk
         t2Eyx5mLYSQJ2NueQxcxKKnNP+RSvff7+qCgS1L4t4VAsK3ipztCnYGVAIx18OvABfNL
         xlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730153787; x=1730758587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N+/R+yMClr79iDqjsc7AHBZ7heiAvpqxUMbmqWtWYw=;
        b=SRyZZa3ntTlEwK3heRRtdXrN3KLbSkLj3B4yqoqCNaMOj/7AqFXl9F/pxfKiafrpe7
         xtJHta9DJNptgzpWC/eCoiDaZqrBiXu7bmV0f/OCoHYCLkee+6dVqDblLHn8dWphT+fD
         BZSj8eBY5QcTvOiOOlNzbBSmTrWNtdQDN8ruPBlytCm4cLfO+PJWevtJaeLOgNlqgz5q
         Cfva9yTvT5t01Yovy8LyWjqCfYWcJZmIkBR+lk+h+TYTL6D4sV3XT4FDnVn77pJ7WeRz
         /d4VY4imN8gAhEs7AbUJm0/RmAv0Zex5L8ZrGamosd/RKwdRZLO9IBVPh+K49FTZIzC2
         qBkg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6KLAM+JIWKyFitU/NMTtBrSiwCcJ6byHSS2A7u4TYpxbgaMGLNQBzZTf5HcsLz3tUQRM3m4dwnmAmDGMTsPv@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq09olX2G98Tyq8zuhdJrXFqa0iZERaTHwO2Vq3gvem3yAi/Dt
	YxhPow4mqtGI6A+rJ0iyvfxzxKgCYcppKlkpsRkj/Cid/vQHMz/ZhpBK7wth2zc4Oim9OBNrx3g
	QK9B1UXdqYQPOJTC+zC/Xvoyr2nx/EYuddFSdJA==
X-Google-Smtp-Source: AGHT+IE6DtBNue66FAZk1osaVTZDa6IytIhVHf/6SKY95NzMmkOdQ/ZCObzh1LjqdFsUEbcb6iyLGOIb1MzYzR00K8s=
X-Received: by 2002:a05:651c:211a:b0:2fa:cc12:67de with SMTP id
 38308e7fff4ca-2fcbe0669f8mr41305041fa.32.1730153786652; Mon, 28 Oct 2024
 15:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1730123575.git.andrea.porta@suse.com> <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
In-Reply-To: <b189173d893f300e81b18844a1c164fe4ad5bc20.1730123575.git.andrea.porta@suse.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Oct 2024 23:16:15 +0100
Message-ID: <CACRpkdZCbvNY=B05e9wGqNr5b4t8GrDVsr01C3xd5E-WWwPyMQ@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] pinctrl: rp1: Implement RaspberryPi RP1 gpio support
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_151629_745793_1E79DFAA 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, Oct 28, 2024 at 3:07=E2=80=AFPM Andrea della Porta
<andrea.porta@suse.com> wrote:

> The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> Add minimum support for the gpio only portion. The driver is in
> pinctrl folder since upcoming patches will add the pinmux/pinctrl
> support where the gpio part can be seen as an addition.
>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

This looks good to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Can this patch and the GPIO/pinctrl bindings simply be applied to the pinct=
rl
tree once the bindings are finalized?

Yours,
Linus Walleij

