Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B60C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 07:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DqVvsVthq2h4/t7UrH240Bzi+oS8ZW8sparKJnfCVI=; b=1x8g+x6GPgL027gYBc4tm0bL+K
	C50NvG8ZQ7fLVY7m3ht/R4LlWsnhsH6V+IfLPObh5D7BQORXNHepWussPx3OF/WOQsJDPpZseIEf7
	6+ozTwS61Ve4yRk+41hjXDax2CKdPIamUWaVwKWLUUExDpCfcVflMu2NYy3xHQYbqH4wthhC/70vW
	QvxRw0tAuR5QJWVRk3D+20awMy2VKOBHYKQP83hvnqBZomVkZYW89lxfqil9h9oyOwXqO2OGhNQVL
	WTfRpDK4P263dMcx5CkzDQH/sYMunxXrJdinkGX89czwcZNUdJTv8J0D1jqLVvefmAXdUsOH+60MM
	kAUBuVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0iB-0000000H51K-3rq1;
	Thu, 20 Feb 2025 07:11:08 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl0cI-0000000H3VX-0Hji
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 07:05:03 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-e5dd697475dso533976276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 23:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1740035101; x=1740639901; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DqVvsVthq2h4/t7UrH240Bzi+oS8ZW8sparKJnfCVI=;
        b=HrtzGTQphboxWSF1NC6o8N9jYuszgr3aFLVXoRMioN7w4hs5d+ZsrQaCDcvZbehZSn
         X9K+VA4PZmiWkyfs+XBhhBaD6/kOFSgdcFe1y6CNo8a6ROBWC3IUAMdbgS0Q051wwFmA
         /Go3+l2DAk7NVICHuRYp5PhnXL1fDbIoK9o+HcFkiNnRqbUSo505cXT0vlNdmQmjn7SH
         6//+Jm8SGplWEIo7uaILtMI12r0/MeKwGNKBiueVJv3jqMu7kvoaeTeDzWUwcoVuVP9Z
         3F/ReCTSFKBPCtnp8uMD8ivWnv6iYrRRmx2DuBgEedKSwbPXqVrLo+40Nc+zaMxGnHky
         xLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740035101; x=1740639901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5DqVvsVthq2h4/t7UrH240Bzi+oS8ZW8sparKJnfCVI=;
        b=fTXvjHCvjnbXWCvOUGPtaMy1xCMh0ButEM/YNV/1uWql4r7AWbRiWmg1TeLayJ2v+H
         u9sXGeyTmCD+ScnoN3l/TBkeMchkH5mBO1liK2UlkWV6iDGC2LYI6Yif+MMkyXhg9bHX
         6CxrbwwA2nP+L4iLx0A57N7IMirpEFcur6YlHuxW6SGn8Tt8wJ/Gjk6IjWQIzSJMG/SQ
         bCFT2esLHna6j4IQLAhsJvHfrF4ml8FuxaldFU8V/jXi2qOEASOW5Qx3MSvwMGCJCoxm
         V6213sB2D8ixW1YdG669OOwUF6nmb3gMhiU83xBP55HZetq/wfV26ROho9g60VUeEVWh
         Snyg==
X-Forwarded-Encrypted: i=1; AJvYcCU/DHlThRNW3VXzQ24HlpGA4g2hO7u8/wuzOgL7t+/iPyABkYhFAOBPuRIVEnm9AJstCDvC8uCtos2S8zzEsoaE@lists.infradead.org
X-Gm-Message-State: AOJu0YwmkAw4RgEZw1OENHHMr5wpHpTuWNpY/oCR0BeaQkqww5xw6Jwm
	LMQGU3G4prh15vjE9Mmdi2FT8IagXFVExuLCW+g9DGTq3yZU9flruJSDtHHLmcKgXL8fsr7PgKp
	H61RRt1g5XQoGUCg/ZZFufc5zEmJUDDUEFFwAFQ==
X-Gm-Gg: ASbGncsqSQZCsYSf0k3y9jZ6uH9oPupHXOw+WPM2JaJMYqtpzRYU+q0geVKbdppeo3N
	CC9VNTJMud/PXNq2/t4TFxV+otcgbTzE70UakFhWWCpuvVCjaJ9vi5yM16Cl87W+oDDggXqdur6
	I=
