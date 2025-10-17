Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5607FCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55RDAqJOlsF7cspILuwSRpcdchDKHFWIMFN0rshDS00=; b=G98fCchFdV44kqlWGTZAclu0+u
	PXzMVjmJD9aG+RM4p1KPZKsiIGkzGlwxnCC/Z0d8br6mw0etehH1Y4YQPDRiZnZN5KEE7ax3U3f7P
	2cvQzGvithth60U3lNF4TnuOVinGnO8fOT7PzX6Rz2OAZ7Rug7FX6cjgjt82hjZb6Z4yHNllcS7jK
	y0uyXQyJ4Xa7OxBu6W+cedCm4p+6wpDunjFelJoEZvpnnKX3lCe9K5vKjeb68qAc7URJYH73Cu+/Z
	Ye85erisfKO93s+jCD37F+VA2M8pcYFyko5aMMs/iWg5iZNNUfKabJ+Pjp/q9CSWszIFQ/NB7MntW
	kTu24hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nr1-00000008XOV-2Goc;
	Fri, 17 Oct 2025 17:02:59 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nqy-00000008XNt-420p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:02:58 +0000
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so1850457f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 10:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760720574; x=1761325374; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55RDAqJOlsF7cspILuwSRpcdchDKHFWIMFN0rshDS00=;
        b=QEQUed+XEYKxFtu3kK0YX4rIu8/3Sg4qNTHOF+V3wTPg4GiKmhAwjlKEs8pI3FjLRD
         qTCRv7IdX6YOSfkioXyAODa7ibCuJwJpS2A8bB9dNfcsUufKIC0BbycMLJ9ghun8luXj
         wkvbZNDReJNT7zO8Jw9/7GnSyDx3E/Jb0XGZCkO54MkG32AJtNvxpLaErErcQrjaBT64
         lTj275PI9uOkO9DW2DWpx3hK2jgc1oVzUQJZ56xAlMeOCecuZ4GeR4aYpcELNBLJSUWA
         JigIhQVGA0FGXu38oBXYZPxh2KAGM0KTCxtUHLeNzMcmt7RcZqGZ9+P+h+mOurIlPqhr
         FK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720574; x=1761325374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55RDAqJOlsF7cspILuwSRpcdchDKHFWIMFN0rshDS00=;
        b=eP2ajO6OI/2da3tDnnFANDfdHf2Mw8YAzHKoNVqzHj4ubpUCpCG/X41RF8IjBM6VQ6
         7BjB67j0xMJLbj1V2shWlrUgxSg5YCNDY+hr8rrichT1lV5yDGt4By93nrcdb+C4rH8+
         dZp9inmWiEbzMEl42QqbUtb0ndiCNIhrPqdby7s6JEbaW96cKlyq261Nc2YKZ03E48ib
         sC72FoTu8tmBEgMeFOzh983FmQeBQixvYRV3S7R58L70/dpum9n7jCKl+nwAygbuG/gT
         XMzqv48JF9aqViidYV5g3B9EHqgbaHK+LK8y5AYHyzv3dCTd3Jwvwc0PtksgwBx5tJRS
         aurw==
X-Forwarded-Encrypted: i=1; AJvYcCXKEimXy2osbPO0xaU4LZ0O7frhY3vXXkcP07O4630FQUVXv2Cnz139/cXfO6d5t/z8XJPOKJCo3Np1oUu/oorJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3fGYiLbjjttSpcOky8aUDjys7jTgOhF8hB8iyOG2TtOuT2flx
	qpU9dqBXnVilw+9/osn/FCkh9/+HRdPFfRBx8UYM2PKgsi7pv5C/E8rsYytbShJdqKEIISyHaQ+
	x1+blzXZYFBwFloEq3pDkL3i4JsrIwoE=
X-Gm-Gg: ASbGncvTz5Kyj2ZvVSy1hocrZHTL24w/cKpuXbC+32chEfhtVq9xXQd8/s43CwrOsQC
	tnQ4ONDTksBF2V4WQ7RbhfBbjVBi3c0XaPIZh031qy4hVym0MRhmT7Kl1OdVDhc1b0nWlGiqF6/
	nIGoNQmhgfaKTwYssKHwAbgvwA5M1lHHr5Lem767X0BmCCJi9IwE8lcyNOxbJdu+4kssm175NZq
	csjRcJYO++YwsoWVxcIvXLcWm/AjRm3U6TetYgW0uoBoq2w4IzBnvVZ4GG+Lw==
