Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE506606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t5ha6d0g;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WE7aUxtW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4aaIDhtCEIv+g4XbgCs2JJwVMBanpKEyQuZrw5hylKk=; b=t5ha6d0gKPdT3xCUI3vR57P9Qr
	LBP//1UM0G3IWiUaekcg+DoTT4btJvzvdPG5Hbo/xi77XCcpG1/es7KfsYUSN+RbiUESC1QBKuxec
	in8Yh/DxOhzjrwSmDL/ARdDTEDR4vceB63vausRiw/qhd5av5wmK05YAFKXxTJtlAwB8ujMOphrAM
	vZZ2iKYrwq5TJdoeaNSN5TbMuWPy+meuMHWJBuldlAhDmvI12SWysXf8RqEaodLwGAlj9h2yQOfkt
	iQnNC36CQNc4cyyYQLmvRavdWCUr+uTosf1LrNeFlYRb+yCODWqN+RfB1+1Is1HEybHHDo+RhN5Zu
	H4SKzMjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpTk-0000000GCB6-1aAK;
	Mon, 02 Nov 2026 10:41:28 +0000
Received: from cmccmta6.chinamobile.com ([111.22.67.139])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpTe-0000000GC92-3SOa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 10:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WE7aUxtWY6vl8lo9CB+GVp5wcPZ/b03EbJdEMPcLBAiqU1parnJPG0fuOE46k0+f4y2azOlzbIhq8
	 cHJRa1sBpAtPC0D1vGo2o8JWyTsk2BeJJxi2yUhXpcmK+xKU0S60VFpk9U1hdMBn4wF0FfT4YdVM/V
	 4a1Pdv3O4dVbF+9U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56ae868c33a0-874c4;
	Mon, 02 Nov 2026 18:41:11 +0800 (CST)
X-RM-TRANSID: 2ee56ae868c33a0-874c4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae868c5a87-cf5da;
	Mon, 02 Nov 2026 18:41:11 +0800 (CST)
X-RM-TRANSID: 2ee76ae868c5a87-cf5da
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
Subject: [PATCH] dmaengine: stm32-dma: Fix runtime PM reference leak in pm_suspend
Date: Mon,  2 Nov 2026 18:41:07 +0800
Message-ID: <20261102104108.794-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_024123_384842_66ECEBAC 
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

stm32_dma_pm_suspend() increments the runtime PM usage counter with
pm_runtime_resume_and_get(), but when a channel is still enabled it
returns -EBUSY directly without dropping the reference.  The matching
pm_runtime_put_sync() only runs on the success path.

Each failed suspend attempt therefore leaks one runtime PM reference,
so the device can never runtime suspend afterwards.  Drop the
reference before returning -EBUSY.

Fixes: 05f8740a0e6f ("dmaengine: stm32-dma: add suspend/resume power management support")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/dma/stm32/stm32-dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index d3ad78562..2abe846a9 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -1743,6 +1743,7 @@ static int stm32_dma_pm_suspend(struct device *dev)
 		scr = stm32_dma_read(dmadev, STM32_DMA_SCR(id));
 		if (scr & STM32_DMA_SCR_EN) {
 			dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
+			pm_runtime_put_sync(dev);
 			return -EBUSY;
 		}
 	}



