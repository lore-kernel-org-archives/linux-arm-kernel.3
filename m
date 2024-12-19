Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955CBE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v4aUMHeWdz3qOQc6NRpiZJgtPcwp/msy8ymDOze/Kr4=; b=G574M1QREiJrYdyb2vYUzhXrvO
	JMlDHl+LzBLtqYHMEBPczX/dSTIvNth1WWMzrLdu17YohWLZmjJZ9u5+Mri7SpNSPv2NFhewmu+/t
	j3MMpTCA++yUdUEKicoM7u7tvvZgvs8Bgp3AzQfw1nRmnS0p/9EVgpZFeqWvw09//E6jhAlpfZcwm
	DUE0hSptKq9wZIIQC9kb4Bf8NGi5i1wLyZExe2Zf54Bl8qs9u70OVF33EbxEb4jSJIVgSkO8nTuqX
	ichlgwvtxojkL3xqCfLCQB3gwWpbEpXwcBSsgYuGYj16qb4JFE/6ELh4/rv5OdwtnwNeqbnXDwloq
	UnNnLcHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKjo-00000002eAX-0i2u;
	Thu, 19 Dec 2024 17:55:04 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKWH-00000002bA6-1qr8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 17:41:07 +0000
Date: Thu, 19 Dec 2024 09:40:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734630061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v4aUMHeWdz3qOQc6NRpiZJgtPcwp/msy8ymDOze/Kr4=;
	b=CBC5IMOSOP6jyWg7+IaJE4Bo3tcuuiYebKBs3pYyUfTLGulDNGTttMQEoWqDTsXpOfca5H
	TKxuRo9Czc20Jni0GFNeYHE9kQeCtpGh65SYKVXsaaVv9/Y+Kr+AHNOpNMj8jutdjG7YrS
	axurksZFAM3wv7Kh6qWKDI0t7NF/0sg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Marc Zyngier <maz@kernel.org>
Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org,
	mark.rutland@arm.com, cohuck@redhat.com, eric.auger@redhat.com,
	sebott@redhat.com, yuzenghui@huawei.com, wangzhou1@hisilicon.com,
	jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
	anthony.jebson@huawei.com, linux-arm-kernel@lists.infradead.org,
	linuxarm@huawei.com
Subject: Re: [PATCH v4 3/3] arm64: paravirt: Enable errata based on
 implementation CPUs
Message-ID: <Z2RapzikZQGgeE_6@linux.dev>
References: <20241218105345.73472-1-shameerali.kolothum.thodi@huawei.com>
 <20241218105345.73472-4-shameerali.kolothum.thodi@huawei.com>
 <86bjx8q995.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjx8q995.wl-maz@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_094105_624720_B298892A 
X-CRM114-Status: GOOD (  15.72  )
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

On Thu, Dec 19, 2024 at 10:04:22AM +0000, Marc Zyngier wrote:
> > +void  __init pv_target_impl_cpu_init(void)
> > +{
> > +	struct arm_smccc_res res;
> > +	int index = 0, max_idx = -1;
> > +
> > +	/* Check we have already set targets */
> > +	if (target_impl_cpu_num)
> > +		return;
> > +
> > +	do {
> > +		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID,
> > +				     index, &res);
> > +		if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
> > +			return;
> 
> Can't you probe for this as part of the KVM guest services?

+1, this needs to be predicated on actually detecting the hypervisor as
KVM.

> > +
> > +		if (max_idx < 0) {
> > +			/* res.a0 should have a valid maximum CPU implementation index */
> > +			if (res.a0 >= MAX_TARGET_IMPL_CPUS)
> > +				return;
> > +			max_idx = res.a0;
> > +		}
> > +
> > +		target_impl_cpus[index].midr = res.a1;
> > +		target_impl_cpus[index].revidr = res.a2;
> > +		index++;
> > +	} while (index <= max_idx);
> > +
> > +	target_impl_cpu_num = index;
> > +	pr_info("Number of target implementation CPUs is %d\n", target_impl_cpu_num);
> > +}
> > +
> >  int __init pv_time_init(void)
> >  {
> >  	int ret;
> 
> Independent of this, I wonder what we should output in sysfs
> (/sys/devices/system/cpu/cpu*/regs/identification/*).

It's a bit crap, but maybe implementation index 0 gets reported through
the 'main' midr/revidr files, otherwise have a directory per
implementation index of midr/revidr.

-- 
Thanks,
Oliver

