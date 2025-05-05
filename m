Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2600AC3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/w8rIxU/HB3/tNfk25aUgrHSFDYF6kYQyy+WRkU+kdE=; b=M1HV0KfmfHDp2/lh+M+yYnV9th
	ddg4vN0LauZxiybbZd1FMBZ7qmvX5GwbcZmOO3nC5G1+jIyydq7OAiOWBiSKq8n19fJv+yQLPEzEL
	ULjxrdSgVaRSXl9i33ZrgNjExQmLe73O9LoqpsoiX/a8UaGxOXMAE4gm2iHdJbiKEdGoJhLE1Ny1E
	lRzSwDNFec+SdcyAEA+ixMU2uSlC3R3s0jYvrTf5EGuh1PkWmNQoTZUib1yhyj8v4yuE4L9ge2i1y
	yBlySJ6UdBoLflHCNVzXXQAJoUjj0KPNP6ggMAziDhIBA9i4r+OXlJ6a/sxfkmDGAij9lz/Z+oVRC
	ff9EpoDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwPu-00000007YwS-3M7Z;
	Mon, 05 May 2025 14:03:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBwNv-00000007Ykz-3qDp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 14:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746453690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/w8rIxU/HB3/tNfk25aUgrHSFDYF6kYQyy+WRkU+kdE=;
	b=aV8TT/8bihGGdUCwjlntlAh0OxAxwS7MI24l+HGydY0R5Q8XKugm+dGj/6HbooJJDo+lWf
	x1Nz3Zu4Ida+ytqn5yxYMeGKMJj6nZ6LPfuOUNIH46B86l3273t7VI5EVXHmT/Ubxl48Cz
	rdgZv/ZbZtD8S4YMFpKHmbOejErBv3A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-MbIKxvsIPMO4EnQq85UBgA-1; Mon, 05 May 2025 10:01:27 -0400
X-MC-Unique: MbIKxvsIPMO4EnQq85UBgA-1
X-Mimecast-MFC-AGG-ID: MbIKxvsIPMO4EnQq85UBgA_1746453687
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso21663955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 07:01:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746453686; x=1747058486;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/w8rIxU/HB3/tNfk25aUgrHSFDYF6kYQyy+WRkU+kdE=;
        b=Zcble7lgm4RasfEqUyOXT/uTjpG9THS1BKYAvTVmZDLPwhRk0sK9H6Zp4HAaH8pLQK
         8iIetdxJ6LcDXNNpBa/LnoLwNz5cNLAVMy3TkYF5p5HKcnRhX1PuZDGq7uOU/RuYGqcc
         1VbQN4fqFM3LBH5YIs+Nnpjq6zggVZNLSMbHa+9Bf04JswKAUnObYFVsz0d0kkdXlqul
         6rkYseStSImIn45quEI96Mck83uDSj2FTo2A4dQrOVgpKkVPyM86G1b9WLCGt10rUpxW
         zLv90BLjIAqoT9pcPP8H8IxRrHZtRi3qME3ZKZbAdTJAHBWd0SAq25FKd/X4Zodsa9QL
         ovcw==
X-Forwarded-Encrypted: i=1; AJvYcCXVniUKc6+kYOvMeWA4NTz1m5n8mb131XAb70IVQ+xIsVI9wRN0k8eVGYeDJKHSiUTKWBNfeK7TX/d6CaVL1y73@lists.infradead.org
X-Gm-Message-State: AOJu0YzniU2oWtpX1paFQorytj0HoSS0bhoL0WCQ7ySN/f4eO2gBsitS
	CEwcBOjEux2TrN/0qxliCbrxQD7jy4Pd6tQenimWCj3TKp8/8caNca11L13mlBwnlPAiVBHaVRg
	pZCGJadJEHzkE1zLvqzTY3vGI51vEqyUoe4NbhRD65DPVw/oTsbkcqrJXiav5zGCiVyf/lJJo
X-Gm-Gg: ASbGncvOqm3MVnnVAhZISdldwB2iog76CgST6jm6jpgfkuhpbYAHnDPQ0bm9iy5LKde
	jvMa+AJnriKZ6yoWO+jucNtTS1DiF7uY5y6WKR28EImCPF6sKQbPi0/UgsCkOLECSZjs6Ab3pJl
	k1zSKdMhoZFedpG59xKYkfloY9PFGG+QMCk4nEvi19HrzqktOBC43pC+FZaWtkHj4Yv95395ZtR
	90ihFOoULOExLJGlJ4NvCJ3JqcvDSh4yFiSb+zQlc4ITP0kF4xteuET+0WueCV44o3cQD448aHd
	WalyUxWIEk1PcXIT8c8Pky99y0nHStQN9SCUnPgCiFH9jjc0CsfNWNHEtD0L
