Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72170CEFCEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9kRQb6TCp9mLA5G8uSGQS65VbTtuKHR0kMxDo1y8mc=; b=E0HoDWKg0NhpzqdjOENU5p2bEo
	RqamPqLWTbhFs0Ohr6lA4CV1dNSCSliZ2tmzca0lLqsgQDtzAC3JuBw0/AujPTYXgusD/ZNVj5utm
	l78xCUIfu4+YasvAdd/vkwsl5iIbrHw4s9U+Wv0b3RiOerXeJCKbNspNqBqAmyFdm579EO0Xl2kCc
	WtELgXNoVfbh6Tq3F8GkXdTuUHb4fDt2ppAimknnRG6hKavdbUlaERESmC/K21PgyW48qX2k3Hrm7
	xA0VXu5qiZ2K8hXxpqSmmuIb4VM5ARW+VQ7iTBsGElLy8XA/dRNw6YPFo3SBl0gsSawgV+d2UhsCT
	MDTG84EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC1c-0000000DiBQ-1gxJ;
	Tue, 06 Jan 2026 18:43:24 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdC1Z-0000000DiAz-3O4Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:43:22 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-431054c09e3so707866f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 10:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767724999; x=1768329799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q9kRQb6TCp9mLA5G8uSGQS65VbTtuKHR0kMxDo1y8mc=;
        b=J31NIWshMIIl4NJfWapONjqILNBuC+OtcVGpFQd31hYNDAFgEQuIPtveISP5DvwOPE
         TlMp4tM1x+Gfh2ZI+LYh81yYF1xpLIJ2/F9Rm2DtHxt/SyujKoVijRV+mGw3m5T00sf0
         wmRdZFSCdbmQivAJtHEPjnjzFX5yujbN1/fIbIKxY1xn8VWCZrP+n5r9D3C8Uq7aDf0D
         5sF1I1wIL95/mH4mdyG4VeHuHC3vh3CoxzOmtoTEJJbXUQBVX3mAu7ZWj8Ybkv7wXW23
         HlrWCC5qf483V/XIqlBngynfMoeYQOjAShSuZGkU1edCyZMRpR0822cPZVXduHOCBoaz
         cq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767724999; x=1768329799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q9kRQb6TCp9mLA5G8uSGQS65VbTtuKHR0kMxDo1y8mc=;
        b=loS9KZJh4MsxSIFE1GpzeJGd9BSdQsNep5IAeUKQ4SQf8Y782qx4/3xyDvUFSM4j0Z
         bzY9TlUAIWB0xd7Bch7ZD1nYGyblF293dIZp0SqYKzihGlw8kjQr24V9kSEpvm4gypuw
         yAmSOnVRHGmMkhV4Hf3v/mztb2QOOnrrGEYmIPH8aRwiQecSmESKJ/8HWWVgLQ7YHpaM
         JUuiL40g71iEiImuhjobfyDFHXNdHyB1ItIAuxgL2Pp+K43UzGq99QQvFSOwQ9HP1QuL
         Tr3/YW68GYHnj0ZhqSosRPvY+gxmA74qllb+ltOXnC1nU8W0P5p4CUwKRvWW1bUMEC0Q
         oZ5g==
X-Forwarded-Encrypted: i=1; AJvYcCXtfnvQzREKdNY+O/NfHfia8BM9eY7IufSsSUDYQ12b3TzvDqrucqzXgOyGl2VoHOR9teVaN+invJNhkEMXFKwE@lists.infradead.org
X-Gm-Message-State: AOJu0YwvLuhNqUnzTpvDD9dhSCAhTj6Eqy7i/0qJQ0YR0ZpRNqYZq9FA
	tl73fbwgcBo3Kx4CNT7ZtmRo2NUwUgBNaKg7AZ3jCMS1PN+8ROodCgg19xTPsEKc4G+pDDkzu+8
	66Kwh7bufFWxSiuyAnA==
X-Google-Smtp-Source: AGHT+IGVcCDObMivGZ6ItRLBNbRjswIjQ3SNYuJmmzi0+OqW9p2tg/ybCzvxMsorncSHo3wGn72koB3zTO666Zo=
X-Received: from wrbgv17.prod.google.com ([2002:a05:6000:4611:b0:430:f5d7:f015])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2c0e:b0:431:752:671e with SMTP id ffacd0b85a97d-432c363280fmr199767f8f.15.1767724998951;
 Tue, 06 Jan 2026 10:43:18 -0800 (PST)
Date: Tue, 6 Jan 2026 18:43:17 +0000
In-Reply-To: <20260106152300.7fec3847.gary@garyguo.net>
Mime-Version: 1.0
References: <20251231-rwonce-v1-0-702a10b85278@google.com> <20251231-rwonce-v1-4-702a10b85278@google.com>
 <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
 <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set> <20260106152300.7fec3847.gary@garyguo.net>
Message-ID: <aV1XxWbXwkdM_AdA@google.com>
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, lyude@redhat.com, 
	boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org, 
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com, 
	catalin.marinas@arm.com, ojeda@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, mark.rutland@arm.com, 
	frederic@kernel.org, tglx@linutronix.de, anna-maria@linutronix.de, 
	jstultz@google.com, sboyd@kernel.org, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_104321_855716_E6FB6926 
X-CRM114-Status: GOOD (  18.39  )
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

On Tue, Jan 06, 2026 at 03:23:00PM +0000, Gary Guo wrote:
> On Tue, 06 Jan 2026 13:37:34 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
> 
> > "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> > >
> > > Sorry, of course this should be:
> > >
> > > +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> > > +{
> > > +	return hrtimer_get_expires(timer);
> > > +}
> > >  
> > 
> > This is a potentially racy read. As far as I recall, we determined that
> > using read_once is the proper way to handle the situation.
> > 
> > I do not think it makes a difference that the read is done by C code.
> 
> If that's the case I think the C code should be fixed by inserting the
> READ_ONCE?

I maintain my position that if this is what you recommend C code does,
it's confusing to not make the same recommendation for Rust abstractions
to the same thing.

After all, nothing is stopping you from calling atomic_read() in C too.

Alice

