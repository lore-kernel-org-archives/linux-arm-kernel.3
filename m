Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C13C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxBXfMtcKRvrQeVKDfoUPC38HNlFRNh6TcunHy0YRxo=; b=uT7hJ0WJoRDelOLVQLu8LaPa9G
	bnzXYHS6x1sK7QtJwVyRsNHM2DAj3lg7O53oQGeHhi8BUFtzUmUHccQipf1yCshVn8RUeqihEg6s2
	TsPdIgqTowpOrjXEC6fZbtuiF9oMyiUCIMIhmQEjN79C3RPrTRZZ3WdxGnzakLgFgblOtP+aKTtNn
	nOt8tOS/oM3gCx1snrmoz38NXRiodLO2ApELuPjx9FjpZO66FFY8y5adFElk7zmYgyzcOhDHsE1Ie
	35O/vcXRvEwLfp03E3FplR8UEocikfWdLQ68nXv5R/FBarYx3DaG5vHWDkeAV1fVjZCvyurYrVepR
	MFOy25sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxl2-00000008nXY-19rB;
	Mon, 19 May 2025 10:30:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGxhL-00000008mvp-1BfO;
	Mon, 19 May 2025 10:26:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFE1743843;
	Mon, 19 May 2025 10:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFABC4CEE4;
	Mon, 19 May 2025 10:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747650378;
	bh=5XJLyhON1/d4lmJMf9H9JBAk4IO2dMXjKblgm7tDsTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrjkC4jLTEY09WWU7DbzFbDKsTf2vfsoiurlW5GQpA8lW4wZieMbyz7hD7GG57Ouy
	 FT0QqD/khdk8QANA1o0+lVGWCtYc+rc8oyd+PXp97gH/TV/KekOaHbYHSB/Ql5+M/A
	 iHVLigXMebahcMwzzFjuZtCphn8LGYGRz/QyAy+lD1DdyvWviU0XDcq+EWIhRQ8Sx7
	 yv+lfSgA/4muDApTzX80TY5szCFmeRBiK2K/UauuCdkEWiL1epEkohwvtdKjTfifLq
	 owiMqiUdxVPmninjhfHEcl81mRnWRbfvVOYMprLW4RgAjvSEHOGNgTfW6Yx/K5yzxl
	 O+TI5tbEZOZTQ==
Date: Mon, 19 May 2025 12:26:12 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.or, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, jingoohan1@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, vkoul@kernel.org,
	kishon@kernel.org, arnd@arndb.de, m.szyprowski@samsung.com,
	jh80.chung@samsung.com
Subject: Re: [PATCH 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <aCsHRJL3vP17FzZo@ryzen>
References: <20250518193152.63476-1-shradha.t@samsung.com>
 <CGME20250518193300epcas5p17e954bb18de9169d65e00501b1dcd046@epcas5p1.samsung.com>
 <20250518193152.63476-10-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518193152.63476-10-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_032619_340954_1D665FF2 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, May 19, 2025 at 01:01:51AM +0530, Shradha Todi wrote:
> Add host and endpoint controller driver support for FSD SoC.
> 
> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
> ---

(snip)

> +static int fsd_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> +				 unsigned int type, u16 interrupt_num)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +
> +	switch (type) {
> +	case PCI_IRQ_INTX:
> +	case PCI_IRQ_MSIX:
> +		dev_err(pci->dev, "EP does not support legacy IRQs\n");

Here you will print the same message for both INTX and MSIX.
Perhaps MSIX should have a separate print?

In fact, perhaps you want to call dw_pcie_ep_raise_intx_irq()
for case PCI_IRQ_INTX, since that function already has an error print.


Kind regards,
Niklas

