Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0D3CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5X75pHcHAnEM8zcD7ykTJjL5glq6wg6eQ+1uRSxWa4=; b=azHRgzM7C6TVYzTwoP//1XCSkx
	LvlvcEgg7QzauEeCpvgLF/knmCwY9UZY2Hy8kdyliznSPZzWFrbZeSEXWW5zkcFa+9qdTVrJ4ILbl
	nmOqkAAAP0JFNo2arjfOkZks0w97RK+ITGzHUAEDYybyO4u81A9NgM60Pp9Vpy8Pa3n1J6VwsRuqi
	2olCmxBKuK44oV7c/DQAY3C7Z90Vk4YePRH2aLE00pYcipe8nLoixealm3sejUPvyHLnetTfKivTd
	0ljkkyGRV8TDv3AV3zRAXJ5Ey9ib4fE3FoR6w2Pt/gOTyFsk3KxwXrzrUYL0WN/+ta1+aQFPWtgg8
	Srr2kLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwylb-00000007nhB-1KDw;
	Fri, 12 Sep 2025 08:04:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwylX-00000007ndx-26WH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757664258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=H5X75pHcHAnEM8zcD7ykTJjL5glq6wg6eQ+1uRSxWa4=;
	b=JWLssHX4qW8tqNmdJ0Re8GkPmmwfmtGaMeB+9CL2pPkPJFGyu7zvsYjs/fNA40vYSuImlT
	ttVsMX6HBjEv2//izNH32ex/Q3ZAE/dCHP8VUPUCGHnT7ew9drlQPAR8Sofo9agYQv9OHH
	VreKkhuOln9L5RM7ZJPR8WPs5FE3xio=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-1uUhiJgPPFiMVkHIZPMqeg-1; Fri, 12 Sep 2025 04:04:17 -0400
X-MC-Unique: 1uUhiJgPPFiMVkHIZPMqeg-1
X-Mimecast-MFC-AGG-ID: 1uUhiJgPPFiMVkHIZPMqeg_1757664256
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45de27bf706so7653955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 01:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757664256; x=1758269056;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5X75pHcHAnEM8zcD7ykTJjL5glq6wg6eQ+1uRSxWa4=;
        b=lQr2ilqowj6DIgvUYq2LV6uSxL35E3+ECTl2ZWIlgLjB2QLpcb1tkREy5URvje73VS
         jpA7fG1RO4gPjyHaoL0I0JMWfUnwEHix0Hy2HgGPSOWLZz+YGLPSbxh4pXaXx2qr+39g
         ZDJLCDbIprKoGwK13To998Hh0EUttj52A7FnCVdqw1MbVWTC83QdgU6lP41ICbQyBd7G
         KhSjY7gDaMifSIJyT2GKaS58lwk3NVHz3gwvj1gPnbWi84vxPgboOVgiHJTJQrC2WRAc
         WJvDm+M9AzW0Aulg2RofBAGp/zKvAISF6M7vagXR/8dHr0kObWGkLLtga8kys2kKCSdS
         5DjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLWXSOmE01shOdzsOjg7/e+8tK7xWUoqIn1QBm2SucPma9U/Ns1fFak1e3nQMx4aWsuCHmyvC70hfHufoXMj4n@lists.infradead.org
X-Gm-Message-State: AOJu0YynvsJvAqukKyc1Dw/jbnzFy/ST0Xz7gfMvRHjKvwvqIA4zuxe1
	9soAOlnxt+q9ZyfIvUyWH27Tyfy0fjBFZcR/cnWxL8vGVbjyTpfaNwiJpo1NHJrHDp01kIDHUf5
	xAf02mZgvkPytxy+Jps13QcdkvdA4DlQlUF7hpBpwlN85jzR/GQODaNrfafAF2if2BnOhfLClZv
	a8
X-Gm-Gg: ASbGncuJUNetIH5Oi9AfSeiwaKjZKsnUSLe5D/lIXxIUelml6aloKdnP+0M1KTyh3rz
	Hkh3+jrJOi1WkmcxVAHnXRXVIdMax0FASE7rpzTnJGU3/4mPMnHGsbkfIvZ7cnX2zZdNJFMLGt1
	l9eSh7qORxS/GCs9SRrSoUACq7YqrkUZfeFQyKlNJEc5Kj09YHsl9Nov99ZKAn7cBDwK+SGNP6k
	vWpIXd7BeJB3xeak0rPiD6Q+424p/VMRGEEf1KfquuelnLG3KxwnuSuiTmUtvzpMoZ9TTSc1xYu
	9sodhPLyV12NvFTgP40qCZEOTrLkXAd0eDRTbFA9dc9XR0hMUUpicDPBptkbjyN+d4Zd5ini1fc
	Rjd2uJB4Ii/+EmOaNf2q3vfCO22vKCIMT0o0x3Ws5fU1Y73bqtY02DEo7DvQjMoqFg1I=
