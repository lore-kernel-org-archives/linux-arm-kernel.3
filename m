Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177DAC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 18:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6srynJr6F+iL1JFztpVkhMqsuRR0gj7Zdj8R1JOIvQ=; b=T7+2H+ZPdo8riSEWKWuoeBx3Kv
	TJS+Xf4PoOKf5gpNTDU71x8k8++g83EZLyg4h3hwhI6JLoZxitkzs8nXfSWjZ+nErdw2xwRJjyTz0
	OmTR5PIWhbOmRJd3/7ubTPwIGKjpr4Qs1oaoKzMwHdc1NEbKEWUtH3usryPle5nSKB7zK9FdjZ4vH
	V6xV/CmPY6+UgWC6vizCOEZ3yIsSALkMkROFhO1HuLd+FDk1McEXj3ELUKznoR5nVvyUet6GyMJXr
	UFIZGpHtIjDc0e0n3C67BgNsqP8gey+J/ScK6jZeyM8beXhxtGYbQuPNn86Xh7C7TwfAqV3LzgS1C
	KJ/H9f8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrGs-0000000ElRo-0eG7;
	Tue, 11 Aug 2026 18:32:18 +0000
Received: from meesny.iki.fi ([195.140.195.201])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrGp-0000000ElRA-40rc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 18:32:17 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-106-235-nat.elisa-mobile.fi [85.76.106.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4hKKwT2ZwxzyTn;
	Tue, 11 Aug 2026 21:32:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1786473129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6srynJr6F+iL1JFztpVkhMqsuRR0gj7Zdj8R1JOIvQ=;
	b=DGLNkeYgMrfRzRSj/DNK53t1BCBMvrK8t2+4ELCIObHouX2Clvm1+g7uCHMgVL2QIUklw2
	WZ3SJsEd8kAnobBw2X5b1IettcmF11D0zq/gqE51zGACmQrP9EkMe5qOfyKAQHehm08KpH
	HK5iOcYHIno0luWZ+xSJMthmv+6SlCQ=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1786473129;
	b=TxZ6RMHkrorTYhFHgtPNE40tltk/zFqBywRUMTKRbj9VszF2/dLRHJ0br2rxP/7lhXm1d7
	klWp0jf55NGMb9U33qbRxF7h6U8+goOzzSDR36CJStIw7nC/lD8eW8dgL7PgF4qTV7REet
	ZwIWX4X+F70RnmcjHbV3BBiPILYtDME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1786473129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F6srynJr6F+iL1JFztpVkhMqsuRR0gj7Zdj8R1JOIvQ=;
	b=wOmgv4iRb1BSDgXLn1uFGBNxwQoxs0iIJz+xuaX18jIIou2tZK9BG3W0IX+r5i6rZcFFDM
	x2NA/7/vAIxjbZNO1QBU9qICeA8UCRTR0arx9eE4AjdQHWBMg1RH7zlYBDkoylJglMheV5
	+ylm+pNEbMJQ2KpjwjHZhy+jRBoX90o=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Tue, 11 Aug 2026 21:32:08 +0300
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
Subject: Re: [PATCH v3 4/7] ARM: dts: ti: omap3-n9: Replace clock-frequency
 in camera sensor node
Message-ID: <antqqG7acr8EF4ow@darkstar.musicnaut.iki.fi>
References: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
 <20260810180604.3034255-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810180604.3034255-5-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_113216_161694_39C5B0F1 
X-CRM114-Status: GOOD (  15.61  )
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

Hi,

On Mon, Aug 10, 2026 at 09:06:01PM +0300, Laurent Pinchart wrote:
> The clock-frequency for camera sensors has been deprecated in favour of
> the assigned-clocks and assigned-clock-rates properties. Replace it in
> the device tree.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

A.

> ---
>  arch/arm/boot/dts/ti/omap/omap3-n9.dts | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-n9.dts b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
> index a3cf3f443785..2edc1933449b 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-n9.dts
> +++ b/arch/arm/boot/dts/ti/omap/omap3-n9.dts
> @@ -21,8 +21,11 @@ smia_1: camera@10 {
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

