Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E591CD2E02B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLUSAgzR8iNF4zHWrGUoMvbcLFgR1RnPlcZ1Cg/hAis=; b=yWqMcezndr+ebTWvzPxhl0pW2a
	1/hEoTdQWlwBDRTkri4yz+InWRi6pX05FcAroJaj1C8sHmmO9LUC0GFp2D0kGAo3m/GDaUb9gBAqz
	Pgc6nLDZMODEVK2E2X2tyBS+8/vjQOFGvK5agQBrFMDD8x3QRYVp4s7Dv8F/u/7FcBh2Sgv0Jq4cM
	t8uxIW9DWa2nVfsNoxG9eRioOqC/6fbRcf4dtkCFBfpp+zG2CdYatChnuR1ZM4YLhPJaXQTQYIyxs
	Ll46doydWOdg9JO6v1BM0hr7pmPVitQqzhhaPAsaAIIDg10ogUYeq8GO9HL1yPQSe8Qi9OPkMKDwk
	RjS9a5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XOh-0000000DjEO-2cpv;
	Wed, 23 Oct 2024 09:11:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3XBU-0000000DfPn-05ke
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:57:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4316cce103dso53706385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 01:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729673858; x=1730278658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLUSAgzR8iNF4zHWrGUoMvbcLFgR1RnPlcZ1Cg/hAis=;
        b=BXQ+ekS9GMXUWIyUECBQc9OQvFFltc70OGxmpYXPY9hN1FI8zn+HiKmxjmE/VPzOP/
         aP9FhyTOl5MbRJFODc1Wj+H+pOX93jsUNwaWDbjegjskejjjriYkAzTy4Tf3JWLHeafl
         vOA6rVpw195LLswIcKq4H9pvTrcwbK9yV8YsSdwCBSi7RrFcpiw93Hy84ceaficpLnW6
         0ORrSDFkNIyg6DrfFM8yqiJEXKVlVQ4wAcOlo7E5/fS+noMM7WxcvjnX8MDnpuEpTEkX
         THelMu3UNcl3IjWzQiwpb6ILUyyhpkvdm5+EZliiX6Ep2pyHweYi1yq22+fauioLiIZc
         pKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729673858; x=1730278658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLUSAgzR8iNF4zHWrGUoMvbcLFgR1RnPlcZ1Cg/hAis=;
        b=Bu4UMGZMoKGpo4LRDRpAFvMHsfPb5v/RWkr5ekvb1PPeUvnu3m2RtcLJl/EIYAim7b
         cXAhwYgUnCrTCQwYr45fwouwAd9SdOVIHkdRHtxFu4OzLrjY1dWpVVT+qtKSo0LE3z55
         hnl1o7mLbpTyLDD745kdLdX9qc7m/G+5jx6kKizVvz51dA2u0VazOV8POwNTPZn8F3Hi
         qpHc+MkygP5eVOZVD2WW27ixErwfZvV4D1RKSfKtEZGxeRAyxK/BG2RGL+3yxS35i8Yv
         NjI4xTFhpUbJbkUU3znoN8i+3CpEiVwoBJ3+VbZjmbHMOtd9jXQO4M5NeHtyZIAaDG+P
         yYJg==
X-Forwarded-Encrypted: i=1; AJvYcCXk6tZe84mAFDkDdLa5NU3kUyYZtJNlrnxe2njSLEPpxmYuuY6kGE657h0GtmzPOGjKCErfcSTLMzPKRW+cPxpa@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrycn3B5G7F9PSADH8QGXuQTJYnwAWiYytX8wrNuKGRrniySOC
	ZoQcMu+RoEkvDvldxWPhf97Ztfkz6j7p/nXy6gzZjQZraDw5cuor
X-Google-Smtp-Source: AGHT+IFhkHFpnMZr8la1VYcuF0W+7+f2Rn4vQXVtJPwZJjxsaVWz/9HVDlk2KLntNTCSy/h+ZKFIgg==
X-Received: by 2002:a05:600c:5492:b0:431:562a:54be with SMTP id 5b1f17b1804b1-43184201b33mr18440165e9.9.1729673857370;
        Wed, 23 Oct 2024 01:57:37 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bde181sm10241755e9.11.2024.10.23.01.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 01:57:36 -0700 (PDT)
Date: Wed, 23 Oct 2024 10:57:35 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v3] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <Zxi6f3S5p8Pnto-S@eichest-laptop>
References: <20241021124922.5361-1-eichest@gmail.com>
 <20241022155349.GA880566@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022155349.GA880566@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_015740_097116_6004C257 
X-CRM114-Status: GOOD (  47.28  )
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

On Tue, Oct 22, 2024 at 10:53:49AM -0500, Bjorn Helgaas wrote:
> On Mon, Oct 21, 2024 at 02:49:13PM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > The suspend/resume support is broken on the i.MX6QDL platform. This
> > patch resets the link upon resuming to recover functionality. It shares
> > most of the sequences with other i.MX devices but does not touch the
> > critical registers, which might break PCIe. This patch addresses the
> > same issue as the following downstream commit:
> > https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
> > In comparison this patch will also reset the device if possible because
> > the downstream patch alone would still make the ath10k driver crash.
> > Without this patch suspend/resume will not work if a PCIe device is
> > connected. The kernel will hang on resume and print an error:
> > ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible
> > 8<--- cut here ---
> > Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> 
> https://chris.beams.io/posts/git-commit/
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/maintainer-tip.rst?id=v6.11#n134
> 
> Add blank lines between paragraphs.  Drop the "8<--- cut here" thing.

