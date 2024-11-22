Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F520E69185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UzD8Qbmoty9y3UdrVjMc3lCWpv9Zoxn+WCwHClf78I=; b=IO8LfI0VltJDjwBu7g0gFelIUg
	8qeBFYHjxOxqZJvJtQMqQRrX9y7qCzp9+oiZq9fdMpmHs3aQbleWFQUgk1M6XhcJWBSwus7i7zCIg
	dTkfC2JjNbIJy7kVKmOB+m7kIr2YZrii1dMtf5UcDxuMRFk/SP2dqvvYGjScfIiNSlBUVga0jUXgQ
	OoFRJ160M7SNTEO3V3l3eV2ZSb8CbmwnBYxRajQmT8Zwf704IJsFvD7w3yKE3OjqWADvRJNmmwfLs
	T+vQDKOAIvMoKkYvuJMloBNNWL2NQZR5jzQmE5cPyykKi4n2DWIMjoI5zY0iWyv5/fEY7cPgvRoHY
	6hAX+WFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXBe-00000002wDb-03as;
	Fri, 22 Nov 2024 17:11:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXAg-00000002vwA-2SeH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 17:10:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7248c1849bdso2423193b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 09:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295418; x=1732900218; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UzD8Qbmoty9y3UdrVjMc3lCWpv9Zoxn+WCwHClf78I=;
        b=FkSbTgN7p2pXfmHGQMHAO+TAIDUlq2WwJKXTNbFVwGMxtqYBrtt9sr+Rse00meAT5Q
         tLm9UmN8sEOhPylaBp5lfICPDqJPsUyPcnpoS6VraRk4cFcEzFIZYbLTLgY4zq8TiXpk
         Q5BY2PMZAsLAEH3BwbQ6B9EvEiST9J1o1QoSnXPAzH+6DdqKJBTFdKPbTXaZVDufFd5p
         EKZgPSh42FCDnoZb948ZoN+EIpi9R7aW3EJwcoVQju1T8o++owijbhvPsyC89fclcMcT
         lZUQZWeOP2z1TFnBvrqICpWTLVwzMTASq99+ei/fmwdKXK0YZS0Jtfs2Hv2HspiKk25a
         QE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295418; x=1732900218;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/UzD8Qbmoty9y3UdrVjMc3lCWpv9Zoxn+WCwHClf78I=;
        b=osdj4GIzjEUyePF7LkrAswYTs0CxofQLfhhB0B5BxWY1KPQOK4mW/yz+wj/A09Sqxg
         ycwunoMpKescsvSrHadZfOsnK8elkbZH4iMawb6KllBzoAkzpWBbmrPTFbEKT1RbV0nO
         DaCgbFMk4BcIcCch5TeqZF5P2LzxbuH3xzEfnor7lMqX9XXG9G92PRDgvzqAKuB1skyA
         K/JDU3ICy0LsYhQTOK1Bst9s7tcKU+Lon0Iys1cS1IiHqyBl6roZKcS6rD2ndcAFWIc1
         nwQ+ud69iwJDPezBWQq6MgdDa0YU2XfyLqIbHsTrxwXdnw0NyEPVbk7ZrCNNbHkJyMgs
         3OeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWpiN0BM4QcFRR3DB4Q7vTutQ7EZ7HmAyPv1PScSR0jBPB/oMoVwwXQvOFO0r1cJ1On6zL018yB0haJUIqITti@lists.infradead.org
X-Gm-Message-State: AOJu0YwhL6g5uvMUm0jXagAYsaoz2dfzZiSW5AqHqD7zqpx7ZWrtCnD0
	zQPJtHHVQEhjxRSxn7YHYbrZh1Fp42hJ2doHWRwIOh9vzMvXcllUMAD4lUMZUA==
X-Gm-Gg: ASbGncuWclCXHhDOEh+wBETw/RLqpdTlQFflMQcCpWRzAm8xZJwrXGQD8N8cLngJAmR
	zpo8VVl0d/9WIA5tBzw6M2WvUOxsV6N84eD+OWv94lFdLN6Zz0efUO4yLOijUHMCxL6eONLHlK9
	1h0KS4eVjwGWnG9otC4QYPvwUQLKTN+UMzHcqCXo8mtdBGhWfiqnSjq6NPjUcedSNtEGPwPw2Fi
	BsXETXRYPn0kuST6I1znwSfzIlyxWoFb2xmr6sFacTcV113WeYAepo2K2tl
