Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF89CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fsfmKBk5yVVV3knscki7WcQo0RY8I2BdLIFlgtqHz8=; b=Z60ikPOdV9Qa8tMbfOGEv4i7fA
	TPuZ3qtfUw05y0UZIfLMoOKPGcqsDdJrvDQsHVCT/8TfRUwITQCvJsyEr4IZnR1iCs7qORsrcxU3T
	veOQf3eJW0/WNKfAUZtn2k+SYngSIAN+JTOjwFq93xo6uqUTRIk0H8hPWn/ICOBQn+/IrwVAAZuUH
	v7aJEpkVfVyPzZHSOhtHgjvCeWZb/98sKyBSeWL2HC8Zh5iiJ26TfKSPv3rF82wVX7FCkIlJRk9aB
	Hr9KnsaAdmPXjvniSM9i6gKVHxxHYl6V5kW3P3JiSoc6WmlslZ93Z7uH/cJXbVvzPDAj1wbssIm+C
	Hu67s5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgsQ-0000000FoXa-1ed6;
	Tue, 12 May 2026 06:45:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgsP-0000000FoXB-0YEH;
	Tue, 12 May 2026 06:45:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95BAA60055;
	Tue, 12 May 2026 06:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200A9C2BCB0;
	Tue, 12 May 2026 06:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778568356;
	bh=VAAooZdAHq7yxsPkipwHQqbk+GRu3Iwv5qRj77qUp6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rBl4oMHC/xeme2LpC+JsDfFlC4qgcElZlHpVcAhdFgdYBJmo7FLPtGzHhJMw6v/Qv
	 ncrHHgnpXxabPJ995QP/ITM2pOqsEJjC8BKAeqfW8tt7V5bMI2iS0FxQeJzX3zpvTq
	 ByfBrngaxg7wPt9Yp/nZ+b+PgP33NqZWMKrFfS9WaqdvHAKpFIR/i+M/vOf2WDFgZ/
	 G/nPcberearmfWnTsVVHyAPhoJ0JAvj6aWjsWrq4Qm1PVrUyTrQ7VcveNjMOGiHO8m
	 x70pgldCKqhwspmPyCZylPc0SUzIGP0+XF4doUU7cceDOh0PVv206oSbq31QGWmCSb
	 s9tXrKK5IpsJQ==
Date: Tue, 12 May 2026 12:15:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Hans Zhang <18255117159@163.com>, bhelgaas@google.com, 
	lpieralisi@kernel.org, vigneshr@ti.com, jingoohan1@gmail.com, 
	thomas.petazzoni@bootlin.com, pali@kernel.org, ryder.lee@mediatek.com, 
	claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com, robh@kernel.org, s-vadapalli@ti.com, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, claudiu.beznea@tuxon.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: dwc: Use common
 pci_host_common_link_train_delay() helper
Message-ID: <6xcq6e6c2jc7wxhvv3kjwp5d2ik62ed7kukb3e62yogf3phtxk@6besox4h2v4n>
References: <20260511055923.37117-1-18255117159@163.com>
 <20260511055923.37117-5-18255117159@163.com>
 <20260511070139.GA1096586@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260511070139.GA1096586@rocinante>
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

On Mon, May 11, 2026 at 04:02:42PM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > -	/*
> > -	 * As per PCIe r6.0, sec 6.6.1, a Downstream Port that supports Link
> > -	 * speeds greater than 5.0 GT/s, software must wait a minimum of 100 ms
> > -	 * after Link training completes before sending a Configuration Request.
> > -	 */
> > -	if (pci->max_link_speed > 2)
> > -		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> > +	pci_host_common_link_train_delay(pci->max_link_speed);
> 
> This comment could move to the helper you added.
> 

Not required, as the macro definition in drivers/pci/pci.h already has an
elaborative comment with spec citation.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

