Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 678C7C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSceIq+QW6QfAQSxFrhFP3CSjeVr/8tSdt+enYDxg60=; b=3R0EIHOKz5neh1VghmMnSUyXEh
	cgSyA/48XIv4QY82BviT9WSexhSJDyPOWbBsKB1SM53Q3+aAE1Gg15T4Z+j9W1LGo/7Bj7gCp5yIN
	WKcATrsIJjOMXerBk0BsMQOgy+BvJBqFLLEUl/BQvm+g31V4LkSHxyJZ+5Pft5xYZ22ZTRO+R3TCR
	1y5tqlOQkO+4ZZX9Gder1lsuWjY9Msug8EOod0k5uVCkWM++aIK15m36DfEgYf/54vdq0jGcRdQQR
	oTu+S+dgk/5WL4NhMy8qTmxK+MPEvwckLg9MePDIhwC+aTtrjt+f9iZZdcHTSIg8DB8BoEqLJEjnK
	q7D4Db/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYk-0000000175H-2quy;
	Mon, 10 Feb 2025 19:35:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYmU-00000000zt6-2WUa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:45:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739213117;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KSceIq+QW6QfAQSxFrhFP3CSjeVr/8tSdt+enYDxg60=;
	b=GIicaY4fEgQAVuiLFF09d3plltxHn4mu0K4Jk6i6JSG271yiSe3BzNIeIAY7x63fOBUBOJ
	yM9ELgy2I8wPwrWi5FtQepXRnhVj8Isi4QBC9Qag7Tia3cEpAzZfWFHO8B+mGWvbRA5b+p
	tUcejPhG8hUMxEIGvzcmmZ/4Aj2lUYM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-5V4CHdg5NuO68zNip-X8aw-1; Mon, 10 Feb 2025 13:45:14 -0500
X-MC-Unique: 5V4CHdg5NuO68zNip-X8aw-1
X-Mimecast-MFC-AGG-ID: 5V4CHdg5NuO68zNip-X8aw
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43933bdcce0so15740535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 10:45:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739213113; x=1739817913;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KSceIq+QW6QfAQSxFrhFP3CSjeVr/8tSdt+enYDxg60=;
        b=Ku2wkWbn0DvMM6GgiPflzbZUIJNwRf7HJGWXrgRqDeF1ud2/6U47mRa/1QJEga2ZQC
         cCYDOafY9gqX0Ibkguv1ovzw8sv6un90575/7zxjJimKVfW0sb92ViB0stPZz/CDqhKk
         SQoYOFCNka1xuie144y+juSjHNG+xMUnskgJXG0wrJ7XssOJU6J9XbMttsD59Pxkg4OE
         OREQpIGylrCM+WUQvFzXAmT6DNs2tkeA+BomFjyOYDB7R6ElGFs44AR45xNeBKAVWeXM
         yfdq9O7HXj2U4MmzYrhRNAXhNK7U4/2xx58M8PAtXRB/1XCR4XeDXfujsduvKY9YH8GM
         Flww==
X-Forwarded-Encrypted: i=1; AJvYcCWC91S3UhTHWWk689Jg9B7720BRUuJMLcxfuLPKbahKVEbR5oZOYnOgpbkmhc3o99djIrorU6T6bF0uBCfleVC7@lists.infradead.org
X-Gm-Message-State: AOJu0YxhSHBn8dBhg8+PZaMqtrk/yrRJTjnLWmhfgNWmaL3SKVYw0a4p
	qg2sNn12gjBRk5ldfk9NfDT/kGw5y/W5sdYfH22Ph0gtjI+u1PdnmYqs7BoqfXvCL6QzjzNvZ6J
	zvGM1v5wvLuSy1VlEZifm+rSJrOegIibsxJ0LLN4KiiQ6gz3lTez4Zq8GyTg5iKI/pSCwaNYw
