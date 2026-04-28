Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7F9FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlNCQwObn7zb7bAf1limTiR7qqgu4pRpES6sdFMfHSM=; b=fx1v2laaTcaDrkY2qqfxu2Yvki
	LGluHZs7GrmEEhmzsuKzzuHWe8fEhZ3pzwFeouk23Af55UJSwKuX+jHBJhTXCWqHjnIUhI0MZcc9L
	Z2dNBbYnfdf6nGXS0lWCAiq9MZMpzBH3IbRnF7dGhvLUDRMAyDzUeRoh5BQRhOBre26kSRrLjZgtz
	wSRTiYn8tcOmaJW/WecDC5U0Eq7MwhV89wZMANoFhhMD/57onGUXl2oOWvUV2r1tO2mXdU7Y9FfWQ
	KzeD11k+KQQXeWGELxTyZ2VKzGwBm/1Hn0GMJsE1KY3XiWsmeF77dA8+tjiVl94VFTC3vGyQQN118
	GLqQvw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhM0-00000001PGd-2TA7;
	Tue, 28 Apr 2026 12:15:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHhLx-00000001PFw-1lWR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:15:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00ED16A3;
	Tue, 28 Apr 2026 05:15:38 -0700 (PDT)
Received: from [10.1.196.85] (e121345-lin.cambridge.arm.com [10.1.196.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 967AA3F763;
	Tue, 28 Apr 2026 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777378544; bh=3fst81hgXT1DjLs+ugyssDJtgCauuJ7FLz0RieP0aU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mqXvml95+i3+UlU3esUAcxxPiHRb35xok3BVGSeyMMXanZuGqUO9bsbTQK8jBajZ5
	 U6TXQRwJGqKz0jVsoNC0BNR+SiQUepizmSxA3IlJkrL9nfGG/0K7NaL9TqRFeDrkrY
	 bXekHEpkA5ps0MZd8Lt+75Py5IxXFgPNS6+cNjsA=
Message-ID: <d860b6a9-e4a9-494f-821d-8b0a347e1591@arm.com>
Date: Tue, 28 Apr 2026 13:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Is the ARM SMMU v3 implementation designed to always
 ignore SSID when SSID_VALID == 0?
To: Joonwon Kang <joonwonkang@google.com>, jpb@kernel.org
Cc: baolu.lu@linux.intel.com, cychu@google.com, hhchung@google.com,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stimim@google.com, will@kernel.org
References: <20260428090522.GA3048463@myrica>
 <20260428111442.1584248-1-joonwonkang@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260428111442.1584248-1-joonwonkang@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_051549_597749_4257D183 
X-CRM114-Status: GOOD (  23.24  )
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

On 28/04/2026 12:14 pm, Joonwon Kang wrote:
> Thanks for your prompt and insightful answer!
> 
>> Hi,
>>
>> On Tue, Apr 28, 2026 at 07:38:59AM +0000, Joonwon Kang wrote:
>>> Hi team,
>>>
>>> According to the ARM SMMU v3 spec, I believe that SSID should always be
>>> ignored when SSID_VALID == 0 and the current ARM SMMU v3 module
>>> implementation in the kernel seems to comply with this without exception.
>>> For example, when handling an event from SMMU, the implementation checks
>>> SSID_VALID(SSV) first and ignores SSID accordingly. If there is any
>>> exception to this rule, I believe it is a bug.
>>
>> Indeed
> 
> Acknowledged.
> 
>>
>>> Is it true for all the current and future cases? In other words, is it
>>> **mandatory** that the ARM SMMU v3 implementation ignores SSID when
>>> SSID_VALID == 0? or there might be some cases where the implementation
>>> needs to refer to SSID even when SSID_VALID == 0?
>>>
>>> Asking this question since our HW may not be able to clear SSID when
>>> SSID_VALID == 0 and so there might be some garbage value in SSID at some
>>> point of time(the HW will have a correct SSID when SSID_VALID == 1,
>>> though). If the ARM SMMU v3 implementation is to refer to that garbage
>>> value for any reason, the result would be devastating.
>>
>> At least according to the architecture, SubstreamID is ignored when SSV=0.
>> The SMMU is allowed to propagate the garbage:
>>
>>    7.3 Event record
>>
>>    * SSV: The SubstreamID validity flag
>>      - 0: No SubstreamID was provided with the transaction and the SubstreamID field is UNKNOWN.
>>
>> But the driver will ignore it.
>>
>> Same for PRI queue but in that case the page request wouldn't have a PASID
>> TLP prefix.
> 
> Although the PRI request without PASID may cause unpleasant ATC flush with
> SSV clear in this case, it does not lead to the implementation referring
> to the garbage SSID. Is this understanding correct? And while this case
> seems to be handled solely by the ARM SMMU v3 implementation, do you see
> if there is additional care required on our device driver for this?

A transaction with SSV==0 does not have a SubstreamID, therefore by 
definition there is nothing that an SMMU could validly attempt to do 
with a SubstreamID that does not exist. Sure, implementations can have 
bugs, but I'd expect any such bug in this regard should be sufficiently 
obvious that it most likely wouldn't get past architectural validation 
in the first place.

If you want to know the exact behaviour of Arm's implementations then 
you're best off asking Arm support, but since this piqued my curiosity 
too, I can save you the trouble - I checked with my contacts on the 
design team, and indeed our SMMUs should ignore the SSID value entirely 
when SSV==0 and just treat it as 0 (e.g. in event records).

Thanks,
Robin.

