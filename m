Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FC3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 22:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fT6QBQL/2MhJSNZuMQZny8f9lxbnoEvXOfu47IDsj8=; b=XCZ+CJ8Dwush17TXr6RTS6NYS3
	pvRZfpqSeSTiplyjMIgmP11o+iy5K2ga3A1E0+imm5uL0L7A5m77R7fDf8sTAGEtpZvBW/SMwTQR0
	yrcqI1XGkfWJPpX34vy8twwKfx2Bl6GrIuryK0P7ia+AvlQyTmnWoCTHFe4K88b/57hUy++XJy7rg
	zhqPKKaLb8PnT3A0S5iNrt+ZNquoH4Vup1rLwteFYfhQ/GVeK1/is+patFnEzcpysy3v5RXgGcut8
	HC0YEyHi0FAZml3/4TUjeNS7aqHb3L5qeocpH1dBboJIbWU1RYOr3Z1DrVUm96No5cHc8Uau26j60
	wU21xHzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMDlN-000000058Eo-07Tt;
	Fri, 13 Dec 2024 22:03:57 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMDkI-0000000587P-05db
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 22:02:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53df6322ea7so3164558e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 14:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734127367; x=1734732167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3fT6QBQL/2MhJSNZuMQZny8f9lxbnoEvXOfu47IDsj8=;
        b=OHebGQf6NuW/q3F8KN4kNG3egEu3MYNSNRyVS+ArZNlUNcxx/S0Qd3NFivtOrmUTbl
         W7KXZCsF5lM6geDQR9Uy3GdrJlTMnYCiFZsVg4kLWYfZUaQH6fucsVId0MUbwa1OIenq
         OMDNYopn+ZjfeAHTplFHKc/7bBNDLvTUYAw5uKntdzW71j3cpOMk1kKJa1/lVXDesQ4z
         yywQ1givnNziip6uQ9Aky/TBpWSyDEXU55A3pGVas7eH/eyFaNmVokGBfZedgJlxC2bm
         no6QSZKrZZ7b9NzWBjF3/u4IZvh77KmrUEQ/fjiJxC1WXp4H+dh2bm2nGKOVi7zdj0gF
         y7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734127367; x=1734732167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fT6QBQL/2MhJSNZuMQZny8f9lxbnoEvXOfu47IDsj8=;
        b=aBFcoJul6lPBSpJo1Lh0ToygbJ14e1TP/GO77ePdHiCiCrkUmo9P1K20GqBrtSpL+t
         rR3zX6ejqIlm2JN+/jMxKIMtpA41J2ZBAiiuXHSX5+tZOoyhH3fhmT7pHXD0UZAZYyjT
         7gq7pM/rkFcUniF7R5fIzeObZ287Szs2lunO0DqTR4OVyxvj66rgnK9pg4JkQ3XTrhzp
         r0eNgDXGwO64cDHdmBtjDclbuYcps0ATVxjV1/BhUzym8bREMjy20kun06ezUwuGKTER
         rpMJU2KLER2y6X4Q2pyWsJHjpMIcOD+DXWPNGbm2eOZHO3DBxlohLvydRf/YdPtEiGW8
         +lqA==
X-Forwarded-Encrypted: i=1; AJvYcCXJyRRH+edBv5Q9ObqnC8VvGL4P8vewtuj4CM3il0gp45/RU0TaJFKqWkKp0lFULw5ZyWF8wVRraKbYVclNmoN8@lists.infradead.org
X-Gm-Message-State: AOJu0YwiDOW3580P2jxKmkUmdrJh4h8NtdjM5QfOXpP86JTLJDlJ+Amr
	bI0feaFNxYqR1j+LXNvrqJQCpHSkpSGOHRfZ8BmETrIRol9cxHxSJYpGKoAYcf4Ura7OYz5WbnM
	iNfTKWzNsXflfcEUYgnd+vyRSnhLHiXt29Flp
