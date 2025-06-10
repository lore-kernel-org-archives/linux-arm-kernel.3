Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AE0C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O56+Bk5TTeN4jh9BZRlx3XR/3UjST+pbt1ppyD+2/rA=; b=1axcpowdN8ioH9GpFnyJ9B2Kae
	vang/0GP5oWyfJ6ak2FXvgHvUNg9kl2VgUrCv1lEpvfIfsztlCN1wvRYMTL/r5CeP7bIwB57vNC4r
	4v9sJikBGJx79u7Rq04Si6AZdZjnM+UOFeG4NOgANRvDsYAcfwHLHaIJX0BPOvv6J70xv66EayY/P
	KtQOk3crfvMcfB4qmWmTvaDJyxbA5i9MnNt7rqXfHt/eElwc7u8SAdQbja36ojAz7KMqbJkkQdx6f
	P9nAmjo7Cus2ZNpG6f5PDd7vDOl3PVCXxnKRPjz8AJm9wrNEVIeztFPMfknsbNe1Ic+PJlocgLFO9
	HauD34ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1UD-00000007Q0i-1s4z;
	Tue, 10 Jun 2025 16:06:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyxj-00000006xBU-2fmE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749561862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=O56+Bk5TTeN4jh9BZRlx3XR/3UjST+pbt1ppyD+2/rA=;
	b=ajDYflRNpc7VY4e3I3Ie/dtFkvWnMTPALSG2rLZIDzvjKbDKVw5k/1QpLW2O6hHvqCbjJv
	ZHvyGFjJYuD6IHisJtoignRWsb6FUZFZDKQRpaDTadypst2ooburA4ZXCjRc7yDv/D6ryp
	FQHIDkqYGUX8ULXV2qORBIiQmqy0XzI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-dm9DSyfEOO6Mtr8OeihoQQ-1; Tue, 10 Jun 2025 09:24:19 -0400
X-MC-Unique: dm9DSyfEOO6Mtr8OeihoQQ-1
X-Mimecast-MFC-AGG-ID: dm9DSyfEOO6Mtr8OeihoQQ_1749561858
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso29774395e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561858; x=1750166658;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O56+Bk5TTeN4jh9BZRlx3XR/3UjST+pbt1ppyD+2/rA=;
        b=WxiyD3z6ya4fam7pJCub8qRhukVslN03GL06DerfYruuHpoxwhJul12WfN4wUJerCr
         aK3GCvcHQRBwk6nWqsx1uds9233BydsyJDylTtuN4ISiiASOa5qIY3TWSDrAacTUJwmg
         cXJTu1t6gntb3LLBwK41syh7BaHcN5p+Kaiix9aNkPVj/+0i/ISVRxYa66zl5asgLiXH
         axLLXhglXvTMskoXMHbhYw017pGapANpfrQ4LezESYGDEus5Xtqv+RjIED0qTNFTIHEq
         nVFXqkQVcA/EHU/9hE5Ods/SiEpqvpU05+9irx+ZhyBUbVlU5HTbUQc46t+GSUim/e+H
         21WA==
X-Forwarded-Encrypted: i=1; AJvYcCVJyJvaq6lCobelDs8wB/cGQulL4h0eZvCWQZNJEDZrqyMHXEj9h0NGVKEqt0PO7GW7pRbkXW+UeLMoMuophNdb@lists.infradead.org
X-Gm-Message-State: AOJu0YxaLOFpFv68vXFAqD1JN1aTlF1P1gA9P3UX8O0UJO2iByCVNlAB
	hecdQMP3OYQAJPSleOJDq6cRL5Hq/KwZBBZKJmAAFYFPYZAWNBjrWb+PTY5HQUi9eWh3jdH8+EF
	TUvX4YQhpSlQHTwPy30HVca0Zc0D6C2M2uT4puF6L7FNSz82TqyffmHS4ICOUprO1WAMljmwH6E
	SB
X-Gm-Gg: ASbGncsGWj0bXbDgSkHeIvTZVeoplhrnrgVKM2E7/W0mELQr6E29jJFWj1NdKlQ+ovt
	u3MNgaAvizBgCCjl1HaFfVRWYmhQ8x7WaSBazF2zYhl1kAcfbl5/PDZZCBx1GaNOacEeSOZ0haL
	HNcKmN8wXtm+BKdFZNyKVbK5Eht35nCJrBjUTr0Id1xFcG0xRnkSIeRQ6pTS9oY3KosyRhWRafk
	GK+s02GR/unObg1EC+3GFzPmCAybnwnkT8CrNbWbt3h/YQBNAxfneZIZrXFlS9j4b9fp7Gtnz+B
	5r5PZsUzNDWDsq4YS3tC5zNlGL3NWaUIGBYOV/+zmb/pJIbE1cBQe+k=
X-Received: by 2002:a05:6000:26c9:b0:3a4:d038:cb9b with SMTP id ffacd0b85a97d-3a5513ed8d4mr3093469f8f.7.1749561858182;
        Tue, 10 Jun 2025 06:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIjG8T8Ag3R7QOLa5ItFg/2QHHk64OEOfrvBwlSgh1cnBAwjRxZQ7gmQotkGG7aevOtcg6rQ==
X-Received: by 2002:a05:6000:26c9:b0:3a4:d038:cb9b with SMTP id ffacd0b85a97d-3a5513ed8d4mr3093434f8f.7.1749561857709;
        Tue, 10 Jun 2025 06:24:17 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm12244725f8f.74.2025.06.10.06.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:24:17 -0700 (PDT)
Message-ID: <970e1b84-7f47-4a51-ad99-4df9026b8f7d@redhat.com>
Date: Tue, 10 Jun 2025 15:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mm: Allow lockless kernel pagetable walking
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 suzuki.poulose@arm.com, steven.price@arm.com, gshan@redhat.com,
 linux-arm-kernel@lists.infradead.org, yang@os.amperecomputing.com,
 ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250610114401.7097-1-dev.jain@arm.com>
 <20250610114401.7097-2-dev.jain@arm.com>
 <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <db04bd02-0090-4aff-bb2e-0d1e023757a5@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IN4JdjldqXTwnwTS8xzy-Wmj6HuJdRZtku4h4jPPntE_1749561858
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_062423_753729_78ADBE10 
X-CRM114-Status: GOOD (  12.48  )
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

On 10.06.25 14:07, Lorenzo Stoakes wrote:
> OK so I think the best solution here is to just update check_ops_valid(), which
> was kind of sucky anyway (we check everywhere but walk_page_range_mm() to
> enforce the install pte thing).
> 
> Let's do something like:
> 
> #define OPS_MAY_INSTALL_PTE	(1<<0)
> #define OPS_MAY_AVOID_LOCK	(1<<1)
> 
> and update check_ops_valid() to take a flags or maybe 'capabilities' field.
> 
> Then check based on this e.g.:
> 
> if (ops->install_pte && !(capabilities & OPS_MAY_INSTALL_PTE))
> 	return false;
> 
> if (ops->walk_lock == PGWALK_NOLOCK && !(capabilities & OPS_MAY_AVOID_LOCK))
> 	return false;
> 

Hm. I mean, we really only want to allow this lockless check for 
walk_kernel_page_table_range(), right?

Having a walk_kernel_page_table_range_lockeless() might (or might not) 
be better, to really only special-case this specific path.

So, I am wondering if we should further start splitting the 
kernel-page-table walker up from the mm walker, at least on the "entry" 
function for now.

-- 
Cheers,

David / dhildenb


