Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A1DC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV+9b+/x+gelznBEtZ/wkU6VCh9E1FOzg+skZ59VIBg=; b=g+AihO/lY/Yfua5qE5b+8IgJoD
	jsnkJ+NLVxC1tRMsfaGoS2OCFfeR8QOrGyF9m0GBQPotCmh9s9pzhLfGK9lT6VvyUGjaDBNG8kKLG
	fcqrcCWWw54RpqAVk4D7/Lw9XYAlH5DWKxYPbHxR58gbGgm0lWk42r88R/U+A/4JwgyzJG8fFNNLG
	j4864awJESslJrqq2dKGqWGaj57p7iJzvHi7IiyDZYoUicsJsBTAFgwn4ZGwNQUeCGO3jCfi13YrD
	A8pPnQHjDiUdIxFqnTm10rNxgNpUVl1AQ2F2m0w8bwGI1ZN7Qf9gnlui7AjKkwX+vjvjUsU3bO62D
	LgqZph6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IjQ-00000008hk5-1ZGO;
	Thu, 03 Apr 2025 11:27:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Ihb-00000008hU5-2IKm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 11:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743679541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hV+9b+/x+gelznBEtZ/wkU6VCh9E1FOzg+skZ59VIBg=;
	b=JY1qEhZqJdMw4b50IC/n7FCor5CJplCdWwwNvA/QRekEf2y0cPMYcGE646ffRSpwLnBAWA
	FC6r3YvxWusY44MLFnmTu06NOR0ByGVTP3e2uIypuScNQmMY713GNTlfKo9dRgceYlqJYo
	WUKSlvXngeFldcaLtjnVAp+kIQn+pGM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-y9CRyuJzNAKQrc0wmR7Kzw-1; Thu, 03 Apr 2025 07:25:38 -0400
X-MC-Unique: y9CRyuJzNAKQrc0wmR7Kzw-1
X-Mimecast-MFC-AGG-ID: y9CRyuJzNAKQrc0wmR7Kzw_1743679537
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39123912ff0so362193f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 04:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679537; x=1744284337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV+9b+/x+gelznBEtZ/wkU6VCh9E1FOzg+skZ59VIBg=;
        b=GjK60TOuQnjJLGlxXQDEWLLydG/WtzkZeX0o03a2mi/e31W9mfxh947JtvnW9hTfGj
         7GpzzqEkzeLFP45wWllStffOnf8WGAjYyihr3vbx3i/k6Q4nMevAWGwikJBmp96k8qLf
         Ev8cvAWybYz/kPdvxrFHhPTAx+vLFIH0qIQ9Q9Qgb+1GHJGp4C3GpcRkh6LmzsZ/76Y+
         d+hKcG8u4hCnAmS1OVdsWsMcVw4qQRLOKttaqdOaa3QtfqU1YUDB5RGxvy5CLJoNX7pt
         1410sm3aS5Cm4oHB8PXU7IYHt6IanMNKg2b5ch60u1/0nzERlM2Cm2iItWgF6rFLqoJA
         DX6g==
X-Forwarded-Encrypted: i=1; AJvYcCWEYKdNcdSY8u46rPehw+sjhjQX3HGH6dwaqfinSKd8BeYwMS9kHTnIPDNgacXl5SqO+VpZP3XhM8y8cgtgVNB4@lists.infradead.org
X-Gm-Message-State: AOJu0YzXiCDXvkvu6yeQUx1z1ZLrnl46DN+vHculJVTAZWqGSoXA7L24
	N0t1Lk2aMLfZVVs0qdIu4blKtw40nCmuSfUeEoZliJPZly93ZXne9yg8wnoFDa2kzY7bqEYpeBG
	pWiIE5QBgg/CAT7jnzk54hcUiAl2xCJnbGOYg3LZkzNKqRrn0JnIUcKPuQDvvOWeinQ3ncKIQ
