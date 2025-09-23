Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E64CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 13:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2WPlGw6ip7PYA/9tuI3OZb0vgkUfUYvz/dn9O4WHM8=; b=TffnaIiAJqt3FWbPQ/VIv3g/K3
	74DAPB0NEdcU147U01E40MqkyrIemwwgQD6oULHbWVHPOTS9iQ4a+0W9PtXuwvfpCD14qBjse0ybf
	erOyMl/4rE8PuF64NaIk69yXHijATuUYCqn3d5e/NXSqrPwWUJQgrgCBFvYyXbNnjJq4cfLG3oOdy
	dUynkmFgYy1kIXsK6FknrqOT5S7lt3KYHg2PxhecIsRnZVJNuccnntFAhZvd0zUaHAQ8tf8cx6DAg
	0TirbttoAwkdjJkrmsEmf7i5OioWDlRhZWSVfdRwa0xP5kKLz61JmdTt33Ai+4cgo5vcvXla5Q7bO
	go9K4GzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12tJ-0000000DTXu-2V1X;
	Tue, 23 Sep 2025 13:17:09 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v12tG-0000000DTWP-2OAe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 13:17:07 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6325115e3f4so549971eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 06:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758633425; x=1759238225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2WPlGw6ip7PYA/9tuI3OZb0vgkUfUYvz/dn9O4WHM8=;
        b=Girlr8FdM3LkiGwFSQhfm9zoSWTYCcooeam08hKLyEGt3a8MXjJS2H+XLm1t9sAZj4
         BIHz5UmHNXsgCCwmOTWUCXCjVpMi3+RrEYMv8v62YyOazZqogApF5mkSB1Va1oaSjYtq
         T8Q/PvRMwniW15g7BbaJmVd+ch1GrWr92reqLkLF5hJhQ3V6fcpiluLsXLcqV7raLEAy
         5EH33wGarhNCl6w96PeH7N39IG5iStpr3cTIV3hdBsrBSSYAjPB3SE7LLM6BfrkV2fLq
         m9Itfhjwk5Itt8GokRC05mOQswyqhDhlgYJ9eKTdeIcTXQaUGnawp0liWMG7eVQhHCaG
         /Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758633425; x=1759238225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2WPlGw6ip7PYA/9tuI3OZb0vgkUfUYvz/dn9O4WHM8=;
        b=QE+PBIcz1GhD0U5X/ricu5QHDhDbpa2HZmbk/dS1aa/Q88cazWRAhsS10enD6P1EzA
         2SLtSPPUP24arBgXHgMHyKjAknZacrD88/lMWttND7ieDafPUb9Yha7zQXzDo6O1TbJF
         lfqgZDPeejf0fHGdGhDktn6ZpqlRtgknf3blyEfI8bG6cuca/GYqLLDScb+ZjrHKhzPn
         EuEQwMR2G9BzShetI6MQgcmZTboAT7MIijfJ6kWSro0Sxa75ASY3bdqgctwszBi01FQn
         Mh0+aVdtGtw/ZkbbZHJE6GKGb/tBV0UYiCqbCQleC7PuQLjS6U6YCGL2ZNE1DadSh322
         CMQA==
X-Forwarded-Encrypted: i=1; AJvYcCXiy19QcsENLO9r/Q203/pVpB3HQt39UAJQPU3j3ItWAasxe6lC7yVBNzbtirYnRmOOvec52041R027OwkrL4Pj@lists.infradead.org
X-Gm-Message-State: AOJu0YzssQxnol0veQf12kKLDURn7nV1+9sb31d3UKJJMLLuIO7tJtOX
	DORlyfnsM+yFgUxu8iGHd8k81U66jSynjjwhdOqUyJylLWdSi+LhW1tcO5rvc8cdXQrvOOKmz53
	Qz7RlqM8PGDFAtc74vTToA2simj1NNMo=
