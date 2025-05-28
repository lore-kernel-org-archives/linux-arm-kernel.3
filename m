Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DD1C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NdtCm4KeLnVfdZbdleEEAwUOA4JSpjcY4XsOVNaCHbA=; b=zBioC/VtIymyPe
	W4+JB/f4IkPz14rUXUgMsCBGio54SoO+CnYnwzLolIhEplReJl3V9wi5fjtRE3KVUCF7uEbgbb8RC
	agCBjL4gwrHRdC9N3VpjE2GZfSh5QEkpLcfhQqyYG5EWGeyAAXcKuqZWoIqoRqKgp0h1o+7q83llp
	TbsLmOaQ7qsvVkCzOCkGeglHN4oWJp9iXQRb1MGyfJLqBdaEyYsmHurEvxLCCQCr9IzjCMirJ3TST
	GQOi7KQrEoRtuOtXWTuq0R73x401RMqoxtmULukRdPYYhc6Ab9oMY51aflFHDgBi4NhC7e0Risei8
	T+u0nTjRr0Dy+3ItDW0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCHM-0000000CbSs-18B0;
	Wed, 28 May 2025 08:36:52 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCAk-0000000CabI-3Xs3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:30:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A2A743153;
	Wed, 28 May 2025 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748420999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NdtCm4KeLnVfdZbdleEEAwUOA4JSpjcY4XsOVNaCHbA=;
	b=P7aRpHv7sMWWrZgOxiKy1icjDjdNKPlrhclj5/VB53qk4dbSNWVQoiwJRhv8erY0AQcw1D
	I4VB4G1QvEcmKyuxr9+CNXY/N/IkfahRsO70dhKZIo7AvRTMUHIhlcyrgfsxE+X+N6fvNS
	kPWL9uB0+1RclnJDiq/3XiSiGjGivFgDLf7JBujpLMw2zeaLZ99v905KZlEVsdwGMEqrYV
	zbFbwyG6IVPGuB9n+FZ4OyM3m0JkCWwLI5gakTFl3bSTTxGg/dd3CesKN5CZy0SihhDSJL
	9dskNPfyLFiJtnMcb4DCDmxTZOPtqu+Td0sI/q8V7yBqy7BIATfIn/qW5S5qiw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Subject: [PATCH v3 0/2] net: stmmac: prevent div by 0
Date: Wed, 28 May 2025 10:29:49 +0200
Message-Id: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAH3JNmgC/23N0QrCIBTG8VcZXmfocW7VVe8RMdS5dqDNoSLF2
 LvnBkHBLv8fnN+ZSbAebSCXYibeJgzoxhziUBDTq/FhKba5CTCQTALQEIdBmSaGqIapaTHRTkr
 OoWMVgzPJd5O3Hb4283bP3WOIzr+3F4mv61cTO1rilFNt1ElJJVRZ11ftXHzieDRuIKuX4Neo9
 wzIRlUJkFwLLUv4N5Zl+QDThLVm+AAAAA==
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
 Jose Abreu <Jose.Abreu@synopsys.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdejkeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffefvdelledtfeekudelvdekvdeuffduieevkedviedtgeefueehgfdvuedthfeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrv
 gessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtoheplhhinhhugidqshhtmhefvdesshhtqdhmugdqmhgrihhlmhgrnhdrshhtohhrmhhrvghplhihrdgtohhmpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvght
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_013003_037238_92254019 
X-CRM114-Status: GOOD (  10.23  )
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
platform at boot (see commit 1) due to a division by 0. This new
revision add the same check in another code path possibly affected by
the same issue, as discussed in v2.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
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
base-commit: e0e2f78243385e7188a57fcfceb6a19f723f1dff
change-id: 20250522-stmmac_tstamp_div-f55112f06029

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


