Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893DA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 22:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4xvXVCxM;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lFdAVH6t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kAJ91NX0cCLZ+POHR3WwhzVqOqKjKkASb0TQ3JzdZ8w=; b=4xvXVCxMDrzyECmcKnwbQ890Qp
	D0n6kiMqgytvN72o6C5ZmGggEDPMm/cJUnv0KYMV5/ZICr0Ynn3Qt0OtiM9lv6o6R+c16GhX1MP0m
	6i8gjsVj59uIlPUDz8MrUpBQCPOQ4JOQ/wQCaTLYjhqUmMxT9rpd7zOWVTqA/dw9VhKjyHXTiaxpQ
	jMVd0fIAGfoXx667Xn/2Y4auwtumYorb3SX3UGwxkpZBAtUCx+fQe4F9c3GrBzmNKaJXRHEplkGfG
	qdlUZSyEEPJbw7tHPeXiM2lxzuB5+LFNqE+oknJ8mg7rWL4k1MIJP44wMo+iWoeKIkK6QZWWZBcN4
	6BL7bhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK11Z-0000000F3iA-38fg;
	Thu, 22 Oct 2026 22:12:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK11X-0000000F3hb-3dpb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 22:12:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 531B860233;
	Thu, 22 Oct 2026 22:12:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792707155;
	b=PgRuh5uEMzWcZ7I1L/a0nWDWt2xlIHdCgQza+omy5Nc16GwXRjdKnstXUB/1YGiwXnmJ
	 Mn9TgFRLxYGKKE7FfULI3ZPfxtUELGT4sIR9+5sGsb5sSkJzRI3CGmXuFpByhYFsG1tN7
	 F8//tuFxsGh9u4WdwOnpk+Q0VLfOwUS+3fci3lvzNxbnitofL08rc1pcyk/U7BWCsAnYI
	 Iccco6/0iNjTl5Mv07AOf9nH2JzxrysBfx6mJYsRQ5yYwgWX1d109fu8OMQtEOwDUZfE3
	 ciU9UFghUmLHNwl+swd7DE8mg/ijex9meCfqwk+KZ28KFRYmNfYiNxINSp25AECF3Bw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792707155;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kAJ91NX0cCLZ+POHR3WwhzVqOqKjKkASb0TQ3JzdZ8w=;
	b=nN1kMGriabJefJw8BlIM4vvVJGqLdMFm1K4nU4sDsmlBcmCbkrAumHSjwdMpZkH+Cm98
	 uBPG0F3jHqx9z6J0OUzZ0A6lXkMWoj39SiQMEVdJPWE8RulcQNJxwuwXMoBMHhejJ1CnE
	 VxYJKQPH1nDiNbB6IBf3JHrwMuPsWkzJWS8kepjGV1LJxYxsuQh6WnyASDm0R7eU/O9WZ
	 Z/YxTSM/XN6KFKBOljiDSbbUf7NhYap+8JjqUzszggjtjoWIPRKECmFA7DgxMY41Xo+Yu
	 lAJy2U9O8vUUyxG8l6hS4Gq+S52DNQXTnEmemk4MoH7FuUkoJVdOiitO6Lb7Fzhz+GQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D2251F01825;
	Thu, 22 Oct 2026 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792707155;
	bh=kAJ91NX0cCLZ+POHR3WwhzVqOqKjKkASb0TQ3JzdZ8w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lFdAVH6t1O8moIF9VWLahDnAu/fwyj8D/ChmkmQL7gEd3vKSuoDJzXQgqgIlmFpqd
	 6Ya+NcMfTcZg4ifEnygbgR+8rowbuvBv0XFhQ0WdJXKSKmOPQ/eVTE68RA1XOBk8UJ
	 BxiKrHKSAWwbSmdPvSqWF2r40yQ1SXNQklg77vrgEL0V3bEL08bcfAp5gnCJ0imtnp
	 pZRP30/jawX+csR8MBtcXUAae0ik1fEufmT+9A79t60YjClC8gSSxD7PWGU/jDvCav
	 /e2aLRKv38fNr2eFhR/v0m8C+4QPUj54auBp9sure4rfxDvqSxBIena47SB3epxO1j
	 TaW/VWI6iIQ8g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 80DA441FC5;
	Thu, 22 Oct 2026 22:12:33 +0000 (UTC)
From: "Jeff C. Jensen via B4 Relay" <devnull+kernel.nullptr.com@kernel.org>
Date: Thu, 22 Oct 2026 15:11:31 -0700
Subject: [PATCH 2/5] dmaengine: xilinx_dma: Fix cyclic period count
 truncation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-xilinx-dma-work-v1-2-20faea2e7a80@nullptr.com>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
In-Reply-To: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
To: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Suraj Gupta <suraj.gupta2@amd.com>, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alex Bereza <alex@bereza.email>, 
 Folker Schwesinger <dev@folker-schwesinger.de>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Jeff C. Jensen" <kernel@nullptr.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=kernel@nullptr.com;
 s=openpgp-2026; h=from:subject:message-id;
 bh=uxgMXIyep7CAr1NQDXQw04MaelMXvUlXqqiFb7DgwaU=;
 b=owGbwMvMwCV2439B4wpuQQ7G02pJDFm3ugKKJba5Hm3erCNbdtFg4qLV6yddETf5tpDhkMKdq
 qiz1lWLO0pZGMS4GGTFFFmOH5u2M9/Wv66o+n4VzBxWJpAhDFycAjCRWUEM/1MeHOvqZrCZY/TV
 WKRuf3XJvjdpsetiws1OSr9Yu8fYt5+R4WX0p+Ucl1ov3Ty8O2BPy3mu+IKYuXZH8huiD97xzDo
 ZzgQA
X-Developer-Key: i=kernel@nullptr.com; a=openpgp;
 fpr=C7C696B96F3D4F7E727BDF7AD8FF7081A80B1108
X-Endpoint-Received: by B4 Relay for kernel@nullptr.com/openpgp-2026 with
 auth_id=1265
X-Original-From: "Jeff C. Jensen" <kernel@nullptr.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: kernel@nullptr.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Jeff C. Jensen" <kernel@nullptr.com>

xilinx_dma_prep_dma_cyclic() stores buf_len / period_len, a size_t
quotient, in an unsigned int. On 64-bit builds the count can be
truncated: a buffer of 2^32 + 1 bytes split into 1-byte periods becomes
a single period, and the transfer covers one byte of the buffer the
client asked for.

Compute the quotient as a size_t and reject it if it exceeds
XILINX_DMA_NUM_DESCS before narrowing it. Each period needs at least one
hardware descriptor, so a larger count could never be prepared from the
pool anyway.

Fixes: 92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 5ccc9f9d58a3..aa714effd10d 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2454,7 +2454,7 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
 	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
 	struct xilinx_dma_tx_descriptor *desc;
 	struct xilinx_axidma_tx_segment *segment, *head_segment, *prev = NULL;
-	size_t copy, sg_used;
+	size_t copy, sg_used, periods;
 	unsigned int num_periods;
 	int i;
 	u32 reg;
@@ -2462,10 +2462,11 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
 	if (!period_len)
 		return NULL;
 
-	num_periods = buf_len / period_len;
-
-	if (!num_periods)
+	/* a period takes at least one descriptor */
+	periods = buf_len / period_len;
+	if (!periods || periods > XILINX_DMA_NUM_DESCS)
 		return NULL;
+	num_periods = periods;
 
 	if (!is_slave_direction(direction))
 		return NULL;

-- 
2.43.0



