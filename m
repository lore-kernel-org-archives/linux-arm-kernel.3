Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E322C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5ZhixbZZK68XnYWmJJNtDj0oXYUmqsiL6CAlg4bVCM=; b=iM2lNqFfbiemtyB228G1eLzxkD
	4R+xERDGwjEiJKhJeCTdVkFkAAvUBCKswsI4gCBbDxhT8akx/WLXo7P5XbG13FUMdFL4kG8WBIbSE
	fN2vuFSPa+kwDNwJaRVD8xs3J6HptQD4nU+KqprZTYcOm8A9qK6e0GM6Ka7SQ5s/E9nGqIL22LMml
	AjTUwPnIPGwZ0i0AV1bx7EyluqF8Pu7GPy/Lor/YTUNAIw7Sm7GqBtoFnngDynwIih/oVZ0Sh4WSK
	sdAZ82yQesWHqCssLR3HrxV21hTV/AZHar/IeRwAPPeo2pn4AiJqdu6M7WTXBZR/Tt8MV/ZitPgOW
	x7OAKZyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11uh-00000009Ne8-3AgG;
	Mon, 31 Aug 2026 13:19:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11uf-00000009Ndi-2mes
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:19:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C4A2B6022C;
	Mon, 31 Aug 2026 13:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CECAC1F00A3D;
	Mon, 31 Aug 2026 13:18:56 +0000 (UTC)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: linux-pci@vger.kernel.org, Liu Zhenlong <dragonliu2018@gmail.com>
Cc: jacky_chou@aspeedtech.com, mani@kernel.org, bhelgaas@google.com, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260816171633.15025-1-dragonliu2018@gmail.com>
References: <20260816171633.15025-1-dragonliu2018@gmail.com>
Subject: Re: [PATCH] PCI: aspeed: fix clk and phy leak in
 aspeed_pcie_port_init error paths
Message-Id: <178818233640.33196.12707078026403586187.b4-ty@b4>
Date: Mon, 31 Aug 2026 15:18:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Mon, 17 Aug 2026 01:16:33 +0800, Liu Zhenlong wrote:
> aspeed_pcie_port_init() calls clk_prepare_enable() to enable the port
> clock, but if phy_init() or phy_set_mode_ext() fails afterwards, the
> function returns without calling clk_disable_unprepare(), leaking the
> clock reference on every probe failure.  Additionally, when
> phy_set_mode_ext() fails, phy_init() has already succeeded, so
> phy_exit() is also missing, leaking the phy reference.
> 
> [...]

Applied, thanks!

[1/1] PCI: aspeed: fix clk and phy leak in aspeed_pcie_port_init error paths
      commit: 6c566177fc8f728271bed8018ac77b0a8199200d

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



