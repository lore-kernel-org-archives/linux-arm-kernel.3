Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7C0CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 03:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZ32C2WTWmgi5ZaUexbXzvx93Ac9ZjmfyXwb3Nt7J0k=; b=B9MtYxsAA59ER9V+3gTBNgdNgT
	ELQzGUBtuQ1tDsMiHIeP8UrMDBWI846Amv0/5nrYL+NhVDC7okK/fRHGeuMBwLRIEiL2B5ut8Oi3g
	G6Rj41vHlSWvmUjvMoeGCMGg8NfAw2kUjU4gYhrVf/bUXuofqCn43K8AdK69v9CA7ZR6At/in1R6f
	6V4WpjSTj6YlkGhbUprxZpx5a+tC7ADQ4wrKwLeaBhua/5afAow5n07IJUL6YUAAd87rdlLgnlyU3
	Eas65vwXCTS8VIoltW9rH0yR1j/PY8gdolj2M+WzkoPuLuNlCYQ6AauyyAOsnVnYkCWp6AUo4Ef9o
	dDiFFP/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBl83-00000004y5W-2rZd;
	Wed, 30 Sep 2026 03:37:11 +0000
Received: from mail-m25484.xmail.ntesmail.com ([103.129.254.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBl80-00000004y3Z-4ATE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 03:37:10 +0000
Received: from xf.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f94c9cbb;
	Wed, 30 Sep 2026 11:36:59 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: Finley Xiao <finley.xiao@rock-chips.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 1/1] mailbox: arm_mhuv3: Keep the combined IRQ enabled during system suspend
Date: Wed, 30 Sep 2026 11:36:57 +0800
Message-ID: <20260930033657.312266-2-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930033657.312266-1-finley.xiao@rock-chips.com>
References: <20260930033657.312266-1-finley.xiao@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0f06311d103a8kunm0f690f8947b21e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTBhLVhgfGEodSUwdQ0tLSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZS1VLVUtVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=jUjKDuppHrDYlOaX1PE0bndgBgD7Utkp5fcCqc6rJEO2teseuKZfxOSJttjJNRdQyCs2Sq+WQvaeOJuQKXoyUikGDe0M36sQ2s/QOc0Sxrfes3PNg4WpaXWE6V9thkSOyDcTTZLnb2VIN/otwEZDJemB9pkRh3dju5n4ejAGuTE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=TZ32C2WTWmgi5ZaUexbXzvx93Ac9ZjmfyXwb3Nt7J0k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_203709_243717_FA81F2F3 
X-CRM114-Status: GOOD (  12.30  )
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

When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
SCMI clock and power-domain operations still need to work in the noirq
phase of system suspend: genpd may power off a device's parent domain
from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
scmi_power_state_set() and waits for the firmware reply via the mailbox
RX IRQ.

However, dpm_suspend_noirq() calls suspend_device_irqs() before running
the suspend_noirq callbacks, so the combined interrupts are already
masked at that point and the SCMI transfer times out while waiting for
the reply.

Both the PBX and MBX combined interrupts are requested as threaded
IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
that firmware replies are delivered, and the PBX combined IRQ, used
for txdone by IRQ when not in polling mode, needs the same treatment.

IRQ threads are not frozen during system suspend, so with
IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
noirq phase.

Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
SCMI remains functional throughout the suspend/resume cycle.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
---
 drivers/mailbox/arm_mhuv3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
index a1c528be47f3..04998e1346c5 100644
--- a/drivers/mailbox/arm_mhuv3.c
+++ b/drivers/mailbox/arm_mhuv3.c
@@ -980,7 +980,8 @@ static int mhuv3_setup_pbx(struct mhuv3 *mhu)
 
 		ret = devm_request_threaded_irq(dev, mhu->cmb_irq, NULL,
 						mhuv3_pbx_comb_interrupt,
-						IRQF_ONESHOT, "mhuv3-pbx", mhu);
+						IRQF_ONESHOT | IRQF_NO_SUSPEND,
+						"mhuv3-pbx", mhu);
 		if (ret)
 			return dev_err_probe(dev, ret,
 					     "Failed to request PBX IRQ\n");
@@ -1017,7 +1018,8 @@ static int mhuv3_setup_mbx(struct mhuv3 *mhu)
 				     "MBX combined IRQ is missing !\n");
 
 	ret = devm_request_threaded_irq(dev, mhu->cmb_irq, NULL,
-					mhuv3_mbx_comb_interrupt, IRQF_ONESHOT,
+					mhuv3_mbx_comb_interrupt,
+					IRQF_ONESHOT | IRQF_NO_SUSPEND,
 					"mhuv3-mbx", mhu);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request MBX IRQ\n");
-- 
2.43.0


