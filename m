Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916A1C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 21:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUdUWZGtBD23U+ihPBC5BGmCbIJ5i9RGd9rC/GvA320=; b=cjZ7aX6StRhmEvOQmVOCAcEC33
	4OC3XAf+xsuIRZXNGsRE8a3tMP3ca5dIM1WPUTRppmWnWev0hYu6N02vAHNw8swT0ljqbtrTnJzu4
	3/QDZulzheM2sWEqiokK6V6coVGK4PYrecIpWsmmMgMaazy/otD9toz3udON6eTUL7NNz0djgGEiN
	XJQf6x5yfWQMJEg0BaR9wyhvEryTzFm6YR0JdkN65FppjwXV+q0zimnJomvOI/FXEI2MIn3TTexBa
	YaUr0YT9WSOUF9LwuLHN9R2Grod3dyO/KFzc9/byA7Q8OdnaemR+LlJ+8/Cz0hadMf5uS9FRma+fD
	0vNboWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT6DB-00000000KAZ-2dyN;
	Sat, 21 Jun 2025 21:57:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT68r-00000000JzS-0vnV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 21:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4699CA4A15E;
	Sat, 21 Jun 2025 21:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC21C4CEE7;
	Sat, 21 Jun 2025 21:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750542771;
	bh=dUdUWZGtBD23U+ihPBC5BGmCbIJ5i9RGd9rC/GvA320=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CNkGpGC1QTuntxEszxeykAPy/b2wWKWygsbZloOzpvurxkxwr0K4N4cIqMAWmJr3k
	 Ob3RYhCmhgIdjq5LAAi+djlhZYWPemXpSmVSVI9LzHjSFDDMV4Lij91/f7/Nyfg4Zq
	 w5NHBgQL0w8GicxKTvq94M6+Djmf6W5hmlIn2GbN16HmeftrEFhD0GHXPQYpZUBz06
	 /6n8nBSMjElyOuHP/mVPWEzXO8d1FfwofdDVH/G8lZZROjeMTudGKzPazU0QR/jQ0U
	 GSfNBcPvtMmdti5FevTucwwO0fAlszNzjEzHgYZ2P/+AjK4A6HrEGbnlon747jlgfj
	 0A2PZ86imlWGQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250210113614.4149050-3-rohit.visavalia@amd.com>
References: <20250210113614.4149050-1-rohit.visavalia@amd.com> <20250210113614.4149050-3-rohit.visavalia@amd.com>
Subject: Re: [PATCH v3 2/2] clk: xilinx: vcu: Update vcu init/reset sequence
From: Stephen Boyd <sboyd@kernel.org>
Cc: javier.carrasco.cruz@gmail.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Rohit Visavalia <rohit.visavalia@amd.com>
To: Rohit Visavalia <rohit.visavalia@amd.com>, michal.simek@amd.com, mturquette@baylibre.com, vishal.sagar@amd.com
Date: Sat, 21 Jun 2025 14:52:51 -0700
Message-ID: <175054277123.4372.1455513715429068984@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_145253_325871_28F43E48 
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

Quoting Rohit Visavalia (2025-02-10 03:36:14)
> Updated vcu init/reset sequence as per design changes.
> If VCU reset GPIO is available then do assert and de-assert it before
> enabling/disabling gasket isolation.
> This GPIO is added because gasket isolation will be removed during startup
> that requires access to SLCR register space. Post startup, the ownership =
of
> the register interface lies with logiCORE IP.
>=20
> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
> ---

Applied to clk-next

