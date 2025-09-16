Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1686DCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 04:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBcjRbm3FVwYUlOZdbgLY3RSHrk0clAp1Nkb0I9SPZU=; b=n8mAVKrJ3TOAmTY/03g/UAugz5
	egXQOnpzU6hWwYICHKcIb44AMjZHWegekMHIX9sJU+cET0BVn7J7W2OZt9lNKW+tZrc0hcayj3oeE
	l9i0CFCKsumojhWuXkdnw4wqIx8Wna0qQ8eLVn3vIKcA9zlp0p74XF/blsfljhC1Qt93hjSr3743G
	cBTrbjer1+YlueBVCHkFcvH/3pDNv1tFUA5NxeEymzn5zL+tNWN6XdmnANq3cZvlB+ZQEoco9kEEh
	eAqoSIhvIB/PT9A2fqLpqf5/8eWk+VXdJJawjtqxerUOdGeVPwX0Nk8l4on9qEeTZp1iJvE+JFZba
	r15uhJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNjG-00000006ksB-06r5;
	Tue, 16 Sep 2025 04:55:46 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNjD-00000006kob-3ZAl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 04:55:45 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e94d678e116so5158494276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 21:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757998543; x=1758603343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBcjRbm3FVwYUlOZdbgLY3RSHrk0clAp1Nkb0I9SPZU=;
        b=FK4bsU/StSr6Y3rrjnZwWm6/YBmHadqd7SeIyCOlXM8NW36HCLC3WJc94yxsT7eQJN
         URWHzKWzrr70csMiNfxKLc8bH4XOAlfva4w0auH8Gp0tMLh32tDjHRys1eOkh4lOtbAG
         L15CbVJM2BFNXAoaSHX0xQNOIInqGsqpI7i5SFlLr2wY+7MBrIHftjvavhxVS6jlG6rQ
         L81aBguYfthpHXWf7qtCXIalWrHyYG15j1dgw0YYF637v3D4AOtA3WJnDKV0LGDYIfbO
         3ZQRjPVNarcpetINkvleO0SWstxeZXmJImIKxZswml8dbtnnoyJyFZQ+fej1l5Xc/44Y
         KNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757998543; x=1758603343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBcjRbm3FVwYUlOZdbgLY3RSHrk0clAp1Nkb0I9SPZU=;
        b=Is0nLC2fBitsyla2u4Xw73QSQj34Jwr3qorTnUQpxketD0XIL5ax3qDEnEHXmIPw7s
         dET0r5I/1cCpJuNT1qUAfIurLFXqzMtFIE9SuVWSJ5ds9sNaMhmUjWy2tRU7Ks29R/h0
         uNVtoEmSFxwDtCFAJ8QRoY6ZnwxRJfWL+pvYTCSwwCPt6DZeZBXdKrSDkR93vJziPOhs
         j5XA0qlXdY+4gAOCCYkKcJs/7fBZItu7W7xPJRbS7ZhRmnKX4oJnO/S74TUeiM5cz7Uk
         +wKUyfOKHrmNDyywH2+lR2jI6NAe/Tf+GGq1Tvah1Qkyb9URC9QHJOF9ZX6CgyZ1PMEt
         XLFw==
X-Forwarded-Encrypted: i=1; AJvYcCX3EVL7tVcbutHuLeQ1sc2hab03dZ28Y45hdkoCog43lom4qYMtYLoqepR2fY2ZQ2ALw6zT5JHC2C0q+p1aMu2S@lists.infradead.org
X-Gm-Message-State: AOJu0YzCR4ClMmwbKV6AMwYWJl8L8OH0SMSiJEGISugyLKOpFIVR63Q6
	KW3bmk2gxZJIYeNCT829bHR6vw/R08L9efVhJ7/NTRRVLpyt7qLL8vikbDVdh21hQOV26Z0tvDW
	BTSWPAeFp+LTFAech9n5FIPTQouU9kOc=
