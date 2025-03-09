Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E577C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xr9jiNYViesUrh4gxT7ubexXKj2qyZPJvBCE9EhQwo0=; b=qA//ugNsjgF9T5UTuKSE3rTqg3
	Qzrs8fHkLSZ7Jwyt+M4L/3klVFQAsDvetTnJ4/BpsIXZWuXvF2BjIt+VsazG+L4ZD7sTaXO83iNlZ
	HlYMMP7wiN3iCqEtWn3UWmK9ek6adVKN3YeyTgKr3p+26pylvKT0VOaK/+nxu9zxL4jW0S2WoRCRv
	4HiPs9wUL4MZJ1YJBNQWLT3Y5bW6Lsi2YD2FB2Pr1kRUXu/CiDM1ZetnVSsFjjrD36eTpjX4tBQ/c
	8QhrK2rjgPO62ykDM3YZ1Ainv2A7u/Zoc/6FarCa3LMOuRVuS3u1CDXUrKknNCNg4nqdMja5Aijlt
	q1tvjQKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKr0-00000000tSB-0UmM;
	Sun, 09 Mar 2025 17:54:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKbL-00000000rdD-19in;
	Sun, 09 Mar 2025 17:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Xr9jiNYViesUrh4gxT7ubexXKj2qyZPJvBCE9EhQwo0=; b=ngAuCyQxlsuKc+xtJ9lbNDvm0D
	MWbn8PePEQzuZLqMjetoty7hX4GbapHjnCHn+7LqR8r0fTRcgvIdUXTtJIsK4pY//Sh2Tfhb43i53
	/EPCrd79Rrloj6EuZA4PFuYgb7QvKGY9zs8dJt9vIDlrdJUQ6/tEbALOF0MUWosuzqxI5mPDfCw7e
	Qz1UgrUdG7489UMANDALfjshiSqB8HHTEoS7dCnQ9G1oV5jr/TqlNkdtHDVPF0m98RV+v4VA5tveH
	EQbV8vlWewMeSQRA+kQTN13OsO4vlWCqWznNrECElbHfXkCt24xELakFKkTALYOsoWI0KPilGEMpz
	NU6B5KJg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57424)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1trKbA-0001Yq-2t;
	Sun, 09 Mar 2025 17:38:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1trKb8-0001ch-0h;
	Sun, 09 Mar 2025 17:37:58 +0000
Date: Sun, 9 Mar 2025 17:37:58 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v12 08/13] net: mdio: regmap: add OF support
Message-ID: <Z83R9qVfGbSc8bJs@shell.armlinux.org.uk>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
 <20250309172717.9067-9-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309172717.9067-9-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_103811_311858_7A3282B5 
X-CRM114-Status: UNSURE (   9.89  )
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

On Sun, Mar 09, 2025 at 06:26:53PM +0100, Christian Marangi wrote:
> Permit to pass the device node pointer to mdio regmap config and permit
> mdio registration with an OF node to support DT PHY probe.
> 
> With the device node pointer NULL, the normal mdio registration is used.

Should this be using a device node, or a fwnode?

It depends _why_ you're adding this, and you omit to state that in the
commit description (hint - it should say why!)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

