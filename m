Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB77E6F093
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 15:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nWa55Zy0YjQ9bYLcQ0PXja+bu+wWwbxqB7f6rsKRso=; b=sCBr7Q4Nh7UK5pVZFVaL/2FdjI
	DtxqU9XjpevX3EQbafGySWCa40H9T9M3E7HE6IwdyTXYjDu3MkeaL+xqgbDl0qtb5Wsv0FzIQeTVb
	eb+yZTxa4/JvG5bkdi/wcAS/abMYqRZ5YVHv4zG2Ue7FZEkh2CD/SYqZkvRkChWJ1c+0XIPpzXF0h
	/B1dRYBHwTDWScSpi0zkfT9LUJzLO24uRvAynKzA9YgsI+/akZDbdgw66IAvXLxR0vNFHaQvTkhja
	8gjAAWuGdJW5qjSbK420tgh5uhuQMY/0jAIVf5rUvOwQIB9+1CZeLmjQkXAwoKCW/nU5ERwL5R7vh
	48Ug2E4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4cF-0000000FikX-17tt;
	Tue, 23 Dec 2025 15:48:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4cD-0000000FikQ-3Adz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 15:48:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5B5E60123;
	Tue, 23 Dec 2025 15:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61763C113D0;
	Tue, 23 Dec 2025 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766504880;
	bh=Mpr8HzWjcBxOU7Y5X3r2Q1rE7twn+RHWLYcnM80d8PI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LdtdZydWjDykDcQ8MwZe/WYc0An3swcSu7m3Zz40XZiFB8j1F4Wa377ckpn+gsy1C
	 ld6XRBrr8TSgd0fLgqKOwAa2wNKWLwls2oxMe7aQDBIUxpP42n2Ciez4QmAp5ec30+
	 Cx4SBhT8gYD19wllqRw2tb6WAxB3lmtIQ4UuKDdYBLlSOrwClin4W9k5J5eboUe6za
	 TzH8qCowUXAai2tJGcM/ibzrTTnbFfDN3pTY8CCsjLny1/I+ezR85wowEzXj/Q9ufS
	 c8v06YbiziWtwd0oCqeXcTqzDKoNFfw5HDHDjQ52LxhD8FIFiV7Z2ru7fTdbDepwIQ
	 5zbXhKz1wn9iw==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 54A5F5F86B;
	Tue, 23 Dec 2025 23:47:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251221110513.1850535-1-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/4] arm64: allwinner: a523: Support SPI
 controllers
Message-Id: <176650487726.2524343.9774305641530243477.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:47:57 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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

On Sun, 21 Dec 2025 19:05:07 +0800, Chen-Yu Tsai wrote:
> This series adds support for the SPI controllers found in the Allwinner
> A523 SoC family. The SPI controller is almost the same as the ones in
> previous generations, except that it moved the "RX buffer count"
> register field to a separate register, and that register now reports
> the total count for RX buffer and FIFO.
> 
> In practice the driver has never cared about the buffer count, but if
> any implementation were to use it, this counts as a non-backward
> compatible change.
> 
> [...]

Applied to sunxi/dt-for-6.20 in local tree, thanks!

[3/4] arm64: dts: allwinner: sun55i: Add SPI controllers
      commit: 1bec3bd1f839f269dfdec3c635dd2afe15e30995
[4/4] arm64: dts: allwinner: t527: orangepi-4a: Enable SPI-NOR flash
      commit: bd14ba160bbe863e7b7bc489fd947ae1cdc03047

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


