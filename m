Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28062E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 19:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+kM2FTpXy8ZmYhwW5UZBRCdatTgzuJbmml/gqdxsGN4=; b=NwzPxj2wrTKjIL/AaOjPVMlRX9
	ee0jnjV62tIVXEwlCSX+SXpkvEHoH8qd2iwIED2gWHOwtvfAIjY+yQoJ4TXe6jzXunjKy+kTAhyds
	rgtflD+X0hglP4Xt42IgyxtdemE5LCeom/yqatgsNo6YUM1dNs1Fzri1BmpNWUxQtL5a5noR+hWI5
	PKQfuGQAaW+lk/imCwEOiy7wXsn9JymV203LTFg2OuJPp3bfhfYDQhZ87l6rTKL60j/yMBHcFVSHS
	/Svn5Gk/ZFFz/unOuuSmz0Z+2+lrdEx3bFOOWXRkZ0xSSzBOk9cLM4RysA+4Qy2puf9SAzH0q/MI4
	0ld0vBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKNM-0000000Gigc-0ijq;
	Fri, 10 Jan 2025 19:08:56 +0000
Received: from out-185.mta0.migadu.com ([91.218.175.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWKM7-0000000GiB6-2e70
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 19:07:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736536052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+kM2FTpXy8ZmYhwW5UZBRCdatTgzuJbmml/gqdxsGN4=;
	b=XC9M9cSJuMKjTnzZAlen+eid4xpKY64wWT+ORSRFEVGJNvdJA/YnfKVdfDFOrs9OKKVs+s
	xqT0fmfH+8I8DB7vjS8U7V8PHSr9fGRdmZQR5O97eEkfAuvr32bbxAEBwEfI+rpAjdcS9s
	xCjdPOZvPOot3NIoSsu2e9jyijXBliQ=
From: Sean Anderson <sean.anderson@linux.dev>
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	Simon Horman <horms@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH net v4] net: xilinx: axienet: Fix IRQ coalescing packet count overflow
Date: Fri, 10 Jan 2025 14:07:26 -0500
Message-Id: <20250110190726.2057790-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_110739_943199_65097F56 
X-CRM114-Status: GOOD (  10.15  )
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

If coalece_count is greater than 255 it will not fit in the register and
will overflow. This can be reproduced by running

    # ethtool -C ethX rx-frames 256

which will result in a timeout of 0us instead. Fix this by checking for
invalid values and reporting an error.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
---

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


