Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C368CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+s8Holh3q/9jzVDb4hC8kDK6pYQ+A1ql6aTpYhtYaw=; b=1FAEQxF1Q5kG2Ju+Py15Ab7QnN
	Dc5MjqttJMBtYqKtzHzE/tv5EDfZ8tTOjhfYFGXMb+5erkEjNlV8oFtI2A1dr4pDR459J294X8z8b
	dzsyqO6s6rLlwIH797RRpkle6Vac9wq/BZaX7l3oS6zqYf8rkV4E993VkbbsajJ5ulf9rzseffPIu
	vs/4UGKtNUcxhsV37ijHommd6Ydjz+GHk37uI/Qg1flJ/FhVTcuz4lwhNeaaiZvLvwqBAmHJbjcYr
	TVkeJYysWZtNd31Aklahe4KFqX27dc/ta/kRCDGtyoOZPIW1S+97M4mU9SNn1WBWyv6lpE+wnD1B8
	aKBi8Xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWSF-00000003CVi-1M4C;
	Mon, 08 Jun 2026 09:39:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWSD-00000003CV3-2YkK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 09:39:34 +0000
Date: Mon, 8 Jun 2026 11:39:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780911571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V+s8Holh3q/9jzVDb4hC8kDK6pYQ+A1ql6aTpYhtYaw=;
	b=PZOHHIOz2oTGf6wxfmBlJ+l2gG+CrHrdhpE1fLgbnWeHU3+GZB6FqhsojxhiC2vE7LEguj
	LKetQlqV/DGIaafQTkbjhU1vFN/5YmaBc7o/7yUNoPJxVo+OSQnQoPGJPHpHOeRoqgLB2j
	Lym4OcTHkBtdCj+VNP4ZFpcBvHdQZ7YmLPWxZ6Ii5w2QKEB17j+Wmo1SNTEBKEMj6gtZ6P
	WolE0RuLiDZTF2gYFDImDvniotGa56fz5bCLAV/67LpdcmeQ5ITi6jfSau3XdoO8YS3yaf
	I6uVMaOODKr6YqoT88YESwwWNz1XHbaQpYGOVHCGB5tuBGoNpXxzkr/VtHDb7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780911571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V+s8Holh3q/9jzVDb4hC8kDK6pYQ+A1ql6aTpYhtYaw=;
	b=YvkuTnn8uebWuLKJnMegLWKeTlmmFk+STOHYamb75Oip9T/oPsdXC6QTz7BD/5IEYBvJZ4
	dNqZ17XyJxFB4fAA==
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
Subject: Re: [PATCH v2 4/9] mailbox: imx: Use channel index instead of zero
 in imx_mu_specific_rx()
Message-ID: <20260608093929.k43eIA6-@linutronix.de>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-4-a0059dc3b69a@linutronix.de>
 <aiZO9rf4K9Ixzw0Q@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiZO9rf4K9Ixzw0Q@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_023933_793417_48458E93 
X-CRM114-Status: UNSURE (   8.32  )
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

On 2026-06-08 13:11:18 [+0800], Peng Fan wrote:
> >diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
> >index 1dda1437b87f6..d1de07cc0ed62 100644
> >--- a/drivers/mailbox/imx-mailbox.c
> >+++ b/drivers/mailbox/imx-mailbox.c
> >@@ -407,7 +407,7 @@ static int imx_mu_specific_rx(struct imx_mu_priv *priv, struct imx_mu_con_priv *
> > 		*data++ = imx_mu_read(priv, priv->dcfg->xRR + (i % num_rr) * 4);
> > 	}
> > 
> >-	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, 0));
> >+	imx_mu_xcr_set_act(priv, cp, IMX_MU_RCR, IMX_MU_xCR_RIEn(priv->dcfg->type, cp->idx));
> > 	mbox_chan_received_data(cp->chan, (void *)priv->msg);
> 
> For specific rx channel, whether it is i.MX8 SCU or i.MX ELE, actually there is
> only 1 channel as of now, but it seems better to use cp->idx in case more
> channels in future.

Thank you for clarifying.

Sebastian

