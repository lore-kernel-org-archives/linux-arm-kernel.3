Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 281A9C79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acbNWtpPknyLrCk/pNLZi+gfhUsY53AY8W5EHv28ZbE=; b=um1D+jfez2ubzf88d/oaiGbIvl
	x8mkiGcrEgtFkXmEWeVl2MOgooioiyer5syWMVplZsy7H9VIYlu1DP5yncxpswurWE5g98BlK1iXz
	vqGyzLVHFXzOQil8uNsA+KK6rEGo5qxPOXq7oUK2XjMFYEe2rJ0SWtdC3k37XNURXUduyMmwp1mtS
	iaDQMuGOExvTMSqSXs7BjNKGf7akqA+kEnVD2zywRfZ/fILzO+IP9jqmGz+HKhxK+guIUd3ugJgCr
	R2Sy8va/pMKYvWXPfACMIUekP9VxWFPppk2e2ab4/HZ6jd33O27pRomdLB+DhpXNQiH3LD/Ej3fP2
	KhLnvk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qlD-00000008KpU-3ypD;
	Tue, 08 Sep 2026 08:00:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qlC-00000008Kp8-2Qsq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 08:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=acbNWtpPknyLrCk/pNLZi+gfhUsY53AY8W5EHv28ZbE=; b=JQil6j0dV7O3FoE8Rgmx3/r4EF
	+fUa2rIZMfoht4zfLkAHCUCDZBGf3PNMGJiyUXja6aXSEl0kPgx+p4sZq7O20WvVUmaxaqwuTDMVO
	Z5DWmkNpsL8jczGqH2rOVWCiGNMAHI0e0Allq+LHg2P+Lv3CQGlKiZyKwE/TlvgIzdrlYHNonbpXp
	tNz/NIdFYWPUNEM4jr2b+GBRp9NhK29QCRy4BNxwsAFHm+4ICs5lfOXYdMH85D61mUcmJ2MhJOUAZ
	QQqUshGxwjfk7LiL58m7vF5rgH0t14NnuD273Uky0YlcVLFdMqzbkU0kzC45QhabPa/QS2BojQG61
	CwVvAnIA==;
Received: from esa9.hc1455-7.c3s2.iphmx.com ([139.138.36.223])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ql9-0000000H5c5-23GV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788854451; x=1820390451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d6H21zget9O+foARLFAgFZea8RUu6p9eIXmnIG1xYl8=;
  b=jUoPDeHrF0ZdIEuBWe3QaD+Gbn7x1NRVpl8AabeO7ifiQjgaucYusfTX
   0CgZwypEhCe/eeGkoDrXSNgG8ScgWM5FYc7x5pCuoduQAiPPCmwJasxKK
   9x4Wt67jDvfULvPkXtnJaBsURgbID4zEOGDOghx6OnoWljlTXZ3DVU2sN
   uywgcjLr7L8PwvUS6t0lb+1HioySZT8BSPkOr1MRUCXsRUMRhqM5DQRLu
   z2BRjBINxnKrHCXdLQ2C3GqPGS4+Du1IHRIpfJJK26NZLctVkyClslWfL
   ZFccnaCI+5CDPsq0nUEVkT+V63zfsTC3Wlb9yAJwwYdpWelwwtf+mpu49
   g==;
X-CSE-ConnectionGUID: p/d7KRAUSiS/CjYx5chapg==
X-CSE-MsgGUID: 9Pj2NKHWQEOW+cqboE9KfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="241801641"
X-IronPort-AV: E=Sophos;i="6.25,268,1779116400"; 
   d="scan'208";a="241801641"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 17:00:35 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5762C1000377
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 08:00:35 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0A9ED1C002FA
	for <linux-arm-kernel@lists.infradead.org>; Tue,  8 Sep 2026 08:00:35 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.9.15.163])
	by az2nlsmom3.fujitsu.com (Postfix) with SMTP id 5B31C101BB76;
	Tue,  8 Sep 2026 08:00:27 +0000 (UTC)