X-Gm-Gg: ASbGncvpGPjCghOOmVAGfCPlpMXXHoHs9qhTpxWHL9Y/D6Vr/+08mGMiyi6SSjSM3Gq
	OlGBQriqMO66C0ruEe/Q84aM1sQh8EJt1U943dPoTXUN3v2mwd5ELNyGjDQ6pSAwg2e7srFIPBk
	YqUMTTqQ54G3oPCT6rIBJz6EP+l3IELFxkWoItoAMGathzMgijwl0/B70+VzuQS3RS6m4o+O3PH
	HDkXMWB1LHPlhR2Yt5nek7eXwICOvt6shJROPQcvBLC2Ax/btKUzH/CZwu5kbQNIr2r+17b
X-Google-Smtp-Source: AGHT+IFXVrlkAw4hIUMkjDUsgYvyK7EgpmYsPWpx/dWgsCW+cokg9VHakZyQIrCx9AHlixfNXCZ76u+Wtg35mXq2D/U=
X-Received: by 2002:a53:cb41:0:b0:612:891a:9ecc with SMTP id
 956f58d0204a3-627202230a3mr10138013d50.9.1757998542602; Mon, 15 Sep 2025
 21:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-5-779a8a3729d9@collabora.com> <CAPaKu7Q+KAzEtKBWy8KO2Kp+H4y-Mqo34uo=jgH1_iooaDq3hA@mail.gmail.com>
 <8577914.T7Z3S40VBb@workhorse>
In-Reply-To: <8577914.T7Z3S40VBb@workhorse>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 15 Sep 2025 21:55:30 -0700
X-Gm-Features: AS18NWCUMIgi23a5SaUlUvMdo-ihykJDXaO9mGCW6rE2ZLrI7uXsuBJkrMkP79E
Message-ID: <CAPaKu7STDDp6D_fDGVfAKFrb5aWcxtwsT3nYtYDQQYCs7G9upA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_215543_909871_FAF0C377 
X-CRM114-Status: GOOD (  51.23  )
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