X-Gm-Gg: ASbGncvqoZVyyUVeec/vWJQ1fYvZekEHQ0f9mcYBMyq4PXayjfJWnC8bQWiJdS2YVWO
	prgSU7eWc8IWbiNYFQKSgiBzl/adArnaVLR/hdGbYYdCTw6ahAl7L4k2qHliRwFO3ndq55sJpvx
	jxydif10GDE+5ExdddHqfV2t7wgS9B/n7Zv7UCKhWn85PYHofrZJ1TWeIMg97iKRBbCg44UBDWb
	cq3YfPt5vrXva5I8/ISWesSosmn9LBEpiZktBDiS5T3Wd/f0mSrSsVCoOOBuq93WOvaWpklWd8s
	ZDTk+v02k3f/hv8UT9X+V1epxOXaL8YnWQpxVE8CEL9qUzdXha7ZuM9wnjEd1XXGLJx8PwgxuGV
	o4cLN2GqqgGwn+r5ogZwht7MzMLl3q+E+
X-Received: by 2002:a05:600c:4f89:b0:439:4b9e:45fc with SMTP id 5b1f17b1804b1-4394b9e4883mr19868505e9.4.1739213113271;
        Mon, 10 Feb 2025 10:45:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1DW8uYaNIQGndHHpAaZ/R379l1WaaDggkqsZF2ysLByrh9c9rDZgcYBCPGohQqt0EwrYjTg==
X-Received: by 2002:a05:600c:4f89:b0:439:4b9e:45fc with SMTP id 5b1f17b1804b1-4394b9e4883mr19868135e9.4.1739213112852;
        Mon, 10 Feb 2025 10:45:12 -0800 (PST)
Received: from ?IPV6:2003:cb:c734:b800:12c4:65cd:348a:aee6? (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de. [2003:cb:c734:b800:12c4:65cd:348a:aee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dc9ffd8sm151856745e9.10.2025.02.10.10.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 10:45:11 -0800 (PST)
Message-ID: <afff4368-9401-4943-b802-1b15bdcf5aaa@redhat.com>
Date: Mon, 10 Feb 2025 19:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 16/20] huge_memory: Add vmf_insert_folio_pmd()
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 dan.j.williams@intel.com, linux-mm@kvack.org
Cc: Alison Schofield <alison.schofield@intel.com>, lina@asahilina.net,
 zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
 vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
 bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, catalin.marinas@arm.com,
 will@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ira.weiny@intel.com, willy@infradead.org,
 djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, peterx@redhat.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev
References: <cover.472dfc700f28c65ecad7591096a1dc7878ff6172.1738709036.git-series.apopple@nvidia.com>
 <9f10e88441f3cb26eff6be0c9ef5997844c8c24e.1738709036.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9f10e88441f3cb26eff6be0c9ef5997844c8c24e.1738709036.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fskvv3DPjzfOriYORtLuwQAmOKHPboKzyHUhP9v1gFc_1739213113
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104518_709946_8CA7EB0E 
X-CRM114-Status: GOOD (  16.53  )
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

On 04.02.25 23:48, Alistair Popple wrote:
> Currently DAX folio/page reference counts are managed differently to normal
> pages. To allow these to be managed the same as normal pages introduce
> vmf_insert_folio_pmd. This will map the entire PMD-sized folio and take
> references as it would for a normally mapped page.
> 
> This is distinct from the current mechanism, vmf_insert_pfn_pmd, which
> simply inserts a special devmap PMD entry into the page table without
> holding a reference to the page for the mapping.
> 
> It is not currently useful to implement a more generic vmf_insert_folio()
> which selects the correct behaviour based on folio_order(). This is because
> PTE faults require only a subpage of the folio to be PTE mapped rather than
> the entire folio. It would be possible to add this context somewhere but
> callers already need to handle PTE faults and PMD faults separately so a
> more generic function is not useful.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Nit: patch subject ;)

> 
> ---
> 
> Changes for v7:
> 
>   - Fix bad pgtable handling for PPC64 (Thanks Dan and Dave)

Is it? ;) insert_pfn_pmd() still doesn't consume a "pgtable_t *"

But maybe I am missing something ...

-- 
Cheers,

David / dhildenb


