Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2382DCA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7MxyfVUmcact8Av7EhfeX6cj39M4hc4P2lmgVVGpq/Q=; b=Va4crTcPP0JSjf
	8uHG5YlsHUn2oHvggmhTjna7nzETA4WoR0ydmnoRnFRfdHM3TCeSkxNWEYBwtcuUkPbQHe0H+DHxO
	6M6kS3UNmqcXEGxE3b26+NlxCIBDeqkI5sGJCxKVcJ/1roEYGbe8ukKOpGhClZCVfOoYpySsO9s7E
	6TlTA250aJ0eib/qRD6++7YBfqNHi1g3g1jP1oU+HOT36+5BsQXHsfDUfUIrSslwggjS1mjL3mRqJ
	br2VDc9bwTpUZoH0fZTnIO+bouhsVKHZiu7glEo8MvglgztOQxsbFm2giTfhIENO63aVj/AR26Am+
	wUiwyKdULdCyIQhEa7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJEg-00000001hzt-3GbB;
	Mon, 28 Sep 2026 21:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJEf-00000001hzG-2uCX;
	Mon, 28 Sep 2026 21:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F9FB40988;
	Mon, 28 Sep 2026 21:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87CE1F000FF;
	Mon, 28 Sep 2026 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790632209;
	bh=7MxyfVUmcact8Av7EhfeX6cj39M4hc4P2lmgVVGpq/Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=YD/tJ8glnvDxae6cHN7UN4ZZm7fAUj8v1wCP3ZSjJ5TpZQrDekpIQOt1FMVwHHYmI
	 v4rcz3NQjeQha4y6Q9gH0lxajjFHHoZA4wyljDt/2urG1stOXUCjLyFvbU9B0Rspri
	 kFDIldH8LIChWzLQ1FBK47bZMdIW4ITAbUQRkgy07rqAEESNlc7p6tDyx8WcHJejHU
	 RSj3EYAfbBsUSAXTTv2fBuZjnha3MrsLM3WD5X1A3qbFr0sGQoopmwmUi4RQVCQFjJ
	 ZI03syYiOh8vd/ZgdW87gryjOTm7kFYP5yCGeVBR58ePFV3/lw6+saUrcSoepDA9Hu
	 DOQWgFnblUkcQ==
Date: Mon, 28 Sep 2026 16:50:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, cassel@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Feizhou Yu <yufeizhou201@163.com>
Subject: Re: [PATCH 1/2] PCI: dwc: Align register macros with Synopsys
 documentation
Message-ID: <20260928215007.GA2264960@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911162537.469018-2-18255117159@163.com>
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

On Sat, Sep 12, 2026 at 12:25:36AM +0800, Hans Zhang wrote:
> The DWC PCIe register and field macros are inconsistently named and
> often do not match the Synopsys DesignWare PCIe Controller Reference
> Manual.  This makes it harder to cross-reference the code with the
> documentation when debugging or maintaining the driver.

> +#define  PORT_AFAC_L0S_ELS		24		/* L0s Entrance Latency shift */
> +#define  PORT_AFAC_L0S_ELM		GENMASK(26, 24)	/* L0s Entrance Latency mask */
> +#define  PORT_AFAC_L1_ELS		27		/* L1 Entrance Latency shift */
> +#define  PORT_AFAC_L1_ELM		GENMASK(29, 27)	/* L1 Entrance Latency mask */

Surely we don't need both the shift and the mask?  Maybe a separate
patch convert to FIELD_PREP()?

> +#define  GEN3_CTRL_RATE_SHADOW_SEL_SHIFT 24		/* Rate Shadow Select shift */
> +#define  GEN3_CTRL_RATE_SHADOW_SEL_MASK	GENMASK(25, 24)	/* Rate Shadow Select mask */

Ditto.

> +#define MSIX_DOORBELL			0x948
> +#define  MSIX_DOORBELL_PF_SHIFT		24

Probably would be better to define a mask so we have the position
*and* the width.

> @@ -621,15 +621,15 @@ static inline u32 event_counter_prog(struct tegra_pcie_dw *pcie, u32 event)
>  	u32 val;
>  
>  	val = dw_pcie_readl_dbi(&pcie->pci, pcie->ras_des_cap +
> -				PCIE_RAS_DES_EVENT_COUNTER_CONTROL);
> +				RAS_DES_EVENT_COUNTER_CONTROL);
>  	val &= ~(EVENT_COUNTER_EVENT_SEL_MASK << EVENT_COUNTER_EVENT_SEL_SHIFT);
>  	val |= EVENT_COUNTER_GROUP_5 << EVENT_COUNTER_GROUP_SEL_SHIFT;
>  	val |= event << EVENT_COUNTER_EVENT_SEL_SHIFT;
>  	val |= EVENT_COUNTER_ENABLE_ALL << EVENT_COUNTER_ENABLE_SHIFT;

Probably a good chance to convert these to FIELD_PREP() etc. as well,
maybe in a separate patch.

