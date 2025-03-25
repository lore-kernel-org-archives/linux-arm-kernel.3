Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF5C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eor3PyjcjJdVgGion9iAlad6/v4xRcTAlRv7v4apa6c=; b=g77JRQDJoklLDUumSTFjpf8IiA
	FQopMlr2Fk59tDopEqZMmseMFRTGzp1jOztzt+wBv7THAkEDtsX5ZZf1nwjnZubtvCLtsEr+teefu
	UMgi1VlmmuSAwsdGOnthIVlbRVlM4gRiHj2tq5o+WQH+bQ63lfd1SMepfwPrzi0Xoc1sH25ZhEk+C
	mNs9XSF1SO4STgoPGdlcnxKzcZS7GFqKlS31125sXVXbnD8tXbanrKbnvUkZePTxtFCI8oeq3OqoE
	lXNFx46sULHS6Zq2ldKzS41WdV74hf7dQp6SxmgIcWyTBUDdACq/04PzU2ppk3p2Yujv+w0z47Pco
	WWcYiFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBfd-000000072iC-2rQ1;
	Tue, 25 Mar 2025 21:18:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBdB-000000072P0-3YUp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 21:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D428E6115E;
	Tue, 25 Mar 2025 21:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E31C4CEE4;
	Tue, 25 Mar 2025 21:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742937376;
	bh=eor3PyjcjJdVgGion9iAlad6/v4xRcTAlRv7v4apa6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hc0tfI6pqDq9Xprf6jGCFjnXRwkgWC2NAIqiRV3wtBhlAeHHZEcpea/AiCAImtZNb
	 kP0QSTnRbH4/rmcy/f9fTZpDze2TmZmsY8pWrfGlKU+H0kGapt4mqoD8MGZLaTfaBO
	 2Fy2/v0UdJ/ujsJcCCXJvNj2K6HqjhoebC/yI7Xirls0MD9MRgrafLKVTbGE0Y6WHD
	 u9LwYFLEmmayNqnVgPNWy+225SZvigw7PtbPJLxScq+vhcvKTVaH41J5XsQGKRdkYJ
	 SupwWpM0MJDTQim6al9YMSA83PJUEEHo71yVka1AkLsraB5PqqEEsTx8mARgZBWpHg
	 EsYjRKi2ruINw==
Date: Tue, 25 Mar 2025 14:16:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Oleksij Rempel
 <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>, Romain Gantois
 <romain.gantois@bootlin.com>, Piergiorgio Beruto
 <piergiorgio.beruto@gmail.com>
Subject: Re: [PATCH net-next v4 3/8] net: ethtool: netlink: Rename
 ethnl_default_dump_one
Message-ID: <20250325141605.684fc691@kernel.org>
In-Reply-To: <20250324104012.367366-4-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
	<20250324104012.367366-4-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 24 Mar 2025 11:40:05 +0100 Maxime Chevallier wrote:
> As we work on getting more objects out of a per-netdev DUMP, rename
> ethnl_default_dump_one() into ethnl_default_dump_one_dev(), making it
> explicit that this dumps everything for one netdev.

Maybe ethnl_default_dump_dev() ?

