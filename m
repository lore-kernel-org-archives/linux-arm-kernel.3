Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FCBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nca+yjlOeLq6HDcA1WmI6PC/RnpXa5Aw/dsS8wslEos=; b=OmYm3z8omHY8RH442x2Ig8TVOa
	yFArSM1b2khjzRVUdGya/ZJlnMNCa/GG1cv0OdJpfi6h2UuUH6Abe5pae7QrVPhgcKcpxMlzSVstx
	4/1GYWkBOQglWnYCsLov0gok0TWC/L1fk+5Ytpt7eEyLdaazJTjvkSdLKYVKehB7xDvT62hWK/wMK
	Tpqpw7CpcKJ9sFARmVZajSwpGP7Hbo6wZeLbTfqtfagrwzCjG8BBxdHpzArFYXyve17M9MEV6gxwj
	xa48BG7U1iLgJ06Fa1vQ7Ky0icwWi+WDXt3FyCn8x0jNr0y0Is+Qs1h6C+d2zGEXMoWK+IPTm6Fyi
	MEVuNU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGOT-00000003qYg-1ZiZ;
	Mon, 17 Mar 2025 19:45:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGMm-00000003qIK-08Q2;
	Mon, 17 Mar 2025 19:43:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CCE35C05A4;
	Mon, 17 Mar 2025 19:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D6DC4CEE3;
	Mon, 17 Mar 2025 19:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742240595;
	bh=t//6P/q0t8jIMHBT9W/8mr8iVb+RwiE/dM2UG+3+3rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bJY6pWHAHjA8xrZ/5+VUjB1jqkwWQCAceb0D2Kx7WuOa/IeJcN7gAg8gWrxfY0F1U
	 SQZR5hMLDYoUm3n3eaILBNSY9qtWVg0N9pX7wa3so9kHRslCGuR3KWEY0Pk9v6L4/R
	 Pk6sPCllY/LZHOwZiQshkmDf7C6W+czCc5B5pWBzEyKE66h+B/12eIcXSNG7gQ02OX
	 m2Mkk7MVV+5O3/at5i9/MO48RkGLWyWcXIActOkWOt1ZX2GuZnQTGMx4OaiF4GThWu
	 Mt3ks+Uhjwnvj62d3ra1dt7drBybKMgcoW1xBqFO77B66t/jFOTmo0LhKw1uDI72XB
	 HUCK9E2oZZBOQ==
Date: Mon, 17 Mar 2025 19:43:09 +0000
From: Simon Horman <horms@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Wu <david.wu@rock-chips.com>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] net: stmmac: dwmac-rk: Add GMAC support for RK3528
Message-ID: <20250317194309.GL688833@kernel.org>
References: <20250309232622.1498084-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309232622.1498084-1-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_124316_123032_E0F00D73 
X-CRM114-Status: GOOD (  16.44  )
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

On Sun, Mar 09, 2025 at 11:26:10PM +0000, Jonas Karlman wrote:
> The Rockchip RK3528 has two Ethernet controllers, one 100/10 MAC to be
> used with the integrated PHY and a second 1000/100/10 MAC to be used
> with an external Ethernet PHY.
> 
> This series add initial support for the Ethernet controllers found in
> RK3528 and initial support to power up/down the integrated PHY.
> 
> This series depends on v2 of the "net: stmmac: dwmac-rk: Validate GRF
> and peripheral GRF during probe" [1] cleanup series.
> 
> 
> Changes in v2:
> - Restrict the minItems: 4 change to rockchip,rk3528-gmac
> - Add initial support to power up/down the integrated PHY in RK3528
> - Split device tree changes into a separate series
> 
> [1] https://lore.kernel.org/r/20250308213720.2517944-1-jonas@kwiboo.se/

Hi Jonas,

This patchset looks reasonable to me. However it will need
to be reposted once it's dependencies ([1]) are present in net-next.

And on the topic of process:

* As this is a patch-set for net-next it would be best to
  target it accordingly:

  Subject: [PATCH net-next] ...

* Please post patches for net/net-next which have dependencies as RFCs.

For more information on Netdev processes please take a look at
https://docs.kernel.org/process/maintainer-netdev.html

-- 
pw-bot: deferred

