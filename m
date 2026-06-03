Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921F4CD6E70
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qsswPfnnXsB1CCpGvONqYTMOqIRDSE3ZuW24UofC3Kc=; b=VaOukT4v7gZ0mlCZ7GSgdzNJsc
	BOc5hMAEYGWgXfa47E40nBNiDSqe+1jT633Mi0dNqA34MkCoAceIyRJcjLibwwliTKOZsiSW0p154
	ii8wVqSRrA5IgCsC9Y4hBt7pC/a2L2x7ZAZO61Ywn0jkjbUdWoR1ldLUZPZaXxt6dOdWBrq7oSdkJ
	qDJ226FXGuJhjjWizm5y+XqnqDRoEgIMrfeS0rS+5sPFuol3z5/eVALN7mfddXQwVCw1CdG7MhuQm
	UwO6vVocbjW6HK0ri4/M587O1S8JrGcIAm/HlAQIXMF4+SHv+wXBV5zTyr6j5iv96pkin3XjiAZ2L
	oZpEqlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHl-0000000F7JC-0HQ7;
	Wed, 03 Jun 2026 13:05:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHh-0000000F7Ex-3sdd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:27 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsswPfnnXsB1CCpGvONqYTMOqIRDSE3ZuW24UofC3Kc=;
	b=Z0pHmSo2e9HDjyvJRggfuyCHJ6y6zW13ZP/RkWeojZN3vR5/icaM16ZmgYP7Szm0s2XoT9
	oM72YLKc6J5H/8Ab/7G+cmC/JXKbp+ZaVqQ7RPm2GOedLO+1QyBx/VzDrS4xuxXqQu8gbo
	hF7Hk9AKHmz8K8j4DKqMLVaGIl9/JU2mmNgzaKeTn/B6zCYq9RtT+DwWX5FVJnqs8HwmBX
	+M5qwo1M48PRouUa7kyhVMrspMwoKsqo+PVrwLQegYV5a7lrMQBI5buIo9Ht57CxlBGjOv
	Cs3PtCIQ3UGRaJJZzS9Km1olhDdBIAxxZ79lnPP2idWG/NwtcXJhVm2hYxn3+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qsswPfnnXsB1CCpGvONqYTMOqIRDSE3ZuW24UofC3Kc=;
	b=jeVfsNNSjrj1ZI/nR2d3BwMidOmkeqY6W5NaTimA1P5kTSMZHU8CUP1+/aw8SruGy8vidq
	qOS0E3qXqa4qa+CQ==
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
Subject: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
Date: Wed,  3 Jun 2026 15:05:08 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060526_377352_1125773A 
X-CRM114-Status: GOOD (  13.43  )
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

Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
a threaded handler (imx_mu_isr_th()). The primary handler masks the
interrupt event so the threaded handler can run without raising the
interrupt again. The threaded handler can invoke the actuall callback in
preemtible context.

As a first step, prepare the logic and move TX handling part.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index d1de07cc0ed62..006aa76b74b62 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -81,6 +81,7 @@ struct imx_mu_con_priv {
 	struct mbox_chan	*chan;
 	struct work_struct 	txdb_work;
 	bool			shutdown;
+	bool			pending;
 };
=20
 struct imx_mu_priv {
@@ -539,11 +540,35 @@ static void imx_mu_txdb_work(struct work_struct *t)
 	mbox_chan_txdone(cp->chan, 0);
 }
=20
+static irqreturn_t imx_mu_isr_th(int irq, void *p)
+{
+	struct mbox_chan *chan =3D p;
+	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
+	struct imx_mu_con_priv *cp =3D chan->con_priv;
+
+	if (!cp->pending)
+		return IRQ_NONE;
+
+	switch (cp->type) {
+	case IMX_MU_TYPE_TX:
+		cp->pending =3D false;
+		mbox_chan_txdone(chan, 0);
+		break;
+
+	default:
+		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
+				     cp->type);
+		return IRQ_NONE;
+	}
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t imx_mu_isr(int irq, void *p)
 {
 	struct mbox_chan *chan =3D p;
 	struct imx_mu_priv *priv =3D to_imx_mu_priv(chan->mbox);
 	struct imx_mu_con_priv *cp =3D chan->con_priv;
+	irqreturn_t ret =3D IRQ_HANDLED;
 	u32 val, ctrl;
=20
 	switch (cp->type) {
@@ -579,7 +604,8 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if ((val =3D=3D IMX_MU_xSR_TEn(priv->dcfg->type, cp->idx)) &&
 	    (cp->type =3D=3D IMX_MU_TYPE_TX)) {
 		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
-		mbox_chan_txdone(chan, 0);
+		cp->pending =3D true;
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
 		priv->dcfg->rx(priv, cp);
@@ -594,7 +620,7 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 	if (priv->suspend)
 		pm_system_wakeup();
=20
-	return IRQ_HANDLED;
+	return ret;
 }
=20
 static int imx_mu_send_data(struct mbox_chan *chan, void *data)
@@ -629,7 +655,8 @@ static int imx_mu_startup(struct mbox_chan *chan)
 	if (!(priv->dcfg->type & IMX_MU_V2_IRQ))
 		irq_flag |=3D IRQF_SHARED;
=20
-	ret =3D request_irq(priv->irq[cp->type], imx_mu_isr, irq_flag, cp->irq_de=
sc, chan);
+	ret =3D request_threaded_irq(priv->irq[cp->type], imx_mu_isr, imx_mu_isr_=
th,
+				   irq_flag, cp->irq_desc, chan);
 	if (ret) {
 		dev_err(priv->dev, "Unable to acquire IRQ %d\n", priv->irq[cp->type]);
 		return ret;

--=20
2.53.0


