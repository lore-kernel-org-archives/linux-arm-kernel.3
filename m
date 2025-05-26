Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AEAC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kk/X2iMwkZ9QRWnt0o+BzHTjRbwP4NWs5dzU8KffOaA=; b=sff9t1H4bFL7GhLC3O/+D4aWi6
	1fJGK3NDBYDxQHlYlf9aHhJhUa6226hugsZrKBJTSSYy5xItVlozJzWShkgvCwb14qyJKS6OjBWIr
	Ii8+8/V9F3O+sPdQTLAsJqRfZ9hOBTIPce1sI4g3LuyXjAA3gZTHYZq3Dhgvcc/E/Hqtl6Q8qWd9f
	jIe1YgGsjn+lgKuQbgFnp8udnqCyEk2dVibvIk7aiRMrMxceXgwHrm4rOP+U+Qi1DkmH5qIHKYCWc
	yhNga+zLaYW8McuHJX114Q8kNqWzO/4jKIGlIyyJ7la0SYQD8OZ1iB8JZZdDOKDWDdrP8Hoh1pno9
	yDDa8XXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfJg-00000009XGF-3KCN;
	Mon, 26 May 2025 21:25:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJfHY-00000009X8x-3tz6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 21:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Kk/X2iMwkZ9QRWnt0o+BzHTjRbwP4NWs5dzU8KffOaA=; b=T879ss70/t9wA4mWiMI6mNI8BN
	UsnlixureesQqmV8uikvpnWFL2TZSc/FkVkD80DuZqSV07g5JosbMXOrJsiurr98FpjN+fcIdl4+2
	+RrySl2KnWyJagD2A3mOAbo80nAx0wASVHs7OeWfsVASTy0ha7jq2Nl7E9IdsODflT7I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJfH0-00E1mE-Dn; Mon, 26 May 2025 23:22:18 +0200
Date: Mon, 26 May 2025 23:22:18 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Feiyang Chen <chenfeiyang@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow runtime
 AC200/AC300 phy selection
Message-ID: <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com>
 <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
 <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_142252_966704_FB7CDFA2 
X-CRM114-Status: GOOD (  11.73  )
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

> > The normal way to do this is phy_find_first().
> 
> Sure, but there are problems with that approach here.
> 
> The initialization sequences are rather different and the devices
> won't be visible on the mdio bus until after they are initialized.
> 
> The resets will be specific to either the AC200 or AC300 so we
> need to choose the correct PHY based on the efuse value rather
> than a mdio bus scan to avoid a circular dependency essentially.
> 
> AC200: i2c based reset/init sequence
> AC300: mdio based reset/init sequence

O.K. so you need to post more, so we get to see the complete
problem/solution. It seems to me, AC200 and AC300 are not compatible,
so should have different compatible strings. That might be part of the
solution. But it is too early to say.

	Andrew


