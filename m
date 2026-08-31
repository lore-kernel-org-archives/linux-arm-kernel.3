Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F64C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bclo5dNXV+6Jy1wwsMfxD1j5QCeC9PLq5D/ZXM1ZV+o=; b=pSqRgjSFb+Onhy4+XiinoBDX/D
	Wyjm/xUU4g4eKDEmj5ib/IObJqpIs7vJeUAUG88T6dyqv4tRif/utAw9YN5cegss2jMbGEQak9QWq
	6qQsXx+Ermdu6d/Mue2T8rFaZ/FhiJO6e55rfrl2Jnk6Emv6ob3B7SAzY5l13O424OGo7ausbr7Oj
	2S1Ra4JfQQ7B4gy6HVzrxU4iUx0/cAODfpRHUhVRYuXotmBsmEIfJKGmmos0ESn3T4wYPwmp/9+0b
	kuAKvj06MvpEhP17zbIOVdFqoMobpIMEzsuxxdyG7NOTGLcAJYED/C1hZL4rqm8c/DRiJD4FYKXo+
	1LMylyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x125z-00000009PoN-2Unf;
	Mon, 31 Aug 2026 13:30:43 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x125x-00000009PnJ-01c2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 13:30:42 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c2544ff970dso542020166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 06:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788183038; x=1788787838; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bclo5dNXV+6Jy1wwsMfxD1j5QCeC9PLq5D/ZXM1ZV+o=;
        b=CPI74ctDVX74e64iSvOxjKFJmB1PFdCwWuNz0u8Tpv7L70xH3x6ibHbuepxd9psm8E
         P8DeA/TxWWE/BLaDAOsJUY1i41MlUxbyplgjhbXz215glltjtF7R6mA4ITlM9Rn/5ZRO
         UmppueVSNT6e7ddKWabAL6/qTx6DMwbvgCAIOMym+HbjRVJhiUWEM1G92DZ5X/stpXOB
         r/vpK9Dx4yvvHhLNcxWkpysf+iWHFc58UFv/jzW6nqumDCX9u71y9oOFsisyX0bbwYmE
         URrO9gnXbLwIl58Z1LWute5um/7UWfcf3I68dAEdxOIEFJ5e1jvPHY74upgjplDEiPJE
         WCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183038; x=1788787838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bclo5dNXV+6Jy1wwsMfxD1j5QCeC9PLq5D/ZXM1ZV+o=;
        b=Y9rgNtZLDK2dM8BvmAnDlWQV0TnpxgeeKhF3AgMCFi+xVBPeehfmaWc9QYe1A1xncf
         WSRr2GENyiC6lAft/mFIgldtCupOJFsdsaqyOHOoweKVBUf7LwUQk7MmCbWYXvBaqzRH
         aEnZ7r+Hus3cxKfvvAkSPS2ixcd3/mBOWeNPlNGzCK7Qh4QP+mDEowv1g6yRxYHpmsDH
         x4m6KeI+qAKNxHzgxjJn98lXCWNNdFztiZVMvONbP25q/7DFfbEZrHIMT/B7KlelvlQG
         sNi3CJouw2cVSL9BTd0ysRvd63VAk0joHncMWRekMl1E/7IRMFLhSDvJGpImWINDYHXH
         eyZg==
X-Forwarded-Encrypted: i=1; AHgh+RpZA6iwzy3jx9th41DR4f6qhzOxv3XOJr/HHvRRsVbdBcDO0YPEhxEXrno1EEHOHFyP0zU6/C4U5ddLjZ9si0Nf@lists.infradead.org
X-Gm-Message-State: AFuF++lLKMOepsM4G5gfoNNlEU/FsnuDdE47b3Jskeboe+81hYJi/XpM
	/OlKbNuOTGGMc8oASm+J6YLxhS54MBKREs56pqXbunOl8CAVZh3XEDutLRnwBtYnC+o=
