Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OseI0seE;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hESFBiP7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sdZZuu1KAvuBOeQ7yzKV8wo3W2DFye1M9CG/9y5jafE=; b=OseI0seES9eMzx
	4jZrNegFIbVib+CB3Z1h8kDPBlDojXcTJ7sJUh63xDk3OqHxSTcJlHlFHOAtnP4RDrQVSP8BgJOhq
	HPjZKoTyxJBImaLltzPGJFUpJIZmSaM7/1XaQZNI2hzi63YrvYNoG1p2abmMacDKR0lKZtsTL2s5b
	QiisDtkrZTgrOtv6hOgeNdFNNs0RjzYB1sH5G3hzF8tYOqvkdkr3/1KdfFOub6+MFDZCy6T1SUnj5
	f7XlK1c8LU55itAmBUUM2nJ71nGTW8iC8bRR/EZa5oVKaprhuhhGUjG6vqR9/yXqG0wyi6M9AOp4q
	093DDzmGYHydA5hKZArA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo50-0000000Buwq-0btI;
	Fri, 30 Oct 2026 14:59:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMo4r-0000000But4-34wO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:59:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3455160619;
	Fri, 30 Oct 2026 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A551F00A17;
	Fri, 30 Oct 2026 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372372;
	bh=sdZZuu1KAvuBOeQ7yzKV8wo3W2DFye1M9CG/9y5jafE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hESFBiP7NG+yQiT0y9rW63TmFUfhRSwLqcayIrdNdF0ACjMuoKVQlYMlclsgsX5IA
	 pky5XL6XDvY8D8NMtTmdhJ9ZXhpmxo4ivSAEcEoA0wy2bmTTU5r++GCbJwUt159SFw
	 Wkyx7O98wWfwK5fjzgjllFgQgo3Vem5H525X7sbM6jSV2Jz8lUXRnabj4qetopOYfO
	 lwaZgBl8nuVEUQcnkttGkiqPxahYOX3viBYwjHq9hZ/61CkOz/dEpD3IUh13L2ElC/
	 6PGbLPLfRGsFzPsBXM79c83FbMZKPFbSK6UBh83boylf1Il8IuehDOfb6P2p6y3mld
	 mQ+MFji3IfATg==
From: Joshua Crofts <crofts@kernel.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: qcom: remove redundant pm_runtime_dont_use_autosuspend() calls
Date: Fri, 30 Oct 2026 14:59:00 +0000
Message-ID: <20261030145901.1393-3-crofts@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030145901.1393-1-crofts@kernel.org>
References: <20261030145901.1393-1-crofts@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosuspend() on reinit()"),
driver core is now responsible for undoing any
pm_runtime_use_autosuspend() calls on driver exit.

Remove the redundant function calls.

Signed-off-by: Joshua Crofts <crofts@kernel.org>
---
 drivers/dma/qcom/bam_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index f67a93a37d48..efc155c61b07 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1403,7 +1403,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
-	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
-- 
2.47.3


