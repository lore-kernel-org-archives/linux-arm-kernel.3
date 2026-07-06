Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0067C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQei6Rt5rAEMgiyIOtihLA9S2prQeFUyFlrKQtRHLZg=; b=Uqafm9jUZicCcZaDJAED/Zoz+R
	RcGUImz26TsPKHt4kEB4h5ZK+1uaL028elXxCZU2fD09sO8++dRr8aqx/XUrv8nWf30uktYtHp7ib
	2Ev8u5iBsdI7t+BxrIuluSWqZWXewHKEGrDz9H5fwLbNMWbwvg+JRnTgtO6tv54LX9feJ0SqtQW30
	SWT1dXBM0FIphCSaG88u3TBct/UGFwKPV7exwl9SC9xDpxx7m0IZm3rovs9w7bPm8PjkIDG+XGzj9
	IC3ewYkG7+tpgUHZbKZ1K+p9LQVtIpkOjtrqJ114oYqXHAqk3IApxtgpwvtd9PCpHPAV+r/Txvnz3
	tlHCYwSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckn-0000000BbrS-0CuL;
	Mon, 06 Jul 2026 06:24:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckk-0000000Bbo2-20hI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F30B04E40CA2;
	Mon,  6 Jul 2026 06:24:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C7E601A2;
	Mon,  6 Jul 2026 06:24:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F06411BB98B6;
	Mon,  6 Jul 2026 08:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319064; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HQei6Rt5rAEMgiyIOtihLA9S2prQeFUyFlrKQtRHLZg=;
	b=R/6JwtiE4Jj7hU39SNi7mGJGuIuBacFdPrO2BUFGV8homnrNckLDsYwNZZVT8QhKa9yMlf
	2XnrMc8Swt3bbv8aqp7NUXNhDVO2GApBVyrxwXCXD5E+oR3NufMihm86LjY7Je+1Gw8bJy
	ZeaL322QaedI+2S7SgMx5KALqGn3StOxCbw8syjye8AE468jTHUOm9h7YSVzpw8Kj07YIA
	qPeWXCu+m6mv7l4mKd41rEaWN5wKrXrZUEqhidDdIFzaG/Fw0F3EWS4MU5ChEUcJwnpgEe
	xk5cRyjba/JdFtea8rKid2RBTE7C3oVu/jTeRHdc2osmE3fWFWwgp6BWgNKtOw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@kernel.org>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260703073759.31388-1-pengpeng@iscas.ac.cn>
References: <20260703073759.31388-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_mlc: fail DMA transfers on
 timeout
Message-Id: <178331906145.868671.2640165529145419553.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232426_759742_BB5935C8 
X-CRM114-Status: UNSURE (   8.12  )
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

On Fri, 03 Jul 2026 15:37:59 +0800, Pengpeng Hou wrote:
> lpc32xx_xmit_dma() starts a DMA transfer and waits up to one second
> for its completion, but it ignores the wait result and returns success
> after unmapping the buffer.
> 
> A timed out read can therefore return success with incomplete data, and
> a timed out write can continue the NAND operation without proof that the
> DMA payload reached the controller.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: lpc32xx_mlc: fail DMA transfers on timeout
      commit: dbf590b662695b16fbf5917ef129697be4410ea9

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


