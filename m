Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FADBCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=; b=T95ziq8G5IxUhWGVFrcK+To5Nq
	8iksIBsPa56YaPnXQZABLREuy9kOhD8XbGopLEBiUdwrsdQlsVamWw6UOSMyV4yC6KDoleIJTaO5E
	TgFKcVC/XsBCYvlyYDaqOtFf8R7ki1ADF0GijEP6M4+eS3e9Now7RUmWKGxmOS9y+p5oXXTLGrA+2
	YUTtD0kigLZrVeRqY3Fg6Fmv9zmX0tLXZ2e8vqBa8iJ/+n6AMtqMuKpXJARJ06obb79Z0mdiubgGc
	/GZNHT6tdmzU929zm6FXaoIiy5G6twH8XklFAEKEhA4hW0c4Ki3AgKiXrUPR/IBBUbgngG8FCCT4M
	QQnAfyCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wODdD-0000000Afmw-2gMu;
	Sat, 16 May 2026 11:56:35 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wODdB-0000000AfmS-1Plm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 11:56:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ba0714574fso4149505ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 04:56:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778932592; cv=none;
        d=google.com; s=arc-20240605;
        b=iEUGJjv8BCnTk93rKv32JSRQ5jSl1CAI4+NUWPy1jTnnIBx55XY+b/ngYSbLrL5HFh
         G4NcuHxxj983ErBJdnI943VjO9JLo5H7YyBHlYRJpPXbSZ8xmjKrPIJH2WTROabrmZMy
         D0lzrOxoDq2CWf714VPtqB+Y1Tn/wOtpARPplazgL4Psakmro1moArKvq00dvowelqae
         El9VpoUqnbmiAzMMzPy9CR+qUBZL1ma/QZ5wSGtPD/JH6Qa3OaHtu8cY4BREggOa3bzO
         zG8Wvmi7fPQA3eUw3hV+ngVKGFgT7zT6uRFek6bDZ4ZU7xKplo+IVf7X4nTnDeDrdzNu
         bWNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        fh=+t9StDJmNMXexc77ondqhvh53RmtFxKTi3esnodJy/E=;
        b=FNlGEYz9baMWKjgi6kroiODM8FFL12lX51SP22KmkRJJUfcReEDYpb+pcc6BFttO0J
         BNyk6ONBDUxgV+7xZbCstb5k6zXa7LxoCC7/7WW5AZhxj4+htvqmP3fOnRIDk/ESjY6h
         8iqRuqemXrsA1m/T4hZGsQ1wjxO05YYLkX3lBakNHb+f9XGn4A9aNQSrcG9Y+6e+TxQq
         pHm9QdT07I5hpjbsPgimNz61RZ94p1tTZOvgoqHnSmrTrup5OroO7VJYq6s0lFK9JXId
         V7cJXuLHg8nAT+533JxE5Lvj0pMM83XvGroT2rvL2n93yEY/1GkAB6Vg+wZxd2QGq5H3
         i7nA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778932592; x=1779537392; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        b=JMWCtI78N0rUtxjm8SZoXnjqKU3g2ZYAQ7yu0wrIu5RAzn2zoEexxTzHFQ6mgicWP8
         PfNZgID56ZJGYG3KkiOXTkIkyiVKulOhbaxNPRPYWGunyIK6ElR8fg7W3HgOfhtRl4q9
         3rMpavoRYVwA/2zzmrCSbcbnDR03XzhAVbtldIaPc+nI3sepkpsk1PpKNqsqMiB4E4ou
         XLeESKi8GEZhJXipdd84dmqoYrnZAKtLDAj+SXcYQFIqFzbqApAQzmD2X3QCV1S8BAF2
         aCtxi64gTHzIuYueXa5x7PL64wLkSaaI3RZTMg2fcnzMdMQrQstSROnjsfjoF7lZNgaB
         0kJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778932592; x=1779537392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3Tnm8GfrdaS1CO5k7Ifb/71wv0N1iYSyYKMb0AGSQU=;
        b=q5/0cjzWGEg/pzv1gg10/cTaNZ0RKjcPdRC5N7FF//m997hwySC1d8O64lWmFGS243
         J5E+7JXUtUNk/oLGGaeut/GZGmPtU39ebbGkPoChvHxcUTfPXtJwG8g57NUofUHw0UVf
         4/d3pAkE+P454P+1qU63ANYSq/Z6miwt0VLI4Lb2TVVIFUOh7Zx1nFrZYhUN+lvSOlge
         GOEJq8HIyaSlFqPS67vpByz1fGWIITR+nKErhap0qYxj97atbslEu+aCl89C5IGpNNg5
         4jOuPM3zDlDm/ZBbvSuPVBW8DCGy39q+qwfJxaoKqq/Sc8E4/kYnKtrV5X6JeTOHFJf4
         +gOw==
X-Forwarded-Encrypted: i=1; AFNElJ8CQe3UJ5diTXqPCm4oqb14ecoSEGueph523aRhsxwwebXNOWdbjuEVkXSWFGUXl2vK7pW5A0pJMRvJvIYkV390@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5wPUa8N0RGzPOd9e6+/s0fekw2lseHDfGFZSvQ2caUJwBWiya
	UjHrRsty1vlKQ2+uaDz1Co47rx9BgaqsbU7NxeLASZOiv6UA31w8iUV3OMWe0Yc5UN3U7uRE/+G
	apzC9o8IsY5W2nYOAMFjM+xrUUPr7l70=
