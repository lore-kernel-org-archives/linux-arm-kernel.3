Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D392FE51F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gdYRDeL5BTqnVZhL9uBNOJx0tsvBzaAZHmvjgpM/Co=; b=WucCzt6FqSODW82aQ8548LB3/T
	gbNiI5K1mdnb1gdQgPowKKyOxkBPSK27MP9TYyGLQM9/krkDomYBT+ONxzPybYObvPVMp+pLSdFt9
	2bjIfpWXJlbHmy9KevSEEXyJVFpa3u62xqcP/u4fkSuVWxKD94MNI4Z/pvbv7/xPpIrz6a61W4XY+
	Ij7CGHL6TkyAx7gNRwwRZeDMlouq8gN4FdZHfDG/If+ZkrruylIa/9qRIeqZOZ6Dhj57kdsvfeFwJ
	FtiQEEqoEqV29eEoA9v1IKrtMcFemaBSEJYaANhJzO95uSiM9NgzYHkFDKbE9Vu4IO82w42KaIUcp
	dZCtPG4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCmD-0000000Cve4-1amy;
	Fri, 24 Apr 2026 09:24:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCmA-0000000CvdY-0WU3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:24:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CBA71BC0;
	Fri, 24 Apr 2026 02:24:33 -0700 (PDT)
Received: from [10.57.33.60] (unknown [10.57.33.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAC9A3F23F;
	Fri, 24 Apr 2026 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777022678; bh=LgeQDUtw5awG1hk00vwUt2oakv15VSwrc2cQLxVardQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ARqDpBz19IP4LhyYurQOBbnl/oFWHTP3i3w96mTQP4+iHySWxpjUVbEtmU5mAnW+a
	 NtOc2fZwKBBw12rkf6PTRut/K/TelXRELxijnfSxntb91AFbzyTu6Hv1aTP3UxkcTe
	 6ELkNwtRQSUBIbnLUu1BloTzsnFb5QK+6nfATO0I=
Message-ID: <d13c9d8c-09c2-467d-bc35-a924e96f2f53@arm.com>
Date: Fri, 24 Apr 2026 11:24:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: signal: Preserve POR_EL0 if poe_context is
 missing
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260421144252.1440365-1-kevin.brodsky@arm.com>
 <20260421144252.1440365-2-kevin.brodsky@arm.com>
 <aei87MmXaEdg8YOf@willie-the-truck>
 <693f4d7c-46f4-409b-8944-a8c9e4b5e073@arm.com>
 <aeoTX_6nK6oHw5OE@willie-the-truck>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <aeoTX_6nK6oHw5OE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_022442_313518_8ABF0439 
X-CRM114-Status: GOOD (  22.55  )
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

On 23/04/2026 14:41, Will Deacon wrote:
> On Wed, Apr 22, 2026 at 04:55:05PM +0200, Kevin Brodsky wrote:
>> On 22/04/2026 14:19, Will Deacon wrote:
>>>> @@ -74,8 +76,12 @@ struct rt_sigframe_user_layout {
>>>>   * This state needs to be carefully managed to ensure that it doesn't cause
>>>>   * uaccess to fail when setting up the signal frame, and the signal handler
>>>>   * itself also expects a well-defined state when entered.
>>>> + *
>>>> + * The valid_fields member is a bitfield (see UA_STATE_HAS_*), specifying which
>>>> + * of the remaining fields is valid (has been set to a value).
>>>>   */
>>>>  struct user_access_state {
>>>> +	unsigned int valid_fields;
>>>>  	u64 por_el0;
>>>>  };
>>> Do you think it would be worth adding some accessors to make it easier
>>> to keep the flags in sync? For example:
>>>
>>> /* Stores por_el0 into uas->por_el0 and sets UA_STATE_HAS_POR_EL0 */
>>> void set_ua_state_por_el0(struct user_access_state *uas, u64 por_el0);
>>>
>>> /*
>>>  * If UA_STATE_HAS_POR_EL0, *por_el0 = uas->por_el0 and return 0.
>>>  * Otherwise, return -ENOENT.
>>>  */
>>> int get_ua_state_por_el0(struct user_access_state *uas, u64 *por_el0);
>>>
>>> WDYT?
>> I did get a feeling having helpers would be a good idea. I wonder if
>> getters/setters aren't a bit overkill though, as they make accesses to
>> the struct more cumbersome and we'd need a pair for every member (unless
>> we use some macro magic).
> We only have one struct member, so it's probably fine for now, and we
> could group related members together in sub-structures to help in future.
> But it's up to you -- I don't feel strongly about it, but requiring the
> caller to update the flag manually is going to be a bug magnet.
>
>> Maybe it would be sufficient to have say
>> ua_state_has_field(POR_EL0) to check if the bit is set, and
>> ua_state_set_field_valid(POR_EL0) to set the bit?
> I don't think that really helps with my concern. I'd like to avoid callers
> having to remember to deal with the flags when they update the data.

Got it. I can't think of a better way to do this so I'll just go ahead
with your suggestion, and prefix all members of the struct with __ to
make it clear they shouldn't be accessed directly. The macro magic can
wait until we have more than one struct member ;)

I've also reconsidered setup_sigframe() and realised using valid_fields
there is not a great idea, because the record is allocated in
setup_sigframe_layout() based on system_supports_poe(), and leaving a
record uninitialised would be bad™. I'll remove that change and I'll
have preserve_poe_context() fail with a WARN_ON() if
get_ua_state_por_el0() somehow returns an error.

- Kevin

