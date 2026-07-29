Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E162C53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qn9MseQaABDq0jzuTJTTFvGuBz93H8dXrHhwqUAhtA=; b=z9vmoK7MjCHzBAMjhC70uy3PRO
	nUIvwTNRGr0q9BqqYZ2j2I3ULFKMLBuCaCdsLCfBWlisC4SHYzlcQ5dDQWx4fSIevfZl9MwZKpmSE
	vNaJzUT5w39c4ZRUvVLCRbv8w5WexiV61lDELeOp60nsbSGnllp/eBe7Wxx7EkVysjufDE4azitfC
	jNEZ0OXiL+iqURmvGVwKEn5ROwMgAfsY8RI/wVqpSRlifSn9s8Zja+82Ltgn1dkd0bIRVyn0qpkA4
	eUcDuvJVzFE6zcwGjCophEAGqdCQDNBl4qrnvCt+6B7GQSU7yWIHZZ+qv60SA/owvg75Ig4x4EEGt
	Ki315P7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7ek-00000008dW3-1Hne;
	Wed, 29 Jul 2026 17:01:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7ei-00000008dVe-1K75
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 17:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5572402D1;
	Wed, 29 Jul 2026 17:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C301F000E9;
	Wed, 29 Jul 2026 17:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785344479;
	bh=0qn9MseQaABDq0jzuTJTTFvGuBz93H8dXrHhwqUAhtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nv+igihFdvPZ39GrgKyFl313gXd3lhyix7DoUQnwNp2U9jPHWkV/0q5vBdIO5EE++
	 8DyO7e3+EI9srapuB6lyiLLIvqgGtr+9tPCzWgN3QigGpQxsssVKIhYkTK1lHAQYoh
	 EY9VOO1yRWp2Em1UAlrpjVSLas4CWmx4f7SdSG+3Dk67Op3DABx5/4TwH7fRkag1fg
	 B1E0dOKNHtGHiKkkjjabdmtDqVfvl557P8pEpBpepyMFJCwNq3e6J5sx9jSW3fu3+0
	 OqgZCXbEV+i8z+ft6CTnvEJn7JFU/1zT5W9hXrfgjRDvkjGB9Wen4S/1PQcOnHkYnW
	 9Xw55k0exIdHw==
Date: Wed, 29 Jul 2026 19:01:09 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Michal Gorlas <michal.gorlas@9elements.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: imx6: enable ASPM L1 only iff CLKREQ# is supported
Message-ID: <t2zu6bv4dqf5znpn5uypkoieltlrzlp4kskt6jwp46xgqajhjp@6g5kiwwn72a4>
References: <20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com>
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

On Sun, Jul 19, 2026 at 02:47:54AM +0200, Michal Gorlas wrote:
> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
> states for devicetree platforms"), ASPM states are force enabled
> on all devicetree platforms. This causes PCI devices on some iMX SoCs
> (for e.g. iMX 8M Plus Kontron SMARC eval carrier) to enter L1 even
> though CLKREQ# is not supported (and consequently supports-clkreq is
> not set in pcie controller node of their DT), which causes the device to
> never wake up from L1.
> 
> Hence, disable L1 capability in the LINKCAP register if supports-clkreq
> is not set in the DT explicitly.
> 
> Note, the logic here is very similar to 613f3255a35a, only difference
> is that leaving L0s enabled does not cause issues (at least
> I never encountered them myself when testing on the device) as its
> not dependent on CLKREQ# being physically there.
> Since there is already a way of specifying its presence in the DT,
> the driver should be aware and disable L1.
> 
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 98e1db751132..7471501fbf04 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
>  	}
>  }
>  
> +static void imx_pcie_disable_l1(struct dw_pcie *pci)
> +{
> +	u32 val;
> +	u8 offset;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	imx_setup_phy_mpll(imx_pcie);
>  
> +	if (!imx_pcie->supports_clkreq)
> +		imx_pcie_disable_l1(pci);

Sashiko raised a valid issue here:
https://patchwork.kernel.org/project/linux-pci/patch/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com/#27076171

IMX_PCIE_FLAG_BROKEN_SUSPEND is only set for i.MX6Q, but none of its DTs have
'supports-clkreq' property. So this patch will impact them also and since they
do not reinitialize the hardware fully in resume(), ASPM settings will reset to
hardware default.

It'd be good if NXP folks could share their thoughts on this!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

