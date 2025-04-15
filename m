Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6A7C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5aGJd6gGys4y4yhW/3sEXMhbTbG/RttbuWB1PxTwu8=; b=XTKZay/yILBMdEEGOklhpJaw3p
	Rr60JewbfHTSFAGYF1agWYAEoV2BRGLR6B3sr70gNQ4F1dFwsCfNcSMJCVIW3Wxn/RdLQxMJjC1Bn
	ss8XmNrpePo0fGjBnnoBA8D4o8nUsOjCdnUtj09XxKNM7Qpm6GQMEbiQx93L4ptQxAIcJ40h8U8XW
	oYXW1FWKrZbpIdgjxizlu5tuaaeAvVSHEw2Tg8nGMcRLvYCkpdnRKgO8LlsGYd5xkbX7vhgzqDAg5
	hw4rmK9zu0aXRxizBwL0lYsHg/VztWhHb69b8daMgVriTvzeMaCFWVzhRyqSmv61JPg/K/DVdiD+p
	Xa8RxNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fmm-00000005p1s-1ekC;
	Tue, 15 Apr 2025 12:53:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fkI-00000005oip-0oFq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744721433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c5aGJd6gGys4y4yhW/3sEXMhbTbG/RttbuWB1PxTwu8=;
	b=R8bG9lHNkC+rhtEz7F/QEXWHLnFzl16D3KJdpvhxS7wKxjexm+e57RNclBGvnRLb+QI3vK
	uv9/HIeslT4GV87Z0SO6e+Y1U4bXznxppPpcQnXCuhMvTB3QsFO1Jq+C01+sv6z3vbysVs
	MgfX3WEwylU3A+XWyzxFxBP5pNCRzpo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-5ufuuU3BMPm594UfIEzJRg-1; Tue, 15 Apr 2025 08:50:29 -0400
X-MC-Unique: 5ufuuU3BMPm594UfIEzJRg-1
X-Mimecast-MFC-AGG-ID: 5ufuuU3BMPm594UfIEzJRg_1744721429
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso31755675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721428; x=1745326228;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5aGJd6gGys4y4yhW/3sEXMhbTbG/RttbuWB1PxTwu8=;
        b=LuBeKkl/2SwYQn7aeIsmz6SUsOfKzJ75aQHfoRIFADYRRRGZCbF0zvKjmVecSUa4Ut
         rjwoGTcjNlMf5M2ZXCUXGiPgKTbMQ3I9ZhZC4+dQvBL/JGkTRgmYG3PFiQfVTCGiY+UD
         sCB5gNyoPJMrMtyG31tao+lRt5fMm2RykIa1CGlSzfwnXABzHfYTX6/+WaTCKfFBgE9a
         yOrDXf2sXoWXoTU3V3oalCiz0tONJwBqyF9PwtzTjamnyfND/mmhpv+OOTLMkCcZP5dX
         HXT+mkTiu9BdHJvTqiff0s6jhjlaNdTGVm9xOmRYU0s3kumiZcSgHv47OCJGnaLhy8HM
         pcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6EWiWXoP4qcYphnGEKC1L31c1pbO1bmoZs1xlhDMUJhZGCiZ6T3qTsiNaTaJylauauwhprjbSkGrC58IRSZI3@lists.infradead.org
X-Gm-Message-State: AOJu0YzypiirVZH0Z+gn29xO78wJtOhpahhDd75p12fxKSFlF6epeiV5
	0ALfalIrBHsFbdh/rYB+rDV8G4SzqCf6nPViwDaK1N6YBtZo7oV3Oz8Jc5QJGyXuqsEF0L1C6C7
	ulsDkGL0jQTNH8h9lafGKNJ4mPKdRofvsOd15Vpa/TbuDxMCg/zgqKkuDUYj4j7gIuFLvUnC9
X-Gm-Gg: ASbGncsq5h7x45cFE928KGUOk6Q9+TZO5LXu6pG6CBpJ2J5Tc/fsHEgri79jvQViQft
	wg3i1s/8X5upjuvrQ3cVJbkOStQFxcLPovq8ulXsvsQD2RjjDtLAUWJqAn5nY7fwEHip9vcqLJB
	+tOxxshhFXYLZOQl9Vm2CARbqzA/eZDzn+QmPV+MrUwtrFQEM7wobc9llDpOJWu7PWHuuFKT9wH
	fOYyiF0v2bGvyGXih6QCONS27qVxShJtACQ7RcvIUgyfGSeUM4G18JCVaSsCQF0dhJdFG58dwUj
	ukq7avGwpusRvw+N
X-Received: by 2002:a05:600c:1c03:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43f3a927654mr121648995e9.5.1744721428667;
        Tue, 15 Apr 2025 05:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj25pgSIsqBjfz6Y9sBggCmIl9HsWKNdepNwC3fzn1uQR3G6mU8S+L8arQ4hueY0XNNLoU1A==
