Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD468CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqg7Htrwxofmei2fLsgAe1uph5/lzKI0qa3LLNeV4j4=; b=ZF+UIou2ODZGrVKDVfWuUYh7RD
	goypCq5Y5nLqsS3NPrUO/cWpIbOAJI/6LEfD7cQcnl0iSXagQaCKJjwzo+l7rWRBT0+73+802+oZR
	apkYPVRy+gEAm0hcH67zISmceOT2WKrBtKiENqccfvh8nEmiHh/eWKNAfWmXp9WbCZ2v3qyz1kQOY
	/5nYGCwZuEVNi9GnjxWiO+BRg3bedP2EWeCvDmbDEZdVTiC0C+jykhojtHDW8o1tOW48I8CCsWfDh
	vfKMZOVLpjmVyslTi4CMjkqFDhiTV+lY4NfNpXcG4YBj69rq7sc0yA1eoMkhkJkBvlEMhJqLe3Dir
	uBbP3rLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9npO-00000008X9P-2HOA;
	Fri, 17 Oct 2025 17:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9npN-00000008X9I-1zec
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 17:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pqg7Htrwxofmei2fLsgAe1uph5/lzKI0qa3LLNeV4j4=; b=XH7zifIDRx+A028eJSzskCrgtO
	eod1aA/GczdG72uQsHJFWOnn0l+3rmEmB2eMTMPh4SgfZNo4aw3ha4YA7obIYnxLKr3BTnvMv6tKV
	9Dg/6kwZ9SeX5MBtgalb7nReQZriF68BzjUVI2D5Mot1BWsaZzsoOjYskyuH/pGcs3b+dopF7qFZF
	IjuzzhsQIwfaTfrPHQJ36nSUKpNBLrWUDzqECsD0V4LL6n2dCOnI3wC+LPEcSkMm4HyBpqe2EM7eA
	N9VdN/O3Owy63KmA6GSRw1+MM1UPN+aAb+4LV/hxAN7U4KjwPTpc8I8Slawaq0uAw5NEbQE5llD1t
	tInRCLRA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9npF-00000007nX1-0vpx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:01:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42701b29a7eso1044307f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 10:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760720465; x=1761325265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqg7Htrwxofmei2fLsgAe1uph5/lzKI0qa3LLNeV4j4=;
        b=RTkjQ334MK8Pm5nudZ2G+7L1W7v5YtlIyGZFwRHLYI39igeM7SfoPfdkmJzU//TDIk
         ESWML1epRtsaanMP76m8sPF+eP2OGMrF5NmkbQxLLgG321RVqS6WnX5UMe7hF7dp2kTa
         3wuVT5b75jfhxxnnHgfFPcxWamJN4mvRzL1E3e8Y8C6A/jDvDMwonTSpaVmM6LjgjTs5
         bXRav1ONTZno9GVOXPJipXJ0r8Lyiar/URysF9eVmWiq0EOzBikuWJIRmJwrnIe8uGIU
         zEIyLzrpyXUTeIY5LCTOx5KnpBP1+0okhyYcfuyHzPoSZFdKo6jr5/S1IwBFeVujCVhx
         6TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760720465; x=1761325265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pqg7Htrwxofmei2fLsgAe1uph5/lzKI0qa3LLNeV4j4=;
        b=MGUfYN+nKMzAudhdvU2gaFUMVIs/el/M/pfHPIaENGYIuUMJZO9FArMI+4klkrKjy3
         rTnJLYGWbdH2rnsYQVa6ZBQXsnWLCRDSR6K2dBpRce36kXfU7k+6rlZu1l/eydx0gODK
         f3Vies0GN/nBjJ4KGV4Vg1uQH22ZDX1ndgNPnUqLgkkL1tiwdgK1/2wB//S+D+aOO1RA
         HFKXcqwE8AssWw2+jjT97i9+9RtDxttnI3ImRQ/dZKsxivqFmS486iTMOK/9zHWl1D64
         +yo/rQ0OA49L2Ppmx+Kc6slv9Aqor6422cdHBFK8OhGpf358xdZsLmS8QnkuKRu2Nk9A
         TVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQK0fX3YUvvIZnU7iOU7XXTZF9XIRQMVYLewMccn33xYRMF1K/fYghaz/A5ci2M71BkX0JSPN132YPRR1na30/@lists.infradead.org
X-Gm-Message-State: AOJu0YzY7QbaZE4xMeBDV27cIuJU6WI+44fS1AW2+S7V1wQn+K28oKoE
	ZURy4fij4BMWJaWJTBqtw5aU3604FIwlLMV3DtxiY5m3uhd0YONjrQus0HtYFCaGpY4Ah981NT+
	kBRawBhld6FMozX2vZOURn5o0W/fzEwU=
