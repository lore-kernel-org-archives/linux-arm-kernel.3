Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47CDCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 06:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PpsJpdZ6guT9xK7H6Qj9swfceklHrTMmKM0p/QOrK04=; b=FStPzjj6/fJCHSiEcTZtqL4UXs
	o9BmuEZvc1MmaQ1y7j3oLOmBiqpAeGmsQfmlU8gnkwrGcNmm5IxVXJ3Bs36LUf2fTfMhGh9ksYky8
	01kPn4BDFXvjfp0GGhiTkk6PdxZdaXVWcTPLecUz0KERZZz82BXlIpLS4dQtBLWAjlENk7pruAFLe
	IMbS8t8yz+ua+pfnFqWWXA9/5EaUWlFn5JMgsXJMSb9vj0DrWXrMMvUFTcDG44NwYEIOTi6AJRh58
	42Ip7ZbliD7uPQlO5pTiENpYlAvKQAjYNWISRHsLZgB2fYWUTvpsXP/UC0aOSGBs5bav6UWe6GlpO
	bZyMTb+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YI1-0000000FHAX-2FZv;
	Tue, 14 Oct 2025 06:13:41 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8YHx-0000000FH9f-0hnx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 06:13:40 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PpsJpdZ6guT9xK7H6Qj9swfceklHrTMmKM0p/QOrK04=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760422402;
 b=SMf3nmpKe8gLDeXtYoGNIvqp/OXzvwCJozR6J4a553X1HaCv3uCnmZ/jujENWFVJ5MJb0V03
 Sn6TzZNVPOsym46MkwBBZw2n3jbg3zis+jtQKFwqnT0sxUWASx5mw7dMF9PqszM2K/+QNLuhR0T
 i0pSsAsfJmBVjKEMOdSfp/4iOihMfwwc6zYbbgUrVVODv5DAmzdjigVVVfVicMGwv/6ZDNeEyX6
 X802MnmM6u/ufPHHUQteH09IkoaFD3Qh9t6lcuWKePexhSEKtO940zOQpBoV9vOqBRG6X6lFPWD
 Z4H6K4+wVNDp7FolN9fzOdx84wouGmRWDKq7fGMvCxhJg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760422402;
 b=GtbpalKtlJbpamnRnd3Iq3Pd9Wm7As4E5A6EGOInDwo1B8AlsNGf7RS1bwguR4LeZ2q3oCy2
 3m2aPiCBF37F/Q/5bvQjTXTL55PkQi3LMgXkBM7OoKUlz+v0PuK0Fn0mCu4p/B5oKx/Y7QzbdS9
 9nTQbeZtDIgCZaXFnTHAaOmr9odLBb2sZwNDX9srXP1wYqDkU63Ey1vYfJh91UR9tUnUzdpuOaB
 WSTWV9aA5IOV/YrJBlpdjXNU34sd4s7oL8E4ASUg2yibgdwq3nfkyUzXzdN9zCfhwPAmaOhOZkB
 IQb2wGsbi+rHYXPnbs7Zx6vEJqDoY5oIes5KfF/pt35Yw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 14 Oct 2025 08:13:22 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C106CCC0E51;
	Tue, 14 Oct 2025 08:13:12 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Max Zhen <max.zhen@amd.com>,
	Sonal Santan <sonal.santan@amd.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dmaengine: xilinx: xdma: Fix regmap init error handling
Date: Tue, 14 Oct 2025 08:13:08 +0200
Message-ID: <20251014061309.283468-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4cm3mn3JBlz1kP5x8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 76f8f5f97ba878a3b36a039ba441326e
X-cloud-security: scantime:2.082
DKIM-Signature: a=rsa-sha256;
 bh=PpsJpdZ6guT9xK7H6Qj9swfceklHrTMmKM0p/QOrK04=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760422401; v=1;
 b=aVovrBrYLokdtjuZB9VKR2YwBZUisj16FKdekX4nt3uBCwJhTtjiPPzc23xTsHVCCKgSkB1V
 SqM6GCs8X37ABlPxeSbl1BMfNEM4cj2qob4norMe6X5RqoRLK1wN7DDe9M9lJsQUplYHwudJt7H
 M3gJxzs1bdBUVLkAnwm5f2AoLOM1+BxPLOl7Lh0nKnE4xCXDO7wFEleWI+qBGQzon5oPpi4v978
 YOKfB4PO5UbkxBzhtIFWLW1CRk1oHblTf3dx/jDTHg22dVHfpxOZNyP7TS96GPRu+Wy8x+YCD5l
 ZYaargh20K2T6A0g1BvzjrYvNgI3w1Z0/ziF4l3+k8nEA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_231337_452182_A23C2580 
X-CRM114-Status: GOOD (  13.87  )
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

devm_regmap_init_mmio returns an ERR_PTR() upon error, not NULL.
Fix the error check and also fix the error message. Use the error code
from ERR_PTR() instead of the wrong value in ret.

Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/dma/xilinx/xdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 3d9e92bbc9bb0..c5fe69b98f61d 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -1325,8 +1325,8 @@ static int xdma_probe(struct platform_device *pdev)
 
 	xdev->rmap = devm_regmap_init_mmio(&pdev->dev, reg_base,
 					   &xdma_regmap_config);
-	if (!xdev->rmap) {
-		xdma_err(xdev, "config regmap failed: %d", ret);
+	if (IS_ERR(xdev->rmap)) {
+		xdma_err(xdev, "config regmap failed: %pe", xdev->rmap);
 		goto failed;
 	}
 	INIT_LIST_HEAD(&xdev->dma_dev.channels);
-- 
2.43.0


