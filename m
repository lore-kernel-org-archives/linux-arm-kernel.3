Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317A0CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 10:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITDs0SZM9dbnvubC0vl8Z4+q1ngftINANUFGsQjo+h0=; b=Y7mXto2IbHD/4gly5+neMhlB4D
	BJf3P+dVLMwPen7QyWMOB/MVK++PsyFNAoGQtjy8XI6GSCLHPVJqfqALVHP1CI83kDIdrL1B4Q8O/
	Gg9F2KqTJoVCEqyoaGwTWNvKuzwRAHOrzkjlVxP2qSEGLY0AE9G69W05PTqEPwvhlKwYfdBetekya
	dV9d2XHZW/u54pGKFHDDHR03zVrppo/XgdReDO1YVj3zPIp+Ogc34EsMj5qa4gUuCY3BBIrm5AIvA
	Dy/hsYAZIgBROaojRszICTXz+A4UanTqRw3Zt88VR1tjPiiNusIz4q9EilaN8JjYp7ZvJ1ezyao/d
	WfRPRAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux14A-00000008bhL-1N2U;
	Fri, 12 Sep 2025 10:31:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux147-00000008ber-0uBI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 10:31:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DEE516A3;
	Fri, 12 Sep 2025 03:31:30 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CDAE3F66E;
	Fri, 12 Sep 2025 03:31:37 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:31:34 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: Simplify printks with pOF format
Message-ID: <20250912-axiomatic-pumpkin-teal-9c9fbc@sudeepholla>
References: <20250912092423.162497-2-krzysztof.kozlowski@linaro.org>
 <c5df4196-b951-4f8e-b2ca-c63fba63d1ee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5df4196-b951-4f8e-b2ca-c63fba63d1ee@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_033139_315031_0A42AD2E 
X-CRM114-Status: GOOD (  19.37  )
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

On Fri, Sep 12, 2025 at 11:34:53AM +0200, Krzysztof Kozlowski wrote:
> On 12/09/2025 11:24, Krzysztof Kozlowski wrote:
> > Print full device node name with %pOF format, so the code will be a bit
> > simpler.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  drivers/firmware/arm_scmi/bus.c                | 13 ++++++-------
> >  drivers/firmware/arm_scmi/transports/mailbox.c |  7 +++----
> >  2 files changed, 9 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > index 24e59ddf85e7..c7698cfaa4e8 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -401,8 +401,8 @@ static void scmi_device_release(struct device *dev)
> >  
> >  static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> >  {
> > -	pr_debug("(%s) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
> > -		 of_node_full_name(scmi_dev->dev.parent->of_node),
> > +	pr_debug("(%pOF) Destroying SCMI device '%s' for protocol 0x%x (%s)\n",
> > +		 scmi_dev->dev.parent->of_node,
> >  		 dev_name(&scmi_dev->dev), scmi_dev->protocol_id,
> >  		 scmi_dev->name);
> 
> Heh, I misread the docs and see now in the testing that my patch changes
> the behavior. of_node_full_name() is just node name. pOF is full path.
> 
> This might be desired or not...
> 

That should be fine. I am in the process of changing this but happy to
take this for now. We may have to move to fwnode as we are in process of
adding ACPI support for this. Not finalised yet so it may be a while before
I tinker with it again.

-- 
Regards,
Sudeep

