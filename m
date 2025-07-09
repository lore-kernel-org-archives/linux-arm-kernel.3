Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13774C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQ9HxQ4CL5cwBPjvKDpDZamXchNvQ4T7qK3P3nj85G8=; b=SctCokEmQ/rBJLgyMlWbCCXcpt
	7NPF1X0HNj0sdGVjWl8Ph0OcneJ0S1VvBzPhcni5d5WGJaplbUqCPpFk91FvQh+e/+BDJc9901Wt8
	+Mitks/idjF/qgRAx7Yrhgg2qR0b3XK0iZYicSvnS19tY+KD5qbs5C4zBt8/GibMeHrLE5olcVZ1v
	H71JCmSJT1TyC1fWkz9wmMemkGHMonKBX4BZm6RgU55cvECCMk1IZzh3H1lPCzOL5NXQ31+S4+jTC
	WuOxyFUjwOpwTCqC/0TYVN9BnR1BbZ1K+h5kXs+tdP5qO1tD7F92gb4fXoWvz1vEYXPSKwQ2V7PWx
	sGJ0jIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX31-00000009D98-0vGl;
	Wed, 09 Jul 2025 15:49:27 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUmO-00000008m2x-1mgp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hQ9HxQ4CL5cwBPjvKDpDZamXchNvQ4T7qK3P3nj85G8=; b=Fe0jgGsoitEJIzGGN64xp/8LbW
	PSANpYST+y4jFNuWxPL1FSw9Flcaw2JOQJMywR6O1NmbtVZaaIcBQ3wgcPIKZTgcvt2Dn424ws8lh
	9BeU8GQk5eVXBWpUMgiEqoUxiNo1BrJuW5CszAKN9N1V4/Fswlmq39ewio9vZF4N7ULg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZUmG-000waz-04; Wed, 09 Jul 2025 15:24:00 +0200
Date: Wed, 9 Jul 2025 15:23:59 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
	andrew@codeconstruct.com.au, mturquette@baylibre.com,
	sboyd@kernel.org, p.zabel@pengutronix.de, horms@kernel.org,
	jacob.e.keller@intel.com, u.kleine-koenig@baylibre.com,
	hkallweit1@gmail.com, BMC-SW@aspeedtech.com
Subject: Re: [net-next v4 4/4] net: ftgmac100: Add optional reset control for
 RMII mode on Aspeed SoCs
Message-ID: <3dee14d4-c8bd-4c27-b9b1-28b449510b84@lunn.ch>
References: <20250709070809.2560688-1-jacky_chou@aspeedtech.com>
 <20250709070809.2560688-5-jacky_chou@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709070809.2560688-5-jacky_chou@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_062408_460239_80274E87 
X-CRM114-Status: UNSURE (   9.73  )
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

On Wed, Jul 09, 2025 at 03:08:09PM +0800, Jacky Chou wrote:
> On Aspeed SoCs, the internal MAC reset is insufficient to fully reset the
> RMII interface; only the SoC-level reset line can properly reset the RMII
> logic. This patch adds support for an optional "resets" property in the
> device tree, allowing the driver to assert and deassert the SoC reset line
> when operating in RMII mode. This ensures the MAC and RMII interface are
> correctly reset and initialized.
> 
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

