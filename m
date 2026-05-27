Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10632CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 17:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzQqXA3pNtgg+5RKi2zUKUZCv3HSA6eVnRbuAZGhtX4=; b=gFLrnUOwGh8YHmLI77ts6y4doR
	aBf8zl5JNqYSOj2TbFHpIqcZnzaEQCTqSRxkTU4x+xvYTNzBdMG0H6irHX6nXHXU6Q/GNIKkerJFK
	FmDoya3WuCqvExtD8HtYnQ0k98xXsXCKc9XPYj8UbVQpODLOEZ9wNnrzSbegZyVNT0Ly3fW/nCsh2
	YGfn3J4DCVas+rtqsUNJ49hE7XhVBoKWdsP83spT06qYaKcyZ+cQxrto+F6J8kyHz4GGq0Q7bPQDv
	LuZee1lyOPih02e3YlNOLbAFJo8lORKl1R+T3/DKFPQcBU2HA1fwQ2Y87ZjV7n3IWaMfL+T/2wNXA
	yPx9djlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHyG-00000004Zvq-0b0P;
	Wed, 27 May 2026 17:23:09 +0000
Received: from mailout2.hostsharing.net ([83.223.78.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHyC-00000004Zv0-2eOT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 17:23:06 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 0D13B10DF9;
	Wed, 27 May 2026 19:22:56 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F2D18610672A; Wed, 27 May 2026 19:22:55 +0200 (CEST)
Date: Wed, 27 May 2026 19:22:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <ahcob7HMbyGvFgxc@wunner.de>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
 <ahV_r6NJWnmJptT2@wunner.de>
 <ahanoZgDwq3v6x8M@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahanoZgDwq3v6x8M@orome>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_102304_813603_6806F32B 
X-CRM114-Status: GOOD (  21.11  )
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

On Wed, May 27, 2026 at 10:28:51AM +0200, Thierry Reding wrote:
> On Tue, May 26, 2026 at 01:10:39PM +0200, Lukas Wunner wrote:
> > On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> > > Instead of defining the wait values for each driver, use common values
> > > defined in the core pci.h header file. Note that most drivers don't use
> > > the millisecond waits, but rather usleep_range(), so add these commonly
> > > used values to the header so that all drivers can use them.
> > 
> > Hm, why not just replace usleep_range() with msleep() and use the existing
> > macro instead of defining new ones?
> 
> I'm trying to somewhat unify the implementations across drivers without
> changing behaviour. I don't have a way of testing any of these drivers,
> so keeping the existing implementation and just switching out the symbol
> seemed like a good compromise.

It looks like the code was copy-pasted from one driver to the next
and I applaud every effort to deduplicate, unify and simplify things.

I don't quite see how using msleep() instead of usleep_range()
should result in breakage.  The drivers are just polling for
link up for an amount of time and as long as you're not decreasing
that amount, everything ought to be fine.  Moving to msleep()
should never decrease the amount.

> Then again, I count 2 drivers (in linux-next) that use the existing
> PCIE_LINK_WAIT_SLEEP_MS, one of which multiplies by MILLI to get at the
> US version (so it could easily be converted to the US_MIN version). Only
> pcie-designware.c uses msleep() with PCIE_LINK_WAIT_SLEEP_MS, so it is
> clearly the outlier.

Konrad Dybcio went ahead and replaced usleep_range() with msleep()
in that driver, kudos to him.  Cf. b262518262f5 ("PCI: dwc: Use msleep()
in dw_pcie_wait_for_link()").  If you could just carry over that change
to the other drivers that would be great.

Thanks,

Lukas

