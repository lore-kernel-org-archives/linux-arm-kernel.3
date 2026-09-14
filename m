Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD2AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PF9u7DYv9qFIslukP9LwzISVHtIb3gYuRnqxZlxFypM=; b=Neh/NgJTzieUsU7jd1XYFgqmPO
	QW6Z65Sf/497WEFesCRrgBMlhLzsFiIEAmCRFf0iQLXjDuE1vFTYXsSmlNO2U0S+/X9HhGG6pUqqW
	AnmpAWD5C5p5vPLwV1rHIK5hLC+NYzH7u+gqHgso36k49EP8EVhgkYzCbG/+Gwcat7gTtmpfi/vw5
	Fy6C9TVJ2eWLm8Gel4UT+CrTU+Uvs+CAV+Iob+/aKavKuhAVHy2EcZ927UMeuJ0LPELnyFbnPgIfF
	+FhO0zq9acUpiufGuF2z+yAtsAXAsi2BLvZxQhSTq7uSJvVs/1ivz7rvLWf8FpRb4Ud6OXW0tJ3jp
	I8BwT57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66Wh-00000003iYp-2ZOG;
	Mon, 14 Sep 2026 13:15:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66We-00000003iWT-16wv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:15:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0C051A0635;
	Mon, 14 Sep 2026 13:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9AC9960323;
	Mon, 14 Sep 2026 13:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C548511C7AFC3;
	Mon, 14 Sep 2026 15:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789391704; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PF9u7DYv9qFIslukP9LwzISVHtIb3gYuRnqxZlxFypM=;
	b=SxKPjlumrmLPx8G3OPdJHMCjg0uhorZ9JkemWkvjRbh/+4NYUgGLeeGxaJXWTAgXjj381l
	wN98FXQvXyHgS7I7CXFu4LgpgQBVEJ0ksOP37XPWW+oSLq4bP1+qGzbM1kAnIiY5cvjoy/
	4Psslo9bZ/mXq6obNaRJfY3P/dV6SuZmcRHDMcCaKajDrJR7gqLOpYFK5ifAg9dNSgGusi
	E8BAgOXPKZjkdkyTFgyZQ6745i8p5rXVMscORBPbJEQlatC9lO3IJsKryQ87Lv/VPNBOrQ
	svYncYsx6cis7MVfbq/gwgmw83VWLwBsbIlA5Jb8Vdv5IJKAD/YmVbqnn54eAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Brian Masney
 <bmasney@redhat.com>,  Richard Cochran <richardcochran@gmail.com>,  Arnd
 Bergmann <arnd@arndb.de>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
In-Reply-To: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
	(Miquel Raynal's message of "Thu, 13 Aug 2026 09:28:10 +0200")
References: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 15:14:59 +0200
Message-ID: <87o6e0nfe4.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061512_448416_D5DECA8A 
X-CRM114-Status: UNSURE (   7.69  )
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

Hello,

On 13/08/2026 at 09:28:10 +02, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

> The MA35D1 clock provider registers its muxes with parent data
> structures filling .fw_name. This is not the ideal approach since that
> would require a massive amount of internal clock names declaration in
> the DT. Since the DT does not play the game of exposing all these names,
> none of the parent lookups performed when instantiating the muxes
> succeed. As a result, these muxes get registered as root clocks, leading
> to a sadly flat clock tree and no frequency assigned to most of the
> peripheral clocks:

Jacky, this is an actual fix which is a month old now, the SPI
controller (and maybe other blocks as well) does not work without this
patch. Would you mind giving this a bit of feedback?

> Fixes: f50a000b4219 ("clk: nuvoton: Use clk_parent_data instead of string=
 for parent clock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l

