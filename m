Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC78DE9A04B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wc20MlQbqkAccfy6VOlre7N+okiQofqCBOYxOYTMgDc=; b=vRs+jUR4HCpKtNk1Na5y+cJgJU
	K/e7PiX3Vtb+icNj6u+h4g2SpivgpI2725MxJeQh1an3GTcXh+3Y2U0ReJjMEBk+E4brdcOKOG9w4
	tiOyKKk7EP90eChDDdj7WtT1pabgdh7NTXJtGDZ+No6A0VBG7mOg4yHTCosmlfIQzv+x8I1NjCnjK
	GkbovdeGEX3VPizPTCJ6bxE3kIwvJluPArVQZVjCWgj4D9E/CY03FObFq5FyGbgzjiAvKPIRigTrX
	PA9S1d++r0593e6ZHkzrAIG3XnJeZPfjrkouOft6zC69OQAI1vkXZD0paETWBpwBKJ748O/wkJuFc
	OXVdKoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoR1-0000000AOc8-3Jyo;
	Wed, 18 Feb 2026 20:46:11 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsoQy-0000000AOaM-1Fci;
	Wed, 18 Feb 2026 20:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wc20MlQbqkAccfy6VOlre7N+okiQofqCBOYxOYTMgDc=; b=LwZI3KoG7qO0vBDL4ZlUZiQ0fj
	j3DIaFlgw0s97pKeCM0Oxb6mr24/zvMX0qgLSc0WB2cfNzT6f4my+u7h8UKbPvl0/H+9gTZZIa5Z0
	T9V2Iv3WFpab5ZJJz/g5bIUrGfN/RWGr4YzgDaOKK+cbXCLc1b7r/zm0+HSdeDJsjSm1f/pR52fBa
	iUk3AS2W1R1UKcMkxWVoSZLRVE8YM+TxHi9iPErtUsWBWMWpLKrLhG5Gsq7PdUyB5SAQEKpPDWDcV
	0E4/qXIOg1I78zJ/4fdgAQ5Dx+oYukfeMyxNGwBtI0+VAeW1rvwFUXlND+XD3VLVMFMAMUz+0BF6v
	m2S+DRkA==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vsoQu-002Czn-W8; Wed, 18 Feb 2026 21:46:05 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Feb 2026 17:45:00 -0300
Subject: [PATCH v6 2/6] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260218-v3d-power-management-v6-2-40683fd39865@igalia.com>
References: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
In-Reply-To: <20260218-v3d-power-management-v6-0-40683fd39865@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1280; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=kVPYyJOSjqrHPsXntL3UrxCC1YymPVyxfC+PxCVmc0w=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpliT45uVs8NNRW9d/+HQBINjfmVTyDtcwaiUfR
 cUBxLrHun2JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaZYk+AAKCRA/8w6Kdoj6
 qkCKB/4ynquetMwRfYlFKsJ/AElYaZdud/iyRyj9IvInTXgvxWiKyFvjNY+Xx5SJ/kEtk3aAsg8
 F2g0Cp1Ru0dsSTlPSRngNMvntwxp7230cM6ChPpm3JJ9SM2He5jN2Rd/hXWZVKfpodieE265OFc
 Q3C5pJsKegOahjSQeqroBfhls2UDjp9dzpry01RdWQr89d2+iejJklSq5k8QTFe4r0iWPIYH1Hb
 zek6RkgoXhWQMszIYoUBPg1AmKEduvcHpZpwtkta2PpsnXNgBnJr/3aDNle/v5e9aLoqlshFqps
 aEwiL755dvcZsWgKjhtbEGLIfnyZgqIuGGa/Vmyl8c7tfz32
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_124608_361333_FB5794DD 
X-CRM114-Status: UNSURE (   9.67  )
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

If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
HSM initialization, which would result in a bus lockup. However, those
clocks are consumed by drivers (vc4 and HEVC decoder drivers,
respectively), which means that they can be enabled/disabled by the
drivers.

Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
drivers when appropriate.

Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 0d6e4f43c3bac0e7b38934c5c6e4db51211233de..83cdb2a34c84f34ba834608259d22e2b48b90c9d 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -142,12 +142,12 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_HEVC_CLK_ID] = {
 		.export = true,
 		.minimize = true,
-		.flags = CLK_IS_CRITICAL,
+		.flags = CLK_IGNORE_UNUSED,
 	},
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,

-- 
2.52.0