X-Gm-Gg: ASbGnctCcjHKcIf9pS2OZv7GUl0ZSNFLLouq+ZAosgg7lWYXATalupQ8UNhGAI9vV7G
	cgxPIoUBwsHTVqsQnQb3fvlHRPSAQFM9Mfe90/MFlQzVyRn9Cqx2hCeerR2QveahNLB8YhHgTC+
	/pNSosyledTk5L8ze1X8jnsduXg16yBOIElUTvaQXhkk1CjFV3MfOvJtHmhKLpVVaZ7O+zGxrNV
	ibm4xqfEIdpblf3rkRsZZmg8kgEn5Shvsg/RnwGQ5zRD22xIbJ35LHmd1NLLBqs/mz3v6B4VJ1C
	rxMrHNdYQQDWdBOjs6g3N/Wuurqm6JH7FuaAMeeaSqoeeA==
X-Received: by 2002:a5d:598d:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39c120dc668mr18372140f8f.17.1743679536893;
        Thu, 03 Apr 2025 04:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgUyiwXd0iBaKJMkSQX6B1609ESCGRfex5vbqPGGdlcsOk42Ie119Ej9VIa8cCmWscFQJXiA==
X-Received: by 2002:a5d:598d:0:b0:391:3b70:2dab with SMTP id ffacd0b85a97d-39c120dc668mr18372105f8f.17.1743679536479;
        Thu, 03 Apr 2025 04:25:36 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b3572sm18994295e9.39.2025.04.03.04.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 04:25:35 -0700 (PDT)
Message-ID: <469fd8d0-c72e-4ca6-87a9-2f42b180276b@redhat.com>
Date: Thu, 3 Apr 2025 13:25:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible NULL pointer
 dereference for perout request
To: "Malladi, Meghana" <m-malladi@ti.com>, Roger Quadros <rogerq@kernel.org>,
 dan.carpenter@linaro.org, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 namcao@linutronix.de, javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
 horms@kernel.org, jacob.e.keller@intel.com, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-4-m-malladi@ti.com>
 <0fb67fc2-4915-49af-aa20-8bdc9bed4226@kernel.org>
 <b0a099a6-33b2-49f9-9af7-580c60b98f55@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <b0a099a6-33b2-49f9-9af7-580c60b98f55@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zfGuzTKXFRArNhUnoihdKtp0fm0dJCnH4UCVZJDlAWM_1743679537
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_042543_665120_32BBC5BD 
X-CRM114-Status: GOOD (  18.20  )
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

On 4/2/25 2:37 PM, Malladi, Meghana wrote:
> On 4/2/2025 5:58 PM, Roger Quadros wrote:
>> On 28/03/2025 12:24, Meghana Malladi wrote:
>>> ICSS IEP driver has flags to check if perout or pps has been enabled
>>> at any given point of time. Whenever there is request to enable or
>>> disable the signal, the driver first checks its enabled or disabled
>>> and acts accordingly.
>>>
>>> After bringing the interface down and up, calling PPS/perout enable
>>> doesn't work as the driver believes PPS is already enabled,
>>
>> How? aren't we calling icss_iep_pps_enable(iep, false)?
>> wouldn't this disable the IEP and clear the iep->pps_enabled flag?
>>
> 
> The whole purpose of calling icss_iep_pps_enable(iep, false) is to clear 
> iep->pps_enabled flag, because if this flag is not cleared it hinders 
> generating new pps signal (with the newly loaded firmware) once any of 
> the interfaces are up (check icss_iep_perout_enable()), so instead of 
> calling icss_iep_pps_enable(iep, false) I am just clearing the 
> iep->pps_enabled flag.

IDK what Roger thinks, but the above is not clear to me. I read it as
you are stating that icss_iep_pps_enable() indeed clears the flag, so i
don't see/follow the reasoning behind this change.

Skimmir over the code, icss_iep_pps_enable() could indeed avoid clearing
the flag under some circumstances is that the reason?

Possibly a more describing commit message would help.

>> And, what if you brought 2 interfaces of the same ICSS instances up
>> but put only 1 interface down and up?
>>
> 
> Then the flag need not be disabled if only one interface is brought down 
> because the IEP is still alive and all the IEP configuration (including 
> pps/perout) is still valid.

I read the above as stating this fix is not correct in such scenario,
leading to the wrong final state.

I think it would be better to either give a better reasoning about this
change in the commit message or refactor it to handle even such scenario,

Thanks,

Paolo


