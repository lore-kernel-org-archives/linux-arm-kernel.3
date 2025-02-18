Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFC6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 22:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/b5Hpj1f7yJgvbKrphP6Ri0sMcj4xtt856FZzy0Lv7k=; b=EQe5HoYpFnZV7h1sVSBLk3mf8x
	hWw1Wh+In8bdaGvzKUvdTmPnIdLSF7F0HPtOnp7WTww1SM0bihG/tm/2Ep9e8zNuM5MT4u1grleK0
	L/2OKii5u0xiuXxaPnTFx5mMEKEShnPY/iZzpW9p7/utF/GZQVEh1mPac6y70yAUv+jN4TnqR+Pjd
	QbrldsPBJjE3l1WMOMJdA7KzrSD7FEymjO1J1gizCdWFUebE0YCKGygAUNEu63kxYA1NAV+d24un7
	ByTtE7FfH3N4yIgI/QaWxcN6qXVeQgNj3GjpuGdzUwoWbVfEEh3H4CWlrisSJmuhtKXmddV9COaNn
	N3qt1JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkWBK-0000000A9XR-0p9F;
	Tue, 18 Feb 2025 22:35:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkW99-0000000A9AU-1Fa5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 22:32:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7AA865C62CC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 22:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6872AC4CEEB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 22:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739917974;
	bh=/b5Hpj1f7yJgvbKrphP6Ri0sMcj4xtt856FZzy0Lv7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KAAd/qX4UOvDbOwNnhWOnlSwHp9kAmGQ64rcnfcha4VPFqcKzzPy3wnVBNqdeayU9
	 E4qMTUn3yqV+IKUdiM50yniYT21B/NNal6fQDhAYAmGDCOh87Q8S0ZvLX1qJFHtF/q
	 9WQMrx25vPmyxDijosbOyJ5TMHqJgTJkKbyr99tJJzDeKgcUwpgL4rqepj4yRaLhzO
	 zauBBurpWXWZw9Wn2lDhivKVIiitHef0bUTr7CsPCbkG+h3wBtGL1z+6IYA0XhNsCB
	 0rwrJ6depsuUybBDKl3cTu5P/Ogw6h5mvFB98bAiry74dLQ8c8K0tsLdq3WftPBbSR
	 RoR2ELnMav7sg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e02eba02e8so5477002a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 14:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2jxhHRXnEC9HsYZHrj2UsfVN5oV105j1M6b1OF1UT0xIQMY+96EbSS2LdsIBiI8lmXqenAQaNapv4fqZcs9cW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb1QRYfLM/1OaF5noNuzYM/kj0mqFqF/wyaxYv8hKbmqTyPCbW
	6zidVg+uroKcWLIREaiLW274axYIESOCNaBiEkOgixJ09W5zNbtFqsYApTNWx8SnF59aDSeBb/D
	8eouL6NSH5qY9GGArxUqlL7x3Eg==
X-Google-Smtp-Source: AGHT+IGbj8cBtp91/Fe3BaEKNO/HdIdSWwYsIibl0UALaecSgf4d1GNu8D2qYOSALt4T7Q0kztSe3FjfBDbHrtJdeXg=
X-Received: by 2002:a05:6402:50c8:b0:5dc:a44d:36bd with SMTP id
 4fb4d7f45d1cf-5e089521896mr976943a12.8.1739917972966; Tue, 18 Feb 2025
 14:32:52 -0800 (PST)
MIME-Version: 1.0
References: <20241107153255.2740610-1-robh@kernel.org> <20241115073104.gsgf3xfbv4gg67ut@thinkpad>
 <20250216165406.jp2dzfwdfucklt5b@pali>
In-Reply-To: <20250216165406.jp2dzfwdfucklt5b@pali>
From: Rob Herring <robh@kernel.org>
Date: Tue, 18 Feb 2025 16:32:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLhYy4cdD8nnn4EjEfdipwS2EQfZAuG4QtKopXM95P2Ag@mail.gmail.com>
X-Gm-Features: AWEUYZnZOHLmJ7BNmzdA8bqCUJoLvmFX4gKX9vplzHjuoT53syEnpMmsZXAO0EQ
Message-ID: <CAL_JsqLhYy4cdD8nnn4EjEfdipwS2EQfZAuG4QtKopXM95P2Ag@mail.gmail.com>
Subject: Re: [PATCH] PCI: mvebu: Use for_each_of_range() iterator for parsing "ranges"
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_143255_424694_26420194 
X-CRM114-Status: GOOD (  20.84  )
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

On Sun, Feb 16, 2025 at 10:54=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
>
> On Friday 15 November 2024 13:01:04 Manivannan Sadhasivam wrote:
> > On Thu, Nov 07, 2024 at 09:32:55AM -0600, Rob Herring (Arm) wrote:
> > > The mvebu "ranges" is a bit unusual with its own encoding of addresse=
s,
> > > but it's still just normal "ranges" as far as parsing is concerned.
> > > Convert mvebu_get_tgt_attr() to use the for_each_of_range() iterator
> > > instead of open coding the parsing.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > LGTM!
> >
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Could someone please verify it on mvebu machine?
> >
> > - Mani
>
> That is mostly impossible as pci-mvebu is broken. Bjorn and Krzysztof in
> past already refused to take patches which would fix the driver or
> extend it for other platforms.

That makes no sense. The driver is broken and we won't take patches to fix =
it.

> So I do not understand why you are rewriting something which worked,
> instead of fixing something which is broken. The only point can be to
> make driver even more broken...

We make coding improvements to the kernel code all the time. There is
no way folks can test every platform. Either drivers need to get
tested at some frequency or they should just be removed until someone
cares enough to maintain them.

Rob

