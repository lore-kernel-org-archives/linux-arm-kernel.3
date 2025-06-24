Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A53EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 21:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=; b=nix6K05sOLzEtqs0RkgNpPPjtx
	+1yVmXYMvI5lwhn+GzotSydtkTXasQ44arTp1V4o7hBE/VtBss4XtQE76ynRi/PDc7Dj09E9ajaMb
	FqVV90MruxNnVNNXH4cmcvGM1IIXscnH2nVSkaiZqaH/v445lO/T0942D1cS/FH8Oat4rOXbq9VFU
	EOpC5a+A3uP8k0LFAOWxwPYNa3hB+CThROPlpRJJr+GRf9GP8qY8+kOoZZ5w+jYkuanI+5B1PaGJD
	6faSO01vgnKFSErIxfrU4x+eRUFwTlmWx/d/CboeAK3RtJC8ToWxkTCQMF3BBskBEVsu6tgETp7n7
	0V9EKSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUB1g-00000006rVU-3v21;
	Tue, 24 Jun 2025 21:17:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU8ng-00000006YkP-2RD3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 18:55:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso1066955e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750791318; x=1751396118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=;
        b=Rrf+Id/em6aVHuZkltYBvZd2yjUnTx4HKMdCVNT/cm+fgSpZw6gZExWMSC/IBcFU9l
         7K4Afn0DicGzhRyCYP9gO4vhwEo4HPsGrnM0eN1wqJQJD2u4GzOpB1Sp+sYzwHJOyRxS
         cV03JAf55t0Pvsa0CP1DyTzpSmwLplQ1K4IfMHaV8My3msrwvG2L73yG68fhOTdsJD0m
         Lu4spnVbEyEXadRukiqC+hB9MMcousQxLTritpYYf15yvFu6k4BIbo8TcpbBs7xpJwHp
         XIrTgl4oK5roUYdgZUO4LYGVfKDhd2oPFPZQeNtodrcMSydo9Xr081Fix4W2ZLxOeYLs
         xcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791318; x=1751396118;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=;
        b=tqP9S2oZt8bfwylS6Txsy3LW65T8r2mndLDuSOODpv20cde5jP8YXzROnhEB53jGRg
         XgvSbmyJ9qZHYui3f3i8x6AZDcA7D+ctuAIdG3+W5vVVJGN1V9huY+izU2pU6UVR4809
         tlUb9/fhyIIit6YsG3WAQlT0bCYs5fWyQcTYyxK6PoRH+Thf+3Efi1op8lEKw+IlYDLa
         eSgOFw7KQNmaF7C8HypIKgL6XTVhy61aRPk4nrsMcv1JTDFwZKU9Xov0wrsmMaCziWZw
         /dj7cUWIueTm5OSBm/FHpPbsaAsDI8zcP240r77R1ZyE6O46EGEouzqjGdvy+088B4zR
         cMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr3sYYHmmx2SI+QuKNyZ8PGgMqdT84z/z4Tijlj2UphOEa1wN4xjWMuqo009dCoZqfmb+sdE7deojrkm6fnqfY@lists.infradead.org
X-Gm-Message-State: AOJu0YwxEsbva6/DC8W+pdJnjcSzOk34Mq7UeWSnx/uShvYZ1n+uV9ZU
	92rUXc8H9+Whqu/Cx5S/NDKqDBSKji1PkNh8U5cPCLTCTQxnT36fUHXo
X-Gm-Gg: ASbGnctw46Y+JZ/W4j1H1g2bNpYjFa5UAwH1mtt5sefnHQCVPq3nv8p8D/+zYjfBwcV
	9C2Ed45ckCKfWn8uDirTge2TGk5IKR7Epdlub4LGx4z4NIvXE8Q4hU0lXCnkuJi+K3uXdqoY3UJ
	IkHqEqK4fq5jBgeQDhZZAwAmYHq2H0QJZO34/bSSzBhIeuJK3gVGlye+mc7+qpcXCdSATUonNtt
	AyIdKbRg0BT7/KA/AOTyD6TheBazRLZV4Yww6LRSKGbbqVjBT4SH3A5J+XPMPnICOf8A/PNxp7H
	RSwM1thZn2sU7DZL5U5F56bAlXeksLvRDMWXqNunyjlP2S5ZlI2FIe1uUNerNNkozvriepvmhUw
	AKX4aY9Dx95NrRA4E+Gbt2KwIXMvrVLB8fbgyAmunIQ5JcqNlGl+PC4gxvAbiHRg6PrFLfbqxkj
	6deOOTwMAneAqCivFTf22d9VILbmETOh+yRkT34SeRzQCLdw==
X-Google-Smtp-Source: AGHT+IHuRDhw6LNCJ4OejonKx4egSddQ5nzG9XYg2236H0JRfL7fwXed/J43zaU7m7WIujs3FcbfQA==
X-Received: by 2002:a05:600c:8214:b0:453:69dc:2621 with SMTP id 5b1f17b1804b1-45381bbcd22mr387435e9.12.1750791318115;
        Tue, 24 Jun 2025 11:55:18 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e103:2700:ebc0:27a3:cde8:9846? (2a02-8388-e103-2700-ebc0-27a3-cde8-9846.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:ebc0:27a3:cde8:9846])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm184027565e9.34.2025.06.24.11.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 11:55:17 -0700 (PDT)
Message-ID: <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
Date: Tue, 24 Jun 2025 20:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
References: <20250418165059.560503-1-jfalempe@redhat.com>
Content-Language: en-US
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
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_115520_660864_96A7B390 
X-CRM114-Status: GOOD (  26.51  )
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

On 18.04.25 18:48, Jocelyn Falempe wrote:
> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.
> 
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 6025a705530e..dd55b1cb764d 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>          SegmentIterator {
>              segment: self,
>              offset: 0,
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
>          }
>      }
>  }
> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>  struct SegmentIterator<'a> {
>      segment: &'a Segment<'a>,
>      offset: usize,
> -    carry: u64,
> -    carry_len: usize,
> +    decfifo: DecFifo,
>  }
>  
>  impl Iterator for SegmentIterator<'_> {
> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>                  }
>              }
>              Segment::Numeric(data) => {
> -                if self.carry_len < 3 && self.offset < data.len() {
> -                    // If there are less than 3 decimal digits in the carry,
> -                    // take the next 7 bytes of input, and add them to the carry.
> +                if self.decfifo.len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the fifo,
> +                    // take the next 7 bytes of input, and push them to the fifo.
>                      let mut buf = [0u8; 8];
>                      let len = 7.min(data.len() - self.offset);
>                      buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>                      let chunk = u64::from_le_bytes(buf);
> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> -                    self.carry = chunk + self.carry * pow;
> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>                      self.offset += len;
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
>                  }
> +                self.decfifo.pop3()
>              }
>          }
>      }
> 
> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18

Hi Jocelyn,

Apologies for reviving this old thread, but I'm still encountering
the same issue with the latest master (78f4e737a53e).

When compiling this module for ARM32 (multi_v7_defconfig),
I get the following error:

    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced 14 more times
    >>> did you mean: __aeabi_uidivmod
    >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

Since no one else has reported this in two months, I’m wondering
if this might be a configuration issue on my end.

Thanks a lot!

-- 
Best regards,
Andrei Lalaev

