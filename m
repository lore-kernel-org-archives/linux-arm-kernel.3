Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D263D6ACF3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7funRjx8lQefW5KmPdssuiZ8xdwFD6h0t0ZpnfERmc=; b=0VgXkO1+FC+9t8AR9OPJxbo4Vl
	VVZIFkryUsKG38OLuImz/TVYZGOCeqKkUzbRsz9b68Wj/vOFPexL91j1e5io/DBEIQCdifE9pQmBR
	1waTxc2IvgmB2RCcBKCRCxHdxR0p0XuM0xXTmOYxrkfXH6XL13TCDq5ie3AvurB4D2FzYFCG3N3Ms
	EuxBP6MHfl0fxftYDmlHocWaS7TUEoATU69VOugj8p+SyAj6NgauU9Pg0/p3W8/NMGe6dFHc+GIij
	zbNlRDcXnBFG60MaX2TnudvJSR89ZRL0bSNHU2oCioJ0qRMRCN61Tudqqmpc4GDgn/wD2+bk5F0Kd
	YznntIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGL26-0000000DeVf-387d;
	Wed, 27 Nov 2024 16:36:54 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGK1Y-0000000DWDD-3gsg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 15:32:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A385C0003;
	Wed, 27 Nov 2024 15:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732721533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z7funRjx8lQefW5KmPdssuiZ8xdwFD6h0t0ZpnfERmc=;
	b=h06J1PDOzfKrBbGwfuW0v6NUw0khhYs9VoDHlDHLcSVyAqnV0uLino82KRIw6a4e+8ZhfR
	eDBAD1uXmHeolU/BdytnrqQwv4fvXGhH61bh+h37HZfYj+iPj1mNh0vSGGle+pA8e6gDum
	WCnvOjxqje1DUDf8VRVTZdlRcdpEr7ifbs2P8I3yPuTtlXK85hQGqZBWSQRsQshfjH9Kd4
	SIAsONboJNmzMpZMch60c/JBcr6V/gAYMG5t+nBRKpByV/G9JPekxNq7YKEHcRWlU2fpir
	88+7ZQzN8t93bjkRlFDq6WrWQtHFXoPc272JWtE3C0AAC+fbmjzXe68yIKKZPg==
Date: Wed, 27 Nov 2024 16:32:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: Re: [PATCH v5 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Message-ID: <2024112715321236991788@mail.local>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
 <20241126114940.421143-3-ciprianmarian.costea@oss.nxp.com>
 <Z0YN+5GfP6iR8a/A@lizhi-Precision-Tower-5810>
 <14e90ec7-3815-4f06-826c-3fcf0d8d53c8@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14e90ec7-3815-4f06-826c-3fcf0d8d53c8@oss.nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_073217_192452_B75673D4 
X-CRM114-Status: GOOD (  18.72  )
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

On 27/11/2024 17:07:48+0200, Ciprian Marian Costea wrote:
> > > +	if (priv->dt_irq_id < 0)
> > > +		return priv->dt_irq_id;
> > > +
> > > +	ret = devm_request_irq(dev, priv->dt_irq_id,
> > > +			       s32g_rtc_handler, 0, dev_name(dev), pdev);
> > > +	if (ret) {
> > > +		dev_err(dev, "Request interrupt %d failed, error: %d\n",
> > > +			priv->dt_irq_id, ret);
> > > +		goto disable_rtc;
> > 
> > 
> > Already enable rtc at rtc_clk_src_setup(), you direct return fail after
> > check clk_get_rate();
> > 
> > if you want to disable_rtc, you use devm_add_action_or_reset() to add
> > a disable action callback and return dev_err_probe() here directly.
> > 
> > Frank
> > 
> 
> Thanks for pointing this out. I will use 'devm_add_action_or_reset' in V6.
> 

Won't this disable the RTC on driver unload which we already discussed
should not be done?

> > > +	/* Reset RTC to prevent overflow.
> > > +	 * RTCCNT (RTC Counter) cannot be individually reset
> > > +	 * since it is RO (read-only).
> > > +	 */
> > 
> > what's happen if overflow happen? I suppose it should go back to 0 and
> > continue increase?
> > 
> 
> Indeed if overflow happens the 'RTCCNT' counter goes back to 0 and continues
> to increase. The reason for resetting it here in 'suspend' routine comes
> after dropping the rollover support (as agreed on V4 of this patchset) to
> prevent an overflow during the standby state.
> 

I don't think the overflow matters as the comparator should continue to work
properly after it happens so you always have the complete range to wait
for the alarm to happen.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

