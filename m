Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92B1C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=; b=WdOkaX6WAFKsfHnx3lOWI9qjvy
	JyYXjRK/nRKLU6fZtkwF4HIVTxtPGu49b64n6Ubyrm8DvNPfqdGIjnYoimsaVAD0m5Hhm9cK0ej/H
	xXrHWqo62ftY0F51kV9utaCNHR+H6nMdEHpioouzh+HweiLYvTLZWnEx6QPGxgAMQVHrGuOI8uSCK
	PEsLbLVnPQdAPeEqEB0B4Rb01mvnzLbXsYanV+iHv39A4p9HEbD112kP/PsrPvcA9io4Wubvhr3w3
	L38wFw4CbffzRPmotnYTyTikqVtw23YR9Fjl34wwbcIUxTNOuB4sjGPs09SkPMo1Cqgj3yW9e4DS9
	DYRLC5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwYm-0000000AqsU-2zex;
	Wed, 18 Jun 2025 17:26:52 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvav-0000000Aiz9-45Un
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 16:25:03 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7348606e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 09:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750263900; x=1750868700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=JXmzviVNST25/LQmRPdEFIGLbHrvaK/LwqiOsP5GEHH3xkocFmzOR53WaCMnQLl5b7
         RdbcDyfU2Ap1YWDzg34SMlaczXMihBUGXWpNaiXiPKwErsAaFbHe4xdlOgna9GhxwpGI
         9MerJoePyteFP1K1mwXVVkQ+zBaeu6Ca/D2VNJDT5ZPfwxH6yDkIDH7YNulhlZbIVAM6
         iSB+GDCT5Nz3DlmObfEzvQmvEZSZ/m+boBurDuuqlRdGSUpTTFvfSeZ9hupowOHkBUq0
         Fy1yGdnWixH+7nPLwJkcpkoMTecxgrNplM40w946a2Na8YaytGMWAxAHVgRpWayC551Q
         xWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750263900; x=1750868700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLFD+2psb7xXjgfHWtkDfvPX+FPgGIjapr64yFarvW4=;
        b=fDjmI8BQTA4SQfnfMqesXyLudKb0hPqCOuHTucX21AXMTAOH2hwqliQPVAZ+3QObQd
         5q9/OSkzjA4Sl1w88YhLW957Y4IFvvTVR/fOcaEWxlQJ99XcQD0AhYl6QtTQX6qcMM1+
         lXaX2zzbwQZTaO/WXzFAKyq6J+hTqxuSO3qC9fFi1CB6ZQTVXrTsi3OJHw/Or3QTp8Pf
         edEvnOGZbyUCW1r047JGO3tnedxyqF1MMcD+GKpWLh4uc/5fmIimwkcW6Jk6Y/StKKez
         R6RA1BRDIFyeMdiEfUcbdkLvJTIXl/eThkVhMYTOYdx2oGMvC4kVu9hUe4k5iyv5f+Gc
         VFCg==
X-Forwarded-Encrypted: i=1; AJvYcCWHRenbKIJM0+ESmf8bPs6ReYSWg1aFZhBcKSfmV9dtG55CDfcxNeD0lINowasLAO5Vx5rHCcOoLZsbA8CzQ4gL@lists.infradead.org
X-Gm-Message-State: AOJu0YwSOA9U4pJ83c7gUWwx8UqthRWbmKaRG4MukVwLH4/3b2z5BXTF
	qMqcVG9Og3N+jr0eNgXVFCJnhgtoR88Q7g5Ekm40PSRUUYQJcdtgsmnFpyTAeYryIv3xJHJIlP4
	3ptfGEmWTEAUiahu/O+80pE9A5HWZY6aIWldfX7qCIg==
X-Gm-Gg: ASbGncunT7+n9z2fzNtx+bxZuVywiv0jZJzHGk8t6l/tlWQ23A3VKso/yrU525rzj8V
	b9VKheHhzppZL+VpvpXEPXRjb4hLXXUSzJ2rpfaDa9qBC4K/BIrEua4MYVAYB0GjakebVjgIumq
	/STkbW0uM6g6p0rsHyykPv/4qdRamyc6s1Q39jQBVLwRrzrUyqjJoTbwHAV4Y3WAdX77GDeM2aq
	Q==
X-Google-Smtp-Source: AGHT+IFasWzMx4vvKMGThkbIPZ5HFR/Wr5hiH9hJMS02hBIeQh8p7hArmnTCvxt1VaP57eg2rHdU67rWBwbdr9GK3qY=
X-Received: by 2002:a05:6512:1193:b0:553:2ed2:15b5 with SMTP id
 2adb3069b0e04-553b6f50256mr5473373e87.57.1750263900278; Wed, 18 Jun 2025
 09:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org> <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
In-Reply-To: <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 18 Jun 2025 18:24:48 +0200
X-Gm-Features: AX0GCFtQiRTdcvRzM4v3bXKNF4ikUT4N9NzJhHCtHKKqoMjJz7WLf-25661k3ho
Message-ID: <CAMRc=Mc9_V8bkD_FyNkxkNoD3Fe7q-CC7ifq3TrD=r8+D_UgKA@mail.gmail.com>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter callbacks
To: Mark Brown <broonie@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_092502_205684_D2632D67 
X-CRM114-Status: GOOD (  16.08  )
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

On Wed, Jun 18, 2025 at 6:21=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Jun 10, 2025 at 02:33:11PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
>
> I'm seeing boot failures on a UDOOq (an i.MX6 based board) in -next
> today which bisect to this patch (in -next as b908d35d0003cc7).  We get
> a NULL pointer dereference during boot while probing the poweroff driver
> for the system:
>
> [    0.443319] Unable to handle kernel NULL pointer dereference at virtua=
l address 00000000 when execute
> [    0.443330] [00000000] *pgd=3D00000000
> [    0.443347] Internal error: Oops: 80000005 [#2] SMP ARM
>
> ...
>
> [    2.522761]  bgpio_dir_out_val_first from gpiod_direction_output_raw_c=
ommit+0x194/0x390
> [    2.533330]  gpiod_direction_output_raw_commit from gpiod_find_and_req=
uest+0x134/0x434
> [    2.541276]  gpiod_find_and_request from gpiod_get_index+0x58/0x70
> [    2.547482]  gpiod_get_index from devm_gpiod_get_index+0x10/0x78
> [    2.553516]  devm_gpiod_get_index from gpio_poweroff_probe+0xe8/0x174
> [    2.559990]  gpio_poweroff_probe from platform_probe+0x5c/0xb4
>

Thanks, a patch[1] is already up for review. Please give it a try and
leave your Tested-by: if you can.

Bartosz

[1] https://lore.kernel.org/all/20250618-gpio-mmio-fix-setter-v1-2-2578ffb7=
7019@linaro.org/

