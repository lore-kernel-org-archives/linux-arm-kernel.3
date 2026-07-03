Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA8BC43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esFP34U5TYPLKe5S80BzE1rdYYJEPOvrVqywVP6uVMo=; b=PZruwQZV2wGUoJPvlDVyQST/Oa
	qebyXiNR+i2UP6U83CltMPw1XoAatREdvT1j5RFgKbbGU2ybxAtTfZ38jBlvAcuDKuREfZYXgDPPk
	+fwxR1ttPG+Cy/h6qZdZ6j9q09Bh7dQGO+Mr9rwjQKNQ/kt0UEbW0virz8wnV2duoZ2hp+P2Tqt/U
	fMepwPCmMdlsg+0WWv+L2i2h/n/krnRLOE77ix5nzsLkHk6t4FWOI/ZeNeCeZmnXVMN+I9ihQU6ez
	zZ4UfEd0W/1WOH0u8JvSslgb4+w/ZsxPAVIn1aEcOOowoeudMzx7q4IPovRhc6C3zl4Zp0C+4JNbq
	uIbYukfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGU-000000079fl-2xbK;
	Fri, 03 Jul 2026 13:49:10 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfeGQ-000000079c8-3mLC;
	Fri, 03 Jul 2026 13:49:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D516A1A0E1C;
	Fri,  3 Jul 2026 13:49:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1AB560300;
	Fri,  3 Jul 2026 13:49:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE763104C9464;
	Fri,  3 Jul 2026 15:48:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783086540; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=esFP34U5TYPLKe5S80BzE1rdYYJEPOvrVqywVP6uVMo=;
	b=0VsvUm0QepK4wxG9+feba0HqKQnh3G3RLlAhnvrHYPc6D9a6obqbt0JS9bYig86jajsk36
	0SJ1PK49NRjoy7ZjpcpReTwRVqhA2OlWOacIi3V36AGVtVDneQonsr9E2cfcGSbdSanR86
	E5v1GdD1H3i4J6nG1PFAI4BBGhpNiINr26XJ5SZ9koHbtL3Ed3y0aLuOWE3GMYLqgy/7gK
	u0KmNUbA3SpbhyItcqs+ssN318f4sNC1mWQfn0fyUjFor322RxxPRISRM/CrNxf2UoPkP8
	qp6IO1Nxc+m4D+BE9RHmZbTRR9Y0hf5wu6lScJZjcO5BNL3FaO0OjbHFtBtilQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260630012332.1471829-1-rosenp@gmail.com>
References: <20260630012332.1471829-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: use struct_size
Message-Id: <178308653758.836059.3322930880325591440.b4-ty@bootlin.com>
Date: Fri, 03 Jul 2026 15:48:57 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_064907_090018_F1423ECF 
X-CRM114-Status: UNSURE (   5.18  )
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

On Mon, 29 Jun 2026 18:23:32 -0700, Rosen Penev wrote:
> The comment above makes it clear that this is a single element for
> legacy handling. Clarify that with struct_size and avoid manual pointer
> math.
> 
> 

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: use struct_size
      commit: 591b5ac17301acfbc8204dfa377353f2b20efc5b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


