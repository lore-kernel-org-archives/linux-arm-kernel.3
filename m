Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94F7CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 11:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lQeSnVszPSSY9ZXSFHEL5gERJYR6xjSMj4HUufxrw4=; b=EUVp9YPYXqdqFKtQJvsHXB0kUg
	hIx8LNN1FdwT9994f1kVkdvSqDFd8I92VO9+BJSNo99JI96ErfDiDkijT2ZtG3xaE8ix6tSbXxTCk
	qmcrzjjbHJDcKtOK5YJzmNQ9viSDiFdCFgAbLQZ9vlwO1e+AlSKLF5r3g0Hl0cJ6SP61Di1NHYmu/
	iT3/vsvsPMkOHe8Xt+vcn1Fqa0ZADQPq1PiC2+Fzuv69tVFd+PlUiN+MZpvZC727FfY1ZvD/GXduY
	eb6ABlEkO+faP/Z3RiT6JX9BopjJMhBbxgE7wcvOjcYqEnbfqiB7XD5Vu4tq3H15Bh5w6rQBFO9K1
	o6MIhpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut2TO-0000000C1Za-38Xm;
	Mon, 01 Sep 2025 11:13:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1MS-0000000Bq5j-2WAz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 10:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756720923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+lQeSnVszPSSY9ZXSFHEL5gERJYR6xjSMj4HUufxrw4=;
	b=CQix3hq00bRBN/IAtV2Cr9gNpZENe+1tROP+kSGL58N0dnlhFsldM187IW0CtjcPWtx1Vg
	PSnbTzJY4ClUpo6rOT298GBiBNxn6jKvcrxSDwmAcCEN580wH0S9i35dWGfBX2q5FL6Iib
	pPI4v+7/tL5l2fBHBiYRjNzS2/9NFNs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-djViWCjbNEuVFNZ_YD6_Bg-1; Mon, 01 Sep 2025 06:02:02 -0400
X-MC-Unique: djViWCjbNEuVFNZ_YD6_Bg-1
X-Mimecast-MFC-AGG-ID: djViWCjbNEuVFNZ_YD6_Bg_1756720921
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3d2edf6af18so761542f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 03:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756720921; x=1757325721;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lQeSnVszPSSY9ZXSFHEL5gERJYR6xjSMj4HUufxrw4=;
        b=wUYJgX5O55uqkWvzoB4gcPVEjWBERwAO1aXusFLoS/4zmWsnA+hba5mvgnuyNcxq1Z
         S9yrGdo4K+Cq8pW4x8o0DUZ1KVzXCTXu01IjtYQS3sg8ZarQDdAsWfthtFEJHs0EKuzw
         6fVl340HHpMJ2xXB7u6WlMF0y0zFw6TUDFDt/cb+zyA/4snGm5UwYfxvCYT1v8psVA8W
         iJz4h1X7ZfWNLek+69jnVDw2xi9PghzFfwYuNpDk50Zv4zEfr/YOFRFO2+Z+BoA5TGZC
         LX+tuAAL2uenDGAmv6tPhCSQvRps5d9y1yhAT7xanz4FUe5ptjP0hAbUOfcGj9glHKmr
         E9RA==
X-Forwarded-Encrypted: i=1; AJvYcCW8UkHxWRcdONCbrXYxSk96ewdpDF87e71LDWbZ2EwuFSML27RY2Gb1BrLGQ/+dkrOawoTD0os6VqiK7q5FuJmt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+Hp3Uz4fWmFb93xnOUS6g/EOKofQDOGiQO3IumdNLqWtLbOk9
	2kJ17SPwVXZUIFLckd91dkTZbrGPC5iZJElupJ5dCASveuspAx5Ux3oCJnrUaLAc/OY2eAoSQ5q
	SHjjcCNFDJqztZAAYesblSahX26FCY45EFi/0Mo8dY97TOIRgMj+SBtvQPmWXAyVBlYWE3dMmM5
	C9
X-Gm-Gg: ASbGncsClbcjNwjEJ06biUpy/pbOs7ZZn6+G0tnJR03Rqjyj423g2hZhZUTny0t1xNO
	Qa+XRJNm14MHlxE902ucnwdlM3qYQGqDZzTWjvJ9u3lziSw4A+BlHejmGNn7Tev7qPHCxqNoWYb
	CmYs2gmFVqUKKIuNaPfX2z8zk2s3z0dlNNU2lRyR2lTiuc5APnmuFT08DsOU+5+zWttAoUOw77g
	+wvOQdKGy0tRieAOVe43usLuhC+d51HARS+q/yRUUOfmR/HOPL2u+8Xynb81VlTd1D0MZAYL6cI
	Vs4+vqfKVgCmvgS5jVLYOoSiWL9G1zED2CJAKx2ApqEYvzSan0ldbOWCyxkLgieyE/4EI7kqZ87
	u7zycB092N0Ygqq+E9aWHlOPJwjfbqHkZFB2z4Bdvus2bDGo0jRqjMtnM5xwFEQRlbLg=
