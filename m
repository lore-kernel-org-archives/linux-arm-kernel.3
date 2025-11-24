Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172E0CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Iz84JXpr1Wzt9qHfLXBjH0UwcZH1zgAuKf5TwypISLI=; b=vRZfchINXledQ+
	MD1QjEtP7/3DIIzcuir6I1pQqPJ1TPiUOyFzke+MCyHp9MWiyRFSPK+FLwrdySeDvCXV9yoUdfE4I
	XQNpITeL5hDwNPHowRYwQgzCT+Bx+j4DRYD269d7YohcCEJHtZeIOj2WrF8tr4k02hb/87jn9uxV2
	eduwtnhe+Gc13KW1Cjl8FLosdLzKs4NNURelDnYvhQasS1ITy+f9RfVR4TNP6v98A/6BXlYrkOB7p
	mQmHhdyOhYnBgOfT+N+DcYv33QsR2+uze0L6w1MrzkNHj0LXPBcFKq8Xp450KceMh4qd7iIvpdXoC
	rv+TFPqQIrNgMoT4EvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWF5-0000000Bh25-2ZWi;
	Mon, 24 Nov 2025 13:04:31 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNWEy-0000000Bgw7-2Phm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 13:04:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3CCD644287;
	Mon, 24 Nov 2025 13:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1763989453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Iz84JXpr1Wzt9qHfLXBjH0UwcZH1zgAuKf5TwypISLI=;
	b=Zt4h9Xnc+VgkZ+ClQYTR6tf/8V365T0zZK/TVtsBVREhskVhXLeb0YvbgwGMnDNIN8eBZe
	BoJRnoA76OHe92Pcw3tDIb5VVY6nOn8qCGWRLVqaTD9cpzEQWri1H52H7tTqvgTM5sqwwl
	ji+nvZrUT9Z7QFL2vcLl1Q4Zq5oW3f9md+wm+RpJuYvhtjxkXhHy6LFrXmGrrCnYsQ4BCp
	OiQ4p35od93O0+9a4d8vL4xSgYhnwaEiZOYMGgg6muUNa7TtaUTLxo0lSuyepjQZ4oRTam
	SRBLcFXb+TCen7HjJ5xkAroshnwFlEXrsur1UNEpRE3E8hSkEPitE6M6iPK0AQ==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v3 0/3] m68k: coldfire: Add RNG support and const
 qualifiers for MCF54418
Date: Mon, 24 Nov 2025 14:04:05 +0100
Message-Id: <20251124-b4-m5441x-add-rng-support-v3-0-f447251dad27@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMVXJGkC/42NQQ6CMBBFr0Jm7Zi2FAVX3sOwaG2BSZQ2UyQQw
 t2tnMDle8l/f4PkmXyCW7EB+5kShTFDeSrgOZix90guMyihKinFFa3Gd6W1XNA4hzz2mD4xBp5
 QdM7WTgslhYG8j+w7Wo72o808UJoCr8fVrH72n+qsUGDXSHepq7pUtrmvIfkXnQP30O77/gW44
 mqfwwAAAA==
X-Change-ID: 20251107-b4-m5441x-add-rng-support-0fdb8d40210a
To: Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763989450; l=2074;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=0UAP833jY/lb8txc7zCx1KB4AkZTvgzHkZy42y98Tew=;
 b=IOWyT2SHmlZDdAReG6ykhqIOoK01euZHGQiy2C+rgvsv+tKNJH6if5FdUVJ+ZQ/8I0educP0Z
 8XDIw3GfNVzBvtAUKienQlIP7lEmgPrEZdRBNx8mGNJ7S3xfEngGXJU
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeekieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeekkeevfeelffehgedvuefhieektdellefhffeuueffkefhueetudetkeevffegudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemudeileemjedugedtmeekkegsfeemheduheefmegtvdeigeemgehfsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemudeileemjedugedtmeekkegsfeemheduheefmegtvdeigeemgehfsgdphhgvlhhopeihohhsvghlihdqhihotghtohdrhihoshgvlhhirdhorhhgpdhmrghilhhfrhhomhepjhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmq
 dhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghv
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_050424_773561_A962196A 
X-CRM114-Status: GOOD (  11.01  )
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

This series adds support for the MCF54418 hardware random number generator
(RNGB) and improves type safety for platform device resources.

The MCF54418 contains an RNGB hardware block compatible with the imx-rngc
driver. This series enables its use by:
- Adding platform device registration for the RNG hardware
- Enabling the clock at platform initialization
- Making the imx-rngc driver compatible with Coldfire's always-on clock
model using devm_clk_get_optional()

Additionally, following Frank Li's suggestion, all static resource array
in arch/m68k/coldfire/device.c are marked const, moving them to read-only
memory and aligning with kernel API expectations.

Testing on DLC Next board shows:
- Hardware RNG throughput: 26 MB/s
- FIPS 140-2 quality: 0.2% failure rate (rng-tools)
- Boot time improvement: CRNG initialization 7 seconds faster

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v3:
- Depend on COLDFIRE is enough
- Split the clock change in a dedicated commit
- Link to v2: https://lore.kernel.org/r/20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org

Changes in v2:
- Split const qualifier changes into a separate patch as suggested by
Frank Li
- Mark all resource arrays (including RNG) as const in device.c
- No functional changes to RNG implementation

---
Jean-Michel Hautbois (3):
      m68k: coldfire: Mark platform device resource arrays as const
      hwrng: imx-rngc: Use optional clock
      m68k: coldfire: Add RNG support for MCF54418

 arch/m68k/coldfire/device.c       | 52 ++++++++++++++++++++++++++++++---------
 arch/m68k/coldfire/m5441x.c       |  2 +-
 arch/m68k/include/asm/m5441xsim.h |  9 +++++++
 drivers/char/hw_random/Kconfig    |  3 ++-
 drivers/char/hw_random/imx-rngc.c |  9 ++++++-
 5 files changed, 60 insertions(+), 15 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251107-b4-m5441x-add-rng-support-0fdb8d40210a

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


