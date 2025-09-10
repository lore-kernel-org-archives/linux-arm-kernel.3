Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2B7CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 12:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqiw+VoWrs9ZCao4FrtU1KYVim/2idPa5DIOt2YDBws=; b=LkOB4yzilEiCADB+iDtA4oh3Ps
	dItmcjKPpYFsVoML/Ar/cd80j2MF6ZYPpgPoZfSwHbBbHE+DazvuRArQH4OqwoYrZmdj0ln1edugD
	fWuf9/l0HAsGGMEenjo6Dys74a1MWsXZA+IDgoGZV0wdk1iUJncSWwudCtmJq5/TJfRvdiVBPc9Vp
	DiuRg8dW96Hvm+XkIgQiAFKxcA6MJVvqNKJJk/gS/NCmXPSRJ40vL4tGlBr3KTduWBKN5WHEmv3At
	BO6R7OKAUC2GpGZmzbgcOtNZPAI59WLINBeaLqqPaVpvsEToDXOghqlvcZJQdKfGZZzGM/JYu/mWN
	F+ENlX8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKJF-0000000EDqr-08j6;
	Wed, 10 Sep 2025 12:52:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwKJC-0000000EDqT-3oHe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 12:52:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B628544C0E;
	Wed, 10 Sep 2025 12:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C4C4CEF8;
	Wed, 10 Sep 2025 12:52:21 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 12CEE5F846;
	Wed, 10 Sep 2025 20:52:19 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20250908181059.1785605-1-wens@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
Subject: Re: (subset) [PATCH net-next v4 00/10] net: stmmac: Add support
 for Allwinner A523 GMAC200
Message-Id: <175750873902.2588463.10161966012825754065.b4-ty@csie.org>
Date: Wed, 10 Sep 2025 20:52:19 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_055222_971165_787EAD75 
X-CRM114-Status: UNSURE (   7.90  )
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

On Tue, 09 Sep 2025 02:10:49 +0800, Chen-Yu Tsai wrote:
> From: Chen-Yu Tsai <wens@csie.org>
> 
> Hi everyone,
> 
> This is v4 of my Allwinner A523 GMAC200 support series.
> 
> Changes since v3:
> - driver
>   - Fixed printf format specifier warning
> - Link to v3
>   https://lore.kernel.org/all/20250906041333.642483-1-wens@kernel.org/
> 
> [...]

Applied to sunxi/drivers-for-6.18 in local tree, thanks!

[03/10] soc: sunxi: sram: add entry for a523
        commit: 30849ab484f7397c9902082c7567ca4cd4eb03d3
[04/10] soc: sunxi: sram: register regmap as syscon
        commit: e6b84cc2a6fe62b4070d73f2d2d7b2544a11df87

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


