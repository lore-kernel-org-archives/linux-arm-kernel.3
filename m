Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BFCCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 09:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvB9uFwSO71J5u5suf9LzDD3AAOVAFdkQHjXMqw5dYs=; b=FhDKGcmsADWGqI1OY2wXB3G/WY
	M3WvT7iEbgGWq9kZyTx0I1DFMfnkNwgECpYZKAiaSPDv5wvV0C4OE/jyU4dXR9nJVyisL1WAmNvR1
	2ZPg3hNYBSNww8ets0LlXoN07zqvauqjcQCIbtiOJzNUbsWgXnQ5xBGehb+aiElpb3MPs/fqc7iha
	cwHNDRrwLZmJ0SCHT0dYFQzcvZcBGkafm/J6+Z27w5q3wsG3qkZpp0hixPIIxioDWpTNA0nkqGrPC
	hPU398GN0KGk/rHG/GKo7FMsNuNyRxPPBlOcO31paaPF/uzUb1DDDvngO12EJENrZDsvJN93Uy1Oe
	xUHqC6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRbs-00000007IpP-2cOT;
	Tue, 16 Sep 2025 09:04:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRbq-00000007IoY-2NuD;
	Tue, 16 Sep 2025 09:04:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758013447; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KphIoxkx3Cqj0qXKv+QONEdYHdi7TOxjXMeIFjDfloMVupb2o61pMUqjZ4bqfTOQhqGIbUK8DbxXjGqxV5x0TexDs9hNGMEDerN5hu6QXGL214QmPFbdz9IwyTXArIYA3WiNexkebwTvf4u6Vz9Oloa8Sh8ghlxeKCt8uTUG/aU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758013447; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vvB9uFwSO71J5u5suf9LzDD3AAOVAFdkQHjXMqw5dYs=; 
	b=I/Gp8xb6pw6GnZQNdmmrEloJ+xsjI7JPL7JdONc0SPrqZE+QQDrTy2hnhmlIM1nhDbCwuqDBojz83VOKZ5+G4bBX6EKx2Bpi0HlKGZ6BTi5Rbq16jcH/wAruVDvzg/yWvtZBiyLWxyaPHSRhhhP+nriwk13Iu23ejuSz5brnzQs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758013447;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=vvB9uFwSO71J5u5suf9LzDD3AAOVAFdkQHjXMqw5dYs=;
	b=VYZoQfhaOxFZl7gpYmtPRLiRUkgTVYFaa6Td3m/0wyTVx6ttkq5K7psZ/2urwqCL
	XCWZCkcz0LaT7xSAjw86BWu2urnKCyzUilLfARa5y6dBH2nj21gyNG3u/ScGSxaBIr3
	qzZSU3LkTgXPn83JtA/HRG2LCAODFg/qgxxD5yvE=
Received: by mx.zohomail.com with SMTPS id 1758013446090111.71149807332927;
	Tue, 16 Sep 2025 02:04:06 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 05/10] mailbox: add MediaTek GPUEB IPI mailbox
Date: Tue, 16 Sep 2025 11:03:57 +0200
Message-ID: <5236533.GXAFRqVoOG@workhorse>
In-Reply-To: <CAPaKu7STDDp6D_fDGVfAKFrb5aWcxtwsT3nYtYDQQYCs7G9upA@mail.gmail.com>
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <8577914.T7Z3S40VBb@workhorse>
 <CAPaKu7STDDp6D_fDGVfAKFrb5aWcxtwsT3nYtYDQQYCs7G9upA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_020422_648039_0F3F61DF 
X-CRM114-Status: GOOD (  58.46  )
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

