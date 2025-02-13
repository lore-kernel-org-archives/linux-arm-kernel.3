Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3C0C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 23:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMe0Glge3D7ye0hvoXBCjdXL7BoWkgtD1n4dsYywEng=; b=dIx/yMBk3C+JA3uKiA+UKWHASz
	UbF3spzz7OhJjXV7PZi2ICJwIbEfSZ2HOjPUDNH406orfQcLLy2fhMS2sb0u80BcKO/pbPmrxLjjQ
	5fS3DAfosWa2mQlcajFtyKO5pGv1ii8Rc/bwTG9ouDPG9QPb9Y3wae0rYwU1c82Y+Ut/KmBtTPVrK
	Cimf5Kxcfj/kH8kWWnhS22TXyad97ByigShLSuCWlqVuw6XABb7nq1VGLMpv+jTzxNZzK7d1Zld6Q
	70yO3LtzKqkvR0Vgv+zN2zHhEdUegar7HSJoVsKBAvf1i6LLnl6821LXgEerpTGiMLtJHYV8h+j8T
	WM9nKSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tij47-0000000D092-49rw;
	Thu, 13 Feb 2025 23:56:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihtf-0000000CqQr-1MWA;
	Thu, 13 Feb 2025 22:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E563AA42784;
	Thu, 13 Feb 2025 22:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7856EC4CED1;
	Thu, 13 Feb 2025 22:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739486485;
	bh=CAUs6/nDNjcTwNdHYChXbiqiDRrypj8AA18+T0T5af4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODO1fwjiA4au/KUL3n4jxyKJl8PNOod+scC0fQbLvGK84PNz5zukCpL4Cq/HJcTti
	 2rsvAMFqqkotzEIXWF9oYxp8kGLTeXIMaQBtORe+jQ/ULXQnhep1BZXJINtsHTKsGU
	 7I+N0QOySIACYzzp7NyZkFX/Aj9Tv9yoGXNL5JGQz9cSZFAjSBv76Ve96m+av4+yIR
	 RE/2PCyQzFiqvE5c1G3NGFswOplVTDhOgOYysKL2dvserTbwEAi5+3QAVnhnbZlQ7G
	 hYU/lstAjeqfG6j2J9cj0RhvAtgWflgIBt/5X7FTlDS2bvSltTVc3KMuBuvj4Dl42B
	 SWBkVDwwo5Znw==
Date: Thu, 13 Feb 2025 23:41:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_144127_427463_7051DC6C 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi Geert,

> > @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
> >         return (msg->addr << 1) | (msg->flags & I2C_M_RD);
> >  }
> >
> > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> 
> Having never used 10-bit addressing myself, or even looked into it,
> it took me a while to understand what this helper really does...
> So this returns the high byte of the artificial 16-bit address that
> must be used to address a target that uses 10-bit addressing?
> Hence I think this should be renamed, to better match its purpose.

It's coherent with i2c_8bit_addr_from_msg(), right?

Andi

