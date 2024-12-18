Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B562E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXXsnJWHazfaSUP/GHMRDCdHmTBTRf0ix5hsVwacD90=; b=lwHglX2jX+QSUvxOJJblhXOu1r
	LKgUyd8A9vY/O58suO5Qjy8l3W5VZnKNsFHGb7UmpFGeeinR2zIWZjhEHGSQLfVpaFNkZnK9AKZ4k
	U7YauHie3ZsxEaein0b5EBtVI4NpsBtbqeeb6h1Rli1TfaxTURqxqY5koYJulcNgpI55GNwqKYeSu
	ol/KywtL3kSmVAvFL4m1FJ2xbkd0cU8o3wBXTh7SJy0T67+dbot4DmvxHfvCZeI5LJIbv+d9/q++v
	+NXnDMfyGI8dBpOGiiGyIWTNKpCYoEdwSJXNHOPeb2/kRpqTMHs5C02R958zU9xbsRo8fewjyDAV1
	oibPaYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqiz-0000000GB04-3PaA;
	Wed, 18 Dec 2024 09:52:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqdD-0000000GA6T-3TNL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:46:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2165cb60719so50434575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734515175; x=1735119975; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXXsnJWHazfaSUP/GHMRDCdHmTBTRf0ix5hsVwacD90=;
        b=pJG6bmpRPDOjHR0uJTFoA/L3gchI7f6atkixQp123xEgWC8PQcu55Wl9ReNQAkmd9b
         9/CyzaDQXeZ6jAE0KDxHhqlqn8MALHPnk5Yn70kCIydHzNPFgh9SYfRTaccf5Qqm4H8C
         9j/rBjIdF8kl8GyFuZU9LD8ZyIEVIuNtdG8MYT6009+9w8eOUg+IRf+PLBnOzvJIMmrq
         vRe5hspTrBl5nIn+9fslQbuahMmGIi/anFWqSea+Sqke8PptD7+v4Fg0CbjZOGECma3Y
         lLjT1HeR4NwPGW49SrKW2e6l1Mwgb0Yv9RyDBGmAP1FwCOQYywyqVES/u4ZdpbMJ9x4M
         3q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734515175; x=1735119975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXXsnJWHazfaSUP/GHMRDCdHmTBTRf0ix5hsVwacD90=;
        b=sFsk034DzEZqrEC115TZ4ubTlI9i8qlp69bux+B+CB8LI8h4AcRFBwTz+EQheNaOvc
         nvtXWS2kHxFlvPCgolZjKTHHGCz6J/10Y1/J9eRiYd4f18ZjKECd9qfk0h6SssOYe0rO
         bzUyNvrNxdqsXYOHKxjZaQ8EnlS2KD1XfayOT7//Ct/LdleZbOIQIE55tWeJ/paOcIgC
         3blojlmfI3abFJ6+CyopoPyAzm4tKbXxTx53Y159S7dz8d0dL2W6kQFGs5DYf2ujPA1a
         HbMtPqQXAt8DDI/SuryYS9WrJsnxsYDn0KuAubmoQ/QwubMq4S5M2W/d21+4OeDZ79kc
         CIjw==
X-Forwarded-Encrypted: i=1; AJvYcCW79nFUkEH/ttNzmw5VLlrIIv8TVcjFzUXg7jzuGqA++NzN8K7DdIlmnafc5SwGOtUEGD8BT7hVoGMaxUDEhCvR@lists.infradead.org
X-Gm-Message-State: AOJu0YwIc7rfswD8RdoJYmqn6+Lc4L2B0gCRoiwc6c6Bt1l1pD4Bwgcy
	Ey696vuQaPnVgz2iNIZQPxmHIJPAR8DJjrdpxRrqBW9a+4dSraxA2SPg9Mp8LQ==
X-Gm-Gg: ASbGncusuVOWwuZ6uqU40sVRiJAGgJ5nOW2vII+mIY78WF/XQjlo1OvDU6B/LAPI++E
	k9gyFHNK4H/3OijP1sOAJD5k7pCVYop/09o7hnjtzvtiBJs9//Sb3Zr+RRKyAK15jHjUJKGIU2e
	/d/f2iK1Q6wMP3mFA9xFGTHI7Vez7D7ifvbQ7G5d+MrGd91J6mluOE7wYFoCo4nnRN3nrj+yTL0
	kL1jNpcnNWt14KR2PHmAyDvR5NZsBAUMKF/RTrwoai//mCpcYm17ahNLJM4EJrl2red
X-Google-Smtp-Source: AGHT+IFqUIwo1Ikpx9Q1p35hwXgeavzvbPAmGa2NY+JFf2suz00vESnUChpaxHz8BxW9HDpRMZJpNA==
X-Received: by 2002:a17:902:c407:b0:216:2dc5:233c with SMTP id d9443c01a7336-218d724962dmr29793665ad.41.1734515175035;
        Wed, 18 Dec 2024 01:46:15 -0800 (PST)