Date: Tue, 8 Sep 2026 17:00:19 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, joey.gouly@arm.com, tabba@google.com, 
	yuzenghui@huawei.com, linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com, 
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org
Subject: Re: [PATCH v17 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
Message-ID: <ap--9pJdD_Y_j1aY@FCCLS0092175.localdomain>
References: <20260907095942.1140734-1-suzuki.poulose@arm.com>
 <20260907095942.1140734-4-suzuki.poulose@arm.com>
 <10893135-4757-44de-91b5-180a9774d868@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10893135-4757-44de-91b5-180a9774d868@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_090051_745301_29B2C286 
X-CRM114-Status: GOOD (  33.09  )
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

Hi Gavin,

On 09/08 17:04, Gavin Shan wrote:
> Hi Suzuki,
> 
> On 9/7/26 7:59 PM, Suzuki K Poulose wrote:
> > From: Steven Price <steven.price@arm.com>
> > 
> > RMM v2.0 brings the ability to set the RMM's granule size. Check the
> > feature registers and configure the RMM so that it matches the host's
> > page size. This means that operations can be done with a granularity
> > equal to PAGE_SIZE.
> > 
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >   Changes since v15:
> >    * Actually check the feature register for the host's page-size support.
> >   Changes since v14:
> >    * Move the implementation into drivers/firmware/arm_rmm.
> >   Changes since v13:
> >    * Moved out of KVM.
> > ---
> >   drivers/firmware/arm_rmm/rmi.c | 58 ++++++++++++++++++++++++++++++++++
> >   include/linux/arm-rmi-cmds.h   | 17 ++++++++++
> >   2 files changed, 75 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> > index 008a783407b4e..76f91c145e1fd 100644
> > --- a/drivers/firmware/arm_rmm/rmi.c
> > +++ b/drivers/firmware/arm_rmm/rmi.c
> > @@ -77,6 +77,60 @@ static int rmi_read_features(void)
> >   	return 0;
> >   }
> > +static int rmi_configure(void)
> > +{
> > +	unsigned long granule_feature;
> > +	unsigned long granule_size;
> > +	int ret = 0;
> > +	struct rmm_config *config;
> > +
> > +	switch (PAGE_SIZE) {
> > +	case SZ_4K:
> > +		granule_size = RMI_GRANULE_SIZE_4KB;
> > +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> > +		break;
> > +	case SZ_16K:
> > +		granule_size = RMI_GRANULE_SIZE_16KB;
> > +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> > +		break;
> > +	case SZ_64K:
> > +		granule_size = RMI_GRANULE_SIZE_64KB;
> > +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> > +		break;
> > +	default:
> > +		BUILD_BUG();
> > +	}
> > +
> > +	if (!(rmi_feat_reg(1) & granule_feature)) {
> > +		pr_err("RMM does not support %luKB granules\n",
> > +		       PAGE_SIZE >> 10);
> > +		return -ENXIO;
> > +	}
> > +
> > +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> > +	if (!config)
> > +		return -ENOMEM;
> 
> An error message is needed here.
> 
> 	if (!config) {
> 		pr_err("Unable to alloc RMM config memory\n");
> 		return -ENOMEM;
> 	}

I largely agree with your suggestions, and they look reasonable to me.

However, wouldn't this be redundant? Since __GFP_NOWARN is not set, the
page allocator would normally emit an allocation failure warning with a
stack trace anyway.

I don't have a strong preference, but as per "14) Allocating memory" in
the coding style, I believe it would be considered unnecessary.

Thanks,
Kohei

> 
> > +
> > +	config->rmi_granule_size = granule_size;
> > +
> > +	/*
> > +	 * For now we set the tracking_region_size to 0 which is the only option
> > +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> > +	 * TODO: Support other tracking sizes via Kconfig option for other
> > +	 * PAGE_SIZES
> > +	 */
> > +	config->tracking_region_size = 0;
> > +
> > +	ret = rmi_rmm_config_set(virt_to_phys(config));
> > +	if (ret) {
> > +		pr_err("RMM config set failed\n");
> > +		ret = -EINVAL;
> > +	}
> 
> The error code from rmi_rmm_config_set() is indicative sometimes. Also, -ENXIO
> would be more appropriate than -EINVAL?
> 
> 	if (ret) {
> 		pr_err("RMM config set failed (%d)\n", ret);
> 		ret = -ENXIO;
> 	}
> 
> > +
> > +	free_page((unsigned long)config);
> > +	return ret;
> > +}
> > +
> >   static int __init arm64_init_rmi(void)
> >   {
> >   	int ret;
> > @@ -90,6 +144,10 @@ static int __init arm64_init_rmi(void)
> >   	if (ret)
> >   		return ret;
> > +	ret = rmi_configure();
> > +	if (ret)
> > +		return ret;
> > +
> >   	return 0;
> >   }
> > diff --git a/include/linux/arm-rmi-cmds.h b/include/linux/arm-rmi-cmds.h
> > index 2fb1f7f86d71e..9aa27697e2377 100644
> > --- a/include/linux/arm-rmi-cmds.h
> > +++ b/include/linux/arm-rmi-cmds.h
> > @@ -12,6 +12,23 @@
> >   unsigned long rmi_feat_reg(unsigned long id);
> > +/**
> > + * rmi_rmm_config_set() - Configure the RMM
> > + * @cfg_ptr: PA of a struct rmm_config
> > + *
> > + * Sets configuration options on the RMM.
> > + *
> > + * Return: RMI return code
> > + */
> > +static inline int rmi_rmm_config_set(unsigned long cfg_ptr)
> > +{
> > +	struct arm_smccc_res res;
> > +
> > +	arm_smccc_1_1_invoke(SMC_RMI_RMM_CONFIG_SET, cfg_ptr, &res);
> > +
> > +	return res.a0;
> > +}
> > +
> 
> rmi_rmm_config_set() is used for once by rmi.c::rmi_configure(), I would not expose
> rmi_rmm_config_set() by combining the logic to rmi.c::rmi_configure().
> 
> >   /**
> >    * rmi_features() - Read feature register
> >    * @index: Feature register index
> 
> Thanks,
> Gavin
> 

