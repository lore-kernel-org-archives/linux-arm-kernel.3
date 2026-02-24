Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBCEF55433
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 23:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UhM0yF5lkK84z6Wr8XB8PLQv+lPeY1Dqq97PAdvGaqc=; b=j2w2yxLvVLfEjTVOnscqVwjANb
	svd45WoluJ49m/vaIujAg830aV0VS7EIUb/SbudOnGY8F+r92ml9OrvqkAGjIJhOm5n72KQ3SSNDG
	2jt+WxmnVBR0V5Z1KagidrwDrqBWbcA63wg52oFAKrGj1O4bWN6UHj+TlrhdRvbMGv2zT3YbnZRB3
	p3lm2LSM/aM8X+Byn6X/dH5eKauXhrdLvD0bFjZCFKog8De/acuOsjyD5O7SZZ5eUAO8uOq+wC1sg
	QGGDYNZckHoY21Zt8KIgAm2xlzz8xPgutPRNhgLRsYRqRuP9TnH020Gn3AbWZsxZDIuly5n/aTfOr
	+xgljtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2A8-00000002wwb-3vPC;
	Tue, 24 Feb 2026 23:49:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv2A8-00000002wvt-0AJc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 23:49:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E82E160053;
	Tue, 24 Feb 2026 23:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2971C19423;
	Tue, 24 Feb 2026 23:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771976994;
	bh=FGGuPZNGyCWAYKXaCUE/N/nQdSlJWii9ITxMe7XO4K4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s0VwyV2gikBEjsLGksFogTimmM6tUxJmCJMjz3BXyWAcLfWNKev76S0hhr4HntBOK
	 mX8Vq73pjD34HKyrIPQd1nnHXvyHhnqXr/Y2XBY8bujPLUDGTbFMDs+isKuZt8gcVj
	 aJ8er/Gsjdxw1tTR7wYjiQ8EbL7UfN2NK4NWdf5Y95Aay7FGG2HohS/XksIzdv3Ddv
	 t/E3sD1bqOqc7ZMVMJQbfGLN6CvDUfGqZKHtmvzHjf93LPE9fML5wgCb8KEaAy5WjS
	 jdbnMfNo4rUfT1jeaKk2iH5vDwWrwv3Isya7WJjq4r6uo9m9TE9UtaByMnkzNswxLe
	 Qope5ARpakCKQ==
Date: Tue, 24 Feb 2026 15:49:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
 <horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
 <vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
 <vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
 <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>
Subject: Re: [PATCH net 2/3] net: ethernet: ti: icssg_common: set
 irq_disabled after disabling TX IRQ
Message-ID: <20260224154953.63b558c1@kernel.org>
In-Reply-To: <57e05b57556e94ed666acd8b4c542efc28e7408b.camel@ti.com>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
	<20260220041431.372610-3-s-vadapalli@ti.com>
	<20260223184840.06069afa@kernel.org>
	<57e05b57556e94ed666acd8b4c542efc28e7408b.camel@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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

On Tue, 24 Feb 2026 17:54:18 +0530 Siddharth Vadapalli wrote:
> 			CPU0					=09
> 				CPU1
> 		----------------
> 								--------------
> 1.	TX HARD IRQ Handler entered				NAPI TX
> Handler is running
> 2.	irq_disabled is
> set							Sees irq_disabled being set
> 3.	Starts executing disable_irq_nosync()		Invokes
> enable_irq() for TX IRQ before its really disabled

Could you resend your last email fixing the line wrap issue? It's very
hard to read as it arrived on the list.

=46rom what I gather you're concerned about the case when hard IRQ and
NAPI run in parallel. But I don't see how that could ever happen for
Tx (there are some complexities like netpoll and busy poll but those
will return false from napi_complete_done()).

