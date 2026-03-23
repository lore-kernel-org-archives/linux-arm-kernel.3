Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B443EC01A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pux1Z1otGsvQikhUmNMIJPMcYqbCbQ8IpAhC//jCZMY=; b=kOs7o7J+UMBLcAqr6YzIEnFxf1
	UVmorcjocX/IIzgk2JnIvkxzE9GyGzE3ZTdA9SdgloE/HMxrOe05arrV5pw7gcGHjArjPR+zRrg2p
	7RR2NdHiHaJhacWz2QCn2Ffas2CFkzvZFJgI0VaFuxAcqsPuOYAQ3aF1IAFqMB7erwDwarKcDw8rr
	Rn2aWc6tnJcw/EZQ+8Ey19IX0DoffLc7g49/xDmp6U/SRS++ANHCey3UstNWaNqnmgJUGt4eBUKE4
	VPXViOalIKpkLw07uofSEt1F/a43SW72D4SofsQaEvLv4m9Jnr6L0E//PlT2qpPZtZaCeF0SyMsGP
	TcwW3bmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bAr-0000000GKA9-3yZh;
	Mon, 23 Mar 2026 09:02:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bAp-0000000GK9a-3how
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:02:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 329EA442EE
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB0FC2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256528;
	bh=eE5g+1WMrIl/FHufSMBITJlni5GhlGpGfBqj9cDGjlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P8zNE+mFm8fxvzeoe+w492qZUYLxiZZVPzFsg2DREdO+GF5gzrmb69c28Xykrkdu5
	 HEb1GLLRAG+RHALmQgGZHRFCU7ea43cz9Ro5i2oDEmaAzO+SsJBNyO5HUhhWzdhLTp
	 azgZFm2aizimuVkw42MDk8uQJ8p2XP/PfQAfYtP8uxM4+762xJZ5B4aFE/1bh5WaCs
	 Msut6Cc9Yx1DpFk35hMw/df5uiCjv9THqOVHOUtbeMSCRXEJNFCBQu5yCX71XTbLKk
	 0LlvbAjVqXFzgD+M1JqUSsH9cs7xW8BZlhIxwtZlSnGmkH9HjSnWtN92pdJ05qQ42i
	 UFXvrrkpdEJ+A==
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64e8c7f5082so3456949d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:02:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3pv9XXATjuEr50q7z/m5SLYjrlhudvP9G3CDfkZ/Qod88QoQ+00KPauRZ8YWtYcwTDkb04ZZxnsv4J499LrDV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz828GQmk0CeEcK+iqyXTAgq4T16fqQq9mNpDSW+ZVFqC65XD/9
	/LnDJCldfQCwaXQnw6sCbplQKVB7fFcjXv4Ej/WT3/uO/69kQ5h9IoT7KspUB2KACY4U7za520+
	42UkC3tv2YDMSDR2KKAkVWGQR+TAhbFk=
X-Received: by 2002:a53:b605:0:b0:64e:9e77:f950 with SMTP id
 956f58d0204a3-64eaa6df84fmr9321180d50.29.1774256527153; Mon, 23 Mar 2026
 02:02:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260317115411.2154365-1-eleanor.lin@realtek.com>
In-Reply-To: <20260317115411.2154365-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:01:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLnRDsDaO4vrySO9dRrspDrGiKUZkT8uU9J7mev6XHcu-g@mail.gmail.com>
X-Gm-Features: AQROBzCzwKV1FvnXp_2c75F-p7Yqf5gvJiSeAyIUKrt-md2cTLWACh1gS9JGfIQ
Message-ID: <CAD++jLnRDsDaO4vrySO9dRrspDrGiKUZkT8uU9J7mev6XHcu-g@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] pinctrl: realtek: Core improvements and RTD1625 support
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_020211_947022_0A90CAEA 
X-CRM114-Status: GOOD (  10.15  )
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

Hi Yu-Chun,

On Tue, Mar 17, 2026 at 12:54=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:


> Tzuyi Chang (5):
>   dt-bindings: pincfg-node: Add input-threshold-voltage-microvolt
>     property
>   pinctrl: pinconf-generic: Add properties
>     'input-threshold-voltage-microvolt'
>   dt-bindings: pinctrl: realtek: Add RTD1625 pinctrl binding
>   pinctrl: realtek: add support for slew rate, input voltage and high
>     VIL
>   pinctrl: realtek: add rtd1625 pinctrl driver
>
> Yu-Chun Lin (3):
>   pinctrl: realtek: Fix function signature for config argument
>   dt-bindings: pinctrl: realtek: Improve 'realtek,duty-cycle'
>     description

Patches 1 thru 7 applied to the pinctrl tree!

>   arm64: dts: realtek: Add pinctrl support for RTD1625

Please funnel this DTS patch through the ARM SoC tree!

Yours,
Linus Walleij

