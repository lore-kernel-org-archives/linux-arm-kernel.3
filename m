Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05372E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R62GHxpMLcqbWJtHlNo45biE4A5QHRMLQkq3r0GrtUU=; b=P40NBRMY1WVeBgSHBd5azP4UQp
	PiyMwE6z08wUn2p5hw7twafcVqxkrYchtIF43YO6dzV0MdwR6O10aD87Q739k2eucaY6FP2+hgbNW
	tm0cdfgi9MHocfeK/cPdfmCwPMaGfR7aWnHIf03RE1WxL2L5OJX7f8xxtmeoJLIANR++GCfIJwLdY
	Qn6ChSdOR7iY7xP1SKwL7cQEthUI4qBKOK0zw6WTPJfnMIKwJU69NIcGNnLLsojjoAFVR0cxMFH1M
	kTc+qQ9kGNDGRvP7osybSlIVbjbLkBzEwlD/C+A/6jxNCSd+Mwi8cSrTBz0aPhYNdkSbNv5T9XK5y
	ZlH7SLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Dad-00000009ikI-35e5;
	Sat, 02 Nov 2024 12:50:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7DYx-00000009ibn-3YcE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 12:49:09 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20e576dbc42so28647555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 05:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730551747; x=1731156547; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R62GHxpMLcqbWJtHlNo45biE4A5QHRMLQkq3r0GrtUU=;
        b=Rxy/sX+PmWsE4LRtYzazvNlag6UY/6brf3rXHaeS3AnAoR3TNvjRNCgx4Zk9Jjkoqc
         HFJo5/SyZwJvyh+vBwMZCXI5bIRck2mBaWzRkYLwShZgI26HMNkQYTduDvCBQ+cTfsbA
         O4Q/kRupl4T7feiQdYRbWfXPlpgaDl0gepsWaFMB2SUkhnEwp5F3b+mI1j7jNpHbbuVa
         LR2ymFhUoVsh4i6+p9EGZeuDprFuCBnEaPpd9BR/4vC/VECEKY1uFHI74YYpbu2mPeWw
         xdcyGYbdAFmbzYf2Gq8hh2v4C+OSTavlDHO0RrXx8IqMjWOfZCGzp7TdTy8n/NCT/Cf5
         h++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730551747; x=1731156547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R62GHxpMLcqbWJtHlNo45biE4A5QHRMLQkq3r0GrtUU=;
        b=IQ82PIWUJw/j03AUelT+kq0ZrP8/l/2vJ0l/0MHbkclAa3kAv5Xa3DEeH3C6Iqb7Kx
         T2Fzyyhc+rQVTbOgxr4CE6WVxbZUnu+oRWe9/qEMdK0AinYZXIDZKUklTc7sM8rHTO1w
         5idz8JD4IDjoR9WXDLmSsbNwdqUAg8OBkZXUEhHK2nbikX3nRBEOo28V9PD+eFpUd5gw
         5aa/dHMNTTnmjnipQsDeQO3uzeTe40avlavPaLTrU9f5UcUpV1+Fhw+JX+RmInPOqds7
         2fffsC1l9uyt2G67gJo0AxIbr0Ul+UlMgzqedDVvwz17Rb316pvOwTu5K3Xjki3V+tnQ
         xvOA==
X-Forwarded-Encrypted: i=1; AJvYcCVGjndV73Fi7SSYb3Nc4K+ropiWO0UKsq/Q+F7GYDVMrmmElmPjd3QAOFYOTAV9/iEuHqP+sjjF4yNd1SaymMMH@lists.infradead.org
X-Gm-Message-State: AOJu0YwL912rUFyzYQUytHjdYrgjer3yUaj3kaE4km2DPtGloRiqidW9
	CyY+nlw5eP8F9jbgkZECiBB5AFFLutLusmf1e/Ok2Ixp2RtXHXLhehfGdzs0wg==
X-Google-Smtp-Source: AGHT+IHJ+NvyJqJsm2sd6i7P9lBOMCDJCLw5mFMqxRjQKzc9Q0COhGnO26H8RAbp736bWj9OzK8dVA==
X-Received: by 2002:a17:902:d487:b0:20c:5c6b:2eac with SMTP id d9443c01a7336-21103c8c51fmr134891675ad.49.1730551746899;
        Sat, 02 Nov 2024 05:49:06 -0700 (PDT)
