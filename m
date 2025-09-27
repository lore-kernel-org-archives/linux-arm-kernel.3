Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE99CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 16:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfZFYlW0wdwTxAgpS/9PkxRW2aXQXo/CZ/Epth10HX8=; b=j5mMe3gmbr/I8GHYDUvpCdCgAe
	nqOrzWGs3dxkpe4AUw7XkHJBC9pU0BHzeDlYgXNOPzQyaLWkczq59U62tmGRJQN3OjEKr+DwPvnqm
	nor9Z4fZKMF2FurGIMd3J46vPwwRIW1glW9y1NIgmKwRJ8doKSfNx/n/i4YPak52JoJLGABA1B73p
	EBLAI5JBoVzhBvCtOxhSf+mILwbI83E8O2ZnHbte7HbLJoKWHHInEsNyG47iDp+7kBcEAh9+r75W5
	5d1WYDCbHxs7glcm+5oFGN5WuFjZWO6As9bwm3YDU4YXtqp5XQX6IKyss25eKHZedzXB/F6/adFNg
	HT7qj+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2XlT-0000000Ayvw-3jXv;
	Sat, 27 Sep 2025 16:27:15 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2XlR-0000000Ayt1-0IiV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 16:27:14 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b38e5c2e055so266329466b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758990431; x=1759595231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfZFYlW0wdwTxAgpS/9PkxRW2aXQXo/CZ/Epth10HX8=;
        b=bfHTYieUf2+oEbDf7CoMmrW2uXw/o7hrfESHcC9GSf5Nh5MywvE/VQc9NY/3Gjy7L/
         cFG5wo2geyKLUWI6uxNgodOppuwBu+kAsc+ERMODUO+7YeMUPJGsgxYMkpnIB7kcPxk+
         u91H8fSUq6WVdgc6Gd3ZZoV9QJ0/jIEVYeEMYuGzXbsHDSH7iTjMzGnCtgLFEnNUEvjK
         /0LaNYF3DlpCXS8EslxAEIT3Oi74Y7b7UWFRk/HmZiSM+bn+XyYmBN8mK53th8DRoTvb
         9tma1NEOhnUMJOboh0phRoOdNbNl+1m1d20PeUadlx34737PZNJIjHL9hkW73kMkiwfm
         Yvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758990431; x=1759595231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfZFYlW0wdwTxAgpS/9PkxRW2aXQXo/CZ/Epth10HX8=;
        b=aF+7TPoMiROH6wy5qoeJp1yrLaZKlm7pXdAM2wjLDeqvroLBBT5whxNDTE+0scg0JR
         MobQOPp+L1rG4LhorJFbxZqP1oEvYw1oX5Lj8w/HI+/aLGSqOlf5umde0fR0otnragbo
         6alyRon0BYONyhoii6KY5kYVVRRdrNnLGn5FeJybeSPpsjkEhpHzfP4gWB98vFQNC9hf
         8S+1aaCSDRbG93ZIi5G1Z6BDbcaFVUFVEilL19Oh/WLgiAy/vsDAco8g8i10mynNE6Na
         4LzjLRmmxAMDkrNBw9MNc3/WvjIR2JsfTiU4/prVooljH8whYVRrK9Gr38QhxV1PxSpY
         ocRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2BiTA5LuzPCODgo1/YMQysIkVhzLVkVrvv19fhLm5bRaCXHD12ysayZdN9MaLBRmyWlgC6sagDd2wT+BdJ8CR@lists.infradead.org
X-Gm-Message-State: AOJu0YwLWuYwiQTRyC4d3MHDjk92XQ2xAHQ89HfnABL818KBJZN/KtlH
	KpPMfHAvnhcQ7/N7gWoW7aQxN8aw20CpcZz0QYssG5MM9pSusoqAiv/cqKA6tUCKG/279CjU9oD
	hA9aAx3gw4iQb2g+uMs7InFKCf2M7IaU=
X-Gm-Gg: ASbGncuT6LCAM25+AkrJF8r5T2/rgoo2Lr7HYUrlSl2TNBlrE0KbaNb401TSNHlTz9P
	T+9JGfm3fjFlpCtt1Ftxu5/+QHFcJ+NG8VCMApn6IIvGraHGy37d7jGK+2m7UECqFwWn4dIaP3P
	wVq5Geh+7jDO/Xg5SeCLMsBPlWhs3D2j8QXa4L5FdoRk9dtOAnRFp43dfETs4u+Xx64Pfj7idLd
	SezwEMTjKsqYQl0kQ==