X-Google-Smtp-Source: AGHT+IEZKNMBrP2lM6Bm1hvdsTewtlhF0pZu3ss6WiHXL5gZNQY6DZIWU72QwbDGVzIjUzPcFFZ/gZnnd/15t3X4IzU=
X-Received: by 2002:a05:6902:3486:b0:e58:227:e963 with SMTP id
 3f1490d57ef6-e5dc9070168mr14747916276.21.1740035100978; Wed, 19 Feb 2025
 23:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20250217055843.19799-1-nick.hu@sifive.com> <889918c4-51ae-4216-9374-510e4cbdc3f1@intel.com>
 <CAKddAkBZWZqY+-TERah+Q+WUfkqzcpFMA=ySSuTxxBjfP7tKZg@mail.gmail.com> <Z7bSLq1vkYJUzvGM@mev-dev.igk.intel.com>
In-Reply-To: <Z7bSLq1vkYJUzvGM@mev-dev.igk.intel.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 20 Feb 2025 15:04:50 +0800
X-Gm-Features: AWEUYZn2ntlAc-JtJt8X-ZlCzhTS64HhwD2QJ_NWHZfmvIV2rb2qYohzCaDzrzQ
Message-ID: <CAKddAkBGYqcWQdtFWe1+cnUjxVEiYrd4yw9sxy3GAO+RGkoFBw@mail.gmail.com>
Subject: Re: [PATCH] net: axienet: Set mac_managed_pm
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	Russell King <linux@armlinux.org.uk>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	Praneeth Bajjuri <praneeth@ti.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_230502_150066_8ECC218D 
X-CRM114-Status: GOOD (  24.99  )
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

Hi Michal

Thanks for the information! I'll pay attention next time.

On Thu, Feb 20, 2025 at 3:00=E2=80=AFPM Michal Swiatkowski
<michal.swiatkowski@linux.intel.com> wrote:
>
> On Thu, Feb 20, 2025 at 10:47:40AM +0800, Nick Hu wrote:
> > Hi Jacob
> >
> > On Thu, Feb 20, 2025 at 7:29=E2=80=AFAM Jacob Keller <jacob.e.keller@in=
tel.com> wrote:
> > >
> > >
> > >
> > > On 2/16/2025 9:58 PM, Nick Hu wrote:
> > > Nit: subject should include the "net" prefix since this is clearly a =
bug
> > > fix.
> > >
> > I've added the 'net' prefix to the subject 'net: axienet: Set
> > mac_managed_pm'. Is there something I'm missing?
> >
>
> It should be [PATCH net] net: axienet: Set mac_managed_pm
> Like here for example [1]. You can look at netdev FAQ [2]. It is
> described there how to specify the subject.
>
> Probably you don't need to resend it only because of that.
>
> [1] https://lore.kernel.org/netdev/CAL+tcoC3TuZPTwnHTDvXC+JPoJbgW2UywZ2=
=3Dxv=3DE=3Dutokb3pCQ@mail.gmail.com/T/#m2b5603fbf355216ab035aa0f69c10c5f4b=
a98772
> [2] https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt
>
> Thanks,
> Michal
>
> > > > The external PHY will undergo a soft reset twice during the resume =
process
> > > > when it wake up from suspend. The first reset occurs when the axien=
et
> > > > driver calls phylink_of_phy_connect(), and the second occurs when
> > > > mdio_bus_phy_resume() invokes phy_init_hw(). The second soft reset =
of the
> > > > external PHY does not reinitialize the internal PHY, which causes i=
ssues
> > > > with the internal PHY, resulting in the PHY link being down. To pre=
vent
> > > > this, setting the mac_managed_pm flag skips the mdio_bus_phy_resume=
()
> > > > function.
> > > >
> > > > Fixes: a129b41fe0a8 ("Revert "net: phy: dp83867: perform soft reset=
 and retain established link"")
> > > > Signed-off-by: Nick Hu <nick.hu@sifive.com>
> > > > ---
> > >
> > > Otherwise, the fix seems correct to me.
> > >
> > > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > >
> > > >  drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/dr=
ivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > > > index 2ffaad0b0477..2deeb982bf6b 100644
> > > > --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > > > +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> > > > @@ -3078,6 +3078,7 @@ static int axienet_probe(struct platform_devi=
ce *pdev)
> > > >
> > > >       lp->phylink_config.dev =3D &ndev->dev;
> > > >       lp->phylink_config.type =3D PHYLINK_NETDEV;
> > > > +     lp->phylink_config.mac_managed_pm =3D true;
> > > >       lp->phylink_config.mac_capabilities =3D MAC_SYM_PAUSE | MAC_A=
SYM_PAUSE |
> > > >               MAC_10FD | MAC_100FD | MAC_1000FD;
> > > >
> > >
> >
> > Regards,
> > Nick

Regards,
Nick

