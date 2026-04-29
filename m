Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FF8FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBFSogmWsTJDNbCy2ROszFeAisMWonaaA27sl7huWYw=; b=GiukMMw9HgjYN6H34QXY4Nzv40
	LlsCVHGrjKVk4lEwAiV12egxwIY1ni6O4inCwRAI0z+NNqMsNV8WNd+QdWuaxmzq+LAXDG+2Pj+SJ
	2MLrmVJPktsHOqZUArb0aMuRlxf418gUHJcxN/34ZUi1/2rb5TicIb80zWnd/PSdTAf1wa8XCHh6s
	dbTgG+i2ctoLUNzaPg5A7ponqe/HQkZehGxBOtCtX3au7IHjGOhUHHLQ6VSsJ4FJi+e8V64BuwcUj
	mkFqzTlWqVythQVfzIM8rgSTn6EW8eG5ZzM6wFRu5HIrss9ghl9gASbWMUBddMY4juiqfyzZHc6LN
	fmqmXpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHypi-000000034Mv-2LOZ;
	Wed, 29 Apr 2026 06:55:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHypg-000000034MS-2zet
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:55:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA271435D1;
	Wed, 29 Apr 2026 06:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420CAC2BCB3;
	Wed, 29 Apr 2026 06:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777445739;
	bh=PHll4ZUqKiT08v1DLiiLenqv/Uz1VMM8r2/32Bt5mL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VFhgfhPge/7WpbcBc2sMONWoZHLu8VL0rWWNY364iv6D5SQfahsqi1hTa0Mluri7T
	 CcsM9sRnXsc5j2lftprdsiE43Ve2gSwAKA3SrlIhJe5CZfOiaPJicX0CqQxJGvzlXK
	 k3Z/NBSA+S0xnr9RC9d82YUQYsX9fqcIRwsTNbKULEiWGaINpTd4nW2TUhscX956B9
	 mYacKBtQN4CXxY3ZZ5VMz6hwfmszSmT9R/ozpe2XRqycmy4FMJOTjAOojzHIqdjgup
	 L4Ojis1NJn1aZkkLJdIXnN656kdewwcmDAhlweLtJZ8M/zK4nhhVxD/CLoBVJ6MCvd
	 UvozQfhvMxJ0A==
Date: Wed, 29 Apr 2026 08:55:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>, "David S. Miller" <davem@davemloft.net>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Felipe Balbi <balbi@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Johannes Berg <johannes@sipsolutions.net>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org, 
	Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: net: add st,stlc45xx/p54spi binding
Message-ID: <20260429-crouching-dangerous-basilisk-22cfda@quoll>
References: <20260427142355.2532714-1-arnd@kernel.org>
 <20260427142355.2532714-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427142355.2532714-2-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235540_795995_8EB670CF 
X-CRM114-Status: GOOD (  16.88  )
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

On Mon, Apr 27, 2026 at 04:23:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The SPI version of Prism54 was sold under a couple of different
> names and supported by the Linux p54spi driver, but there was
> never a DT binding for it.
> 
> Document the four known names of this device and the properties
> that are sufficient for its use on the Nokia N8x0 tablet.
> 
> As I don't have this hardware or documentation for it, this is
> purely based on existing usage in the driver.
> 
> Link: https://lore.kernel.org/all/e8dc9acb-6f85-e0a9-a145-d101ca6da201@gmail.com/
> Acked-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../bindings/net/wireless/st,stlc45xx.yaml    | 58 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


