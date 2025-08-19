Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41123CA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmtWPp0yQOU5JxPYnS+WOg3Vcn1uX2+BI6vYu6deLHc=; b=U2Dzl4zalJZIWufHhD2i3IzrTT
	/QKHfYMWIluhxbwXqrOv+ghFY9SbMTYzQC5TDkY9jYHKYbpRBV26yQxzwPBpRX4uKlwam2/r8aXXV
	vLeaoePNGhFqXO5UDjDBqBqDdLIDIOYfHK90LhB2DNc8mgdngn9kaLwPdq1PUiZX/4dkttre8w6z2
	1FKgFBD52HDub2VyDVIfC44PB6YgVp3zb0JMkeOR/65VSJ4av9OLzN7xo5kiWJ60jzmZpanfeidw2
	mtFmdoIAH40m34I0G5t9dhsrRzbFeOjv6lMaLvZbG/9UYC41Nuo9k5hqn1FSFZVqDc/gRewIxjhjs
	JvrjFY0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHW4-00000009mNu-2zeF;
	Tue, 19 Aug 2025 08:16:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGyY-00000009hvJ-2lZ4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 07:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755589305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KmtWPp0yQOU5JxPYnS+WOg3Vcn1uX2+BI6vYu6deLHc=;
	b=FzPygK7ZwVc7gZOnIg83nOFRLxX/gs74HK6Yz/mf93UTQ4uR+2doaKma1FMaSkP3ownHDs
	XUlft5J250p4XRGY0c2dGE0ROr/OURRbrskg5blnI35Xn9o2MvtBbrqcjX7X38dyh/iL2g
	MF6npRUvET6TipXZNwaRg1SxswssPW0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-WSQJHIYMM_qUyuz78udWWg-1; Tue, 19 Aug 2025 03:41:44 -0400
X-MC-Unique: WSQJHIYMM_qUyuz78udWWg-1
X-Mimecast-MFC-AGG-ID: WSQJHIYMM_qUyuz78udWWg_1755589303
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b0b14daso17701055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 00:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589303; x=1756194103;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KmtWPp0yQOU5JxPYnS+WOg3Vcn1uX2+BI6vYu6deLHc=;
        b=qnYQa+qhrx7WhSgVtgxhWN6Q2NSytQeeGnNVfw2k6W01LV9mg+0gncNiRRPs/NXmGK
         e4qIoUV6j1erpavzgCGmOG0h9cwEytRhDEFggTOVf8bYoyuuA/GMp2FjExE4wzWoBV/a
         Zd5Og4+9mzAFl5mJp26hFGwhMlzYPYitqxgveEZamcLUMtL7tdxYIOCuh09Qbqv64d3Z
         bbHhXiX7taSSGPEc1L8CTvCJjjSyK+OVc4dVtiilIBp72Bfh0267gHQejK8nHTIvqLJC
         MiL99n7kJT2F2aMQCplLx9O3lRTKZlsGHFR0wI2VeGUhNmJtRh+A2E/EnOgBKPwUfN51
         LhCg==
X-Forwarded-Encrypted: i=1; AJvYcCXv+7XzGWTIvKq1zw8YP+pinvhKaaC9Ghoca9DpjB4fA1C6aDxCCwRdbQdvR6Af6g7jBupiO6ST1ohAk7I8E346@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3vdtIB8dcsUiPivYsoxAG22FUi0lS2aZ9vj3/R97bqGY7rSYM
	ddu3mNBz8kEFGNlbFj0gVlJxlEY+Krv/yThxqNQpUznmOEuJd/LQKKetzJiRGUlpvoE69W6IeGt
	7HenJrNo5sPuZtoRJ8r+A5IzJJz3yDm3RJVe7hsNKF5wXMBozAb9+MaURaDWYJvu6NJbEekNwhO
	t5
X-Gm-Gg: ASbGncv+Ddyyrb4W308o742keDVstJv+dQVz03WQ1odIvz8LBtc4km+hHR+zwAH+CV6
	6yWr2Za2/uRXAhnGyKw+3u/ZQ6XZJ2m6l3V65sYxvqbEWuynYXF2XrjMMQy1wHrYjS4D4U/XWH1
	XOmzTVTvVyzRRu4GUKE1xkc3BY4LVKYli9KCXRXKZLVVktemcfZwH38gwwG7wcoaaTayOzaodeZ
	WpSKl9A8wwXmS6EocoPyh8BCKNAx6AV2QGFXqT9SC+xT9hKxrTr3ZTU+a/aTwCPxLZ4rqHVmrRw
	TS53fdJ8ZcbnnEpV9WcnCAaDcl/BqymAHsvgf27mHchLw2O2fDA+jhiMYDBqwqiFkryoxxr220o
	I89Hw+KKUp3knwP0/n9Svo1WAShvDzkiD5qQ077AiL2BTL5N35nzedGqF5g2DJ4eQz30=
X-Received: by 2002:a05:600c:3144:b0:456:2212:46b8 with SMTP id 5b1f17b1804b1-45b43e0bfbcmr8695335e9.28.1755589302929;
        Tue, 19 Aug 2025 00:41:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG35zJviGwvUkWVod6LeZhZp4n0OP2P4yeQ5cLqpahPhuo+I3q3qEllQ2PjejXopYNiv09LgQ==
X-Received: by 2002:a05:600c:3144:b0:456:2212:46b8 with SMTP id 5b1f17b1804b1-45b43e0bfbcmr8695065e9.28.1755589302398;
        Tue, 19 Aug 2025 00:41:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f07:8700:71be:5385:87b8:5a98? (p200300d82f07870071be538587b85a98.dip0.t-ipconnect.de. [2003:d8:2f07:8700:71be:5385:87b8:5a98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c61a66esm201863575e9.0.2025.08.19.00.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:41:41 -0700 (PDT)
Message-ID: <4289fc02-8e09-4d33-a4a1-0e4b268b008c@redhat.com>
Date: Tue, 19 Aug 2025 09:41:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/mm: Update create_kpti_ng_temp_pgd() to handle
 pgtable_alloc failure
To: Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>,
 Yang Shi <yang@os.amperecomputing.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>, Joey Gouly <joey.gouly@arm.com>
References: <20250813145607.1612234-1-chaitanyas.prakash@arm.com>
 <20250813145607.1612234-3-chaitanyas.prakash@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250813145607.1612234-3-chaitanyas.prakash@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fsIGkklAaNWWtkkoLVjmqH60_eBXzO9x1M5WKtJUY1M_1755589303
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_004146_784861_8C5D0846 
X-CRM114-Status: UNSURE (   9.74  )
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

On 13.08.25 16:56, Chaitanya S Prakash wrote:
> create_kpti_ng_temp_pgd() was created as an alias for void returning
> __create_pgd_mapping_locked() and relied on pgtable_alloc() to BUG_ON()
> if an allocation failure occurred. But as __create_pgd_mapping_locked()
> has been updated as a part of the error propagation patch to return a
> non-void value, update create_kpti_ng_temp_pgd() to act as a wrapper
> around __create_pgd_mapping_locked() and BUG_ON() on ret being a non
> zero value.

If  my memory serves me right, panic() is preferred in such unexpected 
early-boot scenarios (BUG_ON is frowned upon), where you can actually 
print what is going wrong.


Which raises the question: could create_kpti_ng_temp_pgd() be __init? 
__kpti_install_ng_mappings(), the only caller, seems to be.

-- 
Cheers

David / dhildenb