Received: from thinkpad ([220.158.156.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057a5ff1sm33417305ad.123.2024.11.02.05.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 05:49:06 -0700 (PDT)
Date: Sat, 2 Nov 2024 18:18:57 +0530
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
Message-ID: <20241102124857.dx4hxdjy2jxjmara@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
 <20241102111012.23zwz4et2qkafyca@thinkpad>
 <86jzdl27my.wl-maz@kernel.org>
 <20241102115435.s7oycrh2pjkfhpsu@thinkpad>
 <86ikt52585.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86ikt52585.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_054907_946641_B3EF598A 
X-CRM114-Status: GOOD (  43.04  )
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

On Sat, Nov 02, 2024 at 12:24:42PM +0000, Marc Zyngier wrote:
> On Sat, 02 Nov 2024 11:54:35 +0000,
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > 
> > On Sat, Nov 02, 2024 at 11:32:37AM +0000, Marc Zyngier wrote:
> > > On Sat, 02 Nov 2024 11:10:12 +0000,
> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > > > 
> > > > On Thu, Oct 24, 2024 at 06:34:44PM -0400, Frank Li wrote:
> > > > > Some PCIe host bridges require special handling when enabling or disabling
> > > > > PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> > > > > Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> > > > > to identify the source of DMA accesses.
> > > > > 
> > > > > Without this mapping, DMA accesses may target unintended memory, which
> > > > > would corrupt memory or read the wrong data.
> > > > > 
> > > > > Add a host bridge .enable_device() hook the imx6 driver can use to
> > > > > configure the Requester ID to StreamID mapping. The hardware table isn't
> > > > > big enough to map all possible Requester IDs, so this hook may fail if no
> > > > > table space is available. In that case, return failure from
> > > > > pci_enable_device().
> > > > > 
> > > > > It might make more sense to make pci_set_master() decline to enable bus
> > > > > mastering and return failure, but it currently doesn't have a way to return
> > > > > failure.
> > > > > 
> > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > ---
> > > > > Change from v2 to v3
> > > > > - use Bjorn suggest's commit message.
> > > > > - call disable_device() when error happen.
> > > > > 
> > > > > Change from v1 to v2
> > > > > - move enable(disable)device ops to pci_host_bridge
> > > > > ---
> > > > >  drivers/pci/pci.c   | 23 ++++++++++++++++++++++-
> > > > >  include/linux/pci.h |  2 ++
> > > > >  2 files changed, 24 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > > > > index 7d85c04fbba2a..5e0cb9b6f4d4f 100644
> > > > > --- a/drivers/pci/pci.c
> > > > > +++ b/drivers/pci/pci.c
> > > > > @@ -2056,6 +2056,7 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
> > > > >  static int do_pci_enable_device(struct pci_dev *dev, int bars)
> > > > >  {
> > > > >  	int err;
> > > > > +	struct pci_host_bridge *host_bridge;
> > > > >  	struct pci_dev *bridge;
> > > > >  	u16 cmd;
> > > > >  	u8 pin;
> > > > > @@ -2068,9 +2069,16 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
> > > > >  	if (bridge)
> > > > >  		pcie_aspm_powersave_config_link(bridge);
> > > > >  
> > > > > +	host_bridge = pci_find_host_bridge(dev->bus);
> > > > > +	if (host_bridge && host_bridge->enable_device) {
> > > > > +		err = host_bridge->enable_device(host_bridge, dev);
> > > > > +		if (err)
> > > > > +			return err;
> > > > > +	}
> > > > 
> > > > How about wrapping the enable/disable part in a helper?
> > > > 
> > > > 	int pci_host_bridge_enable_device(dev);
> > > > 	void pci_host_bridge_disable_device(dev);
> > > > 
> > > > The definition could be placed in drivers/pci/pci.h as an inline
> > > > function.
> > > 
> > > What does it bring? I would see the point if there was another user.
> > > But this is very much core infrastructure which doesn't lend itself to
> > > duplication.
> > > 
> > > Unless you have something in mind?
> > > 
> > 
> > IMO, it adds a nice encapsulation to help readers understand what this piece of
> > code is all about and also keeps the callers short. Plus the disable helper is
> > reused in both error and pci_disable_device() (if that matters).
> 
> Having an *internal* helper for disable definitely has its use.
> 
> But moving these helpers outside of pci.c opens the door to all sort
> of abuse by making it look like an internal API drivers can use, which
> is absolutely isn't.
> 

Hmm, agree with this part, thanks!

Frank, please keep the helpers in pci.c.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

