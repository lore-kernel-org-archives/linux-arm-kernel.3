Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66FAFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=292LHZ8MuXkk+34QLG/rgUUkkjrV427rrbIkGjKOJ0s=; b=gJw7p6GkVG1+qmtf483CbHHJp1
	1QqtGR8gvUh2CTM5iQoiuUByso0/WYTkmq8gh4Zj6M1PuQCNza2UYjF0JCbsWKWSWQhw/bA2sum1d
	ZLsBdRIdQELvlZldauP4pRJoJc/UM24cmWa8YNeg7jkhrBrcjQLnmOJV874LRkkuou0PLkSfdwb46
	b6czbmYaAC9KNYPcnap5TO75XW/T/6w2RR3Q0ht5vWrV2g58kdjuKQwM1iIXYSP19XaDZ5H6w8A/4
	nIDAtMpIqbXe0tdtRlbHAgYrxRqW9zdSTzJMnmCBUtH1YWYQSsNTOYIDqjGcWtb64jPJMkWtRhMXK
	1tC/r5Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvsq-00000002rhl-2KpF;
	Wed, 29 Apr 2026 03:46:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvsk-00000002rgd-33KH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 72FEB42CC1;
	Wed, 29 Apr 2026 03:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48247C2BCB4;
	Wed, 29 Apr 2026 03:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434398;
	bh=292LHZ8MuXkk+34QLG/rgUUkkjrV427rrbIkGjKOJ0s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VGqveUjJ4TLUEg95Kz4wgGoJ/PjBa1tfbpS9VpaANuMw2QCYAMVgD7BCrU2zFuEfW
	 eSbOf/Q0IfzzL3olwacKPoYZx2uTaWT7xtOxqwPfKDVD0aEIo5E4GSBnLlyDIpcXJk
	 ssSdmyL3zBXueSzkP/3y/qxefXLkf+xiw3Y+MM+2JibWkGhWGHDFhQ2BaAZunYR0DM
	 C9O6I+wU+ZVCGrqbfPYG5yfvVEq7f0W4acBbW1LinuQOGTb1lnHX15FcAqHIdI3xL8
	 AZnqZBMLK7OCn4EB88kq+BO3wVPtjKbkQ+rmkIIcgk7gmvYI8Nv37gvg53oCUUXrH/
	 aaytrobb2U/XQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260403194701.11902-1-rosenp@gmail.com>
References: <20260403194701.11902-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] clk: mvebu: use kzalloc_flex
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Kees Cook <kees@kernel.org>, Gustavo A. R. Silva <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Date: Tue, 28 Apr 2026 18:42:53 -0700
Message-ID: <177742697342.5403.5001572934636787490@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204638_783203_57B1FC5A 
X-CRM114-Status: UNSURE (   6.57  )
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

Quoting Rosen Penev (2026-04-03 12:47:01)
> Use a flexible array member to combine kzalloc and kcalloc in one
> allocation so they can be freed together.
>=20
> Add __counted_by for extra runtime analysis. Move counting variable
> assignment right after allocation as done by kzalloc_flex with GCC >=3D
> 15.
>=20
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

Applied to clk-next

