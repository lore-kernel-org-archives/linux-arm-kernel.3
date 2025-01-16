Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3931C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAMLm6yea8HkssgtGd3J3JCpe9oPgNIXAXNQ53QiS30=; b=b4WeiO6Tu8ZCsHVlGcWpzK3pBj
	lJohxprzafG0F6yKoqNBJjQooy+6uJCc7iXzHxywumAL9YXVLPE/tx7Man8ljdOiBX4b5/HTt8WVR
	8xeEVjVDBHwcfaayHM/OT/5bGjY4xLFkYz0SILB8oeAqu6e4D/2WTKgIxMIDc+uVylUzK0hErfSwd
	/OlBzIjyc99nciud6xL8+SXITn6XO4HGCewp5Y97RjNAmwoJdczcC2mlF+vRN0S/N4Awe1KPdrrFV
	FhrCtA4FMfUReOcw5rRyUyjkr7zXSUnUYVE9Tlt98ZICnxGnb9BwN8t6U3s+8JTeNEttzMFjkrNGJ
	GugQfHkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZWI-0000000GasI-40M0;
	Thu, 16 Jan 2025 23:43:26 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZJP-0000000GT08-0dIP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:30:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737070205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eAMLm6yea8HkssgtGd3J3JCpe9oPgNIXAXNQ53QiS30=;
	b=db6XkV1mGJkBP4oT5jQHxa2uP5KACvfKmttyX13jQ0/E3niZuEkFkWf8JXXzmshfEqbzVW
	b9ej8UFLumPT8fpKZVE4IzUwn43sdlTs7rhsh5gOzod7GfR1Qk7f4l893ahy0mB6RoaccF
	A5GT5BRT17OwzN1jt0iAGavIxptHA9s=
From: Sean Anderson <sean.anderson@linux.dev>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	netdev@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Shannon Nelson <shannon.nelson@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net-next v4 2/6] net: xilinx: axienet: Report an error for bad coalesce settings
Date: Thu, 16 Jan 2025 18:29:50 -0500
Message-Id: <20250116232954.2696930-3-sean.anderson@linux.dev>
In-Reply-To: <20250116232954.2696930-1-sean.anderson@linux.dev>
References: <20250116232954.2696930-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_153007_332430_032C62DE 
X-CRM114-Status: GOOD (  10.44  )
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

Instead of silently ignoring invalid/unsupported settings, report an
error. Additionally, relax the check for non-zero usecs to apply only
when it will be used (i.e. when frames != 1).

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed by: Shannon Nelson <shannon.nelson@amd.com>
---

(no changes since v2)

Changes in v2:
- New

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0532dc94ee93..9e7fa012e4fa 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2059,14 +2059,25 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 		return -EINVAL;
 	}
 
-	if (ecoalesce->rx_max_coalesced_frames)
-		lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
-	if (ecoalesce->rx_coalesce_usecs)
-		lp->coalesce_usec_rx = ecoalesce->rx_coalesce_usecs;
-	if (ecoalesce->tx_max_coalesced_frames)
-		lp->coalesce_count_tx = ecoalesce->tx_max_coalesced_frames;
-	if (ecoalesce->tx_coalesce_usecs)
-		lp->coalesce_usec_tx = ecoalesce->tx_coalesce_usecs;
+	if (!ecoalesce->rx_max_coalesced_frames ||
+	    !ecoalesce->tx_max_coalesced_frames) {
+		NL_SET_ERR_MSG(extack, "frames must be non-zero");
+		return -EINVAL;
+	}
+
+	if ((ecoalesce->rx_max_coalesced_frames > 1 &&
+	     !ecoalesce->rx_coalesce_usecs) ||
+	    (ecoalesce->tx_max_coalesced_frames > 1 &&
+	     !ecoalesce->tx_coalesce_usecs)) {
+		NL_SET_ERR_MSG(extack,
+			       "usecs must be non-zero when frames is greater than one");
+		return -EINVAL;
+	}
+
+	lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
+	lp->coalesce_usec_rx = ecoalesce->rx_coalesce_usecs;
+	lp->coalesce_count_tx = ecoalesce->tx_max_coalesced_frames;
+	lp->coalesce_usec_tx = ecoalesce->tx_coalesce_usecs;
 
 	return 0;
 }
-- 
2.35.1.1320.gc452695387.dirty


