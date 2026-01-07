Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732B5CFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=; b=EzkpckGyV/jhUceBJCgI+xNAmU
	QCtbe7Un3GfTOnhtl399tEYcRlYl1EBzcA89RSBJHyTPYXFhm5TItwdBADyXFoDT0SyOFK2GQlc0W
	4nldlnCWiMIqbnaKsAzZE37TNnyDf/vxW/AxbDq8O21FuOWUFSZVIIZgJyOSRsrtQt3hVXoe8tr38
	UZNuQ1VTIdNL2Qu5CSveWy64pgEAFE1mZSf7UEnmtP6suHMwIHk8k46vNREgQ7IbDVgqRIvm0XFE2
	hR0dttSykb6h7VUIyPS8YF1Ul/vhNPCx3yCPCn6Y9s9XeqPXDCG/anmVe9lD1BuWY0jx8CXI9BKWf
	9z+LYDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTUx-0000000F039-1t70;
	Wed, 07 Jan 2026 13:22:51 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTUt-0000000F02J-1YL5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:22:50 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8b2ec756de0so211523085a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 05:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767792166; x=1768396966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=;
        b=DQhtlkwQkWv6qFcsgRwxwZS4bKpWNdlb5ijCJRddV9BlH5U5bNSMhs0AVG6e452Qx3
         FAm1NZ1wJi3v933vzzplzsJC4gw6magOA0gkCbzaqRHfeBWA43Gpm5umjwjcqz/mnGdR
         TvpZBJ7DwRS9MTlRbWH0rf+PRgwc17KuWKRx3JsFIBcHaXjfFjTXH22sgFvLLI7I67S1
         TzqjG7s6OwsGogZbYSW+96hiEhVWS0YER4BQztIjjoaMJmtGcvy5CO25fEnCjlkGnwIM
         1jpitgrhntZTcEJBbSzP//XieKE6c/qUPfGfOzm5iTylZMRR9lC9EkvGh2FFXMDOJj3m
         Fa1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767792166; x=1768396966;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVyX/saFSHkwOAT/HfR9J/XxoKvZtdkuCzZLxL4WCSA=;
        b=SxGfumek5ejJ1JXYhcajiBXEpdq+UWIx5CyHIR/FfzgzJhaPh5N6nBMqvzeSNR6e8X
         I0Cc89GFLWRllKzQePTTEsdtcD9HifCoqM7TW8x4BgEVmnXMoB2yBKGabwx8Y1oq/uXz
         PA6fUZsjQQa+j4zVwFoQhtomtJJYIIDHY5i63HnUGbPh+o2inLhnNx/Ye9g1BjQjhfok
         tpvzKWy5/L/h2ym6A9eJ23tjhgnFCSAScEyJJ2lwjCQz/lZqJN65+uVMQ5fcTS/snrsJ
         jcXC8nnrwRZHrXkOkxXtwv+mfkG/e8TPirqzZGG1NXgqZXIsXVe6EOBRS8mWeX+4llYX
         G8ww==
X-Forwarded-Encrypted: i=1; AJvYcCW3Lu8CPPLXKZFwPz27DdrtLewilrtJr4klQw3LwPFmgHSoMYBqPE/FLLc+yk1daYL7lqEgALUiXR1Ui/Ae2Hx9@lists.infradead.org
X-Gm-Message-State: AOJu0YxBEObG2qTcHxkHCwQxfQcR90drqu6b8UQtQ8kP01ecGZeJO9hM
	UXeXY0Q9D/30sVPuz9n2K9OHL3lpnfcPQ1u+WiAWdt3F5wa+n9pg2uPBzj+pBw==
