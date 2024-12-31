Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24159E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 11:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOFVk2k5tBQwtmke/PPz5hOXTSc4UeqWwlkGmYPcm0U=; b=YYwxlnSmzZYUhOln++5whv2N7+
	Jk0QlDsRnsxIhRJe2mtAURye04ua60nqlPL6z/ci8S6Vp9as8Z1W78JL5HixMuEpuoww6Ttu7+g6j
	WP9WDEQm5NVJZc9OwHjbLs5EI5pi4+ARWwdfwWxRdl8vuSAhNjYCqAEzv3dMQyWUdK6knycuKU4QK
	cejs2nW4z5GIP/ejhnWZJ/CCNfmoEFylpsEHtu8WoEhc85DUB1OQdToUDM3+wzm18nH4BYc4y+fi9
	Me8opuaKoj0o3heYNNxE6y0Rkfk6E9Rpm/CHreuE6g8bqDcgaPrqx7mu2l4CRAkMsQlohW1IMj6EI
	5yEcBDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSaPt-000000076Wx-0TIo;
	Tue, 31 Dec 2024 11:28:05 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSaOf-000000076Q3-3Or9;
	Tue, 31 Dec 2024 11:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1735BA40388;
	Tue, 31 Dec 2024 11:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60D9C4CED2;
	Tue, 31 Dec 2024 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735644408;
	bh=7I691cikO6+2ya29OQVC4BNPWfPNDEUQc7RUJdpNRnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oofNmexejOf6DtzMHzSm5/hhVPLO7oTwCu/lgM+pv7g4ZVjowqJTNbsOrLTxkNIHK
	 yEDDjgEvZoTC0YIXCLRV8BdTK2NbXvES1qMZ8TBiP2LPYJYqBO2uJ89NTVFbzEl1uV
	 eYe8zvkNWHwKOTj+IVHu68YjVv18a6o1vduIRADkkgDL5bC1ez/hDfBMmDPu3ffpSn
	 UOW6/420rP7TrrAoS2QCx731qGe4ohJkn/uGfFH/UTt1UMoeFzeautXULGB0UneWWI
	 Z3XqzxY2a87O0mdC4bCEdAQczTdSQafRh4KLfmGB7XSt+7vMcK24BExheL4o1CabOg
	 g7nbKh8UChVnQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anand Moon <linux.amoon@gmail.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
Date: Tue, 31 Dec 2024 12:26:39 +0100
Message-ID: <173564436965.205920.13726972992693707050.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241202151150.7393-2-linux.amoon@gmail.com>
References: <20241202151150.7393-1-linux.amoon@gmail.com> <20241202151150.7393-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_032649_938149_3C7F556E 
X-CRM114-Status: UNSURE (   8.02  )
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

On Mon, 02 Dec 2024 20:41:42 +0530, Anand Moon wrote:
> Currently, the driver acquires clks and prepare enable/disable unprepare
> the clks individually thereby making the driver complex to read.
> But this can be simplified by using the clk_bulk*() APIs.
> Use devm_clk_bulk_get_all() API to acquire all the clks and use
> clk_bulk_prepare_enable() to prepare enable clks
> and clk_bulk_disable_unprepare() APIs disable unprepare them in bulk.
> 
> [...]

Applied to controller/rockchip, thanks!

[1/3] PCI: rockchip: Simplify clock handling by using clk_bulk*() function
      https://git.kernel.org/pci/pci/c/fa0ce454cd4e
[2/3] PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function
      https://git.kernel.org/pci/pci/c/853c711e2caf
[3/3] PCI: rockchip: Refactor rockchip_pcie_disable_clocks() function signature
      https://git.kernel.org/pci/pci/c/8261bf695c47

Thanks,
Lorenzo

