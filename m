Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7B9C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SFColjhD+ZIQe8shEgoNm7cyd5RsBR22PLT/iSw2KnI=; b=yvSNSOQ4qy/sSFOM19JkmVp3mQ
	2c9t/SbQWkLZks+5DkU1yYUiChQ7V5byOAT2zzIMXRtD2ZWcHe1id4TKy2xbLRSGonkLPSyH3Jt4z
	6Sw+5dTzlBKeBconHanH8XxHMqlSWlPNWP9WQ3Y7sjXOf82Su3inPIxhytS2t6NTFMH8yIBx7q2+g
	xJwXmOemGVk5mpUIMllyXp1XhXtdqTY3WmHHMvweeWl4nNxk629zxSxiXJ5s860fA+YKii4H+idHz
	Bkym4EUYUfiOL4ADUa/llQgUwChhWYfyTH3s5NSRsdi7UOU0GA0vDzd5mBXzdahXa04Uj2g2W+fn6
	zuAEVS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnuz-0000000A2xX-0myv;
	Tue, 27 May 2025 06:36:09 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnsp-0000000A2lb-2sWC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 06:33:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8FF0439C2;
	Tue, 27 May 2025 06:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748327632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SFColjhD+ZIQe8shEgoNm7cyd5RsBR22PLT/iSw2KnI=;
	b=iTT/ha7JeUVtvvaV4TC0Yo2Iun82pKT2PWEea29/lNy8pcP+X/gsT258u8YZurLw9vXbwe
	ZxRJuBpfJ4MGd6c/dakV2MjDrfSi+2h24j+PLtkCqdB4ypuoBe52ryvYoK4qhsKaLa8Djn
	fhh7q8NLLpcMb9c5Jp4Vqx6418Ro9wZhFFe3pcP5NngrDg8UIewPys25oVfqWpD8us0Erg
	FdPZvXa5ogYrFzIXoEBQNlB5NIEW7xVZWc/vzpRF8dKWIMysZLAqYECEbp1gHTWktF/UZu
	BBstWqjtJawASZAU0RcV4+sN6oZstRMO8ikf2whqRrnQOvY5yuLRurA+pYbNdQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 27 May 2025 08:33:44 +0200
Subject: [PATCH v2] net: stmmac: add explicit check and error on invalid
 PTP clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250527-stmmac_tstamp_div-v2-1-663251b3b542@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMdcNWgC/22NQQrCMBBFryKzNpJMjVVX3kNKmaapHTBNSUJQS
 u9uLLhz+R789xeINrCNcN0tEGzmyH4qgPsdmJGmhxXcFwaUqKVGFDE5R6ZNMZGb256zGLRWCgd
 5kniBspuDHfi1Ne9N4ZFj8uG9XWT1tb9a9aeWlVCiM3QmTRUd6/rWeZ+ePB2Md9Cs6/oB1TS4B
 7QAAAA=
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
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduleeikeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepudekveeftdeifedvfefgvdfgjeduieevudeltdeulefhhefgiedvhfethffgffegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemugeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmeguieehpdhhvghloheplgduledvrdduieekrddurddvtdekngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhop
 egvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepjhhorggsrhgvuhesshihnhhophhshihsrdgtohhmpdhrtghpthhtohepphhrvghiugesvghlvggtthhrohhmrghgrdgtohhmrdgruh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_233356_552102_513F664E 
X-CRM114-Status: GOOD (  10.88  )
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

The stmmac platform drivers that do not open-code the clk_ptp_rate value
after having retrieved the default one from the device-tree can end up
with 0 in clk_ptp_rate (as clk_get_rate can return 0). It will
eventually propagate up to PTP initialization when bringing up the
interface, leading to a divide by 0:

 Division by zero in kernel.
 CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.30-00001-g48313bd5768a #22
 Hardware name: STM32 (Device Tree Support)
 Call trace:
  unwind_backtrace from show_stack+0x18/0x1c
  show_stack from dump_stack_lvl+0x6c/0x8c
  dump_stack_lvl from Ldiv0_64+0x8/0x18
  Ldiv0_64 from stmmac_init_tstamp_counter+0x190/0x1a4
  stmmac_init_tstamp_counter from stmmac_hw_setup+0xc1c/0x111c
  stmmac_hw_setup from __stmmac_open+0x18c/0x434
  __stmmac_open from stmmac_open+0x3c/0xbc
  stmmac_open from __dev_open+0xf4/0x1ac
  __dev_open from __dev_change_flags+0x1cc/0x224
  __dev_change_flags from dev_change_flags+0x24/0x60
  dev_change_flags from ip_auto_config+0x2e8/0x11a0
  ip_auto_config from do_one_initcall+0x84/0x33c
  do_one_initcall from kernel_init_freeable+0x1b8/0x214
  kernel_init_freeable from kernel_init+0x24/0x140
  kernel_init from ret_from_fork+0x14/0x28
 Exception stack(0xe0815fb0 to 0xe0815ff8)

Prevent this division by 0 by adding an explicit check and error log
about the actual issue.

Fixes: 19d857c9038e ("stmmac: Fix calculations for ptp counters when clock input = 50Mhz.")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- Add Fixes tag
- Reword commit message to clarify the triggering cause of the issue
- Link to v1: https://lore.kernel.org/r/20250523-stmmac_tstamp_div-v1-1-bca8a5a3a477@bootlin.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 918d7f2e8ba992208d7d6521a1e9dba01086058f..f68e3ece919cc88d0bf199a394bc7e44b5dee095 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -835,6 +835,11 @@ int stmmac_init_tstamp_counter(struct stmmac_priv *priv, u32 systime_flags)
 	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
 		return -EOPNOTSUPP;
 
+	if (!priv->plat->clk_ptp_rate) {
+		netdev_err(priv->dev, "Invalid PTP clock rate");
+		return -EINVAL;
+	}
+
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 

---
base-commit: e0e2f78243385e7188a57fcfceb6a19f723f1dff
change-id: 20250522-stmmac_tstamp_div-f55112f06029

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


