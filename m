Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636D6C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQZlysiv0d/2BjDEIe3tNwkeQrAxLfTelLLNUmuJ3W4=; b=OhzXWpXJehHse6QNgDvWcpj81B
	ManrbEaY8Inq2CqFWwWOX9OqZ3mRKqCHBDK2wGVOmdkjqjTlXgkELI9+Oy/wZYS21nsR9CCzguLCA
	9kWD8eLNox6Gfo2IZQJh4B7r5SSQa+wucnCsx1ba2Co5CvdosDiTGURd2p0fpHS6IXO/SHCWbHvaB
	nQHFxQTNOvgEOwHqPC0AoaWphtOLD5cBzoSVGvv5eiCnXgqMD0SSmIET6mZ3dk5RZV5vaPUDjsc3y
	SHunUxlVVLKDHSZBnQYh7HZtL6Slf0FqsauTJygZ/Rw/A4XZHqKi4bsp+RaP2LAWQA8uB68MGYsa0
	L1zuYn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65z-0000000DSTd-1Mpv;
	Fri, 25 Sep 2026 13:36:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65g-0000000DSET-47cC;
	Fri, 25 Sep 2026 13:35:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 42FA21A1012;
	Fri, 25 Sep 2026 13:35:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 152A26073B;
	Fri, 25 Sep 2026 13:35:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B70A810328856;
	Fri, 25 Sep 2026 15:35:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343349; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WQZlysiv0d/2BjDEIe3tNwkeQrAxLfTelLLNUmuJ3W4=;
	b=cw1Dm84viQYCZx6ABoHnHL1Qp9oQfr5rKvoMMxb+r9sNGxE7HwsyCXIsK14za/yYulyUev
	ykqBIkwzXO23hvV/2Xu1UPId8vjaogYuO6EQ36ik2HxCFInJV0o4nFTvnXHrc5rCViVfXf
	TLs8WZJd9Wnsy5Bwcsy/DxOky5ivu2e3jrStr2kp88CG2xnkPKpETPzc/JDAAz4Ea0lpd0
	0lOwcLXS8u61ce7L9z5E3hzS67PiK4q0wTDXsbm1j4fmR4A4l7pov7Pl9Xtqol+bQJCF2g
	SBYbwhpFZD3QCd1IU3JEDouubYPDDsJo4Haj1EZ5XvXvPQJONj/pjKNU5DhhYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: alexandre.belloni@bootlin.com, Wentao Liang <vulab@iscas.ac.cn>
Cc: bbrezillon@kernel.org, claudiu.beznea@tuxon.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com, richard@nod.at, 
 vigneshr@ti.com, stable@vger.kernel.org
In-Reply-To: <20260917102924.2146959-1-vulab@iscas.ac.cn>
References: <20260917102924.2146959-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix MCK clock leak in
 atmel_nand_controller_init()
Message-Id: <179034334517.1124555.16021884625975139988.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063553_184305_B8F072ED 
X-CRM114-Status: UNSURE (   8.29  )
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

On Thu, 17 Sep 2026 10:29:24 +0000, Wentao Liang wrote:
> atmel_nand_controller_init() takes a reference to the MCK clock with
> of_clk_get() and keeps it in nc->mck for the lifetime of the
> controller.  If the "atmel,smc" phandle is missing or the SMC regmap
> cannot be obtained afterwards, the error path jumps to out_release_dma
> which only releases the DMA channel, so the clock reference is leaked.
> The callers return the error directly and never run
> atmel_nand_controller_cleanup(), where the clock is normally put.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: Fix MCK clock leak in atmel_nand_controller_init()
      commit: 94edcda45d888c3bb1310de11e10e4537c166f00

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


