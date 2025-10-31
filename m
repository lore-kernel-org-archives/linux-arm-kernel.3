Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80538CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W+IN87OBHk6Ei3FAtLm6+B2JCNOaphkm1SdWUT7016s=; b=EGRrqlt1Di6SyROe7xS/N/qOup
	tocL9Ft0hhg/h93HzjMuhcbHcMZnClO2bJueZXOeiazELKtrII0cHk3GRcHVYsSPPMQ1EzGoyCiFW
	xcSKiZku1OuX0SQMDRmMf+5Q4OSjXoRNldYVq2UePkiGj3voGgLd7rQUXanK8uaFQTPej0CxzJt18
	YY2BgHpMJpRTEWEz1SiAc1YiD4G4uTXxxsyWdYtcOLdpW0ltCl3jVRIAxbljWH/xBqkTBpiQQ8Hz9
	1pqoxOjFWYjTJ9n/l2KzyHkg7X7pZFRtWjCOSYhyzYaPXU7gm4a0Z5rSg+RZCcTonOTW0xMPjjtgj
	zVVp8esw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsuP-00000006TlN-0LYP;
	Fri, 31 Oct 2025 17:27:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsuD-00000006ThC-1SKV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F108432CE;
	Fri, 31 Oct 2025 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6458C4CEE7;
	Fri, 31 Oct 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761931636;
	bh=t4zIx4Z11X9zS02u+s0yDHEllOpDAKEqSMdLm4SCIRU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YezzmReoBglXbbwmuX7vtp2Yo5fWl1KttjMuHVlFK4VMneRMnUbGJrpjNwcAAJWAv
	 wBBNW2CT8fXIxeK1SdB3sV/vmSNuC1LZ7O04Mk86aAGJHpEQ/jrqWDNUxj5oE4QiWs
	 exT7DjIq2vEm1+p3quxHp7VZRNfl7+VX+/h/ZOiinzitSJDqSeAjcggvv11zdcJiTn
	 xv6YMeUrySBTqXgwi892Ivh7Dvv/m0b4+v08+8AoHjzafHbhyId+B6+XsoZGyRj+ri
	 LC77rKbh7ewjJkAEmFCj6al2UmFsQl2V8TDo1mbaiQsv7d5CH/zBN6NdDmu9UI9AjB
	 xjNbYqGXrC5Og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D82CCFA02;
	Fri, 31 Oct 2025 17:27:15 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net-next v2 0/4] net: stmmac: socfpga: Add Agilex5 platform
 support and enhancements
Date: Sat, 01 Nov 2025 01:27:06 +0800
Message-Id: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGrxBGkC/22NwQqDMBBEf0X23JRsxEp66n8UKWmy6oKNkgRJk
 fx7g+cehzfz5oBIgSnCvTkg0M6RV1+DujRgZ+MnEuxqBiVVh1JpYSZeKHcvyklY7N+u77V1NEJ
 dbIFGzqftCZ6S8LUFQyUzx7SG73mz48n/GncUUqBuEVtVze72MEuiYK52/cBQSvkBxwC0UbEAA
 AA=
X-Change-ID: 20251029-agilex5_ext-c17bd779cdef
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rohan G Thomas <rohan.g.thomas@altera.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761931634; l=1421;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=t4zIx4Z11X9zS02u+s0yDHEllOpDAKEqSMdLm4SCIRU=;
 b=8tiYGEzN7w19aqajaofQRjkGf2F3m3eiOWWkDj28bjUqjQj6UIaO4zBm5kbVZIxDz1VNq8w2i
 dSp1UujxJ92AuHoJwtCC4A5HU1kp3nuDde1lw7H3PS28n7NfeQi3Q6x
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102717_426968_1392CE37 
X-CRM114-Status: UNSURE (   8.81  )
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
Reply-To: rohan.g.thomas@altera.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds support for the Agilex5 EMAC platform to the
dwmac-socfpga driver.

The series includes:
   - Platform configuration for Agilex5 EMAC
   - Enabling Time-Based Scheduling (TBS) for Tx queues 6 and 7
   - Enabling TCP Segmentation Offload(TSO)
   - Adding hardware-supported cross timestamping using the SMTG IP,
     allowing precise synchronization between MAC and system time via
     PTP_SYS_OFFSET_PRECISE.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
---
Changes in v2:
- Fixed reduntant leftover tsis irq and use_ns changes from smtg_crosststamp
- Keep common platform config for socfpga platforms in socfpga_dwmac_probe
- Link to v1: https://lore.kernel.org/r/20251029-agilex5_ext-v1-0-1931132d77d6@altera.com

---
Rohan G Thomas (4):
      net: stmmac: socfpga: Agilex5 EMAC platform configuration
      net: stmmac: socfpga: Enable TBS support for Agilex5
      net: stmmac: socfpga: Enable TSO for Agilex5 platform
      net: stmmac: socfpga: Add hardware supported cross-timestamp

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 166 ++++++++++++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   5 +
 2 files changed, 168 insertions(+), 3 deletions(-)
---
base-commit: 0d0eb186421d0886ac466008235f6d9eedaf918e
change-id: 20251029-agilex5_ext-c17bd779cdef

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



