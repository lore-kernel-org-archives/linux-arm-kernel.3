Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5276BCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 00:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NtTOHiPRbXISRQm/qtu4s+iHAatWdJHMvuRpYVWp/XE=; b=kqGfo26aedyMUWLm1JeVRcpPZR
	Y3V288MtvlwmnmDdH37N2f94JkhBv+v7lvl/DzH/SWcel2idFGysBCexh7NHU+nN+BhJ9D+w8bV3P
	DFh514PJ6LUELNcb/1oMTNFQtGb6600tJJIjKcdPAA1mWqPaWS4GHjB0OxRpCknGXr5yK+MdtCkGF
	2YIff133dFbZEGYvbvjAdF6v7LYZBDhE3Y/kxtZGmez/x2wLBSdtiWqmpi9aCQns9bzL5onNURmXY
	JasJoWgzTS4sE7oIsqi6vghsojtrA4cIJ4qaEXha+3OIyKZOMBtT2Kk7yA6oFNMtwnaMQLqOCVtx1
	eo81JVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aEV-000000058RK-0sVF;
	Thu, 25 Sep 2025 00:53:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1aET-000000058Qq-2qhs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 00:53:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20AB9601F9;
	Thu, 25 Sep 2025 00:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29819C4CEE7;
	Thu, 25 Sep 2025 00:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758761592;
	bh=2Ny85oVJGLDfq6wuTCeKDXi1t00R/7V7ikjaeUV33GA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eX/k7NYwkJD2PXt9oCNo7jPVBEAUWCOH0RyU+3/9sBhm9bpj7m20aJr8CGYVL34yy
	 bvsbHlyzHjstv8jZQXQDqr2k5MmmQImeohtz6NdhpPo6g01mk3wr03MEQocrkWwsqJ
	 MwaoC/1619wcQ/SO5oU+6f4IYnvkFanx2yym0pJV/xvwF+4Z6QZuE4XeQKBXlyRQ+H
	 vYNsVOKtKn91UKf0em0j2yi/PeZV6hDRQbi/Jm/aAvwNV2D4YctIWNkcEiQ6bwAFn9
	 ggixdwwm+x3IiMHjF83Y1YEq76JDEjcp1eQ1woSvwEyUgXzvYK5FaZU1tA8D4H82y6
	 /FcYIJow+1/MA==
Date: Wed, 24 Sep 2025 17:53:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel Holland
 <samuel@sholland.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH net-next v7 0/6] net: stmmac: Add support for Allwinner
 A523 GMAC200
Message-ID: <20250924175311.59c6accf@kernel.org>
In-Reply-To: <20250923140247.2622602-1-wens@kernel.org>
References: <20250923140247.2622602-1-wens@kernel.org>
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

On Tue, 23 Sep 2025 22:02:40 +0800 Chen-Yu Tsai wrote:
> This is v7 of my Allwinner A523 GMAC200 support series. This is based on
> next-20250922.

The dts patches don't apply to net-next which prevents our test bots
from processing the series. Could you repost just patches 1 and 2 as
a standalone series for net-next, without the dts changes?
-- 
pw-bot: cr

