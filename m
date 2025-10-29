Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D3CCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 08:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6IyJ+LlLM6YfqfAGG0mZLfQKWkTLAs8aGmOyP19EHdg=; b=tceUXmG2Sw+/k3I0fW5toaBLPw
	wigCZhgaaYJSyB223yOemkV9aTebOr12Y5a+hCe4k4yQ74VBLEe5ne//wJ2kQl/rhWsuegek1snsa
	9Px5uc9ZAsuWxtMt1btFMeE0Js19jfc862gswQ1ckzgTPy0qa2WiOMObM3JhlBH2szvZaCdKZlB7I
	OZiK1TVEgODBIYbaNnM25TDKbtgIUKiWlL6nxYszXJkae6FajQzUaeNmGNvKX4t77ULy8e4uOMnoH
	+H7sm3yzB69rm+AFSQHGPe2UFoST6JiDsljzCMgfFl1km4AiTvvK0jfKWZnSn2BVNN8QZujUmXsJJ
	KCshU2BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1CS-00000000Ckj-0jsg;
	Wed, 29 Oct 2025 08:06:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1CL-00000000CeZ-47oC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 08:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFEBA4923B;
	Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5BD8C4CEF7;
	Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761725184;
	bh=lJ1JcnHdvyDKrgvkF/InxR6fht7QWyd7w3ZrjqQQ9h8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BcRRDlLr5xYeb2Mi9o3YKmofKe4m49dtHv2WhfJJhMCgLbqSUY72233AvLmZvaUPy
	 3pT52UGo4jjBvn0oK3rM71NotBEsurzBX771VrzFnLMjXvB7lPJfqCWK5rPgbO5aYK
	 UbxKQAQ4NyQwlD6Sw89lrTjSXKpofVM0+T2saggVff9fDtySs0RbIB95sYPGe/CjN8
	 fi58wuMaymqN5D3Dego7LDDhJncmqRcFSExrJ9m+8EC+f4v8GhulkDYShhjdfHWvs7
	 t8dYGTL9FvLiMcC7Atix+vx6MATfrEohdsGsYzOvBju90ugre34WVuRpN4vs9VSMUo
	 teU0BawZxWQiA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A54CCF9EE;
	Wed, 29 Oct 2025 08:06:24 +0000 (UTC)
From: Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
Subject: [PATCH net-next 0/4] net: stmmac: socfpga: Add Agilex5 platform
 support and enhancements
Date: Wed, 29 Oct 2025 16:06:12 +0800
Message-Id: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPXKAWkC/x2MUQqAIBAFrxL7nZBCSF0lIkxftRAWKiFId0/6H
 JiZQhGBEWlsCgU8HPnyFWTbkD2M3yHYVSbVqV52ahBm5xO5X5CTsFKvTuvBOmxUiztg4/zfJvJ
 IwleL5vf9AEtpE2pnAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725182; l=1154;
 i=rohan.g.thomas@altera.com; s=20250815; h=from:subject:message-id;
 bh=lJ1JcnHdvyDKrgvkF/InxR6fht7QWyd7w3ZrjqQQ9h8=;
 b=DlJCfseSUGZMDjXBw1VVh0mpCeu7xVTb3IZNFGwtIb2gtoPFVZd7U5fHRN6pO+qAd5Jjj6orE
 q/SIliAdApzAhEVmXtDQZjhmvj49K5KPSkeCRRyKCOfz2udKbhDaMSb
X-Developer-Key: i=rohan.g.thomas@altera.com; a=ed25519;
 pk=5yZXkXswhfUILKAQwoIn7m6uSblwgV5oppxqde4g4TY=
X-Endpoint-Received: by B4 Relay for rohan.g.thomas@altera.com/20250815
 with auth_id=494
X-Original-From: Rohan G Thomas <rohan.g.thomas@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_010626_049338_4D1A92FE 
X-CRM114-Status: UNSURE (   8.56  )
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
Rohan G Thomas (4):
      net: stmmac: socfpga: Agilex5 EMAC platform configuration
      net: stmmac: socfpga: Enable TBS support for Agilex5
      net: stmmac: socfpga: Enable TSO for Agilex5 platform
      net: stmmac: socfpga: Add hardware supported cross-timestamp

 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 194 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   5 +
 2 files changed, 189 insertions(+), 10 deletions(-)
---
base-commit: a8abe8e210c175b1d5a7e53df069e107b65c13cb
change-id: 20251029-agilex5_ext-c17bd779cdef

Best regards,
-- 
Rohan G Thomas <rohan.g.thomas@altera.com>



