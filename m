Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58235CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 03:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dgleh18hZRn+DpCzOwpEkJP+/6haGcTG+Q6HFfBYP18=; b=l15SsOLBBNN+Ou8JR4i79y+KiM
	/o0wZU+QEoOVD/g2Kkby6cjQ+V9UGUjdrc2c1dX5D6g3yVE/0/19BZZzJFWppauM3c2f/57GHoHS7
	QAED10pD66RikxlDVKaO4w8ewXg+r8vMLbbt5MaDV5pVDsniRqj96RpZ/WQrTtpw+whq9n55FPPJm
	FtVa08h3g3VWPboSbHLi1FVBC0v6LQd87F/WF/pJVgG9rkJWUPUl+oG/JzGJeSNgxWEPh3WLpp2Nc
	uCu7FP3wveoPacg7OvUG0nhIUWO1iAf9XcA/qs1mi+bvZ24Y3lxQaBnUdbbwCaVCzuhyh6bLUG4bd
	U3z4ovpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEeQ2-00000003QeE-3csX;
	Thu, 08 Oct 2026 03:03:42 +0000
Received: from mail-m60231.netease.com ([210.79.60.231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEePy-00000003QdT-1PKB;
	Thu, 08 Oct 2026 03:03:42 +0000
Received: from xf.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 503d04501;
	Thu, 8 Oct 2026 11:03:23 +0800 (GMT+08:00)
From: Finley Xiao <finley.xiao@rock-chips.com>
To: finley.xiao@rock-chips.com,
	heiko@sntech.de,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tony.xie@rock-chips.com,
	huangtao@rock-chips.com,
	frank.wang@rock-chips.com
Subject: [PATCH v2] mailbox: arm_mhuv3: Keep the combined IRQ enabled during system suspend
Date: Thu,  8 Oct 2026 11:02:14 +0800
Message-ID: <20261008030214.368347-1-finley.xiao@rock-chips.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa119772d6303a8kunm2f35a96c7c2dd0
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZH08YVk9PSUlKGB8aTE1NGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XM6+ZbnkmQNlAhn5qn2uDiSftM3yGfhBT2v45Nv+KYw2bZSQ+UQ2jQ3uV/fZH/5RD1pnEPlWylQsk6yWl/oG4z4CE20ipqczYhXBNtV35Ev8cajAV53RsoRfQ82AznQ3yuX3Uot3s01byq/lTdCDzJwYeQeyzNe1w43vIHdgDLs=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Dgleh18hZRn+DpCzOwpEkJP+/6haGcTG+Q6HFfBYP18=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_200338_873548_14F59A20 
X-CRM114-Status: GOOD (  11.58  )
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
SCMI remains functional throughout the suspend/resume cycle. Note that
this only keeps the IRQs functional during the suspend/resume cycle and
does not make the mailbox a wakeup source.

Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
---

Changes in v2:
- Add Sudeep's Reviewed-by tag
- Clarify that this does not make the mailbox a wakeup source

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


