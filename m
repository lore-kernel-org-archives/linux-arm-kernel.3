Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB46CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/osyJxDYs0Qj219Pz37ya99dwXD7aqtPxcFried3nTo=; b=OIdtpV76KQaKNEd7zI37gvvpoM
	RZm1BAzOQyQormCXLYXfxHZ9s0iLy93sYnMU4CyPssxq/79w4owqbtnBlDRC1jWAQ242sQuYdq4R5
	cf5xjKHliYo2R9sZDcpTJxAAWv5qCU3ppc2/2TLWvor8B4DuY+w/OF0ldTGEe0oqEREpUhpGnONrc
	2e2RlN/ftW6tm1RNdn26zwy4emLNMhbfEa8ozoLG2CzYjSqW9Nx5pVpbfhLrAmFzUuqhMOKO61eGx
	qhgb6XmnnxsLuEZtjOWOF++EF0GOzhqUecaYdYhSYV8+LwVn70r+Sh6/OzYeLRFqX1NdlRpYVrlAC
	bkcQLWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsdX-00000005tZ1-1BZE;
	Wed, 30 Sep 2026 11:38:11 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBsdN-00000005tUc-1SYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:38:04 +0000
X-UUID: 5df1cad6bcc311f19a56ed5b684f684d-20260930
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:d7ae2b3a-2e8c-4682-b202-cb33043ec94b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:5cac8d0b79f4a1459abfefed66604c0e,BulkI
	D:nil,BulkQuantity:0,SF:102|123|850|865|898,TC:nil,Content:0|15|50|99,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5df1cad6bcc311f19a56ed5b684f684d-20260930
X-User: fengchenguang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <fengchenguang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 473731221; Wed, 30 Sep 2026 19:37:50 +0800
From: fengchenguang@kylinos.cn
To: s.nawrocki@samsung.com,
	mchehab@kernel.org
Cc: krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenguang Feng <fengchenguang@kylinos.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix control handler leak in fimc-isp
Date: Wed, 30 Sep 2026 19:37:46 +0800
Message-Id: <20260930113746.278395-1-fengchenguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_043802_263692_9265C8A1 
X-CRM114-Status: UNSURE (   7.28  )
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

From: Chenguang Feng <fengchenguang@kylinos.cn>

fimc_isp_subdev_create() initializes the control handler and adds
controls before checking handler->error.  On the error path only the
media entity is cleaned up and the handler memory is never freed;
the caller in fimc_is_probe() returns directly, so nothing else
releases it either.

Call v4l2_ctrl_handler_free() in the error path, mirroring
fimc_isp_subdev_destroy().

Fixes: 9a761e436843f ("[media] exynos4-is: Add Exynos4x12 FIMC-IS driver")
Cc: stable@vger.kernel.org
Signed-off-by: Chenguang Feng <fengchenguang@kylinos.cn>
---
 drivers/media/platform/samsung/exynos4-is/fimc-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
index 3c5d7bee2655..896a1b0952ad 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp.c
@@ -760,6 +760,7 @@ int fimc_isp_subdev_create(struct fimc_isp *isp)
 
 	if (handler->error) {
 		media_entity_cleanup(&sd->entity);
+		v4l2_ctrl_handler_free(handler);
 		return handler->error;
 	}
 
-- 
2.25.1