X-Received: by 2002:a5d:64cd:0:b0:3d1:abf7:e1c8 with SMTP id ffacd0b85a97d-3d1d98d60e1mr4874718f8f.0.1756720920941;
        Mon, 01 Sep 2025 03:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvPsDFpHZYqBUf8mT2gRUFJpfAuTdUtgOPMP4pMlCUZ06zRhnpYdXw7CHR6fjLFikWold/+w==
X-Received: by 2002:a5d:64cd:0:b0:3d1:abf7:e1c8 with SMTP id ffacd0b85a97d-3d1d98d60e1mr4874687f8f.0.1756720920452;
        Mon, 01 Sep 2025 03:02:00 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf275d2717sm14699314f8f.15.2025.09.01.03.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 03:01:59 -0700 (PDT)
Message-ID: <7e1f4f64-dfc4-4366-8e01-0891b2d4d2b4@redhat.com>
Date: Mon, 1 Sep 2025 12:01:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
To: Eugen Hristev <eugen.hristev@linaro.org>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 corbet@lwn.net, mojha@qti.qualcomm.com, rostedt@goodmis.org,
 jonechou@google.com, tudor.ambarus@linaro.org,
 Christoph Hellwig <hch@infradead.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
 <ffc43855-2263-408d-831c-33f518249f96@redhat.com>
 <e66f29c2-9f9f-4b04-b029-23383ed4aed4@linaro.org>
 <751514db-9e03-4cf3-bd3e-124b201bdb94@redhat.com>
 <aJCRgXYIjbJ01RsK@tiehlicka>
 <e2c031e8-43bd-41e5-9074-c8b1f89e04e6@linaro.org>
 <23e7ec80-622e-4d33-a766-312c1213e56b@redhat.com>
 <f43a61b4-d302-4009-96ff-88eea6651e16@linaro.org>
 <77d17dbf-1609-41b1-9244-488d2ce75b33@redhat.com>
 <ecd33fa3-8362-48f0-b3c2-d1a11d8b02e3@linaro.org>
 <9f13df6f-3b76-4d02-aa74-40b913f37a8a@redhat.com>
 <64a93c4a-5619-4208-9e9f-83848206d42b@linaro.org>
 <f1f290fc-b2f0-483b-96d5-5995362e5a8b@redhat.com>
 <01c67173-818c-48cf-8515-060751074c37@linaro.org>
 <aab5e2af-04d6-485f-bf81-557583f2ae4b@redhat.com>
 <1b52419c-101b-487e-a961-97bd405c5c33@linaro.org>
 <99d2cc96-03ea-4026-883e-1ee083a96c39@redhat.com>
 <98afe1bd-99d2-4b5d-866a-e9541390fab4@linaro.org>
 <c59f2528-31b0-4b9d-8d20-f204a0600ff6@redhat.com>
 <40e802eb-3764-47af-8b4f-9f7c8b5b60c1@linaro.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <40e802eb-3764-47af-8b4f-9f7c8b5b60c1@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IM1GG7nBdKlloMDDXASK5vC9kvxU1A0Kr-Q0r7F5udQ_1756720921
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_030204_738884_04B221D3 
X-CRM114-Status: GOOD (  14.13  )
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

>>> What do you think ?
>>
>> Looks a bit over-engineered, and will require us to import a header
>> (likely kmemdump.h) in these files, which I don't really enjoy.
>>
>> I would start simple, without any such macro-magic. It's a very simple
>> function after all, and likely you won't end up having many of these?
>>
> 
> Thanks David, I will do it as you suggested and see what comes out of it.
> 
> I have one side question you might know much better to answer:
> As we have a start and a size for each region, this start is a virtual
> address. The firmware/coprocessor that reads the memory and dumps it,
> requires physical addresses.

Right. I was asking myself the same question while reviewing: should we 
directly export physical ranges here instead of virtual ones. I guess 
virtual ones is ok.

What do you suggest to use to retrieve that
> address ? virt_to_phys might be problematic, __pa or __pa_symbol? or
> better lm_alias ?

All areas should either come from memblock or be global variables, right?

IIRC, virt_to_phys() should work for these. Did you run into any 
problems with them or why do you think virt_to_phys could be problematic?

-- 
Cheers

David / dhildenb


