Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6662C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=9PpLAmlVlF9OS23aNEdqjhdheyxdlZUSHrVUUvaa8qQ=; b=p/PqIcx30QaJhf
	5XqHE7myoNKoHJECW7ydQwiivFai0vHBQPEQD/GK2OsjmgFafq9Mxy95YRPiwmAbw+V5QG0Rg2jbg
	z8CbNxw7GBOh17HYW9yn94EG9470cEjhlMs5FhHeqITleQrtcwRq+48sCDKBBY/4oQsehxu0BlHiY
	EwheV+xSjK2XFpjVH/Hd1YLFSTc4/bdsUceJqCU66oT/9hAol1HgnVWtCM/NYG6klhjhjebZ4i0NH
	x68SIN4GU8MLjdBodfuB6JFVJGptQBF4JhUi+goJtUiWJOjv7SeMlO86kulVbXRtAxbW+ad7JwJSn
	pawzfpomGTqaly8KxSww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPTLp-0000000BOy5-3Jwa;
	Wed, 11 Jun 2025 21:51:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRLi-0000000AyXk-1r3s;
	Wed, 11 Jun 2025 19:43:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D887C61135;
	Wed, 11 Jun 2025 19:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADCFC4CEE3;
	Wed, 11 Jun 2025 19:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749670981;
	bh=7+2javrPWqSAk9Zpl9AulQcOQIGGbbbbRurwg6AeHZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HGkXm5jzFWs8lo2Rxe8xrG+ZpRTKtZMg2tULoy/ewNWO8y6xjTiELmi991KtFgw5d
	 0nvDZJkeQ9A7qRRbbUGOweTehA+Y6k1CAWNsVG90DiKNgwX49/9auuWJfCOKpOy/f4
	 s7BeJKzk1z0BrLGu5yXMNt8lGkuTWPJwKJjjpkSvaPAru11qBYugvEU9fnH2eauqmR
	 26P+STx7gehj/DYz8AGFoPjhJUIGuY/oqkJuxs7wSOdG+fyahFaDe8EWLTtVYUmmVJ
	 tJuPwveYHN1W1PzhNpIP6obWHuujk8J+eZFX947mcvr2Go5YPzcyRJ49Ulbt49iQrN
	 wEk3iYgr8vqig==
Date: Wed, 11 Jun 2025 14:42:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/4] PCI: pcie-rockchip: add Link Control and
 Status Register 2
Message-ID: <20250611194259.GA825364@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ae3286f3217881ae6ea3aecad47ae4567d6ec7.1749588810.git.geraldogabriel@gmail.com>
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

On Tue, Jun 10, 2025 at 06:19:49PM -0300, Geraldo Nascimento wrote:
> Link Control and Status Register 2 is not present in current
> pcie-rockchip.h definitions. Add it in preparation for
> setting it before Gen2 retraining.
> 
> While at it, also reference other registers from offset at
> Capabilities Register through standard PCI definitions. Only
> RC registers have been touched, although in principle there's
> no functional change.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> ---
>  drivers/pci/controller/pcie-rockchip.h | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index 5864a20323f2..90d98aa8830e 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -155,17 +155,19 @@
>  #define PCIE_EP_CONFIG_DID_VID		(PCIE_EP_CONFIG_BASE + 0x00)
>  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
>  #define PCIE_RC_CONFIG_RID_CCR		(PCIE_RC_CONFIG_BASE + 0x08)
> -#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_BASE + 0xc4)
> +#define PCIE_RC_CONFIG_CR		(PCIE_RC_CONFIG_BASE + 0xc0)
> +#define PCIE_RC_CONFIG_DCR		(PCIE_RC_CONFIG_CR + PCI_EXP_DEVCAP)

I would really like to see PCI_EXP_DEVCAP referenced in the source
where we currently use PCIE_RC_CONFIG_DCR.  That way, cscope/tags/grep
will find the actual uses of PCI_EXP_DEVCAP, not just this #define of
PCIE_RC_CONFIG_DCR.

Something like this:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pci-mvebu.c?id=v6.15#n265

>  #define   PCIE_RC_CONFIG_DCR_CSPL_SHIFT		18
>  #define   PCIE_RC_CONFIG_DCR_CSPL_LIMIT		0xff
>  #define   PCIE_RC_CONFIG_DCR_CPLS_SHIFT		26

Also use PCI_EXP_DEVCAP_PWR_VAL and PCI_EXP_DEVCAP_PWR_SCL here if
possible.  And FIELD_GET()/FIELD_PREP(), which avoid the need to
define _SHIFT values.

I would do a pure conversion patch of the existing #defines.  Then I
suspect you wouldn't need a patch to add the Link 2 registers at all
because you could just use the #defines from pci_regs.h.

> -#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_BASE + 0xc8)
> +#define PCIE_RC_CONFIG_DCSR		(PCIE_RC_CONFIG_CR + PCI_EXP_DEVCTL)
>  #define   PCIE_RC_CONFIG_DCSR_MPS_MASK		GENMASK(7, 5)
>  #define   PCIE_RC_CONFIG_DCSR_MPS_256		(0x1 << 5)
> -#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_BASE + 0xcc)
> +#define PCIE_RC_CONFIG_LINK_CAP		(PCIE_RC_CONFIG_CR + PCI_EXP_LNKCAP)
>  #define   PCIE_RC_CONFIG_LINK_CAP_L0S		BIT(10)
> -#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_BASE + 0xd0)
> +#define PCIE_RC_CONFIG_LCS		(PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL)
>  #define PCIE_EP_CONFIG_LCS		(PCIE_EP_CONFIG_BASE + 0xd0)
> +#define PCIE_RC_CONFIG_LCS_2		(PCIE_RC_CONFIG_CR + PCI_EXP_LNKCTL2)
>  #define PCIE_RC_CONFIG_L1_SUBSTATE_CTRL2 (PCIE_RC_CONFIG_BASE + 0x90c)
>  #define PCIE_RC_CONFIG_THP_CAP		(PCIE_RC_CONFIG_BASE + 0x274)
>  #define   PCIE_RC_CONFIG_THP_CAP_NEXT_MASK	GENMASK(31, 20)
> -- 
> 2.49.0
> 

