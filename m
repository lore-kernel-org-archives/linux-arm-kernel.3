Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F236D73EB9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 03:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+h4Fr1swQcoD3DXpbaZsHJfcLLHab4S06jK6pbWJoY=; b=n52vH1CIjiHEh3ceiUnENHZi2P
	KnQawCxpuVdnZk9Zts3NPJMfn4xueUdHWzP6M1epYIq4xWmF/t1E/tdkfWgV7TFQwk1Dt1Fcmlvbz
	yN1pso+iGi1/E8fB7a1NPxiE22h8zkXoPzw6QaBZgHZolfPP4IGcUlYXcadPHKP0uKoEQYh7kq6eB
	+9u7+OFlwY17wZi6XFUFjKt+/YOIeOME2VQwgYm7cHPKOPBbFv6Vlgr8gWVZi1u3rkrVNZspcaWjh
	Q7wGwRFvXnYa+rE7kYaJHquPRZ8/b8Oz58LrY2z6wG3Y01038IyD9J08KJGkJ6cNvMLlXollNKmKc
	ezmlCBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1yq-00000002HbF-2ydh;
	Sat, 31 Jan 2026 03:49:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm1yp-00000002Hae-1O01
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 03:49:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 644406013C;
	Sat, 31 Jan 2026 03:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED7F1C116D0;
	Sat, 31 Jan 2026 03:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769831342;
	bh=4qeRI0/8CXPNVIq8qwuTcyMxP3YlJM0KAF+LDIonx7s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HLX6M264pvYoqSDxaaPAVUCcR4nK0lh9bodjNLg2N46Lg5AC9yTjQey/R9eF31gQm
	 phCCRhmYokSNrsp/dtzaNaTBZDnSeV3KjPCR+lc/0NMjQNs7RfyCY35GRl+oVQBSkV
	 OfSm/iPcfXMlUTONLxca1Z+49EqY9r25//dNI2q2E6EKkLk9EzSumyi8a3NPSZLCN2
	 jzKfb3OVMGaVXlHMnz1LfbOwWo1oRbHFP29qsvXwRqjoS5iYWh/bFq41empAJyBFtD
	 q/D1I+oljgTAcSGEmm2Et/i+R+hBFgsSm8sSxtjI4jMX8Kiz4N0O0Zz5R5UJUJYtBZ
	 Bhs29LcA/c6HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE13ED73EB9;
	Sat, 31 Jan 2026 03:49:01 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sat, 31 Jan 2026 14:48:57 +1100
Subject: [PATCH v7 2/2] mfd: macsmc: Wire up Apple SMC power driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260131-b4-macsmc-power-v7-2-0e3a2da69948@gmail.com>
References: <20260131-b4-macsmc-power-v7-0-0e3a2da69948@gmail.com>
In-Reply-To: <20260131-b4-macsmc-power-v7-0-0e3a2da69948@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769831340; l=861;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=l66XKVNJtI8aTWFc0QpUQyQBnqT+6mvF4xxxt3DtiJc=;
 b=VRbZEsFuHG6PoAQ0NYRkJXNz+nGfw6IC9Kb/MSR+DI1O9I0BaJAfS1VJBD0hI4F6PjffTRTEQ
 ZuwAYuvPmoXCYjBOh6SkvKm0w14kjp44wS7bGvue/TLtMU6o5LlgbEb
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Add the cell for the macsmc-power driver so it is probed by the
MFD core.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 1b7e7b3e785f..358feec2d088 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_NAME("macsmc-input"),
+	MFD_CELL_NAME("macsmc-power"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.2



