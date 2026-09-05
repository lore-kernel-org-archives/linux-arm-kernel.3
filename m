Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E51C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 06:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wroX+IXZ78hb2aQP5LUDjSlqEruTGuDIlApEgq/LO60=; b=PjOAifjyjgYwyvZNQYml+6tiwC
	reKJmW5hClCAQPuNkkrTKReIer9zMXXLmmjghD46idB0wdj1zRRbAi+WM2clArgspE3JNCPH840Nu
	ibMItwTXouguEo+BINHlEkUwmCpH2ijmfPgQB/0+cLRxQiyXOyGvH6/j3rrsY8CaHRi05Ko8P5+nO
	bOhVCZB0P/wSpbEGRe0nZN2oioWqagvBTtgf+zx85K6yACTMgm+x2PfIYbcKA9kKdXBfPEgvU5TKJ
	x2Q0P7+Z0fgaxlsGxA/UgVoRxmeRZWl/4SpWyrVGm0SJcBWaVQPkBfr0u75dNtbNujrFAe1wHStH+
	wDir+OuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2jha-00000003jN1-1nXF;
	Sat, 05 Sep 2026 06:16:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2jhZ-00000003jMv-1O2Q
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 06:16:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9496D44247
	for <linux-arm-kernel@lists.infradead.org>; Sat,  5 Sep 2026 06:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6171F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Sat,  5 Sep 2026 06:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788588992;
	bh=wroX+IXZ78hb2aQP5LUDjSlqEruTGuDIlApEgq/LO60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eG6Yau/SZQyADBf7WEKKvoXO5elZ/bvCf/rLi+iKt3NTLV7xty74rhFfmCtOpPiim
	 KsAmLG9Gn+z3shv/KSeuw44rHL9DtjgoqL/rXuxlacLkIVZF2+hqWRGRtWUTXi/qmJ
	 kZl5s4svuLfbc9Q0nHCHcueEtH3KiRVj1uiGBF/HJ7S7HftHqGrPtY0Sno1Rhjpz4S
	 r4ZM1gDlCVp9/4jsn5pfGOohCmBT4WDB98quAjGdOyMWd9pF1NAdOgRtz+4BlRvGeN
	 E8KPCW/IB9VA/PTkef8GQF62ljNlTZ7dJCjGnGxIPtOxwhbNeoezclLf0Kn6pu8kjd
	 1SF3HTI8TDArw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b4adcce4b1so538387e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 23:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzpSymRDevY4YisUZvLjtn3JF0xetzqzPL/f3obgaNB84h7Hyt8PF3WODJFfRv03EFf2A3lfyBRaZbnQ3eA2f/@lists.infradead.org
X-Gm-Message-State: AFuF++mMAMYL+Vlb2NrgPjPWO8dg5JMTxF2ahooEBTX4phlhgAeBIS/T
	mLfc8LTqxHC1clkTRArFj/VN6PQelBfq3Kx6DcQKaAWvFk87FyzAkT1b12tWuSkvBAKgI6exZT5
	f3tSTUkAwGOHxv6AcKXWoRS4AYf4YTfc=
X-Received: by 2002:a05:6512:2c0c:b0:5b4:74a2:cf2e with SMTP id
 2adb3069b0e04-5b616f235cemr3181239e87.21.1788588991087; Fri, 04 Sep 2026
 23:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com> <20260831082335.1184605-9-wei.fang@oss.nxp.com>
In-Reply-To: <20260831082335.1184605-9-wei.fang@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 08:16:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLk+DMHzHiJoX6LMY5wUGMOWm3DN_yAHUUSvFKLKgFwJZw@mail.gmail.com>
X-Gm-Features: AcwNN1VLKzpVVc3BcKIIuwpH2P20ZdeitB0o0lFGwyQdTkbcdnQSy6KPeNWVBSI
Message-ID: <CAD++jLk+DMHzHiJoX6LMY5wUGMOWm3DN_yAHUUSvFKLKgFwJZw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 8/8] net: dsa: netc: add PTP one-step
 timestamping support
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	richardcochran@gmail.com, wei.fang@nxp.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

Hi Wei,

thanks for your patch!

On Mon, Aug 31, 2026 at 10:24=E2=80=AFAM <wei.fang@oss.nxp.com> wrote:

> From: Wei Fang <wei.fang@nxp.com>
>
> The NETC switch supports one-step TX timestamping for PTP Sync frames.
> When transmitting a Sync frame, the driver reads the current PTP time
> and writes it into the frame's originTimestamp field, and inserts a
> To_Port subtype 1 tag carrying the low 30 bits of that same PTP time.
> As the frame leaves the wire, the MAC captures the SFD transmit time
> and derives the residence time from the timestamp in the tag. It then
> reads the correction field at the offset given by
> PM_SINGLE_STEP[OFFSET], adds the residence time to it, and writes the
> result back.
>
> PM_SINGLE_STEP is a per-port register that can describe only one
> in-flight frame at a time, and programming it requires reading the
> current PTP time, which may sleep. Both constraints rule out handling
> one-step Sync on the xmit path.
>
> Instead, defer transmission to a per-port process-context work. The
> xmit path classifies the frame in netc_port_txtstamp(): a genuine
> one-step Sync (twoStepFlag cleared) has its PTP header offsets cached
> in the skb control block; frames that cannot be handled as one-step
> fall back to the two-step path or are sent as normal frames. netc_xmit()
> hands the classified frame to the switch driver via the
> onestep_sync_enqueue tagger callback, which queues it and kicks the work
> if no frame is currently in flight.
>
> The work dequeues one frame at a time, reads a fresh PTP time, programs
> PM_SINGLE_STEP, updates the originTimestamp field, and transmits the
> frame directly to the conduit via the onestep_sync_xmit tagger callback,
> bypassing dsa_user_xmit() to avoid double-counting TX stats. Only one
> frame is in flight at a time: the frame carries a TX-completion
> destructor that reschedules the work when the conduit frees the skb,
> keeping PM_SINGLE_STEP always matched to the frame being transmitted.
>
> The one-step context is reference-counted and its lifetime is decoupled
> from the devm-allocated netc_port. In-flight skbs hold a reference via
> their destructor, so the context outlives port disable until the conduit
> frees the last in-flight skb. Port disable clears onestep->active under
> work_lock; a work that runs afterwards observes active cleared will
> purge the onestep->queue and return without touching the freed port
> resources.
>
> Assisted-by: Wchat:claude-opus-4-8
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

You agent produces "dostoyevsky commits" with too much verbiage.

Tell you agent to "be terse and to the point" in your AGENTS.md.

> +
> +               /* dsa_tree_teardown() calls dsa_tree_teardown_ports() be=
fore
> +                * dsa_tree_teardown_switches(), so netc_port_disable() i=
s
> +                * executed before netc_teardown() and onestep->active is=
 set
> +                * to false. In-flight one-step skbs still hold reference=
s via
> +                * the destructor; the context (and its work) is freed on=
ly
> +                * after the conduit frees the last in-flight skb. By the=
n np
> +                * may be gone, but the work no longer dereferences np be=
cause
> +                * onestep->active has been cleared. And onestep->queue w=
ill be
> +                * cleared by netc_onestep_work()/netc_onestep_destroy_wo=
rk().
> +                */
> +               netc_onestep_put(np->onestep);
> +               np->onestep =3D NULL;

This type of stuff is over-commenting and is considered AI slop.
Tell you agent to be very restrictive with inserting comments, essentially
it should only do that when you explicitly tell it to, such as when you
yourself feel it is really necessary or you got a review comment that
this is needed.

Yours,
Linus Walleij

