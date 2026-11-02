Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1862F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n+m6UbhD;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jWwBqHBc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FRMAH9xsWV5OlOwKt/muUsEdbHuRpkZwA/qPIkRJwC8=; b=n+m6UbhDyMAIKiDqwv5iQOJ5Tf
	b8f9B4qNHXbY5XvYUoOS4HVvR6/mxriSU7tx6aHqgGCp0H2PnnYtkRmsx3UOof7/nxWtK4hghVjNX
	GRb4jOUFu1bEm2KT9TGymy3nBZ+5ZDcYigp2O4EDuyHniqnDfE9DPZUuort+6jB1sJGTWDyvd1I0x
	Q6RphVf+b3JCB4Iz7R7pnpPvGNeha1dr027fIG79HMiNvHlKw3WMoclPaiic/WcJsUpSyjH1UBbDW
	8Iq9vdel22uhk3sOE850bi6VwPODpCjxQB9c68CfgBPQRdd1wxfYFy3RhJvhPnG4+VLYDsvMl6k5p
	t2JhUEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpWw-0000000GCn0-3TxI;
	Mon, 02 Nov 2026 10:44:46 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpWt-0000000GCln-37lu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jWwBqHBcWGoeIMnDaJxOkkJz/zmNOZx7ITAyoUr4k4T5cSrXgo3wixkakkLUNCn9+q7GF3tiV+Eup
	 40tz4ZzORprqsxt/VoWgEe6KniQXEFD4op8JuowSjK8BuwpfzgKvfS69bu9Wcb3TozF3sjxpekftkN
	 HjU+r8eGKO7DUlJg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36ae8699395d-55bcb;
	Mon, 02 Nov 2026 18:44:35 +0800 (CST)
X-RM-TRANSID: 2ee36ae8699395d-55bcb
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae86991518-cbf5d;
	Mon, 02 Nov 2026 18:44:35 +0800 (CST)
X-RM-TRANSID: 2ee36ae86991518-cbf5d
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: =?UTF-8?q?Am=C3=A9lie=20Delaunay?= <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in pm_suspend
Date: Mon,  2 Nov 2026 18:44:31 +0800
Message-ID: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_024444_300535_03D9EC39 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

stm32_mdma_pm_suspend() increments the runtime PM usage counter with
pm_runtime_resume_and_get(), but when a channel is still enabled it
returns -EBUSY directly without dropping the reference.  The matching
pm_runtime_put_sync() only runs on the success path.

Each failed suspend attempt therefore leaks one runtime PM reference,
so the device can never runtime suspend afterwards.  Drop the
reference before returning -EBUSY.

Fixes: 7cb819c856d9 ("dmaengine: stm32-mdma: add suspend/resume power management support")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/dma/stm32/stm32-mdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index e3bbdc9ee..fe1ff4a00 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1785,6 +1785,7 @@ static int stm32_mdma_pm_suspend(struct device *dev)
 		ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
 		if (ccr & STM32_MDMA_CCR_EN) {
 			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
+			pm_runtime_put_sync(dev);
 			return -EBUSY;
 		}
 	}




