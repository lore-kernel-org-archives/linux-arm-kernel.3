Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68DED10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6+0BYpdlUspSRQ6wGBa6bGU/rCrTPIXUFoYlpuQPaQ=; b=14U+ov3phLgIPBX7THvCEyMMXF
	CeJcukMvMKL9tecdyqhQ+0wfVlrlW3DovUq2xq0qPeh5/SY/aeKtVO78de8RL9RnVHwC9EfRtDDE4
	Iknwenaz2wYL5wzrIK20fre1p+Pk6XXc4lw0zctCxb+sb+03QiTktyoYPkhSRXRxzlM7AlS285Xkw
	xbaOKtMseEQAsBplyxMjwfvj2d4fCVu55iwmlg17KsMuCOtv+1Q3VUwpnVcxj5xPPA8BX8RUeRzMg
	bSi5qT8GJ2BzazwjuDYWgfAflK7qBCw5ttGcRqgWgYtlRH9E/rZF3ocb3MFeE7MynzVQ4pH/cPHDu
	faKPIupw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MJr-00000004GDg-1pS4;
	Fri, 25 Oct 2024 15:33:43 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LwH-000000049o1-2J2j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729868962; x=1761404962;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dt4LircY8aOQfF9FuQwvH4AoiZ4cwa4wv4f+/EJIsnQ=;
  b=gHXi9zcbTKe1/fwQ9WvoOeWxVg78beIZQbZ05I6fNzDfJU3p+aAJZNXC
   1zXBScb5n2zpTF8QYNtHjk/WXUFdQoK4/6Sw3XiWqMXXzH5Ptuu2ikp44
   +ubVh9RHxqU+Pp17ZD4ONMG/Yfk2ApnBh39n0PUWue2pw+BrMEWl8U3s0
   quTEG4pEXyY6LtfPPk96LV4l5yncga+bl0hWnh59dVr/wu37FPfwVgp1c
   iscDkvIL9r7cxN1PONFbtFPZ3fd8GnUBzQWUEysvyZK+ERSadyHhhtmGz
   pd22rvJMykYpAWz4NsWaFcUTGQvvCMyqAO96c1xvjbat9row+P06zu6M2
   A==;
X-CSE-ConnectionGUID: /tpjNtNHRb6mo1vdefP8aw==
X-CSE-MsgGUID: Il2utHyTSCaAG5oukwDMYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="17173903"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="17173903"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:09:20 -0700
X-CSE-ConnectionGUID: +l00sF5NT9e9T0Tk9q/v5g==
X-CSE-MsgGUID: ENWLZACFRsuLhh2nkwOPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="85524405"
Received: from tfalcon-desk.amr.corp.intel.com (HELO [10.124.222.14]) ([10.124.222.14])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 08:09:18 -0700
Message-ID: <5fa27331-db95-4d60-8fd9-19fbd18f12bb@intel.com>
Date: Fri, 25 Oct 2024 08:09:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] selftests/mm: Use generic pkey register
 manipulation
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: akpm@linux-foundation.org, anshuman.khandual@arm.com,
 aruna.ramakrishna@oracle.com, broonie@kernel.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, dave.martin@arm.com, jeffxu@chromium.org,
 joey.gouly@arm.com, pierre.langlois@arm.com, shuah@kernel.org,
 sroettger@google.com, will@kernel.org, linux-kselftest@vger.kernel.org,
 x86@kernel.org, Yury Khrustalev <Yury.Khrustalev@arm.com>
References: <20241023150511.3923558-1-kevin.brodsky@arm.com>
 <20241023150511.3923558-5-kevin.brodsky@arm.com>
 <6b575236-7e4e-4128-9ab6-7ecec7b81428@intel.com>
 <c35d8783-c754-4864-b964-4a3bfaa4cd11@arm.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <c35d8783-c754-4864-b964-4a3bfaa4cd11@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_080921_648678_A65DE7CF 
X-CRM114-Status: GOOD (  25.21  )
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

On 10/25/24 01:31, Kevin Brodsky wrote:
> I agree, the naming is not ideal, I lacked inspiration! Maybe
> PKEY_REG_ALLOW_NONE to remain generic?

