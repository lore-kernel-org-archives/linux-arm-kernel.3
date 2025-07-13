Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2BBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qP6KoV5CXuuAkUdr031k/qKYDOKU34Hd4PhkXMn82q8=; b=B59rNPn9Q+zjkrigcKzSKURDnq
	ReDwSHz9y7R6vKyk1k5KqHokVw/wBNHcfZe2S/Scs7BO8X7mAK2cIBZQsIF2eCr/XzSdjVcd+KapG
	ZrsUg57eL+jhienB0lZE8bj/z/Uv1PA6tk082/1AOYHI1yOzgxhQ3XECFYVak+Nm6BK+yI0vU1oVf
	mV7NONt491BF49AxvCqqrOvSWsd3erWsQnYBCluhKEGa2c4rZVkgg6Z/DJq2S6kD1QGIHSxSuAZC+
	yBzals1rzEJ8vD0a2eWYH1HhiO73G4U3yB3NfmTGsMjn/v7iaQRnItlKaOlklFIhIZ3ARoqzeSF8r
	+qC82/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3Xj-00000000cAX-1OO4;
	Sun, 13 Jul 2025 20:43:27 +0000
Received: from mail.blochl.de ([151.80.40.192] helo=smtp.blochl.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub3VJ-00000000c6X-2K8z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 20:40:59 +0000
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.blochl.de B84804466439
Authentication-Results: mail.blochl.de; dmarc=none (p=none dis=none) header.from=blochl.de
Authentication-Results: mail.blochl.de; spf=fail smtp.mailfrom=blochl.de
Received: from workknecht.fritz.box (ppp-93-104-0-143.dynamic.mnet-online.de [93.104.0.143])
	by smtp.blochl.de (Postfix) with ESMTPSA id B84804466439;
	Sun, 13 Jul 2025 20:21:45 +0000 (UTC)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.2 at 472b552e6fe8
From: =?utf-8?q?Markus_Bl=C3=B6chl?= <markus@blochl.de>
Date: Sun, 13 Jul 2025 22:21:41 +0200
Subject: [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
X-B4-Tracking: v=1; b=H4sIAFQVdGgC/x3MSQqAMAxA0atI1hY6KA5XEZFao2ZhK00RQby7x
 eVb/P8AYyRk6IsHIl7EFHyGKgtwu/UbClqyQUtdy0YZwek4rJtcDMyJhamW1s5t10llIUdnxJX
 ufziAxwTj+37rhsIvZQAAAA==
X-Change-ID: 20250713-stmmac_crossts-34d8ab89901a
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 John Stultz <jstultz@google.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 markus.bloechl@ipetronik.com, 
 =?utf-8?q?Markus_Bl=C3=B6chl?= <markus@blochl.de>
X-Mailer: b4 0.14.2
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (smtp.blochl.de [0.0.0.0]); Sun, 13 Jul 2025 20:21:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_134057_728084_30821D4B 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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

get_time_fn() callback implementations are expected to fill out the
entire system_counterval_t struct as it may be initially uninitialized.

This broke with the removal of convert_art_to_tsc() helper functions
which left use_nsecs uninitialized.

Initially assign the entire struct with default values.

Fixes: f5e1d0db3f02 ("stmmac: intel: Remove convert_art_to_tsc()")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Blöchl <markus@blochl.de>
---
Notes:
    Related-To: <https://lore.kernel.org/lkml/txyrr26hxe3xpq3ebqb5ewkgvhvp7xalotaouwludjtjifnah2@7tmgczln4aoo/>
    Related-To: <https://lore.kernel.org/lkml/20250709-e1000e_crossts-v2-1-2aae94384c59@blochl.de/>
    Only compile tested
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 9a47015254bbe60b806b00b80dbd5b1d8f78a7c6..ea33ae39be6bbca5dc32c73e6d02e86a9d8d6e62 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -433,6 +433,12 @@ static int intel_crosststamp(ktime_t *device,
 		return -ETIMEDOUT;
 	}
 
+	*system = (struct system_counterval_t) {
+		.cycles = 0,
+		.cs_id = CSID_X86_ART,
+		.use_nsecs = false,
+	};
+
 	num_snapshot = (readl(ioaddr + GMAC_TIMESTAMP_STATUS) &
 			GMAC_TIMESTAMP_ATSNS_MASK) >>
 			GMAC_TIMESTAMP_ATSNS_SHIFT;
@@ -448,7 +454,7 @@ static int intel_crosststamp(ktime_t *device,
 	}
 
 	system->cycles *= intel_priv->crossts_adj;
-	system->cs_id = CSID_X86_ART;
+
 	priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
 
 	return 0;

---
base-commit: 3cd752194e2ec2573d0e740f4a1edbfcc28257f5
change-id: 20250713-stmmac_crossts-34d8ab89901a

Best regards,
-- 
Markus Blöchl <markus@blochl.de>


