Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7938DCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=; b=Nky5qxpbWUsWf78bXCLFdJgI0r
	uQIBQZToDOtUA77+5llDB2M1b1VpG+EkUCY3GCQ2fL9wq9giFbAFpcjPZVSSsdB5S+NYZa+jbMzKi
	cANaok+BEh7RT59sb6wuHfToXtqkpDkVPcZZbk4KdSm87JQXcVLLdHnDxabzC9vTi62ds4hAQEMf6
	LThWbl284NS/wCeCW9kCe7O59qvsSrnd19DN2IBO76BOF5Rb7zmBINcHhOToHOvLK/DODPVWoRmEV
	ybXMp8yG4mABc0RqejSQUEYEya0cg4yCp1uFAHshFGIGH6TpdhXkynHs7bGX7S0bG/gt0Jgy/ZvWo
	o1+dte2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xh-00000008qUc-067z;
	Tue, 09 Sep 2025 17:16:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwwJ-00000006toC-04M5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=; b=b2knbD+oFJP/FvULo1F05HxynW
	oNsYBasyXFV/NEd5EVl1zeEgGlm1xs/MDzHHMCOx8HT7bj/CgGZ0FYsgk4mRhGHhbx1cHpyM/xgSE
	UzDPy9Oqh1TLQlHcnizsL5Pq7xaOr1VUEOOptgLOferj6ual+BKVo8LQ+MFKfiHRXxB2nO7qIEOkg
	DRro69sHg3CRhWC/8k7eQ52ZoMgVowCsXDhPZMMqFZxp0jY7grTotVl79bnUv93w+Oed1OEmakqe6
	QNijkfnX9cKcT6tE7u9HKJ+un7iiokib3/PqWDkVUHrubohOZJKkRVmU0SOho9t2zwLxnv2zA4486
	IyNQ/gHw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwwF-00000005L82-2teW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
	b=TeG50QHdfQmlrDtNV7kIrTfhhxbITLcjscvi0ij4ixwB4EIZGcFrProR6cw9fQfpGzPy7e
	UTXEvKHWmGFtbOB5wXCKC+wmkrJhWXErmYdF+1BTY5B40LJv6CAvYZ0a+kTLsAr72z13Nb
	tMDDazEBrc3AzL2EyIYSYXp0Pn9EOEM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757418906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
	b=LsYeTzlNsM41M2M8/Bqw2Kt/2mNt7o0ao12CZrHgHc+oSijEiI+f5I1kfXmy+pI7W17faJ
	hOdajbyoSZwUDAPpSpHUABKjqjNEkJjGxz9QEA8tqA+rI4wnnpS6rRzHtskbQcCSIU5VbL
	+tIr2Cb8deyfgxsbX+3Do77uLJi6wpo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-3ZQENYiuNxmYDGJ672BABQ-1; Tue, 09 Sep 2025 07:55:04 -0400
X-MC-Unique: 3ZQENYiuNxmYDGJ672BABQ-1
X-Mimecast-MFC-AGG-ID: 3ZQENYiuNxmYDGJ672BABQ_1757418903
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3e5190bcba1so2900997f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757418903; x=1758023703;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOh5IdHecYmXNJFyfTY+5ofA8ReFnlDB1RFePKgZiG8=;
        b=oX08wIubGJHmoqoCxhMpxSAVGvVNvmHYboWBYt77PHmseRaOE+Y4ktX1OMxGysVSkt
         MsB7Tjz8PqJnmItgSfCCXlfutrQqnBNB4ES8h7hKXqRiE5f+SrDS0cEiUMK8LF5myNyJ
         fqLCyjGeVekY58MTvzQG3xv/gmBdJs8zGTAUihPk2ncpSZ3oFPeIAi8iQlNl2lY4UTY1
         DxNoTGTbqvyoUdjIAljJcC+N03uhQYTf3QhXxp1JlSHJev2HA3Eu6x0mL+tyiSl/XBf/
         u1YXsEd/QzG+5wAx5wwCkn6MnoHrSAx1gZlGjY/wKTxrpWMjyS6GizXyyE/vForMpQT7
         jWYg==
X-Forwarded-Encrypted: i=1; AJvYcCWe+GaDjGityQeXGRpwjUBzLnaEmxS8xNmxvNcch28IlUnTn3e3q5mMKag1Lb6SrdLvFytkzxQJAVZnrpyVxQ2n@lists.infradead.org
X-Gm-Message-State: AOJu0YycP2LZAws+jBEJuSHfxxuf+ulEb7pG28dvjrHS0mtfQeuOMS+q
	KnPMZ1/BA1JozHOL40wyXrSdRjFm6ngRlgQXhWMG3Cvx9YvjwOQxnY9msvpXI6i1fUZdceUH2sE
	bMVJoV1c3lqEiNBBRe4YJJcCPdWU9ok8ircw6TjgNt2Ifz+Dr79NrY5cKbjb/4buWm229eD0wGB
	Ek
X-Gm-Gg: ASbGnctmAvMZVKgczOLDF9J8WpCt8+KQu5Q2fU3Z45z62rDAIlgExfx8nb9hCxohn1t
	Hn3X5EveHfgXZG0kgIDE+anrRA6qiB3RafZ7mMljQMpy1Y6VM20tIMbfdTi+lyh7CXDo3VpFICr
	rar/WW2IdG3z2BwO0FUfV2MLAJRYAIsJx57nIsSZwaMJXbq6JRfSa3l2wW+Br2n4QM3tV4nfNBe
	W4CrR3o6gcghGkrk5QPFKLORoMhus0YOdBEAyy/d1O4HO3U+JF4WBRbAMT6c4Fu9/UdX3WJrTic
	NwBPvTJukVsTZdO+fSsWIakiMeg0tuhLNQnHtqbDjd7SSqKUVGwbxy4TV3w54mbabsQyBqmeP3h
	zFZaFA6hD0v54SfkT9QtX9K48uyR9h82k/5KWDJRDGV0bQY1D0goqBkJ2EF1H9pC8cvM=
