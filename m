Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA83D25030
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 05:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f94E4L5SmOeYb1vuZvM5qXnRI7kcqN1FAuqd7C/lzvA=; b=49n68EQpIaHDfN
	b1fgJRLYjk9jH2dzs5clQTBp3r9RDLDglroA5lBMNq5/GGATAwVBUSEHzIMyznkY6e5j3Bbaf6MgD
	8hFOT3gvxWJzeE/ItO1R0ubN7w/C0YJT7OQUAYrYXc9m7KNQI6pciKPMWysfO9fER2hD1tefSugah
	eheBQIdyhncOBm4EO/1yeYiKI0jlj7IUINxpmqvMazpAn9wA1dmPf2TWBCcA1gIl6Kie6Nozh1D0Z
	n499Edx4ADxZVOnKLf116LCI1FYdtHY05f4WS6rcR2h84jorsRFIFWTaO0vT0pAVJq9awFt+zCax8
	kHZnLeDpoNOu5Jhg3E/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veoK9-00000003tjO-2uzN;
	Sun, 11 Jan 2026 05:49:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veoK7-00000003tj3-11LY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 05:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0887940858
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 05:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD31CC4CEF7
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768110547;
	bh=f94E4L5SmOeYb1vuZvM5qXnRI7kcqN1FAuqd7C/lzvA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=AOPJ9XMBMYJ/lsGlGK+Ya3dlhbyqqxLWBl5MLpZ5CT17sg+jpfHJ1lSKsxCPZ1Ieh
	 1su01gPcE5ov38stP3uq68FqlB2VMDvKmRGR1LoIZWh8i71tbVdWAIqPrOuxB278FZ
	 lPtdI7hUwgmApup/21yz52TwlQAxrywEhu6KJj3cBGuPMfSaXOTkdUKPomLu9NWps0
	 hqSimvcDglnFiKIxO5to47f6VWAldVBwWXnz8J1/ZXNLmpX6kIbp1n3Q2fm0gL7uQ6
	 BFrdRUvbT4/+09fm07dbVY/5hnoknR5ze4CQ0L5cukTIcbnCRT6zhWKYcdgrGkQF63
	 /C96srd8XjXXQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso15151521fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Jan 2026 21:49:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUiISZ38IGYhIJmjslcit5YFchnM6xlZDJyv/SWYfZv4gsGN/MfqzdTTTk4DsC1AVuZXEsX1om+jWNgBH9Z9tz8@lists.infradead.org
X-Gm-Message-State: AOJu0YzaMI/MU03VaYSiqYKxYj3PULEivO6/VXLymdGabsGkCAomhTrm
	rv73B8CGAObBISZI5sGRSmoivl1INRKlnf5P/ER6pV0Kn44mYz5TQlP2wF3Chs6JzRUIVBnnGJ4
	13cU0XqnJEsiCeDD/MI2HLiGd15hUEm8=
X-Google-Smtp-Source: AGHT+IGrD4yWVyakk5sWnBK/I/H1GUL7zKBVZOcSN9AR7czy2ZBJuisGO7mjKMC+qA1D0w16r+zMrBNAHJe06lQ7mTY=
X-Received: by 2002:a05:651c:30ca:b0:383:1c18:ae07 with SMTP id
 38308e7fff4ca-3831c18bad0mr22169581fa.41.1768110546185; Sat, 10 Jan 2026
 21:49:06 -0800 (PST)
MIME-Version: 1.0
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com> <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-2-535a3ed73bf3@redhat.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 11 Jan 2026 13:48:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v65idCaa4ixAytB0Dfa_4ivc+AQ-c6pdbzQNAnLnzmipGQ@mail.gmail.com>
X-Gm-Features: AZwV_QhR5DHEaFlzpd86lAqTlAj0_MLG2seSom12NCHQycmMQplaKdXkzaZfMOk
Message-ID: <CAGb2v65idCaa4ixAytB0Dfa_4ivc+AQ-c6pdbzQNAnLnzmipGQ@mail.gmail.com>
Subject: Re: [PATCH 02/27] clk: sunxi-ng: convert from divider_round_rate_parent()
 to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_214911_312424_F980195B 
X-CRM114-Status: GOOD (  10.92  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Jan 9, 2026 at 5:17=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> The divider_round_rate_parent() function is now deprecated, so let's
> migrate to divider_determine_rate() instead so that this deprecated API
> can be removed. Also go ahead and convert all of the driver from round
> rate type to determine rate that accepts a 'struct clk_rate_request' to
> simplify the overall driver code.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

