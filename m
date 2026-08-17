Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014D3C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 20:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=111cZwE+fIsihcrOn87KAVC+gmNsgNFaiu9bx9gzA6c=; b=uHGLAtkPvCyNtmw4euuQtoKSfq
	f7qCovH7q2R85Lof9ZR791AxC/b9EYn2y0x9OgOw+K4EBUoIE+gRq0sbbAPrccrNBLI5WvWH4yrNW
	09lm8zZoIkHlBLJbec+zdF/5p9AhfmH+IQ8ykuCQuhx7YVU1bqzH8sqQGY7cUuLmYUyR1IHNgq5Ln
	tdrNseGeaK6jR0iKD+D3+jVAYBvwyBQ95mh6Foa5WBhiH93fCLEE2fmP5LfOn5SN6JtKso3L8bh9g
	XpdjEoTqVTV2bJVliBK+UW2GBe6gITe9b0c4PBlsyZmcrif+ITjQU81sT2B2gLjV5oFrQBVx6gQpj
	fz4tuoAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4F2-00000006nSR-2qmP;
	Mon, 17 Aug 2026 20:47:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4F1-00000006nSF-21SP;
	Mon, 17 Aug 2026 20:47:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A91C7601DE;
	Mon, 17 Aug 2026 20:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910901F000E9;
	Mon, 17 Aug 2026 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786999649;
	bh=111cZwE+fIsihcrOn87KAVC+gmNsgNFaiu9bx9gzA6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FL0z2pUnciX4/Rv9iwWhFcb2vERfUR1zoJ8VQv1oWRemL7hekh9TWUinYS67I7TqN
	 RlQRH3t/1/0njxFN0sL0e0S56NAmnj6JwcipGbfE5sv9zWwxQyWA0SH/mEbb4fuqmh
	 7Xz1AHU6cYORwQULXlq+2x8bMt0eo3YqTDPn7I19Ajg+DgwB19B0L8E3TbP3m2szIH
	 1l7+129bQJNtPWJGJOUinh9MHY2jp0u6cX5f/wp2ubcd0jT63meYaz6iz/efakqDRU
	 +/Dxc38W25cd6Jy2JNSTQGv3kZbaXagWuC2ThDnwjwBBo7eDIrgdhs6+AFkrcsfBuj
	 7j7a6isGz0/0Q==
Date: Mon, 17 Aug 2026 13:47:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
Message-ID: <20260817134727.1f76d6dd@kernel.org>
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
> 
> At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.

Coccicheck says:

  drivers/net/phy/phylink.c:1039:31-34:
    ERROR: invalid reference to the index variable of the iterator on line 1028

  drivers/net/phy/phylink.c:1364:26-29:
    ERROR: invalid reference to the index variable of the iterator on line 1346

  drivers/net/phy/phylink.c:582:7-10:
    ERROR: invalid reference to the index variable of the iterator on line 569

I vaguely recall that you're supposed to make a copy of the pointer,
not just add a "found" boolean. Dunno if it ever happened but Linus
was trying to make the list iterators override the pointer on exit.

