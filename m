Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19201CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXzkdNt1/rtabtQYtuwbkqi0YDDPkJ6QX9Ea/uTIeic=; b=v8U7uQn9dI9dMbI7inFgq99XBr
	2us2bA2LU4YPK2hegmMVS4RGOF6eMi8h9aEN4GJQIk8TgEdrx/u4tfwC9YiENIBmy0CoOdoDtzfqQ
	tf2hCWZy/17xbGSF0RAJEOOVdBBHEQ9sJBsbXhMYeHQrqQWccxe4De7Adxsm6P5dY6NrHU1zfsQKZ
	4XHyw+lxw4D+65mik8KmWZEGol7e/cPNPZWLRhxrWIK4N500O/yNt89NQYH8Ykv8gxcGE39AgYInr
	xQgjrVMr2qhsEGTx5mAFHyXn7ZjbYU7xQzAbzP6wy99pS85m6v6Kqmbq/hTmgtSw1g6FnfGY2YdEh
	c5VyjX4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24V-0000000CRnO-0B4g;
	Sun, 26 Oct 2025 14:50:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD24R-0000000CRlC-3wJB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 14:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C5C344CA2;
	Sun, 26 Oct 2025 14:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AACC4CEE7;
	Sun, 26 Oct 2025 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761490211;
	bh=jY0mVRH9vGGA3XQwuOzAK8Am1h8Cl0lc9WteBzrBfnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wv+p60qRjiw8Lp72ChwpOKNfvl1Xi0necj7mPX0VqhIK23KDgiAHgXBaI6FuGoeaQ
	 i6N9gFnAvFEXfc340YvdqkaIbI2/UrJ6F2dKrntmKkoYPuDMt65r50dMi4mBNzbkeQ
	 mTrVS9b2ToNaYW6d6mKxkg4C9Llp20u+tNUkH+/gsv3DOWYZzlQ7oheOEcHvGZ/zOo
	 rX09pE9MJQsTzzjc2lX/c2Ebp8R3B905Skikb/jyCYi5PdBQJkREfwDe802KeQRYZz
	 Wfve25x6lz/CRz7eBuXpa8SISRiYijIZB6SokfM6EXdT3v6q2sdKrLMZbtuWxyDZVx
	 ScRdyRgONX3pQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Harini T <harini.t@amd.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sasha Levin <sashal@kernel.org>,
	michal.simek@amd.com,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17] rtc: zynqmp: Restore alarm functionality after kexec transition
Date: Sun, 26 Oct 2025 10:48:45 -0400
Message-ID: <20251026144958.26750-7-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251026144958.26750-1-sashal@kernel.org>
References: <20251026144958.26750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_075012_024548_86369138 
X-CRM114-Status: GOOD (  21.45  )
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

From: Harini T <harini.t@amd.com>

[ Upstream commit e22f4d1321e0055065f274e20bf6d1dbf4b500f5 ]

During kexec reboots, RTC alarms that are fired during the kernel
transition experience delayed execution. The new kernel would eventually
honor these alarms, but the interrupt handlers would only execute after
the driver probe is completed rather than at the intended alarm time.

This is because pending alarm interrupt status from the previous kernel
is not properly cleared during driver initialization, causing timing
discrepancies in alarm delivery.

To ensure precise alarm timing across kexec transitions, enhance the
probe function to:
1. Clear any pending alarm interrupt status from previous boot.
2. Detect existing valid alarms and preserve their state.
3. Re-enable alarm interrupts for future alarms.

Signed-off-by: Harini T <harini.t@amd.com>
Link: https://lore.kernel.org/r/20250730142110.2354507-1-harini.t@amd.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES
- `drivers/rtc/rtc-zynqmp.c:303-307` clears a latched `RTC_INT_ALRM` bit
  left behind by the kexec’d kernel so the new instance doesn’t mis-
  handle a stale interrupt; this matches the existing acknowledge flow
  in `xlnx_rtc_alarm_irq_enable()` (`drivers/rtc/rtc-zynqmp.c:125-152`),
  but now happens eagerly during probe to avoid delayed/duplicate
  delivery.
- `drivers/rtc/rtc-zynqmp.c:309-312` inspects the hardware alarm
  register and only preserves state when the stored alarm time is still
  in the future, preventing stray enables after a cold boot while
  keeping real alarms armed across the handover.
- Because the prior kernel disables the alarm IRQ in the ISR
  (`drivers/rtc/rtc-zynqmp.c:268-272`), the new code re-arms it when a
  valid alarm is detected (`drivers/rtc/rtc-zynqmp.c:355-357`); without
  this, alarms that were scheduled before the kexec never fire under the
  new kernel, which is a user-visible regression.
- The change is tightly scoped to probe-time initialization, uses
  existing register helpers, and introduces no ABI or architectural
  churn; risk is low compared with the clear functional gain of
  delivering RTC alarms correctly after kexec on ZynqMP hardware.

Next step you may want: 1) run the RTC selftests or a quick kexec/alarm
smoke test on target hardware to validate the restored behavior.

 drivers/rtc/rtc-zynqmp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index f39102b66eac2..3baa2b481d9f2 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -277,6 +277,10 @@ static irqreturn_t xlnx_rtc_interrupt(int irq, void *id)
 static int xlnx_rtc_probe(struct platform_device *pdev)
 {
 	struct xlnx_rtc_dev *xrtcdev;
+	bool is_alarm_set = false;
+	u32 pending_alrm_irq;
+	u32 current_time;
+	u32 alarm_time;
 	int ret;
 
 	xrtcdev = devm_kzalloc(&pdev->dev, sizeof(*xrtcdev), GFP_KERNEL);
@@ -296,6 +300,17 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(xrtcdev->reg_base))
 		return PTR_ERR(xrtcdev->reg_base);
 
+	/* Clear any pending alarm interrupts from previous kernel/boot */
+	pending_alrm_irq = readl(xrtcdev->reg_base + RTC_INT_STS) & RTC_INT_ALRM;
+	if (pending_alrm_irq)
+		writel(pending_alrm_irq, xrtcdev->reg_base + RTC_INT_STS);
+
+	/* Check if a valid alarm is already set from previous kernel/boot */
+	alarm_time = readl(xrtcdev->reg_base + RTC_ALRM);
+	current_time = readl(xrtcdev->reg_base + RTC_CUR_TM);
+	if (alarm_time > current_time && alarm_time != 0)
+		is_alarm_set = true;
+
 	xrtcdev->alarm_irq = platform_get_irq_byname(pdev, "alarm");
 	if (xrtcdev->alarm_irq < 0)
 		return xrtcdev->alarm_irq;
@@ -337,6 +352,10 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 
 	xlnx_init_rtc(xrtcdev);
 
+	/* Re-enable alarm interrupt if a valid alarm was found */
+	if (is_alarm_set)
+		writel(RTC_INT_ALRM, xrtcdev->reg_base + RTC_INT_EN);
+
 	device_init_wakeup(&pdev->dev, true);
 
 	return devm_rtc_register_device(xrtcdev->rtc);
-- 
2.51.0