X-Received: by 2002:a05:600c:3b85:b0:45f:2207:ab2a with SMTP id 5b1f17b1804b1-45f25476d29mr269835e9.27.1757664255896;
        Fri, 12 Sep 2025 01:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6B4WHtwQniBOXl9TNxrOEZZoyaGGED6LI1RYVbwr7AHnntDCVEJCDe9m05fXcYWcUrUbEPw==
X-Received: by 2002:a05:600c:3b85:b0:45f:2207:ab2a with SMTP id 5b1f17b1804b1-45f25476d29mr269475e9.27.1757664255404;
        Fri, 12 Sep 2025 01:04:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0157619fsm55845035e9.7.2025.09.12.01.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:04:14 -0700 (PDT)
Message-ID: <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
Date: Fri, 12 Sep 2025 10:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U4PGwMNfg2tKVF7O8ysf9k2-ru7slkXcncV8RFn0_CE_1757664256
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_010419_608067_04DB9D71 
X-CRM114-Status: GOOD (  37.21  )
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

>>
>> struct lazy_mmu_state {
>>      uint8_t enabled_count;
>>      bool paused;
> 
> Looking at the arm64 implementation, I'm thinking: instead of the paused
> member, how about a PF_LAZY_MMU task flag? It would be set when lazy_mmu
> is actually enabled (i.e. inside an enter()/leave() section, and not
> inside a pause()/resume() section). This way, architectures could use
> that flag directly to tell if lazy_mmu is enabled instead of reinventing
> the wheel, all in slightly different ways. Namely:
> 
> * arm64 uses a thread flag (TIF_LAZY_MMU) - this is trivially replaced
> with PF_LAZY_MMU
> * powerpc and sparc use batch->active where batch is a per-CPU variable;
> I expect this can also be replaced with PF_LAZY_MMU
> * x86/xen is more complex as it has xen_lazy_mode which tracks both
> LAZY_MMU and LAZY_CPU modes. I'd probably leave that one alone, unless a
> Xen expert is motivated to refactor it.
> 
> With that approach, the implementation of arch_enter() and arch_leave()
> becomes very simple (no tracking of lazy_mmu status) on arm64, powerpc
> and sparc.
> 
> (Of course we could also have an "enabled" member in lazy_mmu_state
> instead of PF_LAZY_MMU, there is no functional difference.)
> 

No strong opinion, but to me it feels like PF_LAZY_MMU is rather "the 
effective state when combining nested+paused", and might complicate the 
code + sanity checks?

So we could maintain that in addition fairly easily of course from the 
core instead of letting archs do that manually.

I would probably have to see the end result to judge whether removing 
the "paused" bool makes things look more complicated or not.

>> }
>>
>> c) With that config, common-code lazy_mmu_*() functions implement the
>> updating of the lazy_mmu_state in task_struct and call into arch code
>> on the transition from 0->1, 1->0 etc.
> 
> Indeed, this is how I thought about it. There is actually quite a lot
> that can be moved to the generic functions:
> * Updating lazy_mmu_state
> * Sanity checks on lazy_mmu_state (e.g. underflow/overflow)
> * Bailing out if in_interrupt() (not done consistently across arch's at
> the moment)
> 
>>
>> Maybe that can be done through exiting
>> arch_enter_lazy_mmu_mode()/arch_leave_lazy_mmu_mode() callbacks, maybe
>> we need more. I feel like
>> we might be able to implement that through the existing helpers.
> 
> We might want to rename them to align with the new generic helpers, but
> yes otherwise the principle should remain unchanged.
> 
> In fact, we will also need to revive arch_flush_lazy_mmu_mode().

That's okay if it's all hidden behaind a sane core API.

> Indeed,
> in the nested situation, we need the following arch calls:
> 
> enter() -> arch_enter()
>      enter() -> [nothing]
>      leave() -> arch_flush()
> leave() -> arch_leave()
> 
> leave() must always flush whatever arch state was batched, as may be
> expected by the caller.
> 
> How does all that sound?

I am no expert on the "always flush when leaving", but it sounds 
reasonable to me.

Which arch operations would you call from

pause()
continue()

?

>> And on top of the proposal above we will have some
>>
>> struct arch_lazy_mmu_state;
>>
>> define by the architecture (could be an empty struct on most).
>>
>> We can store that inside "struct lazy_mmu_state;" or if we ever have
>> to, start returning only that from the enable/disable etc. functions.
> 
> I'm not sure we'd want to mix those styles (task_struct member + local
> variable), that's adding complexity without much upside... Also having a
> local variable at every nesting level only makes sense if we have an
> arch callback regardless of nesting level, which is unnecessary in this
> proposed API.

Yes, that was rather a "if we ever really run out of space we could look 
into that", I am not a fan of it obviously.

-- 
Cheers

David / dhildenb


