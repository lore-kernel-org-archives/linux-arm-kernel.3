Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE51C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=; b=xvI5786WUXzDOPLxj/U1NfJ92i
	8uPIRB8wiW3xXi9kEUSL9WdfPbVpyNIiobcW/TI5SUwdYN+TOHUJIFtvPPCNulZ3YcOZ2rcqvQtmQ
	vPlmXKK9mw6P4YpdaiLFrYsQ/e2NyDD1gB6vYtGHvAmjmFwwsvBjz+AdV4LToz1DyHobndEmuM4PY
	My4AFl9ekjOtavdvh8H4lLnlVWaBefqMKc9231R78bQ1BY0Lbwu2sXJ1ToIlYJ/G1j4pw1huUJI0I
	pucdAY9Pcj9sMWeU42PjQOwJF7hCHDvrzEmErH+dzS5jB8f3xsUAjQ308f+cEAzCyRsVizRokoSnc
	cTAi5SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cQY-000000058P0-0I7M;
	Tue, 15 Apr 2025 09:17:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cOi-0000000585t-089d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744708562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=;
	b=SK1ICN+XnGl9a4zPtAP4QusQO1z+CRHibp+ja0o1sMuvXuZDVKlzRdtzvfUxPZE1UkerpY
	FWyP10j/hf/Ejay8OfDvUfXprGAhUVIQieezUE4GSVOIgP4ww4dXe9gWk4b5zNZJt3wBGz
	dyYs0R1kppP97dBG3S3ntifJpkoWbRA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-hEXd7tXxOrGJ3-P9H76Fqw-1; Tue, 15 Apr 2025 05:14:11 -0400
X-MC-Unique: hEXd7tXxOrGJ3-P9H76Fqw-1
X-Mimecast-MFC-AGG-ID: hEXd7tXxOrGJ3-P9H76Fqw_1744708450
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so42464155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708450; x=1745313250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=;
        b=Q3hGUhHVUJ/adKElV9sErsZicmFtjvV9WkUaebXzpL4pBA8H0CqDF+AhXMgVkW6vpO
         sO8tPjTAnVkYXqW07VI+hHo4/3aGbz/smMqNXHV/a/kIFgn/+izCV1fGKsus896jKK7b
         5yNR+SXA20HB/gVOFb20MvKMIC0c/JmkwRwfeOqrFkJpfAzYlq4WAovOAKh5O6iYFAYM
         PUxfilu+Tqvlj3Kaujwl9JlqwQkhKA9Po0/YCVGg63WiVuvu4/eAkEYTpHBbsqP+uCyi
         nfGEeQnhOTqANuMK3f4WhsV5c2riJCNPAUoZoPLnGbw5Vr2imqSMgkSLBxSrmatgVMWM
         FW5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZIzdYUKACLcBZHCJMLuL4+O7eqYt/t/mTNtjXR6f8VT5hzAYYwrd6wGkCYqdnFG7Df4+fxPc4q1kFOpQWpdiR@lists.infradead.org
X-Gm-Message-State: AOJu0YwpzR41sJg7z9x13a0N7cLlAbGkwBXZNF1cUsVZAEgGazW2mWid
	cYL+VaVSXBxf1tGF7vg1j8Fo4GxcM4F29eaGBXDefkJWHE96PSv6YvSw8SfpZq0XAkuGCp1HOY5
	JdR8dQYybkD0O/YTyejQJxwmqMsHEq6pl3QkcVysGlFdWc3gv9wW0JfRCG2LEUXkagCWUgmWQ
X-Gm-Gg: ASbGnctCVm/rEyaIhuNnIZubEyxea0paZqpBQHDY4teGeINIp64OspmIUlVY5v1ZLoc
	qAFNfam8Z4wPlUW38r/bFx9/zuPGT/vwb93oAKZ29MO5fT3vh9akaQaJFnnAQroBWw5RMBW5RjS
	j4YZF2tTdKLLZdueupgdyWdZIonVLixCIFKg1+w/tyOOHz3VPUqixgye3T1pGtmDbf1vSJonvWi
	a/duncACiNvZjwcSCrPAKUQBSNNMH+U9I9p+KK6NrHHCc5rTQyjR/bERiNgM+KJ3jwy5HGpctFc
	JfNV73wZ9vdquIsrPBrWLWtIBE3/16YLKnn4ekCtoG79jdfewis=
X-Received: by 2002:a05:600c:a0b:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43f3a94c707mr121539015e9.11.1744708449845;
        Tue, 15 Apr 2025 02:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER2bLz18Dd2QrnXzcffJp2/++mALwClLl9NZTgUP+3ai5VKvRqmsyvG3bjrFO1ABqJnqpLWw==
X-Received: by 2002:a05:600c:a0b:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43f3a94c707mr121538555e9.11.1744708449206;
        Tue, 15 Apr 2025 02:14:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm199454825e9.23.2025.04.15.02.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:14:08 -0700 (PDT)
Message-ID: <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
Date: Tue, 15 Apr 2025 11:14:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xHI8t6psOMbENprT4X1pkeayxUawOyN1f89Dy2N49Bg_1744708450
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_021604_128429_9959FE2B 
X-CRM114-Status: GOOD (  20.35  )
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

On 14/04/2025 21:46, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
>> Hi Miguel,
>>
>> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
>>> Hi Jocelyn, Christian,
>>>
>>> I started build-testing arm 32-bit within my other usual routine
>>> tests, and I hit:
>>>
>>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>      >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>>>      >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
>>> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>
>>> which comes from both these `u64` by `u64`:
>>>
>>>      let out = (self.carry / pow) as u16;
>>>      self.carry = self.carry % pow;
>>>
>>> Christian: I guess we can offer a set of `div64` functions using the C
>>> ones, at least for the time being, and eventually wire the actual
>>> operator with some support from upstream Rust. Or do you have
>>> something else in mind? (i.e. I think you have been discussing
>>> intrinsics lately)
>>
>> I think using the C implementations is fine. Not sure how much the
>> FFI is going to matter for performance, but it should be rare enough
>> that is shouldn't matter (and hopefully we will get cross lang LTO
>> or something similar at some point).
>>
>> We could also just implement the intrinsic(s) ourselves, but then
>> the u64 divisions would be implicit which is probably undesired.
>> We could also rename the intrinsics so they are only usable from
>> specific crates.
>>
>> I think we need the opinion of the some arm people here.
>>
>> CC Russell King and Linus Walleij.
> 
> The kernel has had the general position that u64 by u64 division is
> silly and isn't supported. Several 32-bit architectures including
> 32-bit ARM don't support it.
> 

For this case, the u64 divisor "pow" is a power of 10, so can have only 
a limited number of values. (17, and 9 of them can be used as u32).
Normally when the divisor is known at build time the compiler can 
replace the division by a multiplication and some bit shift.

so for 32bits machine, the match can be rewritten with constants, a bit 
like this:

1..9 => {
      let out = (self.carry / u32::pow(10, self.carry_len));

10 => {
      let out = (self.carry / 10_000_000_000);
       ...
}

11 => {
      let out = (self.carry / 100_000_000_000);
     ...
}

Would that fix this problem?

Best Regards,

-- 

Jocelyn


