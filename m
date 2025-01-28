Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C2AC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaq0S7W6jVMrd+iZC92GLTD8E/+/vUfLavaWI09vG1w=; b=b0DLXWgTqSnWOMurlPPTenVANE
	wtJJVZoAhEi0bWwArFod8owmAf523Zq7LJVlu2TutEzxMvyy71bXdrC9JDyElUn7kVBtCMivn+4vd
	AstJCPADuZlzblyPYnekleWtW821KmHvQw77g2GwEupREk0HMP/sRX9J5ag7cNiYxJL8BTv7qagan
	mW+WRbhLlS9jupeg1LgK8ZlAjobSkqduX1mDG+CRYYvQgu14QQW+R4LcTuPnjY2LtHBmTxLaWdXt/
	XROm+fnXW49ly6lQRVxTpJ5ooi9Xgp1hcyYZlgTRed15/ZLxWOp7YlG3gJb9aR5ARmbDx6fZlO7az
	aSWV3oyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpqe-00000005UVf-0TNu;
	Tue, 28 Jan 2025 17:58:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpn5-00000005TZo-06NI;
	Tue, 28 Jan 2025 17:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 760ADA4107E;
	Tue, 28 Jan 2025 17:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6385AC4CEE1;
	Tue, 28 Jan 2025 17:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086862;
	bh=3PihCPL1PbGiywV8gTwWjfgktAJ1JYwtLg/idGjpC6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7NP31KcitYNaQzOQZzEDzACInNAPQLq7UT4wUuOCt9VukSYPwRbagqIGVHE+4RpR
	 XzPNMGH3EBMG0ee6hJzI0dnCldoTn1bWXm1v8NoDP5i88MQ+RQxsRLsHLiqPe7sba2
	 6IKPAeJ99P5IylTqfZMSvF4gTZzZuvA2RARamGwGKSJydFM0tnjo9lhC+fkgjIC/kQ
	 Rboxm25Ynjr6oPNxF44eUc8AEBp4yUqf/2W4beHy6zCH1ShB+2iFu3FsXxAErJmwP8
	 /DxTTll1YOJO4gKeFU5DusZkd/CPkniF+bukAFNKMOvGWo8eP62D2Jz7ksBmcvJbvg
	 vjeun150yctfA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Naushir Patuck <naush@raspberrypi.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 04/12] media: bcm2835-unicam: Disable trigger mode operation
Date: Tue, 28 Jan 2025 12:54:06 -0500
Message-Id: <20250128175414.1197295-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175414.1197295-1-sashal@kernel.org>
References: <20250128175414.1197295-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_095423_116498_55B3C3AC 
X-CRM114-Status: GOOD (  10.96  )
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

From: Naushir Patuck <naush@raspberrypi.com>

[ Upstream commit 697a252bb2ea414cc1c0b4cf4e3d94a879eaf162 ]

The imx219/imx708 sensors frequently generate a single corrupt frame
(image or embedded data) when the sensor first starts. This can either
be a missing line, or invalid samples within the line. This only occurrs
using the upstream Unicam kernel driver.

Disabling trigger mode elimiates this corruption. Since trigger mode is
a legacy feature copied from the firmware driver and not expected to be
needed, remove it. Tested on the Raspberry Pi cameras and shows no ill
effects.

Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/broadcom/bcm2835-unicam.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
index a1d93c14553d8..9f81e1582a300 100644
--- a/drivers/media/platform/broadcom/bcm2835-unicam.c
+++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
@@ -816,11 +816,6 @@ static irqreturn_t unicam_isr(int irq, void *dev)
 		}
 	}
 
-	if (unicam_reg_read(unicam, UNICAM_ICTL) & UNICAM_FCM) {
-		/* Switch out of trigger mode if selected */
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 1, UNICAM_TFC);
-		unicam_reg_write_field(unicam, UNICAM_ICTL, 0, UNICAM_FCM);
-	}
 	return IRQ_HANDLED;
 }
 
@@ -984,8 +979,7 @@ static void unicam_start_rx(struct unicam_device *unicam,
 
 	unicam_reg_write_field(unicam, UNICAM_ANA, 0, UNICAM_DDL);
 
-	/* Always start in trigger frame capture mode (UNICAM_FCM set) */
-	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_FCM | UNICAM_IBOB;
+	val = UNICAM_FSIE | UNICAM_FEIE | UNICAM_IBOB;
 	line_int_freq = max(fmt->height >> 2, 128);
 	unicam_set_field(&val, line_int_freq, UNICAM_LCIE_MASK);
 	unicam_reg_write(unicam, UNICAM_ICTL, val);
-- 
2.39.5


