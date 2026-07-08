Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E44C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 23:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkrEjWV2T4kZn9l/EN1RfmTfNtrV7m8I3DpucB/PUhw=; b=yZMC3jnPwPUCD16B2JDRLBIBUf
	T6sDwd1L/mNwJ9Bgl06v1j20mju8KD4bvqkYSJ2UxLd33TXxev1w2wHgg/xt2MAfDSPy8xW/6+a1N
	LuTBIE5YIkLjb4oatoA2dqHT7YPm0+hP6sTEDgi1X1eB05zZGANtdPEVCzL0xoVmSayQHkYPRkh6o
	wl94Z9Kyg+YRp6kSRDimrXfkJZfhbNM9Nf6jmw8BRHj36tetGtrY2tC/pY74A5NP18fl5YFKOlvYf
	lVq3D7rT2ylhbG+fGmrAayXaUO9hgXNbKkYlXY6n5WxwSTfVBzZj5pyuxaSnzut3lbZw6Y/ie39jV
	7kF8q3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmP-00000000bGb-2GsT;
	Wed, 08 Jul 2026 23:34:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whbmN-00000000bFl-0Dyq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 23:34:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so8177225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783553650; x=1784158450; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkrEjWV2T4kZn9l/EN1RfmTfNtrV7m8I3DpucB/PUhw=;
        b=OcCRxX0joBcyMHCbkK8Sc9SIRhzsjP6bNAt5hn5xZkt4nq5CfNTYozzofPf0x5mQN2
         xWfckgzMM9rcb2bW3f/W+iIg6LZR4R0ZcoxW7qJHJW/HrYimKjdZYxKss4wYc9ZhGy1w
         gw322PK4YP2pOtnFVKgdEvxdkyKEtglwYhwFvOs/belHXs6q4WB2FCLAXgFwY8c73JPV
         yghVJhHusyggoAjbkj40U4/at56tO4fAnO5KoayQSyPD4dYc0UJh146TlLmBIey4g/OK
         GcxQmGH/+BcCtuRcKmqFR8iBUouafrvi9NLalX18u4d4Wv6oVOATP+vEnYbsoLLOxscJ
         D8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783553650; x=1784158450;
        h=references:in-reply-to:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tkrEjWV2T4kZn9l/EN1RfmTfNtrV7m8I3DpucB/PUhw=;
        b=Z/H+fLDoTLsZeQASQtlMQj6Usm9QYCVyfsMKn9TyQc7BNnIu1jleyT5Gna6ShSrgsh
         Fmw4v2DbJGlRgKtQ0HxkMx8T5RnrApSaMEZJaNjcYCSl6Q0prSxidaq9oRc12hx/BGCp
         f/5uX+vV5Mk27d9T6X/gGp/uA1Bx59IYtZyAKS1Taxcoed8l1k06Lzn0YhZWWonGjQyo
         7d70kSGZGBJS8GMJyMjWvot/Qg/i8pPzJlnt3+kzDo2CeHXsdpj9P30cVQoFI8+trWeH
         ikauhCMEbrR7TrY4MU5Cjfw61RhXWTEfAbRvdOeJzJbsUmY6oVRXUPMb7n29RRwnZGNG
         V/rQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPLDO6gn8KDO7rd4RbsdnlilxZ4UPWSqEomn2MZm7zZWz1CgntR/GrQJqGxkfskpCYgXITv5ScGKlKHjTmiV3g@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ5Mb7UtbvKKDN65AulH7+ULwizhqAEAzkLypoQ6TFmN+cIycR
	DthX2fmTrdxmd1LB/s55qUbXzVMU8AiVGADXioGt5lAk0M6KsePHau4p8Udsoi6pgy8=
