Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36E4C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfyFgwBamfyrV9psbo2HUabJhCHI/jWreq2yRs6Yivc=; b=eRl2n/UOeXCYcQfhPCXVyansAA
	rZPmDEcaezbUXG3MYO0Z+JIk9Oa7MWTP72c47I7RLOx5X7a0HsiMFD7dR5DNamm+krHCcslHobGwq
	rcVLuKUvOOtgOv8cjNjED/rQidOH65wkWSMaYFGGxotPC61yW6EaFns8qGQEq1vT6IOuXqu74Bb3T
	8eT+8QRK4lAJ2UXAkP3eZRgU3AwkqVk6P0JDfFCKfUzpw3tHQKS70c7gIJ0BXJUtr0gJcDB8m1y+5
	h1KqbQ0GyXFR/qHOArQ9CsMeyQWk1xQhgjsJc1LCJTMK1s3ZWFatPq6HWBRxBHKONyw0ip/SZMzrA
	r1QH1a7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpo0-00000005Tt3-3rPY;
	Tue, 28 Jan 2025 17:55:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcpme-00000005TPA-2uRh;
	Tue, 28 Jan 2025 17:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1ECE75C614A;
	Tue, 28 Jan 2025 17:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE33C4CEE9;
	Tue, 28 Jan 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738086836;
	bh=XkXmMArbNvvj4vFv48WiqVxvsUM1hSZabdWEqOdwA64=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RMrH4c2WY8Y79VYoYpVN744gyYrnRLrLMtm7mwR7b59YudfNGzWAQS3unyxmU9PfN
	 FEETyjrV8LI8A04P5Y4cAkUePgHDn5ha9z11aWMAuuqeJA/we2odO7R9C2qvOWqzRk
	 OJDhVNQWuwyyVXB7qxDI3xhhZeHJfyCF6e8RP6VF/mY8ZyvIiTfhBmyZ02h9ly/xJS
	 G76kNSKNrxIf09H/TnMlYF9rK7bG893u7lAFWzcWO8HU9SQ1LIokHxNHTpF0xX3C6C
	 3BX8/01bWbv6qCVNTc7U0xz6hZVtlR8Q5c9o3zeF+mUb8ImAc2W0WUDvnfCClEeCQy
	 PdbOshK8uoFOw==
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
Subject: [PATCH AUTOSEL 6.13 05/15] media: bcm2835-unicam: Disable trigger mode operation
Date: Tue, 28 Jan 2025 12:53:36 -0500
Message-Id: <20250128175346.1197097-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250128175346.1197097-1-sashal@kernel.org>
References: <20250128175346.1197097-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_095356_778132_F495B316 
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
index 3aed0e493c81f..4090a8e477402 100644
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