X-Gm-Gg: AR+sD11jbXKS+sYRBTzzYOeZfCPy4FnOciKytQEPy4VBabDcWUAub9Op8aoxrZasucQ
	n1LJyWrxEKPF6dpYiHZWoD57vb03ts7a1z4Z/Q+HzYpZuuRz/Dk79IUItO3BwGURau3W4UbL7ez
	4D+d1kfVku4J+tuM8427DiSyG1KajdI0j0s5ZC5f2A6apiI/fkXcnWDp/uVUz7ZN/UfCZKJgjru
	3rNpmVo5yvI7MNyi9SSmsJKy2xt5oVM6Jz0MRMxa90DFZ+KzmSgc1lhxqvYQpg9WpTTxZNyGjmM
	ZS7OhllXs4Cpq0wLP/hSo0ff2dS3b07sCvGer4llWGLgLgT3pIwEXGEPPmzRnHH13RuYDCjU00h
	pFEpBsd7HoG20gh80X15xd/zWK7Ml9vomPPgX/d/2kNedWPQIwvpXFKG2Foqz1tE6cDBOObibRJ
	Isv8ML/kG53Vzyi21jcqHxw+tJSTT0AqsBZy+GpjpekrOWNZxjM35dhfJcyA5wB2XnVkFbnjjzC
	Do/W8oVshpga9T8GsHC++1B
X-Received: by 2002:a17:907:3cc2:b0:c1c:5aa1:de57 with SMTP id a640c23a62f3a-c2557030696mr1575327866b.13.1788183038289;
        Mon, 31 Aug 2026 06:30:38 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b233sm435317266b.11.2026.08.31.06.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 06:30:37 -0700 (PDT)
Message-ID: <5e6231aa-10b9-4c41-b7ab-dee5e8f64bec@suse.com>
Date: Mon, 31 Aug 2026 15:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] arm64: Allocate .text and .init.text together
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20260822135323.795946-11-ardb+git@google.com>
 <524b5817-c097-47cb-b301-4a9c0f1d2947@suse.com>
 <cee89666-9de0-4012-b665-69da3846c5ef@app.fastmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <cee89666-9de0-4012-b665-69da3846c5ef@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_063041_083336_13930787 
X-CRM114-Status: GOOD (  21.61  )
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

On 8/28/26 3:45 PM, Ard Biesheuvel wrote:
> On Fri, 28 Aug 2026, at 15:07, Petr Pavlu wrote:
>> On 8/22/26 3:53 PM, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>>
>>> The arm64 module loader has to deal with a couple of corner cases that
>>> may occur when .init.text is placed out of direct branch range of .text:
>>>
>>> - ordinary direct branches from .init.text into .text may require the
>>>   use of a PLT entry (i.e., a trampoline aka veneer), which means not
>>>   only that additional PLT entries need to be allocated for
>>>   cross-section calls, but also that .init.text needs its own PLT
>>>   reservation, as the one in .text will be out of range as well;
>>>
>>> - dynamic patching of the ftrace handler into .init.text code needs its
>>>   own dedicated trampoline as the one in .text may be too far away.
>>>
>>> - recent compilers may omit BTI veneers for static functions that never
>>>   have their address taken, and so additional veneers will need to be
>>>   added to .text in case cross-section direct branches from .init.text 
>>>   require a PLT entry (and therefore a landing pad at the target end).
>>>
>>> This is unfortunate, because it is actually somewhat unusual for .text
>>> and .init.text to be so far away from each other: only when allocating
>>> either of them (but not both) exhausts the 'near' (PLT-less) module
>>> region, the other will be allocated from the spillover region, which is
>>> not in direct branching range, and therefore requires PLT entries for
>>> cross-section calls.
>>>
>>> This series addresses this wart by allocating both of them as a single
>>> chunk, and freeing the .init.text part along with the other init
>>> sections at the appropriate time. This ensures that the two regions will
>>> never require veneers for cross-section calls, allowing the arm64 module
>>> loader to be simplified.
>>
>> It looks like this should also be useful for ppc64, which currently
>> merges .init.text and .text because keeping them separate would require
>> stubs between the two, and consequently .init.text is never released in
>> modules on this architecture.
>>
> 
> Thanks for the data point - are those stubs needed when there is some
> distance between the placements of .text and .init.text?

Yes, my understanding is that these stubs are primarily needed because
the BL instruction on ppc64 can only reach a range of +-32 MB.

Another aspect on ppc64 is the use of the Table of Contents (TOC). In
theory, when splitting .text and .init.text, one would also want
separate TOCs, along with stubs to support switching between them.
However, I don't think this is particularly feasible. As far as I can
see, the ABI and GCC don't allow separate TOCs within a single
relocatable object file. In practice, it shouldn't be a large problem to
keep a single TOC, even if some data related only to .init.text remains
present after the module is loaded. Being able to free .init.text is the
important part. On newer Power10 with PCREL, the TOC is not used, so
this issue goes away.

-- 
Cheers,
Petr

