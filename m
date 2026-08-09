Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05E2C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 17:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ry9fk0XG9JYbqeFPh0yNld54SQt3A83a8vQYvm01BjY=; b=xcC3wB9U939VB5hjf6MPnhGD+U
	i3hRhywvnI9/z/Nn8d474rrmgjnrB+IQ28XBn4tyAhHktkDvggII/OVMqwFo2Fc/zplERLaeNzh0R
	SNJRtE6ZReJJqAwHEXmpS+VXQ3Txg1MIkK/gYfCPtXykELTZW7wvDUz+V8in2A1GApCiJ8jGXEUTb
	ZKIhFJ9hS3/AtzRrVHdgOscC8w5sZOjuxMgi4oVinaOlyRHHoiI80sZc8JCAow7/fAubBCX1DoFZh
	FUDCcdga2CKbfZBhwvaoyf+AwPkZCiSHNPSkiKS0c8bGSdQtE5Hge9WbNEBJPInt+whDF7f1Pe8Li
	B2eOmY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7Hp-0000000AXYX-1lKS;
	Sun, 09 Aug 2026 17:26:13 +0000
Received: from [156.67.10.101] (helo=vps0.lunn.ch)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7Hn-0000000AXXx-0BOW;
	Sun, 09 Aug 2026 17:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ry9fk0XG9JYbqeFPh0yNld54SQt3A83a8vQYvm01BjY=; b=voAcElwKJGsW/1k0o6ZQjOjwA9
	AMbOZ2HQBU3A0RvorYkukinZR6ZouFHHTdmG8KGPGhEEN3r8qJQRl96TthwUiGUgzBjetNnHIY2Au
	HW3Wn2WZC8EXW2fv/AJLKQKJ50eoNV6mMfIgg/0JmkTa5VPk4PhweO3gtL6NeEHGxVfc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wt7HW-00Gpot-Ip; Sun, 09 Aug 2026 19:25:54 +0200
Date: Sun, 9 Aug 2026 19:25:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 02/12] net: phylink: introduce internal
 phylink PCS handling
Message-ID: <72c39d88-f901-48e0-ac3d-c7aca6e98dd5@lunn.ch>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <20260807131301.192060-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807131301.192060-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_102611_085239_1BDCC358 
X-CRM114-Status: GOOD (  11.37  )
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

> +++ b/drivers/net/phy/phylink.c
> @@ -60,6 +60,9 @@ struct phylink {
>  	/* The link configuration settings */
>  	struct phylink_link_state link_config;
>  
> +	/* List of available PCS */
> +	struct list_head pcs_list;
> +
>  	/* What interface are supported by the current link.
>  	 * Can change on removal or addition of new PCS.
>  	 */
> @@ -154,6 +157,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
>  
>  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
>  
> +static void phylink_run_resolve(struct phylink *pl);

forward definitions are not liked. Please add a patch which moves it
earlier.

	Andrew

