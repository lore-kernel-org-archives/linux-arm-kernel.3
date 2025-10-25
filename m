Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A395CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mB+dHOfDEU6flFlhpCNEE1TpUe4g4NS1Hk+9+rqw3BQ=; b=moqFznguNz6tTUszv4NiRVRerA
	PIXcxFsG808g/SmxUU62wcW7sa8DNwYquELBoWyxf/ZKMWMsl5d9t4iSmihGqGsgIZ2vkuv0cfcsK
	N4Edzl3VEF4Qxyat8dxY1nLwrzhNSgI4yAmUtQvmLJ2a6S8GX5MB2sV56zqzBZptuQv5rrZRz5lAw
	uKYJZ+I2mHzj5KApAX7/QmoRpPIXz7QxB5mhlDZVIzTNXzGtYsbviWSQB8CyWRs6Tqb/xmfO9hL0d
	eDm6Z5v9OrOzLrFYjCq2Ascx6rsKSHxM9LF7xz2aXOgs6Joq88uBBgcMCcHTvvdSHkfNE6Hb4gJen
	YZ7mQd3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgrd-0000000BQeJ-0zGl;
	Sat, 25 Oct 2025 16:11:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgra-0000000BQdz-3K6h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:11:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69B6044CA3;
	Sat, 25 Oct 2025 16:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B243AC4CEFB;
	Sat, 25 Oct 2025 16:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408690;
	bh=vrmfGPPZkkFSTu8sMYYwr9TG++mbACEvOKTUh9kuzwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TtFGxYzgw9mkwhoWbVyMBwFgof4ZvEFQOhYmsHQd4b+fruOvuy/YcMb05g9c1AGAl
	 Vqasrl4pkSgoBiH27S+clZjTzyqRDFLoUVhzUxgc8ZSC1ye318FJRz7uiUor+vkk+0
	 agsSqw0VQIsi5ebdvRvZ1EIyLy9JAIBYORHUbG7Jz41UqEp69GafZnx9hUigwEhD8K
	 YamrvaNKypV7Lx5xvn4kSV7+pPmQS/CVJMngB5yHeJR4NL4HjaedXLKVOVyoRe1jVU
	 MhBc15p+Sb3HvcrGedFEWSKHLSlbomLJUjDWqN1ciCnLXsjTrQLxgrWtxKg/8yhiMD
	 iuUcn36IEth6A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	andrew@lunn.ch,
	0x1207@gmail.com,
	pabeni@redhat.com,
	alexandre.f.demers@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] net: stmmac: Correctly handle Rx checksum offload errors
Date: Sat, 25 Oct 2025 11:54:33 -0400
Message-ID: <20251025160905.3857885-42-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_091130_879085_574619B5 
X-CRM114-Status: GOOD (  23.18  )
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

From: Oleksij Rempel <o.rempel@pengutronix.de>

[ Upstream commit ee0aace5f844ef59335148875d05bec8764e71e8 ]

The stmmac_rx function would previously set skb->ip_summed to
CHECKSUM_UNNECESSARY if hardware checksum offload (CoE) was enabled
and the packet was of a known IP ethertype.

However, this logic failed to check if the hardware had actually
reported a checksum error. The hardware status, indicating a header or
payload checksum failure, was being ignored at this stage. This could
cause corrupt packets to be passed up the network stack as valid.

This patch corrects the logic by checking the `csum_none` status flag,
which is set when the hardware reports a checksum error. If this flag
is set, skb->ip_summed is now correctly set to CHECKSUM_NONE,
ensuring the kernel's network stack will perform its own validation and
properly handle the corrupt packet.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Link: https://patch.msgid.link/20250818090217.2789521-2-o.rempel@pengutronix.de
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation

- Bug fixed and user-visible
  - Current code marks all IP packets as hardware-verified when Rx
    checksum offload is enabled, even if hardware flagged a checksum
    error. See
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5738-5741: it sets
    `skb->ip_summed = CHECKSUM_UNNECESSARY` whenever `coe` is enabled
    and the packet has an IP ethertype, without considering hardware
    error status.
  - With enhanced descriptors, the hardware reports header or payload
    checksum failures via the `csum_none` status. The driver currently
    ignores this and can pass corrupted packets up the stack as if
    checksum was valid.

- What the patch changes
  - The patch adds the hardware error check to the decision: if `status
    & csum_none` is set, the driver does not mark the checksum as
    verified. Concretely, it changes the condition to
    - from: `if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb)) ...
      else skb->ip_summed = CHECKSUM_UNNECESSARY;`
    - to: `if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
      (status & csum_none)) ... else skb->ip_summed =
      CHECKSUM_UNNECESSARY;`
  - This ensures `skb->ip_summed` remains `CHECKSUM_NONE` (asserted by
    `skb_checksum_none_assert(skb)`), so the network stack will
    compute/verify checksums in software and properly drop/handle
    corrupted packets.

- Why this is correct
  - For enhanced descriptors, the driver maps hardware status
    combinations indicating IP header or payload checksum errors to
    `csum_none` (i.e., “checksum not good”). See
    drivers/net/ethernet/stmicro/stmmac/enh_desc.c:105, 107, 109 where
    `enh_desc_coe_rdes0()` returns `csum_none` when the hardware
    indicates header/payload checksum errors.
  - The `csum_none` bit is explicitly defined as an Rx frame status in
    drivers/net/ethernet/stmicro/stmmac/common.h:343 (`enum
    rx_frame_status { ... csum_none = 0x2, ... }`).
  - Normal descriptor paths already drop errored frames early (e.g., see
    drivers/net/ethernet/stmicro/stmmac/norm_desc.c:52-100), so this
    change primarily corrects behavior for enhanced descriptors.

- Scope and risk
  - The change is small, localized to a single if-condition in
    `stmmac_rx()`. No architectural changes, no ABI changes.
  - If `csum_none` is set, the fix only downgrades to software
    verification, which is conservative and safe. The worst-case impact
    is mild extra CPU work for packets with checksum errors, which is
    acceptable.
  - For hardware/paths that never set `csum_none` (e.g., normal
    descriptors), behavior is unchanged.

- Security and correctness impact
  - Previously, packets with failed L3/L4 checksum could be marked as
    checksum-validated and accepted by upper layers. This is a
    correctness bug with potential security implications (transport-
    layer checksum bypass). The patch prevents that by forcing software
    verification when hardware signals errors.

- Additional note for completeness
  - There is a similar unconditional checksum-trust in the zero-copy/XDP
    dispatch path:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:5221-5224. It uses
    the same pattern and likely needs the same `(status & csum_none)`
    check. While not a blocker for this fix, stable trees should
    consider pulling a companion patch for the ZC path to ensure
    consistent behavior across receive paths.

- Stable backport criteria
  - Important bugfix affecting data integrity/correctness.
  - Minimal, contained change in a driver subsystem.
  - No new features, no architectural change, low regression risk.
  - Clear positive safety/security implications.

Given the above, this commit is a strong candidate for backporting to
stable trees.

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b9f55e4e360fb..7a375de2258c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5735,7 +5735,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		skb->protocol = eth_type_trans(skb, priv->dev);
 
-		if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
+		if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb) ||
+		    (status & csum_none))
 			skb_checksum_none_assert(skb);
 		else
 			skb->ip_summed = CHECKSUM_UNNECESSARY;
-- 
2.51.0


