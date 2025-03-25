Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67501C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGHUOkRmM75AoqlPI+wmlqM8Nnh+3lIsz0SOfyjAGrs=; b=fnLwRuRqIHVgsJXRUZgZeo96r8
	+Qv0wYMX849EilEF/xvzBvX4yFQPmxrV7xCFldJ0UWYDtnSmSaKiDrkRHDQdcPjIqDrh6AAqaPbDH
	kZnzCddh2GA+q1w9SRwDRNbQurcWjRbcQ6CoLOhCJbky2s/+v5/9g5aKhamKyOAwtSwri0QQCQdoa
	ALCrxVfFOh4kqTmlxkjYz2l8pgaDNN0ALWuPsPv79S6r/LbLpHkVK2vsufACV3DP2+uUKbFZtJ8CO
	AeLr7nPFOm0Y9FrErVLsrfckjfb0npkcE76tgsom1vmOJ+VdGGu/QNiOKW6hUNvtO7vXexdMFjMX6
	kfx4H8QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBtW-000000073nV-2rHO;
	Tue, 25 Mar 2025 21:33:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBrn-000000073Xb-2Ttp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 21:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3A6461126;
	Tue, 25 Mar 2025 21:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1518EC4CEE9;
	Tue, 25 Mar 2025 21:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742938282;
	bh=nAFi6dgMBV3lJUJPu6iKA4YLItIVFO/go3V3AiJ3/Wo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tK0clAUZ2CpSENOT5//Ju4pTjOxtSmuMXIWYTtcKrpU+qkkubsZBWpAtUrHkoTgHf
	 bVfe/E5zaN1lgojpbK15qdxKGM2hDp5Zls7hypsqCcW/gHgq19NN1E+JpNNLDKmdOk
	 Ms2xm+CZWov5TwvUmfNovf4gjJIGUyFUjc873HFj64HBYrUeZCbOmEkL2D2JfkYy6d
	 I1J2gdek9bPfcFK3D2lsZFNThGY78RddH0bsjBX7S3HDyV8292orDEGlDA3WQBtZXs
	 hljEx4YmSq48bzfc8rngxLYX0GAmBhgjhkyy5AZ42mQ2rE/NCKgXmepn1Ehpchecru
	 FSRU1K/O5tISw==
Date: Tue, 25 Mar 2025 14:31:11 -0700
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
Subject: Re: [PATCH net-next v4 0/8] net: ethtool: Introduce ethnl dump
 helpers
Message-ID: <20250325143111.4a9e26c2@kernel.org>
In-Reply-To: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
References: <20250324104012.367366-1-maxime.chevallier@bootlin.com>
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

On Mon, 24 Mar 2025 11:40:02 +0100 Maxime Chevallier wrote:
> The patches 1 and 2 introduce the support for filtered DUMPs, where an
> ifindex/ifname can be passed in the request header for the DUMP
> operation. This is for when we want to dump everything a netdev
> supports, but without doing so for every single netdev. ethtool's
> "--show-phys ethX" option for example performs a filtered dump.
> 
> Patch 3 introduces 3 new ethnl ops : 
>  ->dump_start() to initialize a dump context
>  ->dump_one_dev(), that can be implemented per-command to dump  
>  everything on a given netdev
>  ->dump_done() to release the context  

Did you consider ignoring the RSS and focusing purely on PHYs?
The 3 callbacks are a bit generic, but we end up primarily
using them for PHY stuff. And the implementations still need 
to call ethnl_req_get_phydev() AFAICT

