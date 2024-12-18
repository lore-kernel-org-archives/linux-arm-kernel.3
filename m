Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0375EE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrVaSMgbTfMEJQGridzhaDtd8gpO8DG1MuI/x/WUz/s=; b=c+OX9Nj84Y/O0gyjRSdylxODgZ
	WVh0dJj6hsLxT6Je9SOsgogYUaFZX2qoJkvpOWIcKDX61CV9q0Yy8yNQox18mPn9Qc1C8Oa5uWq5U
	jWgdfdYvIXcj7MxCJL+EU5PEJsn/ElLrPgsliQW81PhWxjAkyFuQfh1etDTmTcEe15mascmXu3AMS
	D9ZE2/wChPLCxeiEHdOSXS+mETSt9Bg1RZ9IRh3dYLmvNaQ5Aaxjaz4+63ZD+oeOQAUOKVpj4W2Bn
	A7bIFCcpmgZdI2/g7XM1msoRNzrCNgPGwsskSNpms4ojum/yIaULk56m65lLju99odYsJDJ0c8K63
	oBrfXRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsaS-0000000GVlw-3n1O;
	Wed, 18 Dec 2024 11:51:32 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsVc-0000000GUor-1uVY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 11:46:35 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef70c7efa5so4468375a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 03:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734522392; x=1735127192; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TrVaSMgbTfMEJQGridzhaDtd8gpO8DG1MuI/x/WUz/s=;
        b=PMnqZoj654QBF38j2rHm002Hu+E6ljMnw0serFq0vG90WyLnouW1IlP8W7gU1H2BAY
         N1LesT8ZuwN4BnafjrAt2gHn7xsDM0QjtEUb3CK6FpO7qim/Q7mwKh43yRSIXETNzyK9
         /7p6WLz/IC+1RiMQzilDeO/vfhWZkSSqOfqMfDT8gXARrIraNxfG4u+z5/SW1WFXiruX
         XmFQE8n0JCA9lWrcTxT68186fNq5lBscKJGY3EtxoECFp9fAXWYze11F2ZU8WaV5sOL1
         pbcITzTkdQOzFQIo6j+AeIFwy97vYd9q37nD/1Jjt18QLjgPE7PC5KHmRhM7KMs0pTo3
         HuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522392; x=1735127192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TrVaSMgbTfMEJQGridzhaDtd8gpO8DG1MuI/x/WUz/s=;
        b=SZP1TF8WBG9V8ts5fdWhRX+T13OROJ3/m02kUI1t+MlOA8RCdPa2Bf5YUA00eLU8Dn
         95TOsXIUXMSDxkhmGhsj9vUD0dAOWz068EHAnBQD6NeJNz8hiJRhnaZc6N4WePIJ2WRd
         QCBY7Zf+P6PMPaT+pnBniJ2/8zygSampoORWrXggzi6Hna74IjYlRlTORk/89O5srB9e
         hFc0jUa6I9KfXNiR4kWkS9NZkN9LoGEzS0HDds2B0JMBTsu3zuPy6vu3/xk0x6kbIC6u
         vkIfEJQZ/Q7DgdPQi2Uc474qqsdZPCuhR/jm7CBHkPP9Ipt9MW9V9utwt97WQ3VUaWyc
         W1QQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+duRmR05awI3AIFZ5+3faP3X5SRYwEEbHwH87pYAb27YGchgB3QNTnx5IjKCwGQ9poP7J1tUljUoX7ahTE8zN@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxq5JllSzqU5o06y+tP7SL79Mq26sUO3XrRGwxSY4wpPhoFTo/
	3zltEOssrAywuw13gDetj2v4gh/hyZ0CXMxQ2hu0K5cNb3qGt0knMX38KfgQNA==
X-Gm-Gg: ASbGnctkmiUyXKEBO4i0qc56aFtNrbzcQi4p9JdG7StvwroTyPeIU/IoNMM9Zhz9Rqr
	U7wKDr4HsD+wc8J3WPA8jj61xrviH1GbUH/yRA0yZuTetrWSYalSQ7OiHXCS+Qux9mJFsG+2tGT
	5KVCAeBh9zgt3fZnc/vYJ4DPJNsCV2JvnWnc44cJ7MORFtCuXAM+wHORsBinWZnxmRmcy3KVMq6
	z0UVbUe0iV2FYj2wsMFk9QpSrqaiXXmbYikvXqKHueq07auhN9tMMuIPFDyPGgOYHV6
X-Google-Smtp-Source: AGHT+IGQCgOq49R63ovvMukQoYUb7D03BYa7ObLjFwjqufc6miUeckdIMCl7aC+v7+RULldgNi6Ukw==
X-Received: by 2002:a17:90b:548f:b0:2ee:8e75:4aeb with SMTP id 98e67ed59e1d1-2f2e91f6469mr4114590a91.17.1734522391875;
        Wed, 18 Dec 2024 03:46:31 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee06dd84sm1313616a91.38.2024.12.18.03.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:46:31 -0800 (PST)
