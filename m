Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21762CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfdtxbM/G6Jj5iHu60KzrFB+6duR9vo0YlX85yid0cI=; b=aMQ4hmZdp7AKa4SD8UVV/Cirwg
	0flxV2dD/KxXoiH2BJKWLBmVlcF+sCLvamFve7I7hiomJC38InHKVfEzE/omesfCWFxvdNrjedIAN
	wFPdk/AFpn7888PLr4aoeLnLk/46AMY8wGIsUsyVeSGL1I9VrIn31T4rt9efeh9XNDyZNdWEFHlax
	Aa1byG+WH1M8CPutcWQ7V8SqSxnsvs0hOyLvXh/+ryOfaMKUS864zZh0po8TzT+4HkroqmsSfq9ZS
	zyXZqMnOia3XfjYIGYoIJLeICGVPXmNRZbheGX47EMoOjZFWS5uFVwWP4C8psGwaX67J6ju4HWpmR
	60RpfbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWC7-00000005Ox2-1MYG;
	Thu, 28 May 2026 08:34:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWC3-00000005Own-2Icy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 08:34:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2D3B605D5;
	Thu, 28 May 2026 08:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361241F00A3D;
	Thu, 28 May 2026 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779957258;
	bh=TfdtxbM/G6Jj5iHu60KzrFB+6duR9vo0YlX85yid0cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WTapeyanxDujFpy/LRvlwNgX7EtdyQvTEBfTJAL9WwNP22PsBGDvkmzBnqxtKMNuW
	 mev/eUGSPgA/zonqekF9IG+td3Rvc/q363V7pv0ICgY06D8qqOycadhwbzGUrIPhOO
	 ZXsPNVqli4x2ocJ6huy9gkwJXHrE8yqFFsU/EeVYCp+h+XXGOgtQu3K1xoJdnTHZGo
	 e++8UrC+bwo4Z+pNqOzER2BWdEkAIN+O3UchB/seRURYYo5+eMJ6TERtQzMz4D0B6O
	 ezoTL/9GrlCZ7nlG3r8iSx6ktl+aA2GQiyW2RUBXgPQ/tDHPT6E+9iQZZD66dBS6nS
	 fmb0XRQ8zzPZg==
Date: Thu, 28 May 2026 10:34:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Kevin Xie <kevin.xie@starfivetech.com>, 
	Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v5 2/4] PCI: Use standard wait times for PCIe link
 monitoring
Message-ID: <hhf6aj4fwpwqczqsa7q76bcdtqdrpluk62mcivioivuiizc557@z543yluxnow6>
References: <20260526-tegra264-pcie-v5-0-84a813b979d7@nvidia.com>
 <20260526-tegra264-pcie-v5-2-84a813b979d7@nvidia.com>
 <ahV_r6NJWnmJptT2@wunner.de>
 <ahanoZgDwq3v6x8M@orome>
 <ahcob7HMbyGvFgxc@wunner.de>
 <ahfj-uhNTlk-byvU@orome>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ahfj-uhNTlk-byvU@orome>
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

On Thu, May 28, 2026 at 08:44:07AM +0200, Thierry Reding wrote:
> On Wed, May 27, 2026 at 07:22:55PM +0200, Lukas Wunner wrote:
> > On Wed, May 27, 2026 at 10:28:51AM +0200, Thierry Reding wrote:
> > > On Tue, May 26, 2026 at 01:10:39PM +0200, Lukas Wunner wrote:
> > > > On Tue, May 26, 2026 at 10:53:11AM +0200, Thierry Reding wrote:
> > > > > Instead of defining the wait values for each driver, use common values
> > > > > defined in the core pci.h header file. Note that most drivers don't use
> > > > > the millisecond waits, but rather usleep_range(), so add these commonly
> > > > > used values to the header so that all drivers can use them.
> > > > 
> > > > Hm, why not just replace usleep_range() with msleep() and use the existing
> > > > macro instead of defining new ones?
> > > 
> > > I'm trying to somewhat unify the implementations across drivers without
> > > changing behaviour. I don't have a way of testing any of these drivers,
> > > so keeping the existing implementation and just switching out the symbol
> > > seemed like a good compromise.
> > 
> > It looks like the code was copy-pasted from one driver to the next
> > and I applaud every effort to deduplicate, unify and simplify things.
> > 
> > I don't quite see how using msleep() instead of usleep_range()
> > should result in breakage.  The drivers are just polling for
> > link up for an amount of time and as long as you're not decreasing
> > that amount, everything ought to be fine.  Moving to msleep()
> > should never decrease the amount.
> > 
> > > Then again, I count 2 drivers (in linux-next) that use the existing
> > > PCIE_LINK_WAIT_SLEEP_MS, one of which multiplies by MILLI to get at the
> > > US version (so it could easily be converted to the US_MIN version). Only
> > > pcie-designware.c uses msleep() with PCIE_LINK_WAIT_SLEEP_MS, so it is
> > > clearly the outlier.
> > 
> > Konrad Dybcio went ahead and replaced usleep_range() with msleep()
> > in that driver, kudos to him.  Cf. b262518262f5 ("PCI: dwc: Use msleep()
> > in dw_pcie_wait_for_link()").  If you could just carry over that change
> > to the other drivers that would be great.
> 
> Alright, I see you really don't like usleep_range(), so msleep() it'll
> be.
> 

The rationale behind commit b262518262f5 was to comply with the documentation
that recommends using msleep() for delay larger than 10ms:
https://www.kernel.org/doc/html/next/timers/timers-howto.html

So I would also recommend going with msleep().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

