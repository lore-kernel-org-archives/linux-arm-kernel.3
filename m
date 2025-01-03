Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECA0E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 04:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C0NE5QsoPl4wMHhm6FeWjhno0bwtzvAYZhAKmD1RqI=; b=KiSLOgE6pk7vM0O7dvhS2W5v04
	mGnNyOxcf7qNxGmigbe1mAU6W0EHCY/PW1XZTX2671WTz5NxbUQFCOQmkX8b5dJxKTVYaG/Ap9kqu
	cvW/P3GatXSMcNl9CCdQ5/w/xXo81bsB0bcoKf4uN+WWyuH9v2CSXPwJm8kxrtKeReAFHsna+AHd0
	O7+5kQ0dIkJeCo4M/YIqeye874GQLVRvyE+RohoOdEbjumqHXsoUQeKSraZzOTnesv8aTwXOtDMns
	d2OsTrAZnjQWs/jAc2BwumNEl2P8dbjNi9+pcF9vbIU/sDvG/7+KLtBzv3MFovHc6oRQqXP71WvVk
	hRcTSB5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTZkw-0000000C68n-3GSn;
	Fri, 03 Jan 2025 04:57:54 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTZjn-0000000C63x-35FJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 04:56:45 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53e28cf55cdso10218057e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 20:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735880201; x=1736485001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/C0NE5QsoPl4wMHhm6FeWjhno0bwtzvAYZhAKmD1RqI=;
        b=ncP6nD6zbVgk1J+2nIx4zP+2jTzbzLwcf8qH44DP7RaBdFQe9algW54usatZy0cfHV
         QP020TPOgETCgOAiVnpO6lKCzZq22NBxNPSvsnX4r6I7SRDQnVbthDyfs7IMOQY6gTbX
         6BLL+n7cSw+Re1P8geMZnm2g+p9pzvtzMEYnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735880201; x=1736485001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/C0NE5QsoPl4wMHhm6FeWjhno0bwtzvAYZhAKmD1RqI=;
        b=ECiFzB5z/ucBViparIx/U7UzMx7IKX4zuzclPvNl74ytIKimwW91iFsCWTGJ+hDV6Z
         G8iDko2qMmdecnDiPrxm4Ir+wzUyPiqYxXO1yeki05SjX10+wqlYBPEbNEHZyukkAKFq
         1IzpnydfF3k10jPSeNJAh88gKO2ChZ4h4IxMWVIy4uHqY52DeWkSfvsC+zTGXAuJa2DP
         t7Po9WWKIlu+hfwaOE7nhMv0FSRR7lMNUHbNRjLy7sDWFnLm5PkztzvdSgrV89viFe4g
         CakfrimfWMwi9UCNKpz66Y3LZYEx6kdCWrsguXhbMA7ftmEewpBsdS0I3nxfdPgTKkJk
         2sKg==
X-Forwarded-Encrypted: i=1; AJvYcCXapsyDEA2TTL9nsoLtxH54A1NnFr4Bhw+/PDMiGzJ14/rvqVHUB+ieXyVYvvFrECaY4ciFzKWetdOXnaca8b2C@lists.infradead.org
X-Gm-Message-State: AOJu0YwxagqKWNfN/F2V+t7ZW6cxTWH6qDDk+DIaU9qqrckZ5WPJPLoT
	Qih8ZvtlAoWIKlOxP6Yqf05Qp04fLwtKcQ7gIzqTo3UHyLu6leaP+pQtV5G8CJypFff9Td1/i/c
	HNI9Xy331UYmN16yHxZbton7cVcYVraJ83Oc4
X-Gm-Gg: ASbGncssr+XWzmFZTJZ9eu+y6XZKkPKI3TaeS8CTx3kX6L106fxuyg5xucLd3Kw1ykx
	71DqDpo85QAUCqBa2PHTan8Sa7pRaFlRpBj9pRTHCO/mZ1duNrT7ecAQ0D+fxk8DRtw==
X-Google-Smtp-Source: AGHT+IG5qAx2wt0vhBqXuZQ2uHIfKlGflvae0gQ77Tji4talijR6ODtyYgPyvjYwkuu7r90mxhNO+Dr4/OqGE/novxo=
X-Received: by 2002:a05:6512:438a:b0:542:2999:2f19 with SMTP id
 2adb3069b0e04-54229992f3cmr17139357e87.38.1735880201172; Thu, 02 Jan 2025
 20:56:41 -0800 (PST)
MIME-Version: 1.0
References: <20241230034446.1195728-1-karl.li@mediatek.com>
 <20241230034446.1195728-4-karl.li@mediatek.com> <CABb+yY2G1C7rvsha9qm7mRSk1e_xBahshzHCs39=DzTCUGrsuQ@mail.gmail.com>
In-Reply-To: <CABb+yY2G1C7rvsha9qm7mRSk1e_xBahshzHCs39=DzTCUGrsuQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jan 2025 12:56:30 +0800
Message-ID: <CAGXv+5E98VZnf_PL2kEF=VxytNVyCEV4iY=aEnEoZz0Z7AJiTg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: "Karl.Li" <karl.li@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Chungying Lu <chungying.lu@mediatek.com>, 
	Chien-Chih Tseng <Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_205643_896822_B826D742 
X-CRM114-Status: GOOD (  16.86  )
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

On Fri, Jan 3, 2025 at 12:30=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Sun, Dec 29, 2024 at 9:46=E2=80=AFPM Karl.Li <karl.li@mediatek.com> wr=
ote:
> ....
> > +
> > +static irqreturn_t mtk_apu_mailbox_irq(int irq, void *data)
> > +{
> > +       struct mbox_chan *chan =3D data;
> > +       struct mtk_apu_mailbox *apu_mbox =3D get_mtk_apu_mailbox(chan->=
mbox);
> > +       struct mbox_chan *link =3D &apu_mbox->mbox.chans[0];
> > +       u8 data_cnt =3D fls(readl(apu_mbox->regs + MTK_APU_MBOX_OUTBOX_=
IRQ));
> > +
> > +       memcpy_fromio(apu_mbox->msgs.data, apu_mbox->regs + MTK_APU_MBO=
X_OUTBOX,
> > +                     sizeof(*apu_mbox->msgs.data) * data_cnt);
> > +
> > +       mbox_chan_received_data(link, apu_mbox->msgs.data);
> > +
> > +       return IRQ_WAKE_THREAD;
> > +}
> > +
> You don't seem to do anything that 'ack' the irq line. So if you merge
> this into mtk_apu_mailbox_irq_thread() and do
>  devm_request_threaded_irq(dev, irq,   NULL,
> mtk_apu_mailbox_irq_thread,  IRQF_ONESHOT,  ...);
> you can avoid adding a new api and keep your client code simple.
> mbox_chan_received_data() is strictly between the client and
> controller driver. If it is not called from an atomic context, feel
> free to do memcpy() from it.

That sounds great. Could we perhaps update the API documentation and
drop the "atomic" requirement, or update it to something you describe
here as "between the client and controller driver".

Disclosure: I've been doing pre-reviews for this series and we were
operating under the assumption that mbox_chan_received_data() and
its callbacks must work under atomic contexts.


Thanks
ChenYu