Date: Wed, 18 Dec 2024 17:16:22 +0530
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
Message-ID: <20241218114622.3fgdooag6hwlmipr@thinkpad>
References: <20241126155119.1574564-1-christian.bruel@foss.st.com>
 <20241126155119.1574564-3-christian.bruel@foss.st.com>
 <20241203145244.trgrobtfmumtiwuc@thinkpad>
 <ced7a55a-d968-497f-abc2-663855882a3f@foss.st.com>
 <20241218094606.sljdx2w27thc5ahj@thinkpad>
 <d15cec4e-e06a-47f7-aa8a-744c0829d244@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d15cec4e-e06a-47f7-aa8a-744c0829d244@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_034633_306568_7869C762 
X-CRM114-Status: GOOD (  36.10  )
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

On Wed, Dec 18, 2024 at 12:24:21PM +0100, Christian Bruel wrote:

[...]

> > > > > +static int stm32_pcie_suspend_noirq(struct device *dev)
> > > > > +{
> > > > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > > > +
> > > > > +	stm32_pcie->link_is_up = dw_pcie_link_up(stm32_pcie->pci);
> > > > > +
> > > > > +	stm32_pcie_stop_link(stm32_pcie->pci);
> > > > 
> > > > I don't understand how endpoint can wakeup the host if PERST# gets asserted.
> > > 
> > > The stm32 PCIe doesn't support L2, we don't expect an in-band beacon for the
> > > wakeup. We support wakeup only from sideband WAKE#, that will restart the
> > > link from IRQ
> > > 
> > 
> > I don't understand how WAKE# is supported without L2. Only in L2 state, endpoint
> > will make use of Vaux and it will wakeup the host using either beacon or WAKE#.
> > If you don't support L2, then the endpoint will reach L3 (link off) state.
> 
> I think this is what happens, my understanding is that the device is still
> powered to get the wakeup event (eg WoL magic packet), triggers the PCIe
> wake_IRQ from the WAKE#.
> 

Honestly, I still cannot understand how this can happen.

> > 
> > > > 
> > > > > +	clk_disable_unprepare(stm32_pcie->clk);
> > > > > +
> > > > > +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev))
> > > > > +		phy_exit(stm32_pcie->phy);
> > > > > +
> > > > > +	return pinctrl_pm_select_sleep_state(dev);
> > > > > +}
> > > > > +
> > > > > +static int stm32_pcie_resume_noirq(struct device *dev)
> > > > > +{
> > > > > +	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
> > > > > +	struct dw_pcie *pci = stm32_pcie->pci;
> > > > > +	struct dw_pcie_rp *pp = &pci->pp;
> > > > > +	int ret;
> > > > > +
> > > > > +	/* init_state must be called first to force clk_req# gpio when no
> > > > 
> > > > CLKREQ#
> > > > 
> > > > Why RC should control CLKREQ#?
> > > 
> > > REFCLK is gated with CLKREQ#, So we cannot access the core
> > > without CLKREQ# if no device is present. So force it with a init pinmux
> > > the time to init the PHY and the core DBI registers
> > > 
> > 
> > Ok. You should add a comment to clarify it in the code as this is not a standard
> > behavior.
> > 
> 
> OK
> 
> > > > 
> > > > Also please use preferred style for multi-line comments:
> > > > 
> > > > 	/*
> > > > 	 * ...
> > > > 	 */
> > > > 
> > > > > +	 * device is plugged.
> > > > > +	 */
> > > > > +	if (!IS_ERR(dev->pins->init_state))
> > > > > +		ret = pinctrl_select_state(dev->pins->p, dev->pins->init_state);
> > > > > +	else
> > > > > +		ret = pinctrl_pm_select_default_state(dev);
> > > > > +
> > > > > +	if (ret) {
> > > > > +		dev_err(dev, "Failed to activate pinctrl pm state: %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	if (!device_may_wakeup(dev) && !device_wakeup_path(dev)) {
> > > > > +		ret = phy_init(stm32_pcie->phy);
> > > > > +		if (ret) {
> > > > > +			pinctrl_pm_select_default_state(dev);
> > > > > +			return ret;
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > > +	ret = clk_prepare_enable(stm32_pcie->clk);
> > > > > +	if (ret)
> > > > > +		goto clk_err;
> > > > 
> > > > Please name the goto labels of their purpose. Like err_phy_exit.
> > > 
> > > OK
> > > 
> > > > 
> > > > > +
> > > > > +	ret = dw_pcie_setup_rc(pp);
> > > > > +	if (ret)
> > > > > +		goto pcie_err;
> > > > 
> > > > This should be, 'err_disable_clk'.
> > > > 
> > > > > +
> > > > > +	if (stm32_pcie->link_is_up) {
> > > > 
> > > > Why do you need this check? You cannot start the link in the absence of an
> > > > endpoint?
> > > > 
> > > 
> > > It is an optimization to avoid unnecessary "dw_pcie_wait_for_link" if no
> > > device is present during suspend
> > > 
> > 
> > In that case you'll not trigger LTSSM if there was no endpoint connected before
> > suspend. What if users connect an endpoint after resume?
> 
> Yes, exactly. We don't support hotplug, and plugging a device while the
> system is in stand-by is something that we don't expect. The imx6 platform
> does this also.
> 

You should reconsider this approach. You'll never know how the OEMs are going to
use the PCIe slot. And lack of standard hotplug is not preventing users from
doing hotplug (they could try to do rescan themselves etc...)

- Mani

-- 
மணிவண்ணன் சதாசிவம்

