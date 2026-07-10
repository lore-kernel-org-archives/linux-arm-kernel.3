Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA07C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 19:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BS9a11S/ASQzzUnTlPyCH9spaY57RR0shSO+pm/PGw=; b=gnFhvGzM0wO63+AsArxXuYcYoW
	mx3fZkIaCVNDPeU3NppJ0wI/HlZ+8qd/hnvVIUQnT3WmQYoZfCw5wOQzI1PlJtgxX/84ofWTpUweT
	/MK2yLviKD7AP40wZwwWJkAHA5jftMNsgB4OuTqQpmEDl1k8KYSVTq5BdUPdOaZbTHdf1FRcBrP5L
	Z/svd9YmF2jiJAu7eWOzXUIEtGUjvki10j2fAw+LCa8nv6QbIYaYKGYdVWV/1FDZdUfDCo4t+wh9b
	6EcBR36qawXLW0DP1TTTg7wsfSqvjdYTmWItrSA2lAt//qjsTOpzgPNiHW21SYDFt7P84GY8T8DdM
	cnlDnTAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH64-00000005cil-2syw;
	Fri, 10 Jul 2026 19:41:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiH64-00000005ciN-0oUB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 19:41:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9622043EFE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6001F0155D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 19:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783712475;
	bh=0BS9a11S/ASQzzUnTlPyCH9spaY57RR0shSO+pm/PGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G/3eTXpwb9YtyJg2IHMVyMTz8QCkrCnC84GGVHNcGfz8gz2bzW/RdHZ9KtBEYKE01
	 5Fq7fTf5n/FyAGOL58ZNPi2j86NWC+iwLZu8ihoa3mQ+3rnbZRoAlf+gC2FX5XOHGe
	 QWNbJ/g4K5nwOZZAN/Tq51nvX5XbxMfKIzF7l0ATnU2VyBMoEzdwVmsTeCcgarjgcz
	 susJwHa+pdoZ+NnFfkaWgE1alMxapZ8/OFkKJ2oHJaP9LrL57jXI9Y+VWfae3mmSLl
	 6X6p3ImmFT9Jze9S5q7qLFzmHp5zok9EKwgCKSuliH4TdjpG4PMxtsnq5wG0521gsa
	 YLqHE7dCsofcg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aeb5829fd5so1183966e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 12:41:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrntM0NRh6OJpvCJu3c2aLFNAvBdhkGkZITg8G3H4vvA3F+OfCVlP0syJ9rEarmBJUXu3UVuo6BD0aLWVxuE7KG@lists.infradead.org
X-Gm-Message-State: AOJu0YzLq6pq7ryxcc9fhXDJSqPalG21ySUz2Nejlqol63rZaydNTk0g
	lainXshRdsHVO8RNz2NXIOEEqrD2Qb2rKJZVngd7gXv/Hft+/inGBtXkgcCuT6ZKmf0I9An6Vm2
	mreWXBajf71nLyVK3r0a7Vd2scJ5X4is=
X-Received: by 2002:ac2:5a5d:0:b0:5b0:136c:5cb5 with SMTP id
 2adb3069b0e04-5b0236670d9mr74091e87.20.1783712474237; Fri, 10 Jul 2026
 12:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
In-Reply-To: <20260708-samsung-kp-v2-0-3c6ed4c9b3b6@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 21:41:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLn7cLCgKLf4RkBFP8yhrLs9qcteygwiAAc9sS3Amih2jQ@mail.gmail.com>
X-Gm-Features: AUfX_mxh6L3gr1zlgEqCXxbqPp1yls-g8dyPSgWL7AUruP9FnQEvhxSQ-OlsUYE
Message-ID: <CAD++jLn7cLCgKLf4RkBFP8yhrLs9qcteygwiAAc9sS3Amih2jQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Remove support for platform data from samsung keypad
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	patches@opensource.cirrus.com
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

On Thu, Jul 9, 2026 at 6:53=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> This is a reworked and extended version of the series previously posted
> to convert the Samsung keypad driver and Cragganmore 6410 board to
> generic device properties. The first 8 patches of the original series
> (general cleanups) have been merged into mainline, and this version
> focuses on the remaining keypad rework and extends the board conversion.

Looks good to me!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

