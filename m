Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FDDC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=; b=VssIxti/a2Nz8L3lJ/0fcw0jLo
	oiBmCzGz4usIMmeWgy63aFoKEf/wIkrz+5txyOAcBirbmLEfE3LECSr8qbiFmX/EMmjlzb0Xwe201
	K3Lx3hCwq368WPTR1P5D0R4at/zagTpAjHajXsu6JeBXqqUE/VUFtFKrvBOhK3WI2lZbwOs67aPl3
	PkQqvmbvDuY67eXW6K1AQZVoUAXrOkXEXESv5PfENILdKd9D74GyxmjPsn/Mu22lc+cs4N8kDdWZq
	pB4PpH5DSBxrfCkm1bt99D8f83uiRw5YbkEwBg3zPZp1c7QQ2j2TF7gNGVK5sU4iDZ/MZaKk8gR1K
	CpnYBJyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PdF-0000000CMKV-0yjn;
	Tue, 01 Sep 2026 14:38:37 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PdD-0000000CMJx-3V73
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:38:36 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6b1b1d128a0so689476eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788273515; x=1788878315; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=;
        b=HIkdz+RBx3brl7pFf6f0INLfj/IcjvsiW/89/NC82DtvAWTb9SN5NTJSz2B+G7zv4Y
         lZ6Y4+NZpmODwtudZQspV5l62Oed5hAsO1vhRzx5WoQUlz80flZoynSAtPIZIZKHjMl5
         lQoJIp1lNHtGDosaoqFKmSCs4zsWq14kRSmfCWAhQBNSl4RrHvv+NbXsmcIr/TrW4FBW
         aOHyM92hp98rRj5QYLRlMsPu4ZSCFFISFb1uN7zlv8RfS19i2c0p9xoRGrL4uSf4T/7q
         KTKyjPPAtKaYa9xPrH/C3BPRxxiQqG1kylmyMx8vjvwcZI48WXgVXiCC7KPkiTgtPCPg
         ZzHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273515; x=1788878315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BSVwyibyFfIHGL0TlXMcUmW3kV25Hg4l49RcXdnb+4E=;
        b=XmhghqK06UY/PURNzqghsH9pKYtRo3Hby+Y9uYm3CXEbIaYLus+1G/a8wXLRNjRX0B
         aEvtUhSfK6ePY2I1lY+sRNMBYvt2RJXALADCR9ctqDFSyTTMmJuIUb9Dste1A97y3Sb2
         t6ozAfbq2sXB5iYMfLw2aaBsUtBxhELUMF6NAJXTxsFWm3Q/YTfXZH8RirHmA5AzliyS
         gY++ws1r+mfIQQokWhT7k2rryBqoe0wGfVh0NTZgNa+hMF3F8Wgy9rog6tsXkUKpyUMK
         dCyyyON+1yuIV7auhbMLhq9Cqwv1ta1gqB2g3bVoP5GtqtrLCxm3ALK2a9OxuAE/ATuR
         1RSw==
X-Forwarded-Encrypted: i=1; AHgh+RoaRNWcSPLrsoNJ2m1MjY0n05A0KynCT/bvZ6NEmeCGfATm0L2GcvnLzPWqpGPDh6t+VBF8JsN2JJ8ULgLBKOYA@lists.infradead.org
X-Gm-Message-State: AFuF++kadX9S5sLoKmxUq9/jpIfbmO/FnyACR8vdc4fNvtZWXv130J3M
	fRpxymWS/TC3m27wPl/r0TJfr7FEKLHv72Z24S0cwwcbRyEP4ZQSjLF0u9u5njfW0WDJyHOQQjQ
	hJonU
X-Gm-Gg: AR+sD11jXWe5BHXEwnRxNHsaliFDVP+4GP/Vk/xQqXASRR+Q/1MZmy7HD/EDG5ap689
	P9jXMul+TtEJLlP+GCBMWKZvjZ5SuRCCUH0yIenddDi0sExeE4b/TCb4YPRlCODBg24PONfWhuZ
	0NsP7QYbQC/tTGecMqT58u8VZCVW6MNazbCqPi5vJ0HER6tLb6HPBwKZOAWBMIib6dyvXgEcZex
	A8d/y0Z6vORcNGAScp7lIHYKHNkYmn4KhURN4eUN/KzAaMFizYlsCpj9akZ+JGllzYgH8aZfdqJ
	naAtSN7rB+UnA7LaNFVSN+8mecjluHY92EWsFDscfgw3CVR8g//Vv0PyBDaqhw2xc1JTk2/39Lp
	R+3VjwEdeqX/cEQcpRtp8wkIqmeMz2GMRfKD3HoZ4uZMg4+GHBLDxpAVMdReAL0lKkzP8MxPaIO
	wNdJsNTCNpinE7wKg4UIgTqvYjWO9tx8vXeTb5GmFEzg/KSs56cmvWxL5K5fdnGeNas2AHUlAAX
	M6AA4SThIPIj8G+RlEVp6hGmG/tI36txZBdpaFzrXGNvw==
X-Received: by 2002:a05:622a:948:20b0:530:2ded:eb32 with SMTP id d75a77b69052e-5302dedececmr22533091cf.2.1788273142344;
        Tue, 01 Sep 2026 07:32:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe7fbe06sm96855001cf.17.2026.09.01.07.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:32:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x1PXA-0000000BhaA-3wav;
	Tue, 01 Sep 2026 11:32:20 -0300
Date: Tue, 1 Sep 2026 11:32:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alexey Kardashevskiy <aik@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [RFC PATCH v4 01/16] iommu/arm-smmu-v3: Discover RME support and
 realm IRQ topology
Message-ID: <20260901143220.GB56830@ziepe.ca>
References: <20260427085344.941627-1-aneesh.kumar@kernel.org>
 <20260427085344.941627-2-aneesh.kumar@kernel.org>
 <apMjUSbxcnlAKjks@nvidia.com>
 <yq5aik4pnyul.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik4pnyul.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073835_882264_C9931308 
X-CRM114-Status: GOOD (  18.29  )
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

On Tue, Sep 01, 2026 at 02:16:10PM +0530, Aneesh Kumar K.V wrote:
> +static struct irq_domain *arm_smmu_get_wired_irq_domain(struct arm_smmu_device *smmu)
> +{
> +	int irqs[] = {
> +		smmu->combined_irq,
> +		smmu->evtq.q.irq,
> +		smmu->gerr_irq,
> +		smmu->priq.q.irq,
> +	};
> +	struct irq_domain *domain = NULL;
> +	struct irq_data *irq_data;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(irqs); i++) {
> +		if (irqs[i] <= 0)
> +			continue;
> +
> +		irq_data = irq_get_irq_data(irqs[i]);
> +		if (!irq_data || !irq_data->domain)
> +			return ERR_PTR(-EINVAL);
> +
> +		if (domain && domain != irq_data->domain)
> +			return ERR_PTR(-EINVAL);
> +
> +		domain = irq_data->domain;
> +	}
> +
> +	return domain ?: ERR_PTR(-ENXIO);

I'm not excited to see code like this in a driver. Please put a helper
function someplace else to translate whatever the RMM value is into a
normal linux irq number?

But this feels wrong to me, interrupts need to come through the FW
side, ACPI or DT. Having RMM pass the value outside that
infrastructure is going to be painful. None of this is trusted, why is
it working like this vs just adding more interrupt lines to the FW
description?

A naked integer is not enough to describe an interrupt in the system,
and guessing that it is connected to other interrupts in the psmmu
seems like an uncomfortable leap to me.

Jason

