Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551E0C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 11:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=; b=4KSrGGjQHeY2vdl+otK2/sTMIX
	O5jz5B5KaIBBo+rn+VhkCO2hMlbYXUdbLkpJIzlY2nOc/MSun1iJ5Ej1lVhToagcGCrsIhFi0x1wa
	KB/5i23hK1NTPI22gLvxK0sxl/qDAxF8IwUxVrQ+XBBsFwy0Ccl3JAvHKczwS9wgEZXFCfQ1C15z/
	YMUB9tpcqyV/WashRYTuNIC08ykBEMQzYHEKWMBcRU5QdhDayWJVPyDVUimMBH0OlJ4d+I9qE3Pjp
	FKpKzyzoQiQTlMAM2Ja+olNhn9nYJlMDmADM+R5wPPh22KePzbtcoR7Ur4S9aqtbDxEVj3eAiFvRY
	FD8ARz2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7e5-0000000EYkl-4AfX;
	Fri, 27 Jun 2025 11:53:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7Y5-0000000EXmJ-0uSw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 11:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=;
	b=SsDe/Q8XNOL03O88/3X09DgW/vMb2uctDYxLNhRpxSlOB2Q0e73KWYuxOG8+oBwBJxNRlJ
	fJ9XM2XDJoGe6yW9EezLrDHRgSfeIRgf028f7gbPpzEqTPrTjFsb5jMhNxccO+BwvICwZc
	Z8FN+UWBAAE9QdckH2/Qxs8UHglv9VE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-0sGD4wJFNnmqDHMMSbkmXQ-1; Fri, 27 Jun 2025 07:47:12 -0400
X-MC-Unique: 0sGD4wJFNnmqDHMMSbkmXQ-1
X-Mimecast-MFC-AGG-ID: 0sGD4wJFNnmqDHMMSbkmXQ_1751024832
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4538f375e86so5439725e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 04:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024831; x=1751629631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XjX+hBaXMJwj3R/v9FBA0Weiar4fLlGU7PJj1VBqjqI=;
        b=UHOVGx8Vvmf/rShsFUCrvVJgKXOTYjwUJqw6c9fllCyzYO2jM2CnF7jPbuX2RcAquh
         P+CtsoQZh9UDXHI+fYy5ulVWOe6QKFfUiTQQGmos2M0F5xHTxkHHm/J6uWKulO+JVndE
         +TMH5NlX7hj4hSpo2uFQMe5OQ+dOX1cbg81M4rp7lcAgvhJjukDztGrzdUup9zriG1Db
         n3g3jm3tPXw7OWKLCCB0sOhHV3EZUEvW0gHfwyVZmfOi5pJ56v3Y88Aetv5N6VYgA/5L
         xSsoI3gSQX1DrbBHJ1z2AXlZbSS7RE3jdxTH4v/msT0E9M+yGxIvoos+zL4J1AmK5QYG
         Q5+g==
X-Forwarded-Encrypted: i=1; AJvYcCXJkNxI6/Oh5+4e+eODRv6LqzIlKIW0iUqgIWJzdM7H3zXoJDLMLOqtaV+hfFV2UHlKokiy1JR4BF0o/v0rWWFE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgy7occi1MkulUJm4BNzBO2uP1ylI+DmBZqETG412TFPRlP4xi
	zIYZ4JZODvnjGcAdPvhldqsUIk69MhHnOSJwxNwiyTVxcD5vkKSftSWWD4ZrkoyHtds1mJ8C3AH
	WA5Wq9/oNgjtpYORyz69VgKPBFbE/V8Cs3HPYkeqMoj/TIatXgkg8Up6455zaplCxs0ON6RmmJU
	gc
