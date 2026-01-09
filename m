Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB4BD232C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 04:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9T2BPf5beEn8hyeDIg1uadDWypr2H9Q3xF9+zmP6OE=; b=l69nMVsND3EzshPDw9RSDqbV/H
	ndW+d5M31oLe5RthGZIuT9ZPrbEcsQdje9Qg0c95pcuweGrn51CyipE1a+cTvkszolDB30QDJanpm
	aHV/dMIiRF8ggvq30V8OBl0VtIm7rc8oPwXk93pZr7aCMQ+qnJPYecTj8RTAzm5Yw1y+PGqsNWBn/
	FwOpAxo/yWvLfldk/JkJAxmvMy1oM0cRBD1+zX4hTWY41hNFs/TkLfZOs0gU63qtUpL99PnYW8LC/
	LbkjXyBtSG+OOLEEs4xJ8MWhv9/TOtSjLLCGNI3FDA8H/dUjZEjtD74wSNLTNC8t3fntcvAlVyRs4
	fNcHfL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3ic-00000001F5v-25SY;
	Fri, 09 Jan 2026 04:03:22 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve3iY-00000001F4w-3mWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 04:03:20 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-5ef2561e395so223212137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 20:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767931397; x=1768536197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9T2BPf5beEn8hyeDIg1uadDWypr2H9Q3xF9+zmP6OE=;
        b=BjKorLrerzqL5WmBQz/fYmJlf7lNxGBf1aOCN+HxNymUd2L3sOf61iPfotwGMMvXd4
         GZQS9VJ4H4aB2tbQ4HKuoMnYsFzMOyhVzppPWM/bcWWnSYkdfJvVLaNF1Oy/zRx7jEz0
         jWWXCzJ/zqrl9tI+eZca24uNf9ijOkfanDgEUdRujcaKdaVpp27pJvwK7Ym5vwKHRZII
         AvnwmHxxvRNaNYsX9wNQ1IXP2D8MSBWWLDVRSkLT0dMnkvaOBqkdwDv6FdcV9POjabCQ
         hJga4nWnZzgOu9Fwb0LN6ywEzBbBDcsEN8IP6W5Ho2f2eIZ0Y5+1FM/+w0a3r212j67y
         UJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767931397; x=1768536197;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9T2BPf5beEn8hyeDIg1uadDWypr2H9Q3xF9+zmP6OE=;
        b=OvXlSueaaSWiuGCwWGhebVDhh81JwYZuwUxTvFDbBOh+69Ie+0TgONSt3cqST39E7/
         uTBrRzrmXQJrHh6ikfZSNgQtVC9cp/YlEv0fN7tj65nL97U005/lJpsqkU866aHa2RFn
         CI63Em7TUy9QtxbnGFMbFpCIk2U43YHB7vYziz3O6wGQg00V+HOgqJwzqsFK/yIigPO/
         lw9nS3XDT9ABes9fy2aa7vpM+pmC12hATkZO9rTcwhgJUVYhdDvtMmA259YNMGDQ6st5
         v+5Nra/WN69bFXw2fjTV0Gi6o9+S+WThNuvppHeWZW96LI49ERHk1eu3aQ+5T5otORnX
         /uvA==
X-Forwarded-Encrypted: i=1; AJvYcCVlatLzDmAR6uNs8CzVZXBWazexmpCmTX4yE+KXDuMF2cj51Wz9/YTHFtowLyxxkN3oXs5rVNRhKcS2Y6HY6Eza@lists.infradead.org
X-Gm-Message-State: AOJu0YzfFXdOw5DPDQEi3zzTzqQ8L9lRXdpKNnYI9FJVoLz3X0Jw6ZkD
	YaGQh4LqORS1OgIi7w6Xrbf9zgcHJtxJi/i9siHZjjnmvPRDkSk0G03v
X-Gm-Gg: AY/fxX5HIfEfaJe0hgYWP+D3q+e75oSzpiXeiNnP6i6juF1dehNcQ9oFIO7VgHy8fyv
	mYTeaCVZA9fOOIpHGErljyKh8QhWkv4rUUce7FOeJrxhLPO978+edMK7CLvZjDBYtKuUBBzZvZQ
	EfhGs+ejlILULdIupYiMxbliYaNI3HSkj/T1IkoR3il9MKnocaNkCvAjzXCz4DR9vjjDRpiBBE1
	iuW8PEfEsBLBPCWYma896BwA1hKHML9oeJ6CzcMQsrdDOBcXw+eE0pxaayFZWwrIpIOHURH4jAm
	pPTSrzAM/jxXNubA2JrElJMtBxRnZsBVX+3o//NHqkddus/3M9MxWPVA/HpwdVje7Aa3ZbozO/q
	rqKNUcqn/MwHE6nBcnO/Ms1XVf/MTKGiAWnZlxqaxzUlimQybvfRqbpZ6tOBMtKuw5saEVn3x2v
	O3labMJrE28pyV4I2d5gxQUDLBrxZwj8QbyeEitfhbozSh3r/6A6jIKWFNcmlYxFJYkek=
