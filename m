Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F57C36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NljLKexdzU/wZa24DdGEYHDFRoFsM9u+xFVZ7GdPxvc=; b=RrO0nEBQHR03KvrxHHply8XPy1
	iIP+/ulh/5N/z9pwbTOsnLW8Zlw0Vf3TKmCPFbTHRtHUdL2x1R6oJIl+QrQ18xo+0wQGfwOUYy5Ur
	HSJEPcZVveGcOF2CItdqKcukhS5K8YlJbeeXAw4SXiXuXr5TN8ejaAdia5VqiFsrbxTlJPjVo3O85
	znb1pMwuPh6BMjGZnE428wLIqYQImqS8q4Ct4/jjBTV/2thiSF8hQy8vtEWfyUVBNk+uS1TTzNp1b
	b9k3nE9cxDN7ymiE+iIT8PNYUJqiefDQhxgBql26U6rg2PE6yLHus0S1wT2tVbQNeDJDOctZL1pHL
	0vBQD/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu0d-00000005cXT-2GWk;
	Wed, 02 Apr 2025 09:03:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztyq-00000005cEe-491j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:01:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FA6612FC;
	Wed,  2 Apr 2025 02:01:55 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 937A73F694;
	Wed,  2 Apr 2025 02:01:51 -0700 (PDT)
Date: Wed, 2 Apr 2025 10:01:47 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v1 9/9] coresight: Consolidate clock enabling
Message-ID: <20250402090147.GF115840@e132581.arm.com>
References: <20250327113803.1452108-1-leo.yan@arm.com>
 <20250327113803.1452108-10-leo.yan@arm.com>
 <b9046586-c884-484f-a308-9f256d3d99f5@linaro.org>
 <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a34b1ac-5681-4cd8-b960-a154d8678fa2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_020153_067735_C3455B7C 
X-CRM114-Status: GOOD (  25.90  )
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

Hi Jie,

[ + Rob ]

On Wed, Apr 02, 2025 at 08:55:51AM +0800, Jie Gan wrote:

[...]

> > >   {
> > > -    struct clk *pclk = NULL;
> > > +    WARN_ON(!pclk);
> > >       if (!dev_is_amba(dev)) {
> > > -        pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > > -        if (IS_ERR(pclk))
> > > -            pclk = devm_clk_get_enabled(dev, "apb");
> > > +        *pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > > +        if (IS_ERR(*pclk))
> > > +            *pclk = devm_clk_get_enabled(dev, "apb");
> > > +        if (IS_ERR(*pclk))
> > > +            return PTR_ERR(*pclk);
> > > +    } else {
> > > +        /* Don't enable pclk for an AMBA device */
> > > +        *pclk = NULL;
> > 
> > Now the "apb" clock won't be enabled for amba devices. I'm assuming
> > that's fine if the clock was always called "apb_pclk" for them, but the
> > commit that added the new clock name didn't specify any special casing
> > either.
> > 
> > Can we have a comment that says it's deliberate? But the more I think
> > about it the more I'm confused why CTCU needed a different clock name to
> > be defined, when all the other Coresight devices use "apb_pclk".
> 
> Hi James,
> 
> The original clock-name for CTCU is apb_pclk, but the dt-binding maintainer
> request me to change it to apb, that's why the clock name is different from
> others.
> 
> I am not why we need apb instead of apb_pclk in dt-binding. Maybe some rules
> have changed for dt-binding requirement.

My conclusion is that if a device is an Arm Primecell peripheral, it
should use the clock name "apb_pclk" (See the DT binding doc [1]).

CTCU is not an Arm Primecell peripheral, so it does not need to strictly
follow up the clock naming for Primecell peripheral.

In Arm CoreSight framework, for code consistency, I would suggest
using the clock naming "apb_pclk" for the APB clock for a newly added
device that even it is not a Primecell peripheral.

(We don't need to make any change to the CTCU driver, as we need to
remain compatible with existed DTB blobs).

Cc'ing Rob in case he has any suggestions.

Thanks,
Leo

[1] Documentation/devicetree/bindings/arm/primecell.yaml

