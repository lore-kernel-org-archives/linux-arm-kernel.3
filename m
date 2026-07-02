Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DDFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMF0XPgxh1bPvJqjJzOCEAXRRBEy4S34va7nAbDWY8g=; b=PTMFVEuhysvK6xx+KE7GR50MUr
	NUsxqzxQPUqZfi29f1kRuhdPJmY9e8O4g8O4A0i7ssGiS9UGpfLvXpngDzW0JY8Z8I12SwCssJ0yJ
	b2YWNyqAy6ifmTUop0HdhaOaH3UMK8gtuopPeAg+MhXPgo5ff6uHz8VQO9NQqiepU+SR+84o4MrcI
	otAPPbP0unjT92IZGpWQP/7/p2lHYncj8Xevb6H35vY9eH0gH306Os92+c6Bwi7azSYHMq3KQBlAg
	b32+IvhdLGnza6Mz1wGjIjI9ohRBO+1XjcJtD0zY+vMdZmwj7WN3j6IRcpKrqIwIi3ABm9kYgVB6v
	kZPKcRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCKa-00000003n6F-1bRs;
	Thu, 02 Jul 2026 07:59:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCKZ-00000003n5p-17Yp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:59:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B503460132
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DB81F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jul 2026 07:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979170;
	bh=KMF0XPgxh1bPvJqjJzOCEAXRRBEy4S34va7nAbDWY8g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D7cSQFo8X6CcFmn5MmR63opL79CNwlOUTkeojVXjQNXiMR+syEvpGnzAJzgda2JTe
	 EcKTshWWfoHgri6T621CJP5KhPqmtmMuECE+INihG66kIVnyv+FllXlXO5dSV4cnHs
	 8+oTuAC/pdev4diCCgPD/5PqsDjZWng4VPkjGjFMyIzWnK5b+EXk+3Iz+sEiMqup8N
	 JHd6zwRstFBKWhdD/dlhJxo4DVV8adaUDRHv/El/U99jA3gTaEhIvYOLzEtEB52l9m
	 TNyLMskIN/1Ez6Ots/C9h1WJaR++JEgpagkKF38Fdqsua2ZriIY55AdkKgyIyZ6pXQ
	 66WO7P+/aNVOg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb8870485so1343915e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 00:59:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp4bJWkPs9bVoyfMwBhc2STE0yfJ+Oe9vH7JgtjaWKun4ztjlWZiX+A7a+0fUimvpdQxP2PaotouPCZKGisBFtV@lists.infradead.org
X-Gm-Message-State: AOJu0YwbUS6H9n7coDDB3uWZlK7ZIOFLU8u1l3eoJFspfAz9/aXgBFw3
	GRrnoRqRGcZet+Dy1IXP5JUjTyjT/V59uQNAMI0upScWNf62hY3gZ3tk4WTOlj/S1bS4+hgCKrj
	TUcfBphq2uoJFGnUxFr3LiZLrOkjpKP8=
X-Received: by 2002:a05:6512:8354:b0:5ae:b4d5:6e5f with SMTP id
 2adb3069b0e04-5aec67b87abmr805780e87.40.1782979168977; Thu, 02 Jul 2026
 00:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:59:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLnrytVkFAcftQ-izh3uLTSF2EVahJYvsfCtEgaemW5Fvg@mail.gmail.com>
X-Gm-Features: AVVi8Cfg-mo5-xyGo9O3KW-dS4uIM1OW6BMV2xJQvOGyercEBg0FSbo8ioLZlCA
Message-ID: <CAD++jLnrytVkFAcftQ-izh3uLTSF2EVahJYvsfCtEgaemW5Fvg@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpio: nomadik: drop duplicate probe error line
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> Now that all error codepaths in nmk_gpio_populate_chip() log an error,
> drop dev_err() call that is made on nmk_gpio_populate_chip() failure.
>
> Current boot log:
>
> [    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -=
EPROBE_DEFER
> [    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip str=
uct
>
> The second line is always redundant (or is logged when we shouldn't log,
> like ioremap or alloc failures).
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

