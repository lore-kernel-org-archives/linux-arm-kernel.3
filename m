Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB7BE99068
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr5+DY/r74XrPI08rq2r+6e8S4vo7PRdMxQwpUoapWc=; b=1Pbnqj3lKXuqpVchGeZZMQo+L6
	V63K7S2vE04HSPSQ7MM9PkW4aimW3yuhYsSUcYm6WMalBCYSIpNrxTKCfVmWGwysst7+vvKlCgi4t
	2/0JyjJO3cDn8xUo2mbuQeyPHDFbygQsLvokZhekKmB9onLg0BSTqsvoBWk3pm6HGeK4HzjdyFPVB
	BuhjheBVLGLeiQXa46ozbFywio2zNm3qL/jWo0kQvLZqyfIK+3rVf+jh0rM+B51Z8ygsX8M00MILY
	RcasNhoqEHqBpNQy4KQb1VT2Rw9UZWPsUo902dxjT8+Q6EGfPPER0t9HihxpeMoa99txE0U7cWQyA
	MYdn96dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8a4-0000000BxND-0qOI;
	Fri, 10 Apr 2026 09:55:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8a1-0000000BxMM-2RRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:55:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAED0441FB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 09:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F577C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775814912;
	bh=Wr5+DY/r74XrPI08rq2r+6e8S4vo7PRdMxQwpUoapWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T6+n50wfxhA0Z3X4fXSdHd+0nckQVzmfcE6pJnKliP4yUr5vzgO3pZC7NCZ1WtO+B
	 EW5O11mjHqwaUIaPkOIk7+AVVyk4T4kJugmboOcrdvo32jf0wypts7ySU4AmBTBlnB
	 owolzVGoXiy4ck1U0vS3oOCY1gpWkoZkj3RIWY0oZmGNMPGKgZd0MDe1K/ymiSCmLM
	 WTzdFQWXc6h/mbUwNoO44DMth3PuB8z7hKqr4WFGPE0TahLa4HOF8YoObqToRd6mnU
	 ZDTsl53cCud9kPvEgNB+gm6mcYARk16jJs7+AiohMl39rsMO8wzyW6BaUzLWtr1FcJ
	 f9r7pobV/ePQA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a337552604so1630893e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 02:55:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXCPhkS8LEQDk6L6KGKhcBaG/5kj4Y4rDaYRkEc7jop4NIXsbyVnhRG8+zky58oyFpR/7cdYZt4+Y9VMeI+m89+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeid1H6tkUG62+tfnUEzajFnUunYpLSztNgb9SKcNLbxtC6UcU
	uop7RxegtNp1x7PPCwqetk94Ttpde40L7qHcuB6JPDuNHB8A5k02I1JB9DlAtrDGixoju0LXF8X
	wtEdIDW/5A4o6Y41gVn6R1Pn0P4tvaURcR+W6mDCOxA==
X-Received: by 2002:a05:6512:114c:b0:5a2:afbe:4aaf with SMTP id
 2adb3069b0e04-5a3efb2c6c3mr909348e87.21.1775814911289; Fri, 10 Apr 2026
 02:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com> <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
In-Reply-To: <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 10 Apr 2026 11:54:57 +0200
X-Gmail-Original-Message-ID: <CAMRc=Md1pC_a8zSQqWWcubNG-1ret8Lf9sajVDnU8nw2gnXZiA@mail.gmail.com>
X-Gm-Features: AQROBzCP-_fg9A2t_Kbkm4--HVao78r-kjo5RBoGRmmLlahvEN3yRZA61_WNy7w
Message-ID: <CAMRc=Md1pC_a8zSQqWWcubNG-1ret8Lf9sajVDnU8nw2gnXZiA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Frank Wunderlich <frank-w@public-files.de>
Cc: bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, 
	sean.wang@kernel.org, linusw@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_025513_671948_A72D88A9 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, Apr 10, 2026 at 11:24=E2=80=AFAM Frank Wunderlich
<frank-w@public-files.de> wrote:
>
> > Gesendet: Freitag, 10. April 2026 um 09:09
> > Von: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > An: "Frank Wunderlich" <linux@fw-web.de>, "Sean Wang" <sean.wang@kernel=
.org>, "Linus Walleij" <linusw@kernel.org>, "Matthias Brugger" <matthias.bg=
g@gmail.com>, "AngeloGioacchino Del Regno" <angelogioacchino.delregno@colla=
bora.com>, "Bartosz Golaszewski" <brgl@kernel.org>
> > CC: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, lin=
ux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "Bartosz G=
olaszewski" <bartosz.golaszewski@oss.qualcomm.com>
> > Betreff: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_dir=
ection()
> >
> > If the gpio_chip::get_direction() callback is not implemented by the GP=
IO
> > controller driver, GPIOLIB emits a warning.
> >
> > Implement get_direction() for the GPIO part of pinctrl-moore.
> >
> > Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> > Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::=
get_direction()")
> > Reported-by: Frank Wunderlich <linux@fw-web.de>
>
> please use the email i used for SoB in my linked patch (closes link below=
), the other email i use only for sending patches due to mail provider limi=
tation.
>

Linus: Can you fix this when applying, please?

Frank: Can you also leave your Tested-by under the patch?

Thanks,
Bartosz

