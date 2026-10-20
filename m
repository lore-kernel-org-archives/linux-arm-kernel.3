Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C738606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWf7apeK;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F3cYEAdH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEaIpVDMpEjiAIF56in2S6IKYHB7HBFZdWcGocjQkD0=; b=OWf7apeKzYYWo5Cuk4U8b3lbOr
	F7Mtpx59JJHx7ukbigOxezRWNy010S9NxCKGk42VKrsQxutdQGWRBOFoYxsody+N2hA2H7chNYBzO
	SxzjnwfCzS9J7zV2cts9l5WZ9hrfiHwmktpXOjfQGhfYyTB0OZmRTfhnqRDis2wMdTMpUpZfLFxt3
	f+0FP+A6wMmaVRfYyLINoNzxFlJA3UrVRuqEfKo5uxJ60mNINWw41TD263s+sktHQO+fVHpyw/wxB
	RIiY1s7IrhFLwsIc+Xb2Rvaoo4nGPo6KIUHjWALXyzDfGoF4qgXVBITmuAodvkuh54qWBnDmqoS+S
	xfYfq5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3vf-00000008z3p-3Gwu;
	Tue, 20 Oct 2026 07:06:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3vd-00000008z3b-2tc4;
	Tue, 20 Oct 2026 07:06:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94A6B60098;
	Tue, 20 Oct 2026 07:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F7F1F000C4;
	Tue, 20 Oct 2026 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792479991;
	bh=UEaIpVDMpEjiAIF56in2S6IKYHB7HBFZdWcGocjQkD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F3cYEAdHeZswP2tA7SCBbjmk+czWVCQ2y5EVu3O4kt3xV88xmTaizmIWlyqHHozMe
	 FQ+GGHsl79NoONOgZvmc6X6WrskIAJc3bg/nNIRqd5Pe9tXVCZYFpQC5AHHRWWkPge
	 X57jLSoQtE/X2zZ3dd5T6k2F72OSliREGhehzqChAZwRt70gvpLwMT80FLsWp6+2vf
	 vizMu/4/0X+C/7PnzO3SaDz/3/U5GcU/Ye7gam45j0fhusd0qzHoSFBlZp8TFzblmd
	 QtPhp3PayuTnma5v15JhnevVUqHOEGDNmm9ZHRSP2vJyeWBa2g8zJmKn1UoD3ZpZA3
	 nw9tbqw1l57+g==
Date: Tue, 20 Oct 2026 08:06:22 +0100
From: Lee Jones <lee@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>, Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v25 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch
Message-ID: <20261020070622.GB1206986@google.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-5-ansuelsmth@gmail.com>
 <20261019164248.037971c8@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019164248.037971c8@kernel.org>
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

On Mon, 19 Oct 2026, Jakub Kicinski wrote:

> On Fri,  9 Oct 2026 18:10:49 +0200 Christian Marangi wrote:
> >  drivers/mfd/Kconfig         |  14 +
> >  drivers/mfd/Makefile        |   1 +
> >  drivers/mfd/airoha-an8855.c | 579 ++++++++++++++++++++++++++++++++++++
> 
> You didn't explain why the MFD is needed and more importantly what
> merging path you expect. We need an ack from Lee, at the very least.
> Given the merge window has already started I don't think we can
> do the necessary dance in time.

This patch is orthogonal.  No need for a mass-merge.

I plan to queue this for v7.5.

-- 
Lee Jones

