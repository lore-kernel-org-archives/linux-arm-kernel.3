Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E962ECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 13:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YP3nrzHNBPV4laVHmTWlcL0xqJ7r23M87T5OozmfTM=; b=HJj9nr5HsdYxu1uasX7ZIUBtdh
	FDYDtbX7imlcqvjP9GtjYONZ3FyocAmgdpKLF180StL2HJ+iQY2gJpBkRYH7Wr90wRjL54FApTQWT
	k/HQfDl1PtOyf8hRqyWBopTLO1/a9DKZSZfK2HNmDg14ZmeobYi4CiVfht1P8hWPq9JzmxMoKP+yv
	RuDWge3h74f9gb1aFuS8dv41y+MbV3lvmPqhptbSiTaNrsAxPeY/2wRetcBXN+6QUe2+EafrWLnwz
	OLLLmRDjhN/maIVF//CmZsSX5eZ2nxvRzANjD0HGSyHs116XImlg7HHyrRjnpGocCiJeD0Mkn7lt+
	mTCqxkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERHH-00000002Ujc-3Gyb;
	Wed, 07 Oct 2026 13:01:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERHF-00000002Uiq-16qD;
	Wed, 07 Oct 2026 13:01:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6YP3nrzHNBPV4laVHmTWlcL0xqJ7r23M87T5OozmfTM=; b=zU5ZvP25ND/Pnn0/1VuaJCdY08
	UffRk45r/0Ba3w0c/7bsl2unFhNjUeFg2U6bjfHSZQJ2YWsy5NRyJ0lHPQf/MGkB1x1tfw2JhHfqv
	A6/GJqeHG0rX5ehWSZOIH50Z9Nqq1h5uwQKXKf/XKsPTMyi4U8RPjpSiNQSlK+gCOSjw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xERGy-009SZ2-8w; Wed, 07 Oct 2026 15:01:28 +0200
Date: Wed, 7 Oct 2026 15:01:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
Message-ID: <d23dfdf3-5837-459f-afd6-6c198a05c13c@lunn.ch>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_060145_302388_054B09E9 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, Oct 07, 2026 at 09:26:20AM +0100, Lucas Tanure wrote:
> The T7 pairs a Synopsys gigabit MAC with the same glue registers the
> G12A has, but nothing described it. This adds the binding, the driver
> support and the device tree nodes, and enables the port on the Khadas
> VIM4.
> 
> Unlike the G12A, the controller reaches DRAM through a pipeline stage
> with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
> clk_disable_unused switches it off and transfers stop.
> 
> v2 changes the RGMII delays, after review. phy-mode describes the
> board, not which chip adds the delay, so this board is rgmii-id.
> dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
> properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
> transmit delay does not work here.

What is special about the RTL8211F?

     Andrew

