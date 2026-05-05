Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0542CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zv+vlCVLeCjXO0SN09QurXnaogZl9i2zBbZOK6NPesw=; b=s8Ajfcedzmn/ZqWlWl0rzdhScj
	IKyO2aRr10hO2571hiGiOxHiNPgk5V6pu+QIGtinGtyBWl0HIjP5pxaU+5ycBsRdRY3A56rzuagJW
	wf3gWAcbbdopTg0ehy7cvknmLvVP11TctoLI98vpFCcVdKt3vADLY9cV48wtbhVZWJgMY6/TkCg9G
	4hVoQaDLq6NgB/oeDqF/gY1BMDbNlS3AqwM85M2s/t+iNMJ913h1sQUz9uw8l2OEgO9Z3iYpEFDn7
	3rcuqU+jOduB/Km25/sT4Y53EsCPKqjUL82TYb0SGYUAXFoxa6U6aEp09lMqcTz0j+zib4nz0R6va
	POsjjCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNHA-0000000HX8t-3Lfo;
	Tue, 05 May 2026 21:25:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNH7-0000000HX8K-2yh3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D69E40DF4
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 21:25:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50809C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 21:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778016352;
	bh=zv+vlCVLeCjXO0SN09QurXnaogZl9i2zBbZOK6NPesw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tmUc7jicozOz4ecoLasRAeYiRFBRlW6kYOwkywcvu8EbmEg1Yy3taCVLdHaVL9m4L
	 1+/QSr34rm+cGpUN5KB5LJI39wr5787hrJ1lQDJr2kRzmo1GswqU3hjuN2xUU+/MlH
	 4WA89aHXVUfW6r0xRjsGmnZbRUm5SbUNc7ch47xYhueY2xEJTH/xLSEtrkAY6yDK8F
	 r2KE9/uIFT1kPF1Y6NNrTn1euvNnESXqWJdx2EtLr1DFjCMZ8A+3UV69XxFw/Tk36Q
	 +Qkfr/nIo/pa+qqc8Td4QpYrI1SbskAeFCA1GakTbnUc/IhuWv4HJMTcinjsc0iFGk
	 2SoB6cpC3tOjQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39393ec4ed0so33646941fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 14:25:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9bhMx7w8NYFAHTbMrcPEM7RgSg/O9IycdGoDIA6WIY6rtjTrvoS25Y8khyXIFtbwKtgbymDsE3e+6Ea/AyaXKX@lists.infradead.org
X-Gm-Message-State: AOJu0YyBBPxrDwcBIJiyGaytw3jEXlYWtDpx5LkDD4di5563+C+nFnW/
	Fj7CR2CsElKPX3UT5dSPshq3CRSRyxh8gpsBcu/vG01syfi3nLclw+Bam0hFBtTmdxsGLfFj0GX
	PeS9GZjtaefx0C2bYOdIXbDDf+W7NvFk=
X-Received: by 2002:a05:6512:3a81:b0:5a8:65ce:e832 with SMTP id
 2adb3069b0e04-5a887ceb5ddmr121206e87.36.1778016351014; Tue, 05 May 2026
 14:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org> <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
In-Reply-To: <02b810ab-12b8-4d44-91c2-ce6bf8ad894f@roeck-us.net>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 23:25:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmO935+DC+Bjjo1huipkZ5Nu-y8amMLWCSfX+0atdY9xw@mail.gmail.com>
X-Gm-Features: AVHnY4JR4hQcbAvDoiohMRDDt_6ZSxWJwEZC_9laXjMXl74mtqE6EYGDsrBiEhY
Message-ID: <CAD++jLmO935+DC+Bjjo1huipkZ5Nu-y8amMLWCSfX+0atdY9xw@mail.gmail.com>
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: Guenter Roeck <linux@roeck-us.net>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_142553_790992_A6CD2FF2 
X-CRM114-Status: GOOD (  13.23  )
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

On Tue, May 5, 2026 at 11:14=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:

> I actually stopped testing the integratorcp qemu emulation
> because it no longer works reliably, not even with gcc 9.x,
> since the timer-sp804 patches were applied.
>
> Given that apparently no one but me ever hit that problem,
> I wonder if it is time to remove support for that machine entirely.

I actually have the hardware, even several of them, I've been keeping
them as a base reference for old 32bit ARM. Ethernet broke on the
one I had out so I need to bring a new one (yeah, as in factory-new)
from a box.

Yours,
Linus Walleij

