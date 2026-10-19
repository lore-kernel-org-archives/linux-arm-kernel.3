Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4026606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JV63+S0v;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FD861fDb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYa8dnTvUVmkNxFv7StTWYj3kgHUq3JoGbZV2fZG/0o=; b=JV63+S0vCDW4n3GUl4PGquD7Rg
	8Zt4wiBHyWBV3sL28dWNQ7N8jHcUctBseLLeB6cwnw4N6+V7Dn6nxu1rPZYFOFL0TApe8WCkakeu5
	tv8WDk99+jZ9AiBR2NJzWHVFtzTixrlLylb5Q09pNbV0BVv8ysGmB6HUKew+JPrwEL2KJsjKrzg8U
	AnCuBfOrPxc+Io4AI7s4/272VDBdxklWPHG7nrTPzzSRK2E7/vBWmHB/58dp2Dk5DLDmVvaRFk+NR
	7NUdHJlEL2zZQLdyM1bgkT/Bsg/hHVN6mBN/E6wQePgSwq4RHeqMuMnB7K1sI0y+AUUOmlgRtdUva
	4Q6PhB8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIx0H-00000008YDq-0uXf;
	Mon, 19 Oct 2026 23:42:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIx0F-00000008YDW-0xE9;
	Mon, 19 Oct 2026 23:42:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57A1F60098;
	Mon, 19 Oct 2026 23:42:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581C81F000C6;
	Mon, 19 Oct 2026 23:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792453370;
	bh=FYa8dnTvUVmkNxFv7StTWYj3kgHUq3JoGbZV2fZG/0o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FD861fDbm8GtaxjHtgQ5PMUOMr0YwWlb/t/5/S/OJfxB1zoGoLnAOCSdf2VnLyN0i
	 oparZiRwQHeuDBkTg9qh7DJBucW1pK2jk/Y6yHptT2FBLiWRkE+30t6Y3bbecYI0U7
	 2q76LTQGsJzDLloZ4LlmamzH5ftVhdiklYJvyp9A4nxStdHqgzInDItodWnDNU4iBi
	 cNsnQ9qnfxgvzJjQjDJn0sGiSlZzvZqFcqBmtonx9CVxCf8o0tY1sXV9UOIVe0ittp
	 VIVDG3cwaXFvM2TaS0xe2MM2PhSyxGcAEAlLghSCuUmXaVCanYNjJGIEbJ1PitP5Id
	 HtwOfdN3Tt52A==
Date: Mon, 19 Oct 2026 16:42:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle
 <daniel@makrotopia.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell
 King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>, Joris
 Vaisvila <joey@tinyisr.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
Message-ID: <20261019164248.037971c8@kernel.org>
In-Reply-To: <20261009161102.38961-5-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
	<20261009161102.38961-5-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri,  9 Oct 2026 18:10:49 +0200 Christian Marangi wrote:
>  drivers/mfd/Kconfig         |  14 +
>  drivers/mfd/Makefile        |   1 +
>  drivers/mfd/airoha-an8855.c | 579 ++++++++++++++++++++++++++++++++++++

You didn't explain why the MFD is needed and more importantly what
merging path you expect. We need an ack from Lee, at the very least.
Given the merge window has already started I don't think we can
do the necessary dance in time.
-- 
pw-bot: defer

