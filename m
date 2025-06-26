Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933EBC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=; b=mk7B9B81e+5jUVr30HelPi7A0n
	Zz33wlHxMTC8lxRQg0sUPLD1jOM4SmxqyswaTePbH1ajTUtO17M/oOUXXwHpOB0ATVlncS749hubx
	JmcVHmDsIenjG/ulra9dyGbThs0ydN9OvFT/M1TEI+WOe4Trv/4ZBnyHUWsoX7W8FZD06fA9gX7m5
	DbW82LBlIR1vMhIVn+bd8qrv+6bc4C8wJ+FbrtYr0NMl64dbJ3QSUQXUapVrM73jMZ8bkah+8mJ/K
	ukJcO+TD+YwlS/39vOyNhMUT53Hxii2s1f0t2GMN4VgCxwBv1R/Dg7z/iGcen1MyTc76k/2KpUH1t
	W+CUxpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUogl-0000000C9ev-2ZS8;
	Thu, 26 Jun 2025 15:38:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnRW-0000000BtZP-27s4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 14:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750947548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=;
	b=VF2XvgPfP5MToFsq7DpT+p0T2XkYnW8vHrMr363ixMdBT5vXBHOn5xJVklnzraQg8kOIZE
	6FxZzIRtwGxABEkogBKRiJCW2XbciwRRTF3wIpvX3RQB4nc9rJASKTO9DHDAWxxQIFKTiJ
	v62LAsl0QuWo/fEDGtkIWBNi8qhIoco=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-aRAgEFfxOX2aQbfWOrx-_w-1; Thu, 26 Jun 2025 10:19:04 -0400
X-MC-Unique: aRAgEFfxOX2aQbfWOrx-_w-1
X-Mimecast-MFC-AGG-ID: aRAgEFfxOX2aQbfWOrx-_w_1750947544
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso6115295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 07:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947543; x=1751552343;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=;
        b=t8NHN/Jx2lLC9I42RaSGtxd3d1rCyrOk4QH8lkYroJuC0g5kitFa4ng5E9CvoRI3cZ
         2wKVeA+Jkv2QiPRJFa12678moSamP2fIxEn1ktDUDaI6NBIQXWdcehNSF8/9gMmAlzGV
         GrGHXFMPqvzziyU0VHPCXIuNMvpIK3YUqjkmjv5LeWYiLqwUuyDHh5j9NsN0Cvj25GoK
         YwapN1jOxtaGi/loCwZ3JVPUtkWYyPwYl1UL2y9mowxBrI8tIX63cEO503wMn+ntVRpU
         7XzlfpcRiVaEE+dJOa6oMMdcZiHfFm0Qe1elPdx6fp+pCPmFboyfFp9xkhgHW19N8mEQ
         SFrA==
X-Forwarded-Encrypted: i=1; AJvYcCVbblNY9a5KsvozCsNsrFZMKdbOic/zO6RTbgKJxqJ2C7rl/6pHntM89bsjIla8ZoUHnT9eSrvbR4QZ1LRo7ogy@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo8gf8CMLPR+747AS0UCnfywetRM+U2Qu6ZMj2i1GFKwlH16Oa
	DFYc/bucxQcgCpK+lhgJjOZfe3R3KQJf7cHzWFa0Ghje95aMLSGNwA7PdYRNbq00r5I4i5e1EE7
	AWX/CHO5WzCJLWdhJblVVMFH58S1tMnUb17k4DdoOH3y9desNYHFycyqwCG0NgXL8Qn9+ojHRI0
	WW
X-Gm-Gg: ASbGncuFtUAgwMALZZxH9i39s89UDC+qAdld52rM7QvsfwEQO+OEnIS5gq4LhgaeiGj
	N6PTB8Rc48wF/Vi3HME2fL91mO20vS0Jyn89tp0sksvOPPJMF7jK53hKa5RwntacV6E/WkjlzMi
	DRL8/1paceO8Nk4CEojAlyAQzx6+c0QoWFG6chbnr9sX5Tg0uaFCgOFKu14uhOTxDuhZ2ghrgkc
	34fGgCx/QihzqIMYFEuuda42pK/Pzvi1SZArjegxZnXe7QPc8Z8twW7sNKOSOTbB0rBs03YlQhF
	mv/iW0QWlWf+7J3ktwZZyb1Bz42GN5I8F1ixNCjlLAmsT+ThxvCjGnoz6irc/Q==
X-Received: by 2002:a05:600c:35c9:b0:453:79cb:7c86 with SMTP id 5b1f17b1804b1-4538896ba75mr41349925e9.3.1750947543412;
        Thu, 26 Jun 2025 07:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX3SUpCYk0Q1rtUXxdiwTxAC1uqwZZn+noU/tSvXGhBzHLk/17+Raj1JTfMd2KuovA5Hm6ZQ==
X-Received: by 2002:a05:600c:35c9:b0:453:79cb:7c86 with SMTP id 5b1f17b1804b1-4538896ba75mr41349375e9.3.1750947542873;
        Thu, 26 Jun 2025 07:19:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c463asm51664655e9.39.2025.06.26.07.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:19:02 -0700 (PDT)
Message-ID: <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Date: Thu, 26 Jun 2025 16:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
From: Jocelyn Falempe <jfalempe@redhat.com>
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
 <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
In-Reply-To: <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EHM44SGeI_99jE81jFaQzGAfFszlUURELaXcHjex41M_1750947544
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071910_620053_C4406A89 
X-CRM114-Status: GOOD (  30.21  )
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