X-Received: by 2002:a05:600c:1c03:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43f3a927654mr121648805e9.5.1744721428360;
        Tue, 15 Apr 2025 05:50:28 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.109.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f23572c43sm213085085e9.25.2025.04.15.05.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:50:27 -0700 (PDT)
Message-ID: <5e0754a2-ba4e-454b-99cb-57c4ae99d020@redhat.com>
Date: Tue, 15 Apr 2025 14:50:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
 <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
 <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yBftmXc0kLBleQAZDkxS7WLOugduzZzK_4_9w1f5yOQ_1744721429
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055034_302981_7ED14F99 
X-CRM114-Status: GOOD (  13.42  )
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

On 4/15/25 11:14, Jocelyn Falempe wrote:
> For this case, the u64 divisor "pow" is a power of 10, so can have only 
> a limited number of values. (17, and 9 of them can be used as u32).
> Normally when the divisor is known at build time the compiler can 
> replace the division by a multiplication and some bit shift.
> 
> so for 32bits machine, the match can be rewritten with constants, a bit 
> like this:

If you add bindings to mul_u64_u64_shr from include/linux/math64.h, you 
can include the constants yourself:

pub struct MagicMul {
     mult: u64,
     shift: u32,
}

// Computed using the algorithm from Hacker's Delight, 2nd ed.
const DIV10: [MagicMul; 19] = [
     MagicMul { mult: 0x1, shift: 0 },
     MagicMul { mult: 0x6666666666666667u64, shift: 66 },
     MagicMul { mult: 0xA3D70A3D70A3D70Bu64, shift: 70 },
     MagicMul { mult: 0x20C49BA5E353F7CFu64, shift: 71 },
     MagicMul { mult: 0x346DC5D63886594Bu64, shift: 75 },
     MagicMul { mult: 0x29F16B11C6D1E109u64, shift: 78 },
     MagicMul { mult: 0x431BDE82D7B634DBu64, shift: 82 },
     MagicMul { mult: 0xD6BF94D5E57A42BDu64, shift: 87 },
     MagicMul { mult: 0x55E63B88C230E77Fu64, shift: 89 },
     MagicMul { mult: 0x112E0BE826D694B3u64, shift: 90 },
     MagicMul { mult: 0x036F9BFB3AF7B757u64, shift: 91 },
     MagicMul { mult: 0x00AFEBFF0BCB24ABu64, shift: 92 },
     MagicMul { mult: 0x232F33025BD42233u64, shift: 101 },
     MagicMul { mult: 0x384B84D092ED0385u64, shift: 105 },
     MagicMul { mult: 0x0B424DC35095CD81u64, shift: 106 },
     MagicMul { mult: 0x480EBE7B9D58566Du64, shift: 112 },
     MagicMul { mult: 0x39A5652FB1137857u64, shift: 115 },
     MagicMul { mult: 0x5C3BD5191B525A25u64, shift: 119 },
     MagicMul { mult: 0x12725DD1D243ABA1u64, shift: 120 },
];

const fn div10(val: u64, exp: u32) -> u64 {
     let MagicMul { mult, shift } = DIV10[exp as usize];
     mul_u64_u64_shr(val, mult, shift)
}

#[test]
fn test_div10() {
     assert_eq!(div10(12345678, 0), 12345678);
     assert_eq!(div10(12345678, 1), 1234567);
     assert_eq!(div10(12345678, 2), 123456);
     assert_eq!(div10(12345678, 3), 12345);
     assert_eq!(div10(12345678, 4), 1234);
     assert_eq!(div10(12345678, 5), 123);
     assert_eq!(div10(12345678, 6), 12);
     assert_eq!(div10(12345678, 7), 1);

     assert_eq!(div10(9876543298765432, 8), 98765432);
     assert_eq!(div10(9876543298765432, 9), 9876543);
     assert_eq!(div10(9876543298765432, 10), 987654);
     assert_eq!(div10(9876543298765432, 11), 98765);
     assert_eq!(div10(9876543298765432, 12), 9876);
     assert_eq!(div10(9876543298765432, 13), 987);
     assert_eq!(div10(9876543298765432, 14), 98);
     assert_eq!(div10(9876543298765432, 15), 9);

     assert_eq!(div10(12349876543298765432, 16), 1234);
     assert_eq!(div10(12349876543298765432, 17), 123);
     assert_eq!(div10(12349876543298765432, 18), 12);
}


I tried the test in userspace with this implementation of the
function:

#![feature(bigint_helper_methods)]
const fn mul_u64_u64_shr(m: u64, n: u64, s: u32) -> u64 {
     let (a, b) = m.widening_mul(n);
     if s == 0 {
         a
     } else if s < 64 {
         (a >> s) | (b << 64 - s)
     } else {
         b >> (s - 64)
     }
}


HTH,

Paolo


