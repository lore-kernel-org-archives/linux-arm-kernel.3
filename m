Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E92EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 20:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJYAIMEVJz+yW04sHbC+x6poPPKdkOrpT40M7nAfvO0=; b=aZylZRw40EpQXbXaPCrHdxImiu
	kGgJYcKSGbhx+BWEd09nlQU8SFKhgXbdCZe5HcztS2woXOhX2MBc9T5K9ukE1jMdMb+ZHwe/ci0MC
	YbOROEg6qZU1/Ph0mYMvWjm727q41MxtXHOqrBsWRbTwJYERSoxjUtAL8UrAJJJ8aT9dFsWwgIAZb
	qBe6MA1lZQLTJzolCF9s8abFkQ1joXcFSuoDzxYJAPpMkwMLqHhzwkl4j5xwDAF9DKtO/474ClTBl
	GhxinSrekfVZLoVYk2A1+9bE+VehprDUZvT62GZXAbfKHH+YMPghisLzzZlZBBz0FnRMA47bUPQSC
	iLNJZ6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgtL-00000004m8d-3adY;
	Thu, 27 Aug 2026 20:40:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgtK-00000004m8T-3bRP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 20:40:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CAF41601EF;
	Thu, 27 Aug 2026 20:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2CD1F000E9;
	Thu, 27 Aug 2026 20:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787863205;
	bh=gJYAIMEVJz+yW04sHbC+x6poPPKdkOrpT40M7nAfvO0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hDIx0HSTZn5+n8AyY8RtGNrP0jx08HYrijnX172FcdXu1N9kIsX5vmfZ30QdR1XOR
	 aeA/ndyYcWs5VYTfuKOlMayCm7+5wZ2fhN3X8bAgpDpnANvl6r6GpBJXwEuI0TaWDg
	 h8H+wQiGmXAZUP69YJW8e+4zZcdVgkLunwJq3/Z/MqllXgsgYLJ9Cc2Xz40t1eH/VY
	 CA96NPrWkXW2xQ5xt8f/fPGTUS7wBlMmhKDfUOUt6mD0EMh/YTz4l0OpFAzas7EBxS
	 i2pVI+OeLWGYdRcK1k6uqv3lnGk0lD4aliurLbMQYOTkCTK2T2JPz8G552qS7Okrqb
	 c03mohZFs6ZsA==
Date: Thu, 27 Aug 2026 13:40:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous
 <jan.petrous@oss.nxp.com>, Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net 0/6] net: stmmac: More selftest related fixes
Message-ID: <20260827134004.45ffb57e@kernel.org>
In-Reply-To: <5ad6cfc0-94df-4528-b2af-8a190c1eee7a@bootlin.com>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
	<20260827105312.34f58822@kernel.org>
	<5ad6cfc0-94df-4528-b2af-8a190c1eee7a@bootlin.com>
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

On Thu, 27 Aug 2026 22:16:18 +0200 Maxime Chevallier wrote:
> The main thing AI points points about the UC filter is "but won't we hit UC
> promisc sooner ?" and the answer is yes absolutely, but it's the right thing
> to do.

Indeed, that false-positive one was very disappointing to see :/
High severity when it's obviously the intent of the patch.
Or maybe the AI knows something we don't know :D

