Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A424C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49PNsauquX8wMlouSPg41oQrEyzbn2o9ESy9LrutxnU=; b=kBG69oRrwtj+RGLnGwZq3Qd+xl
	Ec7LzMCOMnmEqPhJz00h4gidkLUkSgRNTqmaPixlNH76sqiilAUu+frs00VqAtDfjDuw8Xt/+WcJJ
	apNP/PfL6CVIp3v0B5A2B/u/38a5NYlYlyjKoPFaxO6r4tcyZKNXFbDGnWiRQj6GA35x1Z0Zb9bNi
	3dpHmFIjNcZ7+onj5qUqT8gAhQ5jfG4Bha1B94zoptoLdzVtvG+jDMXc4KmZcozXkmSNDDCVzbe+r
	YSx9fAlDGFfInubSDD1fs5tVrEPYahpNlIgk4crwaAR6LrQGiiItd5hnAOgEMAC8UuKtpXjRkSQkm
	Jw0pOdiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHv-00000004WCi-0cKD;
	Thu, 27 Aug 2026 17:53:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHr-00000004W7y-0x5T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:53:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DC6C601F6;
	Thu, 27 Aug 2026 17:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0931F00A3A;
	Thu, 27 Aug 2026 17:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787853194;
	bh=49PNsauquX8wMlouSPg41oQrEyzbn2o9ESy9LrutxnU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=IBuOm2+RVm3gN++lGHOOW+T6SvNEh9YGn5NjoND97UYf1JjSJYJy1WU7+M39wvF0c
	 mlPRSatDFWc6/2Lj+NB6Ersf8zaFSjk45NHCltx95lizUNBAsco6h2ctm6IgvN/FWW
	 wPeggda1opgBd3Wj4KZzkA8RRU+9zcBqSDvNfPoCKy0QRItyGseNvtz0nvd4QMMXjs
	 sgvpAXkOc02/jTfUUQyG3GICtOtXLoY5h19oaeI94NRqYkHfzzvrhGKgfEIYu8O5nE
	 hWZe1ldM0PrfAwzo8kpgg5+9sLxnG3iQe07BdhSFBIVD+F4aJiMU9J/ho7+mRibStK
	 U+F+47AOiuHBw==
Date: Thu, 27 Aug 2026 10:53:12 -0700
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
Message-ID: <20260827105312.34f58822@kernel.org>
In-Reply-To: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
References: <20260826140500.616466-1-maxime.chevallier@bootlin.com>
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

On Wed, 26 Aug 2026 16:04:52 +0200 Maxime Chevallier wrote:
> This series addresses some (but not all) issues found while running the
> ethtool selftest on various stmmac platforms. As a reminder, ethtool
> selftest are run with 'ethtool -t ethX', and for stmmac the goal is to test
> hardware features and bugs from the IP integration in the platform.

LGTM, please double check if any of the Clashiko complaints are
worthwhile, and if so - follow up:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260826140500.616466-2-maxime.chevallier@bootlin.com

