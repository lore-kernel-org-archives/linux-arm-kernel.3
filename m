Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B6FC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 19:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTEgaa8AfTn9SY7IS6TOk5GiogYDzLZmF/+yhRD61cE=; b=JOhja9OVHc6Q7n8trf8vKTUSpF
	/iAL5lDeldy06ricRTVkGQUIMPuXTXcKvVSvkRg4pmeu6VAsufx0B7o3EB1mDUVHOOmXnP8KAcjwf
	SBNYmpRmZHHYsFTDIUzBhd1WG5BMblAxgFIyAdRGBPqYnEZKQtUyQADGdmLDmt5Isn6miQWRBz4zq
	QQT7hcbv/NyhEWZAYoMvSsWSaJexXmeD5CHVemwRmuKIyY8UyOyu3Z3Ptjtyy4wopERc7OMJg8FoB
	wMdKjuRU20qU0gLhlOszbk74xak3lsMDt8fVOznGxEVj7PV24K23l6x8VsaCHQZVOxCy1u8NPALXM
	sGB54GVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGjQT-00000007SMI-4Bl3;
	Sun, 18 May 2025 19:11:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGjOS-00000007S10-1WeK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 19:09:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-231f5a7baa2so12859075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 12:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747595391; x=1748200191; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PTEgaa8AfTn9SY7IS6TOk5GiogYDzLZmF/+yhRD61cE=;
        b=l2OUAWlX/MRdOCo9x1GmELoOnsg10PAdGqopNd5EDiN2S9PFsEaZvJhoXMcSgAB1Hv
         1uTQG2k3iMfkp58zcHZTxg1IUWMA5De6ZEQmyqR9kfMCF6BBOD5hR8bHHH4NGFxiweuT
         01zRzITa5SUKzQVfPq7DXNitlaC3sKfw/Zp/8ThU/P1oLc2WBu2rVjWosIj/gophIQXK
         PSxdyT6XMaeDkUXohgr965G6wJJwOy9tN93eyWLrBXQ4+zrkfAuD/i6kPKbjk/2XKqzB
         8pkfz9xsFpj6iQYPhgabYYY/AesUWye6f3JqFHCuKPf7ksto/8EVKbLbN0lSlydE/aWM
         rigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747595391; x=1748200191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTEgaa8AfTn9SY7IS6TOk5GiogYDzLZmF/+yhRD61cE=;
        b=k/WSDwKsHexD8HmnJnSoLsugbO7SWA9AXpu7xePBS3JF40R7EyuR/pHBxyFw9awWJ5
         milmYKMC+eHQ2NV7U6w0pYOkPUbwWvQ50I+/CkZpFJZQ+e7x/EUhpM5fteg9KjATSH09
         hOCtpeqFg/0wwRuSxWMDUsWIBf6mchjMWiOBJu0aeKt3A6pG8MoYRMhSyQuFfTKnlZSI
         3ahPRfUI6qrghiIGFBLWUHfIhFn0pYORH58FNfjDa/jhs6veCVYzHv9lw2zAmWHStToP
         G2KpqDSsSHAFO1cPPtUYfsXPZPvPdyoUBMPlkQdGE+NzMh7imopg6KBR2+TyFNwF011R
         WsNw==
X-Forwarded-Encrypted: i=1; AJvYcCVa8Y0MwAPZbedaUdLYXLmDZ4DX7lky0AnLyLG2YFUMvrwj19OxVwy8NptoJa9zDTsvwybAQG9+ZVFKiyXrAfVU@lists.infradead.org
X-Gm-Message-State: AOJu0YyCYkGBvbWbi/XNyDKvTfWr63LSvMCiGH7XJWW1yXmDovyfSLXS
	RJs+ka4TGwXZHjoF2d25kupn39ocCMQvcqV08RBO7kLRftrcszsP7+WL
X-Gm-Gg: ASbGncshGysrpFn5C8J5ripOIF2s48go/0aNfT6/xs8IMLErzUGfez9eqH3A9F+WvTn
	np0RUPMCvW1MBQV1DKKbLbOIx/5/t1NZZNdxECz/OeNrWF0DNnyBfdonT77HViQRFe9geJ+ZjJ1
	ZaBYa3UIonr/EseaY0T9XwEiks+eviKzMeqbGJbBkLl/I6UNLSSGjT1+OIaOp5PPkKNvOEZBMer
	eROKVGM1bMGu5cxAtm9TLGHb2SIIaF2/IQKzqt0EslkMei/7ChtyMJmLxAwNZdSvfouQKvh390+
	/JpjVNpIjTlEA/e39+5URbUoVk85cG1N37MuQcrvI9EbdymTO74rR0mCCVVBGKZk4DYDeImr1eI
	fu5tinAu9BBKqBpI5p2JhQbx0
X-Google-Smtp-Source: AGHT+IGPDNiWNYkiywfn60pLWkX0RPMqp1e5yQwNH4E/XZwRWgli0Zx4HgV/6FPN9PVG3zH7WYQiQQ==
X-Received: by 2002:a17:903:1ca:b0:221:78a1:27fb with SMTP id d9443c01a7336-231d438a223mr152220045ad.11.1747595391367;
        Sun, 18 May 2025 12:09:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebbab6sm46367225ad.205.2025.05.18.12.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 12:09:50 -0700 (PDT)
Message-ID: <479ff23a-38eb-4861-823a-35ebbd748cd0@roeck-us.net>
Date: Sun, 18 May 2025 12:09:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250518164118.3859567-1-linux@roeck-us.net>
 <aCodQZoA5KI9WyLB@shell.armlinux.org.uk>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <aCodQZoA5KI9WyLB@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_120952_406152_C7C53CBC 
X-CRM114-Status: GOOD (  15.54  )
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

On 5/18/25 10:47, Russell King (Oracle) wrote:
> On Sun, May 18, 2025 at 09:41:18AM -0700, Guenter Roeck wrote:
>> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
>> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
>> which in turn calls of_syscon_register. This function allocates memory.
>> Since the memory management code has not been initialized at that time,
>> the call always fails. It either returns -ENOMEM or crashes as follows.
> 
> Yet I see no thought whether having the scheduler see sched_clock()
> suddenly change is a good idea or not. The point of the initialisation
> being early is to avoid a jump in the scheduler clock.
> 
> So, was the commit you're trying to fix a good idea after all?
> 
> That question at least needs to be considered, rather than just moving
> stuff like this later.
>

Absolutely. Just consider this to be a bug report with a proposed fix.

Thanks,
Guenter


