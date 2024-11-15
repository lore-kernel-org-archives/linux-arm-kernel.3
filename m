Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0427FD68BDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 23:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0551gyIqk7l1TMuE8z/UeUWDOVxPDJOFiltT76kong=; b=S5Oa6UTN9nZGyCz1MPOE5e2n5/
	jyyI1TtnkfMTwsLWV6jLfScY5GWcAPSFjEv2qCpzCgXGjmI+psUu2zMWpvrQYTGcY4FCICvRYNsjg
	zhtGC1CNP16N44zf6r41xdJKXkE43kUQ8EdRERvUVXPvWilK5A/cNAWcKSB977ModzghH4Xz+j8Fr
	1v7lHF6kvJzcbNZhMOKztRWenvySQ+I0T7axc7U2iTh+LVEJh3J7GnOzuvr1todN5UOiCBDxIWvoe
	xNLFLCOZoeoRDvLBvt8BKjwZXWgA8ESv1YtDFtD88iEo+Ah97W4LPrTVGOXSCBOtQcfNv/8p1+85P
	dhgvRhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5Yd-00000004X0a-0UXw;
	Fri, 15 Nov 2024 23:16:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5Xg-00000004WuM-3Bv0;
	Fri, 15 Nov 2024 23:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE1ADA425E3;
	Fri, 15 Nov 2024 23:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F33C4CED2;
	Fri, 15 Nov 2024 23:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731712555;
	bh=FUyfmapV/R+XmUaTZVZp/eGm+YQusACamSnKy2xJ+uw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d7SKGPU8gXQCnQ5JpnZsLnhnV8NyIwhYasFz269sjVY4FEbQ6I1AHdKXSg/YP5ePK
	 au7dHtfBXJWYBIv2qyHgMnjo51bJBIgoREDucUr4dQvfRL8c8AieNhLhZFp/zP5+JH
	 uV6U80H8+z0jkPMbh1B7/7ITNe17n3A7Ji7C3nw1qwvTl2RrZGLgqDAOS26R29Tp6p
	 Aklh35ASO1T/YQNL5I5+mANT9DsBGU2Gb3JCfEaG0QMAzu6bwWLJrSkVk+/zyqo/nG
	 MzTJ9U++8tZQ6QSCORvSyKee132jG9rS3E4DljmB0F/LAo8KIL14rVyFWTFYGYdC6Q
	 7jFtdz6+VA6pA==
Date: Fri, 15 Nov 2024 15:15:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v5 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241115151553.71668045@kernel.org>
In-Reply-To: <6737d35f.050a0220.3d6fb4.8d89@mx.google.com>
References: <20241112204743.6710-1-ansuelsmth@gmail.com>
	<20241112204743.6710-4-ansuelsmth@gmail.com>
	<20241114192202.215869ed@kernel.org>
	<6737c439.5d0a0220.d7fe0.2221@mx.google.com>
	<20241115145918.5ed4d5ec@kernel.org>
	<6737d35f.050a0220.3d6fb4.8d89@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_151556_875776_C0797CA2 
X-CRM114-Status: GOOD (  14.18  )
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

On Sat, 16 Nov 2024 00:03:55 +0100 Christian Marangi wrote:
> > > Ok I will search for this but it does sounds like something new and not
> > > used by other DSA driver, any hint on where to look for examples?  
> > 
> > It's relatively recent but I think the ops are plumbed thru to DSA.
> > Take a look at all the *_stats members of struct dsa_switch_ops, most
> > of them take a fixed format struct to fill in and the struct has some
> > extra kdoc on which field is what.  
> 
> Thanks for the follow-up, they are the get_stats64 I assume, quite
> different to the ethtools one as we need a poll logic. Ok I will check
> what to drop and rework it.

https://elixir.bootlin.com/linux/v6.12-rc1/source/include/net/dsa.h#L915-L927

am I looking in the wrong place?

