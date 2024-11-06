Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D271D59F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 20:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPXU/jAhw5ILwR4cL55fdDUpTzROl+P71oX17biKcy0=; b=0Zd85l/siRskT9s1d/Lga4Zfo/
	YKeD10zzMG4iTzGeeIWzVkXCpDZsgE/vDwVub2oX6iIaW9a1OBM5hUpT+W41j5lEYe6gJFcgmY1n0
	W2e0uHM5qHXK5IMYLYnCTd1UA9tVeVuMhHVxktrGkvJOai4ZQw9f3rRHlvDHETdDLo172NGOP6nS+
	15uN8ZJZ9hpz9g12JqPEo1/rAHCooHMXL875XqyVRP7DiPD1c1Yd8d2fRaaUUGy7SEUokAq14+4kX
	NdPsq37H3VD6PRzGV/RgyD9NYH3XC4mm4wnie4ekk17iwFqpCmDgLdfW8/TA9CDvvbVELWqcJEFfX
	hmrFgEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mpB-00000004i4W-2MyV;
	Wed, 06 Nov 2024 20:40:21 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8mnS-00000004hq1-1YgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 20:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730925514; x=1762461514;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t1T0JqltTt1br9rO+URcAmslVziWyZeSdcV2iKnx4V4=;
  b=N/mdI16eajg6tohpQH6Xla/l/x1AIfbACt28dkqYVKOaCHHujPaDqwr4
   ItS7azf9R9ZFWYC2z+njDLg+/KO3rqPbE3s5cJcEgu/2ikvYgRQ2K6z6i
   pDK7vPk2t9T60/+uDjIQNNRdFUjrIUXk02Sbw9ftH5HJ0iNXjjwI8fLUt
   7bWRS072Rg/+QxC/U7Tvf+M+XngUq7E8ADxnyDhNc/Rls62xC/IURdrsj
   aoZZvWCbuf4fqeAG0NS4AuXvvV/OxIaKSrdbgHr0Wsc1QEYfFBnc7DxRD
   glXRuJ+f5MMtXVFyd/yn2xTMDR2IJYDMqMi2SK292qu7GL1EDzgG+HHbx
   g==;
X-CSE-ConnectionGUID: /1UP2M4HQEev/PtwkWBg7Q==
X-CSE-MsgGUID: TDL52B5cSeSFSPPUz8X+BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41340846"
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="41340846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:38:31 -0800
X-CSE-ConnectionGUID: d6sAQXYbTuCw0s8JjLqdMw==
X-CSE-MsgGUID: 0q6Tkfi4S2Wgas+639rTLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="108044520"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 12:38:30 -0800
Received: from [10.212.82.230] (kliang2-mobl1.ccr.corp.intel.com [10.212.82.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 2880520B5703;
	Wed,  6 Nov 2024 12:38:26 -0800 (PST)
Message-ID: <89b46b99-e9fc-4ce4-84b2-b24f565db8d5@linux.intel.com>
Date: Wed, 6 Nov 2024 15:38:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] perf: Correct perf sampling with guest VMs
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
 <20241105195603.2317483-6-coltonlewis@google.com>
 <007cfed1-111d-45aa-b873-24cca9d4af01@linux.intel.com>
 <ZyvJIx-UHXawnUYs@linux.dev>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <ZyvJIx-UHXawnUYs@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_123834_469124_E8E027FA 
X-CRM114-Status: GOOD (  15.77  )
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



On 2024-11-06 2:53 p.m., Oliver Upton wrote:
> On Wed, Nov 06, 2024 at 11:07:53AM -0500, Liang, Kan wrote:
>>> +#ifndef perf_arch_guest_misc_flags
>>> +static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
>>> +{
>>> +	unsigned long guest_state = perf_guest_state();
>>> +
>>> +	if (guest_state & PERF_GUEST_USER)
>>> +		return PERF_RECORD_MISC_GUEST_USER;
>>> +
>>> +	if (guest_state & PERF_GUEST_ACTIVE)
>>> +		return PERF_RECORD_MISC_GUEST_KERNEL;
>>
>> Is there by any chance to add a PERF_GUEST_KERNEL flag in KVM?
> 
> Why do we need another flag? As it stands today, the vCPU is either in
> user mode or kernel mode.
> 
>> The PERF_GUEST_ACTIVE flag check looks really confusing.
> 
> Perhaps instead:
> 
> static inline unsigned long perf_arch_guest_misc_flags(struct pt_regs *regs)
> {
> 	unsigned long guest_state = perf_guest_state();
> 
> 	if (!(guest_state & PERF_GUEST_ACTIVE))
> 		return 0;
> 
> 	return (guest_state & PERF_GUEST_USER) ? PERF_RECORD_MISC_GUEST_USER :
> 						 PERF_RECORD_MISC_GUEST_KERNEL;
> }

Yes, this one is much clear.

Can a similar change be done for the x86 perf_arch_guest_misc_flags() in
the previous patch?

Thanks,
Kan


