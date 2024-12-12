Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA0AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7VKs24hxuVxtmadZdMFSS6V+LZqjYbyf1LkRAbvk+sE=; b=DKAZ+Lq4Ro9N5ykXz3XH3gA5DM
	T+sD10AG5CHwkSlvOgufnnCTqSvH2dvNcpNl87+AlfVNM1F9Nso12SFluB2A0pX6fT+7lNLOoQe/i
	saIfGt8L9/tuku+DBEUcbsv3GhlhrCrxz1PsbDdb6Ps2/97XJqSUkQyPSQYCBIOg1PDfmszP1BHc9
	N3ZduqChLYQXkKmzXG1Uh4dpy7YW/1e89Gu+qxsrr7DnA5X4t2SzWazNroOLSoMmeO2qr0GSUWD5N
	h+M9mY6CJ/mnYQfZW12BwQDF1jRw+Yb/scMciX0jU8uGXdIvSoaIm4i9JLAsl3kvFsLNyK2q9Bpgi
	oJbdKlYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofR-00000001aGK-3SvU;
	Thu, 12 Dec 2024 19:16:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnhC-00000001MSz-3MXC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:13:56 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53df6322ea7so1258848e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald-eu.20230601.gappssmtp.com; s=20230601; t=1734027232; x=1734632032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VKs24hxuVxtmadZdMFSS6V+LZqjYbyf1LkRAbvk+sE=;
        b=zGqqIcl8oCyJOtBR9BIzTTPX4rQzbGkVEj9CvDJqooE0JsWTbl2qOOm2drTOR6RTfZ
         z/8160P8iU28yIyjQqNnLPYBjCdGjS71cnWbdeAHvYVLwMn3dRUlbPezUlfE6sFmMlba
         4TU1VGmszSpHKqw7OzT+cLeaZHJ2Cx+a12j5X7XJAP8Zgniah5VHTOAk6HJ1EMjeB1px
         ydXTagF/TBNCpoQY1atyzCMCSognT2Xkz5fbel6DgQ4juHmwT/uoNaSu60I///QvpVvg
         8VCS5/sA1uRleGAmjKS1Phr+DpUzPwFTpYmJJtTLraEUJ8Cnt+/5IrgUvIOB7YiqZTy0
         9Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734027232; x=1734632032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VKs24hxuVxtmadZdMFSS6V+LZqjYbyf1LkRAbvk+sE=;
        b=pO0bC2unPGu7BJMy5ZFLcDtnyj+RRL+9bu2mkWOJUdQ6KJAyKBEb4r5mM9HFayGDvM
         bkN26IIqgLxgdzhlyng1xiPyQV7K0Sa2aMn5o/XJYyJlBedl2An9S5BjAKFrw8fFaG9+
         fwZfONm+kvM++ebFrRHv+JTgmehqFjJ5ZcFeEKAwaqqu5z45dsadvUKmi/icV1UAbWiV
         OXVALAnT3Sr1PEqeFKt1jgHgXxu2TSSr1mN14PJiboXh4jI6h+aG8TkLUNfQjSRSDHNd
         cJhjT2f7AkwOyJ8eU4CCzmSSrswGTEN/ZVlilteZkaAdf+0iw9rlwx7XWBuPlhEzpnyu
         DqqA==
X-Forwarded-Encrypted: i=1; AJvYcCVHWs0PuakOiZJGuiZe0iUn+Xiw1sHG6v/O0I1e00PY4ssXJR5lTdpeqWXaDO8FwdwsrjTITdzXhpoEfXbqP2Rg@lists.infradead.org
X-Gm-Message-State: AOJu0YzUzG2m0FDpyBPRfSniBV68pUkicX0JnPYAWJG1qd2t7IJKQc42
	7o8cu7Bc40bHxCQbhCXj6easQ8cwQYLnG7ETcoepUlhMCqpyt/umJgIYIZB0QiO6E/pjYie7n3x
	Juc3SPMe1xdVBeMzgS3SScVNDSlTFz7rGowrl9Q==
X-Gm-Gg: ASbGncvsb8++NYR93JaGIH3ndJgt/JYwqkYo6zASLKPe9BWjc4e21QEBF69VDoaWxca
	M1+5BmpN3rjTVX5pzR/bzksThWn9PmCpoev5wQgQq/UVmcGaLxScZJFilMZXqEjv5yRoZYA==
X-Google-Smtp-Source: AGHT+IEDiH60eg++Uh/HeCIMB+HgJoZ9cQFLJDVz2AKHBrKQ6jiO7gkPeQr3WtB7BxUWTMwU25XgXg4ONapCoUaEls8=
X-Received: by 2002:a05:6512:68e:b0:540:1a3f:e848 with SMTP id
 2adb3069b0e04-5403410614cmr737547e87.15.1734027232019; Thu, 12 Dec 2024
 10:13:52 -0800 (PST)
MIME-Version: 1.0
References: <CAFERDQ2hLHek+0ViVqbqgOD+4xwC2ZwK1KhgGdLP_zGnonEs4w@mail.gmail.com>
 <d02a7143-43e7-4851-a06e-d57981362a5a@gmx.net>
In-Reply-To: <d02a7143-43e7-4851-a06e-d57981362a5a@gmx.net>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Thu, 12 Dec 2024 19:13:41 +0100
Message-ID: <CAFERDQ0AUhCp_c0LLRRR9SWyvDON-CdXFvK3eqcLFc_SMhdPRw@mail.gmail.com>
Subject: Re: Raspberry Pi 3B: Failed to create device link with soc:firmware:gpio
To: Stefan Wahren <wahrenst@gmx.net>
Cc: f.fainelli@gmail.com, saravanak@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_101355_104018_26BB0186 
X-CRM114-Status: GOOD (  13.49  )
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

On Thu, Dec 12, 2024 at 2:16=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> wr=
ote:
> What happens if you replace your custom config with arm64/defconfig?
> Does the issue still occurs?

I've just launched a kernel with the arm64 defconfig:

> 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq =3D 99, base_baud =3D 0)=
 is a PL011 rev2
> serial serial0: tty port ttyAMA0 registered
> raspberrypi-firmware soc:firmware: Attached to firmware from 2024-09-13T1=
6:00:01
> hci_uart_bcm serial0-0: supply vbat not found, using dummy regulator
> hci_uart_bcm serial0-0: supply vddio not found, using dummy regulator
> Bluetooth: hci0: BCM: chip id 94
> Bluetooth: hci0: BCM: features 0x2e
> Bluetooth: hci0: BCM43430A1
> Bluetooth: hci0: BCM43430A1 (001.002.009) build 0000

And it worked perfectly. Thanks for your suggestion. It confirmed the probl=
em
came from my kernel config.

I then compared both .config and it appeared I was missing this config flag=
:

> CONFIG_SERIAL_DEV_CTRL_TTYPORT

I had already enabled CONFIG_SERIAL_DEV_BUS, but not CTRL_TTYPORT.
Nevertheless, that first kernel config item's prompt had been clear about t=
hat,
but I missed the advice:

> CONFIG_SERIAL_DEV_BUS
> Core support for devices connected via a serial port.
> Note that you typically also want to enable TTY port controller support.

It's so much better now to see the HCI attachment handled by the kernel
directly!

Thank you for your help.
Martin

