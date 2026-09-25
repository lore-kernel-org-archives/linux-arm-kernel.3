Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AF0C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EJjIk661tikGJLhJppgEVPju+d+qJSsQCa/QerB5sk=; b=HsWKQ6cOvM5bXSjgpBAjx5HO+T
	tFvLbs6ZGbWqG8a12pVmmPmdCP0W88HdgU8HH2Em+s2giGLofT8cLYczsqkhYDJngkSRSRS7mTTtA
	EtNlnMnELgIm9rEFAfAwA6qXGFeBl90Cp109N1EwpeN38yH/cNYvZKbgzCPs60oIn8Ehziv3ra2bW
	DrUE150E3kBEFWE6vVSgeuGIw9A10J2wVEm0LS4bGoLdWy+LuUygHMxfEs9Sq65UO+wST0whOH0kb
	dlxKszvUmDVd5IP4ICdBksTlxctQenKeGsFJ32CrTdlSVQw5/MlhOIWD3RGZaqQhPNVgBPkMKT4iR
	S8xjPufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65e-0000000DSD1-0VIc;
	Fri, 25 Sep 2026 13:35:50 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65b-0000000DSAy-2Hw4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1EB221A1012;
	Fri, 25 Sep 2026 13:35:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E01C66073B;
	Fri, 25 Sep 2026 13:35:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D415103293B8;
	Fri, 25 Sep 2026 15:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343345; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1EJjIk661tikGJLhJppgEVPju+d+qJSsQCa/QerB5sk=;
	b=ny6LvokOTTzcILNazPwpbeNmw2xP3dG5bx+iKYLFy2S7VHg45a7UFIz9Dw+0ynvgHvaQSv
	EcSH7rgGCkxFYFYtcMqKgl2M5NQ8qshp0fCBAq1sBEwe2gq8QSuaN3dledvxWODzIxhxRG
	g/z3Tf+04TlnRnFywsGIdwtqgCkcODQdqwC04wl41+hiRQxA6Cgp9zg4pKVbaUH+RQ3Q/u
	mWB4j5wJf+Ei/SFzqjzDhW64Zk8PkicUxEGGAcB1FeITUsAYWii4USRLp5LBzpmtLIT2Qn
	0r1gasqQGhMtLI+74vRVJPxUj0GonOA3+e+Du6ulL0UKPuY4nNGL4gYqvXM47g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Hui-Ping Chen <hpchen0nvt@gmail.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Guangshuo Li <lgs201920130244@gmail.com>
Cc: stable@vger.kernel.org
In-Reply-To: <20260915164537.2496540-1-lgs201920130244@gmail.com>
References: <20260915164537.2496540-1-lgs201920130244@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: nuvoton: fix clock cleanup on probe
 failure
Message-Id: <179034334209.1124555.2976716142691961983.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063547_726578_BE484BDE 
X-CRM114-Status: UNSURE (   7.85  )
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

On Wed, 16 Sep 2026 00:45:37 +0800, Guangshuo Li wrote:
> ma35_nand_probe() gets and enables the NAND clock with
> devm_clk_get_enabled(), but the ma35_nand_chips_init() failure path
> also calls clk_disable() before returning.
> 
> devm_clk_get_enabled() registers a managed cleanup that calls
> clk_disable_unprepare() on probe failure and driver removal. Calling
> clk_disable() explicitly first drops the clock enable count, so the
> managed cleanup attempts to disable the clock again and triggers the
> clock framework warning for an already disabled clock.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: nuvoton: fix clock cleanup on probe failure
      commit: 8a485a40f45a19c5fcafb5cbee7387c2762af7c4

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