X-Received: by 2002:a05:600c:5010:b0:441:bf4e:89c8 with SMTP id 5b1f17b1804b1-441c48b02e1mr70620095e9.3.1746453686430;
        Mon, 05 May 2025 07:01:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7iODw/o625/Nmx32pf7izs/rka/elNifkAdqbkKlAk31dsXlLHLsw9OXTkcQvtHWXeFwG8w==
X-Received: by 2002:a05:600c:5010:b0:441:bf4e:89c8 with SMTP id 5b1f17b1804b1-441c48b02e1mr70619465e9.3.1746453685956;
        Mon, 05 May 2025 07:01:25 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ee39esm133833415e9.21.2025.05.05.07.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:01:25 -0700 (PDT)
Date: Mon, 5 May 2025 16:01:24 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: Oliver Upton <oliver.upton@linux.dev>, Quentin Perret <qperret@google.com>, 
    Fuad Tabba <tabba@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
    Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
    kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: LM regression: fce886a60207 KVM: arm64: Plumb the pKVM MMU in
 KVM
In-Reply-To: <86msbrguka.wl-maz@kernel.org>
Message-ID: <e1117e68-ef05-9de2-d018-685bb7d86bb5@redhat.com>
References: <3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com> <86msbrguka.wl-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hg1TsuzPX2Wz703MUH1ehOdmV7vT6d-upZhMaHPhKbU_1746453687
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_070132_034345_0A484DD8 
X-CRM114-Status: GOOD (  18.19  )
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
> On Mon, 05 May 2025 11:52:00 +0100,
> Sebastian Ott <sebott@redhat.com> wrote:
>> Doing back and forth migrations currently fails on arm after a couple iterations.
>> During the failing migration KVM_RUN exits via guest_abort and returns -ENOMEM.
>> I can reliably reproduce this by migrating between 2 qemu instances on an ampere
>> altra machine. This fails after < 5 iterations. In this case qemu would spit out
>> smth like this (other than that - nothing in the logs):
>>
>> error: kvm run failed Cannot allocate memory
>>  PC=0000aaaae7d48590 X00=0000aaaae80a2e00 X01=0000aaaae7ea2fc0
>> X02=0000000001d3a5d0 X03=0000aaaae7eace8c X04=000000003b9aca00
>> X05=000000000000004a X06=000000000000004a X07=0000000028000000
>> X08=0000000000001d70 X09=0000000000000018 X10=000144b7d0000000
>> X11=00ffffffffffffff X12=000000008378f367 X13=0000aaab1a202d70
>> X14=0000000000000000 X15=0000000000000000 X16=0000ffffa2e2f7a8
>> X17=0000ffffa2541f20 X18=000000000000a000 X19=84bfda6288cf2dd6
>> X20=0000aaab1a1f1ce0 X21=000000007fffffff X22=0000ffffc5431788
>> X23=0000aaab1a17db60 X24=0000ffffc5431770 X25=0000000100000000
>> X26=0000004100000000 X27=0000000000000001 X28=0000aaab1a1f1c20
>> X29=0000ffffc54316d0 X30=0000aaaae7f8cd24  SP=0000ffffc5431650
>> PSTATE=20001000 --C- EL0t
>>
>> Guest and host are otherwise idle, kvm is in normal VHE mode.
>>
>> Git bisect points to (fce886a60207 "KVM: arm64: Plumb the pKVM MMU in KVM")
>> I also double checked that by reverting this commit on top of 6.14.
>
> Thanks for find the triggering commit. Can you further identify *what*
> causes the -ENOMEM? The only new -ENOMEM in that patch is the one
> added to topup_hyp_memcache(), which shouldn't be called.

The kvm_pgtable_stage2_map() call in user_mem_abort() returns -ENOMEM
because the memcache pointer was not initialized!

It looks like smth like this without other conditions could do the trick:

if (!is_protected_kvm_enabled())
 	memcache = &vcpu->arch.mmu_page_cache;
else
 	memcache = &vcpu->arch.pkvm_memcache;

(I'll try this now)

> Also, a failure to allocate would leave some nastygram in the kernel
> log, so it is unlikely to be an actual failure to allocate.
>
> Is it the first KVM_RUN that fails after migration?

Nope, it happens on the side that triggers the migration.

Sebastian


