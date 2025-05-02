Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988CCC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 12:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=; b=xNoPfs72rp9LkU+35WN1SJLLVM
	DP7XAHkvKYi5I2Fn/3F5g/Fo2LLBp3m0VZCmGXsHNk7YCJ5MiXkCB4cSPB5NXpC8BoxUhcy+zECZa
	cx9ABoluhVSnS3mV1I3PUWU8Fsgf/te/QDaMViVH8JKJF2rL15ZoPOXs3uq1YiyZMLdv5S5oWykaa
	ZPsPfisUsO3OWFg797P0I7+JjzeJJv5FOzcK7WFiAG34M02MgtvI6GIzTmVT9Bw4HWvvA6ceN6o9V
	lPkg/wObD/nyTd3G/km6aQAlVq9rgyj6cpUohrvxlpLe8sc3OxELQ1JMDLty95aO1EMe+BTi8+ijV
	EmpODl1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApWA-00000001uWV-1a9r;
	Fri, 02 May 2025 12:29:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApQx-00000001tlJ-0JZu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 12:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746188640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=;
	b=ccDNO2HJY3TjKrByEsWF4GXzuXyFimECKibNL7nxp6/Tf4KRjwLyiiRxMU/JbNjax3iZtr
	wN6ATDhc0nlw7U3vQGx5tLCwun7m+405tkYKB/Ov8L3n3cjhC2hc3wRZvNCbaObgyEaN36
	vNpVnbhnJttLH66zV7QJZQf+o7fGzOE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-AgQ8nvxBOjuAU6sbpkzOeQ-1; Fri, 02 May 2025 08:23:58 -0400
X-MC-Unique: AgQ8nvxBOjuAU6sbpkzOeQ-1
X-Mimecast-MFC-AGG-ID: AgQ8nvxBOjuAU6sbpkzOeQ_1746188637
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-44059976a1fso8917825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 05:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188637; x=1746793437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=;
        b=UgNyTrZGp1ELc04fm1LRWBUjSOPz96qMxh/ouJ/Plt2p5DGsgYWw/Fqt2A3wMEtAbr
         NPKgs1c6jyAP8rYmPHfAZqjE+Om/0kPIyrXUF4Hp4eoINe0I97Y2dIaJaJfS/7UVGKty
         oGmVvN56yaS+JirRdcnxTKHdQzQEXUhl6VKuGIZAF0jjM+MzaUmiKzqMAQEjNIJm1b3Q
         8LKkZUDIbOnU7ueV+ahvvwqmvd1k1ffX7W4hB/T0sax9P3PhzysUIPQS8/gFtTjRbosj
         pTIZj/kBPmbNdVbhcBN5tGyDLVZLMDuCNLdrpeVIhhnwhpSWrHavXmVBQh8WlBFDZa8a
         z+zA==
X-Forwarded-Encrypted: i=1; AJvYcCUElmDD48ZInQHP+Xz1yaLAygSUuHUnUhNtU2o1iLT36yu7fLo7vDK4XkeVDICevED2ajnenQw7EL3RxulYjVb2@lists.infradead.org
X-Gm-Message-State: AOJu0YyK+5uhMqsF3f49N0B1VSEGhp/pk0Jx2MTTGXhHYEJDOFee+9rZ
	hiOM52tr7Alc5hV24giIp9Z8up7ig9UTrgvZgLTU2xnYkAt8oDkVyh2dAI37ViXWk7ZbacjZLfJ
	vUIOrlc12osAyi/wsgedS+FerzwatuPxDoXtAIDX4ZWyPwlOcXL2I3D1bah4vF2bMJV4icx+8
X-Gm-Gg: ASbGncvr0MBntauQVJQGgavnGdk/n89ac3qxnrus4ibtswajUV6Kt+iwowejJjUxU1l
	8mFuPFaJeBvd4Hi/mt9NyuyHZYk0BPdRMZq4jyR7VE1FHvMxdK4ajLcMKB8jODswjumlrmzo4Zf
	anFEzG6j0rL9yy1CB7x9jMlJxy6KvHHuBcwTjeRaCuEtdqhEwei975UVKaFeUb87dFE9lcj/W5u
	r5pvHfhFa5TU1EdYQ+fshj381OajYmJ7ag+9yHRAu/XctgYK8zv+pREdofaYA6ITG/88/EFkRFN
	e99Imaf9pKkO2007qm6ClO56G1nh2Y0LCU+dU42zJ7ZToVuobFc=
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr18719515e9.26.1746188637014;
        Fri, 02 May 2025 05:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtBSWT/9rJ58YwwQsHRZD3aEJKNHkUCm3Vq3qVD5xLR8Kf9BbRNg4RYaf53PhVsYbqWhK/OA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr18719135e9.26.1746188636561;
        Fri, 02 May 2025 05:23:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28718sm89479975e9.36.2025.05.02.05.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:23:56 -0700 (PDT)
