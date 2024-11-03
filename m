Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7AAD1118C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sY4A+T6RqHEnnohZAogeCURTdPYG3z7nSaBdYQpTNlM=; b=oG7dgsSDx0fpG9S6MzAfEvvyzI
	9/9KlVotKac/ypsu5soEm73InVCUFxJnGzDrTFu3OWmY4lhPyJbUyfCWPYyp/WOatf4Xr2peHm01K
	PLtUamL4nYeYTISu8xfbRHAukQHzzJuu3OROEL2n+eHrvE9vDn2cP0I37gyzbT6E8RKmRV1z0AlwN
	8U+G8Np3Amqz7olly1nwbht4tEzxdc6qY+eF4nu6iqmcp8zCsUOpQFJ4dxnWrLeeoi4z4/lb+h3DR
	WXywD34+UEtSEFAUsOt1b0A08QvdFKwPjYjbcvBwBcn7v3llZ2/hDQCGAhGiP2iYBo9Tmq/qIoPxQ
	yTt8yMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7fsF-0000000BtUQ-1clm;
	Sun, 03 Nov 2024 19:02:55 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7fqW-0000000BtGd-171O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 19:01:11 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so31067481fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730660465; x=1731265265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY4A+T6RqHEnnohZAogeCURTdPYG3z7nSaBdYQpTNlM=;
        b=fCRvSeZPcXH/nSKkzPLc3o/g9aEkZFV5f29km46JaN2NtPjHYy3IuSFdR4a36gvJ7s
         eH0Eswa/U1yefjdqrsXWnEvJphE+MRXCM+yjGWM5JbZ/UNao+juGZOzkTwjfQkJ23gd3
         fCkGq5z/CLjbF4xD2BDxbre5FDBeDz04V/Zi188cptz8s7bv+KgGgBWByE7YPUPxue87
         x+ktjMWQyNvY+cezv39qe5WtgwAYsmeRGCfyuXVtxXMhcOTarC79/JRLxJs6KDp92RCg
         fjgPZZ4JLg/6PUl8lUSkiPl2+oRdVt28O/KAaxzrCu69X8aYpaLoSvDoAnYvC7ufVQYL
         3tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730660465; x=1731265265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY4A+T6RqHEnnohZAogeCURTdPYG3z7nSaBdYQpTNlM=;
        b=TkcJu1YqORMwcGDByt4eelxPYlZiLfDjoxaAbhvRlVJ5ABbS55wVokKFe+kOaRlMjb
         FGaKTEhz4hSRrd1bIEbMdq1NrhXzqTH+M7glMrvOv2Z0EAgq36FnVaB9Zdvk0Eis+GgR
         ulgBqyz4xvt4z/TNQXwTjUZobJoSefa7AoDwvFTEkS6eXyA4fz6pOj4bDPDewTV8OQdw
         pfBby4LrQ0jsA21l1xFlYCu4Dg8RfxKop5LWESEAkhNanavGMMPjavtACXSOBWHHgrWK
         KJYcd5xzUMIaRkHdPafOfduJkH8A8vAoSkYSuBGRlhLs8if++aMQBrJryw8LxvFVkIc8
         /o1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMOJz0VZZieH4kVfAyDoki9wxV1ZYS9reEiFMew7o9+d+Ih4U0liap1ZVroAJffblLVDRx6+B1VJLU861n58kq@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp0lnLCOJzpqfVQPIRlCFf1wBFHse7e8/7L1ILtMKsUl1o8hhK
	uabx8QLZnj+/rigO5hPrGbhP/HmwWPt5yQL/vI50lJlLOE98MmSPeYLHYMjTAFq1UHT32CCR8G/
	9aTrKHoRSTktwUFQAaqDOTm3JLA==
X-Google-Smtp-Source: AGHT+IE51hefYOe5xiZP51bcZsQgIVA1y18RQ54UhBWiTXSEaDmaXWZuzRMyPOLYfnY5HJkrGKV6WAz/1UPB2tYCDoM=
X-Received: by 2002:a2e:bc15:0:b0:2fb:6181:8ca1 with SMTP id
 38308e7fff4ca-2fcbdf5f91emr154565771fa.6.1730660465205; Sun, 03 Nov 2024
 11:01:05 -0800 (PST)
