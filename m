Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A9E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3R7ega60i2XI0ngndIHudoIs2LUtdofitS/MXH9C7I=; b=MA5JzXns+sOR5wuscbbkA2azi8
	2XdFuzpyLdx6ewupkfY8Au2MdXLgFkcZFfux7kfqQY2QZiwurAguEOSeltxsYfo21QRIjtQ0kjWl5
	ZnYOy3LaLZMecdq0M5LpJZNK1s2CTj0b5KGtu5McYW8vRB58EbFf08EO7ufZldrrrfw1gOrrI9hcd
	I6Q2kIMdYIcC/GH2tqtuZ3nWTSlfIZV8xlPSzMEzI7X5Pbc8/lUwr2EjIDOUX6USvb8NsPtlPUx45
	CFVcu9frf60eZbeZEo75F1QxD3dOPNOgc5Wf/BxGs2Swmm0XmB3kzYS0AghjCy7AZM8XfHyKLTQSn
	/eWxAc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKPh-00000005Eg0-0s0a;
	Mon, 13 Jan 2025 13:23:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXKNQ-00000005EJi-2lE1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 13:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736774467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=A3R7ega60i2XI0ngndIHudoIs2LUtdofitS/MXH9C7I=;
	b=XlRuU5p17u8esuz3j83DsOXR8EbyZlo1z2o+c5wlYA0I19vWyn4m0x4hWmJLBXKEeapyRC
	eTBHb10jb8XLMNqbIWnl6rxTIvd0BPupYulxsxr1hhaSPElCiM//VvJ4yPuTM6zN2+cFfQ
	+O8l6tj0i4xbBjZsVDtzx1CwA46yrwU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-Ra5KuG_9PF-bTpo8jz-ydg-1; Mon, 13 Jan 2025 08:21:04 -0500
X-MC-Unique: Ra5KuG_9PF-bTpo8jz-ydg-1
X-Mimecast-MFC-AGG-ID: Ra5KuG_9PF-bTpo8jz-ydg
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43624b08181so20937485e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 05:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774463; x=1737379263;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A3R7ega60i2XI0ngndIHudoIs2LUtdofitS/MXH9C7I=;
        b=d0J07hKGySigQRbNBf53YMsc8BTAYP8idstUgh2uN0OHdzxl+nvXwLPtBSofNRWQDI
         xopJTjNuJ4Z6AIPMWfU32bdyfrep6kvEqQf5HSnl/0mHnDhntyi6dYcI2XPIMRvAVShd
         +kZL7g0k7wWvfFdDwRXw40snlOfB9YsMUmlgCZH8zJAgSZCV42udvWZnaL6eghqvXeRE
         qU7OotPzizIHjVgvlCvSOEwV0lmazSuc7kwPU2IP24xYICpkeCrAB62h8pdkdPLxDBot
         vC4+yRyGeAhyD1brg6XtcmdlVKZGIlF0VwrToZQbLG1PXZB9TfqncQSke+RXQzGkotp4
         DW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzcoWghvFKu+EV20f3cWqVdoLecOwa9U0Z8wNNFF/cXuKcpQssYvIHGTrTRd29lcverHO15RhAA+KKGGhSp3jY@lists.infradead.org
X-Gm-Message-State: AOJu0YxgOHX9D7Att0MOEwp2AsXvVmr/+X0oE8gX6y6+mYEyKVf0/801
	ILmKKQ9Sx1BA8YcWCH7F/AEF3Q0tNZjICThoEZq6hKzuBh4lLfxwJ3KknmtWJhMcCrpejC2IcVu
	mi/3NCX3JfbD6TLJAajt1yLu6jEeCwqK0jY8LmszBV0wwqhf35RQ50dOxoUq4RCHl+AjB74AP
X-Gm-Gg: ASbGnctko97mIPECl0xQcOJnSedfq1ABk8w7xfZYMCAh3rbw9tKGrzDaews9g0pqxns
	vHNgSiCIS0OZ8bkubsyBExy/OI/cSInF5/rt0720YvzgWLXOeUrGJtsQpCxrl5Q1/he0voMUr9F
	KX/1VcOTv7aloFJzZSFEJuErHfXH679p62E8rohyf0V/87gIm49rnGYHmzqrnphrwWNmOMdjKTW
	uBSrPyjKsu/4tUn45JAMfD9IMp5JBSaku4q5hVVZwgjgmv46m46Gkouu1QeCa2oDbnLgjWrDdIJ
	3RPPQeBEWEOXgeA=
X-Received: by 2002:a05:600c:5918:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-436e881e681mr125927745e9.6.1736774463348;
        Mon, 13 Jan 2025 05:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGKcgi8IHOeELIAQ3P3feBXZIx+FPb9LcEzOeJE3vptCqKAaI/6YDc2O3yD/xkGQL19Z3ey2w==
X-Received: by 2002:a05:600c:5918:b0:436:185f:dfae with SMTP id 5b1f17b1804b1-436e881e681mr125927535e9.6.1736774462981;
        Mon, 13 Jan 2025 05:21:02 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6251asm147879855e9.40.2025.01.13.05.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 05:21:01 -0800 (PST)
Message-ID: <e36243bb-5a6f-4ef7-ae3e-99d204009afb@redhat.com>
Date: Mon, 13 Jan 2025 14:20:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: Set folio swapbacked iff folios are dirty in
 try_to_unmap_one
From: David Hildenbrand <david@redhat.com>
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com, chrisl@kernel.org, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, linux-riscv@lists.infradead.org, ying.huang@intel.com,
 zhengtangquan@oppo.com, lorenzo.stoakes@oracle.com
References: <20250113033901.68951-1-21cnbao@gmail.com>
 <20250113033901.68951-2-21cnbao@gmail.com>
 <296b04db-9524-48f1-9fa1-0b028bc939a6@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <296b04db-9524-48f1-9fa1-0b028bc939a6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1c9uNqmglGaWqEBAIUsNO0OiuB3w7vclzv8xY3gs4h0_1736774463
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_052108_764896_B88083EC 
X-CRM114-Status: GOOD (  10.76  )
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

On 13.01.25 14:19, David Hildenbrand wrote:
> On 13.01.25 04:38, Barry Song wrote:
>> From: Barry Song <v-songbaohua@oppo.com>
>>
>> The refcount may be temporarily or long-term increased, but this does
>> not change the fundamental nature of the folio already being lazy-
>> freed. Therefore, we only reset 'swapbacked' when we are certain the
>> folio is dirty and not droppable.
>>
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>> ---
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 

Ah, should this have a Fixes: ?

Because of a speculative reference, we might not reclaim MADV_FREE 
folios as we silently mark them as swapbacked again, which sounds fairly 
wrong.

-- 
Cheers,

David / dhildenb


