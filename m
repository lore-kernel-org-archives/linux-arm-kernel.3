Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A256CA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfBjyfo26o556nYIaOxd76pUYR9GB6/0sA+87NT+4x8=; b=imq3Y+wTS4AUvTXfPjPnjeXqv1
	sXgPrR891stS4DxfC/qNzcJ/dekMYB3XfwKTVKD/D8xfSh/b3wvOddHEVYWK9fS6K1goH8zWXPG6s
	rpIYlEP+rkwBO7dFaIBunEqUdfdgkl3zWeTRGRKiTpa2RMt4XtQQNN94wEe0HsjbbmVhOo93pdvm/
	+G0UmYUgJpOQHaAhm0Iwj6iIlrJopvx/wD9I4sSHnQ9ApjokbpDLbVPqovxg5Jw86v/pZpn6ad9By
	XELCnm8Ik7U7TvO2cOoA9DI5b+CiHW8AxcbpHy0qnywuQ6L77Rtm5JFXjpc7TjEZmjWcwVvcNr5I/
	g1x0g6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut5rP-0000000CuwE-46xO;
	Mon, 01 Sep 2025 14:50:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3c1-0000000CQLL-0fOS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:26:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01BE51A0A08;
	Mon,  1 Sep 2025 12:26:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD7A060699;
	Mon,  1 Sep 2025 12:26:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63DFD1C22D4DC;
	Mon,  1 Sep 2025 14:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756729575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jfBjyfo26o556nYIaOxd76pUYR9GB6/0sA+87NT+4x8=;
	b=rt1Rbw3zcTPUue49SXLIRf8FXerPpqAtXDyHoC58kowt+IPGCOJ+OZT6GwaYpKB3VcBESO
	O7+GzFBF5/XLeDvNylSecqCeOT2ErTYO1HIDMfZ80tL6fVmgg8PGhcJfFpRY/lRZjO9Fa8
	DpPv1GehPdVDoKFYXNMOzrofvqyv3wAbAQirDvZJSfh7GJBYCqsF/7cH7AGO8eCOETDQn3
	YIK0YzbPnLqb5cMv328PCfDFiQXQXpIHX6pnkSqekDVkaQLa/Zlqi2YesVNDWuXNC24tiN
	xd4ELJxe3crX/UqryFGTPxfN2WeZ6tLSaEUs8wrhWR7qXrILNpykFWmVQ5SaTQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Christophe Kerello <christophe.kerello@st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250812-fix-dma-overlapping-v1-1-c3bf81d79de7@foss.st.com>
References: <20250812-fix-dma-overlapping-v1-1-c3bf81d79de7@foss.st.com>
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: avoid overlapping mappings
 on ECC buffer
Message-Id: <175672956825.48300.17672070424508952641.b4-ty@bootlin.com>
Date: Mon, 01 Sep 2025 14:26:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_052617_339747_F8056C2E 
X-CRM114-Status: UNSURE (   6.37  )
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

On Tue, 12 Aug 2025 09:26:58 +0200, Christophe Kerello wrote:
> Avoid below overlapping mappings by using a contiguous
> non-cacheable buffer.
> 
> [    4.077708] DMA-API: stm32_fmc2_nfc 48810000.nand-controller: cacheline tracking EEXIST,
> overlapping mappings aren't supported
> [    4.089103] WARNING: CPU: 1 PID: 44 at kernel/dma/debug.c:568 add_dma_entry+0x23c/0x300
> [    4.097071] Modules linked in:
> [    4.100101] CPU: 1 PID: 44 Comm: kworker/u4:2 Not tainted 6.1.82 #1
> [    4.106346] Hardware name: STMicroelectronics STM32MP257F VALID1 SNOR / MB1704 (LPDDR4 Power discrete) + MB1703 + MB1708 (SNOR MB1730) (DT)
> [    4.118824] Workqueue: events_unbound deferred_probe_work_func
> [    4.124674] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.131624] pc : add_dma_entry+0x23c/0x300
> [    4.135658] lr : add_dma_entry+0x23c/0x300
> [    4.139792] sp : ffff800009dbb490
> [    4.143016] x29: ffff800009dbb4a0 x28: 0000000004008022 x27: ffff8000098a6000
> [    4.150174] x26: 0000000000000000 x25: ffff8000099e7000 x24: ffff8000099e7de8
> [    4.157231] x23: 00000000ffffffff x22: 0000000000000000 x21: ffff8000098a6a20
> [    4.164388] x20: ffff000080964180 x19: ffff800009819ba0 x18: 0000000000000006
> [    4.171545] x17: 6361727420656e69 x16: 6c6568636163203a x15: 72656c6c6f72746e
> [    4.178602] x14: 6f632d646e616e2e x13: ffff800009832f58 x12: 00000000000004ec
> [    4.185759] x11: 00000000000001a4 x10: ffff80000988af58 x9 : ffff800009832f58
> [    4.192916] x8 : 00000000ffffefff x7 : ffff80000988af58 x6 : 80000000fffff000
> [    4.199972] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 0000000000000000
> [    4.207128] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000812d2c40
> [    4.214185] Call trace:
> [    4.216605]  add_dma_entry+0x23c/0x300
> [    4.220338]  debug_dma_map_sg+0x198/0x350
> [    4.224373]  __dma_map_sg_attrs+0xa0/0x110
> [    4.228411]  dma_map_sg_attrs+0x10/0x2c
> [    4.232247]  stm32_fmc2_nfc_xfer.isra.0+0x1c8/0x3fc
> [    4.237088]  stm32_fmc2_nfc_seq_read_page+0xc8/0x174
> [    4.242127]  nand_read_oob+0x1d4/0x8e0
> [    4.245861]  mtd_read_oob_std+0x58/0x84
> [    4.249596]  mtd_read_oob+0x90/0x150
> [    4.253231]  mtd_read+0x68/0xac
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: rawnand: stm32_fmc2: avoid overlapping mappings on ECC buffer
      commit: 513c40e59d5a414ab763a9c84797534b5e8c208d

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


