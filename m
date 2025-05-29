Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB11C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mPkPFeJr+GG2QcllwMOxn9k+r0jQZG2uRhor86+okS8=; b=q2SKEU3bK/5W6O
	+6dxVu9J9Wg47KvhRQz5RDBb0DSgZLwjJTQ4Iw3yaDpSu2ZivRITIzRQHcsQ6prTkTGVxn638LHq1
	WA1zcyYcMvPWKSEMYR6QoygYaWIcWNoY3Q2tgZSwbOXKXdzUvC1D412FXbkwEzpfRH4QbWwn+W8qD
	XJ1gMB47wsRgVdDiBJwCfvDL0YuRvhPqI5LfB5yo522BdgsPt7TVLNsioWJwJrdkCElKOM3sOp3z7
	DByKrZ60SOUvW+Vh8Jm9i5p/OTmmN93M/C9j/LGMgSZ9s8wg3ZVfdzJlW0/IBOfIjlZodka/skiOx
	uQXN6Mlu4PF4MsgQn4+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZLR-0000000FNrO-46if;
	Thu, 29 May 2025 09:14:37 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZEf-0000000FMDX-2oua
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 09:07:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D39D3432F7;
	Thu, 29 May 2025 09:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748509652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mPkPFeJr+GG2QcllwMOxn9k+r0jQZG2uRhor86+okS8=;
	b=GjSyVNNhLuWD0eGfSgz+3Na5WuC2OLzLh+5UnSJNzmVrch94OoeOIFQsbUUciQ5mVMulgU
	+QFiWpUrs3eTBRdCWjtrqiIWAj36uYmsahEcEjnm8tOxk/lEiniaH/9BTj1vf5is09GDXs
	QPbSLpgKtUIPgHaUY8tGCqdYrdu4eLsPs7hI6I/dU8hb065JCHL5il/ka5TewcMuDSQZq6
	6IRdyaD40n/GlpN7kwPFjaCuPnEDyVd2PPjEwaSf0GTe3aHp05g1uua356TOMb1nwSn53v
	/7x3obzzl3JCMiCjQRlmex//ESAt1MC5dqgiGZaIkGiEfRUE0TZPmFZNt9izoA==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [PATCH v4 0/2] net: stmmac: prevent div by 0
Date: Thu, 29 May 2025 11:07:22 +0200
Message-Id: <20250529-stmmac_tstamp_div-v4-0-d73340a794d5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMojOGgC/23N0QqCMBTG8VeJXbfYzjxqXfUeEbLNmYN04sYox
 HdvCoGRl/8Pzu9MxJvRGk8uh4mMJlpvXZ8iOx6IbmX/MNTWqQkwQIYA1Ieuk7oKPshuqGobaYP
 IOTQsZ3Am6W4YTWNfq3m7p26tD258ry8iX9avJna0yCmnSstSohQyK4qrci48bX/SriOLF2FrF
 HsGJCPPBSBXQmEG/4bYGuWeISijCgGNrpu6zPSvMc/zB2EIctk8AQAA
X-Change-ID: 20250522-stmmac_tstamp_div-f55112f06029
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Phil Reid <preid@electromag.com.au>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jose Abreu <Jose.Abreu@synopsys.com>, Yanteng Si <si.yanteng@linux.dev>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvheejfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefvdelledtfeekudelvdekvdeuffduieevkedviedtgeefueehgfdvuedthfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurddvtdekngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudelpdhrtghpthhtoheprhhitghhrghruggtohgthhhrrghnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopehmrgigihhmvgdrt
 ghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeflohhsvgdrtegsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehjohgrsghrvghusehshihnohhpshihshdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_020738_133330_BCDAACB3 
X-CRM114-Status: GOOD (  10.50  )
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

Hello,
this small series aims to fix a small splat I am observing on a STM32MP157
platform at boot (see commit 1) due to a division by 0.
There is no functional change in this revision, this has just been
rebased on top of net/main.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v4:
- collect RB tags
- rebased on net/main
- Link to v3: https://lore.kernel.org/r/20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com

Changes in v3:
- remove now duplicate check
- add ptp_rate check in est_configure
- Link to v2: https://lore.kernel.org/r/20250527-stmmac_tstamp_div-v2-1-663251b3b542@bootlin.com

Changes in v2:
- Add Fixes tag
- Reword commit message to clarify the triggering cause of the issue
- Link to v1: https://lore.kernel.org/r/20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com

---
Alexis Lothoré (2):
      net: stmmac: make sure that ptp_rate is not 0 before configuring timestamping
      net: stmmac: make sure that ptp_rate is not 0 before configuring EST

 drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)
---
base-commit: 271683bb2cf32e5126c592b5d5e6a756fa374fd9
change-id: 20250522-stmmac_tstamp_div-f55112f06029

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


