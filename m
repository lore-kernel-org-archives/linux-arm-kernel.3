Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3477CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6IF5YB9Ms7ikCs0h7PlwhA7b1dkMEzgFjwgA6Kd07c=; b=EAqeIbLQqtiCzFbUWhml+TLEQw
	vmKIOAVRpkqdbbh7A40E9D63hT+xdKDGONY+FuEAMUSQzYFPpU7GLGe916vdMp2ub2V5BaWslf/DU
	qJh9bdZA35UV8vPIlsUPpho1PjFamaJJ0UeTd1SkjFppJIw1aY19qjG33jK8wHDWRDQ7GFCvpZ7wS
	34Iu3nOJsDaGGq5zJpsbsaIA4W2AHsUQ6qMrrVWNl/pgrZWidak6w27BUHdBBuzBssSagQyvEYiga
	9jfILVaJJ8Y1H2/y4RC/gtnA/hG6NYP46Raq09S/uKJGdQGysofgGhyOi/jA/e+QOuwoLfl1/wW0Y
	OAFGwvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4CZ-00000001bJ6-3a1i;
	Wed, 13 May 2026 07:40:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4CY-00000001bIL-28F5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 07:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AA2A60142
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C0FC2BCC6
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778658017;
	bh=M6IF5YB9Ms7ikCs0h7PlwhA7b1dkMEzgFjwgA6Kd07c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HjcN0k0j8IMDmeyMWq9IC1+RMwcF2uURrHo4dFG3F5jAwJg6VjTYwFi2do9fvW4b1
	 uXrMIIchbuzuxLiAt9TFOOhCiGOoW0Xmddh7y58UooTJW25CKUZSu9RsYTf0LWxB8N
	 DGSG7r++j/SUo3Y26ZaiEk9hhMtt8Tu/t44v+0cWjrffushvh+W0W7khVn1Bwspwly
	 97xJ8bhJ3idHX5pCuS1xVJTeku1/6hn/hkgoqlPalMRBeOj4E1V1a2VEGg9cjJTdKq
	 OifKCmj2/wqt4NYLNb7SuyY2XrIi4A+dazQRegBf6MKFv/HB6jKUALzBBCd6YBsNSL
	 xqay+x24ycF7w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a87782588cso7405451e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 00:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8LtZlPzXvJVh3w/lChvnmp8EiIEtIZWJqtvoKt6D4d5XKP47UufLQqBoowgRenyaIX2UkTy+tbl6S6bbF7LfPB@lists.infradead.org
X-Gm-Message-State: AOJu0YzXEXpGTz0AY0ZzCszCAUpxW9cdMrOKpttV+bkJVEfH6CyRgoUh
	m0fTiZyLME4YiN3G2eJ04e9avYtZ3YuoTPona6zh337Lk+PU4P5oyvrggEWaK1D/BhQ2gnJr3mY
	sQDwQZ1QFwWR8N7cdrk4jakBdfzoaLas=
X-Received: by 2002:a05:6512:2396:b0:5a8:9f6f:31fc with SMTP id
 2adb3069b0e04-5a8ef9352c3mr674739e87.12.1778658015719; Wed, 13 May 2026
 00:40:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260512033317.1602537-1-eleanor.lin@realtek.com> <20260512033317.1602537-4-eleanor.lin@realtek.com>
In-Reply-To: <20260512033317.1602537-4-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 13 May 2026 09:40:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLkdq+43N11xNVNvq3wYhhDzvFZ=yJL-SCRDhQPbCAVQLg@mail.gmail.com>
X-Gm-Features: AVHnY4LBwJ6oIR5aJTDwxQV6K4gULrWZodoEkRc6fxJoapre3LNZvomIzuavyFI
Message-ID: <CAD++jLkdq+43N11xNVNvq3wYhhDzvFZ=yJL-SCRDhQPbCAVQLg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] gpio: regmap: Add gpio_regmap_operation and
 write-enable support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, wbg@kernel.org, mathieu.dubois-briand@bootlin.com, 
	mwalle@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, dlechner@baylibre.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-iio@vger.kernel.org, 
	cy.huang@realtek.com, stanley_chang@realtek.com, james.tai@realtek.com, 
	Linus Walleij <linus.walleij@linaro.org>
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

Hi Yu-Chun,

thanks for your patch! I really like the direction this is taking.

On Tue, May 12, 2026 at 5:33=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> Extend the reg_mask_xlate callback with an operation type parameter
> (gpio_regmap_operation) to allow drivers to return different
> register/mask combinations for different GPIO operations.
>
> Also add write-enable mechanism for hardware that requires setting a
> write-enable bit before modifying GPIO control registers.
>
> Consequently, update all existing drivers utilizing the gpio-regmap
> framework (across drivers/gpio, drivers/iio, and drivers/pinctrl)
> to accommodate the new reg_mask_xlate function signature.
>
> Suggested-by: Linus Walleij <linus.walleij@linaro.org>

linusw@kernel.org these days.

> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

The rest of the comments I had Andy, Jonathan and Sashiko has
already pointed out, just hash through it and this will look really
nice in the end.

Yours,
Linus Walleij

