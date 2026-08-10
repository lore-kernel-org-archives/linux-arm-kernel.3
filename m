Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBBBC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 19:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=; b=gy8SIpajQmnjMvxX6mX8xYkmw9
	VVZShpAckbZeS6ckKuuObYpY+fYlQQKPKKXSa/LSSIAvjv1wktDajgilgevClIHL5Tsq/Xh/S0iDF
	mlmPbY9ADBO9InCLOw56x6X3+6bPRAIaS2pbvyslIS2NzORlo3aKvyWzWwg8pgKS63qlKCgP87LN0
	DwlNF91eJG4lYhnFvMwwRqI5As8UABvBwQtnPzBZpBW3NVsUc2vRjWTLO3zxNc97235D07Jasoehf
	SODZfZZHUroU/Yb+WKIBPsOGGdwaIfS4TcJJadjw9l+z02SoaNs3SQT5yNGnfWvTwPgCUDKKmEA5H
	8JM0rjgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVt9-0000000Clxf-2gbV;
	Mon, 10 Aug 2026 19:42:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtVt6-0000000ClxY-0ZIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 19:42:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C17E544046
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 19:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A912E1F01559
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 19:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786390939;
	bh=a/RorDak4AbNVbw/fWC8eA91U4vFHIR3vGa//TAL5kU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kSLGM9fvZI2I6QdHwXN0GjtPaULcvCw9vClBJvqivQxrdMkxYyJaRVbE3dw9Eg0pk
	 gV9irYScyYu3xK17ROFreMHuX9kjNrCsAI7rTWmkA8bsJv37uaRG/Q1i91vBEsdUgF
	 YeOFxPs7saOgvEvi4Zeb+YNk8YhPmK+vMCPBiRYFNUkY4TLRLuxOq4Dc0hZFhhI8e3
	 tKJkrH7B5676yvOgh5CfKkNSh1T1uN2TG66MEnlhrdm/SUiD7x87+TLkC78ihLb5y4
	 UiFCyMjEmhKX9kMCNnOdxIEpJLkERQOkYray6+KOiu7troydDHQ8l4Mmgk5yO3hUFK
	 CuDJ7XTxoQmKQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebd52488cso2360666e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 12:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp9nzjjt4sXPrZOOoie7fjAgsRJ2aWiDGS/iYQhcy/bkhO7C+cFeWEUsqAJe1Qwcr50jwgaPdj7/BmIN9EjAjuk@lists.infradead.org
X-Gm-Message-State: AOJu0YxN2jF9q/GlES6W9L8tzCds66z+KykwOyar0mE8NATgYGDtWDQB
	ghYwHHq6KXyoOg3Kb1Lfu0YuC6J5PqCTGXAgTKNONjJ3r1YVOSEnA1utS8qWzarKX37E45Iouxd
	az2BA+Kai8sXcP+iwzDU8aCuIMohgDRw=
X-Received: by 2002:a05:6512:61a5:b0:5ae:ba8e:2ef2 with SMTP id
 2adb3069b0e04-5b3181d3181mr686062e87.51.1786390938286; Mon, 10 Aug 2026
 12:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-7-6b09707c5fe9@ambarella.com>
 <CAD++jLk0LoOJk=TXin42AL3_z_7eVVkvMnYr1S8090C6A_B+dQ@mail.gmail.com> <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
In-Reply-To: <DS0PR19MB7925690FD29D578D8AC5D10EDADE2@DS0PR19MB7925.namprd19.prod.outlook.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 21:42:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
X-Gm-Features: AUfX_mzNR-BpdsCoy7KeBCm5BOABzsx_ocJuW04mgEWpmksgWM6rzG04G-gloAk
Message-ID: <CAD++jLkUPU0eujvWc5Hn1tEu4n451LvkuGGT=j6OfirJENpRgg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 07/10] pinctrl: ambarella: add Ambarella pin controller
To: Long Zhao <longzhao@ambarella.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
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

On Mon, Aug 10, 2026 at 6:02=E2=80=AFAM Long Zhao <longzhao@ambarella.com> =
wrote:

> Thanks for the review. I will rework this to reuse the PL061 driver with
> per-variant register offsets, and evaluate modeling each GPIO bank as a
> separate DT entity. The duplicated GPIO implementation will be removed.

Thanks Long, I think it will be easier if you break out the pin control
bindings and driver from the patch series and work on it separately,
the same with the serial driver at least.

I understand this can be hard to test on the hardware, I usually
put a few patches "underneath" the b4 cover letter, and then the
b4 send-email will only send the cover letter and the patches
on top.

Yours,
Linus Walleij

