Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2310606B2E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T0Qp/xeh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XQI4xlaX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9fO88CzZ4KxwmnRZKO53UzsL+vV6yYBAF2v/XvLPKlI=; b=T0Qp/xehUdpW4RqC3T3vN7eU2V
	+X3XGfxuirbTahoySYJgeKDR92A/UuwkZYhFRl47THpbI1cUqMCuoWSRLX+iprFEAfbRCOGUpBuEd
	oIZ+UQ1UUPXDASUb7pVyNswPWE1Ks/+hzDCmUz7wpa2SLYH/JxJqhiE4zcSduPcLTiE8ziU5i4fID
	b9XYipKeXRhP/FK83Sd0vjirNEm+KmU2IAGScgAEn1Zq6M6L5jWS6Fa2UQ3zVNtfXLq0U4krUaSLd
	cqqw/96JnrQW8uYEPvWIv8CMxlV7NtpHopRHlII9kmFfTSYyF/fimKvpbx/wzaPRg+EUL27pimJve
	Xy6y6AAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiWg-000000071yZ-0JV4;
	Wed, 04 Nov 2026 21:28:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiWe-000000071yS-07mr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:28:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59564416CE
	for <linux-arm-kernel@lists.infradead.org>; Wed,  4 Nov 2026 21:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E121F000C1;
	Wed,  4 Nov 2026 21:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827687;
	bh=9fO88CzZ4KxwmnRZKO53UzsL+vV6yYBAF2v/XvLPKlI=;
	h=From:Date:Subject:To:Cc;
	b=XQI4xlaXILHLS+YVBWPv+SC5GHIsgp7U+bD9rpklNNEHYQgpjjw2Rp6IjQRkhWJMc
	 63kpjcCojCAuVbbNGMG+py81f+Bi65zyo0dTa+mQw4FEGLmD/xnmk2ZZikfSAvfdUz
	 mHGuxc0k55SPCZowkucWtyzpMdvTwt0tJuZzgma/pO5dG+dIKt/pMFX3IVwoE+1NG9
	 C8LUbMrCzEaON+++0UOaP4d7vKF3E8SS0HhuQXsYPAwga+0Az2VyYBYTOST8hqdxbp
	 qcPJxRR2KrTSZBjrMGlO9AQvPCD1D6Ibk0sWUBc+tT2a3n7P3iro1pdrkFgpHXSJ/O
	 y7MzmvT0LoUSw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:28:02 +0100
Subject: [PATCH] dmaengine: ste_dma40: Keep prepared descriptors across
 termination
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-dma40-fixes-v1-1-48c5180f5210@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3JTQqAIBAG0KsM31pBQwq9SrSwZqpZ9INCBNHdg
 972PahSVCoSPShyadVjRyJvCNOa90WsMhKhcU3rvQuWtxycnfWWajny2LoYxo4jDOEs8gcS9cP
 7fnI5mrldAAAA
X-Change-ID: 20261104-dma40-fixes-d9db6094b7d9
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
 Ulf Hansson <ulfh@kernel.org>, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MMCI can prepare the next request while the current DMA transfer is
running. If the current request fails, its error handler terminates the
channel before the next descriptor has been submitted.

d40_term_all() frees that descriptor from prepare_queue, although MMCI
still holds its pointer. Submitting it later accesses freed memory in
d40_tx_submit(). A reported crash writes to 0x104 through a list pointer
containing LIST_POISON1, which is consistent with this sequence.

Termination only cancels transfers that have been submitted. Leave
prepared descriptors on prepare_queue so the client can still submit
them, and release any remaining prepared descriptors when the channel
resources are freed. Keep tracking them so abandoned descriptors are
reclaimed at channel teardown.

Fixes: 82babbb361f2 ("dmaengine/ste_dma40: fix memory leak due to prepared descriptors")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/dma/ste_dma40.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index 74dd4cbdc3c0..f1cbc719c4f0 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1166,14 +1166,6 @@ static void d40_term_all(struct d40_chan *d40c)
 			d40_desc_free(d40c, d40d);
 		}
 
-	/* Release descriptors in prepare queue */
-	if (!list_empty(&d40c->prepare_queue))
-		list_for_each_entry_safe(d40d, _d,
-					 &d40c->prepare_queue, node) {
-			d40_desc_remove(d40d);
-			d40_desc_free(d40c, d40d);
-		}
-
 	d40c->pending_tx = 0;
 }
 
@@ -2222,7 +2214,8 @@ static int d40_config_memcpy(struct d40_chan *d40c)
 
 static int d40_free_dma(struct d40_chan *d40c)
 {
-
+	struct d40_desc *d40d;
+	struct d40_desc *_d;
 	int res = 0;
 	u32 event = D40_TYPE_TO_EVENT(d40c->dma_cfg.dev_type);
 	struct d40_phy_res *phy = d40c->phy_chan;
@@ -2252,6 +2245,12 @@ static int d40_free_dma(struct d40_chan *d40c)
 	/* Release descriptor state; this does not access DMA40 registers. */
 	d40_term_all(d40c);
 
+	/* Release any prepared descriptors the client did not submit. */
+	list_for_each_entry_safe(d40d, _d, &d40c->prepare_queue, node) {
+		d40_desc_remove(d40d);
+		d40_desc_free(d40c, d40d);
+	}
+
 	res = pm_runtime_resume_and_get(d40c->base->dev);
 	if (res >= 0) {
 		res = d40_channel_execute_command(d40c, D40_DMA_STOP);
@@ -2508,10 +2507,7 @@ d40_prep_sg(struct dma_chan *dchan, struct scatterlist *sg_src,
 		goto free_desc;
 	}
 
-	/*
-	 * add descriptor to the prepare queue in order to be able
-	 * to free them later in terminate_all
-	 */
+	/* Track prepared descriptors until submission or channel release. */
 	list_add_tail(&desc->node, &chan->prepare_queue);
 
 	spin_unlock_irqrestore(&chan->lock, flags);

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-dma40-fixes-d9db6094b7d9

Best regards,
--  
Linus Walleij <linusw@kernel.org>


