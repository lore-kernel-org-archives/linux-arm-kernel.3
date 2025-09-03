Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EE4CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 23:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=; b=aPRtXwuqM39ImuQ4Ithuo1p3g3
	g4gPCLHGf3sH7x/FNVYbykAtm1jEmWcBW/MMuM07qUD/YCeRl80fZg0Sw3r1WHSUfPhDrWotybgzc
	qNWSLRAtLPm08qvnNfmZH04Ctih7yxAw78j3+lEsPb0s6YijoCCrkVZH+EryR9+p1WVRsS87Kaw/x
	RDE6m07mL8Y+KCLzUGwLB9h5QKz/hrO3B5RqxLrRWjm/PPAIsaRao06di3OViIt8gVE+754wHZPib
	QBFD9tBUtI+lD+X/ZPP0jjxZmDMYunhYMuN+9Slh9Mru7J0Qd0KALSmcT+8Ne/7K6u2oazhMA3jFv
	nUpeMVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwgk-00000007swA-0ayG;
	Wed, 03 Sep 2025 23:14:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsv6-00000007Q3y-2TuW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 19:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756926803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=;
	b=GFdUc0n3+hx/RgUpFT+azpqkaTIpaAaQRZmnfhZTVEivjHbyknHypQc5gHh4TQjZnGzvgL
	eMYWkb7sLho5j+qmi2SKC2nIkFxnpBF4L0T2ntcvL55391l3NtmMwujWdFSqii9FiqpzMD
	5NPnNFZ3hBMmVy0MqB3D+rjR6sfd2Jg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-Mx6lSSkMPj6pcdGoJuqZmQ-1; Wed, 03 Sep 2025 15:13:21 -0400
X-MC-Unique: Mx6lSSkMPj6pcdGoJuqZmQ-1
X-Mimecast-MFC-AGG-ID: Mx6lSSkMPj6pcdGoJuqZmQ_1756926800
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3da4c617a95so177618f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 12:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926799; x=1757531599;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9efZduikSFnzjh5/dSeOTEpOmP3UF4mDaQBviml7j8=;
        b=mvHqTb+8PDDC/0z4RQdj0AybVO/rs1nG//eCL7DsS6U0X7/2gdSEKukcN5xHPKeC9J
         7Qsh6NQY0bbeji0kqkez0RwpO2lMKqcehRrhIgrItIwdrmsKoVLr2jmhql8JX78MaWYH
         7Ero2v9vBjuvFsv7h6kbqEPtOJZgTn2aj8WNM00JqDcS65r7arnZqHacErLdWmviIjiC
         c2smYMDydvSG13PRmgYZIusaQpe/drkaCPan3yB068LBJF1QlVuQ48PBRCuTs7lmrT3q
         dpegO3+e8tTakRs8OMgBTd1kYNY6rWZ8UPRXZBhKl1MdQv2jZNXMXj2uGHm7V59lPeT7
         d9yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqdGW/lGR/Cn3gehsSUOawwHyZ4ehuMEfY40xOQgOOs8DFqFhR1tTfCU9T0Y0fUy4tocsxQpPPj03xYY0lYa/7@lists.infradead.org
X-Gm-Message-State: AOJu0YxzERGZPbZ8+gXkYx12/TjrdHvN+6lofHu4efBRlFYdC/hPZ2xY
	p/5B+wQAdn7xcqJ5Y7lgx+9yVqAyWd7mKbfwlMhHZL6shzb6dRSA92JRMqRvTANaXB6uz8sGYY2
	ASA8qx1EkeW47tj1vAOhtyjI22thvy7fY6hHM9YelcxFtpx4E8GCURDWq90ZtRt1Bc262IXs+Nz
	4N
X-Gm-Gg: ASbGncuFlegMD9u71sPE6v2R3iH/uzr0DrmVC/vECweF3YaMVAE/hWRewlnuvmDzIC5
	+2JKA2VUa5Eo1KaA9l1K4uPQkz9O5ZZX0LOojdk0BhfckOe+aEco4Tm+1f9Yva1ThyPQ0fa+BFU
	NjpiOwFg4TcATuQjrZ25jd7/GLQ85aJh8cKuM7TN8uuT3ByQVyKe3dS0t+2NZmT75gxRYbSmFCE
	x/Uagznt654gNZG8YSFDOLGh+RQF2Z0apRX7viWZ9QBWuqmjYV7aSO466GwNehHvt5BbJLhfQmO
	W5ejj6cE09p/yMfTYPZlzD8JR8wpNsTBWJDhkQy/S6ZkseJtjOJ0B0feWeNjgaoMlyKBCPyz7qn
	qxtJ2cwAz5bmbT8rk5hxnHIgEcNil6+aCcSMmV+eF8MYXzd9n6QhPgQw4xGlhZxrjhew=
X-Received: by 2002:a05:6000:26c4:b0:3d0:e908:a10b with SMTP id ffacd0b85a97d-3d1e0a98afdmr12916660f8f.56.1756926799527;
        Wed, 03 Sep 2025 12:13:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ/vbJZF7Gnq5OOkQLM1RIJN39KlfIKUtJSN0ttlFYZVmCF5jsL7cMmb4EZqATRVjN+d4Mbg==
X-Received: by 2002:a05:6000:26c4:b0:3d0:e908:a10b with SMTP id ffacd0b85a97d-3d1e0a98afdmr12916642f8f.56.1756926799082;
        Wed, 03 Sep 2025 12:13:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f09:9c00:8173:2a94:640d:dd31? (p200300d82f099c0081732a94640ddd31.dip0.t-ipconnect.de. [2003:d8:2f09:9c00:8173:2a94:640d:dd31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d66b013b7dsm13632800f8f.28.2025.09.03.12.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 12:13:18 -0700 (PDT)
Message-ID: <8ac6e37b-15f0-40ee-b60c-8893156f8cbd@redhat.com>
Date: Wed, 3 Sep 2025 21:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] virtio_balloon: Stop calling page_address() in
 free_pages()
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-block@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-efi@vger.kernel.org, virtualization@lists.linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
 <20250903185921.1785167-8-vishal.moola@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20250903185921.1785167-8-vishal.moola@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sTsRbk7PBigNr-w4Y1Ct1yPsRjmB61zeTsu7ZkV4Wyo_1756926800
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_121324_720057_6B0AFE7A 
X-CRM114-Status: UNSURE (   8.04  )
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

On 03.09.25 20:59, Vishal Moola (Oracle) wrote:
> free_pages() should be used when we only have a virtual address. We
> should call __free_pages() directly on our page instead.
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


