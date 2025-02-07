Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA965C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L663zWHJAJ0zSwFRe0E4kjWKNAWHc7L/2kdkPLFx/qk=; b=l9NmUS0+0rbu8sneb44ZjPVG3f
	bN6BXtMTSN3zq0SZUUZ1rzjC7p0eCFDz6ISTYjm3oIFniHfW9E+ChEjyacFopUd0Hbgn41bbwIskg
	LewsCFEtQfNe3551osXqgd4jG2VOs3/7FsMQawF4PHEo9FHnm01Ktd8lyT8LrZbgZdp1evNlXOhgW
	/Y9ays1d2Hd+A/MxQlL/ch3NfaKDoUYFBeNJI/LRA1Zqa5vXshSl0Me/pXzuzwU4DNR224DVyqLJR
	kB7qadLWYP9pudLufTb1lb7P09Sdc++B7Nrbtn7LJaNVbXeyqzcOGHspULlYpVhfqyUc3uLSjSRa6
	SQLKv3TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRzA-0000000ASMF-49Is;
	Fri, 07 Feb 2025 17:17:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRfX-0000000ANqg-1IW1
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 07 Feb 2025 16:57:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=L663zWHJAJ0zSwFRe0E4kjWKNAWHc7L/2kdkPLFx/qk=; b=RlJ80CJjrPFazDMrB8GJ4UfBWd
	GJ7trnj7azbUcwHIogEsig/J3ylqnV0xRY/9Phxx51/YhkyofrH+TzIgJ+/5A/EsKMliuznxs5ny1
	T25nWjWrsIY8HNR1rfNewVx/KSW+lWgFcmLSrRWZEtR6JLzvGfLJWXxJ1eTJEE+K5QY0nIFqhVv1I
	JQ9GKu5xXC/ww0VwTlxUxWKpWJpUqiE0E2l9L7zw9Z/pbU0qGt6X5w38ZVUxe3aJg865831hoGozx
	+rZzmXAR0pT8nSSCYlSjP9+QX72lvurFKDIGQ6mDo5u09mkczhWMko7SmWSKWDyO1CYZ7Iiqeu9RP
	YlJaeFXQ==;
Received: from mgamail.intel.com ([198.175.65.16])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRfT-0000000HGFn-48Cd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738947448; x=1770483448;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=0OdUdx+lahN2+LUJ2jOFDFj83SCLzyn+8zKWv0oeisM=;
  b=UEDn7Tvif7BVU3NXJAn4lfnrDS73EOgFbMvQwlmV7/oe69gqBjwDcCPA
   ZNSN8lhdYZTidswa2vNbbucHkEfKB5FP5JoTNaleMZpq0BTqAGv1HU6qI
   KZxhAvRNOzp54dii+ysbdIVOu3IpMjXQbVanxpY1RjCGGZMTlUAZdpFlE
   28AACvB3k5JnU0fh4nBA5Z4m7nMHtRYk/ao9wjmiaJ+F+QNvE1tcDjmzc
   tfDFdhSZZTU1/oefE/cOiT0uXboSnBeG+9ZbGr1TenQDBUjsftaOipoGi
   rJKxBmdzws5AKZW8up1qgBYFsndV7G8i+3AXp8zosBsGuUfywLNuVExrE
   Q==;
X-CSE-ConnectionGUID: L+oYzyqVTsmY7rrcZzGThA==
X-CSE-MsgGUID: 4dvQGtmhTF+Psd/alt4AYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39722923"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="39722923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 08:57:27 -0800
X-CSE-ConnectionGUID: A6FhkeyxRMqPRpN3MXExzg==
X-CSE-MsgGUID: j9JtHEfBTN+2pNOtEYixKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="111534539"
Received: from mohdfai2-ilbpg12-1.png.intel.com ([10.88.227.73])
  by orviesa006.jf.intel.com with ESMTP; 07 Feb 2025 08:57:19 -0800
From: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Gal Pressman <gal@nvidia.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH iwl-next v3 3/9] igc: Optimize the TX packet buffer utilization
Date: Fri,  7 Feb 2025 11:56:43 -0500
Message-Id: <20250207165649.2245320-4-faizal.abdul.rahim@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207165649.2245320-1-faizal.abdul.rahim@linux.intel.com>
References: <20250207165649.2245320-1-faizal.abdul.rahim@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_165728_688452_59A77859 
X-CRM114-Status: UNSURE (   9.78  )
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

Packet buffers (RX + TX) total 64KB. Neither RX or TX buffers can be
larger than 34KB. So divide the buffer equally, 32KB for each.

Co-developed-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Vinicius Costa Gomes <vinicius.gomes@intel.com>
Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
---
 drivers/net/ethernet/intel/igc/igc_defines.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_defines.h b/drivers/net/ethernet/intel/igc/igc_defines.h
index 8e449904aa7d..516ef70c98e9 100644
--- a/drivers/net/ethernet/intel/igc/igc_defines.h
+++ b/drivers/net/ethernet/intel/igc/igc_defines.h
@@ -400,7 +400,8 @@
 #define I225_TXPBSIZE_DEFAULT	0x04000014 /* TXPBSIZE default */
 #define IGC_RXPBS_CFG_TS_EN	0x80000000 /* Timestamp in Rx buffer */
 
-#define IGC_TXPBSIZE_TSN	0x04145145 /* 5k bytes buffer for each queue */
+ /* 7KB bytes buffer for each tx queue (total 4 queues) + 4KB for BMC*/
+#define IGC_TXPBSIZE_TSN	0x041c71c7
 
 #define IGC_DTXMXPKTSZ_TSN	0x19 /* 1600 bytes of max TX DMA packet size */
 #define IGC_DTXMXPKTSZ_DEFAULT	0x98 /* 9728-byte Jumbo frames */
-- 
2.34.1


