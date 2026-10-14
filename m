Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862B4CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1xNoGNlDuv8dcA05o9muZ1QtkmEswQhTqN6SrXTfWI=; b=1EoGiSdiQ09jiq5klaLo+WW8U4
	WKHRoxfzTzRq2hNvWt3jxM5M2OQUR7hqtjOVjJVUmVcDI6M52oE4SoB/l4of2HSx4TH7HFZ51kpy3
	RNdZ21i6CGz8c7R0q7tiT/WIV7a9N3LtwMyd7NMyorbAzbriqvkJqk9bQt+C0oyf3L8YG1mh0A3tK
	erPdm82CHVvKlJLIcry868rCCq+VilSBbVh+T43Arv9bXP5ZyEcDqgxcWidGq9btDUbhhuQO0RDjE
	rueX32Aa3xFZNzk7cQBggB7lkxqfRot/ipQIcY8qgizQd2NSEm24QvWFTYb5GX4lMtj+Eh+GWbwqw
	td5HEH4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1ZH-0000000FwjN-0qut;
	Wed, 14 Oct 2026 16:11:03 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1Z7-0000000FwgQ-2Cz4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 16:10:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=o1
	xNoGNlDuv8dcA05o9muZ1QtkmEswQhTqN6SrXTfWI=; b=HuRHChRJv/jlQNiIMf
	16PHgfNcZnlrAjoqtMercf5+sXqdV8TdXJ89LDiYx5Ql2YslJqnDuglgj7gautHv
	qNDVkCo+7lOsAJeZSrhHEXoFUOAWocWRGOdm490fyPYjLYSKsjjTDN9P29FSGaGj
	fCmPdss/y1J0XEOk4CD29/m6Q=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3v15Gqc9qxM0iAA--.40892S3;
	Thu, 15 Oct 2026 00:09:54 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: junan76@163.com,
	antonio.borneo@foss.st.com,
	bigeasy@linutronix.de,
	linusw@kernel.org
Cc: alexandre.torgue@foss.st.com,
	arnd@arndb.de,
	clrkwllms@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	mfd@lists.linux.dev,
	rostedt@goodmis.org,
	u.kleine-koenig@pengutronix.de
Subject: [PATCH v4 1/2] pinctrl: stm32: Fix the unit of the hwspinlock timeout
Date: Thu, 15 Oct 2026 00:09:17 +0800
Message-ID: <20261014160917.139241-3-junan76@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014160917.139241-2-junan76@163.com>
References: <20261014160917.139241-2-junan76@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v15Gqc9qxM0iAA--.40892S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFyDGw4kXr43uF47WFWxZwb_yoW5tw1fpF
	Zagwn0yrs8XrW5Zw4DtF4q9rnxJa1Iyw4DJFWjqa48Zr1jqr95Ja1Sqa92yF12qas7J3ZI
	qFW2q345ua1DAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEs2-8UUUUU=
X-Originating-IP: [2409:8a62:3ec:5108::1000]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC0xINvmrPqVIcfQAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_091053_960199_335C851F 
X-CRM114-Status: GOOD (  11.50  )
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

The hwspinlock core documents this explicitly:

  If the mode is HWLOCK_IN_ATOMIC (called from an atomic context) the
  timeout is handled with busy-waiting delays, hence shall not exceed
  few msecs.

Fixes: 290a9f937e5a ("pinctrl: stm32: use the hwspin_lock_timeout_in_atomic() API")
Signed-off-by: Ju Nan <junan76@163.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5a23..e71651d4fad4 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -87,7 +87,7 @@
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
-#define HWSPNLCK_TIMEOUT	1000 /* usec */
+#define HWSPNLCK_TIMEOUT_MS	1
 
 static const char * const stm32_gpio_functions[] = {
 	"gpio", "af0", "af1",
@@ -609,7 +609,7 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 
 	if (pctl->hwlock) {
 		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (ret) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			return ret;
@@ -946,7 +946,7 @@ static int stm32_pmx_set_mode(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1089,7 +1089,7 @@ static int stm32_pconf_set_driving(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1135,7 +1135,7 @@ static int stm32_pconf_set_speed(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1181,7 +1181,7 @@ static int stm32_pconf_set_bias(struct stm32_gpio_bank *bank,
 
 	if (pctl->hwlock) {
 		err = hwspin_lock_timeout_in_atomic(pctl->hwlock,
-						    HWSPNLCK_TIMEOUT);
+						    HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1242,7 +1242,7 @@ static int stm32_pconf_set_advcfgr(struct stm32_gpio_bank *bank, int offset, u32
 	spin_lock_irqsave(&bank->lock, flags);
 
 	if (pctl->hwlock) {
-		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
@@ -1320,7 +1320,7 @@ stm32_pconf_set_skew_delay(struct stm32_gpio_bank *bank, int offset, u32 delay,
 	spin_lock_irqsave(&bank->lock, flags);
 
 	if (pctl->hwlock) {
-		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT);
+		err = hwspin_lock_timeout_in_atomic(pctl->hwlock, HWSPNLCK_TIMEOUT_MS);
 		if (err) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
 			goto unlock;
-- 
2.56.0


