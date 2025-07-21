Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A792C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHzpUiLN7Jg4Lz4KXx4NfLv+H9x1eSd9BwpY3gu+U20=; b=NOxCOPZ9qHG8UdfEIycX1Uv5yh
	sIqfQp+UzMOniuyzkXvkDCvXHvp6L26KMD8+NxAbbWVkhRWWuOfTFv8eAxNqA/a3QANGRc6tMIVho
	HVfyKgUQif/ObCicz3MMsLPRVK2t2YyDbUrR3VRXA7Y6+VZuM9TrwgXi8rsltwUBDo8TApZpoergC
	RkFmBuI+mEPLpYDoxLgGncKJ9HJT1Y5eTCNlhgkDUiIsp6H9caGQACHXcEZj3EJ4ywnWdD5OUM/kn
	As26ZooLhPcWn2t5losat4jqs3ihQYv8/XNv+Z/lFKPN+0x6T7PQGlq9pADNcJOjy//hksxGWpZ7j
	h8UAK5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtbD-00000000C20-1Rav;
	Mon, 21 Jul 2025 16:42:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrR1-0000000HVoi-0FhR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hHzpUiLN7Jg4Lz4KXx4NfLv+H9x1eSd9BwpY3gu+U20=; b=yuZy083TIKWJigFiyJMEIO7mEL
	CW77wF+9YJR9suubJ3/IY4OYuLkd52G6nptaS9fV7lW7Fj7Lkt1mA/V95X650ZAgj2wdFYvoe6Jh0
	UeN4rX/9MDUAAXnFyZW8Rr+OYnT+phRL+5FFl1AfFJOmVXjgQuyBgzO7I2Mkn/dgetuM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1udrQo-002Mif-LR; Mon, 21 Jul 2025 16:23:54 +0200
Date: Mon, 21 Jul 2025 16:23:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Tristram Ha <Tristram.Ha@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/4] net: phy: smsc: fix and improve WoL support
Message-ID: <a3b97fbd-8c4f-4657-aeca-732aee3782c3@lunn.ch>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-3-89d262812dba@foss.st.com>
 <cca8e9e6-a063-4e00-87af-f59ea926cce3@lunn.ch>
 <b95e3439-717b-4159-acf9-7ce76d1c43d4@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b95e3439-717b-4159-acf9-7ce76d1c43d4@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_072407_094735_5EC7FFBE 
X-CRM114-Status: UNSURE (   7.95  )
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

> I wanted to state clearly that the wake up happended because of a WoL
> event but sure, I understand that it's best if log isn't spammed. Do you
> prefer it completely removed or dev_info()->dev_dbg() ?

phydev_dbg() is fine.

	Andrew

