Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4258CCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cqkUVC2cMMYINzmwfqfIjQdgvD0S+4BFXmGBP6+vY6I=; b=1lVsm2y1pNecBLScedZGAOFlQs
	P4Vv0DjLnnrYtMUxYr8kcmD3xd6+7JWAR8ZMRmouDbKYRaa+zS+ENESs9DC8SiqR2iQFUeQHj+hDU
	5D0DDigZYmNKvGL7rXuDqMAB7RjcvAvKjnaOqtt+wdselHz39aj5Aga9jgPx3wKQgIPV2+L1zHqUc
	m4GbRv0cUuU0cffwa+qH6kefz/zWlFIAVVCNQ0Oa9agZv0v1UpLZ5amQdk7kJLG/x3BX+vtNeLvdU
	Erc3yj2nfqFr4RMUSVcj4Qgx3eZLGYi3VKHjDvniTtaoGufGpQw9auZk3mIrVNGXOSpTUnpBNO8/V
	2AxJxG8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1ZH-0000000Fwj3-0N9H;
	Wed, 14 Oct 2026 16:11:03 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1Z7-0000000FwgH-0HKm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 16:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=cqkUVC2cMMYINzmwfqfIjQdgvD0S+4BFXmGBP6+vY6I=;
	b=RMRQrryYAd/kYHktK/2NU5R/KznupYU2QtG/KA9w8dVZgnTqAv1Wh+oX/9lZdA
	HVo9EBHjiSGajdOIfPHAjPpKG6fRoeyzLxXyn+U5McdU2A75GroLhcMSphOxJ06H
	49fz6cys5CaiM+zwjZe6GPDoPqgi8sHGFL79NgY7tqJj0=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3v15Gqc9qxM0iAA--.40892S2;
	Thu, 15 Oct 2026 00:09:44 +0800 (CST)
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
Subject: [PATCH v4 0/2] pinctrl: stm32: fix hwspinlock timeout and EXTI mux locking
Date: Thu, 15 Oct 2026 00:09:16 +0800
Message-ID: <20261014160917.139241-2-junan76@163.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v15Gqc9qxM0iAA--.40892S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryUZr4kWF48GFyxZF4fZrb_yoW8CFWDpF
	ZxKr4Ykrs5XryaywsFyr409Fy5uw48Jw15G34kKw18Ars8ur1kt3s3Kr4S9F1qkrZ3ZFZF
	vr4aqrn8C34DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziO6pDUUUUU=
X-Originating-IP: [2409:8a62:3ec:5108::1000]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC9QkLvGrPqUnueQAA3Z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_091053_526307_FCA23068 
X-CRM114-Status: GOOD (  15.05  )
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

This series fixes two problems around the hwspinlock-protected EXTI mux
and pin configuration accesses in the STM32 pinctrl driver.

Patch 1 fixes the timeout passed to hwspin_lock_timeout_in_atomic().
The value was written as 1000 microseconds, but the argument is in
milliseconds, so the driver could busy-wait for up to one second with
interrupts disabled instead of the intended one millisecond. It is a
standalone fix and can be applied on its own.

Patch 2 moves the EXTI mux programming from the irq domain .activate
callback to .alloc. .activate runs under the raw desc->lock, while the
mux is written through a syscon regmap protected by a spinlock_t, which
lockdep reports as an invalid wait context and which is a real bug on
PREEMPT_RT. This was originally reported by Uwe Kleine-König in 2022.
.alloc runs in sleepable context and already reserves the mux line, so
the write now happens in the same irqmux_lock section as the
reservation. While at it, the reservation is released when the
hwspinlock cannot be taken.

---
Changes in v4:

- make the two patches a series to resolve the dependency issue
- reproduce the bug fixed by patch 2 on a modified version of
  STM32MP157-DK board with kernel version 7.1.13
- check the concurrent-requester case raised by Antonio in v3: the
  second bank is rejected in .alloc under irqmux_lock (details in
  patch 2)

v3: https://lore.kernel.org/all/20260804141402.86911-2-junan76@163.com/
v2: https://lore.kernel.org/all/20260804032227.35017-3-junan76@163.com/
v1: https://lore.kernel.org/all/20260803061718.43210-1-junan76@163.com/

Ju Nan (2):
  pinctrl: stm32: Fix the unit of the hwspinlock timeout
  pinctrl: stm32: program the EXTI mux from .alloc instead of .activate

 drivers/pinctrl/stm32/pinctrl-stm32.c | 60 ++++++++++++---------------
 1 file changed, 26 insertions(+), 34 deletions(-)

-- 
2.56.0


