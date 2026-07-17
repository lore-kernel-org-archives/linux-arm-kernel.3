Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD72CC44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Nx90yYsedjeMovsM9fLZ8Rjn6vGASvEZ0i1aCVi9BE=; b=bMYMWAOVbvykaAC2IZdl2fXFj7
	B+ioabKqov9Ue40dYxJBdZ2qKEAt5wctDOkU9zNwsDPYWX8Jy2mdoA8JWy2GFjvXvj5nD7jpPmTkO
	ee1imp9SL0RkJc32izS0sw6kfsn8+ev5A/fyLH8scxbImGSoCpvjwP7zdsyeigvUVOzScCWY0UUor
	BXDsg2oS7oDGLD7UcjwwtOKqj5dJX051E3FMrpzBB17EvQUxbru6aAA60A2Rc+OSgo1GeqcaJefjP
	NGLmUeag6VXxmuNxJZnXsJnkbPbccVFcu7DA5IR27zZP5XX+QQm4RVlUnDjV+u5+epBZVOdOPTj25
	MH05wAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4G-00000001fuC-4BVZ;
	Fri, 17 Jul 2026 08:37:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4A-00000001fpe-20Ao;
	Fri, 17 Jul 2026 08:37:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E692260A63;
	Fri, 17 Jul 2026 08:37:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 715371F000E9;
	Fri, 17 Jul 2026 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784277425;
	bh=5Nx90yYsedjeMovsM9fLZ8Rjn6vGASvEZ0i1aCVi9BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AHHM9uyGT9+vZ43eym9FxQZKiSmPSoTmj3pn0SuQnB8IWi0vQ4nMdvvXjOoNJxCD7
	 e6z3oKNR/P9PEDEgM34HGe939XvWSzULQFM404CLJ01mSosgo95faXCfkhsqjuTPz1
	 xoKe52yDVCNSUazPHEibzKOH0pX7bEPyc7YBmdZyWXeg4FOigR1a8EctSSqlnMESg5
	 EBO9oWsbD4PMxwwGhyN3/AeX6H5y5KOUrQVZZXrL7gAoqAfeQuVEAXKb5vQDGXoqRw
	 SZ/XfEEe2G7iYgnfiHPZHgXJeMdKFV9RmntM4foSjJL7qULJHRmX0H6LdhvrMX6Yb5
	 zhBBAHHnEv3sg==
Date: Fri, 17 Jul 2026 10:37:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swark Yang <syang@axiado.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Harshit Shah <hshah@axiado.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jan Kotas <jank@cadence.com>, 
	Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-i3c@lists.infradead.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 7/8] dt-bindings: usb: generic-xhci: add Axiado AX3005
 xHCI variant
Message-ID: <20260717-sarcastic-hyena-of-music-27cc5d@quoll>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
 <20260716-upstream-axiado-ax3005-upstream-v3-7-c429095143ec@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-7-c429095143ec@axiado.com>
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

On Thu, Jul 16, 2026 at 08:51:14PM -0700, Swark Yang wrote:
> Add binding for Axiado AX3005 xHCI controller. So far, no changes
> are known, so it can fall back to the generic-xhci compatible.
> 
> Signed-off-by: Swark Yang <syang@axiado.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-xhci.yaml b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> index 62678abd74b5..d7fb0301fe4c 100644
> --- a/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-xhci.yaml
> @@ -14,6 +14,10 @@ properties:
>      oneOf:
>        - description: Generic xHCI device
>          const: generic-xhci
> +      - description: Axiado AX3005 SoC xHCI controller
> +        items:
> +          - const: axiado,ax3005-xhci

Just add it to the enum in "Armada 37xx/8k SoCs" group while dropping
that description. Description anyway repeats the compatibles so is
completely redundant.

Best regards,
Krzysztof


