Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E1BC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 17:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lF582LJ40LqQgFk7CFzcyzEsbDMIx+eoKuMIyxCDbPo=; b=F8ajvv7bFB30oVGGLkVwz3asnQ
	nSvmrUYLJ5lFWFua8Nl6VjtiHsp/Cv0+URMULme16UrahTG2MuY6/QzIrPL7EUUla5y/1C4XnP1dM
	lter0pmLej/R67hzxQQPoGngnn3DLgLbkFslO37Q6lQGHdpIVCleXUJHZVfI4K+9TKu+jushiBSYp
	H0geJlYs6HR2/1+mFYJI8gT71MdMmavqxPZKuT+A0D6LazvLHWM3bMGaZrlvi0Ys9LBO+hoqJN0ht
	mNpJOlwgx7AuJyd71KdxFeZuu8+F2MB3GrMTUPjjrC9V0sn1LRHgGni55OY6rL4+hdrNnRh5K+vmh
	s/u1ZMSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoXT-0000000BqhY-3wLt;
	Mon, 05 Jan 2026 17:38:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoXQ-0000000BqgQ-0nwo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 17:38:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 746BE443BD
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A77CC19421
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Jan 2026 17:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767634719;
	bh=Xp0i1Ix8i4EVXbO6cbFPIEaut/C7zGARDQHbCBH0TDs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=ih9Qw6lz1Sko5fL7pFLbomG8nmlCZWV5f7VzhNkCv3qefRr8/DZCKpPozic2neoTd
	 Xw4fRybgZh/FRbdFzVZ7KJ3VUaI+bO8UXaC0hYJ6BHPod+ZT9Fbf54stFIjt889hVF
	 JrGDcMSZtE2iEZp6xZj9JnTOSTTs2m75dLdvvRvpmnYM4/IqnM5c5fRWYDDFtGfmU5
	 buKtj+8Sw+3eOCb2sKEA4X7KO3Dgn3T6udqPNwd+kNITAJjjP5Wv1CZDkGPCa7Ftr9
	 GnV7m7L+1R6UyMjEMJ0APffCchNsz13K5mszzy3M2J0GHXoIaUObJ8m0lFNZY6a2Oa
	 N9eikJpKN+0jA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-37fd6e91990so1345741fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 09:38:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUu0AXJJjywJf6wQgYNOMY8pVEPJHanN90UkpldTXRc97RXkT3Qo50DZkNXTz84IcoxUj8rQtpkCOr1HKGj2lPT@lists.infradead.org
X-Gm-Message-State: AOJu0YxEgQBzJituDiKrKIoqo36wD8+zYtHlHKWNI0x9o7lRPE1GoPxx
	n8azC6nBQhlOMFjADhybeVs1UUAfW9xCUO0Yi2rogdArGfJhixRjm6+wagdinkt5bo0dEXq3O93
	v/Q82/OKdrHmOLp/2J076tH6U7Sv3nCWy6guYaC5qeg==
X-Google-Smtp-Source: AGHT+IG6SIPigJxkJHInO+tkcsToIW/YovjrsTkuD8gZ0NGaSCdwwzyT7wEbNisz6v64WdN2v0/svdmJHeaElAERj4U=
X-Received: by 2002:a2e:ad13:0:b0:382:8844:2080 with SMTP id
 38308e7fff4ca-382eaabb736mr255161fa.25.1767634717790; Mon, 05 Jan 2026
 09:38:37 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:38:36 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Jan 2026 09:38:36 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
MIME-Version: 1.0
References: <20260105150509.56537-1-bartosz.golaszewski@oss.qualcomm.com> <CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMRm8EKXSL0mwOnJw@mail.gmail.com>
Date: Mon, 5 Jan 2026 09:38:36 -0800
X-Gmail-Original-Message-ID: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
X-Gm-Features: AQt7F2oSq5mFA1y8aimNhkWa6uJgJwLZMRBreFji3RmTtVrRuRT8uL2rJ5zqO0Q
Message-ID: <CAMRc=MeYWm=5bwfT5s+w6_kjt=wROonZSYo8=kA3Eyva4hpp1g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: mark the GPIO controller as sleeping
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Linus Walleij <linusw@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_093840_267643_9519A154 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, 5 Jan 2026 18:28:23 +0100, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> said:
> Hi Bartosz,
>
> On Mon, Jan 5, 2026 at 4:05=E2=80=AFPM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> [...]
>>   mutex_lock_nested+0x24/0x30
>>   pinctrl_get_device_gpio_range+0x44/0x128
>>   pinctrl_gpio_set_config+0x40/0xdc
>>   gpiochip_generic_config+0x28/0x3c
>>   gpio_do_set_config+0xa8/0x194
> $ git grep gpiochip_generic_config drivers/pinctrl/meson/
> drivers/pinctrl/meson/pinctrl-amlogic-a4.c:     .set_config
>  =3D gpiochip_generic_config,
> drivers/pinctrl/meson/pinctrl-meson.c:  pc->chip.set_config =3D
> gpiochip_generic_config;
>
> pinctrl-amlogic-a4.c still has:
>   .can_sleep =3D false,
>
> Are there plans to send a separate fix for pinctrl-amlogic-a4.c - or
> was the intention to fix "all" Amlogic pin controllers in this patch
> (which would mean that the change to pinctrl-amlogic-a4.c is missing)?
>
>

Yeah, I missed it. I will send a follow-up tomorrow.

Bartosz

