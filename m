Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9B26078039
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z0Amg/L6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=i26NWnj+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z5JEWAHX8HIT/y9bERySyCdVuC9uxNIx0YOcG+Jkvv0=; b=Z0Amg/L6gBcT8GyOQV5rxaJf3h
	p/soozYdbtvcP/MbDsqaAfh3SO6Wu5JYvm8rqeWozxrzfGo0ojSYDzt0TDljRwNhqj/3nNK6zw85j
	Ie+UDTWW9gbyYSURXAXaTJHV2iGm2969Bo53kfkTWhPVJOXQdqnN/QbcIveiaN3Ulep17lgEUc3UI
	y312zZtG1VVXgKZyuDB7sIRg0ACgiQsox9fr2Axxyx4z36Yx6DfJ8xK5tROJaFRxTMxhop30sU1R3
	x+ADd1xfO2iXa78eLu10evH67th32L1Ce8t1+qApE+1KLs6rcqmbv0Ln+SemzqoNQsOlYBH6NSym2
	33y3FQUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiXy-000000072AS-1Bn2;
	Wed, 04 Nov 2026 21:29:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiXw-000000072A0-1l29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Z5JEWAHX8HIT/y9bERySyCdVuC9uxNIx0YOcG+Jkvv0=; b=i26NWnj+huXIiWxNXO7EvLj08L
	dpWAOUvdfL/BjVLhLZa9UB9Y6lVKooJS3wov0erHqIbKb8nrhToeu3GBLuiNNksYk4T1yQVbzKkgD
	Y1Xb8/BoUJPnygFcAh5QHLr5/mvJbMZJv9xH9SJR1VI8xfNE9Iwe7KavNZ0C7QZg/2xM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOiXe-00EOKk-TI; Wed, 04 Nov 2026 22:29:10 +0100
Date: Wed, 4 Nov 2026 22:29:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: joseph@telaak.dev
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890
 GMAC
Message-ID: <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_132928_481618_3AA14990 
X-CRM114-Status: GOOD (  10.17  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +  rx-internal-delay-ps:
> +    description:
> +      Applied in steps of about 55 ps, rounded to the nearest step.
> +    maximum: 14025

Please add minimum, and multipleOf.

I've not looked at the code yet, but default: 0 would also be good.

> +        rx-internal-delay-ps = <550>;
> +        tx-internal-delay-ps = <935>;

These values are odd. The RGMII standard says 2ns is required. Where
is the rest coming from.

> +        fixed-link {
> +            speed = <1000>;
> +            full-duplex;
> +        };

Does this mean there is a switch on the other end? Maybe look at what
the switch is doing for RGMII delays.

	Andrew

