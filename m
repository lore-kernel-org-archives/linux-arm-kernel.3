Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3CE0F532C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1bW9cPRGzLWRs+Kf4YrqsJ6ySDotQPKBNdvs3ENGLIw=; b=So4JAxs4rKVUMTwD760dr5Ze/j
	AT/CIMyiFjwK6EoH1lTvIdKSR3JAXfRUXYZwmLAsDgAiOMYx5asFr6gbtNOkiV83e7D8kFXIZlAe2
	x06E47a0F1G1tUxV/Z0qjnSeNwC7bxUMpXa3cCkiaYR1CE6C4JaWeZuPZG1WkT+MlHuS6PqlobmbJ
	bdKQC+yXuzRRzoIMyvKO5PJvH3Fv3CC5S0sSTsWToy2YsZ7RRqKTa5lVC1u0Mr6kjyqc/IzTyud19
	EAcFn50/B8PYnlRQy/u5ju5tFbse+xLeTsj9JIlC5ljCfLK41YTuSfFe7hxtWp2UNgXdzBvgYmxSL
	c9w1r/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pSh-00000000EM8-3aOa;
	Tue, 24 Mar 2026 00:17:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4pSh-00000000EM2-0JDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 00:17:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30C84600CB;
	Tue, 24 Mar 2026 00:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFD9C2BC9E;
	Tue, 24 Mar 2026 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311453;
	bh=VhVQB7c8G+UK8CTRphdG768deVynhbMmReZLxs81FRE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GbqupRz1lMXaRDl8yBT4oV6RTL82bksM1y0VVudER5K5CKlzM/kFhQx5E5B5qs/N5
	 NIERh4tAOsju0SI5byf2pOXqL62kF822F5Qtbg3w2wyb+bpev4y4npHlb28lKcRwIU
	 akbe6j0WuWCqLf65QQ8zXCrhbwkaUt29L17MUV7YYMPtiLI3N8nIz1RbongpwAT/pe
	 MGRG+f0MJe/tu1nztnG9/cV4wPRHQxHEQjNJ5EaiTeyvtyPPIq9H5palQxlPy6im7C
	 mj2DiYY8zuA5XTEM+CeYqPKpcZTS516yOAEbR4Ii7ht2T3QR69RPmBYyuhCEJCr8aT
	 gdS8l/ZqPJvTA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
References: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: fix __iomem casts in structure init
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>, andrew@lunn.c, gregory.clement@bootlin.co, linux-clk@vger.kernel.org, mturquette@baylibre.com, sebastian.hesselbarth@gmail.com
Date: Mon, 23 Mar 2026 17:17:24 -0700
Message-ID: <177431144473.5403.9307921610502647121@lazor>
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

Quoting Ben Dooks (2026-03-10 05:36:25)
> There are a number of casts to "void __iomem *" in the initialsation
> of the driver's clk information. Fix this by adding a helper macro
> for the cast.
>=20
> Silences a number of sparse warnings:
>=20
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] =
__iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] =
__iomem *reg1
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] =
__iomem *reg2
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:255:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    expected void [noderef] =
__iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    got void *
> ...
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next

