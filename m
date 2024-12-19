Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4397CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 12:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c8saus9YLZhVfJ1KTMCJAG76jnz4bfOn7VY82l2UQo=; b=bBYVRCa4d1h5mI2FSv2hBxbBp2
	Flczz3j+sro3Wvrandjnknn/d8U6QJWP4C+JVAdnG+4FykiTBF6dj69kDmL5T7q8SziaFeutvwTnr
	/eBKAat+Sf7ZFGshbeuqPFnVYsPC8OsZTP30lQJ7qwDYR+GsQVuI4cqEAWzTU9FIJ+/VtpcNSyNyZ
	YBZ20xX/EGhratLbJ8+z+wQSpU9YXkaAc9jcvCr/PaB3eiJgZ4adqXu7z2xrW1ia7IrRQkoZd85LK
	Mx1HNkcBgxEyRQ2/ocXSnlUXxjreizLE7u6VFqJfWB8HbKeG9iiADfSSX7XpjOsXc1bJh6e5wxOCb
	vtan0ZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG1R-00000001sMv-3EFC;
	Thu, 19 Dec 2024 12:52:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOG0I-00000001s8A-2h7e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 12:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734612704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7c8saus9YLZhVfJ1KTMCJAG76jnz4bfOn7VY82l2UQo=;
	b=PWcgpOzODnA0Mls8EY5SkxTq+iKUxmTaG9q2Bfj6zKyQkwTXm1kLw4wBiVswoBPt+TyjCm
	nE5JE8syPkkL/FKj4ddwxGFEhiIolZBf2jJnm9Elj4xFeD9iNM8y3aQMFWIh1+HuiEWm/g
	5BoQc3xfGRGt8jvV956Swuuse8vaf3A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-cDWVdiaDO_GHU1d-TM6zsA-1; Thu, 19 Dec 2024 07:51:43 -0500
X-MC-Unique: cDWVdiaDO_GHU1d-TM6zsA-1
X-Mimecast-MFC-AGG-ID: cDWVdiaDO_GHU1d-TM6zsA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4362b9c15d8so4484945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 04:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734612702; x=1735217502;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7c8saus9YLZhVfJ1KTMCJAG76jnz4bfOn7VY82l2UQo=;
        b=qPmRQpuT9vLKoUiLtCWZ/O9kyXR/cDs5IF0NuC90W1QadwHvKZ35iFBN3FsVzveMXY
         ChJqG3WHhV7xNwGsprNA7y5UUX9FHeE8wv298m7QS0RiMEm7LBWZqpkHvOxJOtqbcw1C
         mj5dgyYji3VT+ROnAs9O/xTm3i1owtnr0ejQariGKZx5J0LQkmF0yh8MXCJ9W4luNFmu
         nPculT3vIqNjNmrkgB15pF5oroPHt4wDm417EaGFUWRrIHdYkd7dW1zttbgJjJrFa0dQ
         e2Oveu4jL/4RoctgNNAyFQQ/dxgdMUx/xScOg1LJZkzDTiOFlFhFEDudUuvsSsGYmcmA
         nPvg==
X-Gm-Message-State: AOJu0YwpCEFnVowyw4xdBOdFw591W+l+fpqrCtCl6Xx48GLwSvr+3+12
	FqxbGgUQJHgpLYO70rmQudqTXxOZwkoSP81njm51+tK9GO9141M4VYtrd4vhorHL6/V8LIiwtgp
	NYUo28DeEoFHp658IU5IGOvyI8xQwBB6fd6sME1fWKK577UC0oI6l9lcVWLUk7NBvP26iac8A
X-Gm-Gg: ASbGncsVD/sZxXh3dEkMC+8oc5X31Rq+WimCfG4Nur/SAzA3a5ziTVzH6IM7RpKbT6I
	y6YBjJd0rsZLoV/8/55OHl2IGfNKbTsTnsCV32GZA8BhY1dSmklnSP5yFOVdaCZeEjCHNdjzyrg
	NA9O026Ol9/UT8uXjpcOek4obDfauCfBiBYmJ2QSSxbR5I+Kk+4ZfHkJgi3hliKNEyugqC7bKY9
	QGUiBmefw6w/J9LEdIrKLdyCOIB+CPNWpey9i0x4hcYVrYLJVPpOi5et8DH
X-Received: by 2002:a05:600c:1c95:b0:434:f917:2b11 with SMTP id 5b1f17b1804b1-4365c7d05a7mr26149695e9.21.1734612701682;
        Thu, 19 Dec 2024 04:51:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGi6kT1YUYVhMLCGFvM9zRpWd8/VGVfy+jl/VcBcc+w951wALdRk+vWkS9XaX3I8AkE4IXmYA==
X-Received: by 2002:a05:600c:1c95:b0:434:f917:2b11 with SMTP id 5b1f17b1804b1-4365c7d05a7mr26149385e9.21.1734612701311;
        Thu, 19 Dec 2024 04:51:41 -0800 (PST)
Received: from [192.168.10.27] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611ea40csm17411745e9.1.2024.12.19.04.51.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 04:51:40 -0800 (PST)
Message-ID: <6887b48c-b1ef-418b-90e7-fa95fedc71f2@redhat.com>
Date: Thu, 19 Dec 2024 13:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/16] KVM: selftests: "tree" wide overhauls
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Jones <ajones@ventanamicro.com>,
 James Houghton <jthoughton@google.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>
References: <20241128005547.4077116-1-seanjc@google.com>
 <173455833964.3185228.5614329030867008316.b4-ty@google.com>
 <Z2NIwmRDaZBc_V4o@google.com> <Z2N-UlxgYlGT_1Or@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <Z2N-UlxgYlGT_1Or@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qIAMbE7zSx61UVFTERncyET9XLVR-oLYWZK0A-HQwXQ_1734612702
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_045146_743242_6B0ACEC6 
X-CRM114-Status: UNSURE (   9.94  )
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

On 12/19/24 03:00, Sean Christopherson wrote:
> On Wed, Dec 18, 2024, Sean Christopherson wrote:
>> On Wed, Dec 18, 2024, Sean Christopherson wrote:
>>> On Wed, 27 Nov 2024 16:55:31 -0800, Sean Christopherson wrote:
>>>> Two separate series (mmu_stress_test[1] and $ARCH[2]), posted as one to
>>>> avoid unpleasant conflicts, and because I hope to land both in kvm/next
>>>> shortly after 6.12-rc1 since they impact all of KVM selftests.
>>>>
>>>> mmu_stress_test
>>>> ---------------
>>>> Convert the max_guest_memory_test into a more generic mmu_stress_test.
>>>> The basic gist of the "conversion" is to have the test do mprotect() on
>>>> guest memory while vCPUs are accessing said memory, e.g. to verify KVM
>>>> and mmu_notifiers are working as intended.
>>>>
>>>> [...]
>>>
>>> As I am running out of time before I disappear for two weeks, applied to:
>>>
>>>     https://github.com/kvm-x86/linux.git selftests_arch
>>>
>>> Other KVM maintainers, that branch is officially immutable.  I also pushed a tag,
>>> kvm-selftests-arch-6.14, just in case I pull a stupid and manage to clobber the
>>> branch.  My apologies if this causes pain.  AFAICT, there aren't any queued or
>>> in-flight patches that git's rename magic can't automatically handle, so hopefully
>>> this ends up being pain-free.
>>>
>>> Paolo, here's a pull request if you want to pull this into kvm/next long before
>>> the 6.14 merge window.  Diff stats at the very bottom (hilariously long).
Pulled, thanks.

Paolo


