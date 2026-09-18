Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9828EC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXRZHMcsTgxtkXJQUt/oaoA/k4rGXpA82LY7OmaC+Cc=; b=KutDTSsE7rj5GriJIqRxEAKnhu
	SS0CibON+5fsPaJx7z+QF0PErTiXK4BwJ5zRs2s6OxDvRoZmSbIMv7DQOYSW9bmtbN6cPXym6SQJy
	eXzTWilIuJ2gpVDvQHUB3eFRaBWHHAunhLkYHmHZapT5i8IZyrUUUQ/KnVNDyID50NvTLll4fob/a
	KfDsf4Wz9YbjQTh09RmWNN/9QvkNx4F4h0gWKN6wSI3eVa6vtOpcU7531NbElRmoJKpe5kZVAwSqx
	Cr6qzZKXTFijum55nvCVzNi55KisUN+nw2//6Bm6ONZzw8Z9djuuT5TZZ8c3QJaEE7MLdr9Y+dIUT
	J8ySRYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WrX-0000000EEj4-0tTY;
	Fri, 18 Sep 2026 11:34:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7WrM-0000000EEeM-1JCA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 11:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pXRZHMcsTgxtkXJQUt/oaoA/k4rGXpA82LY7OmaC+Cc=; b=ZqGZPoRhDEiN325sjcl4fdLSvd
	qaI67G6Z3ynlCu2nrHBJojdG2XC26HhUXsnuhveCx5CVWEjUiPSQQ6W5gJR3s9K6lJ88vaFmygyQf
	WsxYMiKpUp0Rkb921YzpAc8YLbniJlCivVPUeqeaJ7aVV3LEBx5hvEKrUYMpI1lH0A3Ku5Yjp8SiG
	sauu1xdYnoBAY0GbrRaiYsJBYFBlilON3AN4tZVR7FDNHThj6CzlsmPSufHhPW58VSMXpaYRFaRyR
	ZqeCr1XKEL1HDIoX6gzEDrsmAEUkQ3CoH16Ss8CPLQprCJRITJUinAoqgG/9FbIyPfcocGSB+qJyf
	fu7sFT2Q==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7WrJ-0000000A0D8-1KT1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789731265; x=1821267265;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Iy12tCl7T6s6ZRBeoiQcoNoKALMADqPH0I/xSE+s2mQ=;
  b=e9WVhe/4JNXiVBfcYjtm97e79inn0nTY78kNPZDYpaWaTel1j1/A/Jii
   R4qAWCqZ2ystiMjsqu78QL4eQB+KbF6c+4yKDaoCTwiMnVbWTc3v1pm16
   ufnIHlf27TlPiNIcfhKERxabGAwc8OEgsteB/SUkPtOimF3F+w3s7Y+Ic
   3oP40YlZdrArKj5S1CUB1ahqvIs8dpLm6vbIIWf4AqjkKo6KTzOujBoko
   rdK/H0EP7kbI0Klxa2dEonqq2bx9nJZj36v3wUGVX+ccSL4YoE8S0tht8
   l2qF3XCn+xkW3LQNMtK8pKx9xnmcntfpL+lA0YYryO97TOoVPOUi13a7P
   Q==;
X-CSE-ConnectionGUID: 8cdT/sOBSWm5lsOZnY2FOQ==
X-CSE-MsgGUID: K7aEDpCZQ8iyJ3x6J6gLDw==
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="64120987"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Sep 2026 04:34:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 18 Sep 2026 04:34:19 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 18 Sep 2026 04:34:16 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 18 Sep 2026 13:33:54 +0200
Subject: [PATCH net-next v7 02/14] net: microchip: fdma: rename contiguous
 dataptr helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-lan966x-pci-fdma-v7-2-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_123425_791953_12D30361 
X-CRM114-Status: GOOD (  12.75  )
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

When the FDMA library was introduced [1], two helpers to get the DMA and
virtual address of a data buffer, in contiguous memory, were added. These
helpers have had no callers until this series. I found the naming I
initially used confusing and inconsistent.

Rename fdma_dataptr_get_contiguous() and
fdma_dataptr_virt_get_contiguous() to fdma_dataptr_dma_addr_contiguous()
and fdma_dataptr_virt_addr_contiguous(). This makes the pair symmetric
and clarifies what type of address each returns.

[1]: commit 30e48a75df9c ("net: microchip: add FDMA library")

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/fdma/fdma_api.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/fdma/fdma_api.h b/drivers/net/ethernet/microchip/fdma/fdma_api.h
index d91affe8bd98..dea8e3cc155a 100644
--- a/drivers/net/ethernet/microchip/fdma/fdma_api.h
+++ b/drivers/net/ethernet/microchip/fdma/fdma_api.h
@@ -197,8 +197,8 @@ static inline int fdma_nextptr_cb(struct fdma *fdma, int dcb_idx, u64 *nextptr)
  * if the dataptr addresses and DCB's are in contiguous memory and the driver
  * supports XDP.
  */
-static inline u64 fdma_dataptr_get_contiguous(struct fdma *fdma, int dcb_idx,
-					      int db_idx)
+static inline u64 fdma_dataptr_dma_addr_contiguous(struct fdma *fdma,
+						   int dcb_idx, int db_idx)
 {
 	return fdma->dma + (sizeof(struct fdma_dcb) * fdma->n_dcbs) +
 	       (dcb_idx * fdma->n_dbs + db_idx) * fdma->db_size +
@@ -209,8 +209,8 @@ static inline u64 fdma_dataptr_get_contiguous(struct fdma *fdma, int dcb_idx,
  * applicable if the dataptr addresses and DCB's are in contiguous memory and
  * the driver supports XDP.
  */
-static inline void *fdma_dataptr_virt_get_contiguous(struct fdma *fdma,
-						     int dcb_idx, int db_idx)
+static inline void *fdma_dataptr_virt_addr_contiguous(struct fdma *fdma,
+						      int dcb_idx, int db_idx)
 {
 	return (u8 *)fdma->dcbs + (sizeof(struct fdma_dcb) * fdma->n_dcbs) +
 	       (dcb_idx * fdma->n_dbs + db_idx) * fdma->db_size +

-- 
2.34.1


