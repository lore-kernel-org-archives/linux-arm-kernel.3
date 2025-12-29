Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C74CE94102
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 23:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWcfZNdGwkDeFXT0U+DkhMgrguAsOEcCdu03PYHlSyY=; b=r4jZn9i56UwKb2poOkr6Dswm5+
	LD1V3VjXOcYIb5iN083Bo+JtCyjhqv36fcX02FwpIM/vUtD4h5L6kBaj/r/QdvN36CasLZIpwLNtW
	Ug7ZTcWyNd3jakT7jnHuka2ppq3epJ6aPhmBIYPWI/1ZU69xrJzr+f1m+KWdCkTAxBQldnueC/XCW
	YNZ6s1bPyVw/FccXUMwskpEXQlS4P9nfqRF17qLF7r9yo/C1tsoZiT07M2TW0vJc/fEccjc6OBtIm
	52zZ7zEW0fuQiC1ooj4dRrh6yCM8JeQ2pjt8V92iSHzpxupxdeJCzGla9rBRX39kravSytdzqJ5PQ
	2nLzcNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMsN-000000049dK-49Ib;
	Mon, 29 Dec 2025 23:42:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaMsJ-000000049bt-2JzL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 23:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 22C44434E2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 23:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0388BC19422
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767051726;
	bh=M744/O3+s1JL5qiahLA1Uihmyo12jfWHL5kieAH92fo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cYWSSgMcPqcEBwcdyurlCbJKqSzS8bAjBjU+7poL8b87075tSxMpUx37FAAUb/8Gr
	 RxHGpfjXK/K/CaB+iI14Tba2s/C0n0vtX1fsWC5xpN6yYWYNSgkIY45WHlPGr6vx+6
	 uQV6QFpbC/5rXdgkOvnCqkzuFFeilLyMoCdXM2O0eZ8vSAzW2C8Q+TDA8E1cquzKpJ
	 ikGJru96vxoAQT5iXp9d1ST45GoTYDlyBHDADSnJKaXbSGCuBflKdXZpVwjZsUC/fl
	 RoW3AYKliHr/YKyjByqpTEmUft8vktEKsEYEbFu2L7cAAQvkLBDGDaWVjJiUuB8/T+
	 VmAU923qmAt+Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5958931c9c7so10728393e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 15:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXt63TGoAR6EjOV7CzAaD9hy2BgL2RIStp4CQZ/sr6yI6i2flIbZfrJw33p9QU3iuencmILd3hUI3shvDY9N+gQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw33P6QhDwlEf2vZ1FECDvt9DxX1c+sR937xneB1Iw2qfGJlRc8
	gzXkiFg2L+89aKbVRRcT6msAjGOWVuYuuHxJOqF0NCbb/tfZ1ygIEpztbj+LlSjs2CHUe7VFUfU
	bRuWJlvUJDhHDlWiCPouoASljunK/ArY=
X-Google-Smtp-Source: AGHT+IHBu7p/2mmx+FhXyVAuttPCWqOm5TyWz6tjpfh1VSCw7oFlLpS7Z57a7r/KgvwSEW2YM20kkC53mORH9TEqSQU=
X-Received: by 2002:a05:6512:33d0:b0:594:314d:ac53 with SMTP id
 2adb3069b0e04-59a17d9a47emr10254052e87.23.1767051724351; Mon, 29 Dec 2025
 15:42:04 -0800 (PST)
MIME-Version: 1.0
References: <20251114104325.116471-1-marco.crivellari@suse.com> <CAAofZF51pkOzrg_nO0Mhx6g9b3JPtO3n+0YE=WtSgj_F6wnY4w@mail.gmail.com>
In-Reply-To: <CAAofZF51pkOzrg_nO0Mhx6g9b3JPtO3n+0YE=WtSgj_F6wnY4w@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Mon, 29 Dec 2025 17:41:53 -0600
X-Gmail-Original-Message-ID: <CAGp9Lzoj2jeGF+t-UP0gAykCZ96-OkjummeJRGniYfagvY-BPA@mail.gmail.com>
X-Gm-Features: AQt7F2r91KaVUEyIzuYeQQ_55HRYc3_5T1Vv877riVQa3S2VQymK3OUa69R78Y8
Message-ID: <CAGp9Lzoj2jeGF+t-UP0gAykCZ96-OkjummeJRGniYfagvY-BPA@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: replace use of system_wq with system_percpu_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_154207_630858_3F916D22 
X-CRM114-Status: GOOD (  16.53  )
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

On Wed, Dec 24, 2025 at 9:27=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> On Fri, Nov 14, 2025 at 11:43=E2=80=AFAM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >[...]
> >  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 +-
> >  drivers/net/wireless/mediatek/mt76/mt7925/init.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers=
/net/wireless/mediatek/mt76/mt7921/init.c
> > index b9098a7331b1..95764b82da39 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> > @@ -343,7 +343,7 @@ int mt7921_register_device(struct mt792x_dev *dev)
> >         dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainm=
ask;
> >         dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainm=
ask;
> >
> > -       queue_work(system_wq, &dev->init_work);
> > +       queue_work(system_percpu_wq, &dev->init_work);
> >
> >         return 0;
> >  }
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/init.c b/drivers=
/net/wireless/mediatek/mt76/mt7925/init.c
> > index d7d5afe365ed..e33ab4849e8a 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7925/init.c
> > @@ -420,7 +420,7 @@ int mt7925_register_device(struct mt792x_dev *dev)
> >         dev->mphy.hw->wiphy->available_antennas_rx =3D dev->mphy.chainm=
ask;
> >         dev->mphy.hw->wiphy->available_antennas_tx =3D dev->mphy.chainm=
ask;
> >
> > -       queue_work(system_wq, &dev->init_work);
> > +       queue_work(system_percpu_wq, &dev->init_work);
> >
> >         return 0;
> >  }
>
>
> Gentle ping.
>
> Thanks!

Hi Marco,

The patch has been queued in the mt76 tree. Thanks for your work on this.
https://github.com/nbd168/wireless/commit/ee518f914cd901c16fa08a6f228b26655=
1f72a6a

            Sean

>
> --
>
> Marco Crivellari
>
> L3 Support Engineer
>

