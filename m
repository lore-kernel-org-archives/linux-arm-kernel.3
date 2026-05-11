Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FABBCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4PF51G6c0G6Gi1ayiZRPE7NCSn5Hkpz/tk0EfS0p0yM=; b=sVRk9286G7uvjvk9OPPLqBhgcZ
	5X1RW+VBSLIYnm2cVY0iMbZhzDKXkF5XASokIcUpGGm14w/ODSI0ecYDcqGpBvxS0vlMpttTRWyGu
	8XVd/Bk59WzMllM8aEko8bvXnl3IJbSA6xh/ATcOfQnnPSpOeRpfU29bBRnJ3M6+zAhyu+TzvHofg
	6T0Vz2p/Qwnzn6Jv5KNmgB+PwUvBjqGnQ1xxduMzXA8nBe8fh5vForp+lMI+y7wXxLiJsOf4nJVjO
	P41dMjshbMMmFeM2G4owxu5LV6LacTtLGPiXRtiJYThVdyHGqGY7nmmZ1UeH7GWvq+Shakkj09LLS
	gcFQdppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMM84-0000000Cm2b-1zwl;
	Mon, 11 May 2026 08:36:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMM7y-0000000Cm05-3tkV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 08:36:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E2BB4457E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453E8C32782
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778488597;
	bh=4PF51G6c0G6Gi1ayiZRPE7NCSn5Hkpz/tk0EfS0p0yM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E06F+O+4HxqCDU69Q2RZ4XRqFkC+C3AktblKIhN+NySNVGkBAeqwV75jFY8Y8iEP/
	 8DGhvJ88CHZoGUAw8uxY3TqmVi3pO+VzE2hb/wn6oUF3Cu/GcXRHSod4878//2wPU9
	 hlbP093r+faF6cGw+0jJSIakT42eS1D4UsVtfedLqXFyv97xgQb+rfhUhmvtweng+0
	 eNbPQPVV6gTY0KrGn0rhfdHuq9vDxZ2g/mVPgBcSQM0YyC80dNQHf76DDGxCI6teSY
	 vHcYNzSmZfDTSHIT6VYF7t+k25EH63+Z/NTEgt9h1gbQ3D1O+cK5egmiUznouI3ZyE
	 kFavRoZLWeCRw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a858881ad2so4197803e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 01:36:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/AfkwhDaQ5W5XohYMDhfNDS1jqHqpC5Pq+fnvNKz0XUCdj3d+s0aYMmAlGygYB/zqvkToLb9QGyorF7Lea+d5K@lists.infradead.org
X-Gm-Message-State: AOJu0YwOl75s2cl8QDwJwqLFOnAjf8lfPYEdS4iDQ2/3eZRN+cYhuH1Z
	JrsRmCQwzcV5YSN5IBiGxB7ThI7T1mxioKbhXvq2j3ZYcnTe6WD3npDgI9emRthg4vo4Iq/tzWL
	HeTJq612PNqf2K7gqTbZtnsAb0ne7spM=
X-Received: by 2002:a05:6512:3d03:b0:5a8:99bd:12dd with SMTP id
 2adb3069b0e04-5a899bd13aamr5773584e87.31.1778488595742; Mon, 11 May 2026
 01:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
 <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com> <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
 <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com>
In-Reply-To: <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 10:36:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
X-Gm-Features: AVHnY4IfT9q6KDLm-dZHjUsaH-0X6qvevfw7aCysYd229WzlzaOSgUqxkeXu0ro
Message-ID: <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
	Prasad Bolisetty <pbolisetty@axiado.com>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_013639_006438_A1A96E74 
X-CRM114-Status: GOOD (  20.81  )
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

On Fri, May 8, 2026 at 9:57=E2=80=AFAM Petar Stepanovic <pstepanovic@axiado=
.com> wrote:

> For example, when SGPIO is configured for 128 lines, the hardware provide=
s
> 128 input bits (DIN) and 128 output bits (DOUT). If modeled directly, thi=
s
> corresponds to 256 GPIOs in Linux, since the input and output signals are
> independent and are not bidirectional.

I don't get it.

Linux internals are modeled after physical GPIO lines, actual rails
you can control. ngpios for example means the number of controllable
physical lines.

What kind of bits exist in some registers does not concern this
concept.

Please check this presentation page 24 for example:
https://www.df.lth.se/~triad/papers/pincontrol.pdf

The fact that there exist many weird things inside the SoC
doesn't alter the fact that "a GPIO" is an abstraction for a single
physical I/O entity such as a line/pad/pin.

> Similar to the gpio-aspeed-sgpio.c driver, the input and output paths are
> fixed by hardware and cannot be configured dynamically per line. These ar=
e
> not interchangeable directions of the same GPIO line;

Are they connected to the same physical output line/pin or
not? That is the only thing that matters. If they in the end control
the same physical entitiy, it *is* the same GPIO line from Linux'
point of view.

> Because the direction is fixed by hardware, the standard
> lines-initial-states property, which encodes both direction and initial s=
tate,
> does not map cleanly to this design.

GPIOs with fixed direction is nothing new for Linux, we've had
that for ages.

I would just have the driver reject configurations that does
not apply and bail out.

If you absolutely want to enforce the lines-initial-states to match what th=
e
hardware can do, then use YAML schema restriuctions on what
values can be encoded into that array.

> For the output lines (DOUT), should their initial values be described in =
the
> device tree, or should they be configured by userspace, with the driver o=
nly
> providing default initialization?

I don't see why userspace should deal with that. The Linux userspace
ABI is for hacking and odd usecases (like industrial). The nominal
use is kernel-internal consumers and those must be able to
request their GPIOs as well without any userspace shenanigans.

But avoiding to deal with initial line states at all is a solution
of course.

What I don't understand is what purpose this dout-init actually
does and why it cannot be set dynamically by the driver at runtime.

Yours,
Linus Walleij

