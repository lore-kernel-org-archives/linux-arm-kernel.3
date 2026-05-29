Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3258CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T/oTAOOJ1Z4TFN7Yr5Hcs60Jolfhci9ej79a+pR3awY=; b=GgfI7SdvyQ7wiKgSlx1U+ZIqBw
	M3o2FJ2CnCZqPQf5Ku2ucykS7gSXyWT6AQx9BY7CeGM1U3dgk3SZzfYmcEr/xf5VT/wG0nS7xgfs9
	mgat9dfyC48N4dCa7wEX4HtHeqpNecKRhM2WOPUiJVtFCpOdIb0J1s2j4n+zfNKTl6u8g2lEgKxwW
	zDDg5N0BKmMzyS0nKDpOv1seyW1vbM6wjIa90nGlF+3iQmDQjXQfCIJ8mlXlsDmIzYp3oQQVzBuuw
	hRTi9Srz82SPNw3oKOByxXJ+6SKZI6Mvo0ME9m33GyKLe0hDMRunwjIcz9pk2/c2H0kWqVCbf147R
	HRsJuldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeP-00000007oTC-1yKp;
	Fri, 29 May 2026 16:01:33 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeG-00000007oNb-3Blx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:01:26 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T/oTAOOJ1Z4TFN7Yr5Hcs60Jolfhci9ej79a+pR3awY=;
	b=2FQf+zoVYHyZMx55iz81hh2eO+Wn32lxoHRdPcg5lmlADigZh/T0t8QZCtaN733yXqdW32
	5+5IoTjE91BPrOxXOf1Xo+q+XR/HX0fJrSnA/+ZiUeXqhu4C37L7LOBk/z2TRt+xg4N33L
	TQP7R7aWHNUpghpH8odNPUVMleswH2OR6JmrG6+ZlvX05FSXc8KjHn1revDiyv/qSWWODz
	T1rHASv3zd/3d8cNxzU9/EO5reIspIBiTxmzbUAK86395J8HaeOWAgyqQHlrgP1p76YZ47
	xfSKIuZNqn2qymVuSgL3Cb2k48MO2MEg7NvTxWm5quNwB6hj43yVN0ZptM4Adg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T/oTAOOJ1Z4TFN7Yr5Hcs60Jolfhci9ej79a+pR3awY=;
	b=8UQeTzW48huPWiCb0oKS963hXt6P4PSvE33NB5++XlRKFXUgoNFz4k3u/B8uLtXYnKxwHj
	8RtyUnWv1J8Av5CA==
To: linux-rt-devel@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 0/5] mailbox: imx: Use threaded handler to avoid kworker in  imx's remoteproc
Date: Fri, 29 May 2026 18:01:02 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260529-imx_mbox_rproc-7d512f5a6f78
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090124_962304_4C22004D 
X-CRM114-Status: UNSURE (   8.13  )
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

The imx's remoteproc driver uses a kworker from its mailbox callback to=0D
complete the request. The reason is that the imx mailbox driver invokes=0D
the callback from its interrupt handler and the remoteproc callback (at=0D
least the rpmsg-tty) requires a preemptible context.=0D
=0D
This works but is problematic in a PREEMPT_RT environment where the=0D
latency of the invocation is important. By scheduling a kworker the=0D
high task priority from the threaded handler is lost and the kworker=0D
competes for CPU ressources with every SCHED_OTHER task in the system.=0D
This can lead to long delays on a busy system with other RT threads=0D
which are less important than the completion of this request.=0D
=0D
Looking over other mailbox driver, like the arm_mhu for instance, they=0D
use a threaded interrupt handler to invoke the callback. This avoids the=0D
kworker detour.=0D
=0D
The here suggested change utilises a threaded interrupt to invoke the=0D
callback. The primary handler mask the interrupt source so that the=0D
handler can run without getting interrupted by the interrupt again.=0D
Doing so avoids marking the interrupt IRQF_ONESHOT so that that in a=0D
shared-interrupt environment the other interrupt can still fire while=0D
the first one is masked.=0D
=0D
This change was tested on a im93 board with rpmsg-tty driver.=0D
=0D
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>=0D
---=0D
Sebastian Andrzej Siewior (5):=0D
      mailbox: imx: Start splitting the IRQ handler in primary and threaded=
 handler=0D
      mailbox: imx: Move the RX part of the mailbox into the threaded handl=
er=0D
      mailbox: imx: Move the RXDB part of the mailbox into the threaded han=
dler=0D
      mailbox: imx: Don't force-thread the primary handler=0D
      remoteproc: imx_rproc: Invoke the callback directly=0D
=0D
 drivers/mailbox/imx-mailbox.c  | 65 +++++++++++++++++++++++++++++++++-----=
----=0D
 drivers/remoteproc/imx_rproc.c | 33 +--------------------=0D
 2 files changed, 53 insertions(+), 45 deletions(-)=0D
---=0D
base-commit: 9e171fc1d7d7ab847a750c03571c87ac3c17bd84=0D
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78=0D
=0D
Best regards,=0D
-- =0D
Sebastian Andrzej Siewior <bigeasy@linutronix.de>=0D
=0D

