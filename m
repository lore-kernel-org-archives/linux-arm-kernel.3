Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A654ACD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e9nchplALmdInXrIeq0H4ZfQBWRoLMZu7mZZrHWhkXc=; b=GUoo+HbwFgv6UMAjyMerWmwZJM
	xeh0ONQ+7H5aRJ0f/sWA7Toszbza7uV3q+l/IVlWKdgFWhzIQdb54LYv0j+MQAng2JnjZY8Squtro
	DtLhZ8t8g1jVEbUWV7z+5dzBJ6yeWwtAd8nQMBxAmnzO3Dtjy7b+m+hsj6Ditu0VPADfLLN8J6A5a
	DbYDdKDjMj8lEgoJWeWjDEPs3byMzGCpYztGL6BP8D3ktet44LBWT70wYQjjT6+W9/Fmv30Hxet2Y
	Tl+Smj+XTA/Fp1G0lQ3xGjyAhftyviqSU3tExsaMcHMCqYz4V8lVw4ItmkjkcTAPbC5qNaJ9wTccV
	/ZQXekZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBq-0000000Gkoj-1gWZ;
	Wed, 17 Jun 2026 06:55:58 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkBh-0000000Gkg9-3TsE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 06:55:51 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781679343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e9nchplALmdInXrIeq0H4ZfQBWRoLMZu7mZZrHWhkXc=;
	b=tOtodkB6a25IswuJPODrO6GdwfCn6Afmg8ATx+6vfDzOKDjL7M060NVVXq72+9ryJOuDa1
	Xu+dsSTfaW6wJbbd91DGv5+Hk8oNcegLqkmTLKOosacM2IYVYQTP5+ZcG+mBNj9y2GTH3y
	+O3u+9ViEAkTvmvJgQNvSHl11SX6g8+XYD/K6riDbevMnpfqJSsc/GAQenuThb826oLshk
	tg49oHs9ETPzVViyT2xx6hUWnnPlmmpTeoNxEGFzrLovGHjCoce8IZRNoS6gRBE2+A9Xw1
	uerVUZGHS/ZCl/ivcY83Fz93gw1/J81FKjILxDBy7Vu/moEy+LvDQGUmccRR1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781679343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e9nchplALmdInXrIeq0H4ZfQBWRoLMZu7mZZrHWhkXc=;
	b=FIlUEPa3B8kzJnoFXNbHuOn7ro8dFMqNxrfeM7bRgWfCnkMc8koGgM3ekqMcxjNbMvMiUg
	WiPlAnyXxrnpxHBg==
To: linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
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
	Steven Rostedt <rostedt@goodmis.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 00/10] mailbox: imx: Use threaded handler to avoid kworker in imx's remoteproc
Date: Wed, 17 Jun 2026 08:55:25 +0200
Message-ID: <20260617-imx_mbox_rproc-v3-0-77948112defc@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260529-imx_mbox_rproc-7d512f5a6f78
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_235550_045292_BD077DBD 
X-CRM114-Status: GOOD (  13.90  )
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

v2=E2=80=A6v3: https://lore.kernel.org/r/20260603-imx_mbox_rproc-v2-0-a0059=
dc3b69a@linutronix.de
  - Forward the error in imx_mu_generic_tx() to the caller (new patch
    #1)
  - Extend the patch description a bit for for "Start splitting the IRQ
    handler" to briefly explain why callbacks are moved to the threaded
    handler.
  - Drop imx_mu_con_priv::pending. The primary handler wakes its
    threaded handler. Once the handler is woken, the pending flag must
    be set and there is no need to set/ clear it.
  - Avoid the double clk_disable_unprepare() if
    devm_mbox_controller_register() fails.

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
Sebastian Andrzej Siewior (10):
      mailbox: imx: Forward the timeout/ error in imx_mu_generic_tx()
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

 drivers/mailbox/imx-mailbox.c  | 117 ++++++++++++++++++++++++++++++-------=
----
 drivers/remoteproc/imx_rproc.c |  33 +-----------
 2 files changed, 88 insertions(+), 62 deletions(-)
---
base-commit: b3f94b2b3f3e51ab880a51fc6510e1dafba654ed
change-id: 20260529-imx_mbox_rproc-7d512f5a6f78

Best regards,
--=20
Sebastian Andrzej Siewior <bigeasy@linutronix.de>