On 25/06/2025 00:18, Jocelyn Falempe wrote:
> On 24/06/2025 20:55, Andrei Lalaev wrote:
>> On 18.04.25 18:48, Jocelyn Falempe wrote:
>>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>>> to use a simple fifo with decimal digits as u8 instead.
>>> This is slower but should compile on all architecture.
>>>
>>> Link: https://lore.kernel.org/dri-devel/ 
>>> CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/ 
>>> drm_panic_qr.rs
>>> index 6025a705530e..dd55b1cb764d 100644
>>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>           SegmentIterator {
>>>               segment: self,
>>>               offset: 0,
>>> -            carry: 0,
>>> -            carry_len: 0,
>>> +            decfifo: Default::default(),
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>>> +const MAX_FIFO_SIZE: usize = 19;
>>> +
>>> +/// A simple Decimal digit FIFO
>>> +#[derive(Default)]
>>> +struct DecFifo {
>>> +    decimals: [u8; MAX_FIFO_SIZE],
>>> +    len: usize,
>>> +}
>>> +
>>> +impl DecFifo {
>>> +    fn push(&mut self, data: u64, len: usize) {
>>> +        let mut chunk = data;
>>> +        for i in (0..self.len).rev() {
>>> +            self.decimals[i + len] = self.decimals[i];
>>> +        }
>>> +        for i in 0..len {
>>> +            self.decimals[i] = (chunk % 10) as u8;
>>> +            chunk /= 10;
>>> +        }
>>> +        self.len += len;
>>> +    }
>>> +
>>> +    /// Pop 3 decimal digits from the FIFO
>>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>>> +        if self.len == 0 {
>>> +            None
>>> +        } else {
>>> +            let poplen = 3.min(self.len);
>>> +            self.len -= poplen;
>>> +            let mut out = 0;
>>> +            let mut exp = 1;
>>> +            for i in 0..poplen {
>>> +                out += self.decimals[self.len + i] as u16 * exp;
>>> +                exp *= 10;
>>> +            }
>>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>>           }
>>>       }
>>>   }
>>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>   struct SegmentIterator<'a> {
>>>       segment: &'a Segment<'a>,
>>>       offset: usize,
>>> -    carry: u64,
>>> -    carry_len: usize,
>>> +    decfifo: DecFifo,
>>>   }
>>>   impl Iterator for SegmentIterator<'_> {
>>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>>                   }
>>>               }
>>>               Segment::Numeric(data) => {
>>> -                if self.carry_len < 3 && self.offset < data.len() {
>>> -                    // If there are less than 3 decimal digits in 
>>> the carry,
>>> -                    // take the next 7 bytes of input, and add them 
>>> to the carry.
>>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>>> +                    // If there are less than 3 decimal digits in 
>>> the fifo,
>>> +                    // take the next 7 bytes of input, and push them 
>>> to the fifo.
>>>                       let mut buf = [0u8; 8];
>>>                       let len = 7.min(data.len() - self.offset);
>>>                       
>>> buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>>                       let chunk = u64::from_le_bytes(buf);
>>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as 
>>> u32);
>>> -                    self.carry = chunk + self.carry * pow;
>>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>>                       self.offset += len;
>>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>>> -                }
>>> -                match self.carry_len {
>>> -                    0 => None,
>>> -                    len => {
>>> -                        // take the next 3 decimal digits of the carry
>>> -                        // and return 10bits of numeric data.
>>> -                        let out_len = 3.min(len);
>>> -                        self.carry_len -= out_len;
>>> -                        let pow = u64::pow(10, self.carry_len as u32);
>>> -                        let out = (self.carry / pow) as u16;
>>> -                        self.carry %= pow;
>>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>>> -                    }
>>>                   }
>>> +                self.decfifo.pop3()
>>>               }
>>>           }
>>>       }
>>>
>>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
>>
>> Hi Jocelyn,
>>
>> Apologies for reviving this old thread, but I'm still encountering
>> the same issue with the latest master (78f4e737a53e).
>>
>> When compiling this module for ARM32 (multi_v7_defconfig),
>> I get the following error:
>>
>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced 14 more times
>>      >>> did you mean: __aeabi_uidivmod
>>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>
>> Since no one else has reported this in two months, I’m wondering
>> if this might be a configuration issue on my end.
> 
> Ok, that's surprising, the lines 391 and 392 are:
> 
> self.decimals[i] = (chunk % 10) as u8;
> chunk /= 10;
> 
> So the compiler should be smart enough to do that without using a division.
> I will try to reproduce, and see if I can fix that.

I reproduced the issues, it looks like clang doesn't do the optimization 
on ARM32:

https://github.com/llvm/llvm-project/issues/37280

So I've made a quick test with the following changes, and it builds:


diff --git a/drivers/gpu/drm/drm_panic_qr.rs 
b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..57bd3c6465bb 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -381,6 +381,20 @@ struct DecFifo {
      len: usize,
  }

+fn div10(val: u64) -> u64
+{
+    let val_h = val >> 32;
+    let val_l = val & 0xFFFFFFFF;
+    let b_h: u64 = 0x66666666;
+    let b_l: u64 = 0x66666667;
+
+    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
+    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
+    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
+
+    tmp3 >> 2
+}
+
  impl DecFifo {
      fn push(&mut self, data: u64, len: usize) {
          let mut chunk = data;
@@ -389,7 +403,7 @@ fn push(&mut self, data: u64, len: usize) {
          }
          for i in 0..len {
              self.decimals[i] = (chunk % 10) as u8;
-            chunk /= 10;
+            chunk = div10(chunk);
          }
          self.len += len;
      }


Best regards,

-- 

Jocelyn

> 
> Best regards,
> 
>>
>> Thanks a lot!
>>
> 


