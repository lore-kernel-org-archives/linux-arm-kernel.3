Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F9AC43327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjwNjSjuFLLd7thPba6eClgxi605CFu777BUSwQJIyA=; b=JvYxYkNp/t74k0yPQNQhX8vGhD
	zSGg3F8CtDXKHD2MpmfHbZCXrdqfwPOxjn9+CDzYcWTIG7Y58hQ9XD/g5jaOGWC4UGV1XK+gmriXJ
	wpxOMCGBx9HJAB/zD9zA01KlqjWQ8jj5QvcheZwIG8dKuRzj0BX3IUcsDiJFHaDj+uMBrqGRUIxuV
	9iY+R+wnjB+iJo34Faedb9V13Rk263yUODRU/rVuyTJXjg/925ARalPAdWr+2HEfxyjKy/WN0ce9q
	bmLWGj+uM+/sXCgKdCQF/UpY+jbgCVfgG2Bggvs3pc1rJeLNonRpA0wAHaMOzqt8kxYl1Xzef+s6p
	seGEepYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDRJ-0000000EyyJ-39l3;
	Mon, 29 Jun 2026 14:58:25 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weDRH-0000000EywK-48mJ;
	Mon, 29 Jun 2026 14:58:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2C7CD4E407AE;
	Mon, 29 Jun 2026 14:58:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCFCF5FF96;
	Mon, 29 Jun 2026 14:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEB6E106F18D9;
	Mon, 29 Jun 2026 16:58:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782745100; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zjwNjSjuFLLd7thPba6eClgxi605CFu777BUSwQJIyA=;
	b=nQWmNEnqZsEt+SWCq67S173r8urV87I8yJ6sFjkiqh9A0rFL8tngnwjg0ZtKvbmU8+1urF
	ZRDDYYDoezI19OnAjqMbB2qep7W4t3/3JPmMAclMKz6OBiGKMbstjzWHrbNYlXz6gXBElX
	WDHPyxMTls8PwGMPEixhHNY1dixbVYgVRH5ETvI53/+rBZuHiTsKz3O6ilAwLr7v8e37s6
	Yifg6P0kV7K4c3WvpFx/R9kx8FjjFpE/meUEa/sJJ3fEXAW3jT1zL9VlUnqmfxjUjM8MlC
	I1OhMYSrxvtibaSgCw8BYP55RnxoO7J+bI03v2vKhEC7iHPmQIfHegSP3nyKDQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260623135729.52304-1-pengpeng@iscas.ac.cn>
References: <20260623135729.52304-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: mtk-ecc: stop on ECC idle timeouts
Message-Id: <178274509552.278117.10618794784702603382.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:58:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_075824_157502_CF8212D5 
X-CRM114-Status: UNSURE (   6.26  )
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

On Tue, 23 Jun 2026 21:57:29 +0800, Pengpeng Hou wrote:
> mtk_ecc_wait_idle() logs when the encoder or decoder does not become
> idle, but returns void. Callers can therefore configure a non-idle ECC
> engine or read parity bytes after an unconfirmed encoder idle state.
> 
> Return the idle poll result and propagate it from the enable and encode
> paths that require the engine to be idle before continuing.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: nand: mtk-ecc: stop on ECC idle timeouts
      commit: 16f7ec8d5dc100eafd2c8e06cd30340a30b104a1

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