X-Gm-Gg: ASbGncvmdcAFWZ6DWlP1Q8g31fag+cP7+XA5JjzyxEUId/cZTGlQlPLVh4nPwPqrSg0
	gUNKfEi0x4aZZwZ7XARW20dV6CwARnuKcAEjSsWowrNUVwm5OcI4R8csg1TcLTDUzwB5W1h/kKc
	KqW5aVMiZcByfVBwMXZlzT4dj5+ztxwsX7EmCmj8xPyAF3lbxs1VIzeiwKarBwtrnRMPdHVeR4h
	ynuDbcSg0dhZmRzsUBufqbuzN6xQisZx8t1ohVG561Vqqfzo22sDOuKuQOzmRdTUqcAJgO3iYQZ
	2rBbJDIsEEUW0sKA++vMF5m0F5ez/eG2wD6LfLYXDFOhDPPkkkVm1s6nl8VGMQ==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4538ee15b9cmr28114275e9.6.1751024831598;
        Fri, 27 Jun 2025 04:47:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL1rcgj8WhmZRm4aQKNgi4lgSW/cEGWUMdJSQbENUhm47d/UZivhsYn/wnlHMWu5iFMWgHIA==
X-Received: by 2002:a05:600c:1910:b0:43c:ec0a:ddfd with SMTP id 5b1f17b1804b1-4538ee15b9cmr28113965e9.6.1751024831098;
        Fri, 27 Jun 2025 04:47:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59736sm2475960f8f.74.2025.06.27.04.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:47:10 -0700 (PDT)
Message-ID: <bc7efb62-11ec-4fbb-a911-24cc943a9968@redhat.com>
Date: Fri, 27 Jun 2025 13:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAH5fLgimktQmU6d24o3QVDBX90OD5E4wdnvLoNhk_gtpbUhXMA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jl7aSF6b7b1A_GI3yzWcwtRGBK1mwQSWoqqkbpCDrrc_1751024832
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_044717_323235_8A17BB4D 
X-CRM114-Status: GOOD (  24.30  )
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

On 27/06/2025 13:36, Alice Ryhl wrote:
> On Fri, Jun 27, 2025 at 11:41 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> On 32bits ARM, u64 divided by a constant is not optimized to a
>> multiply by inverse by the compiler [1].
>> So do the multiply by inverse explicitly for this architecture.
>>
>> Link: https://github.com/llvm/llvm-project/issues/37280 [1]
>> Reported-by: Andrei Lalaev <andrey.lalaev@gmail.com>
>> Closes: https://lore.kernel.org/dri-devel/c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com/
>> Fixes: 675008f196ca ("drm/panic: Use a decimal fifo to avoid u64 by u64 divide")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Not to block this change, but I think this really ought to be fixed in
> the compiler. We should not have to do this kind of thing to divide by
> 10.

I agree, I didn't expect that would be a problem. But I'm not a compiler 
expert, and it will probably take time to update the compiler, so we 
have to do this at least temporary.
> 
>>   drivers/gpu/drm/drm_panic_qr.rs | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> index dd55b1cb764d..82acecd505d3 100644
>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -381,6 +381,24 @@ struct DecFifo {
>>       len: usize,
>>   }
>>
>> +/// On arm32 architecture, dividing an u64 by a constant will generate a call
>> +/// to __aeabi_uldivmod which is not present in the kernel.
>> +/// So use the multiply by inverse method for this architecture.
>> +#[cfg(target_arch = "arm")]
>> +fn div10(val: u64) -> u64
>> +{
> 
> Please run rustfmt on your patch.

sorry, I will fix that.
> 
>> +    let val_h = val >> 32;
>> +    let val_l = val & 0xFFFFFFFF;
>> +    let b_h: u64 = 0x66666666;
>> +    let b_l: u64 = 0x66666667;
>> +
>> +    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
>> +    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
>> +    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
>> +
>> +    tmp3 >> 2
>> +}
>> +
>>   impl DecFifo {
>>       fn push(&mut self, data: u64, len: usize) {
>>           let mut chunk = data;
>> @@ -389,7 +407,11 @@ fn push(&mut self, data: u64, len: usize) {
>>           }
>>           for i in 0..len {
>>               self.decimals[i] = (chunk % 10) as u8;
>> -            chunk /= 10;
>> +            if cfg!(target_arch = "arm") {
>> +                chunk = div10(chunk);
>> +            } else {
>> +                chunk /= 10;
>> +            }
> 
> I would get rid of this conditional and declare another div10 function
> that just does input/10 on other arches.

ok, I will send a v2 shortly with that changed.
> 
> Alice
> 


