Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD2FC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1A0wwVr+M5YdleD5WdQbyvCNYbPCnowwpdIat8Rx3jU=; b=tDjQZ1YpXIK5hYKBXUyvIC2IDl
	gfZp0JgIz0FVXau4t7jJjN8hcIwEBGq81Xq1ZcEXFPrmKYNZs/En59WLiOlIXbvs8/DygeVlYMurX
	3aoB2s/5iMVFGK4xjF+jyrEcoRj8aSbiuTYfimZ8Eoh0cx4DssiOCnyAvn0T6ic/rgUYkqO3a/6q2
	tr2qvjLCzHoZymvDjxgN130JNWpDWtedZYRDPw+cNLcTHGgjFhdl9vG31nhpGXD4t1DOmhe/aVHhr
	/J3xIj6bKoHCGs6PIQ+NMG+7oSz14PlpMEku9AYsjX/3EgAxCohNNrvVMViFAAkAV0KfOX58yBXd4
	MVdf9QKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8qR-0000000Cs57-2qWg;
	Fri, 28 Feb 2025 22:28:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8ot-0000000Crmr-47MM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 22:27:01 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id BB67A210D0EB;
	Fri, 28 Feb 2025 14:26:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BB67A210D0EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740781618;
	bh=1A0wwVr+M5YdleD5WdQbyvCNYbPCnowwpdIat8Rx3jU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iPaqpljp0SPsYOEXK7VBrtInRVWgckeDIadHTBLILkbz6lm3ZiSAC5yniZwL98w9Q
	 F7FNXGkQStzvgrEgW0HShsyY3FA7178mzv+tFFHskRkkW3SP/1XHSFHHr1amJtB1+D
	 9HGrCNlzv6+oPzIhOR72qkgcAaskPXKU8ovhxizY=
Message-ID: <65e3bf97-8d3c-4a53-a3ad-42a16c0456d1@linux.microsoft.com>
Date: Fri, 28 Feb 2025 14:26:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] hyperv: Convert Hyper-V status codes to strings
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 linux-hyperv@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, mhklinux@outlook.com,
 decui@microsoft.com, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, daniel.lezcano@linaro.org,
 joro@8bytes.org, robin.murphy@arm.com, arnd@arndb.de,
 jinankjain@linux.microsoft.com, muminulrussell@gmail.com,
 skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
 ssengar@linux.microsoft.com, apais@linux.microsoft.com,
 Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
 gregkh@linuxfoundation.org, vkuznets@redhat.com, prapal@linux.microsoft.com,
 muislam@microsoft.com, anrayabh@linux.microsoft.com, rafael@kernel.org,
 lenb@kernel.org, corbet@lwn.net
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-2-git-send-email-nunodasneves@linux.microsoft.com>
 <74af19c4-639f-4bcc-b667-b5f102bbb312@linux.microsoft.com>
 <8338dd00-3aa4-418f-a547-1c19623358cb@linux.microsoft.com>
 <49a69fe3-fca5-426d-999d-61ee0c8f60f3@linux.microsoft.com>
 <70b62e52-639a-4026-9a52-102d1de46ffd@linux.microsoft.com>
 <212cc582-845d-42b2-89f2-1e9579f752ec@linux.microsoft.com>
 <9254eaa1-8ff0-4dd6-a443-5f127049bdaa@linux.microsoft.com>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <9254eaa1-8ff0-4dd6-a443-5f127049bdaa@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_142700_046437_4A823E75 
X-CRM114-Status: GOOD (  14.39  )
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



On 2/28/2025 12:22 PM, Easwar Hariharan wrote:
> On 2/28/2025 9:20 AM, Roman Kisel wrote:
>>

[...]

>>
>> So I'd think that the hex error codes from the hypervisor give the user
>> exactly as much as the error symbolic names do to get the system to the
>> desired state: nothing.
> I continue to disagree, seeing HV_STATUS_NO_RESOURCES is better than 0x1D,
> because the user may think to look at `top` or `free -h` or similar to see
> what could be killed to improve the situation.
> 

I agree that the symbolic name might save the step of looking up the
error code in the headers. Now, the next step depends on how much the
user is into virt technologies (if at all). That is
to illustrate the point that a hint in the logs (or in the
Documentation) is crucial of what to do next.

The symbolic name might mislead; a hex code maybe with an addition of
"please look up what may fix this at <URL> or report the problem here
<URL>" would look better to _my imaginary_ customer :) That would be
as much friendly as possible, if the kernel needs to print any of that
at all. Likely the VMM in the user land if it gets that code as-is.

Thank you for the fair critique and the time!

[...]

>>> Thanks,
>>> Easwar (he/him)
>>
> 

-- 
Thank you,
Roman


