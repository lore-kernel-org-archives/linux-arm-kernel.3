Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D7BC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=; b=bWVxfeBS7xuKyG
	oMQwLNC/yaO9ruuIqhzQFytxtNm/IZ8M9W5k2heIlVW2U+bBjZ7q/NzedSxf9KhR4TsPWJJX9AoLZ
	3hIO3v/FmnegoRPUxDXKS01TUv0oustBvit1l+Hn4D1lsrXqIGwsOVs36KxB7C/KJ8Pbydp4rfpB+
	WPlArV1HhkdgIxJ6o5BH5VH5nyfwNSApc8jQW0Oz4rKaKrBxOkgFqqHrkgZv43ECnn1cv/IFQqOo/
	tMU1WAo6yogUPa6BgRTzV+TH5+qRPb9ItVz9WTH0Bb3uiW+8hQnSSiHWdP34u80evmnwq5QqE1mzX
	wXYJpLp0/F0qMULrk82A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmOI-000000038Y7-2rNH;
	Tue, 11 Feb 2025 09:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmMH-000000038MB-1sdo
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 09:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=; b=fu1+6zXO4mmsxb3j1cwWylJqfn
	nvoodACw5iuCBvvJWtNEwCHFoa7zlr6b4QXbV9vM0I6xoAAi0Wds6Pt9+ADXgb1dxFnmU4v15Ckby
	uxqCizwwNy5X3JEZ8b95fXx0AxH23liLAzGp2DzQVvaf7adSUhDF6RqV/0dpsk65HFBKSWwPWTw3Y
	P8WTLOQX1CgRbv+cEjeL0iqM1SICqIo+Dp4/m3RFbbQWfWB3Ek/uAgmdaxRffY6uhkJAvsYaMf+2X
	RnCJ2+F6QsyB6iSlxWWmYMwNUXLaP6t7DBq6vzBI5ylmk7mbNSO9OxAWRTq4USvOCBwnbd9oj6IP1
	+viIgjMQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thmME-00000000XQM-0dps
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 09:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739265304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=;
	b=Uem9LCJS6IaLGe1i2sObcgRN+w0CbCsXcTW9aMjJem4hr57ecEuf9ALCfUqqd5EpCWrZMm
	F2DXvYmTogVOucBEb40gLjaHqlw5Ggk6tLnOeUL5+Vw+h9llYt5V6Z3dwezqaweRmh9FEh
	/nf1PexieNpkun7Y+P12RIbPGMiaqlQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739265304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=;
	b=Uem9LCJS6IaLGe1i2sObcgRN+w0CbCsXcTW9aMjJem4hr57ecEuf9ALCfUqqd5EpCWrZMm
	F2DXvYmTogVOucBEb40gLjaHqlw5Ggk6tLnOeUL5+Vw+h9llYt5V6Z3dwezqaweRmh9FEh
	/nf1PexieNpkun7Y+P12RIbPGMiaqlQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-587bxcVeNB2iyZSzC7DWJA-1; Tue, 11 Feb 2025 04:15:03 -0500
X-MC-Unique: 587bxcVeNB2iyZSzC7DWJA-1
X-Mimecast-MFC-AGG-ID: 587bxcVeNB2iyZSzC7DWJA
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38dda790cfbso1774903f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 01:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739265302; x=1739870102;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E1CgnQdw1MTcf+E2KOk8fQeB+zJoMsB5cCPEscDizr0=;
        b=IHTN1Pu5ixmCuO6/thrW91SXWgKCIWDp5j9JJOASym6gt4Vu12idrXqoqX46yxCvtE
         mR5U4hRS32YamiJuhDr+Aryxfvf2Qd7L544IKZ8kxY4qqWekjuY4qa8JzuLSZ5/rWYj8
         1vtmMiNNax158EVjsyoW3brahgJrgcNs8t7Hzaf/VWkIV/4+5XXYjO6fl15x4/jD3rJa
         QjIYSA8qsabUdU3CYSwcuZ5QAK6D4TV/ItxR8eH1BVdqBevJrsHz2BdxazXX1nOGCQZ/
         gBGI6RDO0+PJ9S9Ps7pgijGG0HycPnq6XuDTilFOaEWCVgDTQJEaN8ED7YVvRkE+mEFp
         KxIw==
X-Forwarded-Encrypted: i=1; AJvYcCXH8ZP7TCwIPM/ingb14hSB8qiVsaeizpCc3X3xDYzfvMtoq2sYeamgLwOjQWfvwvGQrMHLh90TUvVMmS6coAfT@lists.infradead.org
X-Gm-Message-State: AOJu0YzmYABqbmh1j+Ffuoh6qPmN3jG5IC0/YD3wl1UWT5N9iHdOcafs
	yfoPrPwXOYQdJm3FZZB/aNJMo5m/qH4dORKhJNG1x/Z7iKPJkw6iWnHfLPE5jx/AnIT8LPgj5pu
	Dlppa/nzFTvvfuHK0J83aT8qkZ+oWMF8IciwUFHW835mQtukE8u+FiuamjOiCOys4QLhEG8ag
