Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9C3606EE90
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gh+JEZM5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ceyf4Xm5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uKgCwPx0XcVlKQatI7uQ08zv+nNRGJomiJbLaZj7TUg=; b=Gh+JEZM5me4bfJgv/qR9c60W9+
	9uKcWIF44lX6+wUGCRMGkw19CKgQBRqqpah5OLRaj4ApD80ibrbxBD1M5tXYQFce2CDEGcswHIVVS
	nv6HPr7wh7BCxkinEalCvZ8Ok3rVIgSINRx1dIbcWt7mJ2O5I1fHwDOc4PIBOP5YaZHivV/L6LBaq
	nXE0W+JkWXcrRpQk5cELvs7MbBhvEXFDjmhYV8r20YYOmWgNr0z+L0h+IYM8Byb5CR1j4p+xB3B5M
	4WCHPl6JuWHncxKOl4I7XgSqOJjUZx0XWHcdi4rzgtyKC8uMxfSnN3sTwm1hI09s2M47slZwbFjiz
	zlrH1JXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzgt-00000009Rdo-0nC5;
	Thu, 05 Nov 2026 15:47:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOzga-00000009RUl-3wJu;
	Thu, 05 Nov 2026 15:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uKgCwPx0XcVlKQatI7uQ08zv+nNRGJomiJbLaZj7TUg=; b=Ceyf4Xm52NX4OwB72Ect2eiM7X
	1cEqc5wfLUp+UwbStmw7W94MMj2xX13JYiLLorkfN0fR+GhozHAGoPdi+DgbQ9OMRkg6JxXq4D7Ls
	EL8ryhx0XKBwFa7SNFMLfLXQ30fKrjmBG76UpjTsnfWNXeR6GFS1HfZvfr78O8vJkxKw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOzgG-00EbAL-VP; Thu, 05 Nov 2026 16:47:12 +0100
Date: Thu, 5 Nov 2026 16:47:12 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
Message-ID: <f0925b45-26b2-4d79-9da7-e73a7a852efa@lunn.ch>
References: <20261103163715.385394-1-tanure@linux.com>
 <20261103163715.385394-5-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103163715.385394-5-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_074733_158671_F6C89766 
X-CRM114-Status: GOOD (  10.89  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 04:37:12PM +0000, Lucas Tanure wrote:
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
> 
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
> 
> Assisted-by: LLM
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

