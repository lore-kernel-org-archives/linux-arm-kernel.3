Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BCCCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 05:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmvxFLI4fafNJPsciPGiO4KBdNeRmX5zokI6/2cCmOY=; b=yfju4M76ZYVLoetvscok+l3tyA
	LaHX1x3B0/smxwS7fiBPH+M2AxPRRmDWGJW2+gsHozytMWw5GysR0G+9tXRseW5jRcvcambsxk1Be
	YEx06c0uqLIcNGo+LM3WBWnK7FQyWuVEFCp+Zz7BFXDUhPfW16IokRXRKfnyrAEZOTvXEMZ65cI00
	MrlHfbkMuAvVVUQFvsrf0nc37GBbq6v16nTXF2UprAb/Dz2Yz7WHYFiWR6vdnnuxA5GKE5AKAYEv6
	L+Qsp4zPMVT2AUy2cVb4UZVUwCBAwIeMAyJuJyQdYRC2ZyJ6QrfPDfGXBvjRk63TmmGNk9s1mqjUq
	C8HooOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6S1-000000023L4-0QHP;
	Sun, 07 Jun 2026 05:53:37 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6Ry-000000023Kd-44Sj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 05:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kmvxFLI4fafNJPsciPGiO4KBdNeRmX5zokI6/2cCmOY=; b=YPQEdc9rBqciC+1C7hKnMmBDQz
	KxOaNDdNMerpsHZSL2S0x00aj9ZC0AUVFgo58E9nrV8tNXA2IP2+lHhmf018rWz6FaPzdMNrXe9f/
	gf4cPlJsWHt43XJaBPAAPhAk2dkYRnRUV8R+H0NrxZuzhyki55DKtk0SNDi3/oajeUVd7cSbu2f5n
	BxWxbMX6puE9GqskolaygZiEhUT45fNnSi4j53E9BEMsXysTELvCtu86/tqVFyO8trnjMbnU31DiN
	oPslOTDfXgwBVncvS5uImc1SeUFQEqtlDA0n8oz2hJhnLWsXdywkJbjm7Smih7YLdfdkQmfr0A1r9
	Pi9J6D6w==;
Date: Sun, 7 Jun 2026 07:52:25 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: OMAP2+: Fix OF node reference leaks in
 omap_hwmod
Message-ID: <20260607075225.7568cf53@kemnade.info>
In-Reply-To: <20260504164711.2854116-1-dbgh9129@gmail.com>
References: <20260504164711.2854116-1-dbgh9129@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_225335_037717_9005E05E 
X-CRM114-Status: GOOD (  10.88  )
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

On Mon,  4 May 2026 12:47:11 -0400
Yuho Choi <dbgh9129@gmail.com> wrote:

> The OF helpers that return device nodes acquire references that must be
> released by the caller.
> 
> _init() leaks the "ocp" bus node returned by of_find_node_by_name() on
> all paths after lookup, and also leaks the child returned by
> of_get_next_child() when parsing module flags. Route the post-lookup
> returns through a common cleanup path and release the child after use.
> 
> omap_hwmod_setup_earlycon_flags() leaks the /chosen node and the UART
> node resolved from stdout-path. Track them separately and drop both
> references after use.
> 
> Fixes: 1aa8f0cb19e5 ("ARM: OMAP2+: Remove unused legacy code for interconnects")
> Fixes: 4f2122473363 ("ARM: OMAP2+: Check also the first dts child for hwmod flags")
> Fixes: 8dd6666f4937 ("ARM: OMAP2+: omap_hwmod: Add support for earlycon")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>

