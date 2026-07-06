Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3FBC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bOyRrRg5NIlkC5Gzfb0zGlziitAdyLpprj4mRwqvjg=; b=hAMgwmNnJxGLvSY7kANf/dyoUm
	FoJEVnmKR43AOTjpNnAY+z/fQvWcsNOlU/8XnrnPiVWmaXn+QUibmwlAvoRzC+akFoFCD81tKOfuo
	J81Gv0rnLGyd0M6rAK56s50dicZSJGWUvxpHN4egR5GQ6oatCZQGpfcGATGNW/xPfQhT+6azszlK1
	bNEkIo/iW9TJRkRlOq3bnVk2VU8bAeEqePFpDzF+UereGKtkiuXeF5VIHIkkHpsmjzyPM13NrJdsP
	j++cdu5zjF0hxWdNHSawbkaxrf1N2gAmGLyAYFHUrYz6SQ2nvhibYrXPfxQEVQ05VUHf6/DWjVwxl
	v9PDcz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckq-0000000BbvO-2aqL;
	Mon, 06 Jul 2026 06:24:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgckl-0000000BbpE-3Vts
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 06:24:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBE72C8EC62;
	Mon,  6 Jul 2026 06:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 03266601A2;
	Mon,  6 Jul 2026 06:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3BA311BB9890;
	Mon,  6 Jul 2026 08:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783319065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3bOyRrRg5NIlkC5Gzfb0zGlziitAdyLpprj4mRwqvjg=;
	b=pvRygfjRsbhnPbjgQMAL1BobYAHz2+arIhrGO1DgS3B3ozPBukv2jm5F0UBoWWrLuomOnC
	dcJriaqYD0ry2xhp0blTjPRbJ4eq5Cfm+3Tmi75PtDbolpHDg6lo7JeMrB+N7sGq7BGpth
	11o4FJUofilF5j2cKg1pCSpyZfRulA1aYXJV8JQz6UMqKfr3QtuhKmdl+mum6ZzHas0QqS
	qAvP9uOOkULVL6Omn5PQ4pYDHtUOTKRnbuWaV55npFKCx4U3whfZDPfHxGpzc5TLCfvvtz
	DTFyks8KuZPEP2gmCFi/uOEjD/b9BXjyRlkST4lCnT0mAfEoBhIdALDheRntUA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vladimir Zapolskiy <vz@kernel.org>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260703073943.43373-1-pengpeng@iscas.ac.cn>
References: <20260703073943.43373-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2] mtd: rawnand: lpc32xx_slc: fail DMA transfer on
 completion timeout
Message-Id: <178331906452.868671.4337256162199028270.b4-ty@bootlin.com>
Date: Mon, 06 Jul 2026 08:24:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_232428_056840_6B101250 
X-CRM114-Status: UNSURE (   6.71  )
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

On Fri, 03 Jul 2026 15:39:43 +0800, Pengpeng Hou wrote:
> lpc32xx_xmit_dma() waits for the DMA completion callback but ignores
> wait_for_completion_timeout(). A timed out DMA transfer is therefore
> unmapped and reported as successful to the NAND read/write path.
> 
> Return -ETIMEDOUT when the completion wait expires. Terminate the DMA
> channel before unmapping the scatterlist so the timed out transfer cannot
> continue to access the buffer after the error is returned.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: lpc32xx_slc: fail DMA transfer on completion timeout
      commit: 17a8ce84964f243c8f89dc7353ac7e8d3137bc74

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