X-Google-Smtp-Source: AGHT+IHt+NS7u00xGrZ+95pdtQ5VgNDPq0qsP5mcbgbJ7rn8y9GOzh3GzuRv2Bv72b17iorfv7DOuQ==
X-Received: by 2002:a17:902:c406:b0:2a0:9923:6954 with SMTP id d9443c01a7336-2a3ee48fbf3mr72625155ad.27.1767924633614;
        Thu, 08 Jan 2026 18:10:33 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4f1sm87799265ad.8.2026.01.08.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 18:10:33 -0800 (PST)
Date: Fri, 09 Jan 2026 11:10:25 +0900 (JST)
Message-Id: <20260109.111025.1944772328156797586.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, lyude@redhat.com,
 boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ms2pgu7c.fsf@t14s.mail-host-address-is-not-set>
References: <WXFPsf9COQPV_obKoZg2bYwPL3k9TT0oBL3uxNppUFaIj5hxEX9UokzS_DJ5Kg5kXDzLrZ9ihALTZcf6ehljGw==@protonmail.internalid>
	<20260107.202245.559061117523678561.fujita.tomonori@gmail.com>
	<87ms2pgu7c.fsf@t14s.mail-host-address-is-not-set>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_200318_957304_1F356AFD 
X-CRM114-Status: GOOD (  24.03  )
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

On Wed, 07 Jan 2026 19:21:11 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> On Wed, 07 Jan 2026 11:11:43 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
>>>
>>>> On Tue, 06 Jan 2026 13:37:34 +0100
>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>
>>>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>>>>
>>>>>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>>>>>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>>>>>
>>>>>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>>>
>>>>>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>>>>>
>>>>>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>>>>>> ---
>>>>>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>>>>>> --- a/rust/kernel/time/hrtimer.rs
>>>>>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>>>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>>>>>          unsafe {
>>>>>>>> -            Instant::from_ktime(
>>>>>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>>>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>>>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>>>>>> -            )
>>>>>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>>>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>>>>>> +            ))
>>>>>>>>          }
>>>>>>>
>>>>>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>>>>>> better to call the C-side API?
>>>>>>>
>>>>>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>>>>>> index 67a36ccc3ec4..73162dea2a29 100644
>>>>>>> --- a/rust/helpers/time.c
>>>>>>> +++ b/rust/helpers/time.c
>>>>>>> @@ -2,6 +2,7 @@
>>>>>>>
>>>>>>>  #include <linux/delay.h>
>>>>>>>  #include <linux/ktime.h>
>>>>>>> +#include <linux/hrtimer.h>
>>>>>>>  #include <linux/timekeeping.h>
>>>>>>>
>>>>>>>  void rust_helper_fsleep(unsigned long usecs)
>>>>>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>>>>>  {
>>>>>>>  	udelay(usec);
>>>>>>>  }
>>>>>>> +
>>>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>>>> +{
>>>>>>> +	return timer->node.expires;
>>>>>>> +}
>>>>>>
>>>>>> Sorry, of course this should be:
>>>>>>
>>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>>> +{
>>>>>> +	return hrtimer_get_expires(timer);
>>>>>> +}
>>>>>>
>>>>>
>>>>> This is a potentially racy read. As far as I recall, we determined that
>>>>> using read_once is the proper way to handle the situation.
>>>>>
>>>>> I do not think it makes a difference that the read is done by C code.
>>>>
>>>> What does "racy read" mean here?
>>>>
>>>> The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
>>>> would using READ_ONCE() on the Rust side make a difference?
>>>
>>> Data races like this are UB in Rust. As far as I understand, using this
>>> READ_ONCE implementation or a relaxed atomic read would make the read
>>> well defined. I am not aware if this is only the case if all writes to
>>> the location from C also use atomic operations or WRITE_ONCE. @Boqun?
>>
>> The C side updates node.expires without WRITE_ONCE()/atomics so a
>> Rust-side READ_ONCE() can still observe a torn value; I think that
>> this is still a data race / UB from Rust's perspective.
>>
>> And since expires is 64-bit, WRITE_ONCE() on 32-bit architectures does
>> not inherently guarantee tear-free stores either.
>>
>> I think that the expires() method should follow the same safety
>> requirements as raw_forward(): it should only be considered safe when
>> holding exclusive access to hrtimer or within the context of the timer
>> callback. Under those conditions, it would be fine to call C's
>> hrtimer_get_expires().
> 
> We can make it safe, please see my comment here [1].
> 
> Best regards,
> Andreas Hindborg
> 
> [1] https://lore.kernel.org/r/87v7hdh9m4.fsf@t14s.mail-host-address-is-not-set

I agree. My point was that expire() can be safe only under the same
constraints as forward()/forward_now() so the API should require
Pin<&mut Self> and expose it on HrTimerCallbackContext.


