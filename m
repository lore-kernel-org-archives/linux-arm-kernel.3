Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6024C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DB3tTFLWzUdI+/2k2/G0z9ItKcJmZ4ohDe0Yiw75l7E=; b=ye1olCfchTzzxS8G0nLbKEI+OE
	/AjHij+bwFh/d9dWpNZt2fk7zVJpSXqVreUzwkT664RhJrd5wpsTWx6ohh+gvGu/Wsw/C4G0qVZdN
	8g/fNRkI0m3UkJ5Wvq08S5cJ3yYsvQmNJD+kpxcYMKofyDMU/p62v4R63kGmhhjjtwo4HOP/WOqa6
	5GA9CQ6ojH+8DwWhZOmAK5vQmlMdA9lmaJLy7+xdG2Umryzuxzdn48vqyZlKkOIwxLhpgzXzI43n4
	wNAhF/IWdYjO4SihmupnlJuWXn76Yu2T0Jw1JWX64xaLHUFuMb+r/11Cxor7PnQmjKE26s8vv/xoI
	/IBHyDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEurC-0000000DJSH-1cbW;
	Tue, 13 May 2025 19:00:02 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuD4-0000000DDkq-3CbP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 18:18:36 +0000
Message-ID: <53d495b1-b593-4ca1-acf3-fe1907d9a56a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747160311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DB3tTFLWzUdI+/2k2/G0z9ItKcJmZ4ohDe0Yiw75l7E=;
	b=Y3CqqPo5fnt83dlvG+F+Fhl8lzPo7gTuJydCjuOS++XEXTrJTPeU03kJWkVPJI8GvEYBrC
	EcGSe2F8xowDLzCZg9r4twYSzTbnd91j5l6l7ik0AaCipJShu0+nngexHRBjIiJSvafxz4
	hpepMNP0S7bEtGDSqEf7R4/ze9Icvs4=
Date: Tue, 13 May 2025 14:18:24 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 01/11] net: phy: introduce phy_interface_copy
 helper
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-2-ansuelsmth@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250511201250.3789083-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_111834_952734_C03C0EF0 
X-CRM114-Status: GOOD (  14.30  )
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

On 5/11/25 16:12, Christian Marangi wrote:
> Introduce phy_interface_copy helper as a shorthand to copy the PHY
> interface bitmap to a different location.
> 
> This is useful if a PHY interface bitmap needs to be stored in a
> different variable and needs to be reset to an original value saved in a
> different bitmap.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  include/linux/phy.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index d62d292024bc..9f0e5fb30d63 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -173,6 +173,11 @@ static inline void phy_interface_or(unsigned long *dst, const unsigned long *a,
>  	bitmap_or(dst, a, b, PHY_INTERFACE_MODE_MAX);
>  }
>  
> +static inline void phy_interface_copy(unsigned long *dst, const unsigned long *src)
> +{
> +	bitmap_copy(dst, src, PHY_INTERFACE_MODE_MAX);
> +}
> +
>  static inline void phy_interface_set_rgmii(unsigned long *intf)
>  {
>  	__set_bit(PHY_INTERFACE_MODE_RGMII, intf);

Reviewed-by: Sean Anderson <sean.anderson@linux.dev>

