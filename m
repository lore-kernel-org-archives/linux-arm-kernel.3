Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7E1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 22:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=; b=IkKB/gD57AJPABnzJb7izzNk+8
	x5X5NkFunl9Dd6H+a6R2VAZD/wSc43Z7K+26xb/weuSrX5a3mM20ebkyghKIMfR30ZiZbWuNp+I59
	KRlDEU+own1xvdKHCA3u06DDZGIhwEOU5F3egqDO2K9tHlCzDZWbi/MzqVGhdPo6iJSd/CxE8mTIR
	qAikj0tGSxpXd3WkbM8XhjiGSj6w+ql8e/c2EIvcBeOTXjde8ACjUVXqXi/FI1JWEFwCITN+T0dxv
	WfZAarkqApCSnuVh5PPpnDiOZIx/8xQI63afC/KzWEpqydwO89gvEA9vu2EZFln+zgJ30pi23qZoC
	wl0igZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUCTv-000000071sC-2YfN;
	Tue, 24 Jun 2025 22:51:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUC01-00000006z3N-1uJI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 22:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750803615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=;
	b=Jz7NdXND2Pmgoq/XIOrGd7Etvu4fbh7prmUODXvPRL3qN/b/4XNYAsWRb+CHo+rXSfoPrN
	m5pS53tsKQlgoH0kgz/FCgWqwtezqaFuHyabio8mDp41KppTDlqVB0YnnFaeMJ39ebqdfD
	YWR+VtFdb0yACoJHF2kzlTLXKqj9oRs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-Ta_pEEidOVSykVp3m7vP4g-1; Tue, 24 Jun 2025 18:18:38 -0400
X-MC-Unique: Ta_pEEidOVSykVp3m7vP4g-1
X-Mimecast-MFC-AGG-ID: Ta_pEEidOVSykVp3m7vP4g_1750803517
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so491329f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 15:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803517; x=1751408317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=;
        b=xJYI37vDn7ZumUFLdC6Uetaj2lBneU4Ld/W3NhpEcD8wkFPgFFojG/3VgtubaO6Smc
         br/KglohP67Za6vphmVzgHNFufULpTob7TBPgjfzZfKqJ4tZK/rOVsBrgZbIFQsAA1TJ
         nOFVM7D0OMJm0aWYY8sY/EVKXikNPJ1/zuU9ypZ9A83D9x5vixJ/w9RiRw/fj1hnDlff
         TxL6r1N5JXkqIEiICCw2Yh3wo6hWooKPc2QlMU6SB8CH6ZAlgCfhp/Eg2Ocr9O0khWHr
         fxmfsplIJ32RAE+DpYMaTq75rIiLOZTsSOq1E3sRJSue7Kk5adGftdYsyRWLgNp1bviV
         /EFw==
X-Forwarded-Encrypted: i=1; AJvYcCWl9jpVGZ4fyJwapoECQOWXyUGRDraI83XJwlpFUwKw4wpncVk+7PuCuPe/0orcPX10p/RDUwhg9xlLnApz8+W2@lists.infradead.org
X-Gm-Message-State: AOJu0YzHx2XJf44yi35ubnxNh231XH0CrIXurK+n898aTRxZP/8Q4RLs
	72fAVYwPrb7AeLiKHfJhLRfrWCKjL46X0dmLmf6EXKdv7nT8+zMZnMO7c+kh3K2X83XknyewwbI
	spLtOG5MREmn0+h1tuSHVdL8pdL+xuF60iAYD2Jt4yJklpzSS3Yei4NAJuNynHog/95dxNr0nVZ
	0s
X-Gm-Gg: ASbGncuFK5OvraMvwQpq2RkYPFnSVbd0GZBTbQ8HvlYUxGtdKMC/jJ69hDehSqlqjpr
	ruJrNsB3MUYztcNBrPDivHfRNd6sndhIy4VM+Fs3w323b4KNIW4vBL0LJgcOeCg80EHQF+qdktb
	TiFWH3JeWIP3by8Vy9g4S6LJqXe3iFzAaow47xNzK09ig+ZJSzCpBTdT227fVBUGzVAMvwYywKP
	b+iNiZ/SMPKqtYd9nGIIceR77B2WzZ6L+YwusHnPg7q3r7psrF3+ddi6BXKK2Ra+FEo4CA8Jxja
	5iCVAwrPx+M/K1DRlDo+c7Tge1E5QVdxZbMF0g6yAM45JY1d5NHTs9pFDaSZ1w==
X-Received: by 2002:a05:6000:4a04:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3a6ed66e660mr259020f8f.47.1750803517054;
        Tue, 24 Jun 2025 15:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaiZu6Jnvv4KZOV08AX5p0ZetFt8VZ3DH1c9WqbbWm4WIsdHnH3J35vd6e6Y8A8S4HPKSng==