On Mon, Sep 15, 2025 at 6:34=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Saturday, 13 September 2025 00:11:10 Central European Summer Time Chia=
-I Wu wrote:
> > On Fri, Sep 12, 2025 at 11:38=E2=80=AFAM Nicolas Frattaroli
> > <nicolas.frattaroli@collabora.com> wrote:
> > <snipped>
> > > +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> > > +{
> > > +       struct mtk_gpueb_mbox_chan *ch =3D data;
> > > +       int status;
> > > +
> > > +       status =3D atomic_cmpxchg(&ch->rx_status,
> > > +                               MBOX_FULL | MBOX_CLOGGED, MBOX_FULL);
> > > +       if (status =3D=3D (MBOX_FULL | MBOX_CLOGGED)) {
> > > +               mtk_gpueb_mbox_read_rx(ch);
> > > +               writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ=
_CLR);
> > > +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num]=
,
> > > +                                       ch->rx_buf);
> > Given what other drivers do, and how mtk_mfg consumes the data, we shou=
ld
> >
> >   char buf[MAX_OF_RX_LEN]; //  MAX_OF_RX_LEN is 32; we can also
> > allocate it during probe
> >   mtk_gpueb_mbox_read_rx(ch);
> >   mbox_chan_received_data(..., buf);
> >
> > mtx_mfg makes a copy eventually anyway.
>
> We don't right now, at least not until after the callback returns.
> So we need to have the copy in the mtk_mfg callback, not after the
> completion. That's fine and I do want to do this as this is what
> the mailbox framework seems to expect clients to do.
>
> > We don't need to maintain any
> > extra copy.
> >
> > Then we might not need rx_status.
>
> We can probably get rid of it if we keep the per-channel
> interrupt handler. Otherwise, we may still need clogged,
> as we don't want to process interrupts on channels we have
> no user for.
>
> >
> > > +               atomic_set(&ch->rx_status, 0);
> > > +               return IRQ_HANDLED;
> > > +       }
> > > +
> > > +       return IRQ_NONE;
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_send_data(struct mbox_chan *chan, void *da=
ta)
> > > +{
> > > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > > +       int i;
> > > +       u32 *values =3D data;
> > > +
> > > +       if (atomic_read(&ch->rx_status))
> > > +               return -EBUSY;
> > > +
> > > +       /*
> > > +        * We don't want any fancy nonsense, just write the 32-bit va=
lues in
> > > +        * order. memcpy_toio/__iowrite32_copy don't work here, becau=
se fancy.
> > > +        */
> > > +       for (i =3D 0; i < ch->c->tx_len; i +=3D 4)
> > > +               writel(values[i / 4], ch->ebm->mbox_mmio + ch->c->tx_=
offset + i);
> > > +
> > > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_SET);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int mtk_gpueb_mbox_startup(struct mbox_chan *chan)
> > > +{
> > > +       struct mtk_gpueb_mbox_chan *ch =3D chan->con_priv;
> > > +       int ret;
> > > +
> > > +       atomic_set(&ch->rx_status, 0);
> > > +
> > > +       ret =3D clk_enable(ch->ebm->clk);
> > > +       if (ret) {
> > > +               dev_err(ch->ebm->dev, "Failed to enable EB clock: %pe=
\n",
> > > +                       ERR_PTR(ret));
> > > +               goto err_clog;
> > > +       }
> > > +
> > > +       writel(BIT(ch->num), ch->ebm->mbox_ctl + MBOX_CTL_IRQ_CLR);
> > > +
> > > +       ret =3D devm_request_threaded_irq(ch->ebm->dev, ch->ebm->irq,=
 mtk_gpueb_mbox_isr,
> > > +                                       mtk_gpueb_mbox_thread, IRQF_S=
HARED | IRQF_ONESHOT,
> > > +                                       ch->full_name, ch);
> > I don't think this warrants a per-channel irq thread.
> >
> > mbox_chan_received_data is atomic. I think wecan start simple with
> > just a devm_request_irq for all channels. mtk_gpueb_mbox_isr can
> >
> >   read bits from MBOX_CTL_RX_STS
> >   for each bit set:
> >     read data from rx
> >     mbox_chan_received_data
> >   write bits to MBOX_CTL_IRQ_CLR
> >
>
> I don't like this approach. It brings us back to having to process
> multiple channels per ISR, keep track of when the interrupt should
> be enabled and disabled based on how many channels are in use, and
> also is not in line with what e.g. omap-mailbox.c does.
>
> Remember that `mbox_chan_received_data` synchronously calls the
> mailbox client's rx_callback. In mediatek_mfg's case, this is
> fairly small, though with the request to not make the rx buffer
> persist beyond the rx_callback it will gain an additional memory
> copy. But we can't guarantee that someone isn't going to put a
> slow operation in the path. Sure, it's going to be atomic, but
> waiting for a spinlock is atomic and not something an ISR would
> enjoy. I don't think mailbox clients would expect that if they
> take their time they'll stall the interrupt handler for every
> other channel.
>
> So we'd keep the interrupt disabled for all channels until the
> client that received a message has processed it.
>
> I can see myself getting rid of the handler and just having the
> thread function as the bottom half, but I'd really like to keep
> the one-IRQ-request-per-channel thing I've got going now as it
> made the code a lot easier to reason about. However, doing this
> would mean the interrupt is re-enabled after the generic upper
> half, when all the business logic that needs to not run
> concurrently for an individual channel is in the bottom half.
>
> As far as I can tell, this would then mean we'd have to add
> some concurrency exclusion mechanism to the bottom half.
>
> Moving all the logic into the upper half handler function
> would make that handler somewhat longer, and I don't know
> if IRQF_ONESHOT masks the interrupt for all users of that
> IRQ number or just for those with that dev_id. If it's per
> dev_id, then I'm fine with moving stuff up there. But from
> my reading of the core IRQ handling code, that does not
> appear to be the case; one channel getting a reply would
> mask *all* channels of the mailbox until the upper half is
> completed, and if the upper half calls into a driver
> callback synchronously, that may take a hot minute.
>
> Put differently: Is there a problem with one thread per used
> channel, or are we going off vibes here? The way it currently
> works uses the shared interrupt to mark just that one channel
> as busy with rx_status before letting the IRQ for all channels
> be unmasked again, which seems ideal to me.
No, one thread per used channel can work. I can't say I like it, but I
also don't know the hw as well as you do.

