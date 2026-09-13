Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67DFC88E63
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gbr8BsktfR+a1EaDYZ2USzm9WWAfk0q22+veUNOHUVk=; b=ZZFO1sGSpODo+w
	8AL8RJFNMYfe2Qz8J/aS4STcYvI+h2foktBWKRdAHPw21BrU6PP4pgDOueouh4joNF5f4PMou+DNL
	xRh8hQkT9dYLDnV404tiVrdp28T+N2PUE/y9IUfLH6HYmLywkmIpZnTwNpx9brg6ZEtov8QbTJ+Ge
	XR6Hia/tmCwi/use71V2+1DziJ4yF+cn2dcmAlimkU6LbrMgxxxRxXrao6mSaxhQ0iH2kA/F7PVRq
	AIOAuO554Kfkwzct3rsi8QHyLRucgaGKDHuVQT4Inhv13iAyreWs26hynxpN/O+avPvkMbuyizfzD
	vKVHA9WLwjKs4IevMuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mvV-00000001oUs-19ti;
	Sun, 13 Sep 2026 16:19:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5mvT-00000001oUm-2Icv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 16:19:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9EC043CFA
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 16:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93A21F0089F
	for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789316370;
	bh=Gbr8BsktfR+a1EaDYZ2USzm9WWAfk0q22+veUNOHUVk=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=BrfG23hBES9HcMNEMPteo3eYejy43Wdu2nWC8rXpr52hll/lNlurXrU9mfGSDWgyw
	 W0nTDpy8xyl+bbQ2cQmBm2qR7iZzbTSHhTUaapRVHjyEwpquY/MsEZnUMmJtq3Rmpz
	 /Y6hCsbJM0Z91M2Dh3sBVIWqSbotjcGRTNvhAHYhPm942bcMEZePsQj/SItZWtia+k
	 Lq0tG1Ns5lb0c/f42kgpHYYqxjt7SCFhrxByfFaiFdVcFspEFdR2nUOu8iEnfaaW8o
	 sJLtR1qEV2lT8Asv1Y80p2vb0P31K/L+gnZnnHsWSRGS9XEwYmJtWi4Xm8DRHyfokp
	 ShVJGjTORW/Ug==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff174422so10340691fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 09:19:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwxlt0gmgT1HMc+N66yVCUv9FTipbTCyMn4+ItxkiXAt9l+fNt3nldLZXskM0Twu1mLt8Cr6rAw1N4xROqoLR0Y@lists.infradead.org
X-Gm-Message-State: AFuF++ntH0FUyjDc2Ln8A62kF4jFzdiY/xzabqIXQiFrIKLY+hM09dpM
	6xSLPd4M01Kn01MCTJiS+7Aa6SyPvkzGFsQSwrsaOygJDMOycch4V2ZZUnis/mBCQHqK1wZZ29E
	GfnJ+2PEL3f49O6/C8AtHHEteJfBt5zw=
X-Received: by 2002:a05:651c:2121:b0:3a5:b187:c7ae with SMTP id
 38308e7fff4ca-3a5b187c8cdmr20143951fa.9.1789316369058; Sun, 13 Sep 2026
 09:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech> <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
In-Reply-To: <178931616050.1372417.13697138134958064084.b4-ty@kernel.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 14 Sep 2026 00:19:15 +0800
X-Gmail-Original-Message-ID: <CAGb2v64p7ZoYrK=fpQ+V8ZiLAALqfrtKVtQYdmNq9KGGKnAX6g@mail.gmail.com>
X-Gm-Features: AcwNN1VNp8ZTWcZawmR5nP_tvFoqU5e4dwI7SMu7ihcAACDG16NmdRqwhCQslB8
Message-ID: <CAGb2v64p7ZoYrK=fpQ+V8ZiLAALqfrtKVtQYdmNq9KGGKnAX6g@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: sunxi-ng: a523: Fix single-divider clocks
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 14, 2026 at 12:16=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Sun, 06 Sep 2026 15:06:37 +0800, Junhui Liu wrote:
> > Sashiko pointed out two issues in my series adding clock driver support
> > for the Allwinner A733 SoC [1][2].
> >
> > First, ccu_mp_set_rate() generates an invalid mask when an MP clock is
> > defined with a zero-width P divider, clearing unrelated register fields=
.
> > Second, ccu_mp_set_rate() does not handle CCU_FEATURE_UPDATE_BIT, so
> > divider changes are not latched by the hardware.
> >
> > [...]
>
> Applied to sunxi/clk-for-7.4 in sunxi, thanks!
>
> [1/4] clk: sunxi-ng: div: Add feature support to M clock macro
>       https://git.kernel.org/sunxi/linux/c/da543a093f65
> [2/4] clk: sunxi-ng: sun55i-a523-ccu: Use M-only clocks for MBUS, IOMMU a=
nd DRAM
>       https://git.kernel.org/sunxi/linux/c/88735a2ffbea
> [3/4] clk: sunxi-ng: sun55i-a523-ccu: Use P-only clocks for high-speed ti=
mers
>       https://git.kernel.org/sunxi/linux/c/4b41d0ffa9d9
> [4/4] clk: sunxi-ng: sun55i-a523-r-ccu: Use P-only clocks for timers
>       https://git.kernel.org/sunxi/linux/c/b260db91603a

After pushing things out, I realized that I based the topic branch on the
wrong base commit. I rebased things and forced pushed, so the commit hashes
here won't be correct.

Rest assured that things have indeed been merged.

> Best regards,
> --
> Chen-Yu Tsai <wens@kernel.org>
>
>

