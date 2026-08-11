Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5625FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoaDDpKICqAjBVzX4e4ip/j+XxAMW19YDIjYVhb0xDE=; b=VtX6IzXxFGCpaMbPfwMVbG2vVl
	8f6UuQDLmHIk/CaS2a8GNGKmdWwohugWHmLk/pdw/lwjtywY+dh+q422GoQyG0KVm2Hg7hrgDMHuh
	hD8PvU4ylv8gxnBbKWzvtQhueQg6KlmrOjhmxhk/YasjYxhjXr5a/NDto5EVKHsTcxNi3IMJogQOQ
	UCBOQY8f+5ldHCXWt8KuEWdeNrE0EED7qGkjGbnO/yfQVaiRgb/1lENP4ztE7zpSF3PBN+EPVw50a
	9vtZlcfMI7h+FLiKCXl019NR39T/bBaiOwXVx2FU/GGpP6gEeQvapiHx7ZMLUF8w2ITAJtoXE8P2m
	oi54aJhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrGX-0000000ElOE-09fT;
	Tue, 11 Aug 2026 18:31:57 +0000
Received: from meesny.iki.fi ([2001:67c:2b0:1c1::201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrGU-0000000ElMj-3qnf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:31:56 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-106-235-nat.elisa-mobile.fi [85.76.106.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hKKvq3CmTzyYL;
	Tue, 11 Aug 2026 21:31:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1786473097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qoaDDpKICqAjBVzX4e4ip/j+XxAMW19YDIjYVhb0xDE=;
	b=VLP3EcAXAYEjvdEQJqe1vsf06Bb4aES591foWz+TJBqb4PnioazWA7Lc6H+xzLcPjIUa5S
	Y8ZOpu4awXoqTyrEhouUxBtzY+hLs8uoByvjO5/8m4fI3Ri0I5bRzghqo3W8OCWVzWd76V
	+bxu+4c7ScaBWk41qcJyfGlJ/iRgwqE=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1786473097;
	b=HYl0lh6U67DdmLOT6qp+LQUCXOYNJS+Lb84CN8kqcjEQGYyq+7jCBkMO/pMT32+cRtGVxU
	74d9AU3u+1KYasa68ibKX1nXpAuDx1abnRiysjLKB241zcMjLibAoL8tpuh5RHSrpX+yKV
	/WXZ6ITHckXec8mn1c7RPLnq1JgMkUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1786473097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qoaDDpKICqAjBVzX4e4ip/j+XxAMW19YDIjYVhb0xDE=;
	b=SiqmU3zBJo6pNRRNoPVeJXOWvNWPaqXZTOPDvNc4T3B0Tuz1L108/mRhJs3u21BKTGJEHK
	lAhaAB2lUEAGNPwClCyLUrqeF20NiSAmNLax/9/sRKa+MZpUDKHZ2u5RMMVNiIC0i0vHXD
	qGv1IaDMJBMw2UWNyslK5C+sRIN8M1w=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Tue, 11 Aug 2026 21:31:32 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 3/7] ARM: dts: ti: omap3-n950: Replace clock-frequency
 in camera sensor node
Message-ID: <antqhI-3175h-pX4@darkstar.musicnaut.iki.fi>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810180604.3034255-4-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_113155_133312_CAB4E5C2 
X-CRM114-Status: GOOD (  15.40  )
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

On Mon, Aug 10, 2026 at 09:06:00PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
>  arch/arm/boot/dts/ti/omap/omap3-n950.dts | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-n950.dts b/arch/arm/boot/dts/ti/omap/omap3-n950.dts
> index b99f97880204..2864ed8dd6c3 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-n950.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap3-n950.dts
> @@ -74,8 +74,11 @@ smia_1: camera@10 {
>  		reg = <0x10>;
>  		/* No reset gpio */
>  		vana-supply = <&vaux3>;
> +
>  		clocks = <&isp 0>;
> -		clock-frequency = <9600000>;
> +		assigned-clocks = <&isp 0>;
> +		assigned-clock-rates = <9600000>;
> +
>  		flash-leds = <&as3645a_flash &as3645a_indicator>;
>  		port {
>  			smia_1_1: endpoint {
> -- 
> Regards,
> 
> Laurent Pinchart
> 

