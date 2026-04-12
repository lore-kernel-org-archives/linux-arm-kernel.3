Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6BCF3ED4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 00:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOHsfV2KnFeUojq+ZG4SEwYslwEmc12aVkqhFKommzk=; b=sD7bnc2q3koSulIbDtv3tpWFzg
	CsGCdr3l8E7ww+ktv8dssRsWT1J9exb0kxTbTQaLZrOGxx/4TmZTK32ehwlJb71TdRkHuiYvsBa9P
	10zRrULCmtIydpPddwEQTZv5wp4S6XCO+vzK3msumD9hOOGu9d3kk+EAuvsUMZSbj2DYos2b5Jtpi
	6xtnj0rwapp6XcrUn/X1fwaUnFOKcgmQIrKfRn69OzlW9/1DywSIkDhrz7a4tIKluVQUv0OMAwJr4
	qv5LP1y5lIbjEkFYTmkgkFePW+AYThiNdu990hN3+EVbtx+Cm3kUT2rIWgfCOBOYZDNAbLDwNzN38
	Fv8Xjn+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBj6z-0000000DvqI-3v0O;
	Sun, 12 Apr 2026 00:55:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBj6y-0000000DvqA-0bxU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 00:55:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C55A60008;
	Sun, 12 Apr 2026 00:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6247C19425;
	Sun, 12 Apr 2026 00:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775955338;
	bh=lOHsfV2KnFeUojq+ZG4SEwYslwEmc12aVkqhFKommzk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oQZvEX8rNbiiNj5goAzRtrMw9yx2RVOdQGiXdTZcbosWjHRPfzX+X4XYCkrA05t78
	 VyxgBSviVKZSMrjYiDZFTMRen4HryKOW16/+WQV05sJ3jkq3lw1zbUj3UvCN3XarWP
	 audTqqW5XriRgwfYMCRukJxmNtH/6DFIxMgsi03EcDJvH2Vy6/k9dRx3q1PQlJbTWz
	 xgzn2dWrz0XUAzoc8MWVUwv5c5MKu2uI+o7ObYIEKUSNbN1nKcnj6HtXnqByFIBxL8
	 cc3LJv+ZMJHHC8uF9yA2VBMNBFxO8VvUI63hHOoCa2q4afYxH8RXwXRS9rtBAA6cQ0
	 vU7cL1HsRkMiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
References: <20260330-clk-visconti-init-v1-1-ac3e825e54b5@redhat.com>
Subject: Re: [PATCH] clk: visconti: pll: initialize clk_init_data to zero
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Rosen Penev <rosenp@gmail.com>
Date: Sat, 11 Apr 2026 17:55:36 -0700
Message-ID: <177595533685.5403.15903650774630512518@lazor>
User-Agent: alot/0.12
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

Quoting Brian Masney (2026-03-30 07:32:37)
> Sashiko reported the following:
>=20
> > The struct clk_init_data init is declared on the stack without being
> > fully zero-initialized. While fields like name, flags, parent_names,
> > num_parents, and ops are explicitly assigned, the parent_data and
> > parent_hws fields are left containing stack garbage.
>=20
> clk_core_populate_parent_map() currently prefers the parent names over
> the parent data and hws, so this isn't a problem at the moment. If that
> ordering ever changed in the future, then this could lead to some
> unexpected crashes. Let's just go ahead and make sure that the struct
> clk_init_data is initialized to zero as a good practice.
>=20
> Fixes: b4cbe606dc367 ("clk: visconti: Add support common clock driver and=
 reset driver")
> Link: https://sashiko.dev/#/patchset/20260326042317.122536-1-rosenp%40gma=
il.com
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

