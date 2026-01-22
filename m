Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B60D3EE8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7haES2dn/5FigNq8iK+pSPjf4KhHGzYykyrkPIqtVM=; b=qCXdi8lAhTMyHJJR8nYfuSUhxn
	iTthQqo8Fm20JDwRu0D/tJD0m93fEd5BWgY3LobFAIiqWLso1OKyFc+1GyDMHyX79DOo6pSu6BSKx
	/hwECY/QMSZef0Lw3mjJGCIAbsKDfmrqmTXTyyi81QyAgU9wxzamThTelrv+PQkmzzO9wIyv03BTZ
	8dORPQ8cMp+gj+0qPmQshzqN4gZlPYILzkpAeiJIyYa5ImftDBObI4irKGY7PTkdE4pgRljIyC8ty
	jG5gKe0fMGYNCBNVBsOMwE73C2GmshNgflGX4q9idR7XQB65KMlr2Lg3TUwc+OdTNZmIIur7ykZUN
	6IP6iJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixoy-00000007T8d-3fm9;
	Thu, 22 Jan 2026 16:46:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixow-00000007T82-1NHY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:46:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7276741794;
	Thu, 22 Jan 2026 16:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B899C19422;
	Thu, 22 Jan 2026 16:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769100369;
	bh=uPmc3PZ3Z09O12bVNITp9Iv/l+6xdUK6dBV30LVmlvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ilcr6s08HPute2XfdseF2UWovLayU+6lOFa1F0pOPNz/pJcyfLKkN+jo/3D06WajM
	 zTEOiJwfliH9sltRoev9dGW5fPyKP5UXHzi6T3B/RSN/kbActZHvbQpxSeXJ1Id/3m
	 xuo/vJBoHL9wTDi+1qPgIWt3uUZtGoAf0SNHRDZNt84ZctGS7O/N6ZJyTLA3Q/R2Az
	 DzhbjMXftmvmb5/aXTGyPhPmx0NfFLcY5diMD5HHXmISKBXjgXCsYMxPuh8fNiMOJx
	 STPrcsHjorejznDLHUHS+kWHwFwH29ZpKygScfiHyf09mQS/uguaczXbWQinDPenqq
	 KyKh+qMvLJs4w==
Date: Thu, 22 Jan 2026 10:46:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	devicetree@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v3 02/19] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <176910036733.2542290.7853965507867142412.robh@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-3-ada@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120143759.904013-3-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_084610_402632_7F04EB54 
X-CRM114-Status: GOOD (  15.41  )
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


On Tue, 20 Jan 2026 15:37:23 +0100, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for some of the old PMC definitions.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v3:
>     - full splitup for all at91 family SoCs instead of just a few
> 
>     v2:
>     - new patch, not present in v1
> 
>  .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
>  .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 15 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 +++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 15 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 15 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 15 ++++++++++++
>  .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 15 ++++++++++++
>  include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++++
>  include/dt-bindings/clock/atmel,sama5d3-pmc.h | 14 +++++++++++
>  include/dt-bindings/clock/atmel,sama5d4-pmc.h | 15 ++++++++++++
>  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 ++++++++++++
>  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 +++++++++++++++
>  .../clock/microchip,sama7d65-pmc.h            | 24 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 19 +++++++++++++++
>  14 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
>  create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>  create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


