Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E1FC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH+kR55l7q2T4yQ9SIaFXw37h9ozVxD3HhYmGKf8G4g=; b=qg50iGBkou9Y8tu0K0+CLYrKLA
	pYwvPx0x2DvtpKrO11O/KS4ZspeL+64GcPn+f++avuvZ8dxK1tsw/5WH0I1rXD/vJFybKhgAO1aUM
	/6as3a7Zpgm1JRdV3Z+kFjIbxheNFcVyPKokWfn6jgNFpxg7+GTOsW1n2uadF9QMQMh7i76v4dGJA
	BJ+RjF2sJLzg5VwXyyV5qP7F86LxalnGsUTYMC1jhcpNrYRq8cKf4A3WIFdz4GdYeq0AF9wfRlcOU
	7OrfuWhxWD7iNtAgyVGivIWiKuLvsSD8+6G/aSF1S4aMRqPLB8sbW1zaRIkRsX+yF7SdZP5EtXRGD
	3qfnoe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vd9-0000000G19Z-39Cq;
	Fri, 11 Sep 2026 07:25:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vd8-0000000G18U-1aSj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:25:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAF0542A07;
	Fri, 11 Sep 2026 07:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D7E1F000FF;
	Fri, 11 Sep 2026 07:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111501;
	bh=BH+kR55l7q2T4yQ9SIaFXw37h9ozVxD3HhYmGKf8G4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ANl9844tOuE5AoQGY+DjaIFqCkPogFuzPNdfQWqulQ1ewcXnDBgt4NdOoaAxooGZH
	 otw3WqXN/dfJ1pNs0X0yevkODFTPh3pxA9BwxVVkBA1iktQgUJQewif5xVbMODOWQG
	 p/mWIch3ra5WH3jLHFaw3cWT0YrPLRjUedj8sYvbwLEFVFwspXynmHIaliKaD8MzHM
	 Xaf5Qs18Xas8eGIznU7yaUWvc+9ptKBerpjAHFGKEw0DHIqd0hSZcM1yyqzMhkH095
	 IUQbqVg1ph51dt/CUhqYAMrmXLp66EUw6RS72Jj/2UD9lzJLKJvRcTkZjvnML1Ja+L
	 dkfqQ0ihw0QKA==
Date: Fri, 11 Sep 2026 09:24:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, Support Opensource <support.opensource@diasemi.com>, 
	Sebastian Reichel <sre@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: [PATCH 01/14] mfd: remove unused 88pm80x driver
Message-ID: <20260911-righteous-arboreal-angelfish-3bcbdf@quoll>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-2-arnd@kernel.org>
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

On Wed, Sep 09, 2026 at 03:21:38PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This pair of drivers was originally added as companion chips for pxa/mmp
> SoCs, but the corresponding platform code was never merged, so it has
> been unused the entire time.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../devicetree/bindings/regulator/88pm800.txt |  38 --

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


