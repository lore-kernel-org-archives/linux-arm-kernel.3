Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3F9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 00:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOjuM2EQptwZIdCy1FbHhPFuJ3SevIU3rNwW7TmuMhU=; b=FlB1pEIU5iXA+SF6h74/0EgmOy
	EwVVOcjtJTQIaNP+jrztdoWqrG8++UzR56r9NbjKY0lcRGvnaFLTW7koS7a9XvUjG+Gz52hh1+xKW
	IRNVT8bF7YedFcUv5izqr0SnnQivKNwhgYlYWZIfSGHlyi3Yl7yI/AUjwfvspOewHQkgHSwi4Nf3A
	hVZbewwratPlQpctVxhM+AMbiIwnB9JbNKoGcMaZsAKnKdNcLjXBGROLG6C5A4UmOKJQNzZ17iYV/
	PeP2rKGKSB17IgQeaT9ZJVcxngaGRvpGQv3+gQPnC7m/U59UiUnRMar8dsri6a/9itY0WXIO7dfn1
	ZFSv9qvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijCh-00000009M7O-3Etm;
	Mon, 04 Aug 2025 00:37:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uij1A-00000009KlB-1sVu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DB6D5C5862;
	Mon,  4 Aug 2025 00:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4523C4CEEB;
	Mon,  4 Aug 2025 00:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267131;
	bh=oYzjt0pBPUFIGVDHgd1Ww6Ch3t3p6kCVfPtoExsa0k0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nrrfqoMnhm5JhkWjzhOAi5KKeCeVb6Vx6FuyYU+RmQJRsIMqzRKnrM363JrpNXW7x
	 6jeYbB4LE0TSOWkthxCZNWBBNU4dmCS0mntC/+J9G1hyn6r3Q8CoQ4ETIe5EQEqBeh
	 5ZZik4kwI7VvHHljUMCDwl6FrpAa6cDSN7qAJkpNXBllgU4bvy6PXbMKWDE/pmCqNP
	 PvocHdzeIf4RNTzi8tRlx8+YfUKzg8v1C0VhylS6urlxYVemSDA20L0cRbxCRtiEL1
	 TG2AJIrCD1Ncti/e+wVqrmuaICO1s4cyR+n7REfRDrOIf/MaH5aVCKJZ0RJxPHXst3
	 5S8UMkz9L1a1Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16 39/85] firmware: arm_scmi: power_control: Ensure SCMI_SYSPOWER_IDLE is set early during resume
Date: Sun,  3 Aug 2025 20:22:48 -0400
Message-Id: <20250804002335.3613254-39-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002335.3613254-1-sashal@kernel.org>
References: <20250804002335.3613254-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_172532_702943_00E0C8B7 
X-CRM114-Status: GOOD (  21.78  )
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

From: Peng Fan <peng.fan@nxp.com>

[ Upstream commit 9a0658d3991e6c82df87584b253454842f22f965 ]

Fix a race condition where a second suspend notification from another
SCMI agent wakes the system before SCMI_SYSPOWER_IDLE is set, leading
to ignored suspend requests. This is due to interrupts triggering early
execution of `scmi_userspace_notifier()` before the SCMI state is updated.

To resolve this, set SCMI_SYSPOWER_IDLE earlier in the device resume
path, prior to `thaw_processes()`. This ensures the SCMI state is
correct when the notifier runs, allowing the system to suspend again
as expected.

On some platforms using SCMI, SCP cannot distinguish between CPU idle
and suspend since both result in cluster power-off. By explicitly setting
the idle state early, the Linux SCMI agent can correctly re-suspend in
response to external notifications.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Message-Id: <20250704-scmi-pm-v2-2-9316cec2f9cc@nxp.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## 1. Bug Fix Nature

The commit fixes a clear race condition bug that affects system
suspend/resume functionality on SCMI-based platforms. Looking at the
code changes:

- **Original bug** (lines 325-333 in original code): The
  `scmi_suspend_work_func` sets `sc->state = SCMI_SYSPOWER_IDLE` AFTER
  `pm_suspend()` returns
- **Race condition**: If another SCMI agent sends a suspend notification
  while the system is resuming (after `pm_suspend()` returns but before
  `SCMI_SYSPOWER_IDLE` is set), the `scmi_userspace_notifier` (line 305)
  will see the state is still `SCMI_SYSPOWER_IN_PROGRESS` and ignore the
  new suspend request
- **Impact**: The system fails to re-suspend when it should, breaking
  power management functionality

## 2. Fix is Small and Contained

The fix is minimal and well-contained:
- Adds PM ops structure with only a resume callback
- Moves the state reset from work function to PM resume callback
- Total change is about 20 lines of code
- No API changes or architectural modifications

## 3. Clear User Impact

The commit message explicitly states this affects real platforms: "On
some platforms using SCMI, SCP cannot distinguish between CPU idle and
suspend since both result in cluster power-off." This indicates actual
hardware is affected by this bug.

## 4. Low Risk of Regression

The changes are:
- Limited to the SCMI power control driver
- Only modifies the timing of when `SCMI_SYSPOWER_IDLE` is set
- Uses standard PM callbacks (`dev_pm_ops`)
- No changes to core logic or protocol handling

## 5. Follows Stable Criteria

The fix meets stable kernel criteria:
- Fixes a real bug (race condition in suspend/resume)
- Small, focused change (~20 lines)
- Already tested and merged upstream
- Clear explanation of the problem and solution
- No new features added

## 6. Technical Correctness

The fix is technically sound:
- Setting `SCMI_SYSPOWER_IDLE` in the PM resume callback ensures it
  happens before `thaw_processes()` completes
- This guarantees the state is correct when interrupts are re-enabled
  and the notifier can run
- The use of `dev_set_drvdata()` and `dev_get_drvdata()` properly passes
  the context to the PM callback

This is a textbook example of a stable-worthy commit: it fixes a
specific race condition bug with minimal code changes and clear impact
on affected systems.

 .../firmware/arm_scmi/scmi_power_control.c    | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index 21f467a92942..ab0cee0d4bec 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -46,6 +46,7 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/reboot.h>
 #include <linux/scmi_protocol.h>
@@ -324,12 +325,7 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 
 static void scmi_suspend_work_func(struct work_struct *work)
 {
-	struct scmi_syspower_conf *sc =
-		container_of(work, struct scmi_syspower_conf, suspend_work);
-
 	pm_suspend(PM_SUSPEND_MEM);
-
-	sc->state = SCMI_SYSPOWER_IDLE;
 }
 
 static int scmi_syspower_probe(struct scmi_device *sdev)
@@ -354,6 +350,7 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	sc->required_transition = SCMI_SYSTEM_MAX;
 	sc->userspace_nb.notifier_call = &scmi_userspace_notifier;
 	sc->dev = &sdev->dev;
+	dev_set_drvdata(&sdev->dev, sc);
 
 	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
 
@@ -363,6 +360,18 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 						       NULL, &sc->userspace_nb);
 }
 
+static int scmi_system_power_resume(struct device *dev)
+{
+	struct scmi_syspower_conf *sc = dev_get_drvdata(dev);
+
+	sc->state = SCMI_SYSPOWER_IDLE;
+	return 0;
+}
+
+static const struct dev_pm_ops scmi_system_power_pmops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
+};
+
 static const struct scmi_device_id scmi_id_table[] = {
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ },
@@ -370,6 +379,9 @@ static const struct scmi_device_id scmi_id_table[] = {
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_system_power_driver = {
+	.driver	= {
+		.pm = &scmi_system_power_pmops,
+	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
 	.id_table = scmi_id_table,
-- 
2.39.5


