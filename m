Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB41606DA6C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nmQM1ay/;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=GAhCsZSy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m4lF2/XuKMfflorAS4FpKA2jURN3iNgNsii92DPWyV4=; b=nmQM1ay/XSatzU
	YnEGHg0V+vBP4KK87uWAWlHZFbDKqb/cgRIU+MJxT558q0swx+Ib5kSlWJb7uqoCJFuxUkuxz57d+
	mD36JmUiRRuy2fyfss1iQAx0uUiT3jCQi90U/VLLl2UpDefBl5Jr3YCJPkNjNl+9djvXb4vQJaBCM
	83u86QGKW/jzVcHEfdaRa5UkM5DXYONOdxvV3dy59YjhCGwNGouLmPXqi6KGlZsMHEIF98aPzT8nT
	nfWfw0iFIuX7gzdIShG8Bo1GKfy/oQsfhspXWips0GHIzfwZnqjZQUKuKLtHuq0FW91uvbG0GLGyJ
	pJRLvwSNZHenq/vxlqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPID1-0000000CA1D-3G4e;
	Fri, 06 Nov 2026 11:34:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPICz-0000000CA0i-0pGK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:34:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 151CB1650;
	Fri,  6 Nov 2026 03:34:09 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37123F628;
	Fri,  6 Nov 2026 03:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793964852; bh=UHA5Gw+4nGvemIa8Jm4k3hEWeaWcD8r7XN1xBzWLsoU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=GAhCsZSyX16VyZmLm9E+aAHhAEzixi2JQzeXsPLTYJPXqWK0nXkqIewDyR12LOUyQ
	 rIFP8DTWaR1yrLrhgFiuYmBFz7NYWsOQV+dX83DksixEnBqhu2q+xVWnMR0/wCH/Mo
	 rWpPaKTyVbBAG5IuHRtDhyDojgPGan1KKe+JOufs=
Message-ID: <fd20a317-1f3c-43bf-b629-587877cf9503@arm.com>
Date: Fri, 6 Nov 2026 11:34:09 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Leave CDP off when there are too few
 PARTIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 reinette.chatre@intel.com, fenghuay@nvidia.com, tan.shaopeng@jp.fujitsu.com,
 jic23@kernel.org, zengheng4@huawei.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031025257.1540228-1-ruanjinjie@huawei.com>
 <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <750c9d05-94f8-4936-a824-5ccbed1d13ed@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033413_501339_85FAA77A 
X-CRM114-Status: GOOD (  20.10  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jinjie,

On 06/11/2026 08:35, Jinjie Ruan wrote:
> Hi Ben,
> 
> Is this modification okay?

Yes it's ok but there is more we can do here. Sashiko has raised a bug that points out we don't take
into account whether or not a resource is cdp_capable or not [1].

This leads to an additional check along the lines of:

if (enable && (!the_res.alloc_capable || !the_res.cdp_capable))
    return -EINVAL;

On a process note, it would helpful to me for reviewing and later on when collecting the patches
together if you could put related patches together in a series. In the case of this patch it it is
solving a cdp related problem, as is your patch "arm_mpam: resctrl: Limit num_rmids to the CLOSIDs
in use". fs/resctrl patches though should be kept separately unless there is a particular reason why
they should be in a series with MPAM patches, e.g. new resctrl_arch_ helpers and such like.

[1] https://sashiko.dev/#/bug/linux-05c19551-0bba-4a06-aa2c-3c90fab5853d

Thanks,

Ben

> 
> 在 2026/10/31 10:52, Jinjie Ruan 写道:
>> Enabling CDP requires at least 2 PARTIDs. If there are too few PARTIDs,
>> resctrl_arch_set_cdp_enabled() returns -EINVAL, but only after it has
>> recorded CDP as enabled, halved the monitor count and turned off the
>> mbw_max MBA control. resctrl then believes CDP is off, which leaves the
>> two sides out of step and the halved monitor count and the missing MBA
>> control are not undone.
>>
>> Check the PARTID limit before anything is changed so a failed enable has
>> no effect.
>>
>> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>> RFC v2 -> v1:
>> - Check mpam_partid_max ahead and The partid_d/partid_i determination
>>   remains in place.
>> - Update the commit message as Ben suggested.
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..aa3b3a093857 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -210,6 +210,9 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  	if (enable)
>>  		pr_warn("CDP is an expert feature and may cause MPAM to malfunction.\n");
>>  
>> +	if (enable && mpam_partid_max < 1)
>> +		return -EINVAL;
>> +
>>  	/*
>>  	 * resctrl_arch_set_cdp_enabled() is only called with enable set to
>>  	 * false on error and unmount.
>> @@ -239,9 +242,6 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
>>  		mpam_resctrl_controls[RDT_RESOURCE_MBA].resctrl_res.alloc_capable = true;
>>  
>>  	if (enable) {
>> -		if (mpam_partid_max < 1)
>> -			return -EINVAL;
>> -
>>  		partid_d = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_DATA);
>>  		partid_i = resctrl_get_config_index(RESCTRL_RESERVED_CLOSID, CDP_CODE);
>>  	}
> 


