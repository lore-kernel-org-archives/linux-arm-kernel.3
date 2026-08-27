Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0C9C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFPaUjzplDvusr9EdznTDxXJqZfQ+uxtFj+38XpXKC0=; b=FuA4ydRiFPQNMH4BENNx3F5GQs
	4VWPIO/BJBw7AT6DNhHY6stjPj2Uk8usJp/esLtLwWd0teBEcMulLrpn/G6o6JXiqL8gKOp5TDUkY
	3p8H5DWUe1fq468Hk9sVq2dmDPj0z8WkrXsS2efFrroK7CWtKJLtwN3n0I6XbS7XO1bR5DzkbBVKX
	FJ7+c/rgTakmanhS0vA0jpsRxGoVjXDEIv2jE026ECGa0PbSLo7e3q1/7rh96paJOHu9GEQUTXT4w
	j4txMGIl07ZVH4hVzYnDKxvgu9f1wK6+v62iNjCZkdrl3KMORLp/I5xob/5mGHnAH6JucVVZb6Tdw
	ThOjDQQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzatz-000000048YY-1JIK;
	Thu, 27 Aug 2026 14:16:23 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzatw-000000048Xc-3KlS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 14:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eF
	PaUjzplDvusr9EdznTDxXJqZfQ+uxtFj+38XpXKC0=; b=oOeWCn92JKGIxth/Es
	OTkKzs18z2WErJWeDRXPwH+hm2LrKo7bShUnVmZg7jAr5vTj69LRV10f8P7QMoKN
	lbAmhQDDWTEX41OlBbklJGibYz0GUlj6o66nAA0UzVGkS3qCrySPE+LkzGha3FXx
	+mph0fluV+Fzj+HE9u06BligY=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD395iNRpBqM49eSQ--.24405S2;
	Thu, 27 Aug 2026 22:15:43 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: antonio.borneo@foss.st.com
Cc: alexandre.torgue@foss.st.com,
	junan76@163.com,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com
Subject: [PATCH v2] pinctrl: stm32: fix the unit of the hwspinlock timeout
Date: Thu, 27 Aug 2026 22:11:28 +0800
Message-ID: <20260827141127.25789-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b0f76a08a7c1dbaec4684b4bc013263e0149a4b.camel@foss.st.com>
References: <9b0f76a08a7c1dbaec4684b4bc013263e0149a4b.camel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD395iNRpBqM49eSQ--.24405S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyDGw45tFykZF1xGFy3Jwb_yoWrur1rpF
	Zagwn0yrs8X3y5Zw4DtF4q9rn3JayIywsrJF4jq3W8Zr1q9r95ta1Sqa92kF12qa4xJ3ZI
	qFW2q345ua1kAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJKI_UUUUU=
X-Originating-IP: [2409:8a62:3e6:7890:62cd:186:f39c:9f61]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1BB0JmqQRpCUKAAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_071621_372425_C5AFB4EF 
X-CRM114-Status: GOOD (  15.89  )
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

HWSPNLCK_TIMEOUT is passed to hwspin_lock_timeout_in_atomic(), whose
timeout argument is in milliseconds, not microseconds:

  atomic_delay += HWSPINLOCK_RETRY_DELAY_US;
  if (atomic_delay > to * 1000)
          return -ETIMEDOUT;

So the driver asks for a 1 second timeout where the comment next to the
macro says it wants 1 millisecond. All seven call sites spin on the
hardware semaphore with udelay(), from sections that hold bank->lock or
irqmux_lock, so on a non-PREEMPT_RT kernel this can keep interrupts
disabled for up to one second while waiting for the coprocessor.

The hwspinlock core documents this explicitly:

  If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) the
  timeout is handled with busy-waiting delays, hence shall not exceed
  few msecs.

Pass the value the comment always described. The core retries every
HWSPINLOCK_RETRY_DELAY_US (100 us), so the semaphore is still polled ten
times before giving up, which is far longer than any plausible hold time
on the coprocessor side. A timeout is reported with dev_err() and fails
the pin configuration or the interrupt allocation, so shortening it
degrades gracefully.

Fixes: 290a9f937e5a ("pinctrl: stm32: use the hwspin_lock_timeout_in_atomic() API")
Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Ju Nan <junan76@163.com>
---
changelog:
v2:
- Add the "Fixes" tag
- Redefine HWSPNLCK_TIMEOUT as HWSPNLCK_TIMEOUT_MS

v1: https://lore.kernel.org/all/20260805032843.36961-2-junan76@163.com/
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index d97057ec2..0d888d30f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -87,7 +87,7 @@
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
-#define HWSPNLCK_TIMEOUT	1000 /* usec */
+#define HWSPNLCK_TIMEOUT_MS	1
 
 static const char * const stm32_gpio_functions[] = {
 	"gpio", "af0", "af1",
@@ -633,7 +633,7 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 
 	if (pctl->hwlock) {
 		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (ret) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			pctl->irqmux_map &= ~BIT(hwirq);
@@ -943,7 +943,7 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1086,7 +1086,7 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1132,7 +1132,7 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1178,7 +1178,7 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1239,7 +1239,7 @@ static int stm32_pconf_set_advcfgr(struct stm32_gpio_bank *bank, int offset, u32
 	spin_lock_irqsave(&bank->lock, flags);
 
 	if (pctl->hwlock) {
-		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1317,7 +1317,7 @@ stm32_pconf_set_skew_delay(struct stm32_gpio_bank *bank, int offset, u32 delay,
 	spin_lock_irqsave(&bank->lock, flags);
 
 	if (pctl->hwlock) {
-		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
-- 
2.55.0


