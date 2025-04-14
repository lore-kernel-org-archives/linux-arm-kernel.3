Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A769DC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=; b=YfLzD/WWBS30ij1aO/SBOUYpMf
	QZp40HO7lz/nplT96fpdqrS9VPPO52xUbezHDPb1HzamkiZ7GNsFQHrbgU0v26zbYWaVPf2jGsLRv
	gsuAmcGyKuuTM628kuAs3BACUx27cD30qC0+oHahAm+6xvEEjkuRF0beAhS0u8jq0xit1OqFdirUk
	S7U6CxBE60nD7nkllqre0qxqIGK06/dsGW/whP5aIktr2VKWQ6HI2/p6IU7DzBunPfQk7LWDd1u/h
	Gd2JzG3u0y6vDVcHTRo4v+GPDas1HCmvoMSnQ/ApAvadTxHw9D1LT4iw3R2gY1a0KFt3N4mQrcgcY
	ml9tfivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4NAh-00000002rvY-0xcC;
	Mon, 14 Apr 2025 17:00:35 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4N81-00000002rRF-2O5w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 16:57:50 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-527b70bd90dso2088409e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744649868; x=1745254668; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=;
        b=NKeblb9kHvp7Nk8Ww6uOBlQR81dG9kjmyhE1bGghXpsQ+ScgBxUikuMxmsNtFPYIYP
         nAX3cBgmN7yruHL+Ogh+z6QRpckXZAZqAQoSHywMYsREWXjma7ivLIt6StzxveYgrO4o
         0JRyksM6SVxah0Fd4gsy3p4DAvP0wE/IDSfVFY51Aq1C/yfAfTNbRKgSdrNTAPf5Zpnn
         OAc733zJTewpogc6q24QCMXb2ju0dk0eqA+b34yk3aMUcqvTig9TRBhnsylWybKUNRBz
         qFGM4OGrxyNYYa+HftMXBnngAn8W71t5iUqtjfCbk47kl8AkxeElyRhYpcyTr3DT7jJP
         o5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649868; x=1745254668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drgJ4kvJBwLENN+wUSBbYOnp85UmFVhKGobYEXfoSwA=;
        b=pZSF7xcTu1c2iM/QcPEMACUFaaa54pIZy4an7O1pfAO6LhFgbJHRW0SR9OL/ybY9pu
         ruEOP1KdqAz6YU8wllEsE5EVs/9q91be5b3jcm5hFNzM9xaUD5deKUC3lXXYSvNCiUx5
         J92fVZquoSFf7Rn6qVPIhFRLI4IL3xu1ofRf0uGILoCuyHBt6WMJrwMa3Xva0JMOFUZG
         GDeGObu7IfQb7Kv0q3kilBOEM3g8Me5llhXAN9UT+0YDZsvLm727GDknnRyqnJ26bJuA
         a0Raqn58SMTvSlAM8FACuxqwy4jjccIdd3w8L28qTcBRlV/jLK7UJbkDw6PLALCLNWHr
         jeAw==
X-Forwarded-Encrypted: i=1; AJvYcCXkBLm/rl47Cq/ovnFAPeGihknaPUylcFPfV+RdpUbl1+NL32vxRadxscza1NCGWJF57jKX+0KHB6WcJa1mUcH9@lists.infradead.org
X-Gm-Message-State: AOJu0YyK0yv4oBs1Aw6Zz6/8VgiGEu1BjoPchTh/YOPUd3EeV2/JadY9
	CqEZMqu9o9xXb8wvAxaqNippo0cZeMR/BPIqLa1zrsPfsJsJk828SUiDh3aqa/KONy5v/n+n2pU
	KyQe+2E+C4W5lBRBtG1xgfpkM7Uc=
X-Gm-Gg: ASbGncvvABpObkjREjp0L14cy99nUHMyaQI9fZl+EjvON6l2ykuhSjhe6pYZ5ys9aoF
	yBEwhA+pQxy+TCb+pyJkmLxRkIgC5/h/ANA5EJCGnmjxT5JIdfEfm/47ZvzuDagEWnC7C4VA70K
	wRz5knWDLdtgL3IdNMmfb9CiWnfS2MJ2LGi580BV+7jhW1Run4qB+J6A==
X-Google-Smtp-Source: AGHT+IEWyQ+qQ66o7N7+8XGJO5Ll56Mi7mVYoHXkbahGQ2VotD+EVhbg3G8216oUR9181f8bIK1PpfJpHPMEC84oVFU=
X-Received: by 2002:a05:6122:181d:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-527c3615240mr8335250e0c.11.1744649868304; Mon, 14 Apr 2025
 09:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk> <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
 <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
In-Reply-To: <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 17:57:22 +0100
X-Gm-Features: ATxdqUENKCwc-Lcqt2ec1N-RxZ-ERgWqw8teGlVULD-_8vGOd7AV27blrs1o4yg
Message-ID: <CA+V-a8t6AWzBBxmGG5J8-N0HCMpxYhUVO9m4FT0STGL9KPShVw@mail.gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_095749_605082_F5B18385 
X-CRM114-Status: GOOD (  17.04  )
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

Hi Russell,

On Mon, Apr 14, 2025 at 3:31=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Mon, Apr 07, 2025 at 07:07:49PM +0100, Lad, Prabhakar wrote:
> > On Mon, Apr 7, 2025 at 6:58=E2=80=AFPM Russell King (Oracle)
> > <linux@armlinux.org.uk> wrote:
> > >
> > > On Mon, Apr 07, 2025 at 01:03:17PM +0100, Prabhakar wrote:
> > > > +static struct clk *renesas_gbeth_find_clk(struct plat_stmmacenet_d=
ata *plat_dat,
> > > > +                                       const char *name)
> > > > +{
> > > > +     for (unsigned int i =3D 0; i < plat_dat->num_clks; i++)
> > > > +             if (!strcmp(plat_dat->clks[i].id, name))
> > > > +                     return plat_dat->clks[i].clk;
> > > > +
> > > > +     return NULL;
> > > > +}
> > >
> > > In addition to Jakub's request, I'll ask that you hold off for a week
> > > because I have the following that I'd like to submit:
> > >
> > Ack, please add me in Cc while you post this patch.
>
> FYI, the patch was merged last Thursday, so please update to replace
> the above with stmmac_pltfr_find_clk() which will do this for you.
>
Thanks, I'll rebase my changes on top of it and send out v6.

Cheers,
Prabhakar

