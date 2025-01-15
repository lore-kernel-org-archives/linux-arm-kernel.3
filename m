Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=kylrDWTKAofaWPauOd8gN/7/6rPc3D3DULGcZALKUB0=; b=CicI5Tl534Nes+2mFpatv5ymOk
	/orCCsjVujJxoYtRr57j33m4+o3T+fiYmiXRUzbwdwDFojMtSZksLF19rzFiaphgJhr+lZjPTl0w4
	22klmysy2mcSIy1K/Zd7B38mwUuoGfMgXuXOkyQbR7iwyuyqQjq0NgSPeTOFSWcDbKRcmGWlt97+w
	49SJKnTNNech4HH8oNnuQ7nHXaiz2CeapiLLmdPDZTIySBZdjlgZSEoOD9rUPu76edqqfAXwNfe//
	MpV7m9dJ3TQzq5FtPltsZPvFPFX+0IuVvH0/dJdSSEYqaycy+NIHXzBV0ni/9xiOs5bhs90rB0ysX
	hEzLy+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7We-0000000Cezp-0qcm;
	Wed, 15 Jan 2025 17:49:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7VN-0000000CemJ-0OmV;
	Wed, 15 Jan 2025 17:48:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C4ADF5C5DB3;
	Wed, 15 Jan 2025 17:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF20C4CED1;
	Wed, 15 Jan 2025 17:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736963316;
	bh=nEpsi2Yg2uzElK6pn63lsWLWfMq1/r33gPIr0bj4FDY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=pR6bUyQNjMdTUloG+A+LFhM0r1HPHTFHf18a+LYr7WmvgOV78YR0sCLHzGn+Sfg8e
	 odv4JyCWpMlxio4KNaiDMnuJZqYndCmAOL4ESppJyHiHZc4B+76s9F/crzBA7ecNLi
	 Lx0vqC9+snUKwBdyRQ9/WTd8A6zoQxCWSeHN+4RUzoIRfYLHWUVTlspWT4f0Y5HTXC
	 LfLNxiEqRZU7vJ8qyIhokO5/f77Rzp3nyz2+mnnNvinQ68gPBNvYxMsJc+2/iSPMSQ
	 YAZVGljXNddAPfVsqapDhe41yE9HE4t3AuDzf3jcpq+fUjx1oBKCdInys/cHfjJc2Z
	 sASzwyinBTvVA==
Date: Wed, 15 Jan 2025 11:48:34 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Dan Carpenter <dan.carpenter@linaro.org>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next v1] PCI: rockchip: Improve error handling in
 clock return value
Message-ID: <20250115174834.GA538101@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250115174012.bdny6nxxr4tuzyis@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_094837_176235_F78F6D15 
X-CRM114-Status: GOOD (  19.49  )
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

On Wed, Jan 15, 2025 at 11:10:12PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jan 06, 2025 at 09:00:38PM +0530, Anand Moon wrote:
> 
> Subject should include the word 'fix' not 'improve'
> 
> > Updates the error message to include the actual return value of
> 
> s/Updates/Update (imperative form)
> 
> > devm_clk_bulk_get_all, which provides more context for debugging
> > and troubleshooting the root cause of clock retrieval failures.
> 
> Btw, it is not just updating the error message, it also returns the
> actual error code.

Already squashed into
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=abdd4c8ea7d7,
sorry I didn't mention that here.

> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202501040409.SUV09R80-lkp@intel.com/
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/pci/controller/pcie-rockchip.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.c b/drivers/pci/controller/pcie-rockchip.c
> > index fea867c24f75..ca6163f9d2dd 100644
> > --- a/drivers/pci/controller/pcie-rockchip.c
> > +++ b/drivers/pci/controller/pcie-rockchip.c
> > @@ -99,7 +99,8 @@ int rockchip_pcie_parse_dt(struct rockchip_pcie *rockchip)
> >  
> >  	rockchip->num_clks = devm_clk_bulk_get_all(dev, &rockchip->clks);
> >  	if (rockchip->num_clks < 0)
> > -		return dev_err_probe(dev, err, "failed to get clocks\n");
> > +		return dev_err_probe(dev, rockchip->num_clks,
> > +				     "failed to get clocks\n");
> >  
> >  	return 0;
> >  }
> > -- 
> > 2.47.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்

