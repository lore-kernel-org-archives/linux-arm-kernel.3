Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E289CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 08:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AaAtvGQxd5BtWHJs/domYdV7rbH4BbOZzbyvG7eDHK0=; b=Mlq8q41qkxbaMXRzKtlhJWHPFm
	U9A5ZPiC9ZpKCsOIGAazKHmrhtJ1qcNL2yQNYfmhKlTQ4j1gujH9yCzKGNhLhuQnoCMXfNKABVGQM
	yWJOwIljkxT3Nwfa8MYE7HjkDMMmAUtrBnLLbG5lFYE8RBQumAlJ8UUQ8e9zi3U9J8daueZqu1/LF
	gzcir18+7Uphy577rC1uHtAkXmZ5zBBy07lDawYVCN8KI98nJGc/n5RMPq6xPqRbt08Glb3qZfWv2
	WRdHaTKr+VlnYSkWLca7DS7HI6r1XccPMryIJDbHYQdlY/JNi+P1hCqiox1x7j80ldtcToT8qajEx
	eG76ty+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzswd-000000052uI-3CIW;
	Sat, 20 Sep 2025 08:27:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzswc-000000052uB-21Bg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 08:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82EDC601AA;
	Sat, 20 Sep 2025 08:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C218C4CEF9;
	Sat, 20 Sep 2025 08:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758356865;
	bh=xjORWEb9AB9K4GuQONrEhOQ9HcO3RWCcAWlzmCE1C4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eIkeUZwyORBFSxxN8Pc4oIVfJ8oaglOfKFEVHkSUgIk2mE9cW6ISS1nMYB7l/mTzx
	 NsE1jNdLrdFXId15b7wHf0WS6LJPTouXO/Ymr6zWcUUPcjUsCkZ9DIfRv1vzEZ+6Js
	 rh2Me3hOQAbwlh65urfgT/sHEGeCgyaGprQw+PffJzoD3QaHpCyGBFZ0N7/Bse1hbj
	 klqnPSRNhw6lwvlK06+WmDWwCf5OQnKTOGcSL7j3fZ5NHTd9LBdBCGu/xlvjFGPPns
	 oouiGgye8+Zyz9jM+b43AVsVXIID/XvVLwq9yZRH76rTRCvcaug3JrPZHJ7zUYw9bC
	 aeJcv9AXR2xuQ==
Date: Sat, 20 Sep 2025 13:57:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, christian.bruel@foss.st.com, 
	qiang.yu@oss.qualcomm.com, mayank.rana@oss.qualcomm.com, thippeswamy.havalige@amd.com, 
	shradha.t@samsung.com, quic_schintav@quicinc.com, inochiama@gmail.com, 
	cassel@kernel.org, kishon@kernel.org, sergio.paracuellos@gmail.com, 
	18255117159@163.com, rongqianfeng@vivo.com, jirislaby@kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 09/10] PCI: keystone: Exit ks_pcie_probe() for the
 default switch-case of "mode"
Message-ID: <jgw5f33ptz6dutffxaid4kxnllsdyanqy5obsotn3bmhxibxdt@2zzlh7mbfoi2>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-10-s-vadapalli@ti.com>
 <lo2zv3nxek57s3h4hwv2ujzophdx2ubfuam4gqmo5h77t2g4jo@447qpc7a4ub3>
 <3f3b2f06-64a3-4e6d-9fa9-c3412b1ca710@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f3b2f06-64a3-4e6d-9fa9-c3412b1ca710@ti.com>
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

On Sat, Sep 20, 2025 at 01:39:22PM +0530, Siddharth Vadapalli wrote:
> On Sat, Sep 20, 2025 at 12:06:46AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Sep 12, 2025 at 05:46:20PM +0530, Siddharth Vadapalli wrote:
> > > In ks_pcie_probe(), the switch-case for the "mode" is used to configure
> > > the PCIe Controller for either Root-Complex or Endpoint mode of operation.
> > > Prior to the switch-case statement for "mode" an invalid mode will result
> > > in probe failure only if "dw_pcie_ver_is_ge(pci, 480A)" is true, which
> > > is the case for the AM654 platform. On the other hand, when that is not
> > > the case, "ks_pcie_set_mode()" will be invoked, which does not validate
> > > the mode. As a result, it is possible for the switch-case statement for
> > > "mode" to receive an invalid mode. Currently, an error message is displayed
> > > in the "default" case where "mode" is neither "DW_PCIE_RC_TYPE" nor
> > > "DW_PCIE_EP_TYPE", but the probe succeeds. However, since the configuration
> > > required for Root-Complex and Endpoint mode have not been performed, the
> > > Controller is not operational.
> > > 
> > > Fix this by exiting "ks_pcie_probe()" with the return value of "-EINVAL"
> > > in addition to displaying the existing error message.
> > > 
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > 
> > Fixes tag? And probably CC stable since the controller seems to be not
> > operations without this fix.
> 
> While I had mentioned the rationale for not including the 'Fixes tag' in
> the v1 patch below the tearline, I forgot to add it in this patch. I will
> quote the same below:
> 
>     NOTE: A "Fixes" tag is ommitted on purpose since the fix is not crucial:
>     1. It doesn't fix a crash or any fatal error
>     2. It doesn't enable controller functionality by fixing the issue
> 

Fixes tag should be added irrespective of the cruciality of the bug.

>     Therefore, the patch may not be worth backporting.
> 

Agree with this though.

> Prior to this patch, the probe succeeded and the controller was
> unusable. Post this patch, the probe will fail and the controller is
> still unusable. Behavior is identical from a usability perspective but
> the user is aware of the issue since the probe fails.
> 

Ok. I think the description could reworded to make it more clear. The actual
issue is that the default case lacks setting the errno, leading to probe
success. But the addition of ks_pcie_set_mode() and others seem to cause little
bit confusion.

- Mani

> > 
> > - Mani
> > 
> > > ---
> > > 
> > > v1: https://lore.kernel.org/r/20250903124505.365913-11-s-vadapalli@ti.com/
> > > No changes since v1.
> > > 
> > >  drivers/pci/controller/dwc/pci-keystone.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > > index 2da9feaaf9ee..e85942b4f6be 100644
> > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > @@ -1414,6 +1414,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
> > >  		break;
> > >  	default:
> > >  		dev_err(dev, "INVALID device type %d\n", mode);
> > > +		ret = -EINVAL;
> > > +		goto err_get_sync;
> > >  	}
> > >  
> > >  	ks_pcie_enable_error_irq(ks_pcie);
> 
> Regards,
> Siddharth.

-- 
மணிவண்ணன் சதாசிவம்

