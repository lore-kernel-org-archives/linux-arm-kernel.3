Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9806CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+fNeysjSBqXJo83LMvpOWAm6fUtr/rW8XiVtt3RPUw=; b=SrVjZgqu5dlaKYJps3NrbkIFY9
	xnlkfsdeYj+1F9r6yoclSbnrrWrnsUokmrMhF1VDUZcvwVQiIMhPnQMJR+IokVX0FeZVURTCvTxYt
	gvS6JgDKH2u80bUpPpsgUipWJXnrgIpbIwpNOTdEOMUqXJUkG/F3QpDksPOftF/biuuOmm9Su2sKS
	kkCzvnGNmeQJ8Iug3U8F7UYmeyp3E1Ux2AwnNeMO3Js78o7PNiQvBBn4fKvyz7VqZAI8T8gBMFweK
	9VMvfvozWnf/wbRgoCgiixdErWpjAhGwTuQ5yc6B+3vs9vBZVrSwLI3d1pzEwZ7K7BzW81g5UUeJl
	DmudzcUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HLd-000000096xc-0gbr;
	Fri, 10 Oct 2025 17:56:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7HLb-000000096xJ-09hi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 17:56:08 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-28c58e009d1so78767465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 10:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760118965; x=1760723765; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+fNeysjSBqXJo83LMvpOWAm6fUtr/rW8XiVtt3RPUw=;
        b=ppg2cTe/vQ7+bHPh4jp+3fIMJ9FsPkfZlBYWhEaYZKuvYEfT4OmxB405hI2i+OECP5
         q9pdqYWS5/lz7XopHCDQeDBKyoJ0Uk3KJVk3I/hOODXnv9TOktvBcV9ErIj2KcM2wqTr
         g20aQhloimNWIMZ71kUpIOft0b2z9Iv4PLvemcX8uD/FkbtG0WaU8+6olinZLOHuoASY
         SccDrwi9UfaJpYb9jNLlaFwGwEcb7Pl+Y9+CZ7qZWWoLhXh64ykaRaEe/62XjRhiGwfT
         bUaOBVB8WgD3u8cJ3z5pZQLkl5Cejd8hPVWAQjYFWznZnkQ8lN3LiyeB7iaJkEeZran+
         hi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760118965; x=1760723765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+fNeysjSBqXJo83LMvpOWAm6fUtr/rW8XiVtt3RPUw=;
        b=QmDuDQVOX4KiO+xEjD/quWKBoYjP5omTbsV+H2IskHe/H9is+J7Xc2BhphNUuC1d0Z
         Msk+kgR94ND6ycMNa8VELBSuItxzKVakpjJAHL9Rd3FfzX7RW+OfIavqG5IWgXAII6Db
         6FEFeDlUU112++vAwPbJ1ygfYajnVwU2q8fztvj7KVTvtKXoKFjFJVTTGyMnWfwebvCx
         Zib+Xm/U4uRQqCx72tPnwTd5G5gvidibsk0otdeBAXkl3pZrdOAqE3I0zi0Lj46OgPgP
         HnWK1WD3LYn3tl129YJPiCBx/l69BUczTgzhBDXXU6o/ZzEsyUiA44C5dytTtiqtOvpZ
         ppag==
X-Gm-Message-State: AOJu0Yz6tHybMHP13mZUBeMlj8nlY9zA/tc7QiRuhRkx+KDLiCykJ4ok
	fuJdcQ4gJE5fsfl+Omua5pUIboLqAYSgnnboha+h9Ac09xmckjYAer77IaekGDbBFn0uFQldL8a
	KVL6W8z2R9ruuFpYdl3c4yr7y4g==
X-Google-Smtp-Source: AGHT+IGjclZ91N97ptCXAmoIKfA3u2zw8eqXw1SihXP/pw9xAZDrc7Put3tnbaSd6Ang0fIk2Ogt4e6D4jCqFIGlKA==
X-Received: from pjbsk7.prod.google.com ([2002:a17:90b:2dc7:b0:339:dc19:ae60])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2a8d:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-290273ffc74mr153940805ad.42.1760118965545;
 Fri, 10 Oct 2025 10:56:05 -0700 (PDT)
Date: Fri, 10 Oct 2025 10:56:04 -0700
In-Reply-To: <46f31ad5-be3b-4945-87d1-c280f76fba76@amd.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <diqz5xcniyhb.fsf@google.com>
 <46f31ad5-be3b-4945-87d1-c280f76fba76@amd.com>
Message-ID: <diqz347qhc97.fsf@google.com>
Subject: Re: [PATCH v12 00/12] KVM: guest_memfd: Add NUMA mempolicy support
From: Ackerley Tng <ackerleytng@google.com>
To: "Garg, Shivank" <shivankg@amd.com>, Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_105607_073237_2C5B7579 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

"Garg, Shivank" <shivankg@amd.com> writes:

> On 10/10/2025 2:28 AM, Ackerley Tng wrote:
>> For future reference, these are the three specific patches:
>> 
>> [1] https://lore.kernel.org/all/20250827175247.83322-4-shivankg@amd.com/
>> [2] https://lore.kernel.org/all/20250827175247.83322-5-shivankg@amd.com/
>> [3] https://lore.kernel.org/all/20250827175247.83322-6-shivankg@amd.com/
>> 
>> Might have missed this, did we discuss how these 3 would get merged? I
>> noticed this patch was withdrawn, not sure what that means: [4]
>> 
>
> Andrew confirmed he's fine with these MM changes going through the KVM tree.
>
>> [4] https://lore.kernel.org/all/20250625000155.62D08C4CEE3@smtp.kernel.org/
>

Thanks Shivank and Andrew!

> Regarding [4]:
> https://lore.kernel.org/linux-mm/aFlHIjLBwn3LQFMC@casper.infradead.org/

