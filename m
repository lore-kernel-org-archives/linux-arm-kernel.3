Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD843C5AC80
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cko3zHK3AZ44CP9iv+bawq/dcdWlNtCNj2kBh7j6SUc=; b=m5S+0PfESXeGDztWOC4XRp/BUc
	hIr13kxr2Rl74KT7UWFa8JP2k6h0T6sUW1kQKkPs6z64JtNZHBaGLJfbrp3skXyeJA1vxV/h6N1ts
	hrU7QK3YfIxRQG1jlxNS8lClzU1BMLwG2nKsA6EtUYuNNC5SNhhJ8BYZhTyOv3jWkITKari/uqTTQ
	gVbZVJLu5Z2WZiQLClTd4neE1mD/U9LzIJrZ/4APu1/kFXhD9/AbxYU8F+4r9y3/NV3STscgOZlYe
	hmuRdAYqkA9Zv/52/bzBMwndrro1bYuShPM5JYVs3504uZ3mCW/PfbhKI3zMWdvTxhKTeqsupzudI
	/kaDeO0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt21D-0000000AG8X-1RwB;
	Sun, 09 Aug 2026 11:48:43 +0000
Received: from m101-out-mua-6.websupport.se ([109.235.175.106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt21A-0000000AG4T-2jkV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 11:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1786275984;
	bh=Cko3zHK3AZ44CP9iv+bawq/dcdWlNtCNj2kBh7j6SUc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jtEcCMM8dze1O2lHaItcxTfsrT3zJ50rtcdIQPjgCHN0yx10+VdlMvSuZayxbOTUq
	 bFebBddWlbbVp6MERktEFtiU6L2muwqRqLEa0feAg5mWdxlq3ovorobf6/SJqAjvsw
	 h4ZFP3blh8gHCV6+CM2jcRj5xvLUqgK12KZ4/7upyXtpWaorMMlN0fKjWdrws+2seL
	 pwl+pOJrbZKcOBoVrpF0ri5o1U6CjO2J3LB0ecnTorxJCywxho3BtsX9g71rmIDOYk
	 aON7B4BljLnfPWGXe3W/xJs/VG34WS1yZDnm4Ubv6WxJxBxVhWjAXzBvmu8sSRZMY9
	 naxwCBxkD9R/g==
Received: from m101-u6-ing.websupport.se (unknown [10.30.6.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4hHx1D4s79z1pGK;
	Sun,  9 Aug 2026 13:46:24 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u6-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from rpi (unknown [193.180.91.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u6-ing.websupport.se (Postfix) with ESMTPSA id 4hHx182yG3z39Jw;
	Sun,  9 Aug 2026 13:46:20 +0200 (CEST)
Date: Sun, 9 Aug 2026 13:46:07 +0200
From: Per Larsson <per@palvencia.se>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Liu
 Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
Message-ID: <20260809134607.65d66069@rpi>
In-Reply-To: <20260803101452.2993721-7-andre.przywara@arm.com>
References: <20260803101452.2993721-1-andre.przywara@arm.com>
	<20260803101452.2993721-7-andre.przywara@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Out-Spamd-Result: default: False [1.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com];
	TAGGED_RCPT(0.00)[netdev,dt];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	RCPT_COUNT_TWELVE(0.00)[19];
	BAYES_HAM(0.00)[50.10%];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,sholland.org,armlinux.org.uk,outlook.com,vger.kernel.org,lists.linux.dev,lists.infradead.org]
X-Out-Rspamd-Queue-Id: 4hHx182yG3z39Jw
X-Out-Rspamd-Server: m101-rspamd-out-5
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 613
X-purgate-ID: 155908::1786275984-BC6051C6-6F571976/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_044840_882994_C6CD1D10 
X-CRM114-Status: UNSURE (   8.29  )
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

On Mon,  3 Aug 2026 12:14:52 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

>  
> +&mdio1 {
> +	ext_rgmii_phy: ethernet-phy@1 {
> +		compatible = "ethernet-phy-id7b74.4411";
> +		reg = <1>;
> +		clocks = <&ccu CLK_EMAC1_25M>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&ephy_25m_pin>;

This should be &ephy1_25m_pin, right?

> +		reset-gpios = <&pio 9 16 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <150000>;
> +	};
> +};
> +
>  &mmc0 {
>  	vmmc-supply = <&reg_vcc3v3>;
>  	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /*
> PF6 */


