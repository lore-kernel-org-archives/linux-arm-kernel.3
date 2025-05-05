Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A385C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwA0WLcLtACFqX6eLCfsfhyEKhLsqI7Nz0KQvPtcVVI=; b=dvjtMbI1jGq8j9OIkSHgVICkK6
	Pbq5hHbttYGbMhNYM7APzaj7zkFLvlNtuWWiCBarfOrSk22x4XS/wq9cTNNqrNaXZozTDxWFI1mLk
	gw6HpdCKCPC5shgs60Ww0mNVUfaNKGnlD/mpXM5PzExK4EgZrsFi8PbdjgVmpUCR+kBXKEZYqMm4g
	VdTE/jDcCOBCijz/DV16i1GnBvXSR/NR4hAr+/L8HllIaBZqsam5M5+n0iW0xg8l2UKD7mb3yqjm0
	rjvDwRI9yCA8gxVBcOI17OgsY8ZrS3w3xCheOGlgkj5yX1ul98dVskZ1Rxkgzrbtq1excQsTPRGAC
	hxc1Qp7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwXI-00000007ZwB-1ipu;
	Mon, 05 May 2025 14:11:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwVK-00000007ZnF-0MP1;
	Mon, 05 May 2025 14:09:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADF3C61135;
	Mon,  5 May 2025 14:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13493C4CEE4;
	Mon,  5 May 2025 14:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746454148;
	bh=YRqrqVzFrmTsTKtBwgPOzHahPm+oOSbLg9my9ROL07Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ck58iJmJrtnaf30+tBuDoR3naDrSQu+nMQiA1XTUGaFs7cGWxy8L7IsOyru0sQIXM
	 5HtkX3HKqm/omXrQ1PKtJcwz0mW6ZqNPM78l5VMQ5vIqfubolwoParG4qQ4I5DeDk4
	 jTgmlU9v/afSPLRLpyp78X3xKDdvgUB3K+Dm6AaMnAek99av7jFxhK1J0jcJP814B+
	 /HCsph8wDGk//DT1o+mze2+FTtQPeIKqYd/mSh07oM+Kj8HQp0AU/u7pG3ccMpmtpz
	 ZkiwUEBe7sIjVc9YOFGCNtCuFLrJhklam+oSJ4O/OaPPZlFhVQCoj5oOnlwnC8SpgW
	 VOYRp7CAbXUdg==
Date: Mon, 5 May 2025 16:09:03 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] PCI: dw-rockchip: Do not enumerate bus before
 endpoint devices are ready
Message-ID: <aBjGf8-mDrqOrm5-@ryzen>
References: <20250505092603.286623-6-cassel@kernel.org>
 <20250505092603.286623-7-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505092603.286623-7-cassel@kernel.org>
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

On Mon, May 05, 2025 at 11:26:05AM +0200, Niklas Cassel wrote:
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 7a6a95dc877a..ed8e3dfe80e0 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -471,6 +471,7 @@ static irqreturn_t rockchip_pcie_rc_sys_irq_thread(int irq, void *arg)
>  	if (reg & PCIE_RDLH_LINK_UP_CHGED) {
>  		if (rockchip_pcie_link_up(pci)) {
>  			dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> +			msleep(PCIE_T_RRS_READY_MS);
>  			/* Rescan the bus to enumerate endpoint devices */
>  			pci_lock_rescan_remove();
>  			pci_rescan_bus(pp->bridge->bus);
> -- 
> 2.49.0
> 

Bah.. this patch is missing
+#include "../../pci.h"

missed during rebase.

(pcie-qcom.c already includes this.)

Will send a V2.


Kind regards,
Niklas