X-Gm-Gg: AfdE7cnvMXw6vl2/GQ5jkPMPWWUiU43pe51PmsT6g1PfkIq4D17atl/g6Z5VwMaO8Wx
	eqqf1zhCNqFIleri/QNrA8u75PdkffSeqYhVFip+pRtddOeDiqrhWOHm+iwb3V5EJQyeAX6nl/j
	JDQpMO03rqR9NQ1rwKWNLpGmLnFeMdPboICkQiJRk8Zzrm2xO0wtz8EoqrFAglVru8CcCAGpqKu
	NGW6aMB6ruJRg2oZrVhO2BgvplZRiWAPnqyFO9grup+du/EZoUrRiEtD9TAxE/LOr/y4QJm0cvA
	yzTrLGhctNOv0eu6dlhdmpfAfuJnSrufp1KURLudPT7WJBoGNCGA8IkZMSmRkUrFfFG+s3lertT
	d9diN4CVRvfN8V3tPJIGGbJ9eRBb8q0FTUF+2GaJ8+Y5ONmgMwtFwKVQnf7XQ1m97PN2ElI45FK
	U2JIt73Q==
X-Received: by 2002:a17:902:d58b:b0:2ca:cb8a:f26b with SMTP id d9443c01a7336-2ccea348afamr45697605ad.10.1783553650075;
        Wed, 08 Jul 2026 16:34:10 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm34840455ad.15.2026.07.08.16.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 16:34:09 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/5] net: phy: mediatek: add calibration logic for AN7581
Date: Thu, 09 Jul 2026 00:30:00 +0800
Message-ID: <178355364330.113879.7307879640095189809@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260708102341.53919-5-ansuelsmth@gmail.com>
References: <20260708102341.53919-1-ansuelsmth@gmail.com> <20260708102341.53919-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_163411_120356_DDC524C9 
X-CRM114-Status: UNSURE (   9.99  )
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

Thanks for working on this. One critical bug found that will crash
on probe, plus a couple of minor issues.

1) Uninitialized shared pointer in an7581_phy_probe()

The local variable `shared` is declared but never assigned before
use:

    static int an7581_phy_probe(struct phy_device *phydev)
    {
        struct airoha_socphy_shared *shared;   /* not initialized */
        ...
        ret = devm_phy_package_join(&phydev->mdio.dev, phydev, 0,
                                    sizeof(struct airoha_socphy_shared));
        if (ret)
            return ret;

        ...
        if (phydev->mdio.addr == AIROHA_DEFAULT_PORT0_ADDR)
            shared->phydev_p0 = phydev;   /* writing to uninitialized pointer */

devm_phy_package_join() allocates the shared priv data internally
(accessible via phydev->shared->priv), but the local variable
`shared` itself is never populated. You need to call
phy_package_get_priv(phydev) after the join succeeds before
accessing any shared fields.

Fix:

    shared = phy_package_get_priv(phydev);

should be added right after devm_phy_package_join() succeeds.

Without this fix, the first PHY to probe (addr == 0x9) will crash,
and all subsequent PHYs' config_init will dereference an
uninitialized phydev_p0 in every calibration function.

2) Typo: mdi_resister_type -> mdi_resistor_type

The field name "resister" appears in multiple places (enum, struct
field, config_init, FIXME comments). It should be "resistor".
This will be baked into the ABI once merged so worth fixing now:

- enum airoha_mdi_resister_type -> airoha_mdi_resistor_type
- shared->mdi_resister_type -> shared->mdi_resistor_type
- FIXME comment: "MDI Resister Type" -> "MDI Resistor Type"

3) Observation: mdi_resister_type is always MDI_5R but tables have
   MDI_0R data

Currently the code hardcodes mdi_resister_type = MDI_5R, so the
MDI_0R entries in an7581_tx_amp_compensation_tbl[] are dead data.
The FIXME suggests this should be read from SCU registers
eventually. Consider adding the MDI_0R branch now (or at minimum
an else) so the code structure is ready when the SCU read is
implemented, and avoid shipping dead table data.

Best,
Wayen