On Tuesday, 16 September 2025 06:55:30 Central European Summer Time Chia-I =
Wu wrote:
> On Mon, Sep 15, 2025 at 6:34=E2=80=AFAM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > On Saturday, 13 September 2025 00:11:10 Central European Summer Time Ch=
ia-I Wu wrote:
> > > On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> > > <nicolas.frattaroli@collabora.com> wrote:
> > > <snipped>
> > > > +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> > > > +{
> > > > +       struct mtk_gpueb_mbox_chan *ch =3D data;
> > > > +       int status;
> > > > +
> > > > +       status =3D atomic_cmpxchg(&ch->rx_status,
> > > > +                               MBOX_FULL | MBOX_CLOGGED, MBOX_FULL=
);
> > > > +       if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
> > > > +               mtk_gpueb_mbox_read_rx(ch);
> > > > +               writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_I=
RQ_CLR);
> > > > +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->nu=
m],
> > > > +                                       ch->rx_buf);
> > > Given what other drivers do, and how mtk_mfg consumes the data, we sh=
ould
> > >
> > >   char buf[MAX_OF_RX_LEN]; //  MAX_OF_RX_LEN is 32; we can also
> > > allocate it during probe
> > >   mtk_gpueb_mbox_read_rx(ch);
> > >   mbox_chan_received_data(..., buf);
> > >
> > > mtx_mfg makes a copy eventually anyway.
> >
> > We don't right now, at least not until after the callback returns.
> > So we need to have the copy in the mtk_mfg callback, not after the
> > completion. That's fine and I do want to do this as this is what
> > the mailbox framework seems to expect clients to do.
> >
> > > We don't need to maintain any
> > > extra copy.
> > >
> > > Then we might not need rx_status.
> >
> > We can probably get rid of it if we keep the per-channel
> > interrupt handler. Otherwise, we may still need clogged,
> > as we don't want to process interrupts on channels we have
> > no user for.
> >
> > >
> > > > +               atomic_set(&ch->rx_status, 0);
> > > > +               return IRQ_HANDLED;
> > > > +       }
> > > > +
> > > > +       return IRQ_NONE;
> > > > +}
> > > > +
> > > > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *=
data)
> > > > +{
> > > > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > > > +       int i;
> > > > +       u32 *values =3D data;
> > > > +
> > > > +       if (atomic_read(&ch->rx_status))
> > > > +               return -EBUSY;
> > > > +
> > > > +       /*
> > > > +        * We don't want any fancy nonsense, just write the 32-bit =
values in
> > > > +        * order. memcpy_toio/__iowrite32_copy don't work here, bec=
ause fancy.
> > > > +        */
> > > > +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> > > > +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->t=
x_offset + i);
> > > > +
> > > > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> > > > +{
> > > > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > > > +       int ret;
> > > > +
> > > > +       atomic_set(&ch->rx_status, 0);
> > > > +
> > > > +       ret =3D clk_enable(ch->ebm->clk);
> > > > +       if (ret) {
> > > > +               dev_err(ch->ebm->dev, "Failed to enable EB clock: %=
pe\n",
> > > > +                       ERR_PTR(ret));
> > > > +               goto err_clog;
> > > > +       }
> > > > +
> > > > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > > > +
> > > > +       ret =3D devm_request_threaded_irq(ch->ebm->dev, ch->ebm->ir=
q, mtk_gpueb_mbox_isr,
> > > > +                                       mtk_gpueb_mbox_thread, IRQF=
_SHARED | IRQF_ONESHOT,
> > > > +                                       ch->full_name, ch);
> > > I don't think this warrants a per-channel irq thread.
> > >
> > > mbox_chan_received_data is atomic. I think wecan start simple with
> > > just a devm_request_irq for all channels. mtk_gpueb_mbox_isr can
> > >
> > >   read bits from MBOX_CTL_RX_STS
> > >   for each bit set:
> > >     read data from rx
> > >     mbox_chan_received_data
> > >   write bits to MBOX_CTL_IRQ_CLR
> > >
> >
> > I don't like this approach. It brings us back to having to process
> > multiple channels per ISR, keep track of when the interrupt should
> > be enabled and disabled based on how many channels are in use, and
> > also is not in line with what e.g. omap-mailbox.c does.
> >
> > Remember that `mbox_chan_received_data` synchronously calls the
> > mailbox client's rx_callback. In mediatek_mfg's case, this is
> > fairly small, though with the request to not make the rx buffer
> > persist beyond the rx_callback it will gain an additional memory
> > copy. But we can't guarantee that someone isn't going to put a
> > slow operation in the path. Sure, it's going to be atomic, but
> > waiting for a spinlock is atomic and not something an ISR would
> > enjoy. I don't think mailbox clients would expect that if they
> > take their time they'll stall the interrupt handler for every
> > other channel.
> >
> > So we'd keep the interrupt disabled for all channels until the
> > client that received a message has processed it.
> >
> > I can see myself getting rid of the handler and just having the
> > thread function as the bottom half, but I'd really like to keep
> > the one-IRQ-request-per-channel thing I've got going now as it
> > made the code a lot easier to reason about. However, doing this
> > would mean the interrupt is re-enabled after the generic upper
> > half, when all the business logic that needs to not run
> > concurrently for an individual channel is in the bottom half.
> >
> > As far as I can tell, this would then mean we'd have to add
> > some concurrency exclusion mechanism to the bottom half.
> >
> > Moving all the logic into the upper half handler function
> > would make that handler somewhat longer, and I don't know
> > if IRQF_ONESHOT masks the interrupt for all users of that
> > IRQ number or just for those with that dev_id. If it's per
> > dev_id, then I'm fine with moving stuff up there. But from
> > my reading of the core IRQ handling code, that does not
> > appear to be the case; one channel getting a reply would
> > mask *all* channels of the mailbox until the upper half is
> > completed, and if the upper half calls into a driver
> > callback synchronously, that may take a hot minute.
> >
> > Put differently: Is there a problem with one thread per used
> > channel, or are we going off vibes here? The way it currently
> > works uses the shared interrupt to mark just that one channel
> > as busy with rx_status before letting the IRQ for all channels
> > be unmasked again, which seems ideal to me.
> No, one thread per used channel can work. I can't say I like it, but I
> also don't know the hw as well as you do.
>=20

Your knowledge is probably not far behind mine on this hardware :(

I'll keep the per-channel thread for v3 for now, so that it's
clearer as to how this will look. It'll also give us both an
opportunity to run the code and add some measurements to see if
this causes any problems, and to experiment with your proposed
solution.

What I mainly am worried about is that if we go back to one IRQ
for all channels, then we have to do our own "how many channels
are enabled?" accounting to disable the IRQ later, because the
enable_irq/disable_irq accounting works the opposite way where
you can disable as many times as you want but your enables can't
exceed disables + 1.

Kind regards,
Nicolas Frattaroli




