Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D97ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 12:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=; b=WPTdkg0B3MqU0Lh2ikvksdPqSJ
	ctftbgMdhjK0StXi3OwPITVEv8pW2wgTxJ7JJqgtHxLl2/gm5CDRgnWneDqHK9RODGJUiEj/NHd+b
	FIaq3pn4nLyygM+tMsOzmi+tPwfGTpun2zifBzt7Xv+Rqfxw89tLW/22DnmnuKW7gzXAAgqoRPRVC
	p60SMAhZWqgRJSiIwdbGRvMQCMQ2yeW2WuJ4Yqn7STVZfmaXm4KbggPduG4n7awCr1XtTALF79AS2
	ZkCr622HZcdcMxTh9PGYmPQJm/RBljyMWwVk0iNTaHnILBYEdl6Eu7zLvuvXdQr7f1/uRAsA7rBdL
	K69feJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvx1k-00000006vPK-1B1Z;
	Tue, 09 Sep 2025 12:00:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvuY5-00000005vSM-1nCK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 09:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757409720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=;
	b=eSPQdM1Vv90+jyLGYGKQBidvEXu5T7MOWgA1GT2RCf4E/33n7gCl0HggWTxwbIE37S/4Ah
	igJi6X2+REFVkpHBgXMp5YnkXuE8oNtVQ5bWoF4dyrbhFPLe0wbGJX+SAA2zr5z8p/eUzZ
	HOwJN9V1ezpyywaKCLGQukI66Ty6QaM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-RfjyWbzsNiiqSOcyxiv5wQ-1; Tue, 09 Sep 2025 05:21:58 -0400
X-MC-Unique: RfjyWbzsNiiqSOcyxiv5wQ-1
X-Mimecast-MFC-AGG-ID: RfjyWbzsNiiqSOcyxiv5wQ_1757409718
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3df07c967e9so3327341f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 02:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409717; x=1758014517;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yZ7mpSu7Vyx7D7KzsRAEX4kah9GPWTLG09gnV5krCYA=;
        b=XGkX5sPz8FfH9WPjy3dIRP2onOjwougCsyvosU8lUI+ZDi1267q86Ro1Av1y9w5L6w
         AD50wv/XSQxLuYo6Aw9vjdqalOZOv/0trwh5ehEWLn5jCzCffKk0lGRxrp/XBlfKre62
         LqB83HsRCuJnHvp/uwYjIAqJZw+ARy3lixnJwh8wYw3y2IGwzQrBbEf5T2BM3cGrityM
         vDmauq7bRHsfRzfT0HjBJsOZ4LdPmRP0tN51T08h9HqNBE/qyhFrUQwZzfkKGeQgRB8/
         j98/Wr4V242/nyFv2kcp+A46BB7Z6P14h7NL5SmGGB8gHNnubx9KRxnWscBhBYm730kb
         bjcg==
X-Forwarded-Encrypted: i=1; AJvYcCUAWnauXwu7gUw8aq4djqwlhNe72dFVxg8rT4LW8aSVnpEGLw1Z7LhnurcF/dUv7McMtV8C/15zfqNLhE3oVmMD@lists.infradead.org
X-Gm-Message-State: AOJu0YzpmJxh3ptPNHEaoYTxGBKFLdtCIsQq0Prtcamp0yGR5RlwerWP
	jBNmSBVfxEH3hOYhyjX3wP8FZJI5PVlx3HrpP0y32DQSwf0Dzo+P8GwSc2AOrtci52T66tXDcmx
	Tx28jd1RSRmYhP4rN/gUS31qbBOmbMk8jjEh700WmS/BQMKH93lnDvo061LMMNDw0F6+WlKCNAe
	LJ
X-Gm-Gg: ASbGnctgPajLF/tkal3MHFngYU0hVeetZVjhATBEgGAn8OcsijgI25SML2V5B5KSj9s
	/GdGI6Lk+/ghJvnj7kVPo4adxNs7a4Ore3FU2dyWPjZMylcXoL376jvzZpNAy3fVDLzzW8BM83T
	qH5RgakARVLsjzl5qSd/saOkTDwcYzJtj78jjagQUlXtxhzvC5JnBo6YoGCiTwZkBgwPPfhrCbj
	Pl4X2bxc80YgMH8yScqmi5iiXB1rb5ApA1YQ+2mdFmsX4aVVvHVIyo6P8peqSBfvhFY6IYWemHX
	CmrVnK33CzH/f5CAvTVE8HO0uYitUMagiufXbG96WQ71amyWftT2U1fS5Ls+kbwNz2N/ZqimNOC
	FlhP+226ifDta6OOsQMHgVa0ee8Go1JUq2Njnqr/5N+4Z7kJ+AqDNeS9NvQE4SQCEIfw=
X-Received: by 2002:a05:6000:d0e:b0:3e7:4fb7:4e9 with SMTP id ffacd0b85a97d-3e74fb7050cmr2433463f8f.47.1757409717598;
        Tue, 09 Sep 2025 02:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHaiuV2XNAb2KzSftztUT7DW61EOo5r3IILYTR3cBriEgdDR9uMZbXOjouMq5dEBDNTmzUKg==
X-Received: by 2002:a05:6000:d0e:b0:3e7:4fb7:4e9 with SMTP id ffacd0b85a97d-3e74fb7050cmr2433419f8f.47.1757409717177;
        Tue, 09 Sep 2025 02:21:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm303120095e9.12.2025.09.09.02.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 02:21:56 -0700 (PDT)
Message-ID: <d1b4ff2a-052f-4556-91ae-273962edbed0@redhat.com>
Date: Tue, 9 Sep 2025 11:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: Andrew Morton <akpm@linux-foundation.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250908191602.61160a7990b9ea418de758c7@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PDk4UtqepJSYJXOzFz6B5MZS3b8ZBhjt_izUTzi5J18_1757409718
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_022201_598483_92BC514C 
X-CRM114-Status: GOOD (  14.66  )
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

On 09.09.25 04:16, Andrew Morton wrote:
> On Mon,  8 Sep 2025 08:39:24 +0100 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
> 
>> The main change enabling nesting is patch 2, following the approach
>> suggested by Catalin Marinas [4]: have enter() return some state and
>> the matching leave() take that state.
> 
> This is so totally the correct way.  Thanks.

Staring at this, I wonder if we could alternatively handle it like 
pagefault_disable()/pagefault_enable(), having something like 
current->lazy_mmu_enabled.

We wouldn't have to worry about preemption in that case I guess (unless 
the arch has special requirements).

Not sure if that was already discussed, just a thought.

-- 
Cheers

David / dhildenb


