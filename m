Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDD9C5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U20/yY8yeUPz0vFOmPve6+pxju/thQDS8zZ9i8plDZI=; b=Bfad1GdtceQw+r92tqLxhvlnmT
	TD1qU08X7V3iE2RC5D8t3/dAZ6a5KbANHttCsBTg6VCrQE/YeKu5r3rI1GoRlIIaoUB38jNEe/EXh
	lvaM52NSbMxlYRaGvvw5q0MwAlySoe17xleZO2DiP0jgIgJFu4IhfrWhbRBRNHhBXO1T+GnGuKqt6
	dB/KDQ837LKO17TRa1MGxx8XInMq6sORiSn1yytqbjVHgrtYgyaHostb4+IqoRjQFn48AzAGs7bP/
	nEGpgRuktYKqpbW2jLXbuurcA6qeZmTZvB2v76YfG5tX6xSwxfcNDa3RGh6LTmO8ySXhHPnx8AYpo
	NGpkv4tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL4B-00000008CVa-2rXg;
	Fri, 07 Aug 2026 13:56:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsL48-00000008CTv-3b5u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:56:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3D3DB1A14AF;
	Fri,  7 Aug 2026 13:56:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10E1C603F0;
	Fri,  7 Aug 2026 13:56:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8BB511C37957;
	Fri,  7 Aug 2026 15:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U20/yY8yeUPz0vFOmPve6+pxju/thQDS8zZ9i8plDZI=;
	b=m4ld7mcJ/8EvQhONDlGD3pR38SbYmnCTvxubioEBqPAUzm7bhBULx9dbfKH4lL2azlkpou
	oG8OxnurCtS0pdyRJYK2yw1yUU0Z6gFVe82+ZaKQkF5VfoKtNQ3jNRpNH7PTZcAWowhun1
	Qddkl9fFmIuhmAaYFEOtMBOPxAddmV65ZOtMZkuYKagr4vtnNf7qkpK5+K8Su9p76WpiMp
	/Cz8hdkWoTSpxBhfavWt1Y7+J6TLrdXfiPfDk6XTbwPhU6C5tg/1oe6saZzyPqBSMEY+l4
	xtPM2vU5RZ5cX81gsTD5BmeZFQRcaddA/BPhMX6WNulAZF75ktOkA8SgTlsPBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-mtd@lists.infradead.org,  linux-sunxi@lists.linux.dev,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  Samuel Holland <samuel@sholland.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: sunxi: add H616 MBUS DMA support
In-Reply-To: <87tsp6avc2.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 07
	Aug 2026 15:55:41 +0200")
References: <20260717164202.3099982-1-james.hilliard1@gmail.com>
	<87tsp6avc2.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 07 Aug 2026 15:56:47 +0200
Message-ID: <87o6feava8.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_065653_033021_4701B8DD 
X-CRM114-Status: UNSURE (   5.10  )
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


> This patch does not apply (linux-mtd repository, nand/next branch). You
> need to rebase and send a new iteration.

Nevermind, I got it applied twice and the error was of course due to the
second try, my bad, no need to resend.

Miqu=C3=A8l

