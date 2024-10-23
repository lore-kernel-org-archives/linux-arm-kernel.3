Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA78CCFA460
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbQptFcw9TkcYXo8nXAdvDSpFqHn6tC+BaY9HH4rqfw=; b=a1RSyuf8iyHU8ooL0kZt8QyPJo
	SwgurZCwfidHCamHRsP6u537UBMJ2a7lB0LtJxIFPHZKPqtUD/S40fz8fvyuAAlvw73qXP3XRP/59
	c8zFtsd6L3lbrw092Xzf2fNJOe6zXGv5UIUo9pLSeIQrheiTCMv6JgQYLISA3LKxGM7PYeCKMD6cf
	5e3ZMT3qBcyRhkE+1wm6hb0dVmXJTACzzye2MFu0j2OB9NX+QElMY/zsHY8ar4xda9e1ye29+R9Kh
	fy3v//6852ZlU7xERSi0TYwbOFas3lUnY/HhCsEhJ4XBzgXOTmAH5xIsHNtME8IPIBv1/BLsI8Mon
	v69ZGOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gx9-0000000Ffbc-2Msz;
	Wed, 23 Oct 2024 19:23:31 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fnu-0000000FTdc-2vfU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729706995; x=1761242995;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2rCl2EkGUq3eQaPQ784zJRGPXTj72TQkCboL00ZG36c=;
  b=gjmnmg6BcBTklQBGZwaT7TTS9NOkEkPX634zFXoR1iD4/W2BZu+qmGCT
   81etoWOaJ7JGpOjymrcOs0a8mc/YIDeeZVJpQZRzodIu7Q8kizD5ro35p
   0WQ2AR40jeyaFdHVCuAyBFRqSzXytsA917fpcvgMh8cMABPHWLADcZr8N
   rsmrcIkZ+ylnqy+unNriS8pXlQ7nem571+zzrXrWzjJ23U8DeAE/HiZLn
   RFO38GKDIFXXw8kp85YXR0moDg5b5cgmCPGwFVM/67bV+sFAzmpL9V0CR
   bfV5ZzxQIc+y1lmuJcb3vfRcShStojNEA9+HiTRB7fEgkMG/SvMfjx65s
   A==;
X-CSE-ConnectionGUID: G9S0x2wQSWiGb++X/MBswg==
X-CSE-MsgGUID: hGT6zUU+QRm9ApP8n/Z5gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="32166882"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="32166882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 11:09:52 -0700
X-CSE-ConnectionGUID: Zinfi+i6Sa6zRiLFIJWmzA==
X-CSE-MsgGUID: C/7rh0eMSamHvy3oTBNjfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80497846"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO [10.0.2.15]) ([10.245.115.59])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 11:09:41 -0700
Message-ID: <175dc21f-a4e6-484f-8ee0-ec64c6dfc392@intel.com>
Date: Wed, 23 Oct 2024 21:09:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 03/14] KVM: x86: Fix Intel PT Host/Guest mode when
 host tracing also
To: Sean Christopherson <seanjc@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Thomas Richter <tmricht@linux.ibm.com>,
 Hendrik Brueckner <brueckner@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Yicong Yang <yangyicong@hisilicon.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Will Deacon
 <will@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
 Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 H Peter Anvin <hpa@zytor.com>, Kan Liang <kan.liang@linux.intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, mizhang@google.com,
 kvm@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org
References: <20241014105124.24473-1-adrian.hunter@intel.com>
 <20241014105124.24473-4-adrian.hunter@intel.com>
 <Zw1iCMNSI4Lc0mSG@google.com>
 <b29e8ba4-5893-4ca0-b2cc-55d95f2fc968@intel.com>
 <ZxfTOQzcXTBEiXMG@google.com>
 <2a8e6f2c-4284-4218-9b91-af6a4d65e982@intel.com>
 <ZxgnoTKt2IBnBBJ2@google.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <ZxgnoTKt2IBnBBJ2@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_110954_865152_0F516833 
X-CRM114-Status: GOOD (  23.08  )
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

On 23/10/24 01:30, Sean Christopherson wrote:
> On Tue, Oct 22, 2024, Adrian Hunter wrote:
>> On 22/10/24 19:30, Sean Christopherson wrote:
>>>>> LOL, yeah, this needs to be burned with fire.  It's wildly broken.  So for stable@,
>>>>
>>>> It doesn't seem wildly broken.  Just the VMM passing invalid CPUID
>>>> and KVM not validating it.
>>>
>>> Heh, I agree with "just", but unfortunately "just ... not validating" a large
>>> swath of userspace inputs is pretty widly broken.  More importantly, it's not
>>> easy to fix.  E.g. KVM could require the inputs to exactly match hardware, but
>>> that creates an ABI that I'm not entirely sure is desirable in the long term.
>>
>> Although the CPUID ABI does not really change.  KVM does not support
>> emulating Intel PT, so accepting CPUID that the hardware cannot support
>> seems like a bit of a lie.
> 
> But it's not all or nothing, e.g. KVM should support exposing fewer address ranges
> than are supported by hardware, so that the same virtual CPU model can be run on
> different generations of hardware.
> 
>> Aren't there other features that KVM does not support if the hardware support
>> is not there?
> 
> Many.  But either features are one-off things without configurable properties,
> or KVM does the right thing (usually).  E.g. nested virtualization heavily relies
> on hardware, and has a plethora of knobs, but KVM (usually) honors and validates
> the configuration provided by userspace.
> 
>> To some degree, a testing and debugging feature does not have to be
>> available in 100% of cases because it can still be useful when it is
>> available.
> 
> I don't disagree, but "works on my machine" is how KVM has gotten into so many
> messes with such features.  I also don't necessarily disagree with supporting a
> very limited subset of use cases, but I want such support to come as well-defined
> package with proper guard rails, docs, and ideally tests.

Ok, so how about: leave VMM to choose CPUID, but then map it to what the
hardware actually supports for what is possible.  So the guest user might
not get trace data exactly as expected, or perhaps not at all, but at least
KVM doesn't die.  Then add documentation to explain how it all works.

Note, the number of address ranges is not that much of an issue because
currently all processors that support Intel PT virtualization have 2.

I have a feeling QEMU was targeting compatibility with IceLake, which
would probably work for all processors that support Intel PT virtualization
except for one feature - the maximum number of cycle thresholds (dropped
from 2048 to 16)


