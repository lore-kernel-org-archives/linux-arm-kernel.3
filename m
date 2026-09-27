Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBD7C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 19:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQrtppGpAREwEBox3klCIQcjsYbUf0EeTuSwQEhRl+0=; b=xwuAxUZ/Du4hw/rkuTNeD93eNo
	uDdx18S6utafhGlSPYkSJlImgBBgjRPZ80I/iwfzywT9mC5o9NB6RRlleaX+WxUZ/AZP8KxjXoYTs
	HDN9xEjrqPkdwcEY++R7U+a/4Y6OoERnlqrrAwLb49sFpXhJDl+faGOfOXIjSyVJLXqnrMYZ3t5VW
	zyVQesHIPG1Awf4PnVBtJha2Mh+FizJ9jss4d1cyWoGwj1VLUkRGtX1PlvPqIAmuG9S9EFjxINTgf
	/kgx2/LJ8jjoXmgewK7dra8rQwvSrWGVNeE+AN4DkQanHyeWyRsGaumSR6EU5EYfzsJKxKgPH663P
	ehUZwljA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAu8o-0000000GjYc-3e00;
	Sun, 27 Sep 2026 19:02:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAu8m-0000000GjYF-3LYa;
	Sun, 27 Sep 2026 19:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UQrtppGpAREwEBox3klCIQcjsYbUf0EeTuSwQEhRl+0=; b=GXE3mkqRY/t8zgm8M7PViX9qlw
	2P5+5y4FfOjpjW3YAfRO/RNQR2B+mjHhHaLVo3V2PgXSwur4ZbiWg79L3t/UZde82dIYBCQgljmVE
	MS+vGcDHhJ/arNtWKId8I4qV50ynJtihdgrIfdpN+Ohg7VE/tKgxabpA7UB6mN3tPwX8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xAu8X-007YUJ-0o; Sun, 27 Sep 2026 21:02:09 +0200
Date: Sun, 27 Sep 2026 21:02:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v23 8/9] net: dsa: mt7530: generalize and move
 common function to lib module
Message-ID: <cd200dee-1bde-4cc2-a296-c93d704cb906@lunn.ch>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-9-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925182435.21207-9-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_120224_835230_0EF51AD7 
X-CRM114-Status: GOOD (  17.71  )
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

On Fri, Sep 25, 2026 at 08:24:30PM +0200, Christian Marangi wrote:
> In preparation of support of DSA Switch from Airoha, create a mt7530
> library module and move there all the common function.
> 
> Function are generalized to use the reg_field regmap API but still apply
> the same exact logic. Every function is renamed to mt7530_lib prefix to
> better identify it.
> 
> Minimum modification are needed to the register header and common enum and
> macro are moved to the mt7530 library header to permit reuse.
> 
> A library struct is introduced with everything required for the common
> functions.
> 
> The generalization and the introduction of reg_field regmap API have the
> side effect of permitting to clean the mirror functions that required
> special handling for MT7530 and MT7531 based switch that had different
> registers. This is done by declaring a common MT7530 reg_field and a
> specific one in the Switch match table.
> 
> No behaviour change is expected by this change as it's just a code move and
> reimplementation.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/dsa/Kconfig       |    4 +
>  drivers/net/dsa/Makefile      |    1 +
>  drivers/net/dsa/mt7530-lib.c  | 1128 +++++++++++++++++++++++++++
>  drivers/net/dsa/mt7530-lib.h  |  391 ++++++++++
>  drivers/net/dsa/mt7530-mdio.c |    4 +
>  drivers/net/dsa/mt7530-mmio.c |    4 +
>  drivers/net/dsa/mt7530.c      | 1368 ++++++++-------------------------
>  drivers/net/dsa/mt7530.h      |  256 ++----

The number of mt* file keep going up. Is it time to move it into a
subdirectory?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