X-Google-Smtp-Source: AGHT+IEwjs4uHZtrKVZd87ooqlW4TAiWtY5jzSaWXJxP5mRGV9M6kvrK8gtdD6fzbjrc4NKONPYTYQ==
X-Received: by 2002:a17:902:cec9:b0:212:23e5:6202 with SMTP id d9443c01a7336-2129f67b3f6mr39737875ad.6.1732295417733;
        Fri, 22 Nov 2024 09:10:17 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de531b82sm1911272b3a.102.2024.11.22.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:10:17 -0800 (PST)
Date: Fri, 22 Nov 2024 22:40:10 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kw@linux.com" <kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses
 from DT
Message-ID: <20241122171010.ze6iyxmgaq7g7yr6@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-4-hongxing.zhu@nxp.com>
 <20241115064106.iwrorgimt6yenalx@thinkpad>
 <AS8PR04MB86766F6553A36E75A2B1F6C78C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB86766F6553A36E75A2B1F6C78C272@AS8PR04MB8676.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_091018_629457_EBADF776 
X-CRM114-Status: GOOD (  30.10  )
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

On Mon, Nov 18, 2024 at 02:59:35AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Sent: 2024年11月15日 14:41
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: l.stach@pengutronix.de; bhelgaas@google.com; lpieralisi@kernel.org;
> > kw@linux.com; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > shawnguo@kernel.org; Frank Li <frank.li@nxp.com>;
> > s.hauer@pengutronix.de; festevam@gmail.com; imx@lists.linux.dev;
> > kernel@pengutronix.de; linux-pci@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v6 03/10] PCI: imx6: Fetch dbi2 and iATU base addesses
> > from DT
> > 
> > On Fri, Nov 01, 2024 at 03:06:03PM +0800, Richard Zhu wrote:
> > > Since dbi2 and atu regs are added for i.MX8M PCIes. Fetch the dbi2 and
> > > iATU base addresses from DT directly, and remove the useless codes.
> > >
> > 
> > It'd be useful to mention where the base addresses were extraced. Like by
> > the DWC common driver.
> You're right. How about change them to the below one?
> The dw_pcie_get_resources() function of DWC core codes can fetch the dbi2 and
>  iATU base addresses from DT directly, and remove the useless codes here.

"Since dw_pcie_get_resources() gets the dbi2 and iATU base addresses from DT,
remove the code from imx6 driver that does the same."

- Mani

> 
> > 
> > > Upsteam dts's have not enabled EP function. So no function broken for
> > > old upsteam's dtb.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > 
> > Reviewed-by: Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > 
> > - Mani
> > 
> > > ---
> > >  drivers/pci/controller/dwc/pci-imx6.c | 20 --------------------
> > >  1 file changed, 20 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c
> > > b/drivers/pci/controller/dwc/pci-imx6.c
> > > index bc8567677a67..462decd1d589 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -1115,7 +1115,6 @@ static int imx_add_pcie_ep(struct imx_pcie
> > *imx_pcie,
> > >  			   struct platform_device *pdev)
> > >  {
> > >  	int ret;
> > > -	unsigned int pcie_dbi2_offset;
> > >  	struct dw_pcie_ep *ep;
> > >  	struct dw_pcie *pci = imx_pcie->pci;
> > >  	struct dw_pcie_rp *pp = &pci->pp;
> > > @@ -1125,25 +1124,6 @@ static int imx_add_pcie_ep(struct imx_pcie
> > *imx_pcie,
> > >  	ep = &pci->ep;
> > >  	ep->ops = &pcie_ep_ops;
> > >
> > > -	switch (imx_pcie->drvdata->variant) {
> > > -	case IMX8MQ_EP:
> > > -	case IMX8MM_EP:
> > > -	case IMX8MP_EP:
> > > -		pcie_dbi2_offset = SZ_1M;
> > > -		break;
> > > -	default:
> > > -		pcie_dbi2_offset = SZ_4K;
> > > -		break;
> > > -	}
> > > -
> > > -	pci->dbi_base2 = pci->dbi_base + pcie_dbi2_offset;
> > > -
> > > -	/*
> > > -	 * FIXME: Ideally, dbi2 base address should come from DT. But since only
> > IMX95 is defining
> > > -	 * "dbi2" in DT, "dbi_base2" is set to NULL here for that platform alone
> > so that the DWC
> > > -	 * core code can fetch that from DT. But once all platform DTs were fixed,
> > this and the
> > > -	 * above "dbi_base2" setting should be removed.
> > > -	 */
> > >  	if (device_property_match_string(dev, "reg-names", "dbi2") >= 0)
> > >  		pci->dbi_base2 = NULL;
> 
> The check and the NULL assignment of "pci->dbi_base2" should be removed too
>  refer to FIXME listed above. Would updated in v7 later, Sorry about that.
> 
> Best Regards
> Richard Zhu
> > >
> > > --
> > > 2.37.1
> > >
> > 
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

