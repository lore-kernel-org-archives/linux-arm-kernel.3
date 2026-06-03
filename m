Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEBCCD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=smnfHwXHRkzzEhvhUiFBh6IWlVN4loP6QRpo40MdtYc=; b=4zFML2rucJiVH7RtIxJXoJYmfx
	gA//UftbKuGRwdbpD9p552TW36wPRBZ3txMffx3LiyLrZlaY64uf85euB6luazUMF3903kKrs28kB
	3IKvmP91lDnEjnCY+EoRgJ9afXAd1Q2ST2IggcAc8MRBy4GvsZJyqECeX4Dmra1j8JR+wG0qLAaQa
	B5xcUEcLPz9pIlMO7fRl70O0B7zzISRVZIz0l50WrnXcvU7OBvVugQSEJMnNZ9EWzCt3So6hHqTCe
	/uBFqePIvTbv0BtMAhpmZywKvV8vEt6VA4f2M+Fu5kq0hm+H2d/SOQe7nOLvXFCnQUvNiSWstzqVo
	mEzMZuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHk-0000000F7IK-3BlB;
	Wed, 03 Jun 2026 13:05:28 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHf-0000000F7Ci-3Sqh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:26 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smnfHwXHRkzzEhvhUiFBh6IWlVN4loP6QRpo40MdtYc=;
	b=bLhZV4+3rA+M0tfAjH7IrUXHcPwutz6J7D+nezxX/fvNCqdClJab2N0xH/0sWk5pv8GrUL
	vX1DE5lsM3MKOjG7lTFUAmaX9jEB2dsNIRh6T+j9fk+xciJCM/qRIJLqCF8MJ99WMR/cAr
	0TdGSyCa3KpJ3lLNAsSxiEUNKdKZImSf7Y4O21sWrOMO1MKUrMXA+Lbgv/uPinCZ3uMezD
	qjkSJCLuYCzIud3kJaVwKFVrmeJwxKJYskJTP/PxF2WAq01Mj1kKhk7pekuR295WkxS8Hy
	gjX+zZzF0hOyGqi0WS4pQQuGXwmIrW9NStKKTfaRqAING47nYm5a2REe7Ju1FA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smnfHwXHRkzzEhvhUiFBh6IWlVN4loP6QRpo40MdtYc=;
	b=BpOQHe6vRJ0U5f1cJNCncBj0jhdla7xnn9+jXYzroPsWQ06vioMEQ0jIU9JPz8q0IkVdGT
	M/s8xbavRtIh4dAw==
To: linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
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
Subject: [PATCH v2 0/9] mailbox: imx: Use threaded handler to avoid kworker in imx's remoteproc
Date: Wed,  3 Jun 2026 15:05:03 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260529-imx_mbox_rproc-7d512f5a6f78
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060524_007566_C002881B 
X-CRM114-Status: GOOD (  12.18  )
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

The imx's remoteproc driver uses a kworker from its mailbox callback to
complete the request. The reason is that the imx mailbox driver invokes
the callback from its interrupt handler and the remoteproc callback (at
least the rpmsg-tty) requires a preemptible context.

This works but is problematic in a PREEMPT_RT environment where the
latency of the invocation is important. By scheduling a kworker the
high task priority from the threaded handler is lost and the kworker
competes for CPU ressources with every SCHED_OTHER task in the system.
This can lead to long delays on a busy system with other RT threads
which are less important than the completion of this request.

Looking over other mailbox driver, like the arm_mhu for instance, they
use a threaded interrupt handler to invoke the callback. This avoids the
kworker detour.

The here suggested change utilises a threaded interrupt to invoke the
callback. The primary handler mask the interrupt source so that the
handler can run without getting interrupted by the interrupt again.
Doing so avoids marking the interrupt IRQF_ONESHOT so that in a
shared-interrupt environment the other interrupt can still fire while
the first is masked.

The first four patches are result of the sashiko review. Does not look
critical.

This change was tested on a im93 board with rpmsg-tty driver.

v1=E2=80=A6v2: https://lore.kernel.org/r/20260529-imx_mbox_rproc-v1-0-b8ffc=
36e11e5@linutronix.de
  - Using correct register to enable RXDB event.
  - Update commit description for the "threaded interrupt", "unmasks the
    interrupt" =3D> "masks the interrupt event".
  - Add a shutdown field so that the interrupt does not unmask the
    interrupt if it has been already disabled because the channel is
    about to be shutdown.  A possible race mentioned by sashiko.
  - Use devm_pm_runtime_enable(). This should avoid a possible race
    sashiko mentioned.
  - Use devm_of_platform_populate().

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Sebastian Andrzej Siewior (9):
      mailbox: imx: Add a channel shutdown field
      mailbox: imx: Use devm_pm_runtime_enable()
      mailbox: imx: use devm_of_platform_populate()
      mailbox: imx: Use channel index instead of zero in imx_mu_specific_rx=
()
      mailbox: imx: Start splitting the IRQ handler in primary and threaded=
 handler
      mailbox: imx: Move the RX part of the mailbox into the threaded handl=
er
      mailbox: imx: Move the RXDB part of the mailbox into the threaded han=
dler
      mailbox: imx: Don't force-thread the primary handler
      remoteproc: imx_rproc: Invoke the callback directly

 drivers/mailbox/imx-mailbox.c  | 133 ++++++++++++++++++++++++++++++-------=
----
 drivers/remoteproc/imx_rproc.c |  33 +---------
 2 files changed, 100 insertions(+), 66 deletions(-)
---
base-commit: 3bc831df9ee16fceee851872315161377ca1417d
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78

Best regards,
--=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>