X-Gm-Gg: ASbGnctC3jk+RNcLkDNdaBhuuzGwqLadJevPCWyQHKi3yuBOZkdRXW4y7lA03Kn/Evf
	ajODg883HCF8sQ8Kb8iw2v61//iziaL0/T3y4D9pNX3mZQDhboffQDK2W8yEWQBlB
X-Google-Smtp-Source: AGHT+IEdvX8UCDRHwMsM6tElC5pzCUR6NnPXZ6/2dYHPyLngGaSRf0A3HFQ57okaG6m08xez14kCUm816z6DCZuXJI0=
X-Received: by 2002:a05:6512:2815:b0:53e:3740:4a92 with SMTP id
 2adb3069b0e04-5409059572bmr1481442e87.42.1734127366767; Fri, 13 Dec 2024
 14:02:46 -0800 (PST)
MIME-Version: 1.0
References: <CAFERDQ2hLHek+0ViVqbqgOD+4xwC2ZwK1KhgGdLP_zGnonEs4w@mail.gmail.com>
 <d02a7143-43e7-4851-a06e-d57981362a5a@gmx.net> <CAFERDQ0AUhCp_c0LLRRR9SWyvDON-CdXFvK3eqcLFc_SMhdPRw@mail.gmail.com>
In-Reply-To: <CAFERDQ0AUhCp_c0LLRRR9SWyvDON-CdXFvK3eqcLFc_SMhdPRw@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 13 Dec 2024 14:02:10 -0800
X-Gm-Features: AbW1kvaRZEbg79r0iuOt3DfYvyY31TNdR3EOMiJgmzNfAPz6oPlmMYNe9esc_zM
Message-ID: <CAGETcx-NWnBDfVq7hwrS7dQDdbEeBaVOuS=YzAfTyS6e6xCUCQ@mail.gmail.com>
Subject: Re: Raspberry Pi 3B: Failed to create device link with soc:firmware:gpio
To: Martin Wetterwald <martin@wetterwald.eu>
Cc: Stefan Wahren <wahrenst@gmx.net>, f.fainelli@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_140250_084264_A07954B3 
X-CRM114-Status: GOOD (  18.43  )
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

On Thu, Dec 12, 2024 at 10:13=E2=80=AFAM Martin Wetterwald <martin@wetterwa=
ld.eu> wrote:
>
> On Thu, Dec 12, 2024 at 2:16=E2=80=AFPM Stefan Wahren <wahrenst@gmx.net> =
wrote:
> > What happens if you replace your custom config with arm64/defconfig?
> > Does the issue still occurs?
>
> I've just launched a kernel with the arm64 defconfig:
>
> > 3f201000.serial: ttyAMA0 at MMIO 0x3f201000 (irq =3D 99, base_baud =3D =
0) is a PL011 rev2
> > serial serial0: tty port ttyAMA0 registered
> > raspberrypi-firmware soc:firmware: Attached to firmware from 2024-09-13=
T16:00:01
> > hci_uart_bcm serial0-0: supply vbat not found, using dummy regulator
> > hci_uart_bcm serial0-0: supply vddio not found, using dummy regulator
> > Bluetooth: hci0: BCM: chip id 94
> > Bluetooth: hci0: BCM: features 0x2e
> > Bluetooth: hci0: BCM43430A1
> > Bluetooth: hci0: BCM43430A1 (001.002.009) build 0000
>
> And it worked perfectly. Thanks for your suggestion. It confirmed the pro=
blem
> came from my kernel config.
>
> I then compared both .config and it appeared I was missing this config fl=
ag:
>
> > CONFIG_SERIAL_DEV_CTRL_TTYPORT
>
> I had already enabled CONFIG_SERIAL_DEV_BUS, but not CTRL_TTYPORT.
> Nevertheless, that first kernel config item's prompt had been clear about=
 that,
> but I missed the advice:
>
> > CONFIG_SERIAL_DEV_BUS
> > Core support for devices connected via a serial port.
> > Note that you typically also want to enable TTY port controller support=
.
>
> It's so much better now to see the HCI attachment handled by the kernel
> directly!

Glad this got sorted out without my help :) Thanks Stefan!


-Saravana

