Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B5C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VuR6btE3I4WqOsfrktVz2YWBBB1Rx35WzY0bJtV429E=; b=mcgsSXJGzAt/IHwzT4Kh8LQBfW
	e6bnZ84PPih+bBgrMYkr0GFGsCdmKLE4rdl2C61g93jB9ayMBzo3WcOuerKJ7RX4WtgjScRES+UH4
	TV88Ed+oOehkBhBwkwoZy7RiyjfHM4mfBokA5JSETNhrX8s+spglIYR0+YqnDZENeii6+oYkCB5jo
	En3/MD/GvZcH1lCwgOWNwkx7gbBxB+jRH2+J35UOSYEcOpGO6nfuPxdk3RwmTANMgf3j0rHBDpdWq
	DJVuM93fHCRquoyMAQgV/OqUhAuqUsnWB6WoWKwHeBlSVVtlSRdXcYBEgWnatBnejPQnB33BVJPQ0
	kyV/KhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Xf-0000000Gupk-2zZQ;
	Fri, 13 Jun 2025 15:42:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Zt-0000000GirA-2PCw;
	Fri, 13 Jun 2025 14:40:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 85A744AA49;
	Fri, 13 Jun 2025 14:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F4BC4CEE3;
	Fri, 13 Jun 2025 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825620;
	bh=ITZFyS21U+zCOStvhgK2RHhgm5QwQidWMeeety/ts8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d5+6qd3P1WztJuri2EhMxUbC311PrDjV6+k7vmYn5h9vsxp9hWZmJ3UByPxlb6DIx
	 rheKtGV6B0v7/rTXW1cEwu2QwD0ggEKqEje7dGOcyg/chHtMvq0rRhoaljeztbANlz
	 LGocFuU0OX5ovZ9PJ20vb4mbdA71niDR2s4I6RonOo9tVOClMTh8k3LYSLbqPIkQ2p
	 /4Smqm/74Jc73703K3dngeLNzy9mTCQ2c8ClYWV9wuGZ9+g0MdOZf6PuVnnYbdzWt6
	 o6JnIrM0lkPjg27vCTy5W1Cmx3M6Xe6eu2fEKnD7WElgytQV/Gp1gTvR+DUd1EhXMV
	 s3SA2Iysdr5PQ==
Date: Fri, 13 Jun 2025 16:40:11 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 03/12] gpio: moxtet: use new GPIO line value setter
 callbacks
Message-ID: <lekcp6p4s5hbkrul2aq4ukmc722qajitvpxs7mtrqg5nlmfxd5@b5c7zzh2lb5u>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-3-3a9a3c1472ff@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_074021_629709_502FC199 
X-CRM114-Status: UNSURE (   7.85  )
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

On Tue, Jun 10, 2025 at 02:33:13PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Marek Behún <kabel@kernel.org>

