Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDFEC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbmQKqHbaixk79j7TKKru6hbZh7kM54PuiKw9+W744U=; b=rCt4D0Nz+uiJViNva21vj18Rp8
	LOE0RjM4LKTzn0Y2NMq6TS1el2x+ChCn0SOIjphqqJHmuYzO/IPEtwthiKr9ma5J4/VHdz5JAgDJj
	UJ4k7Uqfffqgd3TkYxvT3/EanFuD8YiEakeYUxRAvo4G5M2MET35F0/hwvyd3nYPy45b669rf/XSt
	XAP1Dn8VNmRnuuQkaUy2fRzlQkpDXI8lGqbaPuXDA9R1u/eaJxotoSaS3U11ttnHDTSRAp/JTByeI
	dvA/J+c3cvOGSnKeoEOPLf+vxZuCn56J5E/1yaY8p5CPbAdHyJzy+eBKk4VjRivdT/KQRp6bPYQEi
	9ycAqAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySG-00000007wH5-3iGY;
	Mon, 05 May 2025 16:14:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByJe-00000007vCr-3Bky
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746461113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xbmQKqHbaixk79j7TKKru6hbZh7kM54PuiKw9+W744U=;
	b=iZU5WpM1W5aLLlh3+p3JYIirHe6HcZpXOToc0m5GYUU6FlWCl38U4IwcdiO70Dbkcm93NF
	al6tz6nkL6jrndUCndxaJPERhuRdtuIsvGngUNwNl0ppMYXDUWFfLvu1lESBBPwMHYG920
	NDD/toW2EP0QT2jgq9ipNbVJEJGGy/E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-z5tkZb6tOeyhMpH1NDl7lg-1; Mon, 05 May 2025 12:05:12 -0400
X-MC-Unique: z5tkZb6tOeyhMpH1NDl7lg-1
X-Mimecast-MFC-AGG-ID: z5tkZb6tOeyhMpH1NDl7lg_1746461111
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912539665cso2199127f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461111; x=1747065911;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbmQKqHbaixk79j7TKKru6hbZh7kM54PuiKw9+W744U=;
        b=HEDP76298m9X+yXNHpXNg3hwQRL82WiSVSom5eVq/o3HuBqtKwskCMbWI8mrWoDeiM
         vnm7dxivPUBSuV1SMPmwZDZE/hOYOTQyCiZ/PyZ/vBImtIQkbvWBMUYmgQ+geIUpCZu3
         n8+UBeDrCesaXv/dziri5Vh6ZJqQ4jdq7sc7UiUtMcTwVtS4WJ1aXHYDVubbYZ5YkZRx
         lL3bQ5NttTom6Sj0rt/OTSPTLOh4UC/r3TndIj5rOlhemJcz1XIkjoDTv/TQ/dmY++dk
         qwmWcD9oS+yCea/ZwYRyAf+Tz2VfsB7QiWXPRFAitF2jQsYSVbVclFvFFD3mgZ0k6ioX
         AdHg==
X-Forwarded-Encrypted: i=1; AJvYcCUoELG+MIE3PcBumDYk/75cS5KQgtJfN5uD7xS+eSwo7fpaSbSPSKKI91S6MZUWuYVajP2DyISj5eVZOq0nnhis@lists.infradead.org
X-Gm-Message-State: AOJu0YzK5Le8PD5YSZWBu+IN03Tg3IC8gX9JPS/Ml7XCNBhKlGF9Sxef
	Uo+4Rtqp3xAEk823VwPQh9bJPO1xppRY137vieQVbv/yvjBymDkJV88EAaTfrplhZOWgntj53Zu
	2pRKCV2nWwZYGVnWT2T6hpbUoAetMhluHHx6Z46WF5+js04D1zaSZXnF000bgJRWG3XjDyR0M
X-Gm-Gg: ASbGncu+NUFeCjH0ybrxpNzQfutryVy3JYr7a+X2Pss/kuf1Z379ErMXHc6EGlFgWkl
	kFKN5mwosnwiDtVoPT2LzH221KRKOnuwIdw0rb246OA4FbRmavAy9ToqTupxMkkSZEj1TdgtBbV
	2IvlwCT0oDSJQsifLK8uqsf7Agj1YnfRUtXOS0S6ooQs2Wsvaw3bgRn9SPjm4/GFmrpYkCZX8bQ
	mAC2/wgp21OEtH7C424z2Cng984/k7bXbg7rd6cZ3gBNPjYKdUbQX9eq8vajCqw14YvdhceAyoD
	n+jsKVi9XiH4d1C4ewq1rADnH2BPc8o4e5VHqrxboIGiEPwRaccyTgSIcOPW
X-Received: by 2002:a5d:5847:0:b0:3a0:92d9:da4 with SMTP id ffacd0b85a97d-3a0ab5570d7mr42034f8f.6.1746461110845;
        Mon, 05 May 2025 09:05:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTCOZOA7pAPkGMgb4M/yK3jl2JFA1fizSH2/7N2z92v4GSBR5vAiFYanEje4sscTa08V1CA==
X-Received: by 2002:a5d:5847:0:b0:3a0:92d9:da4 with SMTP id ffacd0b85a97d-3a0ab5570d7mr41959f8f.6.1746461110131;
        Mon, 05 May 2025 09:05:10 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm139635145e9.6.2025.05.05.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:05:09 -0700 (PDT)
Date: Mon, 5 May 2025 18:05:08 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: Oliver Upton <oliver.upton@linux.dev>, Quentin Perret <qperret@google.com>, 
    Fuad Tabba <tabba@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
    kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: LM regression: fce886a60207 KVM: arm64: Plumb the pKVM MMU in
 KVM
