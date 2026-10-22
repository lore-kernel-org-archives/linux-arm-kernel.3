Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3329C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 10:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jJI8o9C4;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8UxxglD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vwrggvuqHJQ/Cl+eQIsicnlth4Pru1SY3OAx2uBPjdM=; b=jJI8o9C41RSRO3Ve0iNH0iydzM
	WcF4327kE4VO+YjE/7dHpqp4SbnmGjkoFAeBGH93ngPZopYeI+TFGgoaLdmUbBj6wiv9wQfZ/Joxc
	hTmOxVmLRVzQJDKnOXve6LoVc1aLrBjHhxDZUM3vTgdk+fsOUIirtBFb2b51zR2nNjoMO0ZZZEd1G
	0fn6RTNKWz5gkgiv3Deh601Qt7MQajPhzfOPSh2kXhJsGILhnTENae4+hkuVvwUquxC9Wta591obi
	POPGAP9c1ubgjW5CPH0OrfjXO+hK2sVlcvpxPEpLmr5n8guG6Ohuepv4LPqOkcNXF4U9F3xEhiVSz
	0JQz1D3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqPq-0000000DyEx-3Fzq;
	Thu, 22 Oct 2026 10:52:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJqPp-0000000DyEj-1HoM;
	Thu, 22 Oct 2026 10:52:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F03460200;
	Thu, 22 Oct 2026 10:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917541F000C3;
	Thu, 22 Oct 2026 10:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792666376;
	bh=vwrggvuqHJQ/Cl+eQIsicnlth4Pru1SY3OAx2uBPjdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8UxxglDlElIQAXquf2pBWby7YOUVUv5RJAn+4ICUmScuaCAo7oKuwnIq50K7WMM3
	 AnfNXcXBBNECPltXFvYsdtiNY6TOEYMZRD/9JYXynN4ZXV6mSJlE6rToWuCAK8I7tz
	 hB91qJajKnaS5VBVCY8Tj4vI+hORSPk1W46SPS9HqNhjpTyZuiXpzosB3SbfNYM07p
	 +vWMuPJcR7iw4YLLWw0pFddOBMP7Y/dm8hoaMFsT9ZUwHVZczA8mhwHeojJpVS6xH+
	 Vo7AaspF7lyFKPettVS3Yp+k9eRo5aVTSWX+vBZxesEicfjoIt9Tu5SRmC+f4P93Au
	 4tNo4AJckEfMg==
Date: Thu, 22 Oct 2026 12:52:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, netdev@vger.kernel.org, James Clark <jjc@jclark.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: bcm2835: add the BCM2711 GISB
 clock
Message-ID: <20261022-prehistoric-wealthy-leech-0ec8ff@quoll>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-1-a1728724d0f8@tipi-net.de>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 04:58:09PM +0200, Nicolai Buchwitz wrote:
> BCM2711 has a clock generator for the GISB bus that the firmware sets
> up at 200 MHz. The GENET MDIO controller runs its MDC off it, so add an
> id for it.
> 
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>
> ---
>  include/dt-bindings/clock/bcm2835.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


