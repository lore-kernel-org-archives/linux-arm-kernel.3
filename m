Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52FEC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsm3zQkLZiWPthCT9S+Q6MxC5N4HDbyIHHLWpRRLCNk=; b=TGoW2T+l+qH6j/FP/lkjwzLSHP
	xcuX53IGTV7YS80SBmwgvezAJ8LMw22CNHmiHdHoVOfMKn9I7kNso+cHkOOFPMcZuaBME5HCp/lzW
	pO5xdGsDb79CjLLpY9/ctQhzu2jKpE0QO/zQCyd/YPLc9Lg1TtRtbM94tGq8IDCCAEhoWWI6lvLOh
	Z3yNFohwr3s/Gp9syg9yU7MsqDSn13/OthLFBqPlX6tr8G5dO0bhphE9wbXL8K8CD9kw3TLarwt/p
	TUcDmS/w04fm8kI8qtPJ2zwUoBojVHGY3bPZXLSf1taPunReky35h/FjahUGKLKJ76G6Mt1DfaM9R
	Yaa3SR6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqb3F-0000000Ez84-19IM;
	Fri, 07 Mar 2025 16:59:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqazR-0000000Eya0-0uuL;
	Fri, 07 Mar 2025 16:56:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF56EA43ED0;
	Fri,  7 Mar 2025 16:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB91C4CED1;
	Fri,  7 Mar 2025 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741366559;
	bh=zm4IUNRU5F9Q7F6IslhySw9XY0LvJZqmHl7UPH2oVUQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AVpLkgsm+rJ1/+ojcbOf8+M3KoFzyiiESQHwjozKAPjF8B36+xTNHrBJm+OV0IzoP
	 9DIl30BifTky83nb+ef9gFAfamPXZoSgWIfmpA9euJYTrs3wu9ivgapJI6JR3gFCA1
	 CmjG6ORlNPfFLBEhuTr35fy8VNDn2/WcqANJ0KGlI4nwtFgIJwW2aIS2H4i8v4MZV/
	 5ubKCGk/uJxRELly6gsEXqtT/B4vlKspg7bln92m2n9XTmZwRFUEnruBztw+BLShQq
	 APwS0a6x/LJuzZQ7QklhKw3O/u2zP8pBoWkBqbqNfww/A8IKi8k251LDbdwJQX11IJ
	 v5MuibhQrFa/g==
Date: Fri, 7 Mar 2025 08:55:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and
 php-grf during probe
Message-ID: <20250307085558.5f8fcb90@kernel.org>
In-Reply-To: <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
	<20250306210950.1686713-3-jonas@kwiboo.se>
	<bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
	<1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_085601_347452_84BC712E 
X-CRM114-Status: UNSURE (   6.45  )
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

On Fri, 7 Mar 2025 00:49:38 +0100 Jonas Karlman wrote:
> Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe
> 
> [encrypted.asc  application/octet-stream (3384 bytes)] 

Is it just me or does anyone else get blobs from Jonas?
The list gets text, according to lore.

