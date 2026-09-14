Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56FEDC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 11:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS4gSGNy2dOMCPRfKomn+g7CCNwYcpkMhh/6pChyyuw=; b=u22E8KYxkPjBmqrx8jgrJrAxCH
	EWiULZ4xo8tJhZCFVd6hTNhiDKTJ8rsVTCyKqZPsm+S5ZkDxJGgIhbH/T1o49N3tkOcOmUtJ4F0Cp
	9ASsYCkGKchNPY8DkvJt8QN8SK8bSiST1Bu17NvsEqE+2HvjMxgpktU4Pv3jSX7md95RBmX1OR1dJ
	kZqahw8tsRLyRFZ1q1vQUQh9BKJ/3DdiuASuahYO1SOAZOm2IqOKCoPi2ALmbuQb5YopKTHbhndo3
	tkRXBgwR49hPZ6WTflYBCLyJcvQ8RYVcueZIm2s/rO2gAkbYsyUdTzBNcqMx2l7jVndsjQ4h3NZiQ
	5iDATegA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Hv-00000003PA7-4594;
	Mon, 14 Sep 2026 11:55:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Hk-00000003P14-3cX7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 11:55:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B11B601EF;
	Mon, 14 Sep 2026 11:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48DB21F00893;
	Mon, 14 Sep 2026 11:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789386944;
	bh=IS4gSGNy2dOMCPRfKomn+g7CCNwYcpkMhh/6pChyyuw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=A1Vy7d/iJJ+kNRspVOrEOonCAU95nW9YRFknWcmBqlZuvufeRu22EVMz2PUkAvpvU
	 goVuRes5pvTEVX6kSiSo1KmNEQCLhTm3DvbmSHTK5h+n4gsvOE/nCwuSbFtqqfdhJ0
	 pyOP7nxKrn1xcpn7I0AJ7WA4HNwSyRvIb1kz6JXQjfHOPKA7ODso+WeawY+9pjx6UA
	 3qkP0/nJ9WKAYOjc/kk5a/85D6Oin+5BA1sg197TCkUKda6d13ZJELgCwkAcIDcyxj
	 P0zd+G9cvAO1sIH5ua4H/7KagDTOscR6RdGws9jkz22oLGDxLCZgQBfNLC5Vi/F0wk
	 z/rcxFsRzf2Yg==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 13:54:44 +0200
Subject: [PATCH v2 16/20] misc: sram: Enable runtime PM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-ux500-power-domains-v7-1-v2-16-9d0c17e1f816@kernel.org>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Mark Brown <broonie@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Lee Jones <lee@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 dmaengine@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

Enable runtime PM for generic SRAM devices after probe has initialized
the SRAM mappings and partitions.

This lets SRAM devices with attached power domains be managed through
runtime PM references from their consumers.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/misc/sram.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index c8990e83a65a..7f19dca7b818 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/mfd/syscon.h>
@@ -425,6 +426,10 @@ static int sram_probe(struct platform_device *pdev)
 			goto err_free_partitions;
 	}
 
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		goto err_free_partitions;
+
 	if (sram->pool)
 		dev_dbg(sram->dev, "SRAM pool: %zu KiB @ 0x%p\n",
 			gen_pool_size(sram->pool) / 1024, sram->virt_base);

-- 
2.55.0


