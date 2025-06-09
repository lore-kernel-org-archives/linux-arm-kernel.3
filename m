Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908ACC71131
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 20:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A4gbmGwaMAgvR4qWBsj08Sg44XPjg3xaVLxY2SKwNFM=; b=D3bQniWGe3rxSEoJava1yqznCp
	auZhNqgp9OTWNPB0Bq8PBwVb6xKMkHiZYz38YYwkN9Sij9lkx1GBbv/PXr0nPRjYOf2CMrSeJ73uC
	u/M4VJq7lfFDQld7JfUpEBX61tJ6xdZOWl8uw5W2pHQNlWaa8Zw3AvU2dLIoNQLizEbAgzndExWGi
	7FmWZvat2ft7hYga3J/tCdWMY+5LLHuOVtycKf4OymfkytNhbwBL82EinkiI72JGByfUD2EOgNe3a
	bnCMaZKZsf6PYlJphTUg/JAV4PQuydygusn5qeZlM9EzTOs8mN7iIaw3zPmCkb6hmccsfa843HDI9
	Q0ZQ8Msg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjL0-00000005BKf-1ABX;
	Mon, 09 Jun 2025 20:43:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjIq-00000005Axk-20dZ;
	Mon, 09 Jun 2025 20:41:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3F9D25C51AF;
	Mon,  9 Jun 2025 20:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6859C4CEF0;
	Mon,  9 Jun 2025 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749501667;
	bh=ossCfSxOWYUfRDCTjGWqVcgE+BuQ279AatMC3LDtX/U=;
	h=From:Date:Subject:To:Cc:From;
	b=rDXejdwSUKoD35Jm6U5j1VtnU+8xgXPQ//1ULv3dFliYrcw9JfmSkCgdJuhiJXnci
	 Bv3+3iP39vjjGyAStZtgCkNjoafkdDww2yPbfq4fqHBuPSog6sM5gNIyC6iRKKMC2o
	 EAyccyPQA1weIYYJaDL9IcJa96YTkkGltdhLNZZDUAsWkLyfuahlOpP2zU4+FHSEQ0
	 sMqW984hFIa9TYpV+bqJSQI6GoGLybbCuXKMvei+ZwiXpudZnazbZdOc4U/ZXWK+U+
	 TvXUjnoQRvZnAgJl+lQ762PHQe6uGIMBuSOT/hYGYeV/CQkNhuxdXzwmparu2BF9AS
	 WQSIQnGNzbYlw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 09 Jun 2025 22:40:35 +0200
Subject: [PATCH net] net: airoha: Enable RX queues 16-31
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-aioha-fix-rx-queue-mask-v1-1-f33706a06fa2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMJGR2gC/x2M3QpAQBQGX0Xn2qldongVuTjWh5P87UZK3t3mc
 mpmHgrwikB18pDHpUG3NYJNE3KTrCNY+8iUmawwpalYdJuEB73Z33ycOMGLhJlhIS7vXGUNKNa
 7R5T+c9O+7wfLDh8HaQAAAA==
X-Change-ID: 20250609-aioha-fix-rx-queue-mask-e1eac3bc910e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_134108_562686_6C66B6BE 
X-CRM114-Status: UNSURE (   8.12  )
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

Fix RX_DONE_INT_MASK definition in order to enable RX queues 16-31.

Fixes: f252493e18353 ("net: airoha: Enable multiple IRQ lines support in airoha_eth driver.")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_regs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 04187eb40ec674ec5a4ccfc968bb4bd579a53095..150c85995cc1a71d2d7eac58b75f27c19d26e2b5 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -614,8 +614,9 @@
 	 RX19_DONE_INT_MASK | RX18_DONE_INT_MASK |	\
 	 RX17_DONE_INT_MASK | RX16_DONE_INT_MASK)
 
-#define RX_DONE_INT_MASK	(RX_DONE_HIGH_INT_MASK | RX_DONE_LOW_INT_MASK)
 #define RX_DONE_HIGH_OFFSET	fls(RX_DONE_HIGH_INT_MASK)
+#define RX_DONE_INT_MASK	\
+	((RX_DONE_HIGH_INT_MASK << RX_DONE_HIGH_OFFSET) | RX_DONE_LOW_INT_MASK)
 
 #define INT_RX2_MASK(_n)				\
 	((RX_NO_CPU_DSCP_HIGH_INT_MASK & (_n)) |	\

---
base-commit: 82cbd06f327f3c2ccdee990bd356c9303ae168f9
change-id: 20250609-aioha-fix-rx-queue-mask-e1eac3bc910e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


