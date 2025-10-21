Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAFFCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 18:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBrbK9RKibKRT6qgoQrRXFUWF1+5GJaA4FIMjdaH3ww=; b=Le4deYwESY3apICNz1dqwnbvG4
	ZVh4bTWQBeByC3QNtk7N3c5uipZCme/G0Rdmab5gg2XUjk7vR5/uLtZYNGqOwKYjJ6y5oLRoxLAZI
	Rice4ivQHidiKuQMbeRil+QQjhoYFNdixmW6aFD3MDACtjHQqki0C1bD97LnPr2e6wSuyLuol1rWC
	WcjKdX+BJVT+/G7G8Ghmkue3Gkw8s0h6WD3nSl+0i3MOA4GdA6ZXIbtwvjyk5j2wSiH7wRN+Fodkf
	rdHd6Qh+s2+s0Um8IvJJuNzjuR0cgnx8Z/6yMoJm/vzkn1rTghhGwpJ3vWBw2nWzLqMc4a/jynDlU
	xtGKt3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBH1N-00000000KhC-3GNd;
	Tue, 21 Oct 2025 18:23:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBH1J-00000000KgX-4C2a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 18:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761071020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iBrbK9RKibKRT6qgoQrRXFUWF1+5GJaA4FIMjdaH3ww=;
	b=eLz9jsHdLBjZvzEZIjmvNa2bHBGXe+GvsOVnTJVDo7uq4sNR8DFw5aC9VBvtB8bv00lUZ3
	CDVSXQPtbFLYPxJ6yJ6PnPGgcGXV4JkFXvg+6zojO17I92B27QY8RuuGh1ZxDhMAJRzltL
	vhP0H7n4X2GYQ8EJ6rwZqpdF6ligMH0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-6ysDe-WnNuOs3OofajtXRQ-1; Tue, 21 Oct 2025 14:23:38 -0400
X-MC-Unique: 6ysDe-WnNuOs3OofajtXRQ-1
X-Mimecast-MFC-AGG-ID: 6ysDe-WnNuOs3OofajtXRQ_1761071017
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-46eee58d405so29669325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 11:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071017; x=1761675817;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBrbK9RKibKRT6qgoQrRXFUWF1+5GJaA4FIMjdaH3ww=;
        b=WM22XTGtaUboIP59yo7HzLvthuMEiD6gLMvb3DgjcBtN+nHNn6BfGCIi2x/R6EMqnT
         Kn1TTYrTKTVXuW2qWVUQNa0f0yri5E5Myk2bBsEgGCML2SkUJndrZKXpsYMW0uN0zDs3
         kUHZFJtuL7B/xXYvHNq6ILYDKsyP8x4oZnugHHsHq15hJWBRsctnBynoCjhHCg9xnMkS
         Xs4t9sEZxqu9ukDgefFcjI94z3WptGMeq7/eIhV8OovwE5eXHaQQAgdanqCDRpXN8sN0
         iR3cJ3BXlGT0+HLhSYo1AzAL5dLcBl/lH0UW5THonu4JBHjjPv2OnGTMQqVbFVo+J8TB
         LnkA==
X-Forwarded-Encrypted: i=1; AJvYcCV2I5ZUvvCzTjGvWtW5Wzdq/bXmdow+QYTNmPi+3hEVgf1gfXs8XOnr/3GccEG8BXE7dd8cooPOI92EEdQOB6Ys@lists.infradead.org
X-Gm-Message-State: AOJu0YxCl3liy1obcCARBTHaIghN1djGVt4/zDRSc6BZOTt/RFYnsN98
	Zd4Iv2VI6AzScW/SMuSNmCgnGiN+bo32XgsDQMhWidckRjKeDj6qx50qV983IFOEtnLqtqWGTx2
	bEQ+Eo5v0xGPEl+dFETm9TE6DieXQ2FLAldw+UAYo1J0X976NWR69N7jxGjdPAafME5PSOA5n5Q
	X1