X-Received: by 2002:a5d:5f82:0:b0:3e7:42ae:d3dd with SMTP id ffacd0b85a97d-3e742aed713mr7769522f8f.53.1757418903190;
        Tue, 09 Sep 2025 04:55:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ZfFXrc3J/ZXb10wuImf1IN/WN2zT9Bnd5gvpLTDU+4GYxL8KyTu1AXUf0+6BD7rUQ8++xA==
X-Received: by 2002:a5d:5f82:0:b0:3e7:42ae:d3dd with SMTP id ffacd0b85a97d-3e742aed713mr7769489f8f.53.1757418902733;
        Tue, 09 Sep 2025 04:55:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34? (p200300d82f239c00d1f6f7fe8f147e34.dip0.t-ipconnect.de. [2003:d8:2f23:9c00:d1f6:f7fe:8f14:7e34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75223898csm2497249f8f.39.2025.09.09.04.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:55:02 -0700 (PDT)
Message-ID: <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
Date: Tue, 9 Sep 2025 13:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
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
In-Reply-To: <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EU7LEhyJGrekXsbdQT8sixr3Oz6N6JjvwM1eezMS4Ag_1757418903
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_125508_114157_21EF22BB 
X-CRM114-Status: GOOD (  24.13  )
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

On 09.09.25 13:45, Alexander Gordeev wrote:
> On Tue, Sep 09, 2025 at 12:09:48PM +0200, David Hildenbrand wrote:
>> On 09.09.25 11:40, Alexander Gordeev wrote:
>>> On Tue, Sep 09, 2025 at 11:07:36AM +0200, David Hildenbrand wrote:
>>>> On 08.09.25 09:39, Kevin Brodsky wrote:
>>>>> arch_{enter,leave}_lazy_mmu_mode() currently have a stateless API
>>>>> (taking and returning no value). This is proving problematic in
>>>>> situations where leave() needs to restore some context back to its
>>>>> original state (before enter() was called). In particular, this
>>>>> makes it difficult to support the nesting of lazy_mmu sections -
>>>>> leave() does not know whether the matching enter() call occurred
>>>>> while lazy_mmu was already enabled, and whether to disable it or
>>>>> not.
>>>>>
>>>>> This patch gives all architectures the chance to store local state
>>>>> while inside a lazy_mmu section by making enter() return some value,
>>>>> storing it in a local variable, and having leave() take that value.
>>>>> That value is typed lazy_mmu_state_t - each architecture defining
>>>>> __HAVE_ARCH_ENTER_LAZY_MMU_MODE is free to define it as it sees fit.
>>>>> For now we define it as int everywhere, which is sufficient to
>>>>> support nesting.
>>> ...
>>>>> {
>>>>> + lazy_mmu_state_t lazy_mmu_state;
>>>>> ...
>>>>> - arch_enter_lazy_mmu_mode();
>>>>> + lazy_mmu_state = arch_enter_lazy_mmu_mode();
>>>>> ...
>>>>> - arch_leave_lazy_mmu_mode();
>>>>> + arch_leave_lazy_mmu_mode(lazy_mmu_state);
>>>>> ...
>>>>> }
>>>>>
>>>>> * In a few cases (e.g. xen_flush_lazy_mmu()), a function knows that
>>>>>      lazy_mmu is already enabled, and it temporarily disables it by
>>>>>      calling leave() and then enter() again. Here we want to ensure
>>>>>      that any operation between the leave() and enter() calls is
>>>>>      completed immediately; for that reason we pass LAZY_MMU_DEFAULT to
>>>>>      leave() to fully disable lazy_mmu. enter() will then re-enable it
>>>>>      - this achieves the expected behaviour, whether nesting occurred
>>>>>      before that function was called or not.
>>>>>
>>>>> Note: it is difficult to provide a default definition of
>>>>> lazy_mmu_state_t for architectures implementing lazy_mmu, because
>>>>> that definition would need to be available in
>>>>> arch/x86/include/asm/paravirt_types.h and adding a new generic
>>>>>     #include there is very tricky due to the existing header soup.
>>>>
>>>> Yeah, I was wondering about exactly that.
>>>>
>>>> In particular because LAZY_MMU_DEFAULT etc resides somewehere compeltely
>>>> different.
>>>>
>>>> Which raises the question: is using a new type really of any benefit here?
>>>>
>>>> Can't we just use an "enum lazy_mmu_state" and call it a day?
>>>
>>> I could envision something completely different for this type on s390,
>>> e.g. a pointer to a per-cpu structure. So I would really ask to stick
>>> with the current approach.
>>
>> Would that integrate well with LAZY_MMU_DEFAULT etc?
> 
> Hmm... I though the idea is to use LAZY_MMU_* by architectures that
> want to use it - at least that is how I read the description above.
> 
> It is only kasan_populate|depopulate_vmalloc_pte() in generic code
> that do not follow this pattern, and it looks as a problem to me.

Yes, that's why I am asking.

What kind of information (pointer to a per-cpu structure) would you want 
to return, and would handling it similar to how 
pagefault_disable()/pagefault_enable() e.g., using a variable in 
"current" to track the nesting level avoid having s390x to do that?

-- 
Cheers

David / dhildenb


