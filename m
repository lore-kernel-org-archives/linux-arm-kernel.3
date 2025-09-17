Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68329CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=; b=2w1hNIxVO0VOA9
	rcq8NtBzEcU81zu9LTRJfHkcHxttYs+2BpVwQuuif4fF51FcBswf5cn3WSKoDy04xamWHN24ebtmJ
	ocMqRV71OZo89xsSvDUeEWfGvwPim1mRkKc1iDpVSl2a2FE9zEL1p2pBHAbbZp1fbcWgxtPS/mXpM
	ZQAzGZplhXMKI6FsN/Y/i6wZZc3oaQ7Aw7KXFqJ0sM4WRVOsaF6mWDhlwOA4ps2yRB2qnUrENLWq6
	YIv6mm/zw8vMXrQBXMK8PV6oWUAMRTRmXm4lEdfVYxge9VBHNYt97AhDFMXq0oVo2gdeGOLj9Zsn3
	78RWZE1XFkREdBafwAEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu8q-0000000CjQA-1KOz;
	Wed, 17 Sep 2025 15:32:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu8p-0000000CjOw-0S3y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=; b=avmTq4TAND8jVWvff8CoGK8EOb
	xDN9aPGr6XzKHCdZ0hyzQSADxAsKKyhkpyT53bU45nxaqtrFH7SKMPu8XgweThSRTuNfGR1RWyS5m
	jWS7qbm/7yflsCqVXDKohhPA1y6PXKm8aEnjFk/5H3DdZOwL0faUGiBwHjCyii8j3HpkUmfAlJ6jj
	9voYunE3X1ub8DR/utJsgAqDPcv6qqqze99hvzNuIGpP9JF8MnP/wjNcFztzhrRUjboQ8D0qBuskb
	oH63o7U9kVH2mLBjHyBBF2dtAnr2H57NkXasQqyjGF2+0RcIRkuF8n08PO4OOJx5CakePlOkBuaVZ
	+T9R2RbA==;
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu8m-00000007R4h-1Net
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:32:18 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0415e03e25so873419266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758123134; x=1758727934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q27fzm1U+HTtOJk/CZd2YtayE6m/1WFC4/HuVd7xPus=;
        b=fTtDLXtDZUUDB9H4H6hqHe3tDp6Oj9ubvzCPEfC9e2Nl1S7cFDDQRTVH/cs8u2QDcp
         YIpa5nqfhVsvrEGQ4GGxtqpZLRRcpCg8FxDzgFbeme2dgwaz24gZ++pX/4zpGXBv9Ygc
         L6G4SWU3+SOBoJ07zm5KuFhkEIqVLzBzYftuy2kJcoq44PZBv3u3/3JlDE0mBdt9yYOi
         lmcOlU9jEDawBk+toFd3/iTWRpZT1R4NPBv4mzSRqmahKJRE30oxsBw0v3+o+dISUAUM
         4garFxbRYT1rgaSRY4iKPJHEws9Ho7KW4TomNM2Kh1+Qai1Ofsn5PxwJvJiYLA88MRGh
         1SQA==
X-Forwarded-Encrypted: i=1; AJvYcCXdMcHijtIGt6uWmoggTEqcy9v89OAs+Xhfr2Djv4nH8zOJuUw+7DNKxI5Y4TGdmC7qJ/FXhOaIFnbq8eGpk9zy@lists.infradead.org
X-Gm-Message-State: AOJu0YzFjCzali89mOwJ8TS6EEk+Y0ymiHUybJqR64CDbO5hnrduHhk7
	/FnB1qovl+ULtXajwoVlA/M81gNOKurXBwmsZBERhZj+lm7eS0YdB0i2q2qm4emfgoo=
X-Gm-Gg: ASbGnct6a48oqsiilhNUN8UIiNGz/t2jMOyJOFZ1Buwmqg2Wi4uECtFkIxdjuhZpt1F
	m5M54AeDo2SOwioZyRltznWPrzmAIOFdxzhTOYHYFkmCEaQpCOFHKE/qw6A8PlOHvyv+YlrM7bP
	JAHU3Vpa9E+cmZTlV5OTKm4SDZ8d4wNoAcD53MvvzWv8yoOPcuCEkMQ/ky9TAfSunO3kPkUVgCC
	xv7IKZ3M2XlZJjhZC7FgJbS6NS7AuumfpDnQF3mFpi6duzicxLs7nJQJTf37J9Tdpnl0d2OHKsO
	yYqXlRXs9RKDSKn8Ktqy1jrSJunyZdwcgfdcevX9LYSdhoRS40j+gfmnAZvu/muOQSH4wSRSFoc
	MfjquSfypu6C/iFTAGuizXwt8y31bTGiHiSP8i5Q5obwhXFUAICqb9/MH/QGICw==
X-Google-Smtp-Source: AGHT+IFkaYzJEL5b8PT0wL8fy6+QCqBbZscw9+6iL/xPTnNh3qXNBwEeM4iEZttfX4N6Tuj+yZ/Rgg==
X-Received: by 2002:a17:906:7310:b0:b0e:a66f:478e with SMTP id a640c23a62f3a-b1bb55967b1mr286721266b.14.1758123134136;
        Wed, 17 Sep 2025 08:32:14 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com. [209.85.128.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b3128a1esm1354885266b.29.2025.09.17.08.32.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 08:32:13 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f2f7ae386so27307795e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:32:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2XTmoQ5LipyvxylKd0FtVFxjOKhFFPEkmHBCTtUBJLpBPzf8YDn4xOuLUjMB4pZsAQq93MqMpIXjmK2Gnjgkn@lists.infradead.org
X-Received: by 2002:a05:651c:2129:b0:336:ba05:b07f with SMTP id
 38308e7fff4ca-35f63f7b5famr7302181fa.21.1758122722394; Wed, 17 Sep 2025
 08:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <aMrPpc8oRxqGtVPJ@shell.armlinux.org.uk> <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uytpl-00000006H2k-08pH@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 17 Sep 2025 23:25:09 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
X-Gm-Features: AS18NWAKSCnNyj6DLBKT_D2jbUlV9UmfcpG5sUkS8PNH_1L_6YQPZfrfuWMUlOI
Message-ID: <CAGb2v64ThmdFN7jHTs6Kf6pG0rhHzQn=X8XXt21qna2HLx3f0g@mail.gmail.com>
Subject: Re: [PATCH net-next 08/10] net: stmmac: sun8i: convert to use phy_interface
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_163216_433224_50E32A83 
X-CRM114-Status: GOOD (  10.96  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Sep 17, 2025 at 11:13=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> dwmac-sun8i supports MII, RMII and RGMII interface modes only. It
> is unclear whether the dwmac core interface is different from the
> one presented to the outside world.
>
> However, as none of the DTS files set "mac-mode", mac_interface will
> be identical to phy_interface.
>
> Convert dwmac-sun8i to use phy_interface when determining the
> interface mode rather than mac_interface.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Acked-by: Chen-Yu Tsai <wens@csie.org>

