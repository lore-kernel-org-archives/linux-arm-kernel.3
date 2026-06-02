Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAE8CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJdp4XF3Fcb1uyz/I+762d0PZHcMV95pqLsyirgwV5U=; b=u3iDBJwwZnDgOcfQ39I03jNH6o
	voWEzi9681daF+WuqWFcnpLJeC79Z5teBn+zMwbJipi9TPFl+uOu8veCL3dwoi6EUFeyXcYk8aBy6
	IXA4hlD/0dHk+5BOQNlTZ7V81Y2asR0bGrtL29OtoMgHfwqRROKt2XXhS1liACElh+9SadNgaAOHk
	+yk0A7LIzNE0DwGU3ffH3jF3tRXzqaqhQ5Hr2ZEWkVbRrRxknwpXsQMeAnYzfCffss+AFiWSouGmL
	kDB092StZuqlSf2nfyUhy5qLDej9HzRrKLhOBsYcP6x+rmWZAVqapIGMkIqBmar21AaferodTCigf
	Qw//K+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSLQ-0000000DUo4-3UXr;
	Tue, 02 Jun 2026 16:52:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSLO-0000000DUnd-0g7O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 16:51:59 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so1593930b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780419117; x=1781023917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJdp4XF3Fcb1uyz/I+762d0PZHcMV95pqLsyirgwV5U=;
        b=dvuwu3JkNCbjd7EwZLF1rFniaoSHPZQ/GOkL/pgUm2SuxvxG6eFceeLs0zjPeCmBEs
         CwvT+dof09FgMiKxCZCIVmCCWB9wC6TFxDt4yFhI55SNukF1nLH0zS+8Ua0rTnht4JmT
         McChro8x19bDqcNWKe07TJjOLriEP/BxNQ/oKM/VCaNj9gpc6ZAOdFcU6pawf1r2jyUP
         m/XF8rHpWSMl6GktnYVEon/2HM+JqRnfmjlaxROprmhrjKDJzV685M5WDF5CU2Ehm4xG
         Ap6nBMkTXSVdHAJfoQsPJiUMaToy22hDjx54FGDvdiFSZNSk487NqYiatSmd2jFIs8y2
         5VFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780419117; x=1781023917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJdp4XF3Fcb1uyz/I+762d0PZHcMV95pqLsyirgwV5U=;
        b=mIlvt14gSIZrnvTMyRGpZgHCsVUyUrSas0AlM86dvzjZgI4Pyph3fUs2ujClG9EDHH
         /fpWTIDr52/AHZd5bFcfghxKPNAEciKc9Qrpbi0VkNV6aPBqJGfMsWAaI/Z8lAFuma+8
         1QlDRPM6AerUEw9IpjoaZv9IkkfLHNrFi0ZA9vfbt/ySNTAax9tyR2E/z4eqkiUrofOc
         F7a13fpf+RqiL7e0bRqitj066yv++UNPozaFgXMA0WrTxKGqFPfly8I4zpxWxAmX7Msd
         f7IUJj7G07V+JajB4X1fP7dzZ8ybi36SnypGLK0uTPna3Tu6sBwuuZujGfbjmXKhUfmx
         WtfA==
X-Forwarded-Encrypted: i=1; AFNElJ/wL9koB29XvW47EtHNZXhR+EqZfwy5mxy4Igry+DPbuPmfRk01+7ZyRb241rZD1HgZx9NGB+ci4A9cNj6+jbxB@lists.infradead.org
X-Gm-Message-State: AOJu0YwMBX0uPACbnEM2BjsEE8pR59pkMoC5/7h50cqzQVq4YU1JBqSf
	hcifaZkwTpyLkawHhTo13BkYHlnmCmLa57LHh7eodGqhjgQzqwuzOZsWCGWObvjogZA=
