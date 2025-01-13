Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557EBC02186
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pl+wZ2x+ZdqTG0lEglmVegKw0Hhj58CtH64CcDGmvHU=; b=p2UKT4TBlSUIBHK9DReHoI9n+I
	0E5GtmeV8faFz6SMAMlQRHAv6jvSg741rnuH3S8vQiTrCUjerwe6dNjXilFRW5eAvhLm6uCKBIUbM
	fjvuXDvqTYzBi7BAtKI3Bb9vtHjvu8Q3mxqtKnIfYHbMAklVDldytocDKxrD7gn6pyFddSPDcQ8iR
	00VIH/+uSFhLzq41BlzbxtNobFiiVF1PmLHycDbPODJ0mSClRjCwo1xJgpEv+ud+4k5qUrpk9mFx4
	OjwuNyyaB1aR8misCXv3xdWcDbxAG7h/DNI1K+IxHYeYIzjAh5TNCOmokmSg0LU4h13WjBx7dfutz
	2FrgskLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNZE-00000005ui6-3asg;
	Mon, 13 Jan 2025 16:45:32 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNKW-00000005rTp-0eUT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 16:30:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736785815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pl+wZ2x+ZdqTG0lEglmVegKw0Hhj58CtH64CcDGmvHU=;
	b=goFtUNsyFKOML04zHS6B/aG6lQPGVAgvkHREkRd2ONO2kArsAR7tInmmevzqhWY7ZgLB0p
	qj2BwfUGVQtBR2KQBzOMycMYLcIVBaKzWuFp0SRU4pNkNUo3I2Fuefx9NpdXGEL+H6AWu3
	TK6FoJ+cChKKcMoOIWi3B7rC1oB5+S4=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Simon Horman <horms@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net v5] net: xilinx: axienet: Fix IRQ coalescing packet count overflow
Date: Mon, 13 Jan 2025 11:30:00 -0500
Message-Id: <20250113163001.2335235-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_083021_282844_FA957E99 
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

If coalesce_count is greater than 255 it will not fit in the register and
will overflow. This can be reproduced by running

    # ethtool -C ethX rx-frames 256

which will result in a timeout of 0us instead. Fix this by checking for
invalid values and reporting an error.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Reviewed-by: Shannon Nelson <shannon.nelson@amd.com>
---

Changes in v5:
- Fix typo in commit message

Changes in v4:
- Fix checking rx twice instead of rx and tx

Changes in v3:
- Validate and reject instead of silently clamping

Changes in v2:
- Use FIELD_MAX to extract the max value from the mask
- Expand the commit message with an example on how to reproduce this
  issue

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 0f4b02fe6f85..ae743991117c 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2056,6 +2056,12 @@ axienet_ethtools_set_coalesce(struct net_device *ndev,
 		return -EBUSY;
 	}
 
+	if (ecoalesce->rx_max_coalesced_frames > 255 ||
+	    ecoalesce->tx_max_coalesced_frames > 255) {
+		NL_SET_ERR_MSG(extack, "frames must be less than 256");
+		return -EINVAL;
+	}
+
 	if (ecoalesce->rx_max_coalesced_frames)
 		lp->coalesce_count_rx = ecoalesce->rx_max_coalesced_frames;
 	if (ecoalesce->rx_coalesce_usecs)
-- 
2.35.1.1320.gc452695387.dirty


