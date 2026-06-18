Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F02ACD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDFHRCtMsExj7xytJHvcI01IC3A4ZIMSF311dGLQCF8=; b=0r8UWCW7vm9CVWR1TayJ4IcOAA
	lDcEtsFIrA/r3OzJTx71G03xDPxHHuB1lU6kbeWs3uutVJIbLUOgFSuR/tptImG0ItOI/X2jQDouq
	kT/ZEdGn58CjRXxve1kc020ztwLXnz5ibCNIiEcIZc7fCKIUgEciGtQc0uEuACTLoKcCKUxn0G64K
	llbjKqi5e5xJ2bbsCKOZqGt/8tnjjmyjrKfs9+lzL7cd6lmC2Z285PWu0dI1tZfUsvk3RzMTgta3o
	ZxDUSBGZR683aOS1xQgWJWhZ6UbSJCDa3ZJGBzrdvo5bYYQR6l4fDlU9En3MuD94+pZNmD/QvOH4c
	TaPsimGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waE3p-00000001RsU-01Ft;
	Thu, 18 Jun 2026 14:49:41 +0000
Received: from mail-m24122.xmail.ntesmail.com ([45.195.24.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waE3l-00000001Rs7-04qw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:49:38 +0000
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee9309;
	Thu, 18 Jun 2026 22:49:31 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap updates
Date: Thu, 18 Jun 2026 22:49:26 +0800
Message-Id: <20260618144926.3551915-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618081554.zifCwv4I@linutronix.de>
References: <20260618081554.zifCwv4I@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb356b4b03a1kunm8568d9c4a672e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU1NVhgfQ0NDT0JMGRlCSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=cmFculJQF7D37En2zbn82en138LkdfjCBj0yBmO4+GRPq8Ied/pBxVpckJujr6a3F+UBUHVVRDpauSvNFc8NamAaS3Xlnb2HLNMtND++JsY0OJaUsXAz274oOSJiiNBlae1riz0w8FoBQBNGSrNYZQ+vZhKWGptxTPDJq1xhgDk=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=YDFHRCtMsExj7xytJHvcI01IC3A4ZIMSF311dGLQCF8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_074937_294634_771F9811 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

Hi,

Thanks everyone for the feedback.

I will not send the irq_bus_sync_unlock/shadow-state patch for now. From
Sebastian's comments, it sounds like the more important question is
whether this should be handled at the regmap locking/cache level, or by
using a raw lock only where the regmap path is known to be safe.

Herve, your point about other GPIO controllers is fair. I should not
treat PLGPIO as special without checking the wider pattern. I will look
at other irq_enable/irq_disable users that combine irqchip callbacks,
driver spinlocks and regmap_update_bits(), and compare whether they are
using MMIO/flat cache/raw regmap locking or a sleepable regmap path.

For the current PLGPIO draft, I will hold it back until I can answer
whether the right fix belongs in this driver or in the common regmap/GPIO
pattern.

Thanks,
Runyu