X-Gm-Gg: Acq92OFQSq4lEByAgioyJUXh+/HavX9HTUvpzSxdDYBRJGSFl2N8ag39YuP2PSkuMX7
	A4dz7GfBS6D25Mq+mPKix9/9hQ5/YXXypYoHZNh/3h8VtChYmxmEi56z7R0nelLzBBxtqhXzS7p
	3teaKevUntU5pQd2n5+Bslv6Qp+gJiF29be8Oa2Qs1eYnb3cAOhHi22dZhyVjCzd65MxYPKfNYP
	uD7RHXJml6/wuwpv6dCBF9tlG2FDt73Pkeqi0Y4xk1v5csmSKftdlvDhDYkOxbNvFKJQ+EekNNE
	MJoh7HH+/u2ZaOtx6hTxSKbGFl5e721/1g1yK+eP
X-Received: by 2002:a17:902:fc84:b0:2b2:eb9d:1648 with SMTP id
 d9443c01a7336-2bd7e9a02e3mr81606565ad.37.1778932591918; Sat, 16 May 2026
 04:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260513105003.81880-1-phucduc.bui@gmail.com> <20260514043314.62222C2BCB7@smtp.kernel.org>
 <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
In-Reply-To: <CAABR9nGhwtBu9Yhbn-BTD1Scykp2h6eQbtQtT13DcnekUdum1A@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 16 May 2026 18:56:18 +0700
X-Gm-Features: AVHnY4K87wbzdoBlkwWjKd4mYgN3M-8jhbsSCXPKekL4N1DL1gksd-L0oaFEhQw
Message-ID: <CAABR9nGZM3Bnb3DnObdp2nOJmW6ezmXqRSBtgS00Ps2ve4zsbg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Use guard() for spin locks
To: sashiko-reviews@lists.linux.dev, Mark Brown <broonie@kernel.org>
Cc: linux-sunxi@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Marcus Cooper <codekipper@gmail.com>, Chen Ni <nichen@iscas.ac.cn>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_045633_387160_8F4F9E5B 
X-CRM114-Status: GOOD (  34.46  )
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

Hi,

I am not entirely sure whether the issue is exactly as
described in the Sashiko review.

However, I also looked at a similar case in the
micfil_rate_set() function from the fsl_micfil driver:
https://elixir.bootlin.com/linux/v7.1-rc3/source/sound/soc/fsl/fsl_micfil.c

There, pm_runtime_resume_and_get() is also used to ensure
that the device is runtime-resumed before accessing the
registers.

To address the review comments and avoid mixing functional
changes with the cleanup/refactoring using guard/scoped_guard,
I am planning to split this into two separate patches:

Patch 1: replace spin_lock_irqsave() /
spin_unlock_irqrestore() with scoped_guard() / guard()

+ scoped_guard(spinlock_irqsave, &host->lock) {

    regmap_read(...);

+ }

Patch 2: add runtime PM handling around register accesses

+ ret =3D pm_runtime_resume_and_get(dev);
+ if (ret < 0)
+     return ret;

  scoped_guard(spinlock_irqsave, &host->lock) {

      regmap_read(...);

  }

+ pm_runtime_put(dev);

This should make the review easier and clearly separate the
functional change from the refactoring.
Does this approach look reasonable to you?
If so, please let me know and I will prepare the
corresponding patches.

Best Regard,
Phuc




On Thu, May 14, 2026 at 6:22=E2=80=AFPM Bui Duc Phuc <phucduc.bui@gmail.com=
> wrote:
>
> Thanks for the review.
>
> This seems to be pre-existing behavior rather than something
> introduced by this patch, since the current change only converts
> the locking to use guard() helpers and does not modify the
> runtime PM handling.
>
> If this turns out to be a real issue, it would probably be better
> addressed separately from this cleanup patch.
>
>
> On Thu, May 14, 2026 at 11:33=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [High] Hardware State / PM Violation leading to bus hang
> > --
> >
> > commit 0686001584788d984a0f16403183bcad78fe4176
> > Author: bui duc phuc <phucduc.bui@gmail.com>
> >
> > ASoC: sun4i-spdif: Use guard() for spin locks
> >
> > This commit refactors the locking in the sun4i-spdif driver to use the
> > guard() macro for spinlocks. It replaces manual spin_lock_irqsave() and
> > spin_unlock_irqrestore() calls with scope-based cleanup.
> >
> > > diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-sp=
dif.c
> > > --- a/sound/soc/sunxi/sun4i-spdif.c
> > > +++ b/sound/soc/sunxi/sun4i-spdif.c
> > > @@ -427,10 +427,9 @@ static int sun4i_spdif_get_status(struct snd_kco=
ntrol *kcontrol,
> > >       struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
> > >       struct sun4i_spdif_dev *host =3D snd_soc_dai_get_drvdata(cpu_da=
i);
> > >       u8 *status =3D ucontrol->value.iec958.status;
> > > -     unsigned long flags;
> > >       unsigned int reg;
> > >
> > > -     spin_lock_irqsave(&host->lock, flags);
> > > +     guard(spinlock_irqsave)(&host->lock);
> > >
> > >       regmap_read(host->regmap, SUN4I_SPDIF_TXCHSTA0, &reg);
> >
> > While this issue isn't new to this patch, does this code risk a bus han=
g if
> > the device is runtime-suspended?
> >
> > The regmap configuration lacks a cache, and these ALSA kcontrols can be
> > accessed by userspace at any time. If the audio stream is idle, the dev=
ice
> > will be runtime-suspended and its APB bus clock (apb_clk) will be disab=
led.
> >
> > Accessing the physical registers with the clock disabled will trigger a=
n
> > asynchronous external abort.
> >
> > Would it make sense to ensure the device is runtime-resumed (perhaps vi=
a
> > pm_runtime_get_sync() outside the spinlock guard) before touching the
> > hardware?
> >
> > [ ... ]
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513105003.=
81880-1-phucduc.bui@gmail.com?part=3D1

