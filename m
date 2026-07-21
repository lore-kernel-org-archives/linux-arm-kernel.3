Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CF1C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5qM9chBCdVYWvuZvuUKvIvKfuTex0gYLfS3OQl7ilc=; b=B8/wTLFLXcsrmC7xM3u0u/1cEk
	T1pe5/DwsiMiYJWW/vKchIKfbMxOXJWtVRGKxGi+DjYrgaHqEdx9k/B+lFQ4Bw/yGtueESs0ZXxu0
	d86RnT04V7zWDE2tcF6ZDdbwIQpi6kdQcV2j6ojGHFKax08QM/KTAbEFjPUZWKXpe8E4RFCcL1Z0m
	szevxcogPSEnzHa/eXTsfShVFYDOZcg7GJdRCcf0zYf7RwlzFQGqOhiVJf9ypSLRC6kyuR+tBeYeI
	PH+o7G6MYr+THrZkkkRb8Hn9LW3zpD27BavoiybSTrGCjrONZ7j2pwxgB7e8kPG7O1lGSDzSmxdbS
	HHrDdwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDYQ-00000009y6X-2qLB;
	Tue, 21 Jul 2026 16:42:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDYP-00000009y6N-2T5E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:42:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D976600D8;
	Tue, 21 Jul 2026 16:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC0F1F000E9;
	Tue, 21 Jul 2026 16:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784652167;
	bh=B5qM9chBCdVYWvuZvuUKvIvKfuTex0gYLfS3OQl7ilc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bEr+lfzHr9tBe8KVs+4dUMAA8Y8DzbSXuACDc+80BtqwzrrEkkvDysl32+0Ne2qSc
	 sCPcQrw6uC3ltYQ+72SZrlCKOAlqk38JGmlHfNCbXhuHfpFilXI6zRmfiKkAtGi9/T
	 7R4qZsppur1nLm7j0nLgidKDJNCoKsR8dFWRf6uP2cIZ2b+IcP50AIb59Hw3EVdBJV
	 d15Uge/sHXdAqkU23jfioEhGDN6fGYaJlCsvXNUPqv9CMMD7SABn1RfTVHFniRRIEt
	 6PjfNWVVx8a8gCKjFCT1BmgHlr4HBmCJXyd0SxvSDlzj/+FmFwcYQTx3OC6MjFI4H/
	 BwqjmhFtTEWAQ==
Date: Tue, 21 Jul 2026 09:42:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Russell King
 <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com, Alexis
 =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
Message-ID: <20260721094245.1b6aab2d@kernel.org>
In-Reply-To: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
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

On Sat, 18 Jul 2026 16:38:47 +0200 Maxime Chevallier wrote:
> Now that timestamping is controlled through an NDO, we can simply
> call phylink_mii_ioctl() to handle ioctls.
> 
> The only functional difference is that phylink_mii_ioctl() ->
> phy_mii_ioctl() can handle SIOCSHWTSTAMP, but this no longer happens
> as this ioctl is not longer dispatched to the ndo_eth_ioctl().

To double check - the discussion is orthogonal and this patch can be
applied as is?

