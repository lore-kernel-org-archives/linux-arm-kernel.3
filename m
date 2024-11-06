Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA19D59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UO/fsunJcLHUv7ogKKQJZR3TGi/Dgpu/xOl2VgUzdS8=; b=bwZlAj67Inv0MTEuKYOjFpjZeE
	TV/A9XVtR0E+BsLGt5m21hvpdpwLAPw97Cp5OP9qZAvwb84NGeYLGck9JMd6tLZ7i0NeX9KdMFHBR
	le73Yrt2QGHXWHrfMmnC8VModyckif1/7pfsIYVtTwi67yfAEx7KZCj1JRzKs0Ib03Xm5aGF292Xp
	oQFNYusfXWOQXKswTzpXtpdEVZmgahxletE1SWzksn7Upa7zApD/Ddp/jyEoJnmMK4hnAMHc3N8zG
	vEpw10cLeYPWfSMIklITpZizwGOnkeBZvDOZmDBpl+XYeKEdQHZI38a08VVMkE/BHt91KaR5IMX+P
	YbgWzUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mlj-00000004hZD-2z8O;
	Wed, 06 Nov 2024 20:36:48 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mij-00000004gry-1x5R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730925221; x=1762461221;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zoRLMKW55o98JRmgTawjT4yCHMdI37JhvZnILfOLqRQ=;
  b=nLJtP8XyL/91EAx2oycBn+CY856h64nenhiJuVR/02agn4ErgNQQGRkZ
   +2OQZ74sPDYWBX2keXtdTF/xS3czCBWaKDu2c+lGrxCu7w/NTCBpHue/w
   icSkSLqFPWHLAsTtGoDvpEBdavH7YzULRoiFj23YBiV0XERtXt9dRMFQ+
   tDf15BFO6sGmr2S26LjNPHj9GJKKS5aSL5cS5bweLGoNeSMm8YEXPCCGY
   Te3f3MC3iDKtxWaYG7aODK1c5hcuYKkzMfyJsPbgp6O+fNGv49yB+Zl6g
   XlNN6h+9vJdlk5E6NZruhlgM73xPzw31f4oeYVPs90bNk1xIYmtjJCa9Y
   Q==;
X-CSE-ConnectionGUID: MfDP0m81QDi8Au4op4+Zfw==
X-CSE-MsgGUID: hYNN7ftPSPW9pbie6GagAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30705999"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30705999"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:33:37 -0800
X-CSE-ConnectionGUID: V8XizmLPQ5C6WPxTiJI6TA==
X-CSE-MsgGUID: oNVXimYpTpmteoMQVxNatg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="84355097"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:33:37 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 560D920B5703;
	Wed,  6 Nov 2024 12:33:32 -0800 (PST)
Message-ID: <597dbcf6-8169-4084-881c-8942ed363189@linux.intel.com>
Date: Wed, 6 Nov 2024 15:33:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] x86: perf: Refactor misc flag assignments
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Will Deacon <will@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org
References: <20241105195603.2317483-1-coltonlewis@google.com>
 <20241105195603.2317483-5-coltonlewis@google.com>
 <65675ed8-e569-47f8-b1eb-40c853751bfb@linux.intel.com>
 <ZyvLOjy8Vfvai5cG@linux.dev>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <ZyvLOjy8Vfvai5cG@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_123341_569241_404AB13F 
X-CRM114-Status: GOOD (  15.30  )
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



On 2024-11-06 3:02 p.m., Oliver Upton wrote:
> On Wed, Nov 06, 2024 at 11:03:10AM -0500, Liang, Kan wrote:
>>> +static unsigned long common_misc_flags(struct pt_regs *regs)
>>> +{
>>> +	if (regs->flags & PERF_EFLAGS_EXACT)
>>> +		return PERF_RECORD_MISC_EXACT_IP;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>>> +{
>>> +	unsigned long guest_state = perf_guest_state();
>>> +	unsigned long flags = common_misc_flags(regs);
>>> +
>>> +	if (guest_state & PERF_GUEST_USER)
>>> +		flags |= PERF_RECORD_MISC_GUEST_USER;
>>> +	else if (guest_state & PERF_GUEST_ACTIVE)
>>> +		flags |= PERF_RECORD_MISC_GUEST_KERNEL;
>>> +
>>
>> The logic of setting the GUEST_KERNEL flag is implicitly changed here.
>>
>> For the current code, the GUEST_KERNEL flag is set for !PERF_GUEST_USER,
>> which include both guest_in_kernel and guest_in_NMI.
> 
> Where is the "guest_in_NMI" state coming from? KVM only reports user v.
> kernel mode.

I may understand the kvm_arch_pmi_in_guest() wrong.
However, the kvm_guest_state() at least return 3 states.
0
PERF_GUEST_ACTIVE
PERF_GUEST_ACTIVE | PERF_GUEST_USER

The existing code indeed assumes two modes. If it's not user mode, it
must be kernel mode.
However, the proposed code behave differently, or at least implies there
are more modes.
If it's not user mode and sets PERF_GUEST_ACTIVE, it's kernel mode.

Thanks,
Kan



