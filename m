Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA6CC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 23:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=; b=Ei+dc3/nZVADmtMswmfsIjFQHl
	k/D7J8b368KnwyCKQo6qq63QTqqZnPefalc+eZIXueATmsFH2ZAFMzozftQoJf6reWMhUn4kwtCkS
	berq66DRR02hnFmlNjeKXZ6ehX3IXH0wgYaMJT4ubBKr/FXmV/xz4OQv3o4REFKQ2Z48Lh9Qxd6lj
	bjRzsm0U8kHQNHtkzQ5YJcy99cb/7FI50DQOni8vypQlKkrcpHUs+ruzuGpQaFmgzem56FkrS/9Lz
	dk5cFsGReeendEQO1ZB7qDRfV3PU/iwyHyRI3GHwf2pTxdYx9CYYaGuHcveBlI/1IF+71BXrZk8SW
	92fbIL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dHP-00000003T7r-3ZW5;
	Fri, 04 Sep 2026 23:25:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2dHL-00000003T76-2NYG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 23:25:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1571047f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 16:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788564300; x=1789169100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
        b=AGdsyMNZQjeD/tyYXB5mV898atjWZAa4MYexfSbg7pBc94O34tD48cPFpHmCdQ9czm
         VGUkZP2oPvphTswAv31B94joqcpHJOTO7OS3/M/E2cn+LopNrFwQ4BFsWmVNilKALxMU
         1lOzQofjBVi0honcwriUAbkRkBj2D6rk6DwhhZXqY9CPd47499kC32kXBiA9FQRP6Jzd
         +b1N3oc36YO6a87x+tqdoiy5pwY2g7L18Skqa24ZtCWm7aAnYgvkfGdZ6tO+RAzrb28A
         KFYOXRZ50IRnhPRErpWPq2DmKjOGFQoWnb//F4P0wJFHfUSMe0vnnGymaF323XZ3wIyb
         frDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564300; x=1789169100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
        b=M/0nJlHsULDSnczAvsY47BonGByJT+7IpOzuEWNLn45yk7FF2TMJQPumgDVdSaPlpr
         mxlpkgGbq83oBRJDld22cRW98IFgisslVJKAtvl5UYQPzi7QtgKJSpeyyhO4gc0c9q1s
         XrPDnYi7so7d7/9ULTDibNU70DUxgI/Pr2GaH5xO3xGcaunClSVShCdNkEjP1CJ9uKuB
         jPOZPSp8cyFBHYIhzgdHgHio+mscyjdFerm+VG9giy7QSa/SR4wP0qj+gVzRdiwNh7ve
         vYO7O4s2vHAImg6bJ+2zgX2knqwUmmoWKbXdH6NICuv8NBMlgyhPvT3AG8J2FyeCY6vx
         DX/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzy+DABQHIaQRhddCRtSvHGhvH0mH9+WQj5bhgVkZM1cQJq6pzPK3rVWkhlycpTuz5hjamG+2pTZHHQvdTuS90R@lists.infradead.org
X-Gm-Message-State: AFuF++nUdHpc3oizgaCZhDvk8/3JFtbQ9xnIMOY7ITOiJXdXgU7vw0lw
	NoUiFIMxBGzT029USy4pNtET3If+NvIr4pNGXQm66jD3H/URwPCj6X6DWBLib+WYrNY=
X-Gm-Gg: AYBFou2oDsBDoHiKP4VMsSSbd41ple6BLTTC4D6XtqJE9t+Vm0HOlHcopK+3iSfViB1
	T0+KGrE9cH7dL0dHFQX0Z4kQqW4UW18GsZ1GcX0mpPm5PrtXShDLkaeSZ3NhRFvR+k9BvFJbzIX
	u2oNl8q1Z6qc99KhD3O+6pHXBeHmNP9wRje/xhRy/XZsJNRkawhGJ7IIIvEspf91BaxjQsdZOuF
	r7Mbg0wj+ai+Y3tfEpiCpsNREZEhgMNqbooj89NgAQjI8Rr5Uk2n21NrBXgLu4vFfm8ibvJbN0k
	emT+JWFg0AG0P68+Xk5W7VcjnR15Alg3Uo5OTMOM9wShXDTUCpQyVIxwqAu+qEidE+p3+bqdBQm
	Ww7RcrEc0FVYUNKXMYJj7k+LT04vo2c33dnhq3UeovR6qGbqo3AgpYTTeUIydG+j4wPfWYlH6N7
	eHXyGIB1HMdjHDXmcJQ9ZwNFeo+HKVlegZKxyMTjU=
X-Received: by 2002:a05:6000:2508:b0:485:8c16:5ee5 with SMTP id ffacd0b85a97d-4858e8bd21dmr3475598f8f.31.1788564300124;
        Fri, 04 Sep 2026 16:25:00 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm461764f8f.5.2026.09.04.16.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:24:59 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v5 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Fri,  4 Sep 2026 23:24:54 +0000
Message-ID: <20260904232454.391138-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
References: <20260903123644.23800-1-f@lex.la> <20260903123644.23800-2-f@lex.la> <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_162503_613645_89BC0FBD 
X-CRM114-Status: GOOD (  11.86  )
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

On Sat, 5 Sep 2026 01:10:33 +0200, Aleksander Jan Bajkowski wrote:
> I'm a little confused by this patch. At the same time, there are patches
> floating around mailing list to disable EEE on the MT7530 PHY[1]. Does
> the EEE work, or is it broken?

Both, at different layers, and the two patches don't collide.

The MT7530 internal GE PHY really does have broken EEE, and Vladislav's
patch fixes that in the PHY driver where it belongs. Mine is on the MAC
side: since the phylink managed EEE conversion, lpi_interfaces was left
empty for every mt753x port, so phylink never saw the MAC as EEE capable
and ethtool answered "Not supported" everywhere, including on boards
whose PHY is fine.

They compose, and the PHY wins. phy_disable_eee() clears
eee_cfg.tx_lpi_enabled and fills eee_disabled_modes, phy.c:1027 builds
phydev->enable_tx_lpi from that flag, phylink copies it into
pl->phy_enable_tx_lpi at phylink.c:1997, and phylink_activate_lpi() is
gated on (pl->mac_supports_eee && pl->phy_enable_tx_lpi) at
phylink.c:1583. A PHY that disabled EEE keeps LPI off no matter what the
MAC declares.

So with both applied, boards with the broken MT7530 PHY stay EEE off
through the PHY driver, and boards with a working PHY get back the
ability to turn it on. Mine doesn't enable anything by itself, LPI stays
off until userspace asks.

