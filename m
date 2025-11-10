Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0113CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdbKsB+tMJvagrMvYHn0y49jacarMu1zTyH+h0jj2wI=; b=3fjxZJKIt9NzwqcgkMono5yHNL
	54KZS+1rZDvGoSM2xRONAfBzKzMI1XJB+64Js24cy4p5gDYqZKoUT6MCutbZEiIswVDsKV2/U45EV
	a5kgoHrGIlJfFjHvQ/kIRy0oqOfsUJAwi10tJfVvgX9nQnndQQfAmTBC7ckgDqVgk8SMiqFty+9S5
	8LnUNEY5GBXw/mnArxaqfcU21NrW8hxZgsUMMwWiD/Pk5XFW7rfHPvGcjxJUK4MlgRb0ckvgqFCFC
	UBl0p9LVb+rJo/banSCD/2jCl59oFCl7vPfXt6kn0Yk73+ej6jqcMCYWkhTA3yebpA7muZJ/T6d1B
	JKXRhE0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR9C-00000005Q4H-1aeE;
	Mon, 10 Nov 2025 12:37:26 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIR99-00000005Q3e-3m4I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:37:25 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so370810666b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1762778241; x=1763383041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdbKsB+tMJvagrMvYHn0y49jacarMu1zTyH+h0jj2wI=;
        b=VWZO6h7MZ2C2C4wwuDQEQpj1MvPC1jTuqSurakBDgEYTd+Zi/kjC1Y/AzU4qk8nMJj
         oyTOIFDjVa8nvKkVm+lSiWYRXsNGC+AjeZ1PvXyMDw3h2yryz/ALL6nFLaXsluVRgYBl
         3CqsMJgvZ9ulZpxXMVgw94oXREsYrNwVkNHs26FBJ5E6cd2plOFEbiaVb8FwEKfAotU5
         3CIdddiqnjvUDRrFjNjsizkCRtjhyrNNj0ngEthrjuvzAQq72HRLu6i1EfnxlrON0qJB
         uwk7Yzu48Wkl3KyrvwPqkqGCUtAcVrcNVfWhCplNHY2ErNd+wiH1qF+cB8YTfDSi7K6d
         jAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778241; x=1763383041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cdbKsB+tMJvagrMvYHn0y49jacarMu1zTyH+h0jj2wI=;
        b=kFU/YMRThRbP+EAc0mlv/VkWoozsnkrYajqdVJsJVfQvbgJPJLj9QD01arLInck3jT
         kKR1qEnqZTCvddZuXGQdX/IYCGvqe5T7tyjaWHAfRGqHIvakqI1eEOYQ29Yh9D5WshfC
         kMAePGt1gTU72D5gPaq9xuG2benpYfylWRuZRFpeLAkSAC60+E1WeHKLLJ+/fKgDoQoS
         jD9fjdqgKR/cYlCq+AEfSbUvei5m0VqSyHC7ms0rq/fZUd+WTS53pB3cKdZKce/rVmlw
         r8wW1fZ3kmf48kuoosDmvdcfOJcl+Dk1lkGjYhToknL0ltEYkiePEkeEZpT70cWkNFpA
         kyCw==
X-Forwarded-Encrypted: i=1; AJvYcCW8chOXYJKhfJAQnXTRTMvSx/fdMHMatUBoUT/3mcT1+pvz/pv8OkAPeWVKP2a/OM0GqmCm0VUOaMiW8EUNvkKK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/XLfBOg58ZXlxhe8uo7aEvxaSvM7a8wxjvxd6Cd+oMzbY3mjK
	/qiB/44hwQuhHhqzQZ0SU4YagpJ3EYml1nXJLRGMn54Bm77MtOwF26b1c7fd0t2cyS5Ct0ISRBU
	eZY5aglO66CLcZ2UevjdZ3c4iy5ZQbxV1of+HL/i+WA==
X-Gm-Gg: ASbGnct9M+EKtiYNXPsRU/GqeFeXczzPDYl+/poiI9nMWn64rqmLhbQmvGKgGZOZ4ZW
	O7R2A1oLI0PCIiN2+IvTT+uIxDY+ma/BwuX1x9n7kdv83+9GBR4CMn2WFPeqaro+KGlhb59xoFM
	65hsS5ITvwRYcBzj52OpDA6uJWjJP/YEtiXbbtVsdsKQJJ780GYCgc8v00vpQuGWZErofiu9KPP
	NCPgIrkUhNlCT0bxU0fyal44bs+n77t1wt6nCAZmtYgwKROlQG0wWt//Q5hpzw47W9pVzM=
X-Google-Smtp-Source: AGHT+IE8R0GEPpZSZEercv3oXNopblQ2LRLU4GoX8SS8pCTS+917rMgdDv/cyw05AUmS6nbzIs8krxRmiMby2Y3ip8U=
X-Received: by 2002:a17:906:eecc:b0:b72:dc33:3d36 with SMTP id
 a640c23a62f3a-b72e056d8e5mr574165066b.49.1762778241054; Mon, 10 Nov 2025
 04:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20251107141936.1085679-1-robert.marko@sartura.hr> <20251110065701.rch4wjflap3vicjq@DEN-DL-M70577>
In-Reply-To: <20251110065701.rch4wjflap3vicjq@DEN-DL-M70577>
From: Robert Marko <robert.marko@sartura.hr>
Date: Mon, 10 Nov 2025 13:37:08 +0100
X-Gm-Features: AWmQ_bnmKGMttOuykPTnFw9koAKzfig9Ix0aGoP1qnMvwkAAXQmuYEVNFMiaUPs
Message-ID: <CA+HBbNESaT7SfgJPE-MTQphDQc+vcZUBn5mV+yFq_iqk+PcakA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: sparx5/lan969x: populate netdev of_node
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com, 
	UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_043723_969781_47B7C8CA 
X-CRM114-Status: GOOD (  18.98  )
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

On Mon, Nov 10, 2025 at 7:57=E2=80=AFAM Daniel Machon
<daniel.machon@microchip.com> wrote:
>
> Hi Robert,
>
> > Populate of_node for the port netdevs, to make the individual ports
> > of_nodes available in sysfs.
>
> Sounds reasonable :-)
>
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > ---
> >  drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c b/dr=
ivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > index 1d34af78166a..284596f1da04 100644
> > --- a/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
> > @@ -300,7 +300,11 @@ int sparx5_register_netdevs(struct sparx5 *sparx5)
> >
> >         for (portno =3D 0; portno < sparx5->data->consts->n_ports; port=
no++)
> >                 if (sparx5->ports[portno]) {
> > -                       err =3D register_netdev(sparx5->ports[portno]->=
ndev);
> > +                       struct net_device *port_ndev =3D sparx5->ports[=
portno]->ndev;
>
> This line exceeds 80 chars and can easily be wrapped.
>
> > +
> > +                       port_ndev->dev.of_node =3D sparx5->ports[portno=
]->of_node;
> > +
> > +                       err =3D register_netdev(port_ndev);
> >                         if (err) {
> >                                 dev_err(sparx5->dev,
> >                                         "port: %02u: netdev registratio=
n failed\n",
> > --
> > 2.51.1
> >
>
> It seems wrong to me to stuff this into sparx5_register_netdevs() - there=
 are
> two better candidates, either: sparx5_create_netdev (where other ndev var=
iables
> are assigned) or sparx5_create_port().


Yeah, I indeed overcomplicated this compared to setting it directly in
sparx5_create_port().
I will update this in v2.

Regards,
Robert
>
>
> /Daniel



--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura d.d.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

