Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DD8CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIElx5qF61apSsdG1Fx3DhG/2w7M7nxVDbU41a9FSDY=; b=t13lps2r1pvakuUA5O/J07yTXM
	lPrWqDmSTx2TzjhliIuL9NwpmwfxZAP7Fyr9Xk+Tax8JyTH3ToYhgovrCdy9DQV5clFnWQdMlRAyR
	o0MSqVI32VfxHglZIvFiwv4Zhsi/fF1uTuhH3qsuV36wJleX7SFYFPpVkq2k24v19bmfKJL8jnBcj
	3frcCp/zB1C7nydfjxfCsiKVU3xN4ZVCdgA9N+4Z5k4S7rUOPe50PKUvREx6nJa9BerDKaVq1qIhz
	s243S1QqfjLRzvHnvGO8mRT6m3UKab/QGCLqn6Nohx1ar3o6jcI1efR7liMXFufjiHxDOXDygnFTe
	JJJdRJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlef-000000033Bd-3XzC;
	Mon, 08 Sep 2025 23:52:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvemI-00000000lLz-1war
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LIElx5qF61apSsdG1Fx3DhG/2w7M7nxVDbU41a9FSDY=; b=W9Mo7MdWsP4e5bRYUNvEvzYlUn
	xImUsquQ2nZLKTBnAY/64ACPI0qwoUi3eMvFHmcmUa0LhS4UAboIMfE5tRfu83zkyk6nGuY0SFQEm
	zAxaBzN+3YSn8ROG2FLsbNvkyqHsqDtFMx/YTw2ph+xGD2q+MS1i60MCU1MJHUcHKgrY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvem9-007glG-Vj; Mon, 08 Sep 2025 18:31:29 +0200
Date: Mon, 8 Sep 2025 18:31:29 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: netdev@vger.kernel.org, Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv2 net-next 2/2] net: thunder_bgx: use OF loop instead of
 fwnode
Message-ID: <002d8e1a-ca2e-41e7-8751-429c2ee728c3@lunn.ch>
References: <20250904213228.8866-1-rosenp@gmail.com>
 <20250904213228.8866-3-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904213228.8866-3-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093138_500953_9AA1840C 
X-CRM114-Status: GOOD (  10.45  )
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

On Thu, Sep 04, 2025 at 02:32:28PM -0700, Rosen Penev wrote:
> This is implemented under CONFIG_OF_MDIO, which already assumes an OF
> node.

I'm not sure that is correct.

bgx_probe() -> bgx_init_phy() -> bgx_init_of_phy()

static int bgx_init_phy(struct bgx *bgx)
{
	if (!acpi_disabled)
		return bgx_init_acpi_phy(bgx);

	return bgx_init_of_phy(bgx);
}

There is no check made to see if this is an ACPI node and so
bgx_init_acpi_phy() is called. So it might be an ACPI node is passed
to bgx_init_of_phy().

How have you tested this code? On an ACPI machine, or only a DT
machine?

	Andrew

