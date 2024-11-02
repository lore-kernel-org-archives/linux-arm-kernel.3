Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F882E677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 12:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yf5PO0O/8GxH6YaffdPErJ0yX0DmIFh2NMk1EvLbRA8=; b=quh7ML+phT6Dm1g6edCmNbqTFv
	oun27Hq4/r2S9FVRbOWBqEDIVeX9ZOknVV36GyvpRX3NmyNWu6h1le6uFTx4Fd3tzOvrT3ux4nllk
	A4/WOzQtp/EbR3jQYZq79jK0lcusESgCPjRTcSQKgVNAJladAIgjj4xd/UYGIpSUqDB5OJL3PZ1YY
	fUlJFubtpPHLk67XSr8P/egXsAUB7K4I5aDk3XgSTE+nkJ9pBORBlp3lled5jikzZNnet4PyYw6p/
	Uhjz7sb4vmW3TRJQJqkyJX9xK3+bbeBV4XmDAlvTutmEl0sxs8UCTYBm70RdjSvn9Siwy5ShG7KKP
	NW3Bz/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CoF-00000009fI0-0HJP;
	Sat, 02 Nov 2024 12:00:51 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CiK-00000009e5E-2RB1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:54:46 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-720d5ada03cso1337529b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730548483; x=1731153283; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yf5PO0O/8GxH6YaffdPErJ0yX0DmIFh2NMk1EvLbRA8=;
        b=UNS1QUYD4Pr50OkMLlzCC+mj7lEjVAmsKKqug0AGRtvZlwdMUrEiJi5fJ3G/JVM66H
         bW2Pkajt+yVPmHhj8DJOt3ZABmek/IgsQZffymFOgxjhXxba17jg7wxnesrUYDHH8HHA
         QKJL23S4uciLGxwpSi+hMiQ+eAKre2oJJf9G8QQFmcSV4ACHSQY3mcZTo+hNZuW19axB
         4XpS05JRR0XnrHTbFTUfbIHe6olkzMUKoNWuSY0/X1xogQqU/DcJTeiaMmp1K9556PAi
         W+M8NRIBNEWeC9/bs+Y13hi9lYIajnnEOSJLZZdNptlhCSi0XZHkQZvo90Y58eENicNO
         kbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548483; x=1731153283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf5PO0O/8GxH6YaffdPErJ0yX0DmIFh2NMk1EvLbRA8=;
        b=vzZQj0K2LlwuRbGU592AojygODKDQJXZLHgtT82IAVU7PzLZ+cXIiH8YmXIyA05fcX
         MKB2iDAsoHxlUc1ftih4gGeJ3LWPy2RpjxIEwSgUVVsZ+f7Z2lTeU2OGTXqbnHOP+5Jc
         3LDzU+JKOTDgzd2LJffedwkR7GuIlOIdeLbC81LLcsiaULKOYpubOYghJlfw5vzt99IJ
         X25z1WXNQ/n3cxHcuS17cepcO4pYeLC//73SxOcQ9Luyi8fA9EBtry4dKCWsIRC1Y4p6
         lyQyRs59HBV2iLwvWZlpr6qrrcExodjiKbYdx/qbV6rpIhAo1442dH1SPNV3DWf3WOeU
         X6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCXxdcOu5q0YmtS51rXhO6qkTh0fMnHYn8k94cF3Eiwxg8m6q3zFBA/3MZ2UlTffeyR5w12sUjayrKBsXomoIeSG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7dSWzfuPe6ruzRCt5ZtR0PisxDHsOCSRMtX4ijmoRANdZt4qV
	fqIW7OFyDoJ8TyZhX9OvkpC6tOBrWQ/KBeQbJvpPNpoxM5kG/JpxXtmUYaWoaw==
