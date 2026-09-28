Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEB1CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 21:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=8omIOHhw+uZwY84ggyKbDZolc6RD3clHULLyKqCQ5H4=; b=z/vtmm/lpcxEZm
	gUfs0ZMFSqrUVcbX+lb5ugX895Nb249ILKZJT+nEwtBgLE4bchpKeyY6dJWu5kHQ5OZrew2yAV4f7
	xwmz4B8AvtQNlHL1cTkb1Ayrvt0hI0mvlRAGnekO8n2lnq4eFC207Fy7E8o0L8MebrnpM6NnoOKyJ
	kh82UPPb+KiwGVNNO5vEWm+fKh921RVEXnhMvJqutWsKJMZ7ZtrayzXwP1rO1YlIpII+O46b6Y8xC
	OXcug+c8iwT7sNqKl6sjdeBB13BBn2hiAHsELS4ow13bGIzio7eLZQ9yDfYToMUUvzBBspfQ6nPME
	SrF9yj2vphDu7Dk5zV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJFi-00000001iHw-0knv;
	Mon, 28 Sep 2026 21:51:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJFh-00000001iHY-08Ew;
	Mon, 28 Sep 2026 21:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 066BA60219;
	Mon, 28 Sep 2026 21:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E961F00898;
	Mon, 28 Sep 2026 21:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790632271;
	bh=8omIOHhw+uZwY84ggyKbDZolc6RD3clHULLyKqCQ5H4=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=I6Avh3cjEKRwD9CabIrOhx9ysMlXH8SxulnHRCFe9AGF3GpLfHLPDI86yu6BE9yiK
	 xrcDpTUPHThX3Nba7GaBRLnOntDkIRZImQgFOiHMYqfRFuoPdH6LqqdLERewePmUDZ
	 VT9flbNSKsNTClvkLK5PfhZcqPDUxhH8WnKLu+5F3ZXSVc3Nj4li6GU/HxcoathddL
	 iRE0idYGJtkcPgvaVmrmjAE/ALJNWC7XhGogquYF4bYTeLBhu665rRmXY4+kcRcbCa
	 IRQI98ieNBG3SKokpLxosPgO6xP47mtQXuNR8MTbzMcu2MIzaoZz5nkl+06XTPuKnx
	 rjlan8ve1mp+w==
Date: Mon, 28 Sep 2026 16:51:10 -0500
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
Message-ID: <20260928215110.GA2266447@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928215007.GA2264960@bhelgaas>
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

On Mon, Sep 28, 2026 at 04:50:09PM -0500, Bjorn Helgaas wrote:
> On Sat, Sep 12, 2026 at 12:25:36AM +0800, Hans Zhang wrote:
> > The DWC PCIe register and field macros are inconsistently named and
> > often do not match the Synopsys DesignWare PCIe Controller Reference
> > Manual.  This makes it harder to cross-reference the code with the
> > documentation when debugging or maintaining the driver.
> 
> > +#define  PORT_AFAC_L0S_ELS		24		/* L0s Entrance Latency shift */
> > +#define  PORT_AFAC_L0S_ELM		GENMASK(26, 24)	/* L0s Entrance Latency mask */
> > +#define  PORT_AFAC_L1_ELS		27		/* L1 Entrance Latency shift */
> > +#define  PORT_AFAC_L1_ELM		GENMASK(29, 27)	/* L1 Entrance Latency mask */
> 
> Surely we don't need both the shift and the mask?  Maybe a separate
> patch convert to FIELD_PREP()?

Oops, sorry, didn't notice that Mani had already applied these.  This
could be material for follow-on patches.

> > +#define  GEN3_CTRL_RATE_SHADOW_SEL_SHIFT 24		/* Rate Shadow Select shift */
> > +#define  GEN3_CTRL_RATE_SHADOW_SEL_MASK	GENMASK(25, 24)	/* Rate Shadow Select mask */
> 
> Ditto.
> 
> > +#define MSIX_DOORBELL			0x948
> > +#define  MSIX_DOORBELL_PF_SHIFT		24
> 
> Probably would be better to define a mask so we have the position
> *and* the width.
> 
> > @@ -621,15 +621,15 @@ static inline u32 event_counter_prog(struct tegra_pcie_dw *pcie, u32 event)
> >  	u32 val;
> >  
> >  	val = dw_pcie_readl_dbi(&pcie->pci, pcie->ras_des_cap +
> > -				PCIE_RAS_DES_EVENT_COUNTER_CONTROL);
> > +				RAS_DES_EVENT_COUNTER_CONTROL);
> >  	val &= ~(EVENT_COUNTER_EVENT_SEL_MASK << EVENT_COUNTER_EVENT_SEL_SHIFT);
> >  	val |= EVENT_COUNTER_GROUP_5 << EVENT_COUNTER_GROUP_SEL_SHIFT;
> >  	val |= event << EVENT_COUNTER_EVENT_SEL_SHIFT;
> >  	val |= EVENT_COUNTER_ENABLE_ALL << EVENT_COUNTER_ENABLE_SHIFT;
> 
> Probably a good chance to convert these to FIELD_PREP() etc. as well,
> maybe in a separate patch.

