Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E5DCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyQuAg7wHg8xPlkwj5ueliqGmECn9lBdw6/y92GmRzc=; b=gsG/leWt0xh/HYiPZozxbM5Su+
	uihFVClRYDqwke8Ljmgy/jNX/bkTjdb9ceE1oZC49uuboy7TrNn+jZVSPqbquL88IRqe27DCx3pbK
	Kwky9x9B1tHqWsdJI930YMCa/NOgSDCjeb3trPRWYdBqaCTDp1YEqm+RRoO3ReRURyRLCYxY/LIqs
	bWmNklA9ASS+fPVVS/ss61pSaPfJogGO0Z3D1sHw7wUlgvN24h/l+hOr1S9g6MGLlJvICB8yag+OP
	rGd30Zg9mwV6AsCmu0KXjNiUREZ9p3dFVDl9z+xPxt/u+2PzOTVwZS8wd3KCxUg+e46loaHk2d0bw
	JQfLDHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u7-00000003Qe2-2QdW;
	Fri, 15 Aug 2025 20:19:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz5P-00000003F3T-1etG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 18:23:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wyQuAg7wHg8xPlkwj5ueliqGmECn9lBdw6/y92GmRzc=; b=BPxgbVcQjxdfH9qtnU5aaN9Shm
	JXIamtRhWOnjJQPh7xDyRXc6NstcGHk7f2sVihb5oGEM1uHpkD1P2nR7QHDuAs12FzwIaEEsBkbnu
	sBjATX3rnRVt6nmddGQ+4wxGrypRsqiIuCwW0EhaEwBru1z7DaofY7I2lRzh0h8jY4eAQ5DcVuhG5
	pwR9h+0UQwwOlQedP0r3yuA3xE8/wgCHeFTzXX/MNwoLHpo2BWj+lSPBeVNAfiUdaQMjClbI55k5O
	5oEDijjXCimS0VkcB3zyOQcm2/BXj1bfgWvaRD2jgheVWNYhfkHr2XfrL2NbJ7xF9zQSWT0LJ0I7l
	33IGeEfA==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz5M-0000000GnVn-1uZT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:23:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wyQuAg7wHg8xPlkwj5ueliqGmECn9lBdw6/y92GmRzc=; b=n/45N6OGRV3bCfvLHGn3LmHV8A
	re3KLppUfb3uwkIiPx0oJBx9dNZAOBkoKFNLc7hUyVoOnpnuZ2/CtqrsdMTaCaGSAyhGbfcoo0sY9
	p+7kT80BQe2dJCO3YnGoF66HMv1zgjCS4AlJE5FB/++t900OV+YgnCMRga4AkXxCkxbM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1umz54-004qod-Ok; Fri, 15 Aug 2025 20:23:10 +0200
Date: Fri, 15 Aug 2025 20:23:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	taoren@meta.com, bmc-sw2@aspeedtech.com
Subject: Re: [net-next v2 4/4] net: ftgmac100: Add RGMII delay configuration
 for AST2600
Message-ID: <d0948803-b1cb-4a8b-8c4d-55785d5ba39b@lunn.ch>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
 <20250813063301.338851-5-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813063301.338851-5-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_192328_658932_5CE45957 
X-CRM114-Status: GOOD (  14.56  )
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

On Wed, Aug 13, 2025 at 02:33:01PM +0800, Jacky Chou wrote:
> In AST2600, the RGMII delay is configured in SCU register.
> The MAC0/1 and the MAC2/3 on AST2600 have different delay unit with
> their delay chain.
> These MACs all have the 32 stage to configure delay chain.
>       |Delay Unit|Delay Stage|TX Edge Stage|RX Edge Stage|
> ------+----------+-----------+-------------+-------------+
> MAC0/1|     45 ps|        32 |           0 |           0 |
> ------+----------+-----------+-------------+-------------+
> MAC2/3|    250 ps|        32 |           0 |          26 |
> ------+----------+-----------+-------------+-------------+
> The RX edge stage of MAC2 and MAC3 are strating from 26.

strating? 

> +static void ftgmac100_set_internal_delay(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct regmap *scu;
> +	u32 rgmii_tx_delay;
> +	u32 rgmii_rx_delay;
> +	int dly_mask;
> +	int dly_reg;
> +	int id;
> +
> +	if (!(of_device_is_compatible(np, "aspeed,ast2600-mac01") ||
> +	      of_device_is_compatible(np, "aspeed,ast2600-mac23")))
> +		return;
> +
> +	/* If lack one of them, do not configure anything */
> +	if (of_property_read_u32(np, "tx-internal-delay-ps", &rgmii_tx_delay)) {
> +		dev_warn(&pdev->dev, "failed to get tx-internal-delay-ps\n");
> +		return;
> +	}
> +	if (of_property_read_u32(np, "rx-internal-delay-ps", &rgmii_rx_delay)) {
> +		dev_warn(&pdev->dev, "failed to get tx-internal-delay-ps\n");
> +		return;
> +	}

If these properties are required, but are missing, the DT blob is
broken. Please return -EINVAL, and fail the probe.

Please make all errors in this function due to a bad DT blob fatal.

	Andrew