X-Received: by 2002:a05:6000:4a04:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3a6ed66e660mr259010f8f.47.1750803516581;
        Tue, 24 Jun 2025 15:18:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm1501705e9.33.2025.06.24.15.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 15:18:36 -0700 (PDT)
Message-ID: <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
Date: Wed, 25 Jun 2025 00:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Simona Vetter <simona@ffwll.ch>,
 Paolo Bonzini <pbonzini@redhat.com>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250418165059.560503-1-jfalempe@redhat.com>
 <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OiuqOQ1dl57dx758PzAlvA5o1OfioacQL2kMT8nyzmE_1750803517
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_152017_572140_1E5B3A5D 
X-CRM114-Status: GOOD (  28.15  )
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

On 24/06/2025 20:55, Andrei Lalaev wrote:
> On 18.04.25 18:48, Jocelyn Falempe wrote:
>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>> to use a simple fifo with decimal digits as u8 instead.
>> This is slower but should compile on all architecture.
>>
>> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> index 6025a705530e..dd55b1cb764d 100644
>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>           SegmentIterator {
>>               segment: self,
>>               offset: 0,
>> -            carry: 0,
>> -            carry_len: 0,
>> +            decfifo: Default::default(),
>> +        }
>> +    }
>> +}
>> +
>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>> +const MAX_FIFO_SIZE: usize = 19;
>> +
>> +/// A simple Decimal digit FIFO
>> +#[derive(Default)]
>> +struct DecFifo {
>> +    decimals: [u8; MAX_FIFO_SIZE],
>> +    len: usize,
>> +}
>> +
>> +impl DecFifo {
>> +    fn push(&mut self, data: u64, len: usize) {
>> +        let mut chunk = data;
>> +        for i in (0..self.len).rev() {
>> +            self.decimals[i + len] = self.decimals[i];
>> +        }
>> +        for i in 0..len {
>> +            self.decimals[i] = (chunk % 10) as u8;
>> +            chunk /= 10;
>> +        }
>> +        self.len += len;
>> +    }
>> +
>> +    /// Pop 3 decimal digits from the FIFO
>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>> +        if self.len == 0 {
>> +            None
>> +        } else {
>> +            let poplen = 3.min(self.len);
>> +            self.len -= poplen;
>> +            let mut out = 0;
>> +            let mut exp = 1;
>> +            for i in 0..poplen {
>> +                out += self.decimals[self.len + i] as u16 * exp;
>> +                exp *= 10;
>> +            }
>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>           }
>>       }
>>   }
>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>   struct SegmentIterator<'a> {
>>       segment: &'a Segment<'a>,
>>       offset: usize,
>> -    carry: u64,
>> -    carry_len: usize,
>> +    decfifo: DecFifo,
>>   }
>>   
>>   impl Iterator for SegmentIterator<'_> {
>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>                   }
>>               }
>>               Segment::Numeric(data) => {
>> -                if self.carry_len < 3 && self.offset < data.len() {
>> -                    // If there are less than 3 decimal digits in the carry,
>> -                    // take the next 7 bytes of input, and add them to the carry.
>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>> +                    // If there are less than 3 decimal digits in the fifo,
>> +                    // take the next 7 bytes of input, and push them to the fifo.
>>                       let mut buf = [0u8; 8];
>>                       let len = 7.min(data.len() - self.offset);
>>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>                       let chunk = u64::from_le_bytes(buf);
>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
>> -                    self.carry = chunk + self.carry * pow;
>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>                       self.offset += len;
>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>> -                }
>> -                match self.carry_len {
>> -                    0 => None,
>> -                    len => {
>> -                        // take the next 3 decimal digits of the carry
>> -                        // and return 10bits of numeric data.
>> -                        let out_len = 3.min(len);
>> -                        self.carry_len -= out_len;
>> -                        let pow = u64::pow(10, self.carry_len as u32);
>> -                        let out = (self.carry / pow) as u16;
>> -                        self.carry %= pow;
>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>> -                    }
>>                   }
>> +                self.decfifo.pop3()
>>               }
>>           }
>>       }
>>
>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
> 
> Hi Jocelyn,
> 
> Apologies for reviving this old thread, but I'm still encountering
> the same issue with the latest master (78f4e737a53e).
> 
> When compiling this module for ARM32 (multi_v7_defconfig),
> I get the following error:
> 
>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced 14 more times
>      >>> did you mean: __aeabi_uidivmod
>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
> 
> Since no one else has reported this in two months, I’m wondering
> if this might be a configuration issue on my end.

Ok, that's surprising, the lines 391 and 392 are:

self.decimals[i] = (chunk % 10) as u8;
chunk /= 10;

So the compiler should be smart enough to do that without using a division.
I will try to reproduce, and see if I can fix that.

Best regards,

> 
> Thanks a lot!
> 


