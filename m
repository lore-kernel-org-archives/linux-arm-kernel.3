Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F54CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 16:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbrnpdD8CF3wPWvXSTboKcNrFbu7LYufEVGUIXXk/IQ=; b=HH4djfNLe+FWVNEq3JagnxKZ/k
	zOBTX2q2Lo2mcdlCXm/D06a1Ty6imr7zwOgNSNust5IF8pFB13GBVmLoX8c0wJGZ9hiPDBs2pAFsj
	J/2OOHcdmDb23cl1+/t92YvcSQ/BFKiHrL7gx6NshGK1TnVTT4rRa0zWpaZveauREHbfeW1IPxA0e
	7Ysv6I1aEKDY/nMTuPkF9uOFEs1O1XS9E53bcSgncfODg7FWYGoZVkFmE9F8QAY6mEuZui6PfkNhb
	UrNu+si0zDIWqzeJyQVXkBymzrT6M/82G8tuIek95S24pIZyxV8fQ4bC1SHSVnS7TGafAB/att/+a
	gd4ukbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeP-00000007oU5-3AZd;
	Fri, 29 May 2026 16:01:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzeG-00000007oNd-3DDw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 16:01:28 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780070480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbrnpdD8CF3wPWvXSTboKcNrFbu7LYufEVGUIXXk/IQ=;
	b=OCoDKhEDt+SYMnBLTMKN+LUH8VOvCeM7CyrYXEEld5LI2sA8bOJ98ttY5LXrMNY/OZtbmu
	ZgHjfIi1b2LufXEXB0eQcu+ztkYeKOVSyl4XUU4fGpNoXJT+aphPInqfNh7MU9IbiCLGwB
	Sf9tF/W0yPqZ8AbCp7mCdOANodn98cFQidY8QeytGaCgA75khMkgH67kB1dqQj00b+bBAh
	/68yU9dB5THgTxrheAKcD6+jHh316zzHAr9qH/ttbffEWLK/zGs+FD7vUHBQd7A581dE/N
	uAuZF5ymfOmoxFhiBFdrmXQbd7tLNIA7YSSdXyf9ydoegmFm93V2yxr6ot7FMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780070480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbrnpdD8CF3wPWvXSTboKcNrFbu7LYufEVGUIXXk/IQ=;
	b=tr4NTO1YNRsGuahlOKQtSUD8eg7CCkQPgW7y+NJgZiX6IbK3HIbCNwY/XqexMCEbBibY6v
	GgeY9AFsCgbpQOCA==
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
Subject: [PATCH 2/5] mailbox: imx: Move the RX part of the mailbox into the threaded handler
Date: Fri, 29 May 2026 18:01:04 +0200
Message-ID: <20260529-imx_mbox_rproc-v1-2-b8ffc36e11e5@linutronix.de>
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090124_981240_3A9683BF 
X-CRM114-Status: GOOD (  12.21  )
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

Move RX callback handling into the threaded handler. This is similar to
the TX side except that we explicitly mask the source interrupt in the
primary handler and unmask it in the threaded handler again after
success. This was done automatically in the TX part.

The masking/ unmasking can be removed from imx_mu_specific_rx() since it
already happens in the primary/ threaded handler before invoking the
channel specific callback.

Move RX channel handling into threaded handler.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 2809965677bd7..30a52c609e56b 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -350,7 +350,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
=20
 	data =3D (u32 *)priv->msg;
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
 	*data++ =3D imx_mu_read(priv, priv->dcfg->xRR);
=20
 	if (priv->dcfg->type & IMX_MU_V2_S4) {
@@ -377,7 +376,6 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;
@@ -524,6 +522,12 @@ static irqreturn_t imx_mu_isr_th(int irq, void *p)
 		mbox_chan_txdone(chan, 0);
 		return IRQ_HANDLED;
=20
+	case IMX_MU_TYPE_RX:
+		cp->pending =3D 0;
+		if (!priv->dcfg->rx(priv, cp))
+			imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->=
idx), 0);
+		return IRQ_HANDLED;
+
 	default:
 		dev_warn_ratelimited(priv->dev, "Unhandled channel type %d\n",
 				     cp->type);
@@ -576,7 +580,9 @@ static irqreturn_t imx_mu_isr(int irq, void *p)
 		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_RFn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RX)) {
-		priv->dcfg->rx(priv, cp);
+		cp->pending =3D 1;
+		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		ret =3D IRQ_WAKE_THREAD;
 	} else if ((val =3D=3D IMX_MU_xSR_GIPn(priv->dcfg->type, cp->idx)) &&
 		   (cp->type =3D=3D IMX_MU_TYPE_RXDB)) {
 		priv->dcfg->rxdb(priv, cp);

--=20
2.53.0


