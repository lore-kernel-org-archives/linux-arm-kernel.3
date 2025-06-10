Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5471C71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI6UmbgwdlVAnCc78+kA++Zeb+kmoiPB+fmNOOceC0w=; b=J+K02F0CgkmGJflX3d4Aps1s5a
	I97mRc0Nx7c5k2R8UnxI8JgJUDGDe3X/2OioUzs74IPJjVaM6y8zQKDUY5vYswqzDyTDi2M84vJMj
	8R9YBqlpgUfOksjzp0ZSraJyKqEFJDMrbr5ivkrK8AwgzRC+dvevXrGljzG25ejs280I8YkqbEi/g
	rpWZhh78tfrT6PZSm7zMtrdP78/RAtlKSTiUVIFFTthW6vmQUo3j7WdESb4q/KcemwvfC2J0XbMGv
	byLJ9uc1NPdNQcjXasG+ZVdfbkledlgxmHGTvZoUM+WaPh5sJ/zSWBxl4DkVTJP7jOZOiZy6WVOmf
	FdK30wZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxmn-00000006iuH-3niE;
	Tue, 10 Jun 2025 12:09:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwMk-00000006VnG-221E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 10:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749551881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aI6UmbgwdlVAnCc78+kA++Zeb+kmoiPB+fmNOOceC0w=;
	b=VVDSCKHRpVkmLpLgFD1gfMlvDsMgTTeTeIBYsaN5PbC9QM/+V82eiEgE9T9cvr/Fcx09/z
	q+ngo8vYlmC9Iv8jbfIPBhdJaBxK0kWVcayhTt8s0gqBhwyijQ89zaGpKjTDP0O2MQKsvC
	IR1RcD+WSvxiVz0l5HG4rFSl32vUZsI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-L7_inoJQOJeKNjQdXB16pQ-1; Tue, 10 Jun 2025 06:38:00 -0400
X-MC-Unique: L7_inoJQOJeKNjQdXB16pQ-1
X-Mimecast-MFC-AGG-ID: L7_inoJQOJeKNjQdXB16pQ_1749551879
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so2081978f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 03:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551879; x=1750156679;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aI6UmbgwdlVAnCc78+kA++Zeb+kmoiPB+fmNOOceC0w=;
        b=JGT586rGaugCWXmaO1ImmVIDQG7RXswQKYRahctAuJxIoymjDEdn1ND7gK+1NL9qcs
         ZGydHUg6jictYZNEiKbMcxZ4lgc2QMx2gL1QAZuccGSMAqlZ/XFJ5V+KDP+nxEs2g3ju
         EkKnD5vr6J6G7O5qHl6+Xs/WExXZJsnWvvhId0eji1dETa7D8qu17nnr02jTzcVR22PJ
         Nb11Xt+nX68UWOFTsvlSISd8JALlSB36ZO80UDw62icZ0x+x0v0or3aOhAhVxWNMjzOH
         yc75Cx59TxHUjg+5JribBf9DR+kY1fguQmKxFk9rdNF4ZMVX3de4oa+mJTP/9c27MBxt
         0o3A==
X-Gm-Message-State: AOJu0YwZZmPro8r6f/HFBS6zFQTnpFCGHDW742md/z1YQWJPWeYcLF2h
	7RuPyhzPjR1Jfp3ADOc1x/4V0k5PwMZ2bbBR7iRJq3O/PxtgERRuRSsJUQ1biivdPzB0kf8d4h8
	QF6gNW77QdRJVRHwBmrQbGTQ8OSejxOJsACv/Whqob3BhRQUQLCdGY5UQqNq5eD3xfEATL8RNHe
	d6
X-Gm-Gg: ASbGncs/mFx+bIgOrvxfCsoxsJN5u+mVrzcKcFtT139UnAVTXmruRSwrrQ5ZCi5MEEA
	PH3XC1QGuh47KuHvvbvPYCIIg6tPy3nW73t/37u18iXpBoD5DuhgMVIGU+Fs+xmme6OnqnWPT9s
	boWl2enexlj9J8jYiZbvmSJSrgA/Ox5GojjsBLvqDVJgr3PBi6ZDVSpHonYnpUVuFoi2oxniX/n
	V8Eo3a4Rr/d9N6xh+OVU6mM5SvZoAn/19lR8zbG5MwlYV1nCfKrsKlsYTE9SiGfnkzVTxi77l8O
	zIJCY54YjfPGf7883Vr0xHWWd44QAcuR6EWyz88KlDiXe0owBVxcKPM=
X-Received: by 2002:a05:6000:26c5:b0:3a4:f7f3:2d02 with SMTP id ffacd0b85a97d-3a5522716a9mr1608116f8f.17.1749551878749;
        Tue, 10 Jun 2025 03:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6jkrSTQLJlhMrYdllOzIW6Ete/JGJLtTiYCIoUWXSkxb/sdVLs38Feted1QX/mOtzl90MWQ==
X-Received: by 2002:a05:6000:26c5:b0:3a4:f7f3:2d02 with SMTP id ffacd0b85a97d-3a5522716a9mr1608088f8f.17.1749551878384;
        Tue, 10 Jun 2025 03:37:58 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320b16657sm9031205e9.8.2025.06.10.03.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 03:37:57 -0700 (PDT)
Message-ID: <1ec55f0b-991f-4ea0-869e-5fc0be719c8f@redhat.com>
Date: Tue, 10 Jun 2025 12:37:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
To: Ryan Roberts <ryan.roberts@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Rik van Riel
 <riel@surriel.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mm@kvack.org
References: <20250609103132.447370-1-ryan.roberts@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609103132.447370-1-ryan.roberts@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eX0aevUnm0FyKb6LQW64pWHQk0qgZCO6Q0VKABVxQEE_1749551879
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_033802_602880_F26A2F5C 
X-CRM114-Status: GOOD (  10.20  )
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

On 09.06.25 12:31, Ryan Roberts wrote:
> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> TLB entry remains valid"), all arches that use tlbbatch for reclaim
> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
> flush_tlb_mm().
> 
> So let's simplify by removing the unnecessary abstraction and doing the
> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
> arch_flush_tlb_batched_pending()").
> 
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


