Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D6BC55838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 03:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kXYywNMh6vzEx1z9jhfiDuQDqbIo2Ie56qyFTxXK1o0=; b=cACKG5OPVr/F2CAlo3AF7EnQP1
	yl/tFWxSLaZkPteGX3oRfxqDzZ5IA8q95F0EXwU/OCIVmn9WSfmSJm8Zx8Yh8Cbhmy/mfCsVraZsG
	u/rA/RjYkHmrxIsrv2LG2/qDk505TbFnD6YlPlJRdc63OoibdXkk9atho2+qtTFW+vqP3EJcGHL5D
	WSciq+j61BJ07aUHBTmcxFPUa6mysPXxiLRSvks2A3/4v8eKa7himlWQDlvhHRhIDlr+7+kspozrG
	RoUysknkJARFk7Bd5i4fNTZnVcyuYsA+LgUNCjljUDk65YoDNXiRsGl5/9xqz7qbIcKvcBUnoP7nn
	krrWF4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSKR-00000003AdJ-1I6Q;
	Wed, 05 Aug 2026 03:30:03 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrSKN-00000003AcK-2qIO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 03:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=kX
	YywNMh6vzEx1z9jhfiDuQDqbIo2Ie56qyFTxXK1o0=; b=aWdGyWz2d/LJfyqpQp
	UICDhVQ8NnXN8DYYQb6iIEMfInuyV/jJDWmjFmCFvZzVo0bGgj7KceOTXjmoXNr3
	+JuFxrmOOshTQTDOqQthlPwcpCCVnHRXc43BlOmPopVWgM/NU5H6GvX5RX0ti6VG
	MUhh3RPRkptGbYfSxF3GdyBtc=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P1sdrnJqG4KmNw--.47924S2;
	Wed, 05 Aug 2026 11:29:34 +0800 (CST)
From: Ju Nan <junan76@163.com>
To: antonio.borneo@foss.st.com,
	linusw@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	junan76@163.com
Cc: linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: stm32: fix the unit of the hwspinlock timeout
Date: Wed,  5 Aug 2026 11:28:44 +0800
Message-ID: <20260805032843.36961-2-junan76@163.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3P1sdrnJqG4KmNw--.47924S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4fXFyxCFWfKw4fKF1kAFb_yoW8Wr47pF
	W3Gwn8CFsYqayak3WkJa1qgFy3GayxJrW8KF92q3yav3Z0yayvqr4rKayjvF9F9rW8Xanx
	tF4Sg345C3Z5CFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piPEf5UUUUU=
X-Originating-IP: [2409:8a62:3e6:1400:e93f:3d77:3322:beb7]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1B7pm2pyrh6LhQAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_203000_541614_FC73C61E 
X-CRM114-Status: GOOD (  14.22  )
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
macro says it wants 1 millisecond.

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

Signed-off-by: Ju Nan <junan76@163.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 6a99708a5..dbc9143ec 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -87,7 +87,7 @@
 #define gpio_range_to_bank(chip) \
 		container_of(chip, struct stm32_gpio_bank, range)
 
-#define HWSPNLCK_TIMEOUT	1000 /* usec */
+#define HWSPNLCK_TIMEOUT	1 /* msec */
 
 static const char * const stm32_gpio_functions[] = {
 	"gpio", "af0", "af1",
-- 
2.55.0


