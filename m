Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB6AC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6DSgMi12Y1DTWXSxB1u+L8gWNg8zLGbTo3gPZs3j0U=; b=yitO1Qsy9vImkBvX7RwFikmKq2
	vjz+ID4c7w25gARnFH5Uolh4VHeDsM7ljfjuh7rmPeErWDhfzQLnTIZZ9MhKV2l8v60szNm5pyGWd
	jd4quOKwC/xS/kncHsOkWv+fCFMCeNf/AJ/VfFWwezjIbPbrz3ZaH2jPrgxgir2EYlrojbnSU/mby
	B8Kxs6JrUBY9nmBkfoQbjuzMF6IfeXOwxctFXuIwcyh7/5vJnONxuvcB+qfxG8G3Lf88qJAmXhfS4
	yX1lNTqVTgYycfX+dpCJ8Q9dIYzeLZeaLVsMUzKp9R2WXuI4Y87KO8/X0ptWWVnXZ5WBhMFKSsnyF
	9aLSyKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSQG-0000000AXpm-18oY;
	Fri, 07 Feb 2025 17:45:48 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSEe-0000000AVTN-1sBz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 17:33:49 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f61b01630so8235385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 09:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738949627; x=1739554427; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6DSgMi12Y1DTWXSxB1u+L8gWNg8zLGbTo3gPZs3j0U=;
        b=LwkXSqCjqhUSxBx2bpsa434kNLUFXcv0kxYxmo3ifvcu7AK4k/zcokhK691LJ4zttb
         x7iBH/ulthAXVBhXjwfEw3KzcgzkxEPb2zsikeklRfmxs3FC7P9JOAh4kjkMDvnCH7W3
         lnThyBf+FxsoptEP9/mc3SE1+SDm5GSupO4+qJqXfQ8RWTaVrTQxVGF28PBUX+QSo99c
         U+jU5oHt196oDhz+onSXnXDEub1269Dg1R3OiURAeORNHGaKvM3SJy40EUoa58kkkRc1
         CPvnIuJW2876XXmqm+Xml5xO3efZ/p8+a/dhnVfxHVIesF2xHykLUsrpNd39Ah7xxRSK
         3dHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949627; x=1739554427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6DSgMi12Y1DTWXSxB1u+L8gWNg8zLGbTo3gPZs3j0U=;
        b=Bd4rg7aAwuYKI97Ng8iOdpXkuxUiSN2aneJK3ka+GTCFHe5VRZecYubI8hsqBGSPQD
         W+F7usZvhm/AsbFEAwZxpufRosWOhHdfjCGwObRC98C527ttVESMU2y53rFeQFC1kJ8x
         mOLcI41voA86sZNdXoMDipkmD/7YlyNGmqrjbeob0vKqcsKMmtXTyEFvWAui+mYgeC6X
         phdlvJlP7FRv8UIxeGzuzheOcjSGUNL1YcD5ABXWQSA6Fw9PY6VlUUUnUtxc7g1m8IPH
         +NKS+9BGADdfiaFOmsc0pbVLfmLVdApYZWJaw+idYPKg0KtokhVMhflKB00cAyFsh1EY
         dzGA==
X-Forwarded-Encrypted: i=1; AJvYcCUIwNiUNGg7UxmcuXU3OSNI/bR5uc61dvRldV7JINSz3i75lZWYk25AykZJfwb+GB/61o8ehcNUlPa61uxBraId@lists.infradead.org
X-Gm-Message-State: AOJu0YyTNoLnwwnmubFWKbC5VGIj8LCeiqbkBgCE5DlpoBAnPvDcw8YM
	gtwBXQhpnljV4YnMNh8YpvONvGW1DwkyERhP8sblc5gWzqwH12+DD9uTWMT++g==
X-Gm-Gg: ASbGncsoCNblWeRqZyCSjdY+MoSgIeto4sWtxdvnWAEnCiM3Cx9+ObtUwMN3zCtSSCH
	Go+qCKj096175IY8UiXEiLr23MJXFGVBrz43ZaHQqFU1JzvFBjbOQUmUaRnBMq8cWiX7h/t2VyS
	rMbQSbEyaIGfqQBidz1Tj2lGOR8KUs2wqt8+wUdVb5YSFUyPEiv1wHcvxZFykHjeBY0Pr8bOFZF
	8xGv+3xEzhyZshbErbofxH9U5Vhd16QTVVOxwtA0LpC5W795cZZpalsmRgvpEwnZROUDxQ+W8qb
	PIF2do0BfnxUStPhD8lHEnOf3g==
X-Google-Smtp-Source: AGHT+IF/6HJMivCoSnQWmuUQfnYzeYmJJ18uAMqp9K/Rr+W3BGx4zE82YztHxZQyN+t5mKrGChZ44g==
X-Received: by 2002:a05:6a20:2d07:b0:1e1:b105:158f with SMTP id adf61e73a8af0-1edf36f3822mr13144747637.19.1738949627535;
        Fri, 07 Feb 2025 09:33:47 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aee5bb1sm3342184a12.38.2025.02.07.09.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:33:46 -0800 (PST)
Date: Fri, 7 Feb 2025 23:03:41 +0530
From: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>
To: Wilson Ding <dingwei@marvell.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanghoon Lee <salee@marvell.com>
Subject: Re: [PATCH 1/1] PCI: armada8k: Disable LTSSM on link down interrupts
Message-ID: <20250207173341.anqw7ybp7vn6md4s@thinkpad>
References: <20241112064241.749493-1-jpatel2@marvell.com>
 <20241112214337.GA1861873@bhelgaas>
 <BY3PR18MB4673E2698A6F465FEB56B5A2A7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
 <BY3PR18MB467343D941D2F7706FD88FCBA7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BY3PR18MB467343D941D2F7706FD88FCBA7EB2@BY3PR18MB4673.namprd18.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_093348_499346_977CBE8F 
