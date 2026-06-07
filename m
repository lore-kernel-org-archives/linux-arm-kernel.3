Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15A4CD8C89
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 17:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xtDkA21NeZRaX1G4a6jGRcwZXTTpKAlx691TaVn4bs=; b=y1xukQUyKV1BKv+04O7ZCukpFm
	7eeRaQePBgHIEoP9P7cEfCWr4vCRpCdbYU0GkMvyvUhQ8SwHgfHR+tEtXrgKU1rGUnfLQmXJe+y0t
	i4rj883QS9LGQcFgbkZSMHAqp3Yg0IYPabDETdJmIVGjEXDupLlXAcpWoBWnLsMo3JLirmY8yawVP
	G+GeZ/z3ykn+9SbpZ3ydjrtp9Yl3D4rgBo/2P0ZqBjU7zdJgGDVKuX/ZfQ755jZ/qmi+yPvtiozg/
	yWJwrm0QFoqlGYqQ88nssZWUXindCblHShkOkTUU5MwO4LeAEkw3aLLv1xQhR/vHNizC+P97R8QDc
	1LdO0oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHbZ-00000002NND-2ijn;
	Sun, 07 Jun 2026 17:48:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWHbW-00000002NMu-484K
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 17:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2xtDkA21NeZRaX1G4a6jGRcwZXTTpKAlx691TaVn4bs=; b=PiWeJiep9JIlVFLuSrzn+fzmqk
	NctgIppNAiVpisjN2sQqaFgTZDzMFgGFvXPx3TMJWJtDhr20QqM4hIG4k7mmv81noHJ8T3KG03Z7v
	S4GAQiJ+shhLynijk3+hRPi0yuJ6jRi1kKcwBqFRng9db2ilr1XkZZWxRUbS2bokyHAg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wWHan-006UUN-T8; Sun, 07 Jun 2026 19:47:25 +0200
Date: Sun, 7 Jun 2026 19:47:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Alex Elder <elder@riscstar.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org,
	arnd@arndb.de, gregkh@linuxfoundation.org,
	Daniel Thompson <daniel@riscstar.com>, mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com, alexandre.torgue@foss.st.com, ast@kernel.org,
	boon.khai.ng@altera.com, chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	hkallweit1@gmail.com, inochiama@gmail.com, john.fastabend@gmail.com,
	julianbraha@gmail.com, livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com, me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
	rohan.g.thomas@altera.com, sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn, weishangjuan@eswincomputing.com,
	wens@kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 03/14] net: pcs: pcs-xpcs-regmap: support
 XPCS memory-mapped MDIO bus via regmap
Message-ID: <1ef2c525-e58e-4b1b-8150-4ff7d8b9a730@lunn.ch>
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-4-elder@riscstar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605010022.968612-4-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_104811_023382_7829684A 
X-CRM114-Status: UNSURE (   7.12  )
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

> +struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
> +					  const struct xpcs_regmap_config *config)
> +{
> +	static atomic_t id = ATOMIC_INIT(-1);

...

> +	snprintf(pxpcs->bus->id, MII_BUS_ID_SIZE,
> +		 "dwxpcs-%x", atomic_inc_return(&id));

dev_name(dev) should be unique, and it also makes it easier to
associate the PCS to the MAC when looking in /sys.

	Andrew

