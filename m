Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA667E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 05:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=; b=VpxoZuNojEr/r9Y5jIHJkExgwT
	154cvpDIzhI85u/sfoILccYOlZgF95VowQaHWR8oyL9zMKxfrE66OrlH9P4oHf95bU31VXAPlrQiF
	u8NEPZE+PtikDXyV9iCbmti3+C5H4VV09n1yRpR9czRfJI2KpBHcOwKXh9NGwJhbmHlVNC5omV1SM
	QqsoTlzmP2acXaqJcEPHhOBnEiOW2Cw3ABLjteFi3AFNfYjjFEL7Rx5raUysNyDGx2gdM8o/60Bj2
	02prrBHKgkA8Tbjy1crz2uEomKjcISeb++XCEALO8wzbDDyvZKTBZVsZpWSz8UBRNqGx4pTvYVcWf
	bAHF4SDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7wX-00000004Yih-12ul;
	Mon, 30 Dec 2024 05:03:53 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tS7uT-00000004YL6-2cg4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 05:01:47 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21670dce0a7so14276135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 21:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735534904; x=1736139704; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
        b=Fp4cwpkyL4nGSltS6N+5ZH048AyQ5QrEn833KK9BUkefZSKjYJZzehuD2s00Pu6Hxp
         lVhZVe3DdlwJeLwnXaTiuXGib2UWkUsYRYzEGFB0igQAcltl9dVXGX00fBMBgL19CLT7
         /MDVGwQFDoGSYpQhIBgc/BSxe6VpoULkR/hErcVHw5tOJzMD/6irvnH5EmIZwaGTEOu7
         FlorGMNnlzvJugLNgr4C+I8KD4CaW8uknq5Whj54w8WPXOAJxrNFxZ7IE9c0hg/Va3mY
         FCRbQpYgpH46suSXh0Z/+rA4z75NMVBCozwC/rcNqrkQ95R2uwVa2RaKuMRdT6ojcOCH
         s92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735534904; x=1736139704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z71RF7AQSzzvF96cC/aV2tD8Znb4DG916rBbscUdZ1I=;
        b=ayGmISApOF0wi0ucL+xxYSaqlzc8OsO59jnAzwdsbZYL/cxbj/OiBzCmALitZhhARf
         eyYqXxbuJOvUkqxbOh7JT5qk0bLevQhMOgThaI7bdJQuydciNGsT+pHepuTe9lHZ/AzI
         KSmgiHvH8He0T40Z2bWleneZ3ftix3nrpBvztsYbi+kQI6HXm8h+qtQYEmz0EB9TRJS2
         F27NdkD5nTd7KMx3McpRkUL3tssupUxjphuSKCTvTkGuzdCxn+rVWmOiW24je9soBrmY
         lsSlpkpbj//wpzu2aIxTDYF4SpeFsdD+zSNFrrQW9iz0rVmpmrYeIp/muuomDFYfG8z9
         opKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBUSJau2jbqdonKhsRS7fCP83Kk0RHEFKui3jDDc3EOTRMkMiKedDo773CGVh/abSnvBojfFYM9G6UksSlOJup@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5e6NuPaQEGj4fOzh2wy44fWcJBEojeuXHJrZp7Q5G4H+88Cyp
	fmQDgXNcuzofo0aMLM+uf0tj78Wr9Hfck0GYZnBWJKZJdUYhzE0oP88e15Nc7B8=
X-Gm-Gg: ASbGncsdXDcjpDMYYrlVIttTk70Gaho3J5jprlyrY2ddT3GZh5krGauouJmQOTUEzEl
	vN41sivuMn+t+fa9vzf/TPmC4cVxR01x5IYMGUxcI9QgtjDWWkdtGs+zh8wwBwAgF0uyHqc2LI4
	hIAWQYPnZU/6jOC49kZcaatCNIp8mSr++pHPksRwfdhygQ33Z67RM2PuAxkWaGjujW2kjNkpFlk
	JSzBQ0mCIofT+z5yfIA9oRK00gMjYZdY5vsIHkP5xMuvsIxvC+cyb+2nCS17oCdHQq9fNKTHDLA
	1ZeRXA==
X-Google-Smtp-Source: AGHT+IGNJA4bVLowcqsTNcTKWXSt9C1oo/1EXH42Qr0z5K3kcPv3AzGfuER3K4niOaxH4y3G0nd6hA==
X-Received: by 2002:a17:902:ce86:b0:215:a57e:88e7 with SMTP id d9443c01a7336-219e6e89215mr362710865ad.3.1735534904325;
        Sun, 29 Dec 2024 21:01:44 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba7325csm16914771a12.7.2024.12.29.21.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 21:01:43 -0800 (PST)
Message-ID: <efd81018-f637-4925-9104-c9586fef688c@bytedance.com>
Date: Mon, 30 Dec 2024 13:01:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, kevin.brodsky@arm.com,
 peterz@infradead.org, agordeev@linux.ibm.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
 <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
 <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20241229205545.e4fa797886f30cb20c38ad06@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_210145_703590_C808ECA1 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Andrew,

On 2024/12/30 12:55, Andrew Morton wrote:
> On Mon, 30 Dec 2024 11:12:00 +0800 Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
>>> For now struct ptdesc overlaps struct page, but the goal is to have them
>>> separate and always operate on struct ptdesc when working with page tables.
>>
>> OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
>> intermediate products of the project.
>>
>> Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
>> [PATCH v3 17/17] from the mm-unstable branch?
>>
>> For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
>> can help do this in his patch series. ;)
> 
> I think it would be best if you were to send a v4 series.  Please
> ensure that the changelogs are appropriately updated to reflect these
> (and any other) changes.

Got it. Will send a v4 ASAP (remove [PATCH v3 15/17] and
[PATCH v3 16/17], keep [PATCH v3 17/17]).

Thanks!

> 

