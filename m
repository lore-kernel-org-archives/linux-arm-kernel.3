Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA01606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pc6E8Ksi;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OewCBRCP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mGEVtVjtz0KdzhZ4I6DHO8/MAISpHDmHM9ZM3zRq5ss=; b=Pc6E8Ksif8/HUM
	0dvkkvJGqSHI6Hj8JQ5gvJ1C/iMdYrJsKuxwdVjgvDct6ZT62LSAjPdTIn1o5JL7UiI+kqPUNZ0lt
	Tn/fcHhh4O97PLcFYj1GzQswPA1vKvCCvVLFeGoTvMsQTpBf4OiaFlHM5r/Y4k0XG4oKHku2DWaS+
	EVmrV0MitW7e85Xv90fC/QQOHAJ+2zolhsGtPzqA0D2AsAzJDj/lzuMou3nfTGKFljt0TkoBbw7oF
	xU6YcxkhM9vgD6dOKRBXEZ3Ylf+qO3Zrk+tpx5pbSBVifiKPTlLDTHtoT5kChAsKeO7ol0mOlDEqL
	tRRUUvqhe7+ljft0+iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGZm-0000000Bo5I-1Od0;
	Fri, 06 Nov 2026 09:49:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGZi-0000000Bo36-3tj1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 09:49:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 406B41682;
	Fri,  6 Nov 2026 01:49:28 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7871F3F628;
	Fri,  6 Nov 2026 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793958571; bh=rLjhCA81jsFFZwqXTBDCS2ZN6MP7pRTuX1rJ8TeDxJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OewCBRCPbvf6K6u//AQLua4egeAPRExi5r/EQa7FK6boaqTALhV+g89fa4QSv6wSZ
	 clvU+ONgkTvvMAyQci1F5UATL4nn1URWApob7+sVx/XttaDKXa3W0Hq/QzAOa78iAP
	 a59A+CsLaK3SQa6zeZ1fXoQcw4NbNkX5aRr5uLlY=
Message-ID: <cb37c75b-51eb-48de-b254-0c495f3c543b@arm.com>
Date: Fri, 6 Nov 2026 09:49:29 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm_mpam: selecting hard or soft MBW_MAX limits
To: Ping Li <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261106043611.790930-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261106043611.790930-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014935_018617_20C21896 
X-CRM114-Status: GOOD (  16.32  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ping,

On 06/11/2026 04:36, Ping Li wrote:
> Hi Ben,
> 
> mbw_max support in the driver always programs MPAMCFG_MBW_MAX without
> setting MPAMCFG_MBW_MAX.HARDLIM, so the limit is always soft: a

Just to clarify. The limit is always soft whenever a soft limit is supported but if it isn't
MPAMCFG_MBW_MAX.HARDLIM is RAO/WI and so even though the driver writes 0 to MPAMCFG_MBW_MAX.HARDLIM
you would still get a hard limit.

> PARTID above its MAX contends with low priority for bandwidth beyond
> the limit, but is not prevented from exceeding it. On our platform we
> would like to be able to select the hard limit, where a PARTID above
> its MAX is throttled even when the system is otherwise idle - soft
> limits let a noisy task exceed its limit and disturb higher-priority
> work when bandwidth contention appears.
> 
> MPAMF_MBW_IDR.MAXLIM reports whether the MSC implements a hard limit,
> a soft limit, or both, but the driver does not read it today.
> 
> Is there a preferred way to expose this choice? The options we see:
> 
>   - a mount option or info flag, if the choice must be global
>   - a per-resource or per-group resctrl knob
>   - selecting hard limits by default whenever MAXLIM reports the MSC
>     supports them

The current plan is that this will be an extra line in the schemata file. Fenghua was looking into
this and there is some discussion here [1]. This relies on the generic schemata changes to have
multiple controls for resources. The same series as linked although there is a rfc v2 now.

[1] https://lore.kernel.org/lkml/e13cf2e7-3956-4069-ac43-c65e874c6109@intel.com/

Thanks,

Ben

> 
> Thanks,
> Ping