In-Reply-To: <86ldrbgl2x.wl-maz@kernel.org>
Message-ID: <7863e387-0b91-fac5-9925-e461ae7b30cd@redhat.com>
References: <3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com> <86msbrguka.wl-maz@kernel.org> <e1117e68-ef05-9de2-d018-685bb7d86bb5@redhat.com> <86ldrbgl2x.wl-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c6LImXClIvlpqKGP_fyNFoHdwB5aRi8bk35Yyn07bfM_1746461111
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_090514_876302_6AB9E6B3 
X-CRM114-Status: GOOD (  31.73  )
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

On Mon, 5 May 2025, Marc Zyngier wrote:
> On Mon, 05 May 2025 15:01:24 +0100,
> Sebastian Ott <sebott@redhat.com> wrote:
>>
>> On Mon, 5 May 2025, Marc Zyngier wrote:
>>> On Mon, 05 May 2025 11:52:00 +0100,
>>> Sebastian Ott <sebott@redhat.com> wrote:
>>>> Doing back and forth migrations currently fails on arm after a couple iterations.
>>>> During the failing migration KVM_RUN exits via guest_abort and returns -ENOMEM.
>>>> I can reliably reproduce this by migrating between 2 qemu instances on an ampere
>>>> altra machine. This fails after < 5 iterations. In this case qemu would spit out
>>>> smth like this (other than that - nothing in the logs):
>>>>
>>>> error: kvm run failed Cannot allocate memory
>>>>  PC=0000aaaae7d48590 X00=0000aaaae80a2e00 X01=0000aaaae7ea2fc0
>>>> X02=0000000001d3a5d0 X03=0000aaaae7eace8c X04=000000003b9aca00
>>>> X05=000000000000004a X06=000000000000004a X07=0000000028000000
>>>> X08=0000000000001d70 X09=0000000000000018 X10=000144b7d0000000
>>>> X11=00ffffffffffffff X12=000000008378f367 X13=0000aaab1a202d70
>>>> X14=0000000000000000 X15=0000000000000000 X16=0000ffffa2e2f7a8
>>>> X17=0000ffffa2541f20 X18=000000000000a000 X19=84bfda6288cf2dd6
>>>> X20=0000aaab1a1f1ce0 X21=000000007fffffff X22=0000ffffc5431788
>>>> X23=0000aaab1a17db60 X24=0000ffffc5431770 X25=0000000100000000
>>>> X26=0000004100000000 X27=0000000000000001 X28=0000aaab1a1f1c20
>>>> X29=0000ffffc54316d0 X30=0000aaaae7f8cd24  SP=0000ffffc5431650
>>>> PSTATE=20001000 --C- EL0t
>>>>
>>>> Guest and host are otherwise idle, kvm is in normal VHE mode.
>>>>
>>>> Git bisect points to (fce886a60207 "KVM: arm64: Plumb the pKVM MMU in KVM")
>>>> I also double checked that by reverting this commit on top of 6.14.
>>>
>>> Thanks for find the triggering commit. Can you further identify *what*
>>> causes the -ENOMEM? The only new -ENOMEM in that patch is the one
>>> added to topup_hyp_memcache(), which shouldn't be called.
>>
>> The kvm_pgtable_stage2_map() call in user_mem_abort() returns -ENOMEM
>> because the memcache pointer was not initialized!
>>
>> It looks like smth like this without other conditions could do the trick:
>>
>> if (!is_protected_kvm_enabled())
>> 	memcache = &vcpu->arch.mmu_page_cache;
>> else
>> 	memcache = &vcpu->arch.pkvm_memcache;
>>
>> (I'll try this now)
>
> Right, we end-up with an uninitialised memcache variable. Why isn't
> the compiler screaming?

Yea. Also I was under the impression that these kind of warnings tend to
over indicate..

> I think you can indeed simply hoist the init of memcache very early
> on, which should solve hopefully solve the issue.

It solves the issue for me. Please note that in this case topup cache is
not called - I hope that this is not an issue (but it was also the case
before commit fce886a60207).

>>
>>> Also, a failure to allocate would leave some nastygram in the kernel
>>> log, so it is unlikely to be an actual failure to allocate.
>>>
>>> Is it the first KVM_RUN that fails after migration?
>>
>> Nope, it happens on the side that triggers the migration.
>
> Probably because splitting pages requires allocating some memory, and
> all of a sudden you trigger the allocation from the memcache. Boo.
>
> Thanks for spotting this, I'm looking forward to the fix!

------->8
From c594bbf9c3c4186594b798734ea9b1779be3b584 Mon Sep 17 00:00:00 2001
From: Sebastian Ott <sebott@redhat.com>
Date: Mon, 5 May 2025 11:09:58 -0400
Subject: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()

Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
initialization of the local memcache variable in user_mem_abort()
conditional, leaving a codepath where it is used uninitialized via
kvm_pgtable_stage2_map().

This can lead to migration failures where KVM_RUN exits with -ENOMEM.
Fix this by making sure that memcache is always valid.

Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
  arch/arm64/kvm/mmu.c | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..6c3c658c5f29 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1501,6 +1501,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  		return -EFAULT;
  	}

+	if (!is_protected_kvm_enabled())
+		memcache = &vcpu->arch.mmu_page_cache;
+	else
+		memcache = &vcpu->arch.pkvm_memcache;
+
  	/*
  	 * Permission faults just need to update the existing leaf entry,
  	 * and so normally don't require allocations from the memcache. The
@@ -1511,10 +1516,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);

  		if (!is_protected_kvm_enabled()) {
-			memcache = &vcpu->arch.mmu_page_cache;
  			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
  		} else {
-			memcache = &vcpu->arch.pkvm_memcache;
  			ret = topup_hyp_memcache(memcache, min_pages);
  		}
  		if (ret)

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0


