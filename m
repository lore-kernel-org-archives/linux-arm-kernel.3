Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69295CC6B12
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KFCW1M7qXicNkXoNFz0UEyrqo2R7uteq2KxnBN5zNno=; b=nN2ZXDBT//ma4Q8lCEQva5cjdt
	3BxzasJ2pLLxX7LmveCHZ464Ohs8b224tJZly90bYH46JopHEvikUWkNQsz5BolCmGnvdLFqK6wn9
	o8V2iHDU8xSCA/i9xIuh3s3ibWU7FbFFpWy7NE2dMV25UI3tpCQqV8OxligDwfv8nzwCACrC2nLTx
	Pde4mA4zkxI9K1DXDzFgjrYUBXO9uzucYZdzqbKcJGNvnSkb2Aipww01QtBxhMREgqalOBb15/LsC
	IDK8RV3XA/3NVkaWnSB6xJn2e2Cwar7amhsoUfxE++064sO0A8dlBhKgC7aKQ7BhR9l57HTbzmADx
	DigQM9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhBx-0000000Dp0U-47HS;
	Tue, 13 Oct 2026 18:25:37 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGhBu-0000000Dp09-0w7g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 18:25:35 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-53394bffe0fso2364061cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 11:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791915933; x=1792520733; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KFCW1M7qXicNkXoNFz0UEyrqo2R7uteq2KxnBN5zNno=;
        b=W9mtyKFTCvnHwoExH3Jc/QOlGl4b5ym2Ec17s8UoEStPUziPulREvp77YGJKvDsAgE
         YX5hYriXfCYNVf0zSlZhTDnkw68usAV3BbPkYU0D23JhuncbYGNXB6hCA8jwnD0TuLAT
         Y226r7qNftgoxW73FUfzofY3pFFOUJHMc04FGLjbjlhvp+ep9VzKxNJlhehIJCxad6Am
         94botkQeFhw1vuzMAVOFhI9pkXxddUTO2SGpO2wFXmSvBhscP+aWYT0oZvxpBO1va+JL
         NK8BbDrxCw7YuvNmFAHZGE0RLZyoBg0FM/GAieayiqJYLqqRT4KHxTzC8MUjekLBDC5E
         dyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915933; x=1792520733;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KFCW1M7qXicNkXoNFz0UEyrqo2R7uteq2KxnBN5zNno=;
        b=RNN9NOD+yANnzhQIyU6wXkr7SWw4gkXB7L2dW2Zxh3K12XyC4T0yfMqwndlm/cr46k
         N51vPOE1L/2P005kZ74YLmC6+x5Hv5f4DfSgRUw0DWE9qI6NOHNhPDh7A7WNc2LX8/yV
         7igXGK3hyfZl6nMssRtty/jpSnOPkFQH0mlLh+SqdRyAyccPqmp7MOYF1hen6W7eYsUM
         bphRWUmapKCeqraSTqtZR8bJo93ptOhZufxbHAM1GTI60zJ5NsC6O1+tSqDjizxMoufF
         02KIIZhxYlMPD5qJKWnOALwCsx+NNCUA7PvUmffjgZS60raj1/mxVlC/o2jqc1zmitQk
         lAeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9f8VdeqP8N2lMYuHeaDGo0lVHrycUHkG79XFlSDVgJ//HMjhX72QBmICMgUwqOGXE9LnzQe4LcTpdxlO/OUJ/@lists.infradead.org
X-Gm-Message-State: AFq9FYL7wn7aoVyjLgxG5JahcW83XVx0HBMnEw9Ozz0bjH8geO/QsDkH
	a8qmM2R/F0sOotgywhaWKHcu8i8xBklPcJz/a5Q/CoO9oxMlycvts9PnoB5TvPOGMos=
X-Gm-Gg: AYBFou3dq8yNNQGlIzTDaLIXhtnirLfwY6Ysqg6uCWpWJoj+iMEUaATL9YsBTZSlD9g
	VQgWhPqFhA6fE9nWozWSFayzpNIIAr3us0avHO83/Tyqy2bxiaB2xGyKvThGOtj7VSXOPz57C9i
	PGqEu2/pJtxLpKNCj94QuJ3r1pxPNru3BECKsA6djw9N+mztm97x82wn2OiLNjoMTWiiOF5P/Bd
	MbxFLlm1bJAn/htFJhMdf58TvB6wURFbnAZ1E74n3BHNY/8zPJDdA3jISCtalrCoEdJ2NWUTunT
	i7cLJ9iJ9pb8p4hisEpQeIyLbm66zp0AsDLha467nI5Jp5NMqvZB3ylx3AJMLg9vSV6p2mHnK3E
	olO2yZbMuIZmXxPlOFRmJmVv1kdTR2N2983bwyEz2nl/akA3U3kGGHKAi/swRrzT+6s2Mleex0p
	oE23aV2ET7BJLJ2GxI+zb0ZNaEIQoEJSQxZ5YEuQQM7ymapXciTSrMdupsZnr9oCc+1yVQZeV0i
	b3AybeX7bdpqSw=