X-CRM114-Status: GOOD (  32.91  )
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

On Sat, Feb 01, 2025 at 12:57:56AM +0000, Wilson Ding wrote:
> I am writing to follow up on this serious of PCIe patches submitted by Jenish.
> Unfortunately, he has since left the company, and some comments on these
>  patches were not addressed in a timely manner. I apologize for the delay
> and any inconvenience this may have caused. I have reviewed the feedback
> provided and am now taking over this work. I appreciate the time and effort
> you have put into reviewing the patch and providing valuable comments.
> I will ensure that the necessary changes are made and resubmit the patch
> in the proper manner, as it was not initially submitted as a series.
> 
> > > When a PCI link down condition is detected, the link training state
> > > machine must be disabled immediately.
> > 
> > Why?
> > 
> > "Immediately" has no meaning here.  Arbitrary delays are possible and must
> > not break anything.
> 
> Yes, I agree. A delay cannot be avoided. The issue we encountered is that
> the RC may not be aware of the link down when it happens. In this case,
> any access to the PCI config space may hang up PCI bus. The only thing we
> can do is to rely on this link down interrupt. By disabling APP_LTSSM_EN,
> RC will bypass all device accesses with returning all ones (for read).
> 

Ok. One comment below.

> > > Signed-off-by: Jenishkumar Maheshbhai Patel
> > > <mailto:jpatel2@marvell.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-armada8k.c | 38
> > > ++++++++++++++++++++++
> > >  1 file changed, 38 insertions(+)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c
> > > b/drivers/pci/controller/dwc/pcie-armada8k.c
> > > index b5c599ccaacf..07775539b321 100644
> > > --- a/drivers/pci/controller/dwc/pcie-armada8k.c
> > > +++ b/drivers/pci/controller/dwc/pcie-armada8k.c
> > > @@ -53,6 +53,10 @@ struct armada8k_pcie {
> > >  #define PCIE_INT_C_ASSERT_MASK		BIT(11)
> > >  #define PCIE_INT_D_ASSERT_MASK		BIT(12)
> > >
> > > +#define PCIE_GLOBAL_INT_CAUSE2_REG	(PCIE_VENDOR_REGS_OFFSET
> > + 0x24)
> > > +#define PCIE_GLOBAL_INT_MASK2_REG	(PCIE_VENDOR_REGS_OFFSET
> > + 0x28)
> > > +#define PCIE_INT2_PHY_RST_LINK_DOWN	BIT(1)
> > > +
> > >  #define PCIE_ARCACHE_TRC_REG		(PCIE_VENDOR_REGS_OFFSET
> > + 0x50)
> > >  #define PCIE_AWCACHE_TRC_REG		(PCIE_VENDOR_REGS_OFFSET
> > + 0x54)
> > >  #define PCIE_ARUSER_REG			(PCIE_VENDOR_REGS_OFFSET
> > + 0x5C)
> > > @@ -204,6 +208,11 @@ static int armada8k_pcie_host_init(struct
> > dw_pcie_rp *pp)
> > >  	       PCIE_INT_C_ASSERT_MASK | PCIE_INT_D_ASSERT_MASK;
> > >  	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK1_REG, reg);
> > >
> > > +	/* Also enable link down interrupts */
> > > +	reg = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG);
> > > +	reg |= PCIE_INT2_PHY_RST_LINK_DOWN;
> > > +	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG, reg);
> > > +
> > >  	return 0;
> > >  }
> > >
> > > @@ -221,6 +230,35 @@ static irqreturn_t armada8k_pcie_irq_handler(int
> > irq, void *arg)
> > >  	val = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_CAUSE1_REG);
> > >  	dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_CAUSE1_REG, val);
> > >
> > > +	val = dw_pcie_readl_dbi(pci, PCIE_GLOBAL_INT_CAUSE2_REG);
> > > +
> > > +	if (PCIE_INT2_PHY_RST_LINK_DOWN & val) {
> > > +		u32 ctrl_reg = dw_pcie_readl_dbi(pci,
> > PCIE_GLOBAL_CONTROL_REG);
> > 
> > Add blank line.
> > 
> > > +		/*
> > > +		 * The link went down. Disable LTSSM immediately. This
> > > +		 * unlocks the root complex config registers. Downstream
> > > +		 * device accesses will return all-Fs
> > > +		 */
> > > +		ctrl_reg &= ~(PCIE_APP_LTSSM_EN);
> > > +		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_CONTROL_REG,
> > ctrl_reg);
> > 
> > And here.
> > 
> > > +		/*
> > > +		 * Mask link down interrupts. They can be re-enabled once
> > > +		 * the link is retrained.
> > > +		 */
> > > +		ctrl_reg = dw_pcie_readl_dbi(pci,
> > PCIE_GLOBAL_INT_MASK2_REG);
> > > +		ctrl_reg &= ~PCIE_INT2_PHY_RST_LINK_DOWN;
> > > +		dw_pcie_writel_dbi(pci, PCIE_GLOBAL_INT_MASK2_REG,
> > ctrl_reg);
> > 
> > And here.  Follow existing coding style in this file.
> > 
> > > +		/*
> > > +		 * At this point a worker thread can be triggered to
> > > +		 * initiate a link retrain. If link retrains were
> > > +		 * possible, that is.
> > > +		 */

Who is supposed to retrain the link? Where is the worker thread?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