X-Gm-Gg: AY/fxX4n4cZzu5Tcgd4wjzKpyFrwSv2HRyu94O1G/Ahj71CGFLSJsnasQ/M0r+2PUZu
	Ze7AvhRXpP1BSZ61zO/j5LZEG02y7usvQzdoJl37b5yC6Iejd7me1sfMRA7BhhUtxuws7Ujc4ak
	zAORxma5+GzWX/44lW7Dj/53rINrAS/wzCEpwSeIJII1s0I0CE2MAUvbx5+PCiGbsnHoDMph/1M
	yDcpxPEhCf75Z84sySzH92aQ0amTxrE1ztyN9vDep6PbeOPH6q0KPoRT2MgiDrZHUs/JAABdxkx
	6xbjjA7Nuj/wjAiu3eihJNyEFLsjvRfpfAAgp//h3XdPFvjw2dwO5cwBZqHw8bDNbbt8ucsUa66
	N2OF1nkZ8EEBT1khMX4r7Ozo3cwdp53sTZXr7RE12HeWBWtLWPZO+EUJ8x5c1eqcwP7ufvq3qqo
	PJvHa28IfS24VP161w3xlMNMhdxHa2SHIotXHZ4dY7n6XxEhX4HUwVDS3zE/mav+JVpXslHLgOY
	i8hqw==
X-Google-Smtp-Source: AGHT+IFka4564yGsxxmwys4Mn7+GTaVT5Y+gqGfi+/kEB3nv8HFKvSn2ve0Sd55L7DEx3kGPj6korQ==
X-Received: by 2002:a17:903:2291:b0:2a2:d2e8:9f25 with SMTP id d9443c01a7336-2a3ee47f0a8mr18571915ad.33.1767784973602;
        Wed, 07 Jan 2026 03:22:53 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88e3sm48170855ad.75.2026.01.07.03.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:22:53 -0800 (PST)
Date: Wed, 07 Jan 2026 20:22:45 +0900 (JST)
Message-Id: <20260107.202245.559061117523678561.fujita.tomonori@gmail.com>
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
In-Reply-To: <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
References: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
	<20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
	<87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_052248_927821_AB18C411 
X-CRM114-Status: GOOD (  22.53  )
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

On Wed, 07 Jan 2026 11:11:43 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> 
>> On Tue, 06 Jan 2026 13:37:34 +0100
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
>>> 
>>>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>>>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>>>
>>>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>
>>>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>>>
>>>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>>>> ---
>>>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>>>
>>>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>>>> --- a/rust/kernel/time/hrtimer.rs
>>>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>>>          unsafe {
>>>>>> -            Instant::from_ktime(
>>>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>>>> -            )
>>>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>>>> +            ))
>>>>>>          }
>>>>>
>>>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>>>> better to call the C-side API?
>>>>>
>>>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>>>> index 67a36ccc3ec4..73162dea2a29 100644
>>>>> --- a/rust/helpers/time.c
>>>>> +++ b/rust/helpers/time.c
>>>>> @@ -2,6 +2,7 @@
>>>>>
>>>>>  #include <linux/delay.h>
>>>>>  #include <linux/ktime.h>
>>>>> +#include <linux/hrtimer.h>
>>>>>  #include <linux/timekeeping.h>
>>>>>
>>>>>  void rust_helper_fsleep(unsigned long usecs)
>>>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>>>  {
>>>>>  	udelay(usec);
>>>>>  }
>>>>> +
>>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>>> +{
>>>>> +	return timer->node.expires;
>>>>> +}
>>>>
>>>> Sorry, of course this should be:
>>>>
>>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>>> +{
>>>> +	return hrtimer_get_expires(timer);
>>>> +}
>>>>
>>> 
>>> This is a potentially racy read. As far as I recall, we determined that
>>> using read_once is the proper way to handle the situation.
>>> 
>>> I do not think it makes a difference that the read is done by C code.
>>
>> What does "racy read" mean here?
>>
>> The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
>> would using READ_ONCE() on the Rust side make a difference?
> 
> Data races like this are UB in Rust. As far as I understand, using this
> READ_ONCE implementation or a relaxed atomic read would make the read
> well defined. I am not aware if this is only the case if all writes to
> the location from C also use atomic operations or WRITE_ONCE. @Boqun?

The C side updates node.expires without WRITE_ONCE()/atomics so a
Rust-side READ_ONCE() can still observe a torn value; I think that
this is still a data race / UB from Rust's perspective.

And since expires is 64-bit, WRITE_ONCE() on 32-bit architectures does
not inherently guarantee tear-free stores either.

I think that the expires() method should follow the same safety
requirements as raw_forward(): it should only be considered safe when
holding exclusive access to hrtimer or within the context of the timer
callback. Under those conditions, it would be fine to call C's
hrtimer_get_expires().


