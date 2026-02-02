Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1E2E73166
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNafJcWZPFIzCxYrGmYugnK1opx/7zoDIG9rKJYX0fA=; b=HWnL7qN4oo/hJ2x44Tow3wH/QJ
	TFnSKsf8rA5m1vHclmzPW8M6L2ATHI7/fZbljEYsDdt1gEEyPLIPurdHDQUaBwrHj4S5vDNHEhbK8
	qlDg1AtojjbuGRwh1E8TUw7m8FMlRSn3+t7knWhhcdgq7J/7777eYoYHMZ9dbY7PnGyvMWGzNkV71
	OufF86/MZ734vea0poppcDUSm+cZVqmq1flTsNQsIwqAZL7CzHgBKIT0LJ3YzrDs562FCWNc/N2gY
	hvm2G61xSLKrhpHGsPVM20a9n1rshCG6maAhwNw19hJSvpw3pnPpgdmo4MU7wBe3zgQ1NLbxe6WZH
	Yp8UzauQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtyt-000000050gS-3loM;
	Mon, 02 Feb 2026 13:28:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmtyr-000000050g7-27mT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C8DAF4056F;
	Mon,  2 Feb 2026 13:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771F6C116C6;
	Mon,  2 Feb 2026 13:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770038920;
	bh=GFzapZuD8RxuDYlO/l+ZDFdmFKCa++Q9O74XNv41dA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GaJqD/6kCwBLydXPU+4kV7xo4ubfjt3ivLCx1UQD1M0mSIYvGI50YD93ZyfLSrODF
	 J7NdvroqfRuWIkguAdzB1xHvWSKCcQS1bTHorA14v9dcynb6Jq97fkuu3+1F23XdJa
	 EEYA4GbdsHcYdsW4BV6D2wkSVT7LrWbwuONnLVxXeM8mrj5Kx//lrRivjm9cKEaX2I
	 oviw752uTuxf4iahnzOLNVEqLVh+Y+nfEKjNwUi5c9QmHLM4RhT1dzHqGdBZ72rCaH
	 OvGfDQr9wtJyz+eF9aWin7yGfpV9gr/FDTusNxlGJs5cclG26yaiD0gbGuXs8hGsnO
	 MGHs2Ek/4XMEA==
Date: Mon, 2 Feb 2026 18:58:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: s32g: Fix ports parsing
Message-ID: <howlzhze3axqiguqvxslssc2tr7ocaa7l2obr4623n3piw5xee@ujnyo5bieril>
References: <20260202130756.1421488-1-vincent.guittot@linaro.org>
 <scnf5gh3h5pwvnbe4bwtztdlgcpvvtse4fg64bto2jgyotfpwl@sle4k4ky3gtu>
 <CAKfTPtBZCLiq0E-a2QA5X_Bix2PxXiCyuCira1V_wBWZORUS6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtBZCLiq0E-a2QA5X_Bix2PxXiCyuCira1V_wBWZORUS6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_052841_596817_780A6C86 
X-CRM114-Status: GOOD (  21.44  )
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

On Mon, Feb 02, 2026 at 02:23:52PM +0100, Vincent Guittot wrote:
> On Mon, 2 Feb 2026 at 14:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Mon, Feb 02, 2026 at 02:07:56PM +0100, Vincent Guittot wrote:
> > > No error return is missing after the loop resulting in removing the
> > > ports from the list.
> > >
> > > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > index 47745749f75c..767f5a622441 100644
> > > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > > @@ -285,6 +285,8 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> > >                       goto err_port;
> > >       }
> > >
> > > +     return 0;
> > > +
> >
> > Hmm. So the initial 'ret = -ENOENT' will become redundant and you'll return
> > success even if there are no Root Ports in DT.
> 
> good point.
> 
> >
> > You should do:
> >
> >         if (!of_get_available_child_count(dev->of_node))
> >                 return -ENOENT;
> 
> or maybe
> 
> +       if (!ret)
> +               return 0;
> 

That'll work too. For some reason, I initially thought it would be ugly, but it
doesn't :)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