MIME-Version: 1.0
References: <CAKKbWA7e0TmU4z4O8tHfwE=dvqPFaZbSPjxR-==fQSsNq6ELCQ@mail.gmail.com>
In-Reply-To: <CAKKbWA7e0TmU4z4O8tHfwE=dvqPFaZbSPjxR-==fQSsNq6ELCQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Sun, 3 Nov 2024 21:00:54 +0200
Message-ID: <CAKKbWA6zRee9Rzee-ebLnEAvwLqnmsPswGaUo_ineyzw-b=EgQ@mail.gmail.com>
Subject: Re: [RFC PATCH] net: stmmac: Fix the problem about interrupt storm
To: cathycai0714@gmail.com, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: cathy.cai@unisoc.com, cixi.geng1@unisoc.com, 
	David Miller <davem@davemloft.net>, edumazet@google.com, kuba@kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
	mcoquelin.stm32@gmail.com, Network Development <netdev@vger.kernel.org>, pabeni@redhat.com, 
	romain.gantois@bootlin.com, wade.shu@unisoc.com, xuewen.yan94@gmail.com, 
	zhiguo.niu@unisoc.com, Alexandre Torgue <alexandre.torgue@st.com>, 
	Murali <murali.somarouthu@dell.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	"Silva, L Antonio" <Luis.A.Silva@dell.com>, Arias Pablo <Pablo_Arias@dell.com>, 
	Somarouthu Murali <Murali_Somarouthu@dell.com>, uri.trichter@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_110108_346945_4D3E5D0A 
X-CRM114-Status: GOOD (  30.31  )
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

Hi all,

We recently encountered the same interrupt storm and the root cause
was the same as here.
The suggested patch solved 99% of the issues, but indeed as written
below on rare cases the issue happens between the dev_open() and
clear_bit(STMMAC_DOWN) calls.
I also agree that stmmac_interrupt() unconditionally ignores
interrupts when the driver is in STMMAC_DOWN state is dangerous.

The issue happened for us in linux 5.10 but I see that this behaviour
wasn't changed also in newer versions.
maybe we should disable the device interrupts before dev_close(), and
enable it after dev_open().

>
> Hi Romain,
>
> On Sun, Mar 31, 2024 at 4:35=E2=80=AFPM Romain Gantois
> <romain.gantois@bootlin.com> wrote:
> >
> > Hello Cathy,
> >
> > On Wed, 27 Mar 2024, Cathy Cai wrote:
> >
> > > Tx queue time out then reset adapter. When reset the adapter, stmmac =
driver
> > > sets the state to STMMAC_DOWN and calls dev_close() function. If an i=
nterrupt
> > > is triggered at this instant after setting state to STMMAC_DOWN, befo=
re the
> > > dev_close() call.
> > >
> > ...
> > > -     set_bit(STMMAC_DOWN, &priv->state);
> > >       dev_close(priv->dev);
> > > +     set_bit(STMMAC_DOWN, &priv->state);
> > >       dev_open(priv->dev, NULL);
> > >       clear_bit(STMMAC_DOWN, &priv->state);
> > >       clear_bit(STMMAC_RESETING, &priv->state);
> >
> > If this IRQ issue can happen whenever STMMAC_DOWN is set while the net =
device is
> > open, then it could also happen between the dev_open() and
> > clear_bit(STMMAC_DOWN) calls right? So you'd have to clear STMMAC_DOWN =
before
> > calling dev_open() but then I don't see the usefulness of setting STMMA=
C_DOWN
> > and clearing it immediately. Maybe closing and opening the net device s=
hould be
> > enough?
Indeed we encounter an issue between the dev_open() and clear_bit(STMMAC_DO=
WN)..
> >
>  Yes. It could also happen between the dev_open() and
> clear_bit(STMMAC_DOWN) calls.
> Although we did not reproduce this scenario, it should have happened
> if we had increased
> the number of test samples. In addition, I found that other people had
> similar problems before.
> The link is:
> https://lore.kernel.org/all/20210208140820.10410-11-Sergey.Semin@baikalel=
ectronics.ru/
>
> >
> > Moreover, it seems strange to me that stmmac_interrupt() unconditionnal=
ly
> > ignores interrupts when the driver is in STMMAC_DOWN state. This seems =
like
> > dangerous behaviour, since it could cause IRQ storm issues whenever som=
ething
> > in the driver sets this state. I'm not too familiar with the interrupt =
handling
> > in this driver, but maybe stmmac_interrupt() could clear interrupts
> > unconditionnally in the STMMAC_DOWN state?
> >
> Clear interrupts unconditionally in the STMMAC_DOWN state directly
> certainly won't cause this problem.
> This may be too rough, maybe this design has other considerations.
>
But then after the dev_open() you might miss interrupt, no?
> >
> > Best Regards,
> >
> > --
> > Romain Gantois, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
>  Best Regards,
> Cathy



--=20
Regards,
Avi

