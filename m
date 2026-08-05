Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC2FC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 20:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=971/E5H2S2WsTVQ83jj0cYfp+Ciybhtp5GybpD0dmnI=; b=NZp3R8CDWZlSg0X7Usmkaz60aR
	G9v14e3CKP4Fxb6x5ky8N70OAieC0kgwcWZraoo3mR3n40Cow0G9Gdoy61jRgBoNMR3zDlDZGR86A
	0LRW7+XmKEGgzP5emRWJmQC+/ZqK18NrjEI+zpqxofR3yJgmUUjGMg8soocly2bM5u0rMWx35VTp4
	qaU9ASHJ0PUDbDTRgynGbJ9JbZQ1zdjd2TdNt5GGgDUAEK/iwItEeT3RC+K831qj0Wq0QImpNQkRG
	xq0061ElAiQcfnKyzlEykNyBDCZKyqbGiJ/LRQjnGn/AE0VEi4Nnbdgvo8uG/5s7jEukvQERv4sJA
	VkerbchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wriiB-00000004Y9n-1bGY;
	Wed, 05 Aug 2026 20:59:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrii9-00000004Y8t-11X9;
	Wed, 05 Aug 2026 20:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=971/E5H2S2WsTVQ83jj0cYfp+Ciybhtp5GybpD0dmnI=; b=kRmyA8oxGfQsg3R/DDcROtnry4
	XoKUO1KsJPzKZ/xMHGngf56zx8kAaJ+FRqFmYvZEFWZer4xTcy5okVSGLnwz9Ks+PT0JWi4ZQW/b8
	/g/slhQ9JOl7uAFyVY5JYzDRRgDToO6RgFtH8WmjVDPdEQZs8BXyB3nkORCV49IkmNAuvFLgY/smd
	4uceg5I6IecSeybbE1DE6z0K7KSoZn8QvAaB5UOBiYiMu3Nf94JoplkjreSR6ejNwus/RtPrOX/Tm
	KsepF3tYNzgQ/5vrk6VK/mEecoHn8Gzeky8fefy49+sUdedAuB+6PddjjXuiLRVeFbr5KSXfFQHbO
	/kBo48Mg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Sugar Zhang <sugar.zhang@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	YouMin Chen <cym@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Alexey Charkov <alchark@flipper.net>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
Date: Wed,  5 Aug 2026 22:59:15 +0200
Message-ID: <178596355280.2517015.1649597472249791359.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260805-rk3576-spi-clk-v1-1-2f040d0d163b@flipper.net>
References: <20260805-rk3576-spi-clk-v1-1-2f040d0d163b@flipper.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_135937_304505_42C19A24 
X-CRM114-Status: GOOD (  10.08  )
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


On Wed, 05 Aug 2026 17:45:09 +0400, Alexey Charkov wrote:
> The TRM defines available source muxes for SPI0..SPI4 as
>  - b00: clk_gpll_div6_src
>  - b01: clk_gpll_div8_src
>  - b10: clk_cpll_div10_src
>  - b11: clk_xin_osc0_func
> 
> Which doesn't match what the current clock driver implements, making it
> impossible to derive some SPI clock rates such as 37.125 MHz (which
> requires clk_gpll_div8_src as the source mux).
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: rk3576: fix source muxes for SPI0..SPI4
      commit: 586ff159ec02533c17dd928641529cb0b52e9c62

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

