Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B471D4337D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ShPmY8qxpsyLpCpfZhTtBvEe8UUEBpOTVjuJULDuTNY=; b=ReYsEDhxcbLxvu
	Rae/9UL330DiOf7CjvJQ9CTW3qmSONyuakDgvbwHEe6joo64mk754hwHTwWtJwt2KIQ2BjjVqr2F3
	wXJYKYyn7vmnjKZfwMrU7MFtMGhlAIJ4yqolf28mtAjgwx43k8Fp4zc8Z0bsyaHCxbKM8v7J3bbTa
	cQV8KXhkC9hULc88XCLkL59iVQLb2MlqAANbJo6MNamqWzqR4fRPKn5hx6KBQBFwBG8VMGisOmV8E
	ZnG+cqQGr52F69wnLQ1/hMwVxpejH5jDq3qHRwroEjYX9Htu50s+yrgiSVBDU1QBfuFyla3xfQpaI
	e1lSNplEn9PKNGWSy5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95iU-00000007i1J-3ASr;
	Thu, 07 Nov 2024 16:50:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95GM-00000007buz-3Lwe;
	Thu, 07 Nov 2024 16:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96E905C01D8;
	Thu,  7 Nov 2024 16:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C389CC4CECC;
	Thu,  7 Nov 2024 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730996498;
	bh=WDKQzVC7YPrESifnzXnpiGCLZPvf4XaK0grfpAL8WCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=vEZztuxZPoXiMgodDEyirBvDBBIG5RvZe5y4dGCCwGXkynqIdNQzvtcLNUzJfCrbQ
	 ghjrLnfgnxDlqFlvCkr5RCCvPJyoB+i/YQ+xj47QEeDtS+P6pVu1UAUjxYw4qNdaB1
	 KpEIQ239IAqPvY1oGamDVZf9ahEg4FSseGwEGlMtDHJ6pGewwsUJrpOWN34kNt4EH7
	 AAE06x5fLlu1DWf0vnIluJkU3zD4+L4Z7SL9d3fs7VBrtmjE4CIgKI39XmstwI2paV
	 QlYlYDkB9hPMPGuncgn/ng2OOSiJDXy9LSEplrsLeqswEjGJpH43lXrUt6gu0z2UJw
	 Ms5KoQKnkDmTQ==
Date: Thu, 7 Nov 2024 10:21:36 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] PCI: mediatek-gen3: Move reset/assert callbacks in
 .power_up()
Message-ID: <20241107162136.GA1618287@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyzmFyRYDHX0W6bB@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_082138_943717_83A6BC58 
X-CRM114-Status: GOOD (  11.89  )
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

On Thu, Nov 07, 2024 at 05:08:55PM +0100, Lorenzo Bianconi wrote:
> > On Thu, Nov 07, 2024 at 02:50:55PM +0100, Lorenzo Bianconi wrote:
> > > In order to make the code more readable, move phy and mac reset lines
> > > assert/de-assert configuration in .power_up callback
> > > (mtk_pcie_en7581_power_up/mtk_pcie_power_up).
> ...

> > Is there a requirement that the PHY and MAC reset ordering be
> > different for EN7581 vs other chips?
> > 
> > EN7581:
> > 
> >   assert PHY reset
> >   assert MAC reset
> >   power on PHY
> >   deassert PHY reset
> >   deassert MAC reset
> > 
> > others:
> > 
> >   assert PHY reset
> >   assert MAC reset
> >   deassert PHY reset
> >   power on PHY
> >   deassert MAC reset
> > 
> > Is there one order that would work for both?
> 
> EN7581 requires to run phy_init()/phy_power_on() before deassert PHY reset
> lines.

And the other chips require the PHY power-on to be *after* deasserting
PHY reset?

