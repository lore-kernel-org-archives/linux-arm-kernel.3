Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D409ED31765
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 17:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjsFExo2cxAXw0p3zp4sr6B9x/zoM79OEdQpevDK14s=; b=g2wsasRpJavimzmVi+XLhy2XJC
	1OAxSGkom+FuvTNR7LYUDrd3ZxdzxsxKxMqjPAMON/617PtMPnD06nZpyYOAlbKQuC4x9yRUwVzKZ
	ZQeNqVj6EPrN6JB7TSmxt9Gw8+CpttryIaHQ3mpnPGFpdn4dt3RJ//6y2Lkq7Y6GAncqCLjBdyjN4
	PIWGBNpk7cdbybaMBPQne3eE/VFD9I393svNiCOXlYflpak7D08axWFrrM4Ih9abJ3EOuV3qYNKY2
	CPGeymx+olxTfdLWviC+dgpaatQ1Ya6zReoxpMiYe6FG7VIN6AdAEWwcGs1DpfKJXec09+S1O/yJ+
	4yr5zzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8N2t-00000000ABu-1HY9;
	Tue, 05 Nov 2024 17:08:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8M2U-0000000HYj0-4C3Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 16:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39615A4327F;
	Tue,  5 Nov 2024 16:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C4CC4CECF;
	Tue,  5 Nov 2024 16:04:17 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 41F205FB0F;
	Wed,  6 Nov 2024 00:04:15 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20241104190455.272527-1-robh@kernel.org>
References: <20241104190455.272527-1-robh@kernel.org>
Subject: Re: [PATCH] clk: sunxi-ng: Use of_property_present() for
 non-boolean properties
Message-Id: <173082265523.1488411.1920561535591784588.b4-ty@csie.org>
Date: Wed, 06 Nov 2024 00:04:15 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_080419_167250_BE2C051C 
X-CRM114-Status: UNSURE (   6.43  )
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

On Mon, 04 Nov 2024 13:04:55 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> 

Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] clk: sunxi-ng: Use of_property_present() for non-boolean properties
      commit: 1054861bc258fb5798b7132453593cc3eb0639ba

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