X-Gm-Gg: ASbGnctzLAOy3KgXiBR8Xr/RGW2DXDBR+EUKcawL0hZtECzzqojXua+CQcevhwt16HU
	1bTacGwoz/DgtpCI7bk19WyA9N5iJXnj+Df5fJnP8OE+u+cxnT70SXnYxMOJRuvW19q1xVa3/Fp
	eO5oA1gYIHL5xjmTq/d7EBrzQe+nOTI5FzNj75I1K6lH0hXvwBvzoz8po7P2BlfHFOV4HhnfHjg
	C4tvZ3j6T8Kpcb/WZ+/sgmzIAienHFx/d/ObeJt2VFGa/IxpPs1HMPZ9R1CpTVcw91fvQGDQfMB
	CYzdLfw=
X-Google-Smtp-Source: AGHT+IGl5uGRbmbZLL5/wdiOHc0P0AlgpbUQEkv+/OS3nj0yAr+2M9EwB6fqHN6SeNM2W4NfF3pf+/0qdkabuuH8kJo=
X-Received: by 2002:a05:6000:705:b0:426:f9d3:2feb with SMTP id
 ffacd0b85a97d-42704beea1emr3600647f8f.23.1760720464982; Fri, 17 Oct 2025
 10:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
In-Reply-To: <YfEhaK7VtJ4oru03@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 17 Oct 2025 18:00:38 +0100
X-Gm-Features: AS18NWDRvAVPn4Jf57le9CYGXnLlVvbhb67dsacK4IgBFRScoJpp_oMsiemCpA8
Message-ID: <CA+V-a8taTL1aQ5L1uYfJ405X38953z1FO=X5S54QBqGxLsF5ow@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251017_180113_177233_CF1D4506 
X-CRM114-Status: GOOD (  30.28  )
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

On Wed, Jan 26, 2022 at 10:32=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Hi,
>
> This series updates xpcs and stmmac for the recent changes to phylink
> to better support split PCS and to get rid of private MAC validation
> functions.
>
> This series is slightly more involved than other conversions as stmmac
> has already had optional proper split PCS support.
>
> The first six patches of this series were originally posted on 16th
> December for CFT, and Wong Vee Khee reported his Intel Elkhart Lake
> setup was fine the first six these. However, no tested-by was given.
>
> The patches:
>
> 1) Provide a function to query the xpcs for the interface modes that
>    are supported.
>
> 2) Populates the MAC capabilities and switches stmmac_validate() to use
>    phylink_get_linkmodes(). We do not use phylink_generic_validate() yet
>    as (a) we do not always have the supported interfaces populated, and
>    (b) the existing code does not restrict based on interface. There
>    should be no functional effect from this patch.
>
> 3) Populates phylink's supported interfaces from the xpcs when the xpcs
>    is configured by firmware and also the firmware configured interface
>    mode. Note: this will restrict stmmac to only supporting these
>    interfaces modes - stmmac maintainers need to verify that this
>    behaviour is acceptable.
>
> 4) stmmac_validate() tail-calls xpcs_validate(), but we don't need it to
>    now that PCS have their own validation method. Convert stmmac and
>    xpcs to use this method instead.
>
> 5) xpcs sets the poll field of phylink_pcs to true, meaning xpcs
>    requires its status to be polled. There is no need to also set the
>    phylink_config.pcs_poll. Remove this.
>
> 6) Switch to phylink_generic_validate(). This is probably the most
>    contravertial change in this patch set as this will cause the MAC to
>    restrict link modes based on the interface mode. From an inspection
>    of the xpcs driver, this should be safe, as XPCS only further
>    restricts the link modes to a subset of these (whether that is
>    correct or not is not an issue I am addressing here.) For
>    implementations that do not use xpcs, this is a more open question
>    and needs feedback from stmmac maintainers.
>
> 7) Convert to use mac_select_pcs() rather than phylink_set_pcs() to set
>    the PCS - the intention is to eventually remove phylink_set_pcs()
>    once there are no more users of this.
>
> v2: fix signoff and temporary warning in patch 4
>
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 147 +++++++---------=
------
>  drivers/net/pcs/pcs-xpcs.c                        |  41 +++---
>  include/linux/pcs/pcs-xpcs.h                      |   3 +-
>  3 files changed, 73 insertions(+), 118 deletions(-)
>
Although RZ/V2H doesn't have PCS, it tested this on Renesas RZ/V2H EVK
and found no regressions.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

