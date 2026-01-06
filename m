Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F2CDC188
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 12:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awUw0Ws8QfjW/2qqBU/Hjhunv198l7ND4md8D63+u5c=; b=tecZcQUag5APhmXOzPktNsJFmg
	L5R5NqYjKzDOwj/JM/sdnlfXwceyaVkwnPo7DJvGi+KzbDVFUofT945IHf66COZf41j1oZdz50nR4
	ApbsM8svgR0BbH8ys7P0XgVyn17+5bfVdsFEQcqv5lJcLKG5TpejG0HxasVpwRpiw9ffcOhlHv6Hi
	iMQ4T9l0TwLOH32818AZ/Q/WuNV7dEne2V10KHAXv0Xo759S9EBvuPWSiL2EAV3XWstYO3tO0lsVB
	jP9W89qOxEyi4McDQx8z5Ef7Q1yXmBAWyX7cinOcGBmspj17CYurHPs1Y9NowxMQlBwmckp9R1iHR
	GfNuzPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Jt-0000000D0c3-2g8w;
	Tue, 06 Jan 2026 12:37:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6Jr-0000000D0bU-1MyL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 12:37:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D8AAE404B3;
	Tue,  6 Jan 2026 12:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A41C116C6;
	Tue,  6 Jan 2026 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767703070;
	bh=hm9zTszigCDx9gXEHsPwQEmbW0HRLieX7v57e0V8bhU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=REzzIMiHLlAJ8/yX7SNtNUN34UI9sPJRaGpdk92DO+zLYJno2Yi7Pd4gD6O6eNRke
	 7aVNJxQGRk0pFIgebjhJZgYpA/yxeQG7V10i16poDvU0Y0JORkJLC0VHoEQyZYvJbn
	 Qs62maLF3+GbGq5mvC5TOyQx6hf7IaZtCtDL0GzQPoNYbZqwhl+9y7WGtaka52XZdW
	 7uMM5+OAhmjqspJ0AJXxpXtN/vjJUFi7K5oKqGB9K4XYM1g7amRHfipjlQAqgZdBi0
	 akH2hyYQFnXFyOAYlWAnkREJmQ92SKxUHavk2gbwuiX10Wc3Ibm3ymXS+cC8iKU3VZ
	 RU/xEGefwO3KQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, fujita.tomonori@gmail.com
Cc: aliceryhl@google.com, lyude@redhat.com, boqun.feng@gmail.com,
 will@kernel.org, peterz@infradead.org, richard.henderson@linaro.org,
 mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com,
 ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org,
 mark.rutland@arm.com, frederic@kernel.org, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
In-Reply-To: <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
 <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
Date: Tue, 06 Jan 2026 13:37:34 +0100
Message-ID: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_043751_408721_D5DB9B9D 
X-CRM114-Status: GOOD (  18.14  )
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

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
>> On Wed, 31 Dec 2025 12:22:28 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>>
>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>
>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>> ---
>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>> --- a/rust/kernel/time/hrtimer.rs
>>> +++ b/rust/kernel/time/hrtimer.rs
>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>          // - There's no actual locking here, a racy read is fine and expected
>>>          unsafe {
>>> -            Instant::from_ktime(
>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>> -            )
>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>> +                &raw const (*c_timer_ptr).node.expires,
>>> +            ))
>>>          }
>>
>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>> better to call the C-side API?
>>
>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>> index 67a36ccc3ec4..73162dea2a29 100644
>> --- a/rust/helpers/time.c
>> +++ b/rust/helpers/time.c
>> @@ -2,6 +2,7 @@
>>
>>  #include <linux/delay.h>
>>  #include <linux/ktime.h>
>> +#include <linux/hrtimer.h>
>>  #include <linux/timekeeping.h>
>>
>>  void rust_helper_fsleep(unsigned long usecs)
>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>  {
>>  	udelay(usec);
>>  }
>> +
>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>> +{
>> +	return timer->node.expires;
>> +}
>
> Sorry, of course this should be:
>
> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> +{
> +	return hrtimer_get_expires(timer);
> +}
>

This is a potentially racy read. As far as I recall, we determined that
using read_once is the proper way to handle the situation.

I do not think it makes a difference that the read is done by C code.


Best regards,
Andreas Hindborg