X-Gm-Gg: ASbGnctLt6Nu5MJ2i8J5UQBCKAKHR0RsBBQVpPj7nt8XwGNq8nmd/mT5Z3FygxHtcFy
	+p+AvSGfgsJlMaEf20hMIgvuNFlYdxMVZpuMTnoifhAWxpCDWvIPzOaLzhAJnLGLpskZXwbiuX4
	jKK0Ff+WvNfZWaGmWDVDVStdn4NEo5zKUppOtPBj2Awt9GBqtBI2ZE9MvLVop1XY2pWksYc/aTj
	ktd+LcGKORBvbTUSEg=
X-Google-Smtp-Source: AGHT+IG8OdD4UhyFmVnw+1B4Hou6a7FTFOoQAxaWAXHib0ERshZVgibiY61D/fwCONr+Awn82RcI18YLm8tvlRhZT7k=
X-Received: by 2002:a05:6808:3194:b0:43d:2dc4:9d16 with SMTP id
 5614622812f47-43f2d355ee6mr1166642b6e.9.1758633425437; Tue, 23 Sep 2025
 06:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
 <CABb+yY3N2=01yKJon25_6_vmihj09H=T9pLwzdGPrqY5h=hRFQ@mail.gmail.com>
 <5789241.GXAFRqVoOG@workhorse> <CABb+yY2Ay+KqviJvOQC8X8kfzJN6-fQT04A+TCJAkLnWx+XwZg@mail.gmail.com>
 <a9dd348fd7df95ebd5ad9cc58d57b588a18ccc9d.camel@mediatek.com>
In-Reply-To: <a9dd348fd7df95ebd5ad9cc58d57b588a18ccc9d.camel@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 23 Sep 2025 08:16:53 -0500
X-Gm-Features: AS18NWCOZv9Pv2u_322Xt4q4LUafUyRkH0j9o_POX7ZdoLtYf5wU82ru76Msenc
Message-ID: <CABb+yY2bYh70A=n9+XBBqthjngZP2D8ebFje-F9TN7K0c+fmMA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: =?UTF-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
Cc: "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wenst@chromium.org" <wenst@chromium.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"robh@kernel.org" <robh@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_061706_612536_910487D0 
X-CRM114-Status: GOOD (  24.88  )
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

On Mon, Sep 22, 2025 at 2:17=E2=80=AFAM Jjian Zhou (=E5=91=A8=E5=BB=BA) <Jj=
ian.Zhou@mediatek.com> wrote:
>

> > > > > >
> > > > > > > +       void __iomem *base;
> > > > > > > +       struct device *dev;
> > > > > > > +       struct mbox_controller mbox;
> > > > > > > +       const struct mtk_vcp_mbox_cfg *cfg;
> > > > > > > +       struct mtk_ipi_info ipi_recv;
> > > > > >
> > > > > > Maybe also have "struct mbox_chan chan[1]; " so that you
> > > > > > don't have to
> > > > > > allocate one during the probe.
> > > > > > Also if you have  "struct mbox_controller mbox;" as the first
> > > > > > member,
> > > > > > you could simply typecast that to get this structure.
> > > > > > Something like "struct mpfs_mbox" in mailbox-mpfs.c
> > > > >
> > > > > I read somewhere that this way of subclassing is not
> > > > > recommended.
> > > > > Instead the base class should explicitly not be the first
> > > > > member.
> > > > > And then container_of() should be used.
> > > > >
> > > > > I don't remember where I read this though. But I think the
> > > > > explicit
> > > > > container_of() is easier for understanding the intent.
> > > > >
> > > >
> > > > And how does container_of() work ? :)
> > > > typcasting the first member to its parent is the simplest form of
> > > > container_of.
> > > >
> > > > -j
> > > >
> > > >
> > >
> > > Which is why it's completely equivalent and since code is supposed
> > > to communicate meaning to humans, container_of should be used.
> > >
> >
> > Nobody is suggesting typecasting cfg, dev or anything else.
> > Typecasting between mailbox controllers is fine and arguably easier
> > on
> > the eyes than using a container_of.
> >
> > -j
>
> OK. How about:
> struct mtk_vcp_mbox *priv =3D (struct mtk_vcp_mbox *)chan->con_priv;
>
You don't need to typecast a void *. So simply do
    struct mtk_vcp_mbox *priv =3D chan->con_priv;

