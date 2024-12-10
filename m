Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2B9E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eo4Cvix0Q6Ny9IVkv622V5LskCRdrNKizWnESnyiqRc=; b=ATp8E6N+VnPXJk32UQ5b+Jc1b1
	D2fU3bLTAGSLKS1xS25ZkoYBkia+HHJG8vRxAC3LWy31uDbhWEpmCXys/TKNwQtJxw3gPKrTe88wN
	5Avr3ncQZIrFfPKrpAXhV7KwVT4zbSEV+h7V3LuxaPzPybNJi0RKtbPvN3ep5qUgIq1HJp6Z6wwc5
	sH/D3GRo+URuMUTGR/8ntdq0JsFtj68Bgg4UQQD9RQLJBLJij2F7A0pmseWYvu6EJPpZHPUCepksr
	Ib4Nw3q2S2BrnF3DkKArid3U0CRd+fBCFbhPBSeVrqVEbciiMLEIy75pfuM3+1kmqeDe1csdVvWem
	w5LIKgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpD9-00000009rDM-1luP;
	Tue, 10 Dec 2024 01:38:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKpB5-00000009qt6-34fi;
	Tue, 10 Dec 2024 01:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eo4Cvix0Q6Ny9IVkv622V5LskCRdrNKizWnESnyiqRc=; b=zlxM1gJbeJPhQfj3PB35xuI8ka
	vkwcwGEOvFv3yoPz55tUJfg/DXCtYKZTlq9jj8viWj3uR/WYXPWDA6puNYS+cDwEyQWxoraWd54M/
	4LMvidGOhs7EPkylBIkBEcr7FTmVOI5TeH5gBWhxMDVMWJ5Ru37S+YjElYMFjqhx5C+A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKpAr-00Fjr0-8U; Tue, 10 Dec 2024 02:36:29 +0100
Date: Tue, 10 Dec 2024 02:36:29 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 9/9] net: phy: Add Airoha AN8855 Internal
 Switch Gigabit PHY
Message-ID: <b3b79c80-ac7c-456b-a3b5-eee61f671694@lunn.ch>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-10-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-10-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173643_773303_257C9FBB 
X-CRM114-Status: UNSURE (   9.79  )
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

> +config AIR_AN8855_PHY
> +	tristate "Airoha AN8855 Internal Gigabit PHY"
> +	help
> +	  Currently supports the internal Airoha AN8855 Switch PHY.
> +
>  config AIR_EN8811H_PHY
>  	tristate "Airoha EN8811H 2.5 Gigabit PHY"
>  	help

Do you have any idea why the new one is AN, and previous one is EN?  I
just like consistent naming, or an explanation why it is not
consistent.

> +#define AN8855_PHY_ID				0xc0ff0410
> +static struct phy_driver an8855_driver[] = {
> +{
> +	PHY_ID_MATCH_EXACT(AN8855_PHY_ID),

Is there any documentation about the ID, and the lower nibble. Given
it is 0, i'm wondering if PHY_ID_MATCH_EXACT() is correct.

	Andrew