X-Gm-Gg: ASbGnctja7bGbdFkWBGtaeP8REgNnfrdHoRHxivCZRXzPV5I496NOIb4g7wkj6rL8Pi
	Y1NNXEwN1Am8CSfR0J/zP9MAu97stFecjJ1EhLZKZOS1ZHZgQ8EYq8ES5ri1HGgthf7rw7ayeKS
	Bs1UbeS+tu7IVYe6wkHAlIWkQcJJyBx0exXyig3akAHORM3vuyGhZEF1lGPA+uuMfge9WPvvIs+
	GSJUGPntRCsOL4ul6c74OjgVpD2/1nUi2GJWoZ8gpcN1dLxQOhdJsRwS4zXEff5gFHobOhjYr5+
	dn3Pe9tIU8rGfKtvtPHxVa26gHb+sHG9SWrl+cwiseYYQDi59FCmTT6m5+3H2mbldTVEt4avxJT
	iRHK4iFqoY6y2mAUsZ/MDkjaq/kokMdU=
X-Received: by 2002:a05:600c:3b03:b0:471:6f4:602a with SMTP id 5b1f17b1804b1-471179068f6mr127341085e9.23.1761071016816;
        Tue, 21 Oct 2025 11:23:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJsWV9wT/NI8q8P0pT3eUfqgv0//dEDo9NEYi5244ajP/UlPoMbe8met5vnilurQ0DtdZeDg==
X-Received: by 2002:a05:600c:3b03:b0:471:6f4:602a with SMTP id 5b1f17b1804b1-471179068f6mr127340965e9.23.1761071016383;
        Tue, 21 Oct 2025 11:23:36 -0700 (PDT)
Received: from [192.168.3.141] (p57a1af76.dip0.t-ipconnect.de. [87.161.175.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427e1be5d6csm21253402f8f.0.2025.10.21.11.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 11:23:35 -0700 (PDT)
Message-ID: <2961abe4-d0f7-4cac-8f0e-5db20fb5dfcb@redhat.com>
Date: Tue, 21 Oct 2025 20:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mte: Do not warn if the page is already tagged in
 copy_highpage()
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org,
 syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com,
 Will Deacon <will@kernel.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
References: <20251021181353.3842660-1-catalin.marinas@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251021181353.3842660-1-catalin.marinas@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aiLSENiSsjzUgSxXbmeByrgfxMZr80f0XGq2jtiBRhc_1761071017
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_112342_118046_DA21A7E0 
X-CRM114-Status: GOOD (  22.12  )
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

On 21.10.25 20:13, Catalin Marinas wrote:
> The arm64 copy_highpage() assumes that the destination page is newly
> allocated and not MTE-tagged (PG_mte_tagged unset) and warns
> accordingly. However, following commit 060913999d7a ("mm: migrate:
> support poisoned recover from migrate folio"), __folio_mc_copy() is
> called before __folio_migrate_mapping(). If the latter fails (-EAGAIN),
> the copy will be done again to the same destination page. Since
> copy_highpage() already set the PG_mte_tagged flag, this second copy
> will warn.
> 
> Replace the WARN_ON(page already tagged) in the arm64 copy_highpage()
> with a comment.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Reported-by: syzbot+d1974fc28545a3e6218b@syzkaller.appspotmail.com
> Link: https://lore.kernel.org/r/68dda1ae.a00a0220.102ee.0065.GAE@google.com
> Cc: <stable@vger.kernel.org> # 6.12.x
> Cc: Will Deacon <will@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/arm64/mm/copypage.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/copypage.c b/arch/arm64/mm/copypage.c
> index a86c897017df..40749d0a385c 100644
> --- a/arch/arm64/mm/copypage.c
> +++ b/arch/arm64/mm/copypage.c
> @@ -51,8 +51,13 @@ void copy_highpage(struct page *to, struct page *from)
>   		}
>   		folio_set_hugetlb_mte_tagged(dst);
>   	} else if (page_mte_tagged(from)) {
> -		/* It's a new page, shouldn't have been tagged yet */
> -		WARN_ON_ONCE(!try_page_mte_tagging(to));
> +		/*
> +		 * Most of the time it's a new page that shouldn't have been
> +		 * tagged yet. However, folio migration can end up reusing the
> +		 * same page without untagging it. Ignore the warning if the
> +		 * page is already tagged.
> +		 */
> +		try_page_mte_tagging(to);
>   
>   		mte_copy_page_tags(kto, kfrom);
>   		set_page_mte_tagged(to);
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb


