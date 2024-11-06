Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6907D40D13
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=P5ZCuNOi4fnbrs2p74a816pFG1rIxa+Bd3TkPeAhKMw=; b=cem4NOwqVcI34m
	JfQ+FIkKbS+Xe9xY9653hP/FMsWM+XlP5zQt660rdDRLnKrDKdnk0p0Lp38zSg+EPgZXyNCg40AS4
	KnZO8o2CF4GjRaD2OurNWh6p8qvF2fYGy3R7MYCP5EdmCaYsUxbpfJL7Usih2hgU229f8SLI7q/mH
	c1FmDWmNocA13KormKHEBXxrcv2c0sMEOrTp9q93EXjIbt/r+ZjZT5fZRj5D/WUjMOxtkF9JyvJm8
	5Dlo1xkUCQtLBHnyk+JUihwRLCu0MpLR2JvCD7cTRD2QAIWam+j+nZQsZS6yJNnj6fFf9SBxplT3K
	YbYctVRuZh+6MxqqVz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UOl-00000001G7c-1qTa;
	Wed, 06 Nov 2024 00:59:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UN0-00000001Fdn-03F2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 00:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 353645C4167;
	Wed,  6 Nov 2024 00:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C91C4CECF;
	Wed,  6 Nov 2024 00:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854680;
	bh=yNQ9oZI1LY0D3fQ4q4pt0Z8IWksfEtyB2tsRgj/DkR4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=WUCcH9hsRpWToVrU9NgS9cJN80oTS5l23JIyQZdjctDJTXgjCN+5GIFJox+8ZK6fu
	 h+us217VSnCtx9rGlMtvwMpNlxE5wJFBCxgUoOIHXxOOgPZwbTTSiN/EH6a8ZHYdJt
	 boBceX/R24+JOtLVKoMjPMOPDlOiytDelhOv4c5jfcv6GTYD5XdyW4+H7leofzX0w8
	 CeCBPhXQdxlnRmpX4QemxcdKOM8+68kdoU1Yl3rGSM6wrYHlxtYdZWzxj+V0Fvjppp
	 f8HQ10NQifujNR26e9r0+9dEi9NWrUXNwIWangZRjae+0fpLGDfD2Iby6Zph7dWcUa
	 bz3ov2QdeW7Ww==
Date: Tue, 5 Nov 2024 18:57:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, manivannan.sadhasivam@linaro.org,
	kishon@kernel.org, u.kleine-koenig@pengutronix.de,
	cassel@kernel.org, dlemoal@kernel.org,
	yoshihiro.shimoda.uh@renesas.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <20241106005758.GA1498067@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524105714.191642-2-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_165802_138298_199BE363 
X-CRM114-Status: GOOD (  19.78  )
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

On Fri, May 24, 2024 at 04:27:13PM +0530, Siddharth Vadapalli wrote:
> From: Kishon Vijay Abraham I <kishon@ti.com>
> 
> commit 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x
> Platforms") introduced configuring "enum dw_pcie_device_mode" as part of
> device data ("struct ks_pcie_of_data"). However it failed to set mode
> for "ti,keystone-pcie" compatible. Set mode as RootComplex for
> "ti,keystone-pcie" compatible here.

23284ad677a9 appeared in v5.10.  

But I guess RC support has not been broken since v5.10 because we
never used ks_pcie_rc_of_data.mode anyway?

It looks like the only use is here:

  #define DW_PCIE_VER_365A                0x3336352a
  #define DW_PCIE_VER_480A                0x3438302a

  ks_pcie_probe
  {
    ...
    mode = data->mode;
    ...
    if (dw_pcie_ver_is_ge(pci, 480A))
      ret = ks_pcie_am654_set_mode(dev, mode);
    else
      ret = ks_pcie_set_mode(dev);

so we don't even look at .mode unless the version is v4.80a or later,
and this is v3.65a?

So this is basically a cosmetic fix (but still worth doing for
readability!) and doesn't need a stable backport, right?

If so, I might amend the commit log to mention the fact that this
doesn't actually fix a functional issue.

> Fixes: 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x Platforms")
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/pci/controller/dwc/pci-keystone.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index d3a7d14ee685..3184546ba3b6 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1064,6 +1064,7 @@ static int ks_pcie_am654_set_mode(struct device *dev,
>  
>  static const struct ks_pcie_of_data ks_pcie_rc_of_data = {
>  	.host_ops = &ks_pcie_host_ops,
> +	.mode = DW_PCIE_RC_TYPE,
>  	.version = DW_PCIE_VER_365A,
>  };
>  
> -- 
> 2.40.1
> 

