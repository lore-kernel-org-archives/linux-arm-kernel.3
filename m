Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336AFCD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ10s60y84Cayjd/Zc+2xGAqU2bR61FOgQ8qQN0exP0=; b=ohy64kXqNtGFXCTohvtdZUyGcy
	iKWoai/Zd9iOXFH2LNwgrOCK3kn9MNMrO3t35VJyyvmq4wiLMv3OE7cY/QXIluFOB+hHvCC0f4Sb0
	52cr84SA1qR0OO4oXqyFfNPNuvsW5A4zmXuULq0MFmFmp24DE4adZR52gpJzoOO+c0dUTmBXSCaru
	Mr7aZOusNjNwJDQ4wmqZUO2gB3d9uyKygmnXynkTqEL9wRJpkPhg9mIUAlh+0/pl84OBQtIHWKagW
	E71Yo8CPI8WG58BNFP9OM/2S2PhfykSqUTRTiF3Ek1XIjr8GIp/asrWcgwCByUe0GgYZsdHvRoUKM
	bOcv84Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDvX-00000003QIf-41V5;
	Wed, 13 May 2026 18:03:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNDvX-00000003QIT-0eXt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 18:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C17F600AE;
	Wed, 13 May 2026 18:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 214D8C19425;
	Wed, 13 May 2026 18:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778695402;
	bh=w0VBX5Pqrw6WMZ6TTwlHS14W+TYMlrmHx13BLs87qI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIY7G4LYmrN2oGQutV24t5rICtUiNBRKZWU3bXLaTCc0fK1wyL/9XrqHEV8p4e8pE
	 PIniBXCVr0vMUhSm/dggY5nKJ5gOyPecspHvsMf3nESp9xvW9eD1LUh7hLPD6afeRe
	 nkhq/955kLntwfvVb4pIE7DNMPSBJ0T13JX+T4HZGQaoxCITMU3ewWmUSTs3vtopsC
	 dGyozzWYcid3t5Y5QRxwXgDVYN9hzJCdZv13yxKmYeV5XQH7+ppgj6i2zSe18TP8JU
	 o2SvbhbjzJ2xLcW2Esk8AfeKPHneDeLwRw0bYjhpuKfUEtYVgA7smwf4LBzIJDvXOj
	 9LHZ54RX726XA==
Date: Wed, 13 May 2026 13:03:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <mripard@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/7] dt-bindings: media: sun4i-a10-video-engine: Fix
 IOMMU count for H6
Message-ID: <177869539916.1493173.10825192912452085922.robh@kernel.org>
References: <20260505134812.408316-1-wens@kernel.org>
 <20260505134812.408316-2-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505134812.408316-2-wens@kernel.org>
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


On Tue, 05 May 2026 21:48:05 +0800, Chen-Yu Tsai wrote:
> On the H6 SoC, the Video Engine has two memory ports, thus two IOMMU
> connections. The secondary one that is missing is likely used for
> reading reference frames. The newer H616 is the same. On the other
> hand, the D1 only has one memory port.
> 
> Add the missing IOMMU connection for the Video Engine.
> 
> Fixes: 62a8ccf3a248 ("arm64: dts: allwinner: h6: Fix Cedrus IOMMU usage")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../allwinner,sun4i-a10-video-engine.yaml     | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