X-Gm-Gg: ASbGnctCClf8qQ2Y96YjWzzIlxyHq+keiUCcpy/eAABEDrPmTzEigRMjyQFvEnw6Itx
	EIjb8d380PCGzEot9dQqUED0RUyS4nkjKJrJi/J7GxOfm6Njn7yCuDxofaNOdvy3fJnW0aQGoAa
	WUs9fJUx+CX843u7GMnDif8YsGlgiL1fabKQc8VmMgEkD4V0uIM9M1NrWiSyj1zaTTXZbL8S+5P
	yK3EW7jDGoH60c7GysiFLbEikUjww7YiteHuaBumLY/mJvhGZ0bn5akPSXT/UBQWmkQmdZDCy45
	VQOV0FilBRoRjVbOwuAAsUw0WSFk4ffGsSE7f1o=
X-Received: by 2002:a05:6000:1542:b0:38d:d0ca:fbaf with SMTP id ffacd0b85a97d-38dd0cb6ab6mr11005438f8f.18.1739265301885;
        Tue, 11 Feb 2025 01:15:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnGH0ZBSQ+Wzhz9/JFNowdyf3Qf4gToGQ631475G7TwcMk0H1baA5CMmZ0j/EuTEWFXmGQmQ==
X-Received: by 2002:a05:6000:1542:b0:38d:d0ca:fbaf with SMTP id ffacd0b85a97d-38dd0cb6ab6mr11005389f8f.18.1739265301453;
        Tue, 11 Feb 2025 01:15:01 -0800 (PST)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4d826c6sm8823110f8f.69.2025.02.11.01.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 01:15:00 -0800 (PST)
Message-ID: <34bcf011-b4ac-479c-92ce-852623e73039@redhat.com>
Date: Tue, 11 Feb 2025 10:14:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] NULL pointer dereference on ARM (AT91SAM9G25) during
 compaction
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <CAM1KZSmZ2T_riHvay+7cKEFxoPgeVpHkVFTzVVEQ1BO0cLkHEQ@mail.gmail.com>
 <Z6oxUdrVBPd5ZTEu@shell.armlinux.org.uk>
 <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <5d50d714-197f-44c0-94e0-ff70ee51e866@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lftCiR3sSXahwO38TPcLU-GbrnMkjXtCDYtKSTRgp48_1739265302
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_091506_627650_8111CE6E 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ryan Roberts <ryan.roberts@arm.com>, open list <linux-kernel@vger.kernel.org>, Hugh Dickins <hughd@google.com>, Muchun Song <muchun.song@linux.dev>, Ezra Buehler <ezra@easyb.ch>, Matthew Wilcox <willy@infradead.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, "Mike Rapoport \(Microsoft\)" <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11.02.25 04:45, Qi Zheng wrote:
> Hi Russell,
> 
> On 2025/2/11 01:03, Russell King (Oracle) wrote:
>> On Mon, Feb 10, 2025 at 05:49:38PM +0100, Ezra Buehler wrote:
>>> When running vanilla Linux 6.13 or newer (6.14-rc2) on the
>>> AT91SAM9G25-based GARDENA smart Gateway, we are seeing a NULL pointer
>>> dereference resulting in a kernel panic. The culprit seems to be commit
>>> fc9c45b71f43 ("arm: adjust_pte() usepte_offset_map_rw_nolock()").
>>> Reverting the commit apparently fixes the issue.
>>
>> The blamed commit is buggy:
>>
>> arch/arm/include/asm/tlbflush.h:
>> #define update_mmu_cache(vma, addr, ptep) \
>>           update_mmu_cache_range(NULL, vma, addr, ptep, 1)
>>
>> So vmf can be NULL. This didn't used to matter before this commit,
>> because vmf was not used by ARM's update_mmu_cache_range(). However,
>> the commit introduced a dereference of it, which now causes a NULL
>> point dereference.
>>
>> Not sure what the correct solution is, but at a guess, both:
>>
>> 	if (ptl != vmf->ptl)
>>
>> need to become:
>>
>> 	if (!vmf || ptl != vmf->ptl)
> 
> No, we can't do that, because without using split PTE locks, we would
> use shared mm->page_table_lock, which would create a deadlock.

Maybe we can simply special-case on CONFIG_SPLIT_PTE_PTLOCKS ?

if (IS_ENABLED(CONFIG_SPLIT_PTE_PTLOCKS)) {

...
}

-- 
Cheers,

David / dhildenb


