Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FCDC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ug4T2uoLqHNHdXUQQzhAnOc8fa3my8JhfBBgqQcfeKw=; b=YSTHa4GXUox7TKpXiq8U8YlVar
	Do85P/v3NVWFg+NbkFzuxCaCIr1kkKr+safg3tqvjYgBO7r+lFNRJN6+qTNqWZveS5zaaP9cMZzNi
	Km8g/g07HBNUt1aFgR3Ag7UgXr/bfYhUAVGP2hE0JFR9pnQ/7lSFXibfzoFt2/10kL6SI7hCAl0By
	crftlzcFa4ApkUf2k0YbVBXD17PSNhptFURKt7yk2s4jKGMnUTsm3uq0tVGBnS3eFvcG9dinunHXU
	qsvL37WTygkCK0LqSHg8vfeU6EPyix+N5emjT53J8nLWbMpFde13S3H1rnejbeAudc0rQJX69VFeF
	cNqq03vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQCg-0000000AxTb-2HXP;
	Wed, 22 Jul 2026 06:13:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQCd-0000000AxT9-1iUm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 06:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784700789;
	bh=Ug4T2uoLqHNHdXUQQzhAnOc8fa3my8JhfBBgqQcfeKw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gqxYy5kDnmCPIsNsjxIuVC58gepqjtBpUsZ5sEUP2pRwXreMJeMP/eHfwjD9Qe2wD
	 Gc4xCdDnheBh3T34CZxkyBA5OZbc89RrYALc8P2JBKDOkICQbcylsUnHb86a6aIL5x
	 MGaAk7Jm4eeaQEafALhnh1cCSTFuBbDl3pTcp0O+5TvmDRnKcb5lgWq9Lo+2yJqdF3
	 q64EdjWmaZqXGj8ZnIYInpBqMqAovAew0aE2teTw8D5XJCdXvaY0srzLY0p1tHPBJb
	 uXvx1hChv3KnoL10l7L4R/B3hnz//9yGR85x3jIydXhIIgKoKivna+aSctOynS80kw
	 50Hm87myUVTnA==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id CB2FD65B37;
	Wed, 22 Jul 2026 14:13:07 +0800 (AWST)
Message-ID: <92837fb6c6dc9d25de5cb91d338cb8de9544c0ce.camel@codeconstruct.com.au>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Karl Mehltretter <kmehltretter@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>,  Michael Turquette <mturquette@baylibre.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 22 Jul 2026 15:43:07 +0930
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_231311_706782_FDFE8058 
X-CRM114-Status: GOOD (  10.51  )
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

On Sun, 2026-07-12 at 18:03 +0200, Karl Mehltretter wrote:
> The AST2700 clock driver also exposes the SoC reset controller: it hands
> its register base to a reset auxiliary device via
> devm_auxiliary_device_create(), which the separate ASPEED reset driver
> (RESET_ASPEED) then binds to. That create call needs the auxiliary bus
> core (AUXILIARY_BUS), not the reset driver itself, but COMMON_CLK_AST2700
> does not select AUXILIARY_BUS.
>=20
> It builds today only because RESET_ASPEED selects AUXILIARY_BUS and is
> normally enabled alongside the clock driver. On a randconfig with
> COMMON_CLK_AST2700=3Dy and RESET_ASPEED=3Dn, nothing pulls the auxiliary =
bus
> in and the kernel fails to link:
>=20
> =C2=A0 ld: drivers/clk/aspeed/clk-ast2700.o: in function `ast2700_soc_clk=
_probe':
> =C2=A0 clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxil=
iary_device_create'
>=20
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.
>=20
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

