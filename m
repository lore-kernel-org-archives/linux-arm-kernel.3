Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2B1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=; b=HAoG2gBbHGMHCdpUD6GlzN6Y7n
	5tlbcfXgXV44qcDVLDQWsQIMQZWtaXkrajR0NPcrgFdHiuLnQwNvaRUAAJ3gOaho/rycng69WYdbc
	+Ox9wJ0ef84lK+AVD2ils8NgB3qpsSvz/d+BGBxlrEZy1I1ftI2H4JRRC2lL17uI3ZtGKG9WvoxZW
	07Rf1LHnJv6H4+hsJppl4Dpa1vd5xw+TImvqGs6Tt19seWUTgShGjhLL2ufmMqjUvCXAnZaenRi9l
	3FWu3pih4kztF5I79RlwdmhfKPF6Okd5BT6jYJwed8EGwfVLGNPSYO++awDqdKG+vBoyfrno1qMFw
	IohQUj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1eE-00000007VA6-2MIm;
	Thu, 23 Oct 2025 20:10:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1eB-00000007V94-3cME
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 20:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=; b=ahQ+GK/jR88lABgivh3dqu+0Or
	NjRAPAojxaSls8UravP+1oiGgmr2uY0LD88OSevp6z2sZpYnQ1M7fDr2bwNhjpfvXEdsBx26fJs+8
	XUCLZv8RLQupEKbU8nhm/0UzT2y+aKgv0i2UK6UX0pLDboid4tNnunaMtrI35VGgzmigwtCK+3Jbn
	vW76VCxUphwR7LOPRXIx3tR/s2M9Zo3VmEqh9TBQjqw5irI7QL6qU8Mz1JVZ2zrLsCXkRSCJXXUXj
	cw118dXS39OuLVkJDczVkh21iIKkEwjgE7HScTkMc09g6SwjfLvrdv49cWj67HFjPKc+wYRXoT0Y6
	GbIBq5xw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0mP-00000001heg-3WxU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
	b=h/LiE1VLs76LoKbFzr32dVFOaHAicbQTFrMx7VjHQvFzjSLnZZlN3mCT7kVMnKE+2Ji+6Q
	Zk8ofKlt4iffiKUoeL8WbmY5j9rEe1mqHBeG5regsDPXCfT/Rs14xBgZMTCK7Ihlc7xOPE
	E92aNOSvYX1DuHMegPx3Es8RSpikEQY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
	b=h/LiE1VLs76LoKbFzr32dVFOaHAicbQTFrMx7VjHQvFzjSLnZZlN3mCT7kVMnKE+2Ji+6Q
	Zk8ofKlt4iffiKUoeL8WbmY5j9rEe1mqHBeG5regsDPXCfT/Rs14xBgZMTCK7Ihlc7xOPE
	E92aNOSvYX1DuHMegPx3Es8RSpikEQY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-6pfSVT-KPBm-mmc94MF6Ug-1; Thu, 23 Oct 2025 16:10:44 -0400
X-MC-Unique: 6pfSVT-KPBm-mmc94MF6Ug-1
X-Mimecast-MFC-AGG-ID: 6pfSVT-KPBm-mmc94MF6Ug_1761250243
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4256fae4b46so770851f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 13:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250243; x=1761855043;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
        b=ObvGyH2zmaA/k73OBdu4qB7Ai26W0SqeC2c4A4ponTaMAjqZqaDhpauCrJFYiI9VWs
         CgHJW1PiEY7rt+1H5eumWmJptYW/yum5YAiKO/jDOZFXD02omvKmLVpsWDLo+rI6hd//
         9I0ibvM8re8jPJBN94Ms6R/AyL7efwD8RW1Wvd3zRYlzxsCnRhNgf36SlFO9WyG2IC8C
         3PhUlzRzHSD7cJV1aB8Fnt2nvvx8HaQmixOrVC/bIXvKlTsJIe/xi+6eA3C+R46D2rBm
         +CM3CDUy1NZxLjSh1sisX3kkQn+c0dHQHycCQiwHHl2Em/81QM0pMMqfu+BlJG185yIO
         gJcg==
X-Forwarded-Encrypted: i=1; AJvYcCXVvCsaZUtJpfUND2t+SjW149Cj4uAXDc1Vs960f1yGgOXHGRW/35ZPiC2JkFpJ7YwgMyiqOYEpLlOU0khoi13K@lists.infradead.org
X-Gm-Message-State: AOJu0YwHpxTa2AeRgNQ4FdsU7QcokFmKPqfBBV4xRrUH/KpdzGek7Si6
	0zTbVcYU16xkVsrcIrfVrjREX4ecPrOOTqMuDMdieG1/7boNMdWhjpq8DfWQCHBaXI3ey3uTioJ
	+2u9aDS2eIaMBt/J3gCWrzYBqDtWqtIbd4SwrXMvWvgjO6bw21CNQrV2V0GqVS2/pC72nNWCwHS
	Pv
X-Gm-Gg: ASbGncvMA4SNHfG3xUugeT+7qtezuhPXFq6KYY0jIs74rBvx3J7a32u13Tqq6BSptCU
	e1Ki58Y8b6YMNi4OVHEH6D1CUTqd+Fw/+IZ6jxrJvTaep45R3q20eEL/i5OXmlQnYP2GRJrPM9i
	psNjPV21XDZI873ob3cBl+zC9CTDdChxJCfdvBoybXXUY+0IIHI+fdiwc1IV9k6v4IVLrOct6aL
	8nszW520PyFGtGW024987YRL5yR5UZbHAi1XVoV6OSj4uIdMmUVyf4NuYdlvNcJ5TSAelKmlJTo
	KM025C0cnWA6RaoG8jzFBE/Y4SW2457KE6RKa/ZDTcnhYzSzagdc416Wj1G4T0ivGr0rKw64KWK
	2eYZMU/zQ9BANjc/Zt3yCMD3qBwJF69g4kHBXeQ+KE+031Z67nyZM94/6vb75VSIzJBG7rC/hn5
	NSYe1TKDg+yFuYOdgnisTiGN2rpto=
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr200628605e9.9.1761250243304;
        Thu, 23 Oct 2025 13:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEznsO/mZG7bXXGeVpf9lUsRK7DtoSEnI7rqyr8WVIAgGuBjLQ7Sb3p9c9Pj2m7/SEml5RHBQ==
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr200628295e9.9.1761250242917;
        Thu, 23 Oct 2025 13:10:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898cceebsm5532934f8f.37.2025.10.23.13.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:10:42 -0700 (PDT)
Message-ID: <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Date: Thu, 23 Oct 2025 22:10:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-14-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-14-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9PGCphcxZsEPUmTJKiWGYiXMM-n28RhL5uLlXfuZQQc_1761250243
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_201526_393774_6F64D16E 
X-CRM114-Status: GOOD (  12.92  )
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

On 15.10.25 10:27, Kevin Brodsky wrote:
> powerpc decides at runtime whether the lazy MMU mode should be used.
> 
> To avoid the overhead associated with managing
> task_struct::lazy_mmu_state if the mode isn't used, introduce
> arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
> returns false. Add a default definition returning true, and an
> appropriate implementation for powerpc.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> This patch seemed like a good idea to start with, but now I'm not so
> sure that the churn added to the generic layer is worth it.

Exactly my thoughts :)

I think we need evidence that this is really worth it for optimizing out 
basically a counter update on powerpc.

-- 
Cheers

David / dhildenb


