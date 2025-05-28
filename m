Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB63EC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 17:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OzUyuVqnOB7miLFV37uZy05en+YqG3p0V1Vv2/8lTk=; b=rpf1LTp3kvZP4nlizb1nAQB0wp
	GcGTYEOkF/3H8sYgeA399af197lKzOGDdaJnx0CwJFsh93iYeSUxglMd4TqTTUwXPdP/8V85bIeSA
	+p4vfXajntdlOw2lnS2ireQSIH2Wcue4nxeA6Gp+fre2kKcZi0+9jENUpYeIf0b4tD4jF91P1h73u
	m5telDn2U0RErp0seWDy6ToYxm1fbg6C070iqf205cUEyo++nGT2Moit+euRINJxDbXYWyywigHQ/
	rOWrIgCIE9wUoGw9de8yAbo67ai0EILXIkc812st+YiOid4BG4tzbF7N/J247eFDrPa3QScz/z9g9
	bUEPzphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKZB-0000000Dp9A-0MUi;
	Wed, 28 May 2025 17:27:49 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKKX0-0000000Doo1-47tX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 17:25:36 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fab467aad1so1729966d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748453134; x=1749057934; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OzUyuVqnOB7miLFV37uZy05en+YqG3p0V1Vv2/8lTk=;
        b=b3LaXQoMxSFR3vOkLBOA35FQBSwUQs6e+MYTsks4OXnm40I/dTvWYz0fbFyIA4P87W
         I/GcitWyGPd5K01OBYJRglLvsd5/dNZZoxK7K6n4/L/dULK7s5W5JBJmzkkYqGmrf7D0
         imPtc6xzjuR/GYHUtMt3XGPGqMFdD+1k8QAs2A9xvLccHvyV8+zMDzmUW10MuOH5aMZq
         UwKZ4Ci5hj/hs7C9EGRNxMyYwRHHN7NNgYaQ4YNCUa5vGESegCozLH/jlWdZDyCRu5Jy
         rIExrLSEtPeQp7PJo4v+ygWWu+SmSyBUPwIt1ffSfgL7LGsbzWAOglGj9OmDFkqsHcUg
         dI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748453134; x=1749057934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OzUyuVqnOB7miLFV37uZy05en+YqG3p0V1Vv2/8lTk=;
        b=lfbbZVdH8m3QVtXcTLCz/+W+EMdwohwm576GlH5LRzt/snUnIq66O/1gdajgcssW/E
         Or+X0Cd16ZcMug/LvYg5BMeY8Ke/k2CWQc3GCT2cKrdffZ6HLSBF/XVUkOCtySSBO57f
         EmoTt/0iYd1oS3yUM4Zytf0nYiBFVo0vJYCpsww0cLBHKN8M0douBDDvUC0Yq1JHtcjM
         KuLOmM92MoXM0usc6Wx51jIoNrekSweIJFxz1zKSiVbhhxV58/98PiaoqQkvbVzd5Kt9
         SAx0UOFo/bc+gNxFbwBeQTV2jbD4l0jfHiKWc4MJLsycY+C48lEz+slXE2RvSZDTZEbo
         m2hg==
X-Forwarded-Encrypted: i=1; AJvYcCWEOEmlOZ3Wf5/tSC9s8xOOlvZ5sdqsfoxLqZJEne5x/dlurCg9WyrEHod8/4ANIh3AqQH9L56cC0PZUn40muL7@lists.infradead.org
X-Gm-Message-State: AOJu0YyxG+JPhfTDAmJ19qbQ6XvEawiF3Z7kzYyBJuMzivUWlvG6u6n+
	IXSA1Dg+fIFzuC7iRUgHlhwQOluoYH8AVgNCvqb6yMuVU33o2/QH5qC9WN0MIuODS2LKwrzwTuT
	rdkwBGi+cQhhOJKBcW0ay0ybQEX3JttE=
X-Gm-Gg: ASbGnctQlo4LUZ92WtT/182IIrjgYHtFQewjNl325zO4l3iH+fOL0TJDpW9CvaqfRVB
	C1otkhdE3ZFVvCk/DF+GRcsqcgAdYhHjK/uYEKGjlj0oSmTPeQbrQHhpl4M+LDITUi9mwXSv62V
	EcDAS3cl6OGJWJxXIWHofD5iSQYbPwcRdEig==
X-Google-Smtp-Source: AGHT+IER5qx1DwG+fJoBcyq/OD8RJi4KmfX7CsQR2aaR2iNxoMBecCu9w8+lxoiC4pk7miaSH11257NF0qW83P2oVoA=
X-Received: by 2002:a05:6214:20e5:b0:6e8:9dc9:1c03 with SMTP id
 6a1803df08f44-6fa9d290768mr317566926d6.21.1748453133588; Wed, 28 May 2025
 10:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <aDbA5l5iXNntTN6n@shell.armlinux.org.uk> <CADvTj4qP_enKCG-xpNG44ddMOJj42c+yiuMjV_N9LPJPMJqyOg@mail.gmail.com>
 <f915a0ca-35c9-4a95-8274-8215a9a3e8f5@lunn.ch> <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
