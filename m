Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D81CA0EEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFEat3zirg8C2/2oLxu6X/ZdyOC05vJhFKTQnZhl0cg=; b=FRGdVLyqFgJ9qEm6ycWrC8Q7wh
	e1n7X3pAcu7Idu4/qpXAyBWWliTIrH3rR2Gw3ECY3ir/2Gf5FwR1KixL6tzQbopV5QEIdTVIRnuKt
	tZ1ndcbGcfqjfsT5qYV4a2G+JrAoysBcsFLLDxX0L4VYNC2bCgO47D5WTUuc6bK6ux6fn2j1FJZy5
	dOk+ffYqIfDQV0wP16xoRT0tOD2py0maA4fqHnIU/w3o8y4b+XunhDl3pNftREbIt615nRmdCrhgh
	lUAuz7W0/qtdiDO2JR7m3hB/ZrYqqg4Amo/vJrdr5vwF7BAPlCL4ns2d3p146ToYSfilMIWMIJ3ZW
	lgTTf2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u9-00000003Qgt-2gyE;
	Fri, 15 Aug 2025 20:20:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umzO7-00000003Gni-1lbJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 18:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NFEat3zirg8C2/2oLxu6X/ZdyOC05vJhFKTQnZhl0cg=; b=GTeAPr8gn7YNZKVQbSxG+bF1QA
	CtBH83Hd9XObTUvCNk45wDj5dQNcibQ7ra2s4ipaVsEQqMj7iguXuby5CTgruIH7T60llxk4xKsQ5
	+Nh+55C3QG53q0Kaj2eiMYJmqtcEyE5S+tvSg6m7oWR4pTBfDE7tNVHxQKRDffL+EBxI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1umzNj-004qvW-Bo; Fri, 15 Aug 2025 20:42:27 +0200
Date: Fri, 15 Aug 2025 20:42:27 +0200
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
Subject: Re: [net-next v2 0/4] Add AST2600 RGMII delay into ftgmac100
Message-ID: <a9ef3c51-fe35-4949-a041-81af59314522@lunn.ch>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_114251_457999_C7BB359A 
X-CRM114-Status: GOOD (  10.29  )
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

On Wed, Aug 13, 2025 at 02:32:57PM +0800, Jacky Chou wrote:
> This patch series adds support for configuring RGMII internal delays for the 
> Aspeed AST2600 FTGMAC100 Ethernet MACs.

So i think you are doing things in the wrong order. You first need to
sort out the mess of most, if not all, AST2600 have the wrong
phy-mode, because the RGMII delay configuration is hidden, and set
wrongly.

Please fix that first.

Then consider how you can add fine tuning of the delays. Maybe that
needs to wait for AST2700.

	Andrew

