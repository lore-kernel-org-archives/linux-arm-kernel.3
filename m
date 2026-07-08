Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0082DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBxe0wZEJGIu1kkVYecVy6uNbnIpdD9XRHlLQPSVa+E=; b=geis/q4XBBCfKvJZU4FKDmNm9U
	Kd9RLWT+BC8UmXMU4SASON7utAbmyaofSEIIKdJpID4aF6K30smWa0ZOJ3dyLeNZHzwERZbj43KQG
	QeP0DcHfZBkaes3LXiKuxVv4gaye8lzRL36avUpM9A+JRqtVafVGkVQpMVq20ujhKTvVuxAU/1MPO
	tUKgIg0xbNiVU5raJnQZk5WDu9ev0ZOrDDD17abxpo1EhnKRGMWNwW8aFyRRxz1RA0WzC3ezNBHla
	+eqpWEiDthcio77N/3JqNzlVDXU3I/eDqGoY/mvWRLszj0McjjHH81+ivvYC5WNtrTDAXmoFxdGWr
	maG+WjvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmZ-00000000bJY-2tzr;
	Wed, 08 Jul 2026 23:34:23 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmX-00000000bIl-0qkI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 23:34:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cac59f8b64so14777375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 16:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783553660; x=1784158460; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBxe0wZEJGIu1kkVYecVy6uNbnIpdD9XRHlLQPSVa+E=;
        b=Vcq8BJACvkFe/tgykdkIXGkvKgYiUk9q98SB/+Ma2a1fNYjAHgLvVjsHFuUDTCzExd
         bgyraStXDl1v8U3epgIdaCtF10yZOxkB1N6i0bFbevB5Qg9Hj1jDOyH3+jwg+bIukiTQ
         Jyrx5+u3NnFYUVV67mlnQwVOMGmmE3GXD/srHEdkBEYRYAxGMuMzVUmzZ6M1EVjnis92
         DcNfet3b4TK38kB012VuRqP9bGCGwpT7Ak1rCTptkslQ0qFuo57ho5kN6l7mQk2iFS6D
         LIlzTeKj0XbRuTIgJsTk8d11FfHMUPh08Kt8MduH1sOBggW9WJv9FRuEQdjRuUq9bK1V
         Ksog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553660; x=1784158460;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pBxe0wZEJGIu1kkVYecVy6uNbnIpdD9XRHlLQPSVa+E=;
        b=FmDToLG7iwsPU9wIencNTQeku0VDmspJbDAXLRQN5m9Yyc+1SwIVJM2yQ3XT2CRJ3U
         Y3r6unxGXbwmu4SZ2Vtu9IYUIN2dUT0wCtUwDmdTo3rC6EIJE0tTljk7tw0f4omdXm3C
         XYKWZVrwHONuyrguI0MXu5D7sInrqK0oEYziF0KRnw+zMnerri6YDd48xyq+0oKqG8Be
         BAoKl8YGUh7da/AAwo4MHa/CuLVhj/vIGNnbWSVMO5Id0CiXmk9eqcaWDki0QLwGm7su
         kpYgQiB6FSc6FTYn9U+RYzKdiMkTbUGeCFKDAomIwjYkNttrep1CbGknFwKhI5dZr20E
         urLA==
X-Forwarded-Encrypted: i=1; AHgh+RqzxMA0x+x2NWdJjB3FE7sr9arxIbeYWHRYO8nWHYq2THiLk2X8UODGXJw4UVhDlxJJNnvwmLtAEdQi2382gt4i@lists.infradead.org
X-Gm-Message-State: AOJu0YzFCvaG1I1ZDxZWn6UYsPyGYGqrdrSnZUvJNinesDISkR8a87o3
	zmGR4UY7AL2p9bir38cIjquq70fs4pD2CRhExge78k9B74S56QeLMy8D
X-Gm-Gg: AfdE7clp3m7VlSR0fQ/+2WTlFMyJhdpgw+n5bMIwDV1dv8qJ7MIEAtCMXSss9paomX0
	euDMaOghv5PTjCq2wHGEFD44CpBovZCLqOhvv3G+U5tF7NqltEMlrBw0SmV4obHFGGuLmddmM+3
	vVvXvYCVODgE8Hl5MqUlLI0k1+ZTuMWMnoUgj+2iQg3TmgIVLRT8/s79DphJLbpPTiIfaQtjyL+
	Z6SfuwqYL9W9/Ic3pSOg90dWmXqrhsZmcmhbsZDwgVnOgGv+Kg2JKuL4Yfzc5KoUoOGHWc5JrxU
	snNFXgPjnfuOqk6Y9nqcbqRw9eTuGUUp48ZKT/MCaJM9tK58wZNZmYlzB0X33tS4icJN8b2NVfm
	HgoScUk0inxwwIlDtBlb7NwVlM2iLV/irtKvtk/fdrRPOJnjtr/1SXFmZdcv9NPDk3Fj3cTqZPP
	nBE08Iwg==
X-Received: by 2002:a17:902:fc84:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2ccea2d7691mr53663815ad.4.1783553660562;
        Wed, 08 Jul 2026 16:34:20 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1edb0sm33898515ad.53.2026.07.08.16.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:34:20 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 5/5] net: phy: mediatek: add calibration logic for AN7583
Date: Thu, 09 Jul 2026 00:31:00 +0800
Message-ID: <178355365385.113886.4040120167909619643@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260708102341.53919-6-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com> <20260708102341.53919-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_163421_245872_3047D903 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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

Hi Christian,

A few issues in an7583_phy_config_init():

1) Redundant double assignment of mdi_resister_type

    shared->mdi_resister_type = MDI_5R;

    shared->mdi_resister_type = MDI_5R;   /* duplicate */
    if (shared->mdi_resister_type == MDI_0R)
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
    if (shared->mdi_resister_type == MDI_5R)
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;

The first assignment is immediately overwritten by the second
identical one. Also the two `if` blocks should be `else if` --
currently both conditions are checked independently and the
MDI_0R branch is dead code (since the value is hardcoded to
MDI_5R).

If the intent is to default to MDI_5R and later read from SoC,
the structure should be:

    shared->mdi_resister_type = MDI_5R;  /* FIXME: read from SCU */
    if (shared->mdi_resister_type == MDI_0R)
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
    else
        shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;

2) Typo: mdi_resister_type -> mdi_resistor_type (same as patch 4/5)

Also the FIXME comment says "MDI Resister Type" -- should be
"Resistor Type".

3) Dependency on patch 4/5 probe fix

an7583_phy_config_init() uses shared->phydev_p0 which is set in
an7581_phy_probe(). If the probe function from patch 4/5 is not
fixed (missing shared = phy_package_get_priv(phydev)), this will
deref NULL/garbage:

    phydev_p0 = shared->phydev_p0;
    phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;

This highlights that patch 4/5's probe fix is a blocker for both
AN7581 and AN7583.

Best,
Wayen


