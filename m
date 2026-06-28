Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971C0C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 19:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKHWu+eAIE/CZIjLM4PqfERbb2g3EF/Ptw0DlJwxfEM=; b=vI9JDatj6g9SM4JB6OflO47I2R
	sCC8a0mSqteqT8Y9g/GxLH3OrQ0RaDF7irDm+0n97SND7/pzmiHCeZDAuQpkxipaTUoKpw8SAvLyN
	vsoaKMu/9d0x8V9efF6zmhQqs2esx6cUthq0hAJhanUbTbqz7bRG7RubwZoFm8t2WDZXj5EApPSmj
	1m1MazmgirgP69f13INddlo/lh7AG6ldmRVMPd3LIeBwKvrt1LKVkFuXhzZCHuRauOa4qIkyBFog4
	+0zjIi7ONN0FSAJVUDPxOeL61BcR+/Sdj9xpdls5cG+mQofyR9+Lo67SUwj3fHbn0Txg5aeTio4sA
	wqHI4POw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdux3-0000000DJJ3-2Shb;
	Sun, 28 Jun 2026 19:13:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduwq-0000000DJEF-14ud;
	Sun, 28 Jun 2026 19:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oKHWu+eAIE/CZIjLM4PqfERbb2g3EF/Ptw0DlJwxfEM=; b=Mk26mecoq6LVnqwkG20VoTOT58
	yjzkv4G6vhY8fd4Ezlx75RVUft6+m4Fw8lM2iM2joFBRYdfWQSPAAgtBCz83xS/1CtIUAeLLhUUbQ
	c2nfEhhoUeZTH/smRNmwvxUdmvmvkiZKD1bDU7sFRQQR6qNPKkXXfvjtaxEs5FOVBvO6kzn/16Xr9
	arDNpj7OIB6/w6HxaX92wFd6Bfucp9EyZj0+NhKG0Z7gfY/6s1HdXdXNvZ8/n13X0Omk4SrDovtC1
	aGu3/HoWDX6NOjUexXyb3VI4VxlccYEGa0KLJtvZ+KE4ohZr4fotQ5DVtEilybUuf72lnpJSIrILy
	fxDzyZ0A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniele Briguglio <hello@superkali.me>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
Date: Sun, 28 Jun 2026 21:13:24 +0200
Message-ID: <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260624123914.1767374-1-hello@superkali.me>
References: <20260624123914.1767374-1-hello@superkali.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_121344_302781_743CC1BA 
X-CRM114-Status: GOOD (  10.42  )
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


On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> No in-tree board references these gates yet. Boards drive the codec
> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> managed clocks, clk_disable_unused() turns them off at boot. On a board
> that relied on firmware leaving the output enabled, that cuts the MCLK
> and analog audio stops working.
> 
> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> state firmware left. A board that wants the kernel to own the gate can
> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
      commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

