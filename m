Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA32EE57CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=; b=Ibil7ZMwSUyrDrZ+eBv1qcq/wR
	nymPaFliTFju8z59zULEH4fpFsfWxBDjWktn2NIYoyRt2MO6zfmZwu9JXDZhWI4wFBHOB7A2cJ/1Y
	8k3kGjF62Wc/NfqgSG0EgEk92D2vDKMQa8IBCrwDmxuSkHXPpKcTVLS7Np/YH6F7u7KIiYeitTl2f
	ubzac8wDd8Md1H5EJIHVM04SQquQ7EoBXK4eoboG2C7gYHbOD9zXUgnBBtawNAvZN8KW2AZSfYqly
	VfgjULR4/Rs5hfD6JrkbLSegbxYj6az6Th7bw1kvJxB7hdNXy5fFKv05yguxx2De5PRz/ydN7GbHe
	11w+R6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9oO-00000006Ztc-3fOM;
	Thu, 01 Jan 2026 03:57:20 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9oM-00000006ZtF-1Jm3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:57:19 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so160860961cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767239836; x=1767844636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=;
        b=delAQtKpf4m1wdmdHudDfFubipyEpcXTKvph88wj67vfa2O3GFugRItQkWVvB+L2Xy
         5DItU6otMrXX5JWKdYHvy2zq/XO68C/fCVwuI0/4NIAHoFkWpOKCwZeHKuVCMVjtuIRD
         zYIs9qd4NppKzYxMBsOTd5rqJHgxrw0LsiD+8gGRSj5Tm7qOYBw1FLPM6msyBPu+FI02
         mArOdSLJfNVeK8xh5+l9SrXaUYbibuDF4FOhnye1xWOJ3DQkczRnXzvbZp84s0x6GeLZ
         P8wB6ZDoxCf7z9zOtFR8lZNSQ0hdX7i5D/5+JGYNQWRamgq/Km3BANkYK/ywt2eFOb7D
         t6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239836; x=1767844636;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHJ9HSrCP71SSn2XcU2kZVrOG3UT/v21uGWNywYBtRo=;
        b=jyMxN/ijRuq29gD+mQPSQbemaxbz22ZlDGyVCiJeHceT230rrXroZrM8EWg1uGiQ/c
         QxoXPA8dWshcQxBLyzHoeXwV4Mr0jQ09FuDvyLmDLCte9RCutxc3PC70yzsSUTygMbMK
         nkH+8XuQux9Wvv+YoXwbwFcA4W2v4ANzIhN/4fVm2gTBBYzNt7GpgNguwi5Z/wj57xP7
         y3OkIrfIhC0/PYWNFWrc63zPThvwd3M3rYOnHGmynDQhKZKzmvv02z6lAjGlCsjI8sp+
         ip53BtfDBT3fKsC5sdlmEz0xZoZp68E7t8lgY8Zk8CSYXt6drQ1rWaiT+wL8bk6Zshhb
         Eghw==
X-Forwarded-Encrypted: i=1; AJvYcCWPagJXFT5bSmZ5uxRw71saoqD0tnrBD/XiFX+wZPVFzm+M9ioV3Ec4UTyIQ0isYyb/8xT/TEujSHB6/MlGXtCr@lists.infradead.org
X-Gm-Message-State: AOJu0YzkH5EnDHbnAnHmh2qFa1Xl1rJeie7c3w39qsWV3mWNCNPpNVNW
	pE8IlTP+fZFWwgcPhUV0l/jWgPFtt4qhRFEqSRe/fPS1TmTxDpYR5+Wx1+WGGg==
X-Gm-Gg: AY/fxX4kN5/mdcvixVBwV5B/mfX7Tz0cXA2i4AdW9d+YXLNyIzLexeVdCxjfso0qtm1
	xrTgGmDgHfUoHjMVPlvixiWmwS+FrH4xawTBllY9Ob3Vi68vJiPlcRRJV9OmKABE9rPw6RJtWWa
	ux5sA+aso22+nTSDUYM/OQFv+nkuWLO+pGePIdVzYUXbdDRUEPPmcHIM1JWHOPHqtuaFNNmR45f
	68xmZ6Jct15b2D3B8A4r04vpuJRaShQeTITeAKaF0oGD1xgbN6qVBdtbpyQzsMbZN/nJrfGLLkl
	dpezLykULVdkwyjGLSGE/ekfu71BHc9GwM9jevG+MrHeJeLvgH/YTQdBqybGpi2tI+IIeGzA8c8
	cKKNR8XVNzzrcQxFNzgCsTJREfljgMc4gTyqIuR3M6JbIKkVqUaGX0KHtrSYkiFGDGMLSAOtn6s
	RdmretsHZpKTvKzZSGNvktnIkHiefknQLzGTugVaPEYnn5886kE48Uc02dPVWFIfh6zkE=
X-Google-Smtp-Source: AGHT+IGM0rVADS2lnU5j12v/LNHM3kU8YwfTvvv4Iz7GzLiaw8hH+kvxJs1uiRf5TU0O+ftRhl7yow==
X-Received: by 2002:a17:903:b90:b0:29f:301a:f6da with SMTP id d9443c01a7336-2a2f2a34f54mr371027125ad.43.1767233502214;
        Wed, 31 Dec 2025 18:11:42 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776c1sm334899895ad.102.2025.12.31.18.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 18:11:41 -0800 (PST)
Date: Thu, 01 Jan 2026 11:11:23 +0900 (JST)
Message-Id: <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, lyude@redhat.com, a.hindborg@kernel.org
Cc: boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, fujita.tomonori@gmail.com,
 frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251231-rwonce-v1-4-702a10b85278@google.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
	<20251231-rwonce-v1-4-702a10b85278@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_195718_370050_4C524F31 
X-CRM114-Status: GOOD (  20.79  )
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

On Wed, 31 Dec 2025 12:22:28 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> Using `READ_ONCE` is the correct way to read the `node.expires` field.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/time/hrtimer.rs | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>          // - Timers cannot have negative ktime_t values as their expiration time.
>          // - There's no actual locking here, a racy read is fine and expected
>          unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> +            Instant::from_ktime(kernel::sync::READ_ONCE(
> +                &raw const (*c_timer_ptr).node.expires,
> +            ))
>          }

Do we actually need READ_ONCE() here? I'm not sure but would it be
better to call the C-side API?

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 67a36ccc3ec4..73162dea2a29 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -2,6 +2,7 @@
 
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/hrtimer.h>
 #include <linux/timekeeping.h>
 
 void rust_helper_fsleep(unsigned long usecs)
@@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return timer->node.expires;
+}
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 856d2d929a00..61e656a65216 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -237,14 +237,7 @@ pub fn expires(&self) -> HrTimerInstant<T>
 
         // SAFETY:
         // - Timers cannot have negative ktime_t values as their expiration time.
-        // - There's no actual locking here, a racy read is fine and expected
-        unsafe {
-            Instant::from_ktime(
-                // This `read_volatile` is intended to correspond to a READ_ONCE call.
-                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
-                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
-            )
-        }
+        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(c_timer_ptr)) }
     }
 }
 

