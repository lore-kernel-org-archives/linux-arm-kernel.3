Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 807ABC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1j7oDqmpt6ig3FSSyMnjhsns2WPQzdz62Ttg7MdUqY=; b=OlYF/AAgHom/iXCrCFGTonoIE6
	eNu2Xuzf2rttG6HhzQ6e7+GSq1qeI3IxJEwLBd4v0ZT2zvXetnZylG59kHHUAeCLfp6U78eWUe4Iy
	p6Alo2FZrscv+mVJr3pE6eqsmG5khdDvYCVc4tUamaxENVoNRJr/I+inaPl8NQ67Lk574mGg1NNUj
	bcuh96nSLynMa9lmNi2D5Di4/IH3vk3U85zXDXSu4Qe7Wm8TA1j78ac9FZDzpNwI0eDMNszBDjGKq
	1KtHEfUEpc7qetz440/RBaPczw31K3LXBbYX2sVtlG6FKS0PQCxMCMfK7gXtCnTLyKx6w83iomC8Y
	0dwTsqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yej-00000009fIy-1ebV;
	Tue, 08 Sep 2026 16:26:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yeg-00000009fI0-13HI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 16:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=t1j7oDqmpt6ig3FSSyMnjhsns2WPQzdz62Ttg7MdUqY=; b=mAn9VSM9pkeqNqQ8dK378oxu8N
	gnLK+kLcZU45r9dV/7JGlLv31sLlLEMMZaNc4Pro6jltnJ+VQt01hhRaI7duR1Jrr6PmvpsDDexq4
	tT491JjIsX+c8ZhBdfmH2YhooDWv55Yliq8sBVoG6IUU9ahoYn//5h0Gbuwz3RCGbWNbm8mAC7Jl5
	K5gMEgRS0hcXFZUoCNjLTyrQ382rA0TssMelI9DlfX1NFp+SubhMAYDacoTHCwj2FMDeRGoBdnDwc
	m1Ht4w4Hb8bv6O7s78EtSiLMpvQYwtdBLalemDHvf3aHu0f/DKgUtXhOPhzZ/udVh7Sn97dA9y55h
	ZaOf+gGA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3yed-000000005Z6-1glh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:26:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2d6d28aa26cso29872815ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788884797; x=1789489597; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1j7oDqmpt6ig3FSSyMnjhsns2WPQzdz62Ttg7MdUqY=;
        b=A9J4nGGbt0x8e6xJO1MnFvfhdFQGGMTB5UyHIrkOTUU889et6D+L28bUNbgIqy3kmE
         hdz4CqxSZbRTShi4+xxyo1HgoUbVDsA4IjAqrw0G4rEQzEsuPEimRGLmbOQKgwgXiNvg
         o85ZHZZzXgq7g5wvan+n6CbxUgIpyWQYh1ASYjmmSjjk7zpVTSYca7jOfg4E1smzX9Tp
         fuvi5n5Fo4MkjxeVw6jDAKrAGWgKhRVqiuYsEFghA5pzceN3z7D0RxtUyNRJyfUmNQdL
         NJTD4dO25fLNOXoX0U0+OtQVmYhAlsVwuZfvm5wVzxbPCxmDdeb59NkalujZgOxL8M+6
         AD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788884797; x=1789489597;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t1j7oDqmpt6ig3FSSyMnjhsns2WPQzdz62Ttg7MdUqY=;
        b=LV6WEPLQaWQtVFthbfmmiO/cDuPnC+JUbn+hKEoQNwG9kX+COgXvnA85POIhnbTlTF
         sI97R7jyCcgiiLSKkuQH722Z6jeCQI3rT3SDzHIMNngnCOPBrWSL/JXXEC7tv23G45UY
         LfZlRB81ersrpUAMfHNim76ffi/p1N+HjMJDw5S0Nr7DU+VbbmDxyIwb04nNlavFOypd
         RTFWVyT7eC0FHcduTZKepcgk9Ne/+AZ/mI+lFidqfbR6e8RQbV3l+G4i9lwd/DQ0RfUF
         bENdsqyBU0tT/bcide629H2+F4CO/pJ0/6gwJpZxTlux11T/WN3y7q9ybjsf/H+oLi5q
         f1bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOC+3Qz0msi7s3ee91CUBkB0p51LSdSMu7kA9l4OZAwP2fKFVrw/drSRv3du/QDNV9fRMEDYMXRKh9SosmNJin@lists.infradead.org
X-Gm-Message-State: AFuF++nFqlvHYHjslJyvgZpu0nEqA+HL2NO/eduX22/ObehmqZC1Rqzn
	Vujxh8VIf0eZFr3DHrl6EzNx+o3bdNVEZYVICZh8E6UM2ok7o+u2JepZ
X-Gm-Gg: AYBFou2WSrQKimVFe3Tp1mHibTuA12uWVOqADSBktIP/ETCJ847exnrTuUzlMf7otkb
	sscvvT5ufWmJAqKB1yvc/WJfy7UD94cYjKMDrAg/kVvMNt1cw1mfPEGNinFUFwzb7oi07ul4mUI
	jMpTjRkkXtfGA+jRU9R+Xt7R5+A353xsWw3jdoI/sbv6yzKu5X5PhG4KDOusgumChop1uNEgdbD
	wmKocK7b7ZKlVmxlo7K+ZVsZ9/ePmoGv/WyYxX7OMM1TfP1fPah4PKyZgbbUVJU82w1fURC3a4P
	Y/bCDsqnxx1kvOWr2ShC49Cf+RNZ4ac5xcM2IPHvKksVsMzLGlMQ3cBg6As4gc/UWeU9KBJ9t67
	Vs1P0VuM9QTNqRH1qHC2ubwWRAyQEybJUshW9MhssjUS5F/G3zGng2PqV7XPc/qgx89m4cIe4YB
	l5NFsQlEHhuBmfdtEnys5WObIvXynbdarHjHpuzxKW2T1tDX+2XWk/fkfqFN5yGAhm+ZYCcj/xq
	RhU09oBm1qS9ayKa7AIwvlO00FKvHCzVacGoX5nhwuF3/HS
X-Received: by 2002:a17:90a:c10e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-39b2622b3afmr42130719a91.18.1788884796952;
        Tue, 08 Sep 2026 09:26:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccc72fsm12862374a91.2.2026.09.08.09.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 09:26:36 -0700 (PDT)
Message-ID: <57763383-2829-4aa0-9623-e6afe79fc022@roeck-us.net>
Date: Tue, 8 Sep 2026 09:26:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-2-arnd@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_172639_614631_D5A828F7 
X-CRM114-Status: GOOD (  11.52  )
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

On 9/8/26 08:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most sa1100 platforms were removed a few years, with the remaining
> ones left as a starting point for a conversion to devicetree.
> 
> Nothing ever happened on that front, so remove the rest now,
> including the sa1111 and locomo drivers that were once shared
> with pxa but are already sa1100-exclusive now.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
Acked-by: Guenter Roeck <linux@roeck-us.net>


