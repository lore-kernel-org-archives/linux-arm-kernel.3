Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DCE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsj9ECcOO5wptkVaL6Whbjdf6Wg1SYFAJ8jELyUshPM=; b=cCJpZ1l8DRepF5lDPJlrDMviku
	i/u7MbAbceSzJ1lb0CrNvRC4MJwSozE5zUVKac5mk+sgASj70oYgU4vwa6TqxeVOaMWjg9mU4tlO3
	5aFJ0fN9d4c4ykluhFw9gwjNoTotBPgtjJOAfgd/ExSi4dFv5+LUkNF6llFCvaIu374dI6uz5Xk9w
	KaJHNRG+24kBk4qiju5VR+zGGL59fBi3zasj/C6ms8qNfox3KtOsQDVFyjFW/RAqHAWKXewlYdfV3
	L6bKb9Dowb149lvH23b1um5xBBFklke6bmLAxQaRwUw/4CDDbFEFsOAUqg8uSru2uBNIDIRjFaQz3
	UH8AijJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeEr-0000000HFH2-1Xit;
	Thu, 12 Dec 2024 08:08:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeBG-0000000HEMb-3yrq;
	Thu, 12 Dec 2024 08:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6007A4262B;
	Thu, 12 Dec 2024 08:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B3EC4CECE;
	Thu, 12 Dec 2024 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733990657;
	bh=47kCC3IaGSxh1D7BcSgs1D4JpI1pTNpXykzx+d7p8Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tf/iEPgjcINryK5v/Jg7/FAJAr+P+m7ZQkzsS62+09HHfEz1q9iM8eS+R/qPvYQpx
	 XkMPSmjPFM1r4i6MQY7+kMA1xw0FspHRE67Dk3l8r8a7ZMaQln6dyEUUCEK+RtN0Ke
	 DiB3zMGSQ28XsfPh3qY0pOYtz7nG+eE46lCxWAfhf1Au58sBcT8zAbxTSztWYtSqBe
	 TY34yeFkt+/Tq8H/1L0ZU2/KwlFyncyh1jTYxg8k8KRW06aa6v+zDmpaZsPazupvyh
	 BtPsIZglCNret4sx6y9AmoQr6YjNrGk6VGhc2CNpTkt9WmJzhnkf+dc3avqv4FOOwu
	 SVUf1PtfU/jPA==
Date: Thu, 12 Dec 2024 09:04:12 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] PCI: dw-rockchip: Enumerate endpoints based on
 dll_link_up irq in the combined sys irq
Message-ID: <Z1qY_K57lamVxqRm@ryzen>
References: <20241127145041.3531400-2-cassel@kernel.org>
 <20241211053104.7sgo5bmmjnolwvhh@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211053104.7sgo5bmmjnolwvhh@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_000419_052110_82FF0E10 
X-CRM114-Status: GOOD (  16.19  )
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

On Wed, Dec 11, 2024 at 11:01:04AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Nov 27, 2024 at 03:50:42PM +0100, Niklas Cassel wrote:
> > Most boards using the pcie-dw-rockchip PCIe controller lack standard
> > hotplug support.
> > 
> > Thus, when an endpoint is attached to the SoC, users have to rescan the bus
> > manually to enumerate the device. This can be avoided by using the
> > 'dll_link_up' interrupt in the combined system interrupt 'sys'.
> > 
> > Once the 'dll_link_up' irq is received, the bus underneath the host bridge
> > is scanned to enumerate PCIe endpoint devices.
> > 
> > This commit implements the same functionality that was implemented in the
> > DWC based pcie-qcom driver in commit 4581403f6792 ("PCI: qcom: Enumerate
> > endpoints based on Link up event in 'global_irq' interrupt").
> > 
> > The Root Complex specific device tree binding for pcie-dw-rockchip already
> > has the 'sys' interrupt marked as required, so there is no need to update
> > the device tree binding. This also means that we can request the 'sys' IRQ
> > unconditionally.
> > 
> > Signed-off-by: Niklas Cassel <cassel@kernel.org>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks for the review!

Could this patch please be picked up?


Kind regards,
Niklas

