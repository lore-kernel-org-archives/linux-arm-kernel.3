Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F04CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZmZ5xxbOr0lmpbYTVHgta00MoKE8u0jmnbBBfQh+64M=; b=UJ6IyyFw2pO2rjOPa5/E7xB8z1
	dxjSngBw34xCSX/fhJMGijmd7d3GQVEqomKG2qcJMny7sgNbJWs87UXP0KSrLsznsrU+yYQ8WltvE
	2q5kXNSJ4dVqXUZ4DpSkNUFFMjif8AiWYiaKqv7IGCpcnALxMpCyOkaxGp/3FSia5BHOGeTH2uvHe
	Fa156IgrMcNnQA56aMyD9prDXegutsdK6JnmA6tSoASK6ig7JBYO8Z7tiX8tRdhvdkWdsA7J0HxkP
	7ln0bY/Jc2ZMoX+WCTfY1mYwmETYIl/5HU5UZlAlbib9s8TS2d18cnEpp+MVuiiuaus2W2qEZYwsu
	FPNIEDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGsp-00000009h2C-1PaI;
	Tue, 19 Aug 2025 07:35:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGF6-00000009afQ-0jy0;
	Tue, 19 Aug 2025 06:54:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95731613AE;
	Tue, 19 Aug 2025 06:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A753C4CEF4;
	Tue, 19 Aug 2025 06:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755586487;
	bh=wUbzQ4SJ7Ro2oQeXth1wUKV8brsS8CkANEiQqLaVHGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDdXXaR3QrP+hpd7RE96ZNu1OMV8d+eV9sgHgoJkHqmZLOUgk4qMDgEYASs9z0Hcm
	 LZrn0B0gjVnWSRUR8b99N3m0DMx2wf5Vwkgi9O3pdlSrvAfhiOpQiUYQ4JP4VIYC7b
	 lqKHzcj0A+Y/WYbDJIs0aZmF+ezc6QycG71AgszoRFBYqiO+vH9BrCwBnPaitlDQqS
	 Z+IYtwtvdA4PoFTeH2VZUNlYh3CmMSysWsRKZkOczR7LFJ3b6VA7OKdEOpaNk8hwbS
	 LNxMgq0j9XVNSdrPJWvyOgD0S1avyKTPbFa97vh/sOAcQFBGYunYlp4ia4z3NQFJLm
	 aTuGGql9kJ4Ig==
Date: Tue, 19 Aug 2025 12:24:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org,
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com,
	igor.belwon@mentallysanemainliners.org, m.szyprowski@samsung.com,
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com,
	muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v5 6/6] phy: exynos5-usbdrd: support SS combo phy for
 ExynosAutov920
Message-ID: <aKQfsgRXL-Nj8CkC@vaman>
References: <20250805115216.3798121-1-pritam.sutar@samsung.com>
 <CGME20250805114323epcas5p39bf73c5e0a9382ff54b1832724804cc9@epcas5p3.samsung.com>
 <20250805115216.3798121-7-pritam.sutar@samsung.com>
 <aJtN7uVUV3YhfY5-@vaman>
 <038a01dc1013$900a2800$b01e7800$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <038a01dc1013$900a2800$b01e7800$@samsung.com>
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

On 18-08-25, 13:11, Pritam Manohar Sutar wrote:

> > > +	/* check cr_para_ack*/
> > > +	cnt = 0;
> > > +	do {
> > > +		/*
> > > +		 * data symbols are captured by phy on rising edge of the
> > > +		 * tx_clk when tx data enabled.
> > > +		 * completion of the write cycle is acknowledged by
> assertion
> > > +		 * of the cr_para_ack.
> > > +		 */
> > > +		exynosautov920_usb31drd_cr_clk(phy_drd, true);
> > > +		reg = readl(reg_phy +
> > EXYNOSAUTOV920_USB31DRD_PHY_CR_PARA_CON0);
> > > +		if ((reg & PHY_CR_PARA_CON0_PHY0_CR_PARA_ACK))
> > > +			break;
> > > +
> > > +		exynosautov920_usb31drd_cr_clk(phy_drd, false);
> > > +
> > > +		/*
> > > +		 * wait for minimum of 10 cr_para_clk cycles after phy reset
> > > +		 * is negated, before accessing control regs to allow for
> > > +		 * internal resets.
> > > +		 */
> > > +		cnt++;
> > > +	} while (cnt < 10);
> > > +
> > > +	if (cnt == 10)
> > > +		dev_dbg(dev, "CR write failed to 0x%04x\n", addr);
> > 
> > Not error?
> 
> This is only for debugging purpose. It is not considered as error. 

Write failed is not an error? If this code is only for debug, pls drop
it. 

-- 
~Vinod