Received: from thinkpad ([117.193.214.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db5e05sm72437155ad.44.2024.12.18.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:46:14 -0800 (PST)
Date: Wed, 18 Dec 2024 15:16:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	p.zabel@pengutronix.de, cassel@kernel.org,
	quic_schintav@quicinc.com, fabrice.gasnier@foss.st.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] PCI: stm32: Add PCIe host support for STM32MP25
Message-ID: <20241218094606.sljdx2w27thc5ahj@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-3-christian.bruel@foss.st.com>
 <20241203145244.trgrobtfmumtiwuc@thinkpad>
 <ced7a55a-d968-497f-abc2-663855882a3f@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ced7a55a-d968-497f-abc2-663855882a3f@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_014615_870796_24C09C50 
X-CRM114-Status: GOOD (  34.06  )
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

On Mon, Dec 16, 2024 at 10:00:27AM +0100, Christian Bruel wrote:

[...]

> > 
> > > +		msleep(PCIE_T_RRS_READY_MS);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void stm32_pcie_stop_link(struct dw_pcie *pci)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +
> > > +	regmap_update_bits(stm32_pcie->regmap, SYSCFG_PCIECR,
> > > +			   STM32MP25_PCIECR_LTSSM_EN, 0);
> > > +
> > > +	/* Assert PERST# */
> > > +	if (stm32_pcie->perst_gpio)
> > > +		gpiod_set_value(stm32_pcie->perst_gpio, 1);
> > 
> > I don't like tying PERST# handling with start/stop link. PERST# should be
> > handled based on the power/clock state.
> 
> I don't understand your point: We turn off the PHY in suspend_noirq(), so
> that seems a logical place to de-assert in resume_noirq after the refclk is
> ready. PERST# should be kept active until the PHY stablilizes the clock in
> resume. From the PCIe electromechanical specs, PERST# goes active while the
> refclk is not stable/
> 

While your understanding about PERST# is correct, your implementation is not.
You are toggling PERST# from start/stop link callbacks which are supposed to
control the LTSSM state only. I don't have issues with toggling PERST# in
stm32_pcie_{suspend/resume}_noirq().

> 
> > 
> > > +}
> > > +
> > > +static int stm32_pcie_suspend(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +
> > > +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> > > +		enable_irq_wake(stm32_pcie->wake_irq);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int stm32_pcie_resume(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +
> > > +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
> > > +		disable_irq_wake(stm32_pcie->wake_irq);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int stm32_pcie_suspend_noirq(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +
> > > +	stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
> > > +
> > > +	stm32_pcie_stop_link(stm32_pcie->pci);
> > 
> > I don't understand how endpoint can wakeup the host if PERST# gets asserted.
> 
> The stm32 PCIe doesn't support L2, we don't expect an in-band beacon for the
> wakeup. We support wakeup only from sideband WAKE#, that will restart the
> link from IRQ
> 

I don't understand how WAKE# is supported without L2. Only in L2 state, endpoint
will make use of Vaux and it will wakeup the host using either beacon or WAKE#.
If you don't support L2, then the endpoint will reach L3 (link off) state.

> > 
> > > +	clk_disable_unprepare(stm32_pcie->clk);
> > > +
> > > +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
> > > +		phy_exit(stm32_pcie->phy);
> > > +
> > > +	return pinctrl_pm_select_sleep_state(dev);
> > > +}
> > > +
> > > +static int stm32_pcie_resume_noirq(struct device *dev)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > +	struct dw_pcie *pci = stm32_pcie->pci;
> > > +	struct dw_pcie_rp *pp = &pci->pp;
> > > +	int ret;
> > > +
> > > +	/* init_state must be called first to force clk_req# gpio when no
> > 
> > CLKREQ#
> > 
> > Why RC should control CLKREQ#?
> 
> REFCLK is gated with CLKREQ#, So we cannot access the core
> without CLKREQ# if no device is present. So force it with a init pinmux
> the time to init the PHY and the core DBI registers
> 

Ok. You should add a comment to clarify it in the code as this is not a standard
behavior.

> > 
> > Also please use preferred style for multi-line comments:
> > 
> > 	/*
> > 	 * ...
> > 	 */
> > 
> > > +	 * device is plugged.
> > > +	 */
> > > +	if (!IS_ERR(dev->pins->init_state))
> > > +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> > > +	else
> > > +		ret = pinctrl_pm_select_default_state(dev);
> > > +
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
> > > +		ret = phy_init(stm32_pcie->phy);
> > > +		if (ret) {
> > > +			pinctrl_pm_select_default_state(dev);
> > > +			return ret;
> > > +		}
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(stm32_pcie->clk);
> > > +	if (ret)
> > > +		goto clk_err;
> > 
> > Please name the goto labels of their purpose. Like err_phy_exit.
> 
> OK
> 
> > 
> > > +
> > > +	ret = dw_pcie_setup_rc(pp);
> > > +	if (ret)
> > > +		goto pcie_err;
> > 
> > This should be, 'err_disable_clk'.
> > 
> > > +
> > > +	if (stm32_pcie->link_is_up) {
> > 
> > Why do you need this check? You cannot start the link in the absence of an
> > endpoint?
> > 
> 
> It is an optimization to avoid unnecessary "dw_pcie_wait_for_link" if no
> device is present during suspend
> 

In that case you'll not trigger LTSSM if there was no endpoint connected before
suspend. What if users connect an endpoint after resume?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

