Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F87C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9bC3NK4MUA+VYhOKgdopFLXPvyw54BDhSuTTgEvOXE=; b=beoW2LjzZBVPc91NFE8W5INyes
	dSRkWiZfpfiX4DbgFwYRvoytw+iQQXr4FH1GhzeXj6t2ne+1QsOqasPpHHzftCDHwSxae7LeOuSOx
	DgJf1kI/Q1fFotZzHAhzDMDMnl0RXtBwQ8Bc4ltQ+YET4JP7z3X9msDvV80vmdyun61mSNwZcfBhL
	yDqdH3un3USvomr2r8WTGg+XrxCJIhqCrx+GybOwJXsr3FkZJ+bhjupMaTQYz8rc74ztD9/JzSkno
	fEXVQDYlg572ArBtpnHCVFnmrEadc6ulSSHSqyNrnu49sKNlKt8L4mpiPcy7ELsbPaeUrgis/3fRu
	V/D0eKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucPgy-0000000AOLM-1XZt;
	Thu, 17 Jul 2025 14:34:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucNt2-0000000A8q6-1Fyr;
	Thu, 17 Jul 2025 12:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B77D2601FC;
	Thu, 17 Jul 2025 12:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5650AC4CEE3;
	Thu, 17 Jul 2025 12:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752755935;
	bh=TP5rMj9dlXv1lXfyZ6bSZIOXkMvBLOg/7AxE1E2WJ0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuLmqI2ioiVo7XkWRx+pJanQ7t8F5mGs6z6mDKw/KJowfT2Vw6JcUeAdb59TNj+G+
	 gafjIqc8fRg0jhLv1usO9YpUTMiutQIoNtRw4+FvG2ri0zgozb4Z8c9ohovj1MOXVL
	 90c8EdZw9+a+lX+B+6OKPWj2sRcASpBe0VSSKrSr3aDYhAEZudlRXdq4OO7DtdqH5m
	 xiH7NydqddFan1+iuYAKatAUcwy3Pjl4OgaPPQUszjT6B3gNlf/Hy0jRg0kkyujTXz
	 WzLPdi2FS0IpwemfY00TFFGVU0VV52+J5Wo1PaDnMjlviOYTVCcZlUHCm8ubpO2tLU
	 27DeIVFtjfTsw==
Date: Thu, 17 Jul 2025 18:08:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM STB PCIE DRIVER" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH 2/2] PCI: brcmstb: Replace open coded value with
 PCIE_T_RRS_READY_MS
Message-ID: <gghfznmeu3o6wegyr4seqxervrwsszrqvdbrusetsbvravq4cr@mcbvcwi3zh3p>
References: <20250624231923.990361-1-florian.fainelli@broadcom.com>
 <20250624231923.990361-3-florian.fainelli@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624231923.990361-3-florian.fainelli@broadcom.com>
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

On Tue, Jun 24, 2025 at 04:19:23PM GMT, Florian Fainelli wrote:
> The delay that we are waiting on in brcm_pcie_start_link() is
> PCIE_T_RRS_READY_MS, use it.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 92887b394eb4..7fa2087e85db 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1337,7 +1337,7 @@ static int brcm_pcie_start_link(struct brcm_pcie *pcie)
>  	 * Wait for 100ms after PERST# deassertion; see PCIe CEM specification
>  	 * sections 2.2, PCIe r5.0, 6.6.1.
>  	 */

We don't need this comment also since it is part of RRS definition. I'll remove
it while applying.

- Mani

> -	msleep(100);
> +	msleep(PCIE_T_RRS_READY_MS);
>  
>  	/*
>  	 * Give the RC/EP even more time to wake up, before trying to
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