X-Received: by 2002:a05:622a:4e04:b0:535:a5f7:d59b with SMTP id d75a77b69052e-535a5f7de55mr186236721cf.42.1791915932663;
        Tue, 13 Oct 2026 11:25:32 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.251])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b76eea2sm107276361cf.18.2026.10.13.11.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:25:32 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 13 Oct 2026 18:25:06 +0000
Subject: [PATCH net] net: axienet: don't advance the TX ring head before
 the descriptor is ready
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-b4-axienet-dmaengine-ring-head-v1-1-7add24e74477@toxicpanda.com>
X-B4-Tracking: v=1; b=H4sIAIF3zmoC/32NSw7CMAxEr1J5jdUvH3EVxMJOTGsEpkoKqlT17
 iRlz3KeZuYtECWoRDgXCwT5aNSXpVDvCnADWS+oPmVoquZQV3WL3CHNKiYT+ieJ9WqCQa3HQci
 jc55P0pLj4x7SyRjkpvMmuEAawfUH45vv4qZ8nWtMUZADmRsyeowld+UG/8hgXb//dwa/wAAAA
 A==
X-Change-ID: 20261013-b4-axienet-dmaengine-ring-head-ccdb8e3acb75
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791915929; l=2932;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=AlG/JZ6VJ7vRBe6rEuyNKsPV58OQf13xQXX8THhv3as=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBomUl/RFNb7o7hd3lkq0GvyegzlXY0C4reO22XN+8hGLGwHC9ittbqyynjfwdMXd/zfN9u1sJL
 GMd7gDVRTMgE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_112534_301291_2B2FCDF8 
X-CRM114-Status: GOOD (  15.02  )
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

axienet_start_xmit_dmaengine() bumps lp->tx_ring_head before
skb_to_sgvec(), dma_map_sg() and device_prep_slave_sg(), and none of
their error paths undo it.  The skb is freed and nothing is submitted,
but the slot stays claimed.  axienet_dma_tx_cb() walks tx_ring_tail
once per completion, so the next completion lands on the abandoned slot
and dereferences whatever skb pointer is left there: NULL if the slot
was never used or was already completed, or a stale skb that gets
consumed a second time.  Every completion after that is accounted
against the wrong slot.

dma_map_sg() and device_prep_slave_sg() can fail at runtime, and so can
skb_to_sgvec() on a malformed skb.  Only advance tx_ring_head once
those have succeeded.  The completion callback can't run before
dmaengine_submit(), so claiming the slot just before that is fine.

dmaengine_submit() itself can also fail on xilinx_dma after a channel
error, and its return isn't checked either.  That's a separate problem
and isn't changed here.

This was found by the Sashiko AI review of the skbuff BUG_ON() series.

Fixes: 6a91b846af85 ("net: axienet: Introduce dmaengine support")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
Compile-tested only, I don't have the hardware.  The bug is in the error
paths, which are easy to see from the diff: every goto after the old
increment returns without submitting anything.

Thanks,
Josef
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 09443623a3e2..a5800409e45a 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -929,7 +929,6 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
 	if (!skbuf_dma)
 		goto xmit_error_drop_skb;
 
-	lp->tx_ring_head++;
 	sg_init_table(skbuf_dma->sgl, sg_len);
 	ret = skb_to_sgvec(skb, skbuf_dma->sgl, 0, skb->len);
 	if (ret < 0)
@@ -965,6 +964,10 @@ axienet_start_xmit_dmaengine(struct sk_buff *skb, struct net_device *ndev)
 	skbuf_dma->sg_len = sg_len;
 	dma_tx_desc->callback_param = lp;
 	dma_tx_desc->callback_result = axienet_dma_tx_cb;
+	/* Claim the ring slot only after the steps above that can fail.  The
+	 * completion callback can't run before dmaengine_submit().
+	 */
+	lp->tx_ring_head++;
 	txq = skb_get_tx_queue(lp->ndev, skb);
 	netdev_tx_sent_queue(txq, skb->len);
 	netif_txq_maybe_stop(txq, CIRC_SPACE(lp->tx_ring_head, lp->tx_ring_tail, TX_BD_NUM_MAX),

---
base-commit: 8bf659bd54e1f00e34cf5244b1d289c506fa47c0
change-id: 20261013-b4-axienet-dmaengine-ring-head-ccdb8e3acb75


