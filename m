Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860CBCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGY9RhUvQa+fBUTiHuNRTmfi0VERUgOcY/nIDOmvcQU=; b=2xiNHd/QdXT/iaDgPQrobY8/0n
	j1yDScqQ3iMc2L/1X8647cfeRRNkRGXGOS16fRUh2jORqqjd4ATclgbwNyqB07blc8ul39zHK/FVn
	ozqLz+8xNKj8m1z6ioEk6XZX+bPsN5VZghbd3eDnzdDXSlzPVCNd8V7vVv+vLVhwp3LmRGjXPDCuI
	vnLhtYXWiIq2/nkwjZ16DCFNxO0HydIi23SgR9bg97H45GGNwPhguNP+DZQ0Iex6DdT7qXTaxGtTm
	nOHgsuYS6mBUm/Btumg4zjyqJo8dJjgVu/GWN72jrtTAE4NVEgSEUv6X0TD9lzsiEcA41YmMd/8QG
	3wVO4hDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5oM-00000008QSb-2QJb;
	Thu, 21 May 2026 15:59:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ5oJ-00000008QS3-29hH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:59:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E73B12BCB;
	Thu, 21 May 2026 08:59:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ECA13F632;
	Thu, 21 May 2026 08:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779379186; bh=6gbYbC+enanhE/vbMG0bE/ubhoI+jp5XIb+TrXnz5A4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k5fEs6ogf0PPgJ73jUKlAGx+ncWEUg0nY2vpS0iY8PBofwq1AHzv2iE7j3/o3jNzV
	 q3OPAohgxJfyEaXqzkmGDQD3oZZCG07gpefaf/sUPGXWfXmT0XyOMhLvKy69XtD9SK
	 vLkHWzj+R0liSp1lB1QT2IoV9hZwc1N4W7HfbbJs=
Message-ID: <573653c0-7ab5-49b1-99c1-beb21d1788b0@arm.com>
Date: Thu, 21 May 2026 17:59:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm_mpam: prevent MPAM-Fb accesses inside IRQ handler
To: Niyas Sait <niyas.sait@arm.com>
Cc: ben.horgan@arm.com, catalin.marinas@arm.com, fenghuay@nvidia.com,
 guohanjun@huawei.com, james.morse@arm.com, jic23@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, rafael@kernel.org, reinette.chatre@intel.com,
 sudeep.holla@kernel.org, will@kernel.org
References: <20260429141339.3171205-5-andre.przywara@arm.com>
 <20260518105708.3268174-1-niyas.sait@arm.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260518105708.3268174-1-niyas.sait@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_085947_603796_16A809B6 
X-CRM114-Status: GOOD (  17.33  )
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

Hi Niyas,

thanks for the reply!

On 5/18/26 12:57, Niyas Sait wrote:
> Hi Andre,
> 
> On Wed, Apr 29, 2026 at 04:13:38PM +0200, Andre Przywara wrote:
> 
>> This error report relies on reading the MSC's error status register
>> (ESR) in the IRQ handler, which is not possible for MPAM-Fb based
>> MSC accesses, since they involve mailbox routines that might sleep.
> 
> I think there are a few other places where we may still end up invoking
> the MPAM-Fb path from atomic/IRQ context.
> 
> For example, _msmon_read() uses smp_call_function_any(), which runs
> __ris_msmon_read() in callback/atomic context

Ah, good point, I thought that the running CPU always being in the mask 
would avoid the IPI - and it does, but it drops the code into atomic 
context anyway, courtesy of disabling preemption when calling get_cpu().
So I just avoid that by checking the interface type and just calling 
__ris_msmon_read() directly for PCC. Maybe there is a smarter solution 
to this, but that seems simple enough.
Will be part of v2.

Many thanks for finding this!

Cheers,
Andre

> 
> static int _msmon_read(struct mpam_component *comp, struct mon_read *arg)
> {
>      ...
>      err = smp_call_function_any(&msc->accessibility,
>                      __ris_msmon_read, arg,
>                      true);
>      ...
> }
> 
> For MPAM-Fb, I think we could potentially avoid the smp_call_function_any() path entirely
> and invoke directly from the current CPU. Since PCC accesses are effectively CPU agnostic,
> I think that should be fine for the MPAM-Fb case.
> 
> Thanks,
> Niyas


