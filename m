Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AABC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 18:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FikSavZljZZOAC3I+kpHBOLIYadBEAPg6f3CrNkkcDc=; b=FdEQguzP4HsIVi
	HbsEm/JBPkUqmNrj8tju9eQQEhgOUEfAP29bESTU/+5Xa8jpMm8fM2VxZcFD+to/l3Ff2kmebt3Cw
	lXOT1A9jNMDw6Jyh+gibYmJYo6BqhBImaWM6CNHluJ8YfyuQaG5drtR4ll5pYMu+TOYEvZPeJ1OYA
	izkZBtp9IyorHO25Osr9gbRM/BLIuen9kRgwtLsa6RZ5K8q1WBGAtdmPr/msnqsJJLnDFpXykJ10w
	FEhMj7o2vWn5CMRFqax58oamy9BgwDmKtHsWD9d4ux5T7nNG9TGL3bLYVI5ss734f3SltlmOfEWRL
	WpK4AvRh4PsBrDw7GrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJbn-00000002a5f-2flS;
	Tue, 04 Aug 2026 18:11:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJbl-00000002a5L-3Lwp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 18:11:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7659443B19
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 18:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551CE1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785867081;
	bh=FikSavZljZZOAC3I+kpHBOLIYadBEAPg6f3CrNkkcDc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=MkcdQD2XTs2CHy1GrmSqZx33oVJSb9cBzXys9Br0JLtRXiOv+hCGQti21OQLIP1yA
	 kZK4EpG9ErpttoY0LXf5/NfIuAI7Yjm6fCsD+8oD6lIXs63mVyR0HwGMGkgon58vX6
	 NxGp5ze1hy1vlV1DWOosSrFM+5jbLBdFCNAwRxJQo3klcIUFMt94JlQHa5VNYRLNTN
	 AYD6w2yIP+rl3YsvzIlQQ0astb3SkjMQ94dK5LtZSfsGushbvL38pDhFzvlsR3irJI
	 XIU6NoZ7Pm7X9re0Mgbu/NXKovXlxgA4KeeT8tovdq3kiIMGzl/el+CQtapVl+noOi
	 G0UZCENVFJPYQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39fa5e3a428so1717911fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 11:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqjtDR5R2rE89/NgiO9UYS3pQikEgR95RF8jSUc9B8jHD6NnidhGyDgkfHnfEpNO06BsMd3Z3mUppbjBoF/cBT0@lists.infradead.org
X-Gm-Message-State: AOJu0YzW+30jfxqKZAvwJ/6WKqdb2+uUNOFyS+eQAfCnD/aRWCUa5hzP
	s+aZQogfzZm6Wr8cD9LZ9PvMP2fjTtgnl0WuVQ0e/jjPtTt1S+Lp/9kG2zV+ZIz68Xi7e8me1G3
	6wMhPoT1VnfXN6PsM9jlWyoK5knPxZrY=
X-Received: by 2002:a05:651c:b08:b0:38e:8357:c5ae with SMTP id
 38308e7fff4ca-39fba35d196mr1683601fa.9.1785867079728; Tue, 04 Aug 2026
 11:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
 <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com>
In-Reply-To: <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 5 Aug 2026 02:11:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
X-Gm-Features: AUfX_mwiL0nkLH-Wm-w7-N2txYVunL-uAPwAUoIXkwVJGRbj_F5IqUZJ_VioieY
Message-ID: <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
To: =?UTF-8?Q?Juan_Manuel_L=C3=B3pez_Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Cc: andre.przywara@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2026 at 11:51=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Aug 3, 2026 at 11:37=E2=80=AFPM Juan Manuel L=C3=B3pez Carrillo
> <juanmanuellopezcarrillo@gmail.com> wrote:
> >
> > Hi Andre, Chen-Yu,
> >
> > > So can you please double check this?
> >
> > Checked on my Orange Pi 4A (T527, GMAC1, Motorcomm YT8531 PHY). You are=
 right:
> > PJ10 is not needed on this board.
> >
> > PJ10 function 5 is RGMII1-EPHY-25M, "25 MHz Output for GMAC PHY" in the=
 A523
> > manual v1.4. The RGMII1 bus itself is the other 15 pins (PJ0-PJ9, PJ11-=
PJ15),
> > which mainline already has. My claim came from a stale comment in my tr=
ee, from
> > when I was chasing the dead RX. It is gone now and my rgmii1 group matc=
hes
> > sunxi/for-next. The Tested-by I sent on 22 July was already measured on=
 plain
> > mainline without PJ10, so what revived RX here was your withstand fix a=
lone.
> >
> > > Those settings differ from what's in mainline. What are the results w=
ith
> > > those delays?
> >
> > Measured on the same board, DTB-only changes, TCP for 10 s per directio=
n:
> >
> >   A  mine (rgmii-rxid, MAC tx 100 / rx 0, PHY rx 1900 ps)
> >         TX 0.938-0.940   RX 0.929-0.930 Gbit/s
> >   B  mainline delays (rgmii-id, MAC tx 0 / rx 300, none on the PHY)
> >         TX 0.941   RX 0.929 Gbit/s
> >   C  the Ethernet path exactly as mainline has it
> >      (B, minus motorcomm,auto-sleep-disabled, minus PJ10)
> >         TX 0.941   RX 0.929 Gbit/s
> >
> > All three saturate the link, with rx_errs, rx_drop, tx_errs and tx_drop=
 at 0
> > over roughly 1.6 million packets each. So mine are just other values th=
at
> > work, and I am dropping them in favour of mainline's.
> >
> > > ethernet on the A523 has other problems. The performance is really ba=
d
> > > (even RX), and there are errors or packet drops.
> >
> > I do not see that on this board, not even with C, which is mainline's E=
thernet
> > DT unmodified. I also checked the YT8531 auto-sleep: the first packet a=
fter 5,
> > 10, 20, 30 and 45 s of silence came back in 0.21-0.24 ms, no losses.
> >
> > The kernel is my own 6.18-based tree, although stmmac and motorcomm.c a=
re
> > stock, and this is one board with one PHY. Chen-Yu, which board and whi=
ch MAC
> > are you seeing it on, and how do you measure it? If it is another board=
 or
> > GMAC0, I can try to reproduce it here.
>
> On my Orange Pi 4A, running iperf3 between it and another Orange Pi 5 Plu=
s
> (which has Intel PCIe NICs) as the server:

Correction, the Orange Pi 5 Plus has Realtek 2.5G NICs, not Intel.

>
>   - 4A as client: ~180 Mbps
>   - 4A as client but with reverse transfer (-R): ~520 Mbps
>
> Now if I do the same test between the Orange Pi 5 Plus and my virtual mac=
hine
> on an AMD AI 370 Pro based NAS, I can saturate the link up close to 2.5 G=
bps.
>
> If I use a H618-based Orange Pi Zero 3 as the client and the Orange Pi 5 =
Plus
> as the server:
>
>   - Zero 3: ~920 Mbps
>   - Zero 3 with reverse: ~280 Mbps
>
> And I think my Cubie A5E and Avaota A1 fared even worse.
>
>
> Something is definitely off. I don't know what though.
>
>
> ChenYu