X-Gm-Gg: Acq92OGyYZghiEQVfbLWjAo1WGYJsabvJz/hy8sIyX4kBlnqifZ8Z5T2xgrnmTfX1ir
	oOyzir9PbfoAf/SUleTgK+eY+ovRoVRehhbGMORgdLovZiLgBXhZ5kZjBieRZvPZO2nHIRdV6f3
	mtbHc9YYEleXVODWoad8o4MoOWUehiS2/gYGfFDDEG51xzF3AX7hlk/5Rwl04wWdzVhO9UxRmjs
	vE4Ag3RduZoMSEfwz6765P2BCBvldPWtWKPIkfnkMrvXBg71q2NS7D/PwIkBK5k/lrfkuhML5pL
	ijYa85kwpLdqYGvfRKcLAa+FrWEop2YJcp/+m9droNvmTlSobkeXyUHA09WPg4inzFbhoHRL9EX
	VAkQWBRXQN3fRmTpD9O1ck89hJBrglT95ihhlbvWvdMxVyZJ6K44ZpqDOuCCc0ERWN5TLhKf5+k
	a11Orej43d56mO50GAZRV44WgDR0UuJgAh1MzCYPfYFzWO8sAw
X-Received: by 2002:a05:6a00:a112:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-8426a96af92mr4013059b3a.33.1780419116687;
        Tue, 02 Jun 2026 09:51:56 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:6f6a:5e58:19fa:e0f1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282372a16sm399509b3a.18.2026.06.02.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:51:56 -0700 (PDT)
Date: Tue, 2 Jun 2026 10:51:53 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-rt-devel@lists.linux.dev, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 0/5] mailbox: imx: Use threaded handler to avoid kworker
 in imx's remoteproc
Message-ID: <ah8KKVmE5qCGJ1cs@p14s>
References: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-imx_mbox_rproc-v1-0-b8ffc36e11e5@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_095158_209030_1EF9BC80 
X-CRM114-Status: GOOD (  23.11  )
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

On Fri, May 29, 2026 at 06:01:02PM +0200, Sebastian Andrzej Siewior wrote:
> The imx's remoteproc driver uses a kworker from its mailbox callback to
> complete the request. The reason is that the imx mailbox driver invokes
> the callback from its interrupt handler and the remoteproc callback (at
> least the rpmsg-tty) requires a preemptible context.
> 
> This works but is problematic in a PREEMPT_RT environment where the
> latency of the invocation is important. By scheduling a kworker the
> high task priority from the threaded handler is lost and the kworker
> competes for CPU ressources with every SCHED_OTHER task in the system.
> This can lead to long delays on a busy system with other RT threads
> which are less important than the completion of this request.
> 
> Looking over other mailbox driver, like the arm_mhu for instance, they
> use a threaded interrupt handler to invoke the callback. This avoids the
> kworker detour.
> 
> The here suggested change utilises a threaded interrupt to invoke the
> callback. The primary handler mask the interrupt source so that the
> handler can run without getting interrupted by the interrupt again.
> Doing so avoids marking the interrupt IRQF_ONESHOT so that that in a
> shared-interrupt environment the other interrupt can still fire while
> the first one is masked.
> 
> This change was tested on a im93 board with rpmsg-tty driver.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> Sebastian Andrzej Siewior (5):
>       mailbox: imx: Start splitting the IRQ handler in primary and threaded handler
>       mailbox: imx: Move the RX part of the mailbox into the threaded handler
>       mailbox: imx: Move the RXDB part of the mailbox into the threaded handler
>       mailbox: imx: Don't force-thread the primary handler
>       remoteproc: imx_rproc: Invoke the callback directly
> 
>  drivers/mailbox/imx-mailbox.c  | 65 +++++++++++++++++++++++++++++++++---------
>  drivers/remoteproc/imx_rproc.c | 33 +--------------------

For imx_rproc.c:

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

You may also want to fix driver/remoteproc/stm32_rproc.c

>  2 files changed, 53 insertions(+), 45 deletions(-)
> ---
> base-commit: 9e171fc1d7d7ab847a750c03571c87ac3c17bd84
> change-id: 20260529-imx_mbox_rproc-7d512f5a6f78
> 
> Best regards,
> -- 
> Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 

