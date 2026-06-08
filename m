Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E9ECD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+o8svFCxO2rHzDsZerdi155VOjvat+y1/HHxxd5x+s=; b=T4era5uhP53tTvC0XkEQwsU3Dz
	GKNYJfRf9qF8p61auV4+ZOnyeQGeOmI61srTIKo/3aoprlUXn2Wbm6DdD9c3Ko/WlJwFu1r8m5Kjf
	TrLoJQDsbWopZ8iZhK9QLbSf8zD40VNTvz9PAbNYo8xtfTJxn1jkslS/RYV8ZU4c6qy63oUlH2lFM
	hmqXknqv/BDu+K71x777BpU0p+Z6vdPpNImF0TliutA1oe1/+B9rlrOKyoml1KOpeYYTwwkW8f/qN
	bTnr083Iy0YN4OkDXNK/gIPTbVhogSGvt0b9uUkrT4kSxXcGIdV/vieAHm+o8j0oZyyWSZxe7vq2+
	FCAFcjvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWR2-00000003CFV-3chc;
	Mon, 08 Jun 2026 09:38:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWR0-00000003CER-2DhL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:38:19 +0000
Date: Mon, 8 Jun 2026 11:37:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780911492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+o8svFCxO2rHzDsZerdi155VOjvat+y1/HHxxd5x+s=;
	b=qSkXkyiMhG+yreJBJn8Bv+ukObN6m2OGhUPb65y3sGKyWWCw6XTaynyoEVXyQ1oAwc/Pw1
	X2u/taqCLcxpZZffzmaDVueqDQoaZXaOUOJYZHQgyUNVBbhEA7R9gHii9orsMghKX57Kna
	pc/waPc/ifmH66YVHTTi14N3d78/OZpusS+9nUVRMpq6sDM2mfZrLM0cLF3jOXjj2AIs3p
	VwAV+tJtJfEO3MrzfL0LVFdNNxNmuzlS/jPl1rK3GyqSCNLM/kNu9NYdjCiy7wj/pxsvjZ
	sZ43J9BtppHdiIgPuhtMxK/LF8fn7wOmiVVFXpzU812iGRlKyjqD7/T715YLdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780911492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l+o8svFCxO2rHzDsZerdi155VOjvat+y1/HHxxd5x+s=;
	b=CMnCKv0gZGa7h4OSPlnQSW6h7FnNdqcBQ0uhp3q44WMHwKvAuLV17PSdXoyWNYsGQi9Vc3
	GRiILz9FH22KOJCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Message-ID: <20260608093758.0K8BkEnj@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
 <aiZUAdrwhFn63a2a@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZUAdrwhFn63a2a@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_023818_712174_92D96754 
X-CRM114-Status: GOOD (  12.26  )
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

On 2026-06-08 13:32:49 [+0800], Peng Fan wrote:
> > drivers/mailbox/imx-mailbox.c | 33 ++++++++++++++++++++++++++++++---
> > 1 file changed, 30 insertions(+), 3 deletions(-)
> >
> >diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> >index d1de07cc0ed62..006aa76b74b62 100644
> >--- a/drivers/mailbox/imx-mailbox.c
> >+++ b/drivers/mailbox/imx-mailbox.c
> >@@ -81,6 +81,7 @@ struct imx_mu_con_priv {
> > 	struct mbox_chan	*chan;
> > 	struct work_struct 	txdb_work;
> > 	bool			shutdown;
> >+	bool			pending;
> > };
> > 
> > struct imx_mu_priv {
> >@@ -539,11 +540,35 @@ static void imx_mu_txdb_work(struct work_struct *t)
> > 	mbox_chan_txdone(cp->chan, 0);
> > }
> > 
> >+static irqreturn_t imx_mu_isr_th(int irq, void *p)
> >+{
> >+	struct mbox_chan *chan = p;
> >+	struct imx_mu_priv *priv = to_imx_mu_priv(chan->mbox);
> >+	struct imx_mu_con_priv *cp = chan->con_priv;
> >+
> >+	if (!cp->pending)
> >+		return IRQ_NONE;
> 
> Is there a chance that cp->pending could be false here?

Maybe not. That handler is shared but the threaded handler is only woken
up if pending is set to true. So it should not observe it set to false.
You want me to get remove it?

> Regards
> Peng

Sebastian

