Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53209C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdlUChRX55vO9PpflsrwyY/Uty0XIuzlPAZzfWduU2w=; b=CCAs46NfHkoLcW8qGyumIJoSll
	exkFXMKWrfBG4HxfBpJR0GQdfLoxdnF0fHk+0+ldqfCvpF0QScNLy9PWfJLnAx0O9GhcGoZqv1r7Z
	y2W+vkpfbLzIwtezdHcVM2ndTEcFTCMMw5IFr3sAXqoaoBhZToZnqyMPnq+4+oujmX79eO1pPitU1
	FcNFPBv+iLAz72raFiAZ4Ty3kuaBsfVvcGbIFwywGkBIBTkgwA6lJ0Wba8O+ytJfa0zefstgqqhHt
	X8z0fCLXDANCWhXITvigmWoExiOLl2P1Co+zoyjJsTBv286v2iX25V0GsYCPax055RiN/OnSwuYps
	G1LFXKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumHX-000000028lz-0Q9Z;
	Fri, 14 Aug 2026 07:24:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumHV-000000028lV-1vzh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B89643A20
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:24:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD541F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692285;
	bh=rdlUChRX55vO9PpflsrwyY/Uty0XIuzlPAZzfWduU2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NdobK5P7ltwmAODtEn59kDPeamBRluZxJnXO/nVVW+l6uDYRYpOdFpC1Qw4NmYNhd
	 lRrOvNmFvZznVWctNMIwMF+LwqUWKEBQOpZh7CcfT6aPbL6ytHNBMsqddT3GJhjojm
	 zwAcHFmsgoCl2aORKVrzGFVEMDl4rkjT2TgD3Y5bhVCLTs+ZBQpXIdasLjuPwBU3Af
	 Lzka/D50/HRcAcwVAvWN3x129nZIkkJamcngZ0yXeGLRkrjEWcm/C5m5mb87xgl6xJ
	 fgfXg+Rd4zfrSge6O6pl/r6ptqmZieogAqn2PCAKxN6rJ3kmb73OniseZhETNNYoul
	 OmUozkBbB2pKg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a3166398so709499e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqeeMggIoXJZqPwqio/5pFjnHrZB0Ao21rnmeeMbkVzv+9jjembHaLGjBT4frwKKDV0MTI2Tz/s3IdsWC3t0L7P@lists.infradead.org
X-Gm-Message-State: AOJu0YzA19A8l+qlp7KZjn0jFAz3piWesPI+ABwPzZLfl/MUR8UmDZHs
	mj3RupBFaFebX/M0BtZ+f/AWYyaB3yJiEgl+9CRwNVp00r9shGfIGASBzdP9fJMfsWQCxNeh1jk
	xgcqgOarFqoepqCnjTGwa0/+tR8IDJbs=
X-Received: by 2002:a05:6512:3b11:b0:5ae:c636:78 with SMTP id
 2adb3069b0e04-5b459194595mr444450e87.53.1786692283880; Fri, 14 Aug 2026
 00:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260811-apple-m4-initial-devicetrees-v3-0-6bf32d45ad0b@cyberchaos.dev>
 <20260811-apple-m4-initial-devicetrees-v3-9-6bf32d45ad0b@cyberchaos.dev>
In-Reply-To: <20260811-apple-m4-initial-devicetrees-v3-9-6bf32d45ad0b@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:24:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLkRs5m1m3Y3vBfXvxn13i-3cMXhcEWq5ScD-xbN9uta5A@mail.gmail.com>
X-Gm-Features: AcwNN1U4pSEQhXzI6xw99X3FAIiwxI9oO82g146e3gwAfl2evI9yLHdfuJ1SQuA
Message-ID: <CAD++jLkRs5m1m3Y3vBfXvxn13i-3cMXhcEWq5ScD-xbN9uta5A@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: apple: Add minimal t8132 (M4) device trees
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Hector Martin <marcan@marcan.st>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-pwm@vger.kernel.org
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

On Tue, Aug 11, 2026 at 9:37=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> Added device trees for the following devices:
> - apple,j604 - MacBook Pro (14-inch, M4, 2024)
> - apple,j623 - iMac (24-inch, 2x USB-C, M4, 2024)
> - apple,j624 - iMac (24-inch, 4x USB-C, M4, 2024)
> - apple,j713 - MacBook Air (13-inch, M4, 2025)
> - apple,j715 - MacBook Air (15-inch, M4, 2025)
> - apple,j773g - Mac mini (M4, 2024)
>
> The device trees have a minimal set of devices limited to CPU cores,
> interrupt controller, power states, watchdog, serial, pin controller,
> i2c and framebuffer.
> The device trees for the notebooks add a PWM controller for the keyboard
> LED illumination.
>
> Using the macOS 26.6 iBoot/firmware, the Mac mini reliably boots on a
> single core using the stock kernel.
> Booting with smp requires avoiding the wfi and wfit instructions
> in the idle loop and `delay()` respectively, since those instructions
> cause a loss of architectural state on the secondary cores, and even
> then boot is unreliable.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

