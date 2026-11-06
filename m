Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB299606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jz2AsyeA;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0fehbrx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1UC53npQZPQBqPO2Jxjhg1ObzLlkCePsQ0TzF6vvsAI=; b=jz2AsyeALJrH6tLJ6gFqK+bhwx
	431jH95ieDMwbN+UTu6OGXsAFUQEqtAiCf5fCYA4KiC8ylRzdNhlR/P4p5tOU51jhEZPf9f3PRFmx
	FEhu0D/0zN9+13yLtq74dCNsopTDPIZU+ysslQAuwOHE25b1FNH6puljiAA6AROk/wrNmn7s9BY0u
	v+ByGKBRykT/m/vh2ja2HtjN87+GVXNhlhgZ3nYnX8EkYOzVCFiWcqaypEgeePfR2eBNKXatNb3R7
	GotVmNzeWe/bDmQbHIiSBrnjyr70Medh0bKtdK9DNrEL4tarYvpDrGoJY0n9Ip2QukbuEgeiiM0pL
	aRw1g+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHjf-0000000C5Lg-0WSG;
	Fri, 06 Nov 2026 11:03:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHjd-0000000C5LS-3ZIW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44D4840A29;
	Fri,  6 Nov 2026 11:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E9D1F0089F;
	Fri,  6 Nov 2026 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793963033;
	bh=1UC53npQZPQBqPO2Jxjhg1ObzLlkCePsQ0TzF6vvsAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y0fehbrxZK4U1L6mbrsLPFee2Z4vhsiKCQDuZDDdR3IP0/KQ1BWj8iz65QCd4sIPU
	 uj2J77yKUmt6TiFfH1cYb+yhDROniFN84dmSsQIZHKrwu3OpwAwHz1Jc52BUUjqUdr
	 ThUvTcx1a6oBpc9VrSqnIGxTt8/Bv85FlxuGoW0FflMeQJTb6WUv2FXsY6PCk5Kusx
	 hBM8RQRp5eSfPensMaUZJpQszG6Cb43fvAzIO31dMR1DleAr6rBTNEquLPnPZyT/NS
	 e+5tKCqEQ0ykqvKQSBDDHdm/67jAW4xKYcmo1uy2W7aMr3Hrn3GIsTFt+MBmC3Elfo
	 d4Oetw6U2C9bQ==
Date: Fri, 6 Nov 2026 12:03:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v4 03/16] dt-bindings: clock: at91: Allow referencing
 main rc oscillator in DT
Message-ID: <20261106-zippy-coucal-of-focus-ecf65f@quoll>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-4-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261105110715.2486432-4-ada@thorsis.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:06:39PM +0100, Alexander Dahl wrote:
> The main rc oscillator will be needed for the OTPC to work properly.
> 
> The new index introduced here was not used on the four affected SoC
> clock drivers before.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


