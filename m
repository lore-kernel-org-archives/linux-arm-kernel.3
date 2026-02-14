Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F44EDF142
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGs37vf95wRc5Fy+Z4TAh8ALODb/hyEC0jfloWZKk5A=; b=F+HcBzOWazMTbZ
	NlQJ6D3WUItk3n4KImMJH6MQR4VlfkmbffygKVuM5nyhUPMtV3dWfO3D5hqTzrRxGZsUO3J8xJmc7
	z9OTWcoe8UnYqGQgiYugFx+XodLGMDlsAgwAVFFBdlr4vBJ0tTnezmMWPoZX1MiZySxSfSFhmCsz8
	ojph0Z2xJiIDkSfEDWEIZCTC84q5iVj6iOGf6CLuJsEl1+YZBMuGp8Zwc57vazyT3QigrPy0pPEwr
	EyxC4qFr3SbTYWt12+8Bym9ba6Kzr4RJ1liGMaZvz6pDWqVwLaMooo3c2ERMJEKF/VNkFFiGDO3g7
	0BJ21Y5JAhJKhe5xbK/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrGxe-00000004euX-3x7F;
	Sat, 14 Feb 2026 14:49:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrGxb-00000004etj-1YXk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 14:49:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1593C436D8
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 14:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC60C19423
	for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771080566;
	bh=t4u+2E8pb9LEvxahGdOO9bs11ZhM9Fvc9+f3N2mcbF0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=puZ7xGzZvjT+IfyfkVmPzykkNhW1E97hXJPEE1ROrG7S/HTUgq5qEZDVYWT7DG2ys
	 T3oTHvLiV/TmEf+uhNd1SWVwgiNkWtgzr062c11GsmUaMUszACDXTjQgfrzT+QsqUM
	 dw+JpZRZfqpHjYy2LmHgSFjeysdqXAvPJHiVCVdCBbvR2kQlcy/B+HgmozGj1ASVY8
	 jRju9o/DECgvGICK9tys9a9z/ASCi0k5H/h7wocR+VfnLPxorZw7Vci81yLm9ww6BG
	 4PFqE/MhAYe6kaYMubPH8K51WUosWV16v423M54HjhMtxyXB5QQAr7AgMat56cAeU/
	 zWyX4IOtajqeQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-385d9fb297dso16836761fa.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Feb 2026 06:49:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXg6cFa7OQV7RH4IID4yutrlU6UIRHvxsjjBPkW83fHWMJORyhSzE5Iz4tK1R8a0KpTI38gMw96cw3HItYb8x1i@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1nAi07xN2li3k0LkCZJtNFC1TJVka3biqUOVxbKkwzW/4DJwO
	ZzaCLCaQcXgLM+PUJnjgBZJqpj0JJ9SGLHSr1j4mQXpYPRB7ROGOSzTANHefgo9BP4xiuRboefk
	ODCokZBolXyuhMEIpEzK1JZjym/+Cwmk=
X-Received: by 2002:a2e:bc08:0:b0:387:197d:2067 with SMTP id
 38308e7fff4ca-388105705b5mr16636991fa.28.1771080564339; Sat, 14 Feb 2026
 06:49:24 -0800 (PST)
MIME-Version: 1.0
References: <ZnzulZBukibZUXKM@google.com> <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
 <aY1GZQJLKAF0fsz6@google.com> <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
In-Reply-To: <74b13dba-830b-6ea3-e5d3-95f0423fe741@gmx.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 14 Feb 2026 22:49:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com>
X-Gm-Features: AaiRm53k3rSL_h2LUOXtrsfNzAhuFX0EJwZlhfvfCCFszsxpJJjDWoFbW7UVCGg
Message-ID: <CAGb2v64BApjGy2AZsM5sJit4ZDKDreVE230kxFikBeo-SFnGzA@mail.gmail.com>
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs
 for WiFi rfkill
To: Marc Dietrich <marvin24@gmx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_064927_470723_C80C3089 
X-CRM114-Status: GOOD (  24.77  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Feb 14, 2026 at 10:27=E2=80=AFPM Marc Dietrich <marvin24@gmx.de> wr=
ote:
>
> Hi Dimitry,
>
> On Wed, 11 Feb 2026, Dmitry Torokhov wrote:
>
> > Hi Thierry,
> >
> > On Fri, Jun 28, 2024 at 05:35:08PM +0200, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >>
> >> On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> >>> Complete conversion of the WiFi rfkill device to use device
> >>> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead =
of
> >>> a lookup table.
> >>>
> >>>
> >>
> >> Applied, thanks!
> >>
> >> [1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi=
 rfkill
> >>       commit: 47ac458bb229f8c4864081d173adbcfc55c34880
> >
> > Do you know by any chance why paz00 does not simply configure rfkill
> > switch via device tree? The driver (rfkill-gpio) seem to support device
> > tree...
>
> last time I tried this was rejected because the wifi chip is on the usb
> bus and "rfkill" should be a sub-function of this chip [1], but that was
> some time ago...
>
> Looking hard the schematics, the wifi chip does not have a gpio input as
> first thought. Rather it seems that the first gpio toggles a regulator
> which supplies the wifi module (m2 card) with power and the second gpio i=
s
> just connected to the wifi LED.
>
> Not sure how to transfer this into dt, but I guess this would be the
> better solution.

Then the first GPIO should probably just be described as a fixed regulator
feeding the USB controller that the M.2 module is connected to.

There's also a WIP M.2 E-key binding and driver, but AFAIK that doesn't
actually implement USB support.

The second one could be just a GPIO-driver LED with a netdev trigger?


ChenYu

> Marc
>
>   [1]
> https://linux-tegra.vger.kernel.narkive.com/hRFke8jh/patch-1-3-net-rfkill=
-gpio-add-device-tree-support
>

