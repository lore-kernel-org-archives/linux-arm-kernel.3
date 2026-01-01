Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB850EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 05:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=; b=HystX0HQd4Xb4Ojb9pmPKsb39N
	jwrPdIRDpOASaCgATRzgetnz16+HGjbipe2MnEOxHkp5yIFKBwdOrsgz8Sjxtm5Up/5lVfQvpp21X
	z0n1j0HOKs5yxyx4b5eWgb7oeQpZmydN88vlz2zMpWKKXDua6XdQviY2OcwH/PFl1/kWJdPCRa/jW
	UQ1IlPIYzC4wAL6fV21oJKai09CLGXejR+pVg6tfWoBeBcueiaZuDRg2D4YCbiqfruftIkQ0F4Iyk
	NcKIPeJMKHt0mfszx6P65/E0efcz05x79/LpJtbWufQrpPgd0/MDZXBaWGbQ7lBTfaiZDQvbN2ovL
	vPGEkZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbBXQ-00000006crp-0Xde;
	Thu, 01 Jan 2026 05:47:56 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbBXM-00000006crU-4311
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 05:47:54 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-55b219b2242so6470297e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 21:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767246471; x=1767851271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=;
        b=fTmwhaa5dMMbpaWpdwYlUDFC4fFnfycDnnGiLQKqrfg4zoxuEI9JT1Helr4V9wTzNU
         EwhBzBOiNGRfIJUXCrO8jEecwU2rjEqlxnblyXN/92kMLz0MJFWFDHspJIOiuBIGuAKH
         gigVqBSlt4g9+pob/zgBHCNO/d4wAlsN1NcJRLRWhTrJb31xTV4JmYtUGDMvrsLNLCCz
         yDSMoJ9vQey2QvADM6e/xardY5J55jmviXUJJXvTIOT69UR/YYNTjBeQ0mqkc1RE3zoH
         otTMEoybt+ktDcw+BweU2OKc17eNkal2tB9xRmczd798xcbGkukrBeQE7fNCEp6O3J2d
         qq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767246471; x=1767851271;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=;
        b=JbPBiXQJ4PxMJeJisWeXDNYpo5zXHqE/a3WrOFMinzJPMAaNattSZRNRU7CtCPv1pX
         twjQOsuMcnznL2AwLGGoo9sukn5NLPgnlzQg2VtrfvgR6/AG56PMVTPctnv3DYTXZQKJ
         sXfIm1eSs8+LPpCFWjUAMihOzkf7lDYcDnRGZmaaDmMpG4CYOSCQLlQWnZqfA2twH36f
         IwYTOPGl1o4tb3DoSvNscBBWZvZ7CfK3YJaoqoZ4Wo/iD1ueI66DKSOE7Yz1KA1DEoPI
         3hbPepQonvHXlviiwyQ9h480mlttp4GMv0ZWR3oOhVefD0stH7T9tPIRFPtND7BhEvho
         6s0w==
X-Forwarded-Encrypted: i=1; AJvYcCWPPFOBU7MJMFuTNeTtpR8OO+GzGqdOsM7WWxKvaPAQWakunqptZCu+YhKcYG19/wgY056EL/+YyZ3Fvj/Tbp3N@lists.infradead.org
X-Gm-Message-State: AOJu0YyIr2yeIbF5yn2Ns72yC2e1lb1LueP/gjlbzVTxQKlttWvoU74l
	zUsds3GzROcrI5VYG+E1aP7k8nLSaLTVng/jLKTs0FBpNsDbCt3zZCeyWL8BMA==
X-Gm-Gg: AY/fxX5JofdbjVK6pUwHMu+uOOM6eIwqpC60IGj7KC4Z3BwnmcUkSJEwmPaqXdiAEMs
	6CISIzRAMSVSt4+34jHaqvKq3iLc3E1+Q6A18yLT1mW2u0vXt2mTqRO7MmGwyHLh2ub7htaQTtv
	w9gO4UFNXs+97uEV6mp+beOrJi9TGCL4uEpmfk1ugu2WA5HnrFrOl8zxGwwrVK05PuKFu92Z0oo
	uLDWZSrLnn+JYwTNcLQw0rrkAiVGwkeQR5XfhhcH0T/wZkDv7/CGxvss/VaOz/AV7kg6MUTKPkL
	xHHWwviuJD2BRXXSXQrqYAlj4qFu33A8WHUwb2xnK3SFviulcS1qvJMbN+A4B0/Knsf+LO4wapS
	N0VdQ8Mq0VvhMO0vRDdiqf/fNF1UFGdAeq3jokdjlN3XlQ812n8mwwDXH2sYQbAnGk43C6g3eYV
	EFl/6qcCLC/uEJO63B3NZNln8jPrHGlBnZA94O7M40Cht/tIAbnhyliu5dzSe9APSJr5U=
X-Google-Smtp-Source: AGHT+IGPae3Q8jZNEse2CMCocxuwZFX5WX9+VfZ7NrPzlgaKICCczFjJjW7e1gwGah3gbqw68yccoA==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e7e0:1d31 with SMTP id d9443c01a7336-2a2caab9181mr464445655ad.11.1767240030084;
        Wed, 31 Dec 2025 20:00:30 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c65d66sm334482605ad.20.2025.12.31.20.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 20:00:29 -0800 (PST)
Date: Thu, 01 Jan 2026 13:00:12 +0900 (JST)
Message-Id: <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
To: fujita.tomonori@gmail.com
Cc: aliceryhl@google.com, lyude@redhat.com, a.hindborg@kernel.org,
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
In-Reply-To: <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
	<20251231-rwonce-v1-4-702a10b85278@google.com>
	<20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_214753_026779_C03A6BEC 
X-CRM114-Status: GOOD (  22.20  )
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

On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> On Wed, 31 Dec 2025 12:22:28 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>> 
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>> 
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>          // - There's no actual locking here, a racy read is fine and expected
>>          unsafe {
>> -            Instant::from_ktime(
>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>> -            )
>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>> +                &raw const (*c_timer_ptr).node.expires,
>> +            ))
>>          }
> 
> Do we actually need READ_ONCE() here? I'm not sure but would it be
> better to call the C-side API?
> 
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> index 67a36ccc3ec4..73162dea2a29 100644
> --- a/rust/helpers/time.c
> +++ b/rust/helpers/time.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
> +#include <linux/hrtimer.h>
>  #include <linux/timekeeping.h>
>  
>  void rust_helper_fsleep(unsigned long usecs)
> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>  {
>  	udelay(usec);
>  }
> +
> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> +{
> +	return timer->node.expires;
> +}

Sorry, of course this should be:

+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return hrtimer_get_expires(timer);
+}

> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00..61e656a65216 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -237,14 +237,7 @@ pub fn expires(&self) -> HrTimerInstant<T>
>  
>          // SAFETY:
>          // - Timers cannot have negative ktime_t values as their expiration time.
> -        // - There's no actual locking here, a racy read is fine and expected
> -        unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> -        }
> +        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(c_timer_ptr)) }
>      }
>  }
>  
> 