Message-ID: <847a72c8-ea80-4aaa-b439-ab7649dcebd0@redhat.com>
Date: Fri, 2 May 2025 14:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250418165059.560503-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xtd9YcJbY03j7IUId9HBIVOTgZm2V8HfbCy_bjNPswg_1746188637
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_052403_188476_8CD01E5D 
X-CRM114-Status: GOOD (  24.39  )
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

On 18/04/2025 18:48, Jocelyn Falempe wrote:
> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.

I applied it to drm-misc/drm-misc-next.

Thanks for the reviews.

-- 

Jocelyn
> 
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>   1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 6025a705530e..dd55b1cb764d 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>           SegmentIterator {
>               segment: self,
>               offset: 0,
> -            carry: 0,
> -            carry_len: 0,
> +            decfifo: Default::default(),
> +        }
> +    }
> +}
> +
> +/// Max fifo size is 17 (max push) + 2 (max remaining)
> +const MAX_FIFO_SIZE: usize = 19;
> +
> +/// A simple Decimal digit FIFO
> +#[derive(Default)]
> +struct DecFifo {
> +    decimals: [u8; MAX_FIFO_SIZE],
> +    len: usize,
> +}
> +
> +impl DecFifo {
> +    fn push(&mut self, data: u64, len: usize) {
> +        let mut chunk = data;
> +        for i in (0..self.len).rev() {
> +            self.decimals[i + len] = self.decimals[i];
> +        }
> +        for i in 0..len {
> +            self.decimals[i] = (chunk % 10) as u8;
> +            chunk /= 10;
> +        }
> +        self.len += len;
> +    }
> +
> +    /// Pop 3 decimal digits from the FIFO
> +    fn pop3(&mut self) -> Option<(u16, usize)> {
> +        if self.len == 0 {
> +            None
> +        } else {
> +            let poplen = 3.min(self.len);
> +            self.len -= poplen;
> +            let mut out = 0;
> +            let mut exp = 1;
> +            for i in 0..poplen {
> +                out += self.decimals[self.len + i] as u16 * exp;
> +                exp *= 10;
> +            }
> +            Some((out, NUM_CHARS_BITS[poplen]))
>           }
>       }
>   }
> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>   struct SegmentIterator<'a> {
>       segment: &'a Segment<'a>,
>       offset: usize,
> -    carry: u64,
> -    carry_len: usize,
> +    decfifo: DecFifo,
>   }
>   
>   impl Iterator for SegmentIterator<'_> {
> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>                   }
>               }
>               Segment::Numeric(data) => {
> -                if self.carry_len < 3 && self.offset < data.len() {
> -                    // If there are less than 3 decimal digits in the carry,
> -                    // take the next 7 bytes of input, and add them to the carry.
> +                if self.decfifo.len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the fifo,
> +                    // take the next 7 bytes of input, and push them to the fifo.
>                       let mut buf = [0u8; 8];
>                       let len = 7.min(data.len() - self.offset);
>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>                       let chunk = u64::from_le_bytes(buf);
> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> -                    self.carry = chunk + self.carry * pow;
> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>                       self.offset += len;
> -                    self.carry_len += BYTES_TO_DIGITS[len];
> -                }
> -                match self.carry_len {
> -                    0 => None,
> -                    len => {
> -                        // take the next 3 decimal digits of the carry
> -                        // and return 10bits of numeric data.
> -                        let out_len = 3.min(len);
> -                        self.carry_len -= out_len;
> -                        let pow = u64::pow(10, self.carry_len as u32);
> -                        let out = (self.carry / pow) as u16;
> -                        self.carry %= pow;
> -                        Some((out, NUM_CHARS_BITS[out_len]))
> -                    }
>                   }
> +                self.decfifo.pop3()
>               }
>           }
>       }
> 
> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18


