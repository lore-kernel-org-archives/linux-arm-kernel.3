Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B00CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QLja7/Tx5Y13t+WqDB4cLuid2QcyXQZ6OpQKti+65Zc=; b=sXORv16Rrqzdv2tmw+TTTL0XGN
	4d4Dsd55ehHChUH3HyurgF1A75lVCFl6xPYRzozJ+2ZY6Q4GyRRZkl3LLMtVwN1FKgcTWUVC8h588
	p+HW6jYjGZnJsT02BO6OXvzuvG5KJUIl9KgCJDO7vFIRKruBV/mBWQwGV3LceQu2ERQ1YriRFyUWs
	J+ZqHoj20tqCR8cEPMpgUadKsQTdlL9eUz/lx/TYTAdh3yY200WgBjTHzYibHiAwPW4Pfby47KlEj
	7CTLrKVzqoOA14vSHFrP64XU9wMnYmi6NoppgkHpMvr39sP98XjMkANQO/hWYAFfW7ybDR615z3aO
	QnfKzdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK0k-0000000A2fm-1X3S;
	Fri, 22 May 2026 07:09:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK0h-0000000A2fF-1dGv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93411441FC;
	Fri, 22 May 2026 07:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65710C2BCB3;
	Fri, 22 May 2026 07:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779433770;
	bh=80mcAzKT7KUOX54cAxYT9sDC70vp0A2zMTxwr1FmLH8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sMKl7SxS2Vk+cDojK4O5Lml29VnBNPY/z5CJgfEe/Io12YNbfNezWyctuvYoohECU
	 okawJjSENLD0dzfwNeuUbfFn+j7RIw9gFMGZGUKp5CZfBe5PH7ABgpQokXJ8QKy74Y
	 rYZifadcbgZ1klbnyqKmvFb/1Fmh8MpZicwT+jhnoyzFlWl9dPpBZQeYJciU1D5oJi
	 yheZYSrc+Aw7yPRrDYzYXN48deGBeCOtBam2as0zGoF/I/uuJVefSZeAFdENFge4DR
	 b1NXQUAHCwGz1WCPQXGkFve4Dppwh//FCVpwLA1P0xAAW+Nvtni1LZLyCxTe6V1SCn
	 DMWdg7oMO2RfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD41CD5BB3;
	Fri, 22 May 2026 07:09:30 +0000 (UTC)
From: Abid Ali via B4 Relay <devnull+dev.taqnialabs.gmail.com@kernel.org>
Date: Fri, 22 May 2026 07:09:27 +0000
Subject: [PATCH v2] net: stmmac: fix RX DMA leak on TX alloc failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
X-B4-Tracking: v=1; b=H4sIACYBEGoC/4WNQQqDMBBFryKz7pQ4jK3tynsUFyGOOmBUEisW8
 e5NvUD5q/fhv79DlKAS4ZntEGTVqNOYgC4ZuN6OnaA2iYEM3QxTgXHx3joMGzYSHbpB7Piekdm
 0pii54AdBGs9BWt1O8atO3GtcpvA5f9b81/5Vrjmm2Ly0d8OOiarOWx2ubvJQH8fxBRZJ+qW8A
 AAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Abid Ali <dev.taqnialabs@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779433768; l=1102;
 i=dev.taqnialabs@gmail.com; s=20260425; h=from:subject:message-id;
 bh=EIgrw7dXm9oPWp3zniVVX0HGvfR5iqNaEldPBGWkDIg=;
 b=hdVWBxzASNSfqv2s2Nbdsqb2HKzuMkf5yETC5Qk0aOAbyTz2fCbXgQSNPGOm5QD6odXNFnEhV
 SQbDhBYjaBMCsywRVUjkT/8JlHiG/CY7a+CIU++RSilyke3vIhGeR7s
X-Developer-Key: i=dev.taqnialabs@gmail.com; a=ed25519;
 pk=4Syx51HH/MOySSUpi79M2ToLOdwt1yiNb338eKZBJNk=
X-Endpoint-Received: by B4 Relay for dev.taqnialabs@gmail.com/20260425 with
 auth_id=752
X-Original-From: Abid Ali <dev.taqnialabs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_000931_458913_96101A29 
X-CRM114-Status: UNSURE (   8.92  )
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
Reply-To: dev.taqnialabs@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abid Ali <dev.taqnialabs@gmail.com>

Free RX DMA resources when alloc_dma_tx_desc_resources() fails in
alloc_dma_desc_resources().

Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
---
Changes in v2:
- Restructured return path based on feedback.
- Link to v1: https://lore.kernel.org/r/20260425-stmmac-rx-desc-cleanup-v1-1-1a18a704c422@gmail.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 13d3cac05..240453daa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2370,6 +2370,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret)
+		free_dma_rx_desc_resources(priv, dma_conf);
 
 	return ret;
 }

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260425-stmmac-rx-desc-cleanup-440f05845492

Best regards,
-- 
Abid Ali <dev.taqnialabs@gmail.com>