Works for me.

>>>  static inline void __page_o_noops(void)
>>>  {
>>>  	/* 8-bytes of instruction * 512 bytes = 1 page */
>>> diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>>> index a8088b645ad6..b5e1767ee5d9 100644
>>> --- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
>>> +++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
>>> @@ -37,6 +37,8 @@ pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
>>>  pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
>>>  siginfo_t siginfo = {0};
>>>  
>>> +static u64 pkey_reg_no_access;
>> Ideally, this would be a real const or a #define because it really is
>> static.  Right?  Or is there something dynamic about the ARM
>> implementation's value?
> 
> It isn't dynamic no, the issue is that on architectures where pkeys
> restrict execution we need to allow X for pkey 0. Of course it would be
> possible to define PKEY_REG_ALLOW_ALL in such a way that X is allowed
> for pkey 0, but I was concerned this might be misleading. No strong
> opinion either way, happy to make it purely a macro, maybe with a better
> name?

I do think we should differentiate truly "no access" value from the one
that allows X on pkey 0, at least in the selftest.  Define a helper that
uses the *real* "no access" value:

/*
 * Returns the most restrictive register value
 * that can be used in the selftest.
 */
static inline u64 pkey_reg_restrictive_default(void)
{
	/*
	 * The selftest code runs (mostly) with its code mapped with
	 * pkey-0.  Allows execution on pkey-0 so that each site doesn't
	 * have to do this:
	 */
	return set_pkey_bits(PKEY_REG_NO_ACCESS, 0, PKEY_X);
}

and then use it like this:

	pkey_reg = pkey_reg_restrictive_default();
 	pkey_reg = set_pkey_bits(pkey_reg, 1, PKEY_ALLOW_ALL);

>>>  	 * Setup alternate signal stack, which should be pkey_mprotect()ed by
>>> @@ -142,7 +145,8 @@ static void *thread_segv_maperr_ptr(void *ptr)
>>>  	syscall_raw(SYS_sigaltstack, (long)stack, 0, 0, 0, 0, 0);
>>>  
>>>  	/* Disable MPK 0.  Only MPK 1 is enabled. */
>>> -	__write_pkey_reg(0x55555551);
>>> +	pkey_reg = set_pkey_bits(pkey_reg_no_access, 1, 0);
>>> +	__write_pkey_reg(pkey_reg);
>> The existing magic numbers are not great, but could we do:
>>
>> #define PKEY_ALLOW_ALL 0x0
>>
>> So that this can be written like this:
>>
>> 	pkey_reg = PKRU_ALLOW_NONE;
>> 	pkey_reg = set_pkey_bits(pkey_reg, 1, PKEY_ALLOW_ALL);
>>
>> That would get rid of the magic '0'.
> 
> Definitely better yes. But how about using Yury's uapi addition,
> PKEY_UNRESTRICTED [1]?
> 

Works for me.

>> ...
>>> +	/* Only allow X for MPK 0 and nothing for other keys */
>>> +	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0,
>>> +					   PKEY_DISABLE_ACCESS);
>> If the comment says "only allow X", then I'd expect the code to say:
>>
>> 	pkey_reg_no_access = set_pkey_bits(PKEY_ALLOW_NONE, 0, PKEY_X);
>>
>> ... or something similar.
> 
> I could #define PKEY_X PKEY_DISABLE_ACCESS but is the mixture of
> negative and positive polarity really helping? We cannot define PKEY_R
> and PKEY_W so that (for instance) PKEY_R | PKEY_X does what it says.
> Having to use PKEY_DISABLE_ACCESS to mean "X only" is not ideal, but
> this is what userspace already has to do.

There would be some churn, but we could also convert the whole thing
over to just use explicit RWX enable bits, like in the
thread_segv_maperr_ptr() test:

	// Truly turn everything off:
	pkey_reg = PKEY_REG_NO_ACCESS;
 	pkey_reg = set_pkey_perm(pkey_reg, 1, PKEY_RW);

I'm not sure that's worth the churn though.



