Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19391CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 10:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=43yyG9LNy5Zyb96mTIsBza5rvvnkZsHU9mwls4Id0h8=; b=t5bStaZe1/dAnL
	KxSe9VkrJxiO674g0SLJFE6hZwklD3ZcYh7cWWEntoKLyNL9aF9fe3KLgx4E0Qj7vT5fc27dz41nw
	H4aPN6fFI0bw1xYmc6DzSKgI68cWijD+o9IaCtCg0P9qQ9WhB9M6NXS9ib8QAamCp57vYEecwVlqs
	Q17SDjD1mbRGvURQ4SQOeXeG1tfmwLkewU9izhINJv2wsnhoGnmvnudGFFhdBL4nRR2zOG7o1RTWS
	6AI7etzHaTky3+VURiRWhS2cOax4qKm4vjPve6NVLz4CfVm1VT8yiP2I0VNr/PnEtsN6+5jRufkgQ
	VQLQ/fdVnA7Ai7PmxbjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJjD-0000000H50W-1h0g;
	Fri, 07 Nov 2025 10:29:59 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJj6-0000000H4zq-2Luc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 10:29:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 603D6441E6;
	Fri,  7 Nov 2025 10:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1762511388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=43yyG9LNy5Zyb96mTIsBza5rvvnkZsHU9mwls4Id0h8=;
	b=TmdEkJ75lNDvbZzF3RAYKGUmIJfu/FQKzzHTFCF46egr3grD0MHW8oAqSD0tmpdBu4RW9P
	gjLM9Q3PEP+LSqfSCvmAiS7ZU9NaBuIU6fZj5cGiOKBnXVr8O5wc2Ijnh51O55on+h3aIM
	pvVAWCivuHMlgnACT7jsgDPDZIOZ4FyGvi/OeMWFSSli2hr2obP5pC3uplYlzW2rtHgjx5
	IMYvQlUAinb2UCUYHeRlCoI2keUA7ctSmuGi5B3+VZvhyGjA6L5bUlX2eZi4vyLpsK4rtM
	ZIkjUc+uY58wfMZ/kK2N8XgJ3LXlThyEIspz8wYwyDy40hfvMCLgh/deqGHExQ==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 0/2] m68k: coldfire: Add RNG support and const
 qualifiers for MCF54418
Date: Fri, 07 Nov 2025 11:29:42 +0100
Message-Id: <20251107-b4-m5441x-add-rng-support-v2-0-f91d685832b9@yoseli.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABbKDWkC/x3MQQqEMAxA0atI1gbSUnGYqwyzqCZqFlNLOoog3
 t3i8i3+P6GIqRR4NyeY7Fp0TRW+bWBcYpoFlavBk++cox6HgL8uBHdgZEZLM5Yt59X+SBMPLw7
 kHUWofTaZ9Hjen+913eC3QNJrAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762511384; l=1826;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=MUNYUXR+6Apmlduc5P0840WUQkROO+KLh9YaxqpeACI=;
 b=eVGUWoVGiY2HGHRt1PEYYMxNqqX3aeQhPojZB5FNxte8LKv8HnWJFBlR1zIUSo5fr78aoXEG2
 273WE5cmvwQBKRezy3ONRUdo25kJxA+1nN7Ps6ANkITL/hGheH6GZF8
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeelgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeduteehgeeihfelleelkeetkeetvefhvddugeduvddvudegheelkeeltdfftdehjeenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemkegtrgdtmedukegtjeemhegvfhgtmegtsghfvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemudeileemjedugedtmeektggrtdemudektgejmeehvghftgemtggsfhdvpdhhvghlohephihoshgvlhhiqdihohgtthhordihohhsvghlihdrohhrghdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepudehpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvr
 hhnvghlrdhorhhgpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehgvghrgheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_022953_283890_D5CA3DC4 
X-CRM114-Status: GOOD (  10.34  )
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

Changes since v1:
- Split const qualifier changes into a separate patch as suggested by
Frank Li
- Mark all resource arrays (including RNG) as const in device.c
- No functional changes to RNG implementation

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Jean-Michel Hautbois (2):
      m68k: coldfire: Mark platform device resource arrays as const
      m68k: coldfire: Add RNG support for MCF54418

 arch/m68k/coldfire/device.c       | 52 ++++++++++++++++++++++++++++++---------
 arch/m68k/coldfire/m5441x.c       |  2 +-
 arch/m68k/include/asm/m5441xsim.h |  9 +++++++
 drivers/char/hw_random/Kconfig    |  3 ++-
 drivers/char/hw_random/imx-rngc.c |  9 ++++++-
 5 files changed, 60 insertions(+), 15 deletions(-)
---
base-commit: 5e5629c7ce42cfa1da9c6aaaa6d7aff0d396c46e
change-id: 20251107-b4-m5441x-add-rng-support-0fdb8d40210a

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


