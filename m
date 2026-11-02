Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MBTzKwPW;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O2p8XH9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KaTdiwMWudYfERU/E+XvtEtv6XN7xCCT4UxFwKCQbgY=; b=MBTzKwPWtWwJ2w
	mHgFL6F9RE1nFL/IUvvUx7f4sbA46pAzOTEMBBxjUiC4wpTcEPCSiiMOpo2JZkHdJj4QDj1NMwYau
	/4L1RkkoToxfEobtE0uqXb6sGL9utqnRsJblP+G9iaF6iwfEqUU1vUEy87BgYnG+nS3BHsCLWLoW2
	ajtxys7i+G8ztLz4vIPywyS9NFsR+g7+vFD9azp+wEyaod7T9DouBcHCJBhSVyXXVVQOynh5XeIjA
	8t8C1xxvQzXt3foFZZoFiFh5rhoerPKnGMqtaVJ1DMxbsJiYKw/skN+hERXnLiiWw3N5lGvkK94L1
	MeyflBeQDmSKw71TkUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNieY-0000000FRY1-336k;
	Mon, 02 Nov 2026 03:24:10 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNieU-0000000FRXH-2uQl;
	Mon, 02 Nov 2026 03:24:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=KaTdiwMWudYfERU/E+XvtEtv6XN7xCCT4UxFwKCQbgY=;
	b=O2p8XH9+nIKo/SHJQvkoNlL4LG8DUPa7z5az4NMbn4QOSUwJiVcYlpUUX/m9TA7CQfyPm2MvU
	Cwh5LZ6dROeeylnsx9068aMRCbanodwtjZlAGPjtuw2LVfYHEH7g6S6Ul29eDy6TYX4JY1IF6uP
	NNoos+v4xL/Z385AyfTy/iA=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jHxqs4cm8zpStD;
	Mon,  2 Nov 2026 11:23:37 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E70540561;
	Mon,  2 Nov 2026 11:23:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 2 Nov
 2026 11:23:57 +0800
Message-ID: <9880eb24-2189-4592-a999-5769c59ebb81@huawei.com>
Date: Mon, 2 Nov 2026 11:23:57 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/19] resctrl: Generalize monitor events across
 resources
To: Reinette Chatre <reinette.chatre@intel.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_192407_360586_D9AC03ED 
X-CRM114-Status: GOOD (  19.86  )
X-Spam-Score: -2.1 (--)
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



在 2026/10/31 1:09, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/29/26 5:35 AM, Jinjie Ruan wrote:
>> Resctrl only knows about monitoring at the L3 scope. MPAM monitors are
>> attached to a resource in an MSC, and firmware says which cache level that
>> resource is. The driver already finds L2 monitors, but resctrl has
>> nowhere to show them.
>>
>> This is not MPAM specific. RISC-V can also place monitors at several
>> points in the system.
>>
> 
> One key to this is in the first sentence of this cover letter: "Resctrl only knows
> about monitoring at the L3 *scope*.".
> 
> When it comes to exposing monitoring data to user space resctrl has been using "L3"
> interchangeable as resource and scope. 
> 
> The existing resctrl user interface already establishes that the "L3" in
> "L3_MON" and the per monitor group "mon_data/mon_L3_xx" refers to the L3 *scope*,
> not the L3 resource. More specifically, consider the existing user interface:

Hi Reinette,

Thanks for your explanation, you are right, the "L3" in "L3_MON" and
"mon_L3_xx" is the scope, not the resource, this interface can include
different resources such as MB and L3 at the same time..

> 
> # find mon_data/
> mon_data/
> mon_data/mon_L3_00
> mon_data/mon_L3_00/mbm_local_bytes <=== monitoring data associated with MB resource at L3 scope
> mon_data/mon_L3_00/mbm_total_bytes <=== monitoring data associated with MB resource at L3 scope
> mon_data/mon_L3_00/llc_occupancy   <=== monitoring data associated with L3 resource at L3 scope
> 
> Associating the monitor events with the L3 resource was an implementation choice
> that was convenient at the time. Since L2 can similarly be used interchangeably for resource
> and scope associating the L2 scope monitoring with the L2 resource may similarly be convenient
> when considering how to support L2 monitors as is done in this series.

L2 works here only because the names happen to be the same for resource
and scope as L3 has done.

> 
> Even so, I do not believe that associating monitoring with the resource will be
> able to cleanly support all MPAM monitoring capability. Specifically the upcoming CPU-less
> memory bandwidth monitoring.
> 
> As I see the plan at this time: CPU-less memory bandwidth allocation will be
> backed by a new MB_NODE resource. For these systems the expectation is that their
> monitoring data will be exposed to user space via NODE scope and will appear to user space as:
> 
> mon_data/
> mon_data/mon_NODE_00
> mon_data/mon_NODE_00/mbm_total_bytes <=== monitoring data associated with MB resource at NODE scope

You are righ, associating monitoring with the resource cannot give
mon_NODE_00 but mon_MB_xx. I am happy to key it off scope instead for
naming and display, and keep the resource-based event tables as an
internal detail.

> 
> The cover-letter is titled "Generalize monitor events across resources". As I see it such
> generalization does not prepare resctrl for all MPAM monitoring capabilities. Could this
> work do so?

CPU-less NODE monitoring is not part of this series, but I will make
sure the scope-based naming does not block it.

> 
> Reinette

-- 
Best regards,
Jinjie


