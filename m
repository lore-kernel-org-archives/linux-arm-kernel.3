Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60C6C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfO704+Uxn2jjx3W5p0vCsqsRbGBalSUmwkXNVuP7nc=; b=Y+DiDTzyiqt8q2
	uhzKKFE4l42Z7oMY3SJ4iHy3BPxle4I9xan9OLo6nDojF3xiCJ3Eym3MknmHaHjqHnVs0Fct7Co0k
	Q2tNLDXtDAb8GO4/t4xrndW9rsEzR2rxShpvm/EkkFE1+VZ0Mp4Kz9SMm9epqaZWh8kG8hslOSSj0
	J5fi9sB9/aIykp6EIyJcKYITz/y904lsHxX+HkEqaiNLy6uEReZNCJBDufNNX/8H/q7/BCt7K0x2p
	BYhukSQPvY7fHsDJ+zri0KE83uiyTiJVYg4VYKgbnU6mEibFbMSZopIukdDQbmYGnPCW9A/IzqNqn
	4em6rQybmdOnXgAiN1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquxJ-0000000HaCF-1d2o;
	Mon, 03 Aug 2026 15:51:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquxI-0000000HaBf-1V2y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:51:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 672D960A7D
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 15:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB201F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785772315;
	bh=pfO704+Uxn2jjx3W5p0vCsqsRbGBalSUmwkXNVuP7nc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=MmmGQtCDi88OiGk7cNb2i7TUkWLe/ohQQoB7x7Mdcp+XZRuiGLot+OdzxwUy6YMPB
	 7VNTjGiERdSzjUZ2QkvNuE/ccGVGDIKzvUI5XQQuo65X4Rroe0UX7UvT5Xof5UPD3h
	 o0mJBGxaUBxeXO1wlC3yRsWf+i7ZSEQxuUuiGg92muEyXh3fhRPBujezl3wAmJw0eU
	 shv76An3t8qE8Z2IEuj0CxVESq5/xtdXoZ57Ag180492dVCBRP+loKSnpZIF6SflCq
	 FvJGLj6pSW/ok7xQ7DiMlVp81/FluTJyMRLRbzdML0IAHww88UzeCVBehXKIsYPOrZ
	 +MDwu+mPSMn3w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c7ce122c7so31295211fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 08:51:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq0CV6pt4j+jg8lRxJp+5YzXEjTBGZB7TQwLLeNh4FfVT4GLFKOd14xJu3rY14BHAbJEOJ4nEGWXUlOrBWHy6rO@lists.infradead.org
X-Gm-Message-State: AOJu0Ywn8dzwH9rqpHuK9cNG8yAbcyegw6eVlYELcD0Gv8c0WC1TliMu
	4ZJ/8pvJRPU1iXqazqRnRGWbxsXd5KKuslv473ZfO403w/6EWhXycDGxDOi307XHl93Kpr2XST6
	ovOP3hvnImvMIkkZiHz25OAfBZHgdzmw=
X-Received: by 2002:a05:651c:993:b0:39b:2757:c1d6 with SMTP id
 38308e7fff4ca-39f86471060mr21707501fa.38.1785772313505; Mon, 03 Aug 2026
 08:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260721223956.13665-1-andre.przywara@arm.com>
 <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com>
 <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com>
In-Reply-To: <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 3 Aug 2026 23:51:39 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com>
X-Gm-Features: AUfX_mykiCofOgbK_TVpQ-xxmMo27pprJnOYMLjcLPvAuKFRrLLpFUAz2YflKOA
Message-ID: <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com>
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

On Mon, Aug 3, 2026 at 11:37=E2=80=AFPM Juan Manuel L=C3=B3pez Carrillo
<juanmanuellopezcarrillo@gmail.com> wrote:
>
> Hi Andre, Chen-Yu,
>
> > So can you please double check this?
>
> Checked on my Orange Pi 4A (T527, GMAC1, Motorcomm YT8531 PHY). You are r=
ight:
> PJ10 is not needed on this board.
>
> PJ10 function 5 is RGMII1-EPHY-25M, "25 MHz Output for GMAC PHY" in the A=
523
> manual v1.4. The RGMII1 bus itself is the other 15 pins (PJ0-PJ9, PJ11-PJ=
15),
> which mainline already has. My claim came from a stale comment in my tree=
, from
> when I was chasing the dead RX. It is gone now and my rgmii1 group matche=
s
> sunxi/for-next. The Tested-by I sent on 22 July was already measured on p=
lain
> mainline without PJ10, so what revived RX here was your withstand fix alo=
ne.
>
> > Those settings differ from what's in mainline. What are the results wit=
h
> > those delays?
>
> Measured on the same board, DTB-only changes, TCP for 10 s per direction:
>
>   A  mine (rgmii-rxid, MAC tx 100 / rx 0, PHY rx 1900 ps)
>         TX 0.938-0.940   RX 0.929-0.930 Gbit/s
>   B  mainline delays (rgmii-id, MAC tx 0 / rx 300, none on the PHY)
>         TX 0.941   RX 0.929 Gbit/s
>   C  the Ethernet path exactly as mainline has it
>      (B, minus motorcomm,auto-sleep-disabled, minus PJ10)
>         TX 0.941   RX 0.929 Gbit/s
>
> All three saturate the link, with rx_errs, rx_drop, tx_errs and tx_drop a=
t 0
> over roughly 1.6 million packets each. So mine are just other values that
> work, and I am dropping them in favour of mainline's.
>
> > ethernet on the A523 has other problems. The performance is really bad
> > (even RX), and there are errors or packet drops.
>
> I do not see that on this board, not even with C, which is mainline's Eth=
ernet
> DT unmodified. I also checked the YT8531 auto-sleep: the first packet aft=
er 5,
> 10, 20, 30 and 45 s of silence came back in 0.21-0.24 ms, no losses.
>
> The kernel is my own 6.18-based tree, although stmmac and motorcomm.c are
> stock, and this is one board with one PHY. Chen-Yu, which board and which=
 MAC
> are you seeing it on, and how do you measure it? If it is another board o=
r
> GMAC0, I can try to reproduce it here.

On my Orange Pi 4A, running iperf3 between it and another Orange Pi 5 Plus
(which has Intel PCIe NICs) as the server:

  - 4A as client: ~180 Mbps
  - 4A as client but with reverse transfer (-R): ~520 Mbps

Now if I do the same test between the Orange Pi 5 Plus and my virtual machi=
ne
on an AMD AI 370 Pro based NAS, I can saturate the link up close to 2.5 Gbp=
s.

If I use a H618-based Orange Pi Zero 3 as the client and the Orange Pi 5 Pl=
us
as the server:

  - Zero 3: ~920 Mbps
  - Zero 3 with reverse: ~280 Mbps

And I think my Cubie A5E and Avaota A1 fared even worse.


Something is definitely off. I don't know what though.


ChenYu

