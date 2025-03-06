Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04A8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 02:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKLvEuTiVxI8xYqmlOoOvu1y3DL0CNtKqe5Ki+KcoZ8=; b=wRBUhXYSP/hYL1hSsqJ8mukE0M
	A5eFCTHjJroGurk3YcIOOWaCWDPavob0RVUv9uQsXFG7ojYfhPcTO7lU3fw/iCsDsCriV8c0l8/xF
	1Y3K++aIfNnpb3iUOD4b3n1N340WM2vO1XZgr9jHmMEWNzDqsaf8v39rlbZNoKeRORXZCexlWEG/s
	Fz4Um0nyBT1kJqiDcRvYhSDQazgysTqpO5szXgizo6GA/5JQ4clhThIVkce6l+3m2BZZY/Kkc1jV/
	n0JKG1RbQje44gnu9ibJa6FnljWhpoqtTDJRyBfwf5n/4/ksToMZPYfKyYieaFUIYC4R7z6Xl/tP6
	z55+dMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1K3-00000009sqo-1Nvd;
	Thu, 06 Mar 2025 02:50:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1H6-00000009sXI-2Chr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 02:47:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B2895C6C24;
	Thu,  6 Mar 2025 02:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F7EC4CED1;
	Thu,  6 Mar 2025 02:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741229271;
	bh=xKLvEuTiVxI8xYqmlOoOvu1y3DL0CNtKqe5Ki+KcoZ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oP1HEeN29Mtk/lLYprOLObdtx7M0mbOaMpc7d4RzXBSReiw8+G9lSYSQVdgEnf567
	 6jOFoc4j3gffEyqnl5A9xNd8FlkXDAaDHPFW9bry9lsjBPcE3IS9yRw0bDFKMNuV5z
	 xpEJnwLYIPM5jVxy2NyP7KG8+ano/bB3ILbXf7p+0P7NwGbBo0VTbAwXyweqyzXX/2
	 VTlXl1s/jAXRjgj/50xW7FQzng2IQBygy93KNRATuW3swTyTLHdwdhIv+n5lmCn4LO
	 lSqRoFJxT3PveOZTirJpvdV9k4A9iilpkFqCFLHNNLswkT0E/sX2Hb2fwUgTRs2SvN
	 ZFkdrBXrirQ8A==
Date: Wed, 5 Mar 2025 18:47:49 -0800
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
 <piergiorgio.beruto@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH net-next 0/7] net: ethtool: Introduce ethnl dump helpers
Message-ID: <20250305184749.5519e7a9@kernel.org>
In-Reply-To: <20250305180252.5a0ceb86@fedora.home>
References: <20250305141938.319282-1-maxime.chevallier@bootlin.com>
	<20250305180252.5a0ceb86@fedora.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_184752_619360_0E93D797 
X-CRM114-Status: UNSURE (   7.40  )
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

On Wed, 5 Mar 2025 18:02:52 +0100 Maxime Chevallier wrote:
> This series will very likely conflict with Stanislav's netdev lock
> work [2], I'll of course be happy to rebase should it get merged :)

Also this doesn't build. Please hold off on reposting for a couple of
days - because of the large conflict radius the previous few revisions
of the locking series haven't even gotten into the selftest CI queue :(

