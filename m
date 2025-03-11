Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12155C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zH3vbpcEhsaA2sff1rBOlB+R5fEXLW/Q8ws1zWzAhE=; b=PkhDL+Co3GUSsZdYJHfpCHhpY7
	3ckNcQWDdEu39RrKkdS9c0MvwH0VXmBMh57TyM61K9Oy8HYIPiYuxIzRyrj2k2KA8nXCNGrH9eBN2
	RR3RXx+W3WgV2WfTqB26V0RPzE8tEyz2vkAEfBgAKa9wqsZeU0NWw5GEELie8f3f6kIijN8YkdWHE
	nqZO43WbYvc1B6Ck45lNkFdwkx2FRWQg1D79xBYQIgNiBIgDFd4Ymktp4TNGQuJHkjdkXeqbd5k2o
	hfiDDiF08tK0bhCu3MZl/Yn1IqLl+ZEZaaOn/jkXT5Zip4pc6rAzv8xABQbTe1tS88kGMDCtWvxG+
	j0QliKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1try3J-00000005WF2-3abj;
	Tue, 11 Mar 2025 11:45:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxzx-00000005VVQ-1vZ3;
	Tue, 11 Mar 2025 11:42:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF5BF5C5C4C;
	Tue, 11 Mar 2025 11:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE5DC4CEEB;
	Tue, 11 Mar 2025 11:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741693332;
	bh=0cT+g/6WFHRo97S8MzNd/drxoZXKifddanz+n4Uem64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUXhwXQLYpC885YJdW2TRx7RUjZm5rSn13EHYURan6o2jQC3pgD+e2hKRnYvENUev
	 IoPstSAUq6ZbXhledQeIrrlmuOGplzdFM1g8h52AMbNS2RN6NK66yvHRSlMg8wX8FO
	 FCPl/kZqLxUF+z1+oPfxJRZo6aRMd0lLFbbrHDqeWeBS5jYgku6BK34y1E8ambTZfo
	 OM2Cy1Z5ZJ8VAZce1vPKhK2/JbXCBZPNeoLJQJ2V7+WW2ethWoFp5rqjolTGskUcSm
	 TQOzVOGlkbYV9Ho9jsztzeW4fkWX8mLb5QS4yKdedn86e7qDzpe615WK+R8unxCa1d
	 RsALeUlcGrUBA==
Date: Tue, 11 Mar 2025 12:42:08 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 10/13] phy: airoha: Add support for Airoha AN7581 USB PHY
Message-ID: <Z9AhkByegWQgC9YE@vaman>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-11-ansuelsmth@gmail.com>
 <Z9AhN9T8s1oogCUn@vaman>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9AhN9T8s1oogCUn@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_044213_550727_F6A5E9D7 
X-CRM114-Status: GOOD (  14.80  )
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

On 11-03-25, 12:40, Vinod Koul wrote:
> On 09-03-25, 14:29, Christian Marangi wrote:
> > Add support for Airoha AN7581 USB PHY driver. AN7581 supports up to 2
> > USB port with USB 2.0 mode always supported and USB 3.0 mode available
> > only if the Serdes port is correctly configured for USB 3.0.
> > 
> > On xLate probe, the Serdes mode is validated and the driver return error
> > if the Serdes mode doesn't reflect the expected mode. This is required
> > as Serdes mode are controlled by the SCU SSR bits and can be either USB
> > 3.0 mode or HSGMII or PCIe 2. In such case USB 3.0 won't work.
> > 
> > If the USB 3.0 mode is not supported, the modes needs to be also
> > disabled in the xHCI node or the driver will report unsable clock and
> > fail probe.

Also I dont see phy depends on rest. Please split this and post phy bits
separately at least..

-- 
~Vinod