In-Reply-To: <CAGb2v66PEA4OJxs2rHrYFAxx8bw4zab7TUXQr+DM-+ERBO-UyQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 28 May 2025 11:25:20 -0600
X-Gm-Features: AX0GCFveR1vAlsAT85LmMrDh-cWJLkLNiCTzyzcFYtPEIKrvDRjHUdM3zbS3iJQ
Message-ID: <CADvTj4qyRRCSnvvYHLvTq73P0YOjqZ=Z7kyjPMm206ezMePTpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: wens@csie.org, Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Furong Xu <0x1207@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_102535_022597_B5FF19CD 
X-CRM114-Status: GOOD (  40.27  )
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

On Wed, May 28, 2025 at 8:12=E2=80=AFAM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, May 28, 2025 at 9:25=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > On Wed, May 28, 2025 at 05:57:38AM -0600, James Hilliard wrote:
> > > On Wed, May 28, 2025 at 1:53=E2=80=AFAM Russell King (Oracle)
> > > <linux@armlinux.org.uk> wrote:
> > > >
> > > > On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > > > > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.=
ch> wrote:
> > > > > >
> > > > > > > Sure, that may make sense to do as well, but I still don't se=
e
> > > > > > > how that impacts the need to runtime select the PHY which
> > > > > > > is configured for the correct MFD.
> > > > > >
> > > > > > If you know what variant you have, you only include the one PHY=
 you
> > > > > > actually have, and phy-handle points to it, just as normal. No =
runtime
> > > > > > selection.
> > > > >
> > > > > Oh, so here's the issue, we have both PHY variants, older hardwar=
e
> > > > > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > > > > when I surveyed our deployed hardware using these boards many
> > > > > systems of similar age would randomly mix AC200 and AC300 PHY's.
> > > > >
> > > > > It appears there was a fairly long transition period where both v=
ariants
> > > > > were being shipped.
> > > >
> > > > Given that DT is supposed to describe the hardware that is being ru=
n on,
> > > > it should _describe_ _the_ _hardware_ that the kernel is being run =
on.
> > > >
> > > > That means not enumerating all possibilities in DT and then having =
magic
> > > > in the kernel to select the right variant. That means having a corr=
ect
> > > > description in DT for the kernel to use.
> > >
> > > The approach I'm using is IMO quite similar to say other hardware
> > > variant runtime detection DT features like this:
> > > https://github.com/torvalds/linux/commit/157ce8f381efe264933e9366db82=
8d845bade3a1
> >
> > That is for things link a HAT on a RPi. It is something which is easy
> > to replace, and is expected to be replaced.
>
> Actually it's for second sourced components that are modules _within_
> the device (a tablet or a laptop) that get swapped in at the factory.
> Definitely not something easy to replace and not expected to be replaced
> by the end user.

Yeah, to me it seems like the PHY situation is similar, it's not replaceabl=
e
due to being copackaged, it seems the vendor just switched over to a
second source for the PHY partway through the production run without
distinguishing different SoC variants with new model numbers.

Keep in mind stmmac itself implements mdio PHY scanning already,
which is a form of runtime PHY autodetection, so I don't really see
how doing nvmem/efuse based PHY autodetection is all that different
from that as both are forms of PHY runtime autodetection.

https://github.com/torvalds/linux/blob/v6.15/drivers/net/ethernet/stmicro/s=
tmmac/stmmac_mdio.c#L646-L673

> The other thing is that there are no distinguishing identifiers for a
> device tree match for the swap-in variants at the board / device level.
> Though I do have something that does DT fixups in the kernel for IDs
> passed over by the firmware. There are other reasons for this arrangement=
,
> one being that the firmware is not easily upgradable.
>
> ChenYu
>
> > You are talking about some form of chiplet like component within the
> > SoC package. It is not easy to replace, and not expected to be
> > replaced.
> >
> > Different uses cases altogether.
> >
> > What i think we will end up with is the base SoC .dtsi file, and two
> > additional .dtsi files describing the two PHY variants.

I think having a single PHY .dtsi for both here is ideal if we can
do runtime detection, since it's difficult to know which potential
variants of PHY various devices shipped with, in our case we
have access to enough hardware to determine that we have
both variants but for other devices most developers will likely
only have access to one PHY variant even if hardware at various
points in time may have shipped with both variants.

IMO without runtime detection this will likely be a major footgun
for anyone trying to add ethernet support to H616 boards as they
will have difficulty testing on hardware they don't have. If we provide
a single .dtsi that implements the autodetection correctly then they
will simply be able to include that and the hardware will then likely
function on both variants automatically by including the single .dtsi
file.

Requiring the bootloader to modify the DT adds a good bit of
complexity and will be difficult for most developers to test as
many will not have access to hardware with both PHY variants.