X-Google-Smtp-Source: AGHT+IEm2jV42rGG7p5fnAgEp0mQdebl30tWmt7AxVYjslTP4Tk1rmf5shjSIlNO7exv/8/POfXlKAR/ZeXXXvU+VXo=
X-Received: by 2002:a17:906:46ce:b0:b35:3469:49ff with SMTP id
 a640c23a62f3a-b353478953emr979609066b.25.1758990430457; Sat, 27 Sep 2025
 09:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAOprWosSvBmORh9NKk-uxoWZpD6zdnF=dODS-uxVnTDjmofL6g@mail.gmail.com>
 <20250919-lurking-agama-of-genius-96b832-mkl@pengutronix.de>
 <CAOprWott046xznChj7JBNmVw3Z65uOC1_bqTbVB=LA+YBw7TTQ@mail.gmail.com> <20250922-eccentric-rustling-gorilla-d2606f-mkl@pengutronix.de>
In-Reply-To: <20250922-eccentric-rustling-gorilla-d2606f-mkl@pengutronix.de>
From: Andrea Daoud <andreadaoud6@gmail.com>
Date: Sun, 28 Sep 2025 00:26:59 +0800
X-Gm-Features: AS18NWDvuOQaoti1D_COhZmrCy5dQ4py-Ah3qreB3B80U5UMlAMWauKJrbU8dAs
Message-ID: <CAOprWoucfBm_BZOwU+qzo3YrpDE+f-x4YKNDS6phtOD2hvjsGg@mail.gmail.com>
Subject: Re: Possible race condition of the rockchip_canfd driver
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>, Elaine Zhang <zhangqing@rock-chips.com>, kernel@pengutronix.de, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexander Shiyan <eagle.alexander923@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_092713_137199_2F6806D9 
X-CRM114-Status: GOOD (  34.31  )
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

Hi Marc,

On Mon, Sep 22, 2025 at 4:50=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 20.09.2025 18:08:03, Andrea Daoud wrote:
> > > On 18.09.2025 20:58:33, Andrea Daoud wrote:
> > > > I'm using the rockchip_canfd driver on an RK3568. When under high b=
us
> > > > load, I get
> > > > the following logs [1] in rkcanfd_tx_tail_is_eff, and the CAN bus i=
s unable to
> > > > communicate properly under this condition. The exact cause is curre=
ntly not
> > > > entirely clear, and it's not reliably reproducible.
> > >
> > > Our customer is using a v3 silicon revision of the chip, which doesn'=
t
> > > this workaround.
> >
> > Could you please let me know how to check whether my RK3568 is v2 or v3=
?
>
> Alexander Shiyan (Cc'ed) reads the information from an nvmem cell:
>
> | https://github.com/MacroGroup/barebox/blob/macro/arch/arm/boards/diasom=
-rk3568/board.c#L239-L257
>
> The idea is to fixup the device tree in the bootloader depending on the
> SoC revision, so that the CAN driver uses only the needed workarounds.
>

Thanks, it is not easy to correlate this because I am currently not using
barebox. I'll try this later.

> > > > In the logs we can spot some strange points:
> > > >
> > > > 1. Line 24, tx_head =3D=3D tx_tail. This should have been rejected =
by the if
> > > > (!rkcanfd_get_tx_pending) clause.
> > > >
> > > > 2. Line 26, the last bit of priv->tx_tail (0x0185dbb3) is 1. This m=
eans that the
> > > > tx_tail should be 1, because rkcanfd_get_tx_tail is essentially mod=
 the
> > > > priv->tx_tail by two. But the printed tx_tail is 0.
> > > >
> > > > I believe these problems could mean that the code is suffering from=
 some race
> > > > condition. It seems that, in the whole IRQ processing chain of the =
driver,
> > > > there's no lock protection. Maybe some IRQ happens within the execu=
tion of
> > > > rkcanfd_tx_tail_is_eff, and touches the state of the tx_head and tx=
_tail?
> > > >
> > > > Could you please have a look at the code, and check if some locking=
 is needed?
> > >
> > > My time for community support is currently a bit limited. I think thi=
s
> > > has to wait a bit, apologies :/
> >
> > No worries, I will debug myself, and hopefully send a PR if I found
> > something out.
>
> Great, I have a both a v2 and a v3 SoC here to test.

It turns out there are two issues:

1. The race condition (between TX interrupt and TX queue netif xmit) is ind=
eed
an issue. Fixed by adding a spinlock around TX logic, and no warning
occurs after
adding the lock.

2. The CLK_CAN0 was clocked by GPLL, which makes it 148.5MHz. This frequenc=
y
will lead to various errors quickly when dealing with EFF IDs. Fixed
by constraining it
to use CPLL and 250MHz freq.

Regarding problem 1, I will send a patch.

Regarding problem 2, I suggest adding some extra sanity checks to
guard against this.

>
> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |


Regards,
Andrea

