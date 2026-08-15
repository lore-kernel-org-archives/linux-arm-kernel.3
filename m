Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96ACC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 06:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3Kaea5/4QRfxkV08KgglL3TBfF6yvhEMPHKfExIBhI=; b=WwODflyHGjgJJopy5ff9YhPIuu
	LdvltDfoFHOn44+eDFyDvLTst35gyg8xuL1OYRGK/CgSRCKL2etMNNPaQ4JpPYIrDUNUShp6JBWsl
	YxkvYLr5HKZl1S/WYhe/IIBWIwm7KTLEU2PfJ95OOVlWSdG/UtxN8GTk5OZMeVCC5a6sbZ+vDou6s
	c3sQJNDbmg8Lr7gqNQhy+cl5AUMjVGZzS+e3AFJLRw/zLWkEG1D2K9uje9YC1GYFgn3s1Z9va85s4
	uoRNBW6EZMDmff+m9k9sWWstk1cU0JAndVuSAI3FHgtbhdI0FyfJ8TV2aRbDGXvf6N1nGzavzbnMT
	BjtcuiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv7sr-00000003aWd-3P9O;
	Sat, 15 Aug 2026 06:28:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv7sp-00000003aWX-2lwS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 06:28:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 04E5942B1B;
	Sat, 15 Aug 2026 06:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4012C1F00A3A;
	Sat, 15 Aug 2026 06:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786775322;
	bh=p3Kaea5/4QRfxkV08KgglL3TBfF6yvhEMPHKfExIBhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MXOOq0fXuEq1NM3LiK4D0xeGvzqPoDsUnLQCENrdVs//002shNcoj9BJnsPdZ4Dwu
	 Wb2wXteFNLrzsklRyYfpOMAHgctCDhKMDY7fvS1knRaty4VxJmcJt6NgKojOYmsq95
	 izt5rTPQL5+66JwPaqVSEkdsX4RMDy9LQQDQckMmkzgc1WyNDlb2CbOr0HUWDrqNc+
	 x2tFdLiQnA956TkhpdYQG/HMYnAAjXVO4MJqSulWUpZnsnabZlwNVBzvyg/Jq781Zy
	 7v9DD2U5eMSXxbygLDrzQhwOvC2FEEz4awEawZXqfW9NjH8CQ8HZ9L3APYS/zJi/nl
	 HFtCK1AI5yU1w==
Date: Sat, 15 Aug 2026 08:28:31 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v10 2/5] dt-bindings: pci: tegra264: Switch to PCIe root
 port bindings
Message-ID: <f2wdbxqudd7kice4fcee4skgwektcftgqvccihi6l47ztwlssg@ufehmcwfwjh7>
References: <20260814-tegra264-pcie-v10-0-05d08c592b05@nvidia.com>
 <20260814-tegra264-pcie-v10-2-05d08c592b05@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260814-tegra264-pcie-v10-2-05d08c592b05@nvidia.com>
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

On Fri, Aug 14, 2026 at 05:38:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Switch to using the PCIe root port bindings in preparation for using the
> standard WAKE# handling.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

For some reason, you just keep missing Rob's R-b tag for this patch:
https://lore.kernel.org/all/178594272722.905042.3804777775947567354.robh@kernel.org

I'll add it while applying, but please ensure that tags are not missed in the
future.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

