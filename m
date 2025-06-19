Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D7C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 11:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=REovA6ojgvRfACANehykHFh/To+qntIFwQgIi6BJLk8=; b=zgxGaxgHZ9KBfy0zVp9rvQbJVX
	P0vmR2HE8xcgig6pEi89cVA+yP5dS1+DsBzgYrb8k+AgO6erTTMEMTKbyoch1hc/5sF0+ZmSLlL5U
	PD6BeAllC88e1vLkWwAkZ4Qn/Bb66BUUDahUCm8k0Uwzq9HuWLPEPyIkqi3//es+wKW3/LK9c3zNR
	23vists5aFvOJFbwmBh6y1VJUtigsxuH3x0ds8lsH+o6NRvMAcxEPF1jdkTn6Nr2ekJdpOj3EE3Jw
	tT/ZTQzZ4N6fo63KxDkyw+8Iieq0Rl5W/lZoQEa+Qx2XBipjy9alCOTSJvHhalq9tcIAi/husf3tW
	hbQ+Xhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSDAw-0000000CpRn-3x1U;
	Thu, 19 Jun 2025 11:11:22 +0000
Received: from mail-m49245.qiye.163.com ([45.254.49.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSBdZ-0000000Cchl-06l6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 09:32:52 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 193d4dd7c;
	Thu, 19 Jun 2025 17:32:34 +0800 (GMT+08:00)
From: Hongbo Yao <andy.xu@hj-micro.com>
To: bhelgaas@google.com,
	lukas@wunner.de
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	peter.du@hj-micro.com,
	jemma.zhang@hj-micro.com,
	Hongbo Yao <andy.xu@hj-micro.com>
Subject: [RFC PATCH] PCI: pciehp: Replace fixed delay with polling for slot power-off
Date: Thu, 19 Jun 2025 17:32:28 +0800
Message-ID: <20250619093228.283171-1-andy.xu@hj-micro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSk4aVkJCTk8YGEhDHxgZTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTEpVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a9787886cc303afkunm9e7d02ee206d1a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NiI6Mjo6CjEzAjc0N0o#Ix4a
	KE4aChZVSlVKTE5LSElOTk5OT0NCVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VKT0xVSk5DWVdZCAFZQUJDSk03Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_023249_265845_861C41A8 
X-CRM114-Status: GOOD (  10.74  )
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

Fixed 1-second delay in remove_board() fails to accommodate certain
hardware like multi-host OCP cards, which exhibit longer power-off
latencies.

Failure scenario:
1. Software clears pending_events prematurely
2. Hardware triggers DLLSC after software clearance
3. Subsequent power-off process may generate AER interrupts
4. System misinterprets residual DLLSC as valid hotplug event

Fix this by replacing the fixed delay with polling for DLLLA bit in
the link status register.

Logs before fix:
[157.778307] pcieport 0003:00:00.0: pciehp: pending interrupts 0x0001 from Slot Status
[157.778321] pcieport 0003:00:00.0: pciehp: Slot(31): Attention button pressed
[157.785445] pcieport 0003:00:00.0: pciehp: Slot(31): Powering off due to button press
[157.798931] pcieport 000b:00:02.0: pciehp: pending interrupts 0x0001 from Slot Status
[157.799263] pcieport 0003:00:00.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 2c0
[157.799273] pcieport 000b:00:02.0: pciehp: Slot(113): Attention button pressed
[157.800484] pcieport 000b:00:02.0: pciehp: Slot(113): Powering off due to button press
[157.800830] pcieport 000b:00:02.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 2c0
[162.850249] pcieport 0003:00:00.0: pciehp: pciehp_get_power_status: SLOTCTRL 88 value read 12e1
[162.850251] pcieport 000b:00:02.0: pciehp: pciehp_get_power_status: SLOTCTRL 88 value read 12e1
[162.850253] pcieport 0003:00:00.0: pciehp: pciehp_unconfigure_device: domain:bus:dev = 0003:01:00
[162.850254] pcieport 000b:00:02.0: pciehp: pciehp_unconfigure_device: domain:bus:dev = 000b:02:00
[162.850278] mlx5_core 000b:02:00.1: PME# disabled
[164.862362] mlx5_core 000b:02:00.1: E-Switch: cleanup
[165.171541] mlx5_core 000b:02:00.1: disabling bus mastering
[165.171591] mlx5_core 000b:02:00.0: PME# disabled
[167.214351] mlx5_core 000b:02:00.0: E-Switch: cleanup
[167.539871] mlx5_core 000b:02:00.0: disabling bus mastering
[167.540342] pcieport 000b:00:02.0: pciehp: pciehp_power_off_slot: SLOTCTRL 88 write cmd 400
[167.540345] mlx5_core 0003:01:00.1: PME# disabled
[168.546269] pcieport 000b:00:02.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 300
[169.590320] mlx5_core 0003:01:00.1: E-Switch: cleanup
[169.899852] mlx5_core 0003:01:00.1: disabling bus mastering
[169.899241] mlx5_core 0003:01:00.0: PME# disabled
[171.870344] mlx5_core 0003:01:00.0: E-Switch: cleanup
[172.289046] mlx5_core 0003:01:00.0: disabling bus mastering
[172.289366] pcieport 0003:00:00.0: pciehp: pciehp_power_off_slot: SLOTCTRL 88 write cmd 400
[172.302385] pcieport 0003:00:00.0: AER: Corrected error message received from 0003:00:00.0
[172.302396] pcieport 000b:00:02.0: AER: Corrected error message received from 000b:00:02.0
[172.310641] pcieport 0003:00:00.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[172.310892] pcieport 000b:00:02.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[172.310893] pcieport 0003:00:00.0:   device [0823:0110] error status/mask=00000001/0000e000
[172.310894] pcieport 0003:00:00.0:    [ 0] RxErr
[172.310893] pcieport 000b:00:02.0:   device [0823:0112] error status/mask=00000001/0000e000
[172.310894] pcieport 000b:00:02.0:    [ 0] RxErr                  (First)
[172.332915] pcieport 0003:00:00.0: pciehp: pending interrupts 0x0100 from Slot Status
[172.353876] pcieport 000b:00:02.0: pciehp: pending interrupts 0x0100 from Slot Status
[172.360212] pcieport 000b:00:02.0: pciehp: pciehp_check_link_active: lnk_status = d011
[172.360362] pcieport 000b:00:02.0: pciehp: Slot(113): Card present
[172.374314] pcieport 000b:00:02.0: pciehp: pciehp_get_power_status: SLOTCTRL 88 value read 17e1
[172.374357] pcieport 000b:00:02.0: pciehp: pciehp_power_on_slot: SLOTCTRL 88 write cmd 0
[172.374383] pcieport 000b:00:02.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 200
[173.314226] pcieport 000b:00:02.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 300
[174.111245] pcieport 0003:00:00.0: pciehp: pending interrupts 0x0100 from Slot Status
[174.111232] pcieport 0003:00:00.0: pciehp: pciehp_check_link_active: lnk_status = f085
[174.111234] pcieport 0003:00:00.0: pciehp: Slot(31): Card present
[174.117136] pcieport 0003:00:00.0: pciehp: Slot(31): Link Up
[174.122963] pcieport 0003:00:00.0: pciehp: pciehp_get_power_status: SLOTCTRL 88 value read 17e1
[174.122964] pcieport 0003:00:00.0: pciehp: pciehp_power_on_slot: SLOTCTRL 88 write cmd 0
[174.122967] pcieport 0003:00:00.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 200

Logs after fix:
[143.610100] pcieport 000b:00:02.0: pciehp: pending interrupts 0x0001 from Slot Status
[143.616525] pcieport 0003:00:00.0: pciehp: pending interrupts 0x0001 from Slot Status
[143.629921] pcieport 000b:00:02.0: pciehp: Slot(113): Attention button pressed
[143.629923] pcieport 000b:00:02.0: pciehp: Slot(113): Powering off due to button press
[143.629926] pcieport 000b:00:02.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 2c0
[143.651725] pcieport 0003:00:00.0: pciehp: Slot(31): Attention button pressed
[143.658848] pcieport 0003:00:00.0: pciehp: Slot(31): Powering off due to button press
[143.666666] pcieport 0003:00:00.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 2c0
[148.863526] pcieport 000b:00:02.0: pciehp: pciehp_get_power_status: SLOTCTRL 88 value read 12e1
[148.870562] pcieport 0003:00:00.0: pciehp: pciehp_get_power_status: SLOTCTRL 88 value read 12e1
[148.870572] pcieport 0003:00:00.0: pciehp: pciehp_unconfigure_device: domain:bus:dev = 0003:01:00
[148.870579] pcieport 000b:00:02.0: pciehp: pciehp_unconfigure_device: domain:bus:dev = 000b:02:00
[148.870605] mlx5_core 0003:01:00.1: PME# disabled
[152.536968] mlx5_core 0003:01:00.1: E-Switch: cleanup
[152.877666] mlx5_core 0003:01:00.1: disabling bus mastering
[152.878202] mlx5_core 0003:01:00.0: PME# disabled
[156.592567] mlx5_core 0003:01:00.0: E-Switch: cleanup
[156.904767] mlx5_core 0003:01:00.0: disabling bus mastering
[156.905195] pcieport 0003:00:00.0: pciehp: pciehp_power_off_slot: SLOTCTRL 88 write cmd 400
[156.905231] mlx5_core 000b:02:00.1: PME# disabled
[160.360660] mlx5_core 000b:02:00.1: E-Switch: cleanup
[161.272871] mlx5_core 000b:02:00.1: disabling bus mastering
[161.273719] mlx5_core 000b:02:00.0: PME# disabled
[165.028632] mlx5_core 000b:02:00.0: E-Switch: cleanup
[165.454213] mlx5_core 000b:02:00.0: disabling bus mastering
[165.454925] pcieport 000b:00:02.0: pciehp: pciehp_power_off_slot: SLOTCTRL 88 write cmd 400
[165.464333] pcieport 0003:00:00.0: AER: Corrected error message received from 0003:00:00.0
[165.478716] pcieport 000b:00:02.0: AER: Corrected error message received from 000b:00:02.0
[165.481156] pcieport 0003:00:00.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[165.481158] pcieport 0003:00:00.0:   device [0823:0110] error status/mask=00000001/0000e000
[165.481166] pcieport 0003:00:00.0:    [ 0] RxErr                  (First)
[165.528873] pcieport 000b:00:02.0: pciehp: pending interrupts 0x0001 from Slot Status
[165.535384] pcieport 0003:00:00.0: pciehp: pending interrupts 0x0100 from Slot Status
[165.535403] pcieport 000b:00:02.0: PCIe Bus Error: severity=Corrected, type=Physical Layer, (Receiver ID)
[165.535403] pcieport 000b:00:02.0:   device [0823:0112] error status/mask=00000001/0000e000
[165.541315] pcieport 0003:00:00.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 300
[165.550871] pcieport 0003:00:00.0:    [ 0] RxErr                  (First)
[165.578591] pcieport 000b:00:02.0: pciehp: pciehp_set_indicators: SLOTCTRL 88 write cmd 300

Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
---
 drivers/pci/hotplug/pciehp_ctrl.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pciehp_ctrl.c b/drivers/pci/hotplug/pciehp_ctrl.c
index bcc938d4420f..179ebe4f7797 100644
--- a/drivers/pci/hotplug/pciehp_ctrl.c
+++ b/drivers/pci/hotplug/pciehp_ctrl.c
@@ -30,6 +30,25 @@
 #define SAFE_REMOVAL	 true
 #define SURPRISE_REMOVAL false
 
+static void pciehp_wait_for_link_inactive(struct controller *ctrl)
+{
+	u16 lnk_status;
+	int timeout = 10000, step = 20;
+
+	do {
+		pcie_capability_read_word(ctrl->pcie->port, PCI_EXP_LNKSTA,
+					  &lnk_status);
+
+		if (!(lnk_status & PCI_EXP_LNKSTA_DLLLA))
+			return;
+
+		msleep(step);
+		timeout -= step;
+	} while (timeout >= 0);
+
+	ctrl_dbg(ctrl, "Timeout waiting for link inactive state\n");
+}
+
 static void set_slot_off(struct controller *ctrl)
 {
 	/*
@@ -119,8 +138,11 @@ static void remove_board(struct controller *ctrl, bool safe_removal)
 		 * After turning power off, we must wait for at least 1 second
 		 * before taking any action that relies on power having been
 		 * removed from the slot/adapter.
+		 *
+		 * Extended wait with polling to ensure hardware has completed
+		 * power-off sequence.
 		 */
-		msleep(1000);
+		pciehp_wait_for_link_inactive(ctrl);
 
 		/* Ignore link or presence changes caused by power off */
 		atomic_and(~(PCI_EXP_SLTSTA_DLLSC | PCI_EXP_SLTSTA_PDC),
-- 
2.43.0


