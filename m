Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6537C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=; b=DHX2uUxrZgsqk1GB7/3dfrH1qk
	XqyrlvxaRELgjlj9cUur1jtU7nE2D/OtZNWOJhcGB3prpqGtbhGEXO0OY7jHLd4r6Up6SLvVvh1qa
	6oBoZlISINwpqr2QzSkiwevd0liaaoOrFla6cWr6jc2fQUU15PAwpNY7Oq7b49Gtu1IiJTCe034nh
	0SRbJ7gLbvgDgu90RLfN7hYWPL0xxfXWEvN7QQ/AsEsNaPA5KSkQTnh/VCpIt2yl54vHfya1MJBeg
	uAyPznSqO0inGlaIpf9f4FUKdLXgH+t8JlBT3nc4bOWYvoD7p9jiDcEQR3sBKlvtUdAvX1Dq4jUPl
	BGxR4FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9J-0000000Eu40-1mce;
	Mon, 29 Jun 2026 14:39:49 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9G-0000000Eu13-2aYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 14:39:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 02141C6B3B6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 14:39:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D86715FF96;
	Mon, 29 Jun 2026 14:39:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B956A106F189D;
	Mon, 29 Jun 2026 16:39:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743984; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TYFgpODSCVX2C5CNzgVOEDY1ictoCpmsvxoF8q8OHKo=;
	b=aCINo6MownjuVkcTFqrBr6oSrm3KiWHhDbzIYYJ/yhUTr3GRLSU5pNQBR3xUhiWKC5lRAl
	zKe52tasxQ7pMqqgMxsDYO05TRJUMwagkFZ0v4+NTv8gGVKvA8tznu1Tz4vfhKHeIDN4mM
	gZPg6uMlPb4kb+cl7JI6OMHegkXbnn/2CeKQ/sbXDd6lxM9jSSndONVpxCF+Kfg0Xqf6V9
	Xs4gZjXiYC4JxCCzTVMUlCo4GMmJhXiO/ppDooUwI08QuSvtKKYIPF0+zsv0nia5qnlpn/
	2p1CgPs/Unv4XUBFxkU06v+4IAyS3dmeAyjqRqzickQZpPppazvjaRub7+36EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
References: <20260615063232.44383-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: nand: ecc-mtk: handle ECC clock enable failures
Message-Id: <178274398069.256048.11835186154105614379.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_073946_830418_72B99596 
X-CRM114-Status: UNSURE (   8.87  )
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

On Mon, 15 Jun 2026 14:32:32 +0800, Pengpeng Hou wrote:
> mtk_ecc_get() gets a reference to the ECC platform device, obtains the
> provider state and then enables the ECC clock before initializing the
> hardware.
> 
> The clk_prepare_enable() return value is currently ignored.  If enabling
> the clock fails, the code still touches the ECC registers and returns a
> live ECC handle to the caller.  The provider device reference acquired
> by of_find_device_by_node() is also kept even though the handle setup
> failed.
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: nand: ecc-mtk: handle ECC clock enable failures
      commit: 82d9a2b45b170f0c52ac61e0e3e23f212cd065f0

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


