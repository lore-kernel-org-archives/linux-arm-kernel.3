Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jwqvJk/AyuEONHsd/L1DFjXxoMbO0A+0JIw32/l3flo=; b=Im1pTpvoJlYKEms7+qczzlWzgD
	MShqSXNbFdNHqoSS6WVB4Xk4TEd7h7TlEh45lALEsANYco+zInHLpb+tnf6FBAe776C2tr99qBTnU
	g9RKm3ryBxslFve0l2Yi0t3OUSD+7Aq42AXUXYXho/fdv7KCZQHi00OdVMyB5Hmvx1aDuC/TKZgdJ
	iyRUJGFWXAKNNN+33YZvri6+P+gSewkjvY1aNp3KSZj8yNHMaIsg3/9YsH5tL67SGixRviCTsmJy5
	4DMlXZSH1if91Jp20fPA459brVUnseL48dFWmqrcKVrwfjpgPvIbMTgR2elMxCI9zvBtRPvrVq7ta
	eCwX7cUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsj3-00000008orK-0vqS;
	Wed, 05 Mar 2025 17:40:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpshR-00000008ogV-2DWy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 17:38:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F3965C6ABB;
	Wed,  5 Mar 2025 17:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906A8C4CED1;
	Wed,  5 Mar 2025 17:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741196307;
	bh=ijeMNbdG6/t/MFEhbiYg7NxdfQyaCwL0KeoeZZihREw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TV3flwBUO/G0FQf09lT08iTdwkyHwQLxOvyCqIuBuMonT1GOwm0cUoemhaPTTHeix
	 h+8jch8k0QjY3uKAtLRojI7MG+hBjyNZ702wCXv2vaLEbYNJVD0++H/MhU33skYvp3
	 7quINAI0nSkLMZ6a32qOQKcn+Faf0eFW03TjGB52SmUHh/l+w0PQgL7Q5H489hEgZy
	 AL0uN49J4r0jqbO9L/62YHpoW6QE1Gzqo3Ifnxki16OdKKp78RkRCluQYYiioTTVqS
	 T7gISCH9FLq5trvXbfXhw+9xoxwOGynufWk1wMnppCXeDJmuuJncKkgnHJODMYbjna
	 NOYdAqxliI+Jg==
Date: Wed, 5 Mar 2025 11:38:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Fan Ni <nifan.cxl@gmail.com>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/5] Add debugfs based silicon debug support in DWC
Message-ID: <20250305173826.GA303920@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304171154.njoygsvfd567pb66@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_093829_678157_56CCC39B 
X-CRM114-Status: GOOD (  23.18  )
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

On Tue, Mar 04, 2025 at 10:41:54PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Mar 05, 2025 at 12:46:38AM +0900, Krzysztof Wilczyński wrote:
> > > On Mon, 3 Mar 2025 at 20:47, Krzysztof Wilczyński <kw@linux.com> wrote:
> > > > [...]
> > > > > > +int dwc_pcie_debugfs_init(struct dw_pcie *pci)
> > > > > > +{
> > > > > > +   char dirname[DWC_DEBUGFS_BUF_MAX];
> > > > > > +   struct device *dev = pci->dev;
> > > > > > +   struct debugfs_info *debugfs;
> > > > > > +   struct dentry *dir;
> > > > > > +   int ret;
> > > > > > +
> > > > > > +   /* Create main directory for each platform driver */
> > > > > > +   snprintf(dirname, DWC_DEBUGFS_BUF_MAX, "dwc_pcie_%s", dev_name(dev));
> > > > > > +   dir = debugfs_create_dir(dirname, NULL);
> > > > > > +   debugfs = devm_kzalloc(dev, sizeof(*debugfs), GFP_KERNEL);
> > > > > > +   if (!debugfs)
> > > > > > +           return -ENOMEM;
> > > > > > +
> > > > > > +   debugfs->debug_dir = dir;
> > > > > > +   pci->debugfs = debugfs;
> > > > > > +   ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > > > > > +   if (ret)
> > > > > > +           dev_dbg(dev, "RASDES debugfs init failed\n");
> > > > >
> > > > > What will happen if ret != 0? still return 0?
> > > 
> > > And that is exactly what happens on Gray Hawk Single with R-Car
> > > V4M: dw_pcie_find_rasdes_capability() returns NULL, causing
> > > dwc_pcie_rasdes_debugfs_init() to return -ENODEV.
> > > 
> > > Debugfs issues should never be propagated upstream!
> ...

> > > So while applying, you changed this like:
> > > 
> > >             ret = dwc_pcie_rasdes_debugfs_init(pci, dir);
> > >     -       if (ret)
> > >     -               dev_dbg(dev, "RASDES debugfs init failed\n");
> > >     +       if (ret) {
> > >     +               dev_err(dev, "failed to initialize RAS DES debugfs\n");
> > >     +               return ret;
> > >     +       }
> > > 
> > >             return 0;
> > > 
> > > Hence this is now a fatal error, causing the probe to fail.

> Even though debugfs_init() failure is not supposed to fail the probe(),
> dwc_pcie_rasdes_debugfs_init() has a devm_kzalloc() and propagating that
> failure would be canolically correct IMO.

I'm not sure about this.  What's the requirement to propagate
devm_kzalloc() failures?  I think devres will free any allocs that
were successful regardless.

IIUC, we resolved the Gray Hawk Single issue by changing
dwc_pcie_rasdes_debugfs_init() to return success without doing
anything when there's no RAS DES Capability.

But dwc_pcie_debugfs_init() can still return failure, and that still
causes dw_pcie_ep_init_registers() to fail, which breaks the "don't
propagate debugfs issues upstream" rule:

  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
  {
          ...
          ret = dwc_pcie_debugfs_init(pci);
          if (ret)
                  goto err_remove_edma;

          return 0;

  err_remove_edma:
          dw_pcie_edma_remove(pci);

          return ret;
  }

We can say that kzalloc() failure should "never" happen, and therefore
it's OK to fail the driver probe if it happens, but that doesn't seem
like a strong argument for breaking the "don't propagate debugfs
issues" rule.  And someday there may be other kinds of failures from
dwc_pcie_debugfs_init().

Bjorn