X-Google-Smtp-Source: AGHT+IFVuLjo+i5c3IPWvna7TnCjd/xxCKMaX2xPnsJedsSIowSo9qclvYxNvzwvo+hSZ3qc4RHxZPFW9pF6/iHQQLk=
X-Received: by 2002:a5d:5888:0:b0:426:f38a:a51 with SMTP id
 ffacd0b85a97d-42704d8d684mr3719155f8f.22.1760720574362; Fri, 17 Oct 2025
 10:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk> <CA+V-a8taTL1aQ5L1uYfJ405X38953z1FO=X5S54QBqGxLsF5ow@mail.gmail.com>
In-Reply-To: <CA+V-a8taTL1aQ5L1uYfJ405X38953z1FO=X5S54QBqGxLsF5ow@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 18:02:28 +0100
X-Gm-Features: AS18NWA6rZbliLLfxCHoG6LQgOdssCxpGbGI-5dUFG30WqziM0nwOAV2pUiLnc8
Message-ID: <CA+V-a8ve+6XPgWAQDJNwzG9ox-BSNqOBrO6JU7dL=yfQPgP0Ag@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/7] net: stmmac/xpcs: modernise PCS support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <Jose.Abreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_100257_013539_4BEAAD72 
X-CRM114-Status: GOOD (  35.22  )
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

On Fri, Oct 17, 2025 at 6:00=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi,
>
> On Wed, Jan 26, 2022 at 10:32=E2=80=AFAM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > Hi,
> >
> > This series updates xpcs and stmmac for the recent changes to phylink
> > to better support split PCS and to get rid of private MAC validation
> > functions.
> >
> > This series is slightly more involved than other conversions as stmmac
> > has already had optional proper split PCS support.
> >
> > The first six patches of this series were originally posted on 16th
> > December for CFT, and Wong Vee Khee reported his Intel Elkhart Lake
> > setup was fine the first six these. However, no tested-by was given.
> >
> > The patches:
> >
> > 1) Provide a function to query the xpcs for the interface modes that
> >    are supported.
> >
> > 2) Populates the MAC capabilities and switches stmmac_validate() to use
> >    phylink_get_linkmodes(). We do not use phylink_generic_validate() ye=
t
> >    as (a) we do not always have the supported interfaces populated, and
> >    (b) the existing code does not restrict based on interface. There
> >    should be no functional effect from this patch.
> >
> > 3) Populates phylink's supported interfaces from the xpcs when the xpcs
> >    is configured by firmware and also the firmware configured interface
> >    mode. Note: this will restrict stmmac to only supporting these
> >    interfaces modes - stmmac maintainers need to verify that this
> >    behaviour is acceptable.
> >
> > 4) stmmac_validate() tail-calls xpcs_validate(), but we don't need it t=
o
> >    now that PCS have their own validation method. Convert stmmac and
> >    xpcs to use this method instead.
> >
> > 5) xpcs sets the poll field of phylink_pcs to true, meaning xpcs
> >    requires its status to be polled. There is no need to also set the
> >    phylink_config.pcs_poll. Remove this.
> >
> > 6) Switch to phylink_generic_validate(). This is probably the most
> >    contravertial change in this patch set as this will cause the MAC to
> >    restrict link modes based on the interface mode. From an inspection
> >    of the xpcs driver, this should be safe, as XPCS only further
> >    restricts the link modes to a subset of these (whether that is
> >    correct or not is not an issue I am addressing here.) For
> >    implementations that do not use xpcs, this is a more open question
> >    and needs feedback from stmmac maintainers.
> >
> > 7) Convert to use mac_select_pcs() rather than phylink_set_pcs() to set
> >    the PCS - the intention is to eventually remove phylink_set_pcs()
> >    once there are no more users of this.
> >
> > v2: fix signoff and temporary warning in patch 4
> >
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 147 +++++++-------=
--------
> >  drivers/net/pcs/pcs-xpcs.c                        |  41 +++---
> >  include/linux/pcs/pcs-xpcs.h                      |   3 +-
> >  3 files changed, 73 insertions(+), 118 deletions(-)
> >
> Although RZ/V2H doesn't have PCS, it tested this on Renesas RZ/V2H EVK
> and found no regressions.
>
Ouch wrong series, retracting the Tested-by.

Cheers,
Prabhakar

