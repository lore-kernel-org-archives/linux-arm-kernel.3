Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645F9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SauRn4rNyLo5Gxe9Z9Dfnna6e3IhDA5Q7nGogBdXi2M=; b=H6U4wdDefgKOKtpTEvmo+W8FOH
	6RyokBbAepTu5Z/zMIxu/kgt/3TpRpcFlhbukuleZOn/9SYm2lygXZwyyawTZmtFJir5MgZRExVPQ
	WKpvG4jeJyRrZSn8tm/mHYc25ECGCIqQ9U73kd3BOszX7o/jkXMzSiOdM/rRIlJAZ8ur7d7PkjeTv
	uKGYi7F8Z0GTHYRq6za5WimFqKMoUUf3qqVl0+nfCMU7B9OwfKCjYSJn5+hIeWHZiJ8YOZ8tdQiek
	+1OTZtoLwWNxGl4oJDyED1gA4/9fimN7AhoL/tJ6/uYMxtLkRPQzMnFbcYwoqX7AH+arZSABxSTZG
	w3/FE2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnYf-0000000GuwI-1IBk;
	Tue, 12 May 2026 13:54:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnYc-0000000Guvn-1qdH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:53:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD4B91655;
	Tue, 12 May 2026 06:53:49 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B7CF53F85F;
	Tue, 12 May 2026 06:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778594035; bh=gQhaNhMmvHKpp2DPTddlYwPbDh9/dUpVw6fJuFpkQAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AvDbkyI/apv2QKkRzcv1qomxgmQ8r+9ZC/MCfWWieYiZwDcrOlH30JxSndJ7um0Bq
	 Xj0tuOcIPj+GrrdQXZWB0Xh4ReCS/I0RcP3M4V/ijVbsYNYi7vwpHEE4GAOegbhShh
	 DorDUYtmUnsgGmS5gldEUuawZlAHc2D33Y6kk6Z0=
Message-ID: <b95b42c6-4d10-4701-88e2-9991f3773e6a@arm.com>
Date: Tue, 12 May 2026 14:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
To: Jason Gunthorpe <jgg@ziepe.ca>, Joonwon Kang <joonwonkang@google.com>
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com,
 baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com,
 iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com, joro@8bytes.org,
 jpb@kernel.org, kees@kernel.org, kevin.tian@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolinc@nvidia.com, praan@google.com, smostafa@google.com, will@kernel.org
References: <20260511132128.GM9285@ziepe.ca>
 <20260512095714.2518097-1-joonwonkang@google.com>
 <20260512124015.GU9285@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260512124015.GU9285@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_065358_671677_0A028A84 
X-CRM114-Status: GOOD (  21.04  )
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

On 12/05/2026 1:40 pm, Jason Gunthorpe wrote:
> On Tue, May 12, 2026 at 09:57:14AM +0000, Joonwon Kang wrote:
>>> There is a bit more going on though, I think that is what Joonwon is
>>> mentioning by asking about ST64B and ST64BV. I *think* the answer is:
>>>
>>> - ST64B uses a posted write
>>> - ST64BV can be restricted so EL0 cannot execute it, it uses a
>>>    non-posted write (AI tells me via EnASR)
>>> - ST64BV0 can be used by EL0, always uses a non-posted write, and always
>>>    uses ACCDATA_EL1
>>>
>>> Which is similar to Intel.
>>
>> Ah, I missed that ST64BV is currently being trapped to EL1 while ST64B is
>> not [1]. However, I am not sure if the trap is to disallow EL0 to use it.
>> Can it be instead to pass the response value of the non-posted write to
>> EL0 while using the EL0-given PASID as-is? If so, I believe EL0 still can
>> specify arbitrary PASID as it wants via ST64BV.
> 
> I think if an OS implements things this way it is would security
> broken as far as ENQCMD compatible HW goes.

Yes, I think it's rather the point that the EnALS/EnASR traps to EL1 
allow EL1 to sanitise the data that ST64B/ST64BV are sending, and do 
exactly things like substituting a valid PASID. ST64BV0 offers a way of 
doing so _without_ needing the overhead of trapping, but conversely that 
needs the EnAS0 opt-in all the way down to indicate both EL1's awareness 
of programming ACCDATA_EL1 appropriately and EL2/3's awareness of 
context-switching it.

I've not looked closely at what exactly the arm64 arch code is doing 
today and how well it actually fits the expected ENQCMD usage model, but 
I can well believe it might need a bit of tweaking.

Thanks,
Robin.

>> Since I guess ST64B* instructions are to serve generic purposes not only
>> for communication with accelerators with SIOV but also with any memory
>> location or device without SIOV, I am not sure if it is always okay to
>> make those instructions work the way Jason mentioned.
> 
> The end point has to use the posted vs non-posted write distinction
> for security.
> 
>>> The device only processes the PASID from a non-posted write,
>>
>> Regarding ST64B, are the ARM devices behind ARM SMMU v3 supposed to work
>> this way too? If not, EL0 can specify arbitrary PASID via ST64B with the
>> kernel today [1].
> 
> If you want ENQCMD compatible semantics then yes you have to do all of
> these things, it is part of the security design.
> 
> Jason


