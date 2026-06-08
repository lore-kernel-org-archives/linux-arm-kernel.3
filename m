Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F814CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8VuHm9Oa/BVszrFD5wv90Tzk1uGtRmh9CuI/PCvjbU=; b=4rBppDDOGO3AQEuvQXlLUvE01m
	U4DuQU9p01gntyHeZpbiOeZXGK+U3NKgPeuaYq0p7qaGmSA2ryd6vt1rs9rtl69P8mnbeEeXSlyxt
	LucgCkgvLfwAQUZMShrYAeZB7G9TRXT8ws85AN1tNyqF71pliEoeoUIaSBA4Ke2ZdNBjIkXZ3ksNU
	R1jt3hH1Ugit69sBuymZXmnTF4LDBo9fRW47blrhxB1LVHKOTYriqAbv5fCTX6hTLftF/8OdZqo04
	3lmVo6qerNVaoiGnEQO2qv1/IxK4SjORuJIbG+zi5oQyOUz6hEPjNGEQlJDfN9PeZqEJH4QwJL0wJ
	/J+mp4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcpX-000000044DA-3o3q;
	Mon, 08 Jun 2026 16:28:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcpU-000000044CL-3Yq4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:28:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 871F822D7;
	Mon,  8 Jun 2026 09:27:54 -0700 (PDT)
Received: from [10.57.73.11] (unknown [10.57.73.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74D7B3FD88;
	Mon,  8 Jun 2026 09:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780936079; bh=o1gFPXFWJiu/z2dHtJZURkMXw13o+ZM7ANlgOI9GSJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XjgYPwFZfhLCQqo6vvRmbJe2830zLANh86BF2ZdclMoy3/MRsdhK75KcshtcuPjQm
	 ugZMDuczAeyCZSDIepP5x8Cs8XlKTF4fv0KGQvLEXd/y/MHFC5gc3v4sIgDjgDeO19
	 /4PYGYcoZ0rYndCygfCmArJ/NERZT93i9fCUMwOQ=
Message-ID: <6f58a9e0-8f61-4202-acef-901108808cfd@arm.com>
Date: Mon, 8 Jun 2026 17:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: Sudeep Holla <sudeep.holla@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org> <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
 <yq5aldcpz316.fsf@kernel.org>
 <20260608-hot-fascinating-tortoise-cccc61@sudeepholla>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260608-hot-fascinating-tortoise-cccc61@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_092801_058334_7961FB46 
X-CRM114-Status: GOOD (  19.85  )
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

On 08/06/2026 13:32, Sudeep Holla wrote:
> On Mon, Jun 08, 2026 at 04:56:29PM +0530, Aneesh Kumar K.V wrote:
>> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
>>
>>> On 08/06/2026 09:19, Aneesh Kumar K.V wrote:
>>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>>>
>>>>> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
>>>>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
>>>>>>
>>>>>> ...
>>
>> ...
>>
>>>>> I was trying to avoid conditional compilation altogether and hence the
>>>>> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
>>>>> in above snippet must come as some condition to this generic probe.
>>>>>
>>>>> Adding any more logic or callback defeats the bus idea here if we need
>>>>> to rely/depend on multiple conditional compilation or callbacks IMO.
>>>>>
>>>>> Let's find see if it can work with what we are adding now and may add in
>>>>> near future and then decide.
>>>>>
>>>>
>>>> If we move all the conditional checks to the driver probe path, then I
>>>> think this can work. Something like the below:
>>>>
>>>> struct smccc_device_info {
>>>> 	u32 func_id;
>>>> 	bool requires_smc;
>>>> 	const char *device_name;
>>>> };
>>>>
>>>> static const struct smccc_device_info smccc_devices[] __initconst = {
>>>> 	{
>>>> 		.func_id        = ARM_SMCCC_TRNG_VERSION,
>>>> 		.requires_smc   = false,
>>>> 		.device_name    = "arm-smccc-trng",
>>>> 	},
>>>>
>>>> 	{
>>>> 		.func_id        = RSI_ABI_VERSION,
>>>
>>> Don't we need parameters passed to this (Requested Interface version for
>>> e.g.) ? See more below.
>>>
>>
>> The idea is that we only check whether the function ID is supported. All
>> other conditional logic should be handled in the driver probe path, as
>> demonstrated by the changes in drivers/char/hw_random/arm_smccc_trng.c.
>>
> 
> +1. Yes, we just want to know whether the firmware is aware of that feature
> before creating the `smccc_device` for it. The device probe can then perform a
> more thorough, feature-specific check to determine whether the device/feature
> is usable.
> 
> That is the main idea behind the approach I suggested. Please let me know if
> you still see any issues or think this may not work.

Ok, yea, I kind of forgot that we are boot strapping a driver based on
this "smccc device" and the device is only an indication of the firmware
service, the driver would decide if the service matches its expectation.

Thanks for the clarification, apologies for the noise.

Suzuki



> 