Thanks for the feedback, I will fix this in the next version.
> 
> What does "reset the link" mean?  Please use the same terminology as
> the PCIe spec when possible.

I will try to come up with a better description in the next version. I
think this sentence doesn't make sense anymore.

> The downstream commit log ("WARNING: this is not the official
> workaround; user should take own risk to use it") doesn't exactly
> inspire confidence.
> 
> It sounds like this resets *endpoints*?  That sounds scary and
> unexpected in suspend/resume.

Yes, I completely agree with you, but NXP has never come up with an
"official" workaround. Our problem is that with the current
implementation, suspend/resume is completely broken when a PCIe device
is connected. With this proposed patch we at least have a working device
after resume. Even for the other i.MX devices, the driver resets the
endpoints in the resume function (imx_pcie_resume_noir ->
imx_pcie_host_init -> imx_pcie_assert_core_reset), we just do that now
for the i.MX6QDL as well. If it is more appropriate to call
imx_pcie_assert_core_reset in resume as we do for the other devices,
that would be fine with me as well. I was thinking that if we need to
reset the device anyway, we could put it into reset on suspend, as this
might save some extra power.

> 
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> > Changes in v3:
> > - Added a new flag to the driver data to indicate that the suspend/resume
> >   is broken on the i.MX6QDL platform. (Frank)
> > - Fix comments to be more relevant (Mani)
> > - Use imx_pcie_assert_core_reset in suspend (Mani)
> > 
> >  drivers/pci/controller/dwc/pci-imx6.c | 57 +++++++++++++++++++++------
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index 808d1f1054173..09e3b15f0908a 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -82,6 +82,11 @@ enum imx_pcie_variants {
> >  #define IMX_PCIE_FLAG_HAS_SERDES		BIT(6)
> >  #define IMX_PCIE_FLAG_SUPPORT_64BIT		BIT(7)
> >  #define IMX_PCIE_FLAG_CPU_ADDR_FIXUP		BIT(8)
> > +/**
> > + * Because of ERR005723 (PCIe does not support L2 power down) we need to
> > + * workaround suspend resume on some devices which are affected by this errata.
> > + */
> > +#define IMX_PCIE_FLAG_BROKEN_SUSPEND		BIT(9)
> >  
> >  #define imx_check_flag(pci, val)	(pci->drvdata->flags & val)
> >  
> > @@ -1237,9 +1242,19 @@ static int imx_pcie_suspend_noirq(struct device *dev)
> >  		return 0;
> >  
> >  	imx_pcie_msi_save_restore(imx_pcie, true);
> > -	imx_pcie_pm_turnoff(imx_pcie);
> > -	imx_pcie_stop_link(imx_pcie->pci);
> > -	imx_pcie_host_exit(pp);
> > +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> > +		/**
> 
> Single asterisks above, here, and below.

Thanks, I will fix this in the next version.

> > +		 * The minimum for a workaround would be to set PERST# and to
> > +		 * set the PCIE_TEST_PD flag. However, we can also disable the
> > +		 * clock which saves some power.
> > +		 */
> > +		imx_pcie_assert_core_reset(imx_pcie);
> > +		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
> > +	} else {
> > +		imx_pcie_pm_turnoff(imx_pcie);
> > +		imx_pcie_stop_link(imx_pcie->pci);
> > +		imx_pcie_host_exit(pp);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -1253,14 +1268,32 @@ static int imx_pcie_resume_noirq(struct device *dev)
> >  	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
> >  		return 0;
> >  
> > -	ret = imx_pcie_host_init(pp);
> > -	if (ret)
> > -		return ret;
> > -	imx_pcie_msi_save_restore(imx_pcie, false);
> > -	dw_pcie_setup_rc(pp);
> > +	if (imx_check_flag(imx_pcie, IMX_PCIE_FLAG_BROKEN_SUSPEND)) {
> > +		ret = imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
> > +		if (ret)
> > +			return ret;
> > +		ret = imx_pcie_deassert_core_reset(imx_pcie);
> > +		if (ret)
> > +			return ret;
> > +		/**
> > +		 * Using PCIE_TEST_PD seems to disable msi and powers down the
> > +		 * root complex. This is why we have to setup the rc again and
> > +		 * why we have to restore the msi register.
> 
> s/msi/MSI/

Thanks, I will fix this in the next version.

> 
> > +		 */
> > +		ret = dw_pcie_setup_rc(&imx_pcie->pci->pp);
> > +		if (ret)
> > +			return ret;
> > +		imx_pcie_msi_save_restore(imx_pcie, false);
> > +	} else {
> > +		ret = imx_pcie_host_init(pp);
> > +		if (ret)
> > +			return ret;
> > +		imx_pcie_msi_save_restore(imx_pcie, false);
> > +		dw_pcie_setup_rc(pp);
> >  
> > -	if (imx_pcie->link_is_up)
> > -		imx_pcie_start_link(imx_pcie->pci);
> > +		if (imx_pcie->link_is_up)
> > +			imx_pcie_start_link(imx_pcie->pci);
> > +	}
> >  
> >  	return 0;
> >  }
> > @@ -1485,7 +1518,9 @@ static const struct imx_pcie_drvdata drvdata[] = {
> >  	[IMX6Q] = {
> >  		.variant = IMX6Q,
> >  		.flags = IMX_PCIE_FLAG_IMX_PHY |
> > -			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE,
> > +			 IMX_PCIE_FLAG_IMX_SPEED_CHANGE |
> > +			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> > +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> >  		.dbi_length = 0x200,
> >  		.gpr = "fsl,imx6q-iomuxc-gpr",
> >  		.clk_names = imx6q_clks,

Regards,
Stefan

