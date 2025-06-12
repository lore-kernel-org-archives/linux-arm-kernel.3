Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F35C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 00:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z14u7vZmDvtknvwgA4C0Y6fqcOahnfFXGvEBMdh3FU8=; b=UUcuyn/SM49zr4w4pYz3x4eyQ/
	oRzzvyvBGF8QcL9+GSv5DDraUkaQe6uzDWR7lvgMBEHgtdhT8zr4Zu39ZZi5PvfBQI+0+1//XEQqP
	X+HlyobSNiLJ0drGMI2E8mOQJP/jHQ4lYGgiMQ9MwyUk1O1XpgyH0ogTknBrjwFnCGjKT5Dw/J0LS
	cKzae4ShSJUewoijHPlnjO2j79mVamOaBe+Whul48vAzSMS1OSkoEILniOVETzEpAeTaaFfoE2bCt
	7VnNe5obETT0bb9Fmo7OHo8DfPPviobkmeKsWGUiUoN2CNfQFPFC9XP0pzu2JsOF4riKdGWBnpysp
	cFlGQDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsDh-0000000Ewp8-355k;
	Fri, 13 Jun 2025 00:24:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkl1-0000000Dx1p-3M1C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 16:26:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E31F1A4F5DD;
	Thu, 12 Jun 2025 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83750C4CEEA;
	Thu, 12 Jun 2025 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749745586;
	bh=NQ6xQrI6xRICauGqmG8+811qPY6OBMasjJDZZOhrqWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1IueeP8MhSNKemYeDzcGE0Lzkp370T8632GFkXCOrak1MTq79qxrOqwn1ERM0b9P
	 1uLfjqz8995hI0bTDZPmNR50uTnKW0QmLb1cKdZ4L8+3adol0w1GzlcLcfHMHKcmXh
	 dvHfTIwIyiIgWQeI1sY9RIkygnJoWBgDH8khXd5T/GvPZrTePF3yq5VxcgIxRHydgD
	 FOodfpIls9T5qZVVSSc9GkHyC1FmavV9KiTQGxRV+WI4fmu9y3SljFkCaW8HhsdS2h
	 eusepCYgFYvhinVmC9+B2FV+Ku57PSfl+pH/vaa9w1URli1JOKFGCauX27Jyxc6GQV
	 dERmHBodm3Onw==
Date: Thu, 12 Jun 2025 21:56:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v11 10/11] PCI: dwc: Print warning message when
 cpu_addr_fixup() exists
Message-ID: <hwtjbhqeckzicoqfd5go25ag7kpubjaosvhufx7qc6jtfnwkof@x3vb274rtpwq>
References: <20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com>
 <20250313-pci_fixup_addr-v11-10-01d2313502ab@nxp.com>
 <v77jy5tldwuasjzqirlwx45zigt6bpnaiz67e4w7r2lxqrdsek@5qzzobothf5r>
 <aEr3nGCqRuyIwA37@lizhi-Precision-Tower-5810>
 <az74rxjpfahjwmz7fg5agn47org7arpblariuauujhovkaieha@d6r2yp23vqan>
 <aEr9+NQA6o0ypSuy@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEr9+NQA6o0ypSuy@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_092627_962516_9F246A56 
X-CRM114-Status: GOOD (  23.01  )
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

On Thu, Jun 12, 2025 at 12:19:04PM -0400, Frank Li wrote:
> On Thu, Jun 12, 2025 at 09:38:32PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Jun 12, 2025 at 11:51:56AM -0400, Frank Li wrote:
> > > On Thu, Jun 12, 2025 at 08:16:03PM +0530, Manivannan Sadhasivam wrote:
> > > > On Thu, Mar 13, 2025 at 11:38:46AM -0400, Frank Li wrote:
> > > > > If the parent 'ranges' property in DT correctly describes the address
> > > > > translation, the cpu_addr_fixup() callback is not needed. Print a warning
> > > > > message to inform users to correct their DTB files and prepare to remove
> > > > > cpu_addr_fixup().
> > > > >
> > > >
> > > > This patch seem to have dropped, but I do see a value in printing the warning to
> > > > encourage developers/users to fix the DTB in some way. Since we fixed the driver
> > > > to parse the DT 'ranges' properly, the presence of cpu_addr_fixup() callback
> > > > indicates that the translation is not properly described in DT. So DT has to be
> > > > fixed.
> > >
> > > This patch already in mainline with Bjorn's fine tuned at when merge.
> > >
> > > 	fixup = pci->ops ? pci->ops->cpu_addr_fixup : NULL;
> > >         if (fixup) {
> > >                 fixup_addr = fixup(pci, cpu_phys_addr);
> > >                 if (reg_addr == fixup_addr) {
> > >                         dev_info(dev, "%s reg[%d] %#010llx == %#010llx == fixup(cpu %#010llx); %ps is redundant with this devicetree\n",
> > >                                  reg_name, index, reg_addr, fixup_addr,
> > >                                  (unsigned long long) cpu_phys_addr, fixup);
> > >                 } else {
> > >                         dev_warn(dev, "%s reg[%d] %#010llx != %#010llx == fixup(cpu %#010llx); devicetree is broken\n",
> > >                                  reg_name, index, reg_addr, fixup_addr,
> > >                                  (unsigned long long) cpu_phys_addr);
> > >                         reg_addr = fixup_addr;
> > >                 }
> > >
> > >                 return cpu_phys_addr - reg_addr;
> > >         }
> > >
> > > I have not seen this "dev_warn(pci->dev, "cpu_addr_fixup() usage detected. Please fix your DTB!\n");"
> > >
> >
> > This patch is supposed to add this warning and nothing else.
> 
> We can forget this one. Can help check doorbell patch if you have time
> 
> https://lore.kernel.org/imx/202506101649.UpwblcVd-lkp@intel.com/T/#t
> 

I'm going through the queue. Will get to it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

