Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0967710AB83D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 01:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWlmXWMnomnoBoGXSrCHk/uLmDL+wJfqfsg/1tjJV7M=; b=xIloWw4drLmOXEdqz4eJOKQuUp
	gMgq9KZQKrTU4DbOkTp6poIbZzr2NOd7GrUF8ZzMnz6awgSOuiMDyoL5jgb2x+/oj6Hprt6Sh38x/
	h1Xiq283Q8DH0IwOnVBGdAlnpnvJcDyYSJygUUmhBPjoE/J0bl1N//JqJd2KruQZT5nwuuyDUa6Lj
	6G7Tz7H7Y2qFw2azQnwfa47cSWUJkdgx4iTOYbn3z3JeCU2r75kGaDXXRD2rz/0Tmke80qx43P095
	Y3XLaGz6/abrG4bM1uHWP6PWZKGkxlXKWMcoPOMKXhrCWDprA9+jg7d4fNd/FNzSk5QGmMq8xj2+A
	PYYLkRQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wEi-00000006Ut7-30WO;
	Fri, 27 Mar 2026 01:43:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5wEf-00000006UsY-4Boe;
	Fri, 27 Mar 2026 01:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A927144594;
	Fri, 27 Mar 2026 01:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CB0C19423;
	Fri, 27 Mar 2026 01:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774575820;
	bh=iiCnivrI3+fK1Ik1PMZAHClyS5F+z72Tq+mPnjBj2Jo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WIGVhIuHjwV5IYDKaNMshGTJ6CKlt1wYMaCt8i4Pe0NuSnuoLbjDkPFTYdHd7GfYV
	 9zdE1lBMkE1VBLtbPd/1blL9X2SCDgYmnOefWqbdfQ7ta+7G1XKcsvvk7FoZjYMDHv
	 gCcFb3xOlS/XWf02qRvxlYB5eA0kFIM/sZrj1ORmIBAt4whUMXmNZMkzIt6nGZRpUG
	 /jlNhejXrO3VfXIGpnJvAuCFlF3IutjqNx/99kaVXw9lobw1AWU1mTCUb2jcNNRZ32
	 cU9h6Pv92sYpHemYNvDuqeS9FlEcF5LGc2geVK1neKlwnlopI1UDyZz/DpaiqJHLQ6
	 wDsSd2ePz2ncQ==
Date: Thu, 26 Mar 2026 18:43:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 kevin-kw.huang@airoha.com, macpaul.lin@mediatek.com,
 matthias.bgg@gmail.com, kernel@collabora.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
Message-ID: <20260326184338.12dd5c6f@kernel.org>
In-Reply-To: <3688a285-7f98-4afa-80ad-697094cd7b97@lunn.ch>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
	<20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
	<3688a285-7f98-4afa-80ad-697094cd7b97@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_184342_065036_EDC9D300 
X-CRM114-Status: UNSURE (   9.40  )
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

On Thu, 26 Mar 2026 13:47:43 +0100 Andrew Lunn wrote:
> > +	if (phydev->link && prev_speed != phydev->speed) {
> > +		val = phydev->speed == SPEED_1000 ?
> > +		      AN8801_BPBUS_LINK_MODE_1000 : 0;
> > +
> > +		return an8801_buckpbus_reg_rmw(phydev,
> > +					       AN8801_BPBUS_REG_LINK_MODE,
> > +					       AN8801_BPBUS_LINK_MODE_1000,
> > +					       val);
> > +	};  
> 
> This is unusual. What is it doing? Please add a comment.

Also - nit spurious ; after if () {}

