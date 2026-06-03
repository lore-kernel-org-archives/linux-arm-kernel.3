Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19C2CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZV+ffJlIUH8tNWX0DeCQvrDENvjacC7P6NDhKlFacYE=; b=m2nm3GQCi6Q39RjxjRnujf3N7d
	qvAVb04kBSApGWmBjLgqwk3XxtP4/h3A1TQqzS7a9iO/kGCTdxAXF/BI6Fc0D+hx6fvX45nDU+gLH
	Izrk2o3pFmhRj4fSvTIPavfVAnOJ7u5s3rbRiZY23Wn9BFxAu+tG+Q8M8OEtTaeWEe74hWWXV3mU9
	rZc3+HEHFfNcyJs+LDPbSitOvPUZCOxtIi7a278BerRihjHHtMq3ea52mR2OzS8YIDcc/GdlHRg8Z
	+3vC/n4fd9yZeOMSXdT0rNzPMOCGf1xpBgD7cISoUKtgFmevjpwfrClMzvK6xWFpjWcOz02HFF0iO
	ZiCOsBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHh-0000000F7F7-1bEl;
	Wed, 03 Jun 2026 13:05:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlHf-0000000F7Cn-0mSH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:05:24 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV+ffJlIUH8tNWX0DeCQvrDENvjacC7P6NDhKlFacYE=;
	b=XN1tXWP71myVvUCIXKexPpY8nMfbTz8r15adUKvwXewFNemGgf0Iv0SPtwRa9nNKBXSreT
	r42AQaIt18LJqJTVK5DzUF/J7PJ0NAhmEk3KD+TBVvTmCdk3XLoIe/I54YhIgMVyk63Gyj
	bIIFOQkuC3RslnNxUDHZxLm2y+EEAgQh6MYxOtehud+NJx7P4KHsT6xNSpNCYX8SZ3fjKB
	TVvs47obijIjAK6+QmtDyiSwHDSyaG/CM3Hm8KYnMLMB6xjjDX1r55sDYuE4KFqj5XAynh
	QS5DkxjM4TSXqEn/yKvJrC6Lp0fqJtSzS2aW+sIeyrdSMIMWg8ygoOkHCLXHbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780491919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZV+ffJlIUH8tNWX0DeCQvrDENvjacC7P6NDhKlFacYE=;
	b=zgqQhrwaEkJLOlZYMC2Qn4EJhVjXGEhZuh5YCYVdTnw5poJHkXWnlEECxM3/xzOSD2Wm0U
	XBt6KLoXSvvDteBw==
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
Subject: [PATCH v2 1/9] mailbox: imx: Add a channel shutdown field
Date: Wed,  3 Jun 2026 15:05:04 +0200
Message-ID: <20260603-imx_mbox_rproc-v2-1-a0059dc3b69a@linutronix.de>
In-Reply-To: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_060523_372859_3AE0FA04 
X-CRM114-Status: GOOD (  14.06  )
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

sashiko complained about possible teardown problem. The scenario

 CPU 0                              CPU 1
  imx_mu_isr()                   imx_mu_shutdown()
                                   imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_=
MU_xCR_RIEn(priv->dcfg->type, cp->idx));
    imx_mu_specific_rx()
      imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0)=
, 0);
                                   free_irq()

The RX event remains enabled because in this short window the RX event
was disabled in ->shutdown() while the interrupt was active and then
enabled again by the ISR while ->shutdown waited in free_irq().

This race requires timing and if happens can be problematic on shared
handlers if the "removed" channel triggers an interrupt. In this case
the irq-core will shutdown the interrupt with the "nobody cared"
message.

Introduce imx_mu_con_priv::shutdown to signal that the channel is
shutting down. This flag is set with the lock held (by
imx_mu_xcr_clr_shut()). The unmask side uses imx_mu_xcr_set_act() which
only enables the event if the channel has not been shutdown and
serialises on the same lock.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mailbox/imx-mailbox.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 246a9a9e39520..34edc2f31dcb5 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -80,6 +80,7 @@ struct imx_mu_con_priv {
 	enum imx_mu_chan_type	type;
 	struct mbox_chan	*chan;
 	struct work_struct 	txdb_work;
+	bool			shutdown;
 };
=20
 struct imx_mu_priv {
@@ -219,6 +220,36 @@ static u32 imx_mu_xcr_rmw(struct imx_mu_priv *priv, en=
um imx_mu_xcr type, u32 se
 	return val;
 }
=20
+static void imx_mu_xcr_clr_shut(struct imx_mu_priv *priv, struct imx_mu_co=
n_priv *cp,
+				enum imx_mu_xcr type, u32 clr)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->xcr_lock, flags);
+	cp->shutdown =3D true;
+
+	val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
+	val &=3D ~clr;
+	imx_mu_write(priv, val, priv->dcfg->xCR[type]);
+	spin_unlock_irqrestore(&priv->xcr_lock, flags);
+}
+
+static void imx_mu_xcr_set_act(struct imx_mu_priv *priv, struct imx_mu_con=
_priv *cp,
+			       enum imx_mu_xcr type, u32 set)
+{
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&priv->xcr_lock, flags);
+	if (!cp->shutdown) {
+		val =3D imx_mu_read(priv, priv->dcfg->xCR[type]);
+		val |=3D set;
+		imx_mu_write(priv, val, priv->dcfg->xCR[type]);
+	}
+	spin_unlock_irqrestore(&priv->xcr_lock, flags);
+}
+
 static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 			     struct imx_mu_con_priv *cp,
 			     void *data)
@@ -376,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv,=
 struct imx_mu_con_priv *
 		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
 	}
=20
-	imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0), 0);
+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type=
, 0));
 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
=20
 	return 0;
@@ -604,6 +635,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 		return ret;
 	}
=20
+	cp->shutdown =3D false;
 	switch (cp->type) {
 	case IMX_MU_TYPE_RX:
 		imx_mu_xcr_rmw(priv, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->i=
dx), 0);
@@ -638,13 +670,13 @@ static void imx_mu_shutdown(struct mbox_chan *chan)
=20
 	switch (cp->type) {
 	case IMX_MU_TYPE_TX:
-		imx_mu_xcr_rmw(priv, IMX_MU_TCR, 0, IMX_MU_xCR_TIEn(priv->dcfg->type, cp=
->idx));
+		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_TCR, IMX_MU_xCR_TIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
 	case IMX_MU_TYPE_RX:
-		imx_mu_xcr_rmw(priv, IMX_MU_RCR, 0, IMX_MU_xCR_RIEn(priv->dcfg->type, cp=
->idx));
+		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->ty=
pe, cp->idx));
 		break;
 	case IMX_MU_TYPE_RXDB:
-		imx_mu_xcr_rmw(priv, IMX_MU_GIER, 0, IMX_MU_xCR_GIEn(priv->dcfg->type, c=
p->idx));
+		imx_mu_xcr_clr_shut(priv, cp, IMX_MU_GIER, IMX_MU_xCR_GIEn(priv->dcfg->t=
ype, cp->idx));
 		break;
 	case IMX_MU_TYPE_RST:
 		imx_mu_xcr_rmw(priv, IMX_MU_CR, IMX_MU_xCR_RST(priv->dcfg->type), 0);

--=20
2.53.0


