Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4D606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qgA/g6hy;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=A6GNpLVt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iCM2cycWCwaMm6hiUmHFooj8p+WDE9YQ8jpkczfNGY0=; b=qgA/g6hyz8+Mf+DcHQr5WynRpS
	VBK+h0ZPNencudmeFh0WVYmxzpCR8E1+3nU0YD03aE+aLF0tnmcQhynq3y6trTRSrIG4HwUKMzeFT
	LV1TeE6j7120hoIp1qy5GRVTwEU8Niwo8RkzyhadHZHNqhBFZGQiHonRkqy1yc3GFqDssEhkepmg7
	XwwKfVw5pxzpGUxeoDtjjzlwvvArQE2dbhsidQ82w0lJDoQzK7y7sFqmnlp8K6HK62VtuyIhjec2d
	127HY0T7SBGEl0WIHxz/xjiNc/CuSklumkous0Tij3z+YBduJpITxnBy7lN0dkzOMKAXYC83pepLF
	Wr4ivG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHiZ-0000000C54c-2bTp;
	Fri, 06 Nov 2026 11:02:47 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHiX-0000000C532-068R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:02:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C5874148053E;
	Fri, 06 Nov 2026 12:03:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793962999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iCM2cycWCwaMm6hiUmHFooj8p+WDE9YQ8jpkczfNGY0=;
	b=A6GNpLVtsHeso5gjnzHSm1aqE0/DodHSklqFKj3InXBy6KlEULAYwPHatJbuAddtQa93uF
	AZFPqP/uvqt+qMBpd+2F4QqG8ovRyO63QJrGAsgTomrOITHHZLcO9F0KUrrVwjpEJAYkmZ
	/BiwpQKbN2tZc0hbVc7ylpryvVD2DbHVodmizuFGsL6bQdGU2uGawgOLqJIwOJabdbIkm6
	mToHBkcFTRlZH221UqgLDOllYDIUy90UHj/w63IrI5Nu2+xlrDJRiaRvobqyNsaQIeWdu8
	cpGriQdE5PVr4vHPBZMC30nNREGJVVjpDRSw+BzGZB263VXKpxPrIdVRaIcqcw==
Date: Fri, 6 Nov 2026 12:02:35 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20261106-oil-swear-a9e81127bc25@thorsis.com>
Mail-Followup-To: Krzysztof Kozlowski <krzk@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
 <20261106-beige-ostrich-of-merriment-ae6eb0@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-beige-ostrich-of-merriment-ae6eb0@quoll>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_030245_540763_8E54F4AB 
X-CRM114-Status: GOOD (  19.48  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Krzysztof,

Am Fri, Nov 06, 2026 at 11:57:53AM +0100 schrieb Krzysztof Kozlowski:
> On Thu, Nov 05, 2026 at 12:06:38PM +0100, Alexander Dahl wrote:
> > Before adding even more new indexes creating more holes in the
> > clk at91 drivers pmc_data->chws arrays, split this up.
> > 
> > This is a partial split up only for some of the old PMC definitions.
> > 
> > Binding splitup was proposed for several reasons:
> > 
> > 1) keep the driver code simple, readable, and efficient
> > 2) avoid accidental array index duplication
> > 3) avoid memory waste by creating more and more unused array members.
> > 
> > Old values are kept to not break dts, and to maintain dt ABI.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >     v4:
> >     - "re-added" some definitions present in hardware but not used in dt
> >     - reword header comment (at91 -> Microchip) for newer SoCs
> >     - PMC_UTMI was renamed where appropriate according to datasheets
> >     
> >     v3:
> >     - full splitup for all at91 family SoCs instead of just a few
> >     
> >     v2:
> >     - new patch, not present in v1
> > 
> >  .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
> >  .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
> >  .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
> >  .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
> >  include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
> >  include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
> >  include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
> >  .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
> >  .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
> >  .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
> >  .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++
> 
> I miss the "split" part. You only added defines, shouldn't you remove
> them from other binding?

This is done later in the series in
[PATCH v4 16/16] dt-bindings: clock: at91: Remove old PMC definitions.

Greets
Alex


