Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E33CE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:From:Subject:Cc:To:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=; b=O2H4kNtk98u/cxz/+e1lYZfEG1
	K10T1/cVRasKbRHCRlCODtImEP4oHqzh38uVr+ak/IxU7ejugA7AzElC/NW79k5mMXtA/5rBnThoS
	fl1x+EB/iGL40Hast5ZDrQcy3G7yuwVgA/Q5WzvaCbfabMvuty4kEN1mhhNpEN6pbQsHSS0qrpL0j
	LILR0f9USVzUvJw7gVzQsMr40bELXitPJh/OmJD4u39qgXClB+eOr0YeBIFmwfn9vJed5EaYz0ax9
	pKMDcSisMWoc/a587M0AGx19AEt90JE5y5mE0C/7NqDN2hPFz/LvvAIrdnDqPW77863BdejYnB8+Q
	2597/uTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8fj-0000000DN1R-2axJ;
	Tue, 06 Jan 2026 15:08:37 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8fh-0000000DN04-1HcV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 15:08:34 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-3ec46e3c65bso784927fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 07:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767712112; x=1768316912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=;
        b=Z01XhaVUqgZ1amrjHI76Eq7ROz7jsB2u8nIwdWMxklEJ19lr+4qP39u78j89EW6RKs
         Z8Gh0frNFSFoq74WcmzMBcn7426uYEq8Yo9Ax+/2zZgiLvs6DMF2nFa16hRaHe8Jug6g
         7RdG6suzt1fxpBRznf/5sN8WRaLWPZtUullFtzRfVptDpH0qouav1elk43QAXoZUbuZk
         twBcHhAK+hA7RrxPu0HvxnzvB6mutYtQFZWiEcqXcpnY50jyW9lfTduH0Ab0JJFqDgZC
         bbu2lmwsdVIfvhoLVK8fDOgSmqSVIyAI+5n+WzsXfAda9hw9WAuyv2lBCSSJ702cyu5p
         MWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767712112; x=1768316912;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKsffwDmTb+4r5jC/ROuThttSG8MjIGG/prpPNSIElc=;
        b=P+8rWAKIkJjNSWyv0qm1P0QIjXgmI6odhNm1Iu8JvGZnere2hV/dEr6JDEbgmcqxXp
         bItbiaQFGTfzn639q98siTGt8V8QKvZYjC9U0tlP3cS1ZDTmA2XsJ1KCJa/RZLaycjD1
         baqoHUyZdEBF72iJEFA0sgHp8w1azLqKPoqazl68/hpMvp68in18ytoLAPc6osooRIlm
         0lYL92mxQgqBdItCDXSDoCa5mXv/7Colo+giU/jv/MRxksuQL+Q8+Eyyupx2qA+E2/IP
         gOrL3K2QYUCSmns5Cc6/3LnOBnVpBPCIRIIkWA4uStp+N3CoEfsm/DqfdkMY4pPFirx3
         kANQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Os7LGWC0ldECb7e53X7xpFcjLxCnjoIfLdkGy1RG8bayNQqq2+XShHR+kqe8hSWP2OLoZ0u8sqckm4EoFE1r@lists.infradead.org
X-Gm-Message-State: AOJu0YzpNmiq5Y18SPreSA7pRnvKyIWaCnx7D61SPks5ak23sK/Hryuw
	exFbQYGSYVRMUVjM0W/fY2smJ0qGUT4SDRXm4nqhlrYwQKRwjYBINEj2Afr7gQ==
X-Gm-Gg: AY/fxX5SBao3V877SsJwETV1o8V6msVXbYDpEIJfMe0tkUu4oGAYMl1I208viU6Rksg
	nRAj3V3Os0m5ZD9TdBe4gtw1nSLqU9quW66xNDk0FvJdXgkp4BOQgidOK02JJSqa2AsdwpEtqsV
	oTjopxzOiIzG1UOaeLmu8DfFyeYVP/RZ0uUITul5EWnwneY1HIsCP7fTujV6zS64cYKl+1zH4xk
	tLfllU9Tt3Wi3QVpgwlqJVoQloqGxyJJjkCHpK33hUpiEsBfb7KnjqS5PEV/iKi0KUmXbkzlqRp
	gh/wqCBPNQd8CQmvkddDHBijG75EPm6Os+h4FjG4qAeytEqgPjU9u1OwVPlfroH9rFRQxkR/9CQ
	c1oikf9+BAvtWxtLr6AN6UnA4etAnCHuYSrVDQarmAxERxHpTGOp6FMtIUoCMpfOafIMT8/mm3a
	ym12SJXheBGBL84PbSbLV0RBSav62B/hcInBF9fe+DvKjfmgbHVTL6Zkpq+PHZKA4KaDj25rRcx
	2MSPg==
X-Google-Smtp-Source: AGHT+IH/kVjMXJLsPqWXcn8kSZ3ELVQYHHdFG6UtOJC68eA3mthYgJwMef8DW8mEX3Opv7mL8wv7Fw==
X-Received: by 2002:a17:90a:c888:b0:32e:5d87:8abc with SMTP id 98e67ed59e1d1-34f5f35d5e2mr2098780a91.36.1767706121439;
        Tue, 06 Jan 2026 05:28:41 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm2356135a91.3.2026.01.06.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:28:41 -0800 (PST)
Date: Tue, 06 Jan 2026 22:28:26 +0900 (JST)
Message-Id: <20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
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
In-Reply-To: <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
References: <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
	<20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
	<87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_070833_359015_76F53C34 
X-CRM114-Status: GOOD (  20.42  )
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

On Tue, 06 Jan 2026 13:37:34 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
>> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>>
>>> On Wed, 31 Dec 2025 12:22:28 +0000
>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>
>>>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>>>>
>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>> ---
>>>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>>>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>>>> --- a/rust/kernel/time/hrtimer.rs
>>>> +++ b/rust/kernel/time/hrtimer.rs
>>>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>>>          // - There's no actual locking here, a racy read is fine and expected
>>>>          unsafe {
>>>> -            Instant::from_ktime(
>>>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>>>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>>>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>>>> -            )
>>>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>>>> +                &raw const (*c_timer_ptr).node.expires,
>>>> +            ))
>>>>          }
>>>
>>> Do we actually need READ_ONCE() here? I'm not sure but would it be
>>> better to call the C-side API?
>>>
>>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>>> index 67a36ccc3ec4..73162dea2a29 100644
>>> --- a/rust/helpers/time.c
>>> +++ b/rust/helpers/time.c
>>> @@ -2,6 +2,7 @@
>>>
>>>  #include <linux/delay.h>
>>>  #include <linux/ktime.h>
>>> +#include <linux/hrtimer.h>
>>>  #include <linux/timekeeping.h>
>>>
>>>  void rust_helper_fsleep(unsigned long usecs)
>>> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>>>  {
>>>  	udelay(usec);
>>>  }
>>> +
>>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>>> +{
>>> +	return timer->node.expires;
>>> +}
>>
>> Sorry, of course this should be:
>>
>> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
>> +{
>> +	return hrtimer_get_expires(timer);
>> +}
>>
> 
> This is a potentially racy read. As far as I recall, we determined that
> using read_once is the proper way to handle the situation.
> 
> I do not think it makes a difference that the read is done by C code.

What does "racy read" mean here?

The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
would using READ_ONCE() on the Rust side make a difference?


