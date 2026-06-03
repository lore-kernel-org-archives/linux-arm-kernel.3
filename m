Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D516CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=64ct7Kd+yKxlS9V8CwC0aSCLMmSvEB4LS5D/r91q8JY=; b=0BvRMzxQhEu8glqfFu6IhcUK4G
	3a4zBa7u17xGOW9YGmefgLn4szhf6HLAO4qf6EcU2bl/pr4WE4ARZTBKbgF3RPTsapqVxv/xR1PZT
	noJyacISDBscgd4XXcsEizQjW5+RimksaAkHRp1+0U0n4R6gVmua6GWl10PGub8O4kL4ENTwPchgR
	bO7r8X2lMhjNTUYd939I9Gn/VGACJZf6LHHif4DB7WyO6xuMtjRWuT+Xvgt+2clsZ4m1fHwYom4HY
	8hY+PoAX/iMQkHDjFDwLS6mMvNSiiHCBVY6YhbNYuAg0EWdAoAVmlrZp+TGHgEfloDSJn3MXuQTUW
	KhBEUVNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlWU-0000000FAIM-0tux;
	Wed, 03 Jun 2026 13:20:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlWR-0000000FAHX-0nfu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 13:20:41 +0000
Date: Wed, 3 Jun 2026 15:20:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780492836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=64ct7Kd+yKxlS9V8CwC0aSCLMmSvEB4LS5D/r91q8JY=;
	b=jSN6T8gPT2w3DLFI3CwrUaQ7Daf6BrZSGQsHzMRW1es3bXugS1XcBt8F/mUGLh5Cb1Dtoz
	p5VuCf9XpkGoXASyXhIdh+/oCRpngggfosroE6e3ZgTJLl9RluzX8ai2v0L2nGDS/r+g5o
	7Uef7pHjpZZxFmZGbDKbihXDcmV2403HFEARtLi6/FYSGnSbcip91odXyx7mtuO165utsg
	xOFPm7Lh4pRaU9ac91YnfQrjMjq0PkJkMSFcxyEc52Qepk7b2HV6eZZdzvzEZpHuHGfzHC
	PKYdqZdTI1hAIHj8Y4xzmceE7TUO/b7XwCKd/6dczf+EjDRiBvezgHtac+4iMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780492836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=64ct7Kd+yKxlS9V8CwC0aSCLMmSvEB4LS5D/r91q8JY=;
	b=UP/Js1ozjTwwW13wk3m9RpZXA0bC4wMD3AdiEEc6Rw9BPBc1ktYeCPK8qHXJQ/JoeeEByZ
	X1w4H88/SgcCx0AA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
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
Subject: Re: [PATCH v2 6/9] mailbox: imx: Move the RX part of the mailbox
 into the threaded handler
Message-ID: <20260603132034.NxZoA4pH@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-6-a0059dc3b69a@linutronix.de>
 <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c81d12a8-7544-493f-a947-8f70ad9d409d@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_062040_087164_04CB66EC 
X-CRM114-Status: GOOD (  16.08  )
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

On 2026-06-03 16:18:22 [+0300], Daniel Baluta wrote:
> On 6/3/26 16:05, Sebastian Andrzej Siewior wrote:
> > Move RX callback handling into the threaded handler. This is similar to
> > the TX side except that we explicitly mask the source interrupt in the
> > primary handler and unmask it in the threaded handler again after
> > success. This was done automatically in the TX part.
> > 
> > The masking/ unmasking can be removed from imx_mu_specific_rx() since it
> > already happens in the primary/ threaded handler before invoking the
> > channel specific callback.
> > 
> > Move RX channel handling into threaded handler.
> 
> Hi Sebastian,
> 
> It is not very clear from me from the commit message why this change is needed.
> Can you please update the commit message with proper explanation?

The intention is to move the entire interrupt handling into the threaded
handler. The primary handler masks just event, the threaded handler
performs the RX/TX/ event.
I move the individual events step by step so the previous patch moved
the TX, here is RX and the next one does RXDB.

Is this clear now? The cover later explains why this done in the first
place.

Sebastian

