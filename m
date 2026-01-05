Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10859C79F87
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuWk6EvQhY4FpjCCeg08xmJM6GfeTPe1lVtagpY5t1E=; b=QkalCVHv4DoMgCC2tAntI3sM6T
	yc/PPTvR5Mx/74XxeLmNDq3KMYE9T/oCRhhAWaZ2R5EQmwA/uoM1xJFVvMXap+I1HfLqs7fVvTTTL
	BCsPDsy56gSwKRyg2WpOwDDqUQknERrae7d7Uunr79bn80CbtWnqnnN8WLazActxWxwkqZC4Exy3+
	z1MDg+38+qiPsdwz7hPSjTESKMhTgpHo4HtMMHvSqjETfVFJgj3V1FYZsrghyGfHZwER9vDgcIg8W
	2KED0Oz+ZvjERcUD92NrGlwlRVoen9/sX6Ebtb/xVL3lLOMXzTknkG9rIVbm8koc9n9kwOwjSy+T3
	FpRWwUBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8g-0000000BMRB-0SXC;
	Mon, 05 Jan 2026 12:56:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vck8e-0000000BMPl-31Sn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 12:56:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8A7360142;
	Mon,  5 Jan 2026 12:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 693D9C19425;
	Mon,  5 Jan 2026 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767617807;
	bh=qmt/PcU1Yu1EV0KhbS4i0pP6/2A6eNrCy2u0NVbxqrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AvBt0Yots1PaxpFEKEg+PvmaPucv7i/OgnHLSBT4FW9QjA/BvNrvZmoC63BqXF9xa
	 B92rlzLz9Yl+qsi4upuDW4q/orKSMz2oxqF1oY1S8jP6MXmWSVhwY7xmbJzYxwi1Rg
	 GPsU3ZG2kVOy/bV5hc/KTpE8LpucyW9MoLzcCvaY243mQSLnJkwbWcPjMRYWhSPO6X
	 W5oZN617UAwbZpN8DAdC1iqInFQkD1XUbX4OaBh1uk4gPNRFMJoO/Rc4cA3sufIt3n
	 YDMOXnz0DajoJHQb5zGgVe8VhLpIS2PVnmS1YEnSbMBzsgVfM3LbphKCYRGpgm/EhL
	 I2ubXsgUJ/oyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B325C79F87;
	Mon,  5 Jan 2026 12:56:47 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Mon, 05 Jan 2026 23:56:37 +1100
Subject: [PATCH 2/2] mfd: macsmc: Wire up Apple SMC power driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-b4-macsmc-power-v1-2-62954c42a555@gmail.com>
References: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
In-Reply-To: <20260105-b4-macsmc-power-v1-0-62954c42a555@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Michael Reeves <michael.reeves077@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767617806; l=759;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=vIxVriW7LVSbZfkV9TYc6jdqEm/Rah71gDngXrG5xT8=;
 b=gEO+8YJiCNJnMoPAkVVFkeBS2Bp+zqvI2YBPM8YBi4e8rNuaYViJT9wmJNVsFpR/BWU0KnzkM
 BEHGIxPEbgJAzaHpT36JJsDTt6mzSGCiZNC/Vd81ZOM8uz/gefQvheP
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

From: Michael Reeves <michael.reeves077@gmail.com>

Add the cell for the macsmc-power driver so it is probed by the
MFD core.

Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5..061b43fc842d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-power"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 };

-- 
2.51.2



