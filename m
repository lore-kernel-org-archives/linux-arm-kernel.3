Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD15CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 07:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIUZDZ577q+8ZtKPWDIuP8/Il60PG9q6+YjLVEbA9r8=; b=aZXbsIST2R46EK9rEl5Eo34TDP
	sdr9DTq2cBhDAYRRmbPDiD5OK/FRFKJ4rFHAyqhX122IpIexigtgfHZvorOY3RybWhhoVeI0WwmIv
	d9LaYvpuZ+/Xw3o1cyP9wiSz7vOSTQgnFDP+17QwH3mVpV5CrhHTZXpodWuzpXZ3gC175sl9N25fp
	pB4gxSladee2aM/Vqlhz9hnV3pdnns7OE6umKTpVPgb8aogfhsH+Ml/k/xf65d+K72lF2kcOikp2u
	I1pAOP2olg+/EucojDq3go0wnz5wcpmUVFnFl7bVT0POneV4okEA/lqek+JheXEonI0arI0PT9U09
	WSTUjFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzs7F-00000004wer-0k7N;
	Sat, 20 Sep 2025 07:34:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzs7D-00000004wej-0ysx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 07:34:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 414C86013C;
	Sat, 20 Sep 2025 07:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9DFC4CEEB;
	Sat, 20 Sep 2025 07:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758353678;
	bh=JtIlPe6rz/IHPgJuGnOZzbz0njTxpzBV+gVWBopV4BE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qdMSWocCNpc+vEIBPvcu7BtVdSgtQX370EVlr9nt99csMhrwP4WWnXf8844GgLduA
	 Dqfm5gfq5sZW1qqHDAOhoVIsHeaD4at3pL7+l5vcr9uUC/upchpKGDDWPd832zy9au
	 /my/FJqOOKQGkgL4CNPLoQ+wclr9SMqeQtDxNTQBPQrc1RuatWlPsOLPBc/b+TWPi3
	 f2Xmzc6WF9uJ3h6T5zwUcC1PFeqqy0bYf6uNMpAWWH6il3GFpWYiptkBoodftgHW5t
	 i9Dsgbo99YixfGdiYcjqd4pGbFs6G1CRu3z3zANap9Cozjjx+h7QD3u39U5p+SqRof
	 OXvXP4+Jl/OVg==
Date: Sat, 20 Sep 2025 13:04:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] PCI: imx6: Add a method to handle CLKREQ# override
Message-ID: <wbfsxrvwb4ky3irnwm5vohmwyek3c4uskxg3dnfzrfadyx4aay@5udf6eht3cdj>
References: <20250917093751.1520050-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917093751.1520050-1-hongxing.zhu@nxp.com>
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

On Wed, Sep 17, 2025 at 05:37:49PM +0800, Richard Zhu wrote:
> The CLKREQ# is an open drain, active low signal that is driven low by
> the card to request reference clock.
> 
> But the CLKREQ# maybe reserved on some old device, compliant with CEM
> r3.0 or before. Thus, this signal wouldn't be driven low by these old
> devices.
> 
> Since the reference clock controlled by CLKREQ# may be required by i.MX
> PCIe host too. To make sure this clock is ready even when the CLKREQ#
> isn't driven low by the card(e.x old cards described above), force
> CLKREQ# override active low for i.MX PCIe host during initialization.
> 
> The CLKREQ# override can be cleared safely when supports-clkreq is
> present and PCIe link is up later. Because the CLKREQ# would be driven
> low by the card in this case.
> 
> Main changes in v2:
> - Update the commit message, and collect the reviewed-by tag.
> 
> [PATCH v2 1/2] PCI: dwc: Invoke post_init in dw_pcie_resume_noirq()
> [PATCH v2 2/2] PCI: imx6: Add a method to handle CLKREQ# override
> 

Patch 2 is not applying on top of 6.17-rc1. Please fix it and resend the series
(along with the CEM 4.0 citation suggested by Bjorn).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

