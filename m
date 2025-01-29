Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90512C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SlS7U5lzDFxHHt3pblTasx+qKhUTEr3oSL9UFPKy8g=; b=OpybdjVXfe+yXZkAFMMPM15Hst
	+9ZdiNscNxK9un0LIMFXOWCMz+c3j1UcBqI7Mgyk8G8Zuw6cG9CETPE1UiPOAZ3kxNlBnvQWToPcG
	KD7WmjTnI27+egTqd3psZoW+VGbY4Q0v0Sdasi7AVdRj7clsiXpumxYOKfM4daZqhL04JVbSZAZGA
	sAFp1IeUqk1L4ruOHdBPgKE9fZDnOKU6SQrKD9bSSx5iQHUf53IeVKGkyRK6ZivE64Yjqy5CW5PGl
	Dgmp7/t4bumz1XKyDgL2a6br2af8f2SRCPIy6ZJS4vQOYSKCZLPdop1ss/US3cIMIOUGlXQJdou4h
	IVyXUpzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td2hz-00000006UhI-3J0t;
	Wed, 29 Jan 2025 07:41:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td2gf-00000006Uds-38R0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 07:40:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECA61A41608;
	Wed, 29 Jan 2025 07:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F6AC4CEE0;
	Wed, 29 Jan 2025 07:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738136436;
	bh=PyibikrF+TCXgDznh/KR1T5STcTdoGrq2A8bnRmM4IE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7608BvFKrGTZLp8LKqrqqhNxpzR95qM2PeidXfImjDePFz3SiI3bZIe3NMP+LEKA
	 fDnw3rdGkQqYv1/9BTHaJ6Th1qgMOXE/j+MyaW443cz1sX3U4Y5mXTKHCK6KuRWb86
	 WIi6w5nVBUkoBAVmTYgi7QeGlrK7y3j9UDpUhAyRXnQIKsUK9i1tmLEL1HNm20K1Ho
	 bBCzH2bRmAb3lnu4pF4qkU5/4kY6qci8qNiScqHJb/hrxjQ8tzDMGKh56B2rujJRzk
	 a06LrxYoVM/+f8QqPmqKriedkJ76lItcLzyTLpb6fKfgEGwyz2RooWr1v6Ft+93TSR
	 4vj6Z0DapzDkQ==
Date: Wed, 29 Jan 2025 08:40:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: patrice.chotard@foss.st.com, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, christophe.kerello@foss.st.com
Subject: Re: [PATCH v2 1/9] dt-bindings: spi: Add STM32 OSPI controller
Message-ID: <20250129-annoying-flawless-porpoise-47daed@krzk-bin>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
 <20250128081731.2284457-2-patrice.chotard@foss.st.com>
 <20250128-panama-manly-a753d91c297c@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128-panama-manly-a753d91c297c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_234037_852339_B1CB4A92 
X-CRM114-Status: GOOD (  13.44  )
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

On Tue, Jan 28, 2025 at 06:02:27PM +0000, Conor Dooley wrote:
> > +  st,syscfg-dlyb:
> > +    description: phandle to syscon block
> > +      Use to set the OSPI delay block within syscon to
> > +      tune the phase of the RX sampling clock (or DQS) in order
> > +      to sample the data in their valid window and to
> > +      tune the phase of the TX launch clock in order to meet setup
> > +      and hold constraints of TX signals versus the memory clock.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Why do you need a phandle here? I assume looking up by compatible ain't
> possible because you have multiple controllers on the SoC? Also, I don't
> think your copy-paste "phandle to" stuff here is accurate:
>       st,syscfg-dlyb = <&syscfg 0x1000>;
> There's an offset here that you don't mention in your description.

This needs double items: and listing them with description, instead of
free form text.

Best regards,
Krzysztof