X-Google-Smtp-Source: AGHT+IFBSMlqCkyuHYgmkW0THyLKy0cIuZ+FHeVb4thr/BQ4WLID6ROgAM8u2xitC9jx8P6RXoMQtA==
X-Received: by 2002:a05:6a00:1397:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-720b9c96d0emr14158400b3a.13.1730548483312;
        Sat, 02 Nov 2024 04:54:43 -0700 (PDT)
Received: from thinkpad ([220.158.156.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b8cf3sm4023582b3a.20.2024.11.02.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:54:42 -0700 (PDT)
Date: Sat, 2 Nov 2024 17:24:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, p.zabel@pengutronix.de, robin.murphy@arm.com,
	will@kernel.org
Subject: Re: [PATCH v3 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Message-ID: <20241102115435.s7oycrh2pjkfhpsu@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
 <20241102111012.23zwz4et2qkafyca@thinkpad>
 <86jzdl27my.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86jzdl27my.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_045444_676943_8D9AB813 
X-CRM114-Status: GOOD (  38.51  )
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

On Sat, Nov 02, 2024 at 11:32:37AM +0000, Marc Zyngier wrote:
> On Sat, 02 Nov 2024 11:10:12 +0000,
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> > On Thu, Oct 24, 2024 at 06:34:44PM -0400, Frank Li wrote:
> > > Some PCIe host bridges require special handling when enabling or disabling
> > > PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> > > Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> > > to identify the source of DMA accesses.
> > > 
> > > Without this mapping, DMA accesses may target unintended memory, which
> > > would corrupt memory or read the wrong data.
> > > 
> > > Add a host bridge .enable_device() hook the imx6 driver can use to
> > > configure the Requester ID to StreamID mapping. The hardware table isn't
> > > big enough to map all possible Requester IDs, so this hook may fail if no
> > > table space is available. In that case, return failure from
> > > pci_enable_device().
> > > 
> > > It might make more sense to make pci_set_master() decline to enable bus
> > > mastering and return failure, but it currently doesn't have a way to return
> > > failure.
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change from v2 to v3
> > > - use Bjorn suggest's commit message.
> > > - call disable_device() when error happen.
> > > 
> > > Change from v1 to v2
> > > - move enable(disable)device ops to pci_host_bridge
> > > ---
> > >  drivers/pci/pci.c   | 23 ++++++++++++++++++++++-
> > >  include/linux/pci.h |  2 ++
> > >  2 files changed, 24 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > index 7d85c04fbba2a..5e0cb9b6f4d4f 100644
> > > --- a/drivers/pci/pci.c
> > > +++ b/drivers/pci/pci.c
> > > @@ -2056,6 +2056,7 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
> > >  static int do_pci_enable_device(struct pci_dev *dev, int bars)
> > >  {
> > >  	int err;
> > > +	struct pci_host_bridge *host_bridge;
> > >  	struct pci_dev *bridge;
> > >  	u16 cmd;
> > >  	u8 pin;
> > > @@ -2068,9 +2069,16 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
> > >  	if (bridge)
> > >  		pcie_aspm_powersave_config_link(bridge);
> > >  
> > > +	host_bridge = pci_find_host_bridge(dev->bus);
> > > +	if (host_bridge && host_bridge->enable_device) {
> > > +		err = host_bridge->enable_device(host_bridge, dev);
> > > +		if (err)
> > > +			return err;
> > > +	}
> > 
> > How about wrapping the enable/disable part in a helper?
> > 
> > 	int pci_host_bridge_enable_device(dev);
> > 	void pci_host_bridge_disable_device(dev);
> > 
> > The definition could be placed in drivers/pci/pci.h as an inline
> > function.
> 
> What does it bring? I would see the point if there was another user.
> But this is very much core infrastructure which doesn't lend itself to
> duplication.
> 
> Unless you have something in mind?
> 

IMO, it adds a nice encapsulation to help readers understand what this piece of
code is all about and also keeps the callers short. Plus the disable helper is
reused in both error and pci_disable_device() (if that matters).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

