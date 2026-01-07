Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A5ACD5854
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFhWg0yXknfBYjAjhY49eGT0he703gFuxz0J4Ryn4Hc=; b=XvlmrzddXGhtqWPgdYrZU8nDPp
	r3HE5RIL6eTRHhaV0Xk4DFiDqIYKac2vaYkocMYcyIrzHD7hBC3x/sPwDW23OUfuFbPQSpdRyW2HV
	2anieBQ5yt86O/SXL0PUfCAALB2fPJ7N17ZejA2mPwX3yoj+mRncKqCe5RcWQ2HX9u4f50tx/yWSf
	/aC5LsFQnt1f8DwejwG3RWlLw/iksQDmKPYn1QZwhzBCF1QeQs6QeASQHqYrQoKzDJpGRWmGpkzAi
	3ZI/1BF8X9dZ15v9p6bIIHqdS4dP/GwOtFXYxWGJa+cxReEU0l9ncSY4qo5ozFT/RCpH5DUDguMwM
	jb2Gum+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS4i-0000000EqwA-1kcs;
	Wed, 07 Jan 2026 11:51:40 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdS4g-0000000Eqvi-1F7y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:51:39 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8907f0b447aso15789586d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767786697; x=1768391497; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFhWg0yXknfBYjAjhY49eGT0he703gFuxz0J4Ryn4Hc=;
        b=MSbWObIQebMHKXMh9nMsDM75Z3X24ZTRScv9Zjlu3ePMJlV+sFhBCzJcBmzDCJjsVV
         xHrojnjfoEwEY2YsbEd+1vTkSI+80qYuXR0ovbIhBMe/iYU/xTnSnHtIZyXd4h9l6yno
         QTYhiEAu2PDRAzcEVaAwcLt6gQAAKaFoFNgbEtL/N0VtjI4iERrbDZvBzqjyeUQMC0Fg
         a1APZ87YCwd+p8AZ3k4L8HCw7anlj+5FifLBi9h5DRRs3Ke/g7kz80nmHFZUMuOfkRlT
         4F1z42AHbjf8jviibTLR7cZ3iyAXixDYa4Ud2F9/d8kUlI34Oc8hH0Mx9Q+RMqMr497c
         IyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786697; x=1768391497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eFhWg0yXknfBYjAjhY49eGT0he703gFuxz0J4Ryn4Hc=;
        b=GvTourJOFit3xW5PynF5b/FPuRZuPKSz+G3JnCP8fn3XqYM2al0KIzzLR+wqt1M7Td
         pqbw5tg1z3QuPdDsMU2BUV6AsTcB+URy1WcpyaDFXVjPA+znRKEWSLgnSKiKBsBCLN89
         GnhdeBKuddJv4XJXhvrxdVsU1lPRIkNOdDqVysGILIdBk8SgRGiiP0EkPi1l2R7U6ne3
         1uUOIrKxBLReWGI8KDQv4oean3YPA04MynsfIuBWwpTVCCxnd6qq99LmlOziW8no1jD+
         HyPP9AjEIYgV70fqCyEJMMK6mlK11i2XbjxZaJoq5BG00hsL3MDYkjfK7GTuI09sGgzp
         Ds4g==
X-Forwarded-Encrypted: i=1; AJvYcCUeaScS3H5JG37wR3jFZ0ZmJA0WS1UQ79JMr5YpqO0HMB3JHtQLHD0YmF2vWMfe2R6SvlO02cGV+oDGlgJCnm2M@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwbbn+y4OaQSsUW/ZcZy/dGJHYlQiNYb7dG35vtDwkQOUCLKY
	5CRYDvPGBZEh3UI62DATcR1u8F0ONH9lSmLnj5AhoR4FugEGWSWIjgOm
X-Gm-Gg: AY/fxX7ulCgSXBw9z61szKRyATCei4Wo9mUVRY34X9mrVCMeXQZjH5oxXkiA9DL34FO
	X3Ow3bPefbtaX0G8+oxapOCQo+XKatgSt+zpCJniUJZ2XTHUzamqv5r/VxCNuszLHSpRbWyYA3Z
	EANv8oFN+zovtgG2tGuAaDgf+eYUSJLwAELoE09t2CqGQAa1F2zAeemt5UfDGe23h/ov7teaUOu
	JAFhlfPOr92AZ3ea9bplp4vjCtSA1R9Gg5ERS/PCURapuejQPIfKZhEvR0zQZ9ulg2Mpqm7RZYa
	wHDXbH1yoNIIz5Ue4C8zX9Mx4AOKy13m3Hh7Wbeaj7+7+5Q65XFcbsEFRIyu/7eWzr2Sv/xkruk
	72bOmOqiJSPFnV6BawUPZoEKu1oNsH3GydJCHrbGuqMuaDcKZuuFkK4b3bJeeXBsDxxHe/aVTWD
	CQ+3mk66Y6urLWYzT6jpZpLhCs9/An5bDPCeN+B+z69NvjfO7YTwOxqNd6SBip+q47ju7YXt0Kv
	faP3JDoaoMwQkfUuINGughp7w==
X-Google-Smtp-Source: AGHT+IFH0acmgHQ6EWCtnqhwKaHJRPHfquNTd9/V7OoNJZcXx2+Bls4fC+zwkD99ObEzyVSuRYfHAQ==
X-Received: by 2002:ad4:5dc8:0:b0:88a:306b:f05a with SMTP id 6a1803df08f44-890841a56d1mr24709466d6.24.1767786696474;
        Wed, 07 Jan 2026 03:51:36 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077253305sm33343796d6.41.2026.01.07.03.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:51:36 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 340D0F40068;
	Wed,  7 Jan 2026 06:51:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 07 Jan 2026 06:51:35 -0500
X-ME-Sender: <xms:x0heaf_XjM8EldP7mZl_zowHomLP-0MXv_xDds5LsWx_DjphFQPC-w>
    <xme:x0heabpSfCmlgyjpQXDGdqjqwuVdgkxFRolmdFXVbMUQGWXNBgJTxzz7sVaZD5S0w
    km2S3EclWZgFtLJn1jwilL12tkxP9Kd0txl2zn-9hO5j2YylnNqLA>
X-ME-Received: <xmr:x0heaYlzu_tFXU4QxcfYGOCxoupKaRJNgKb9kawPSvS-OpSF9EjGFZUt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutddvleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpedtteeluedtteevuedttdduvefhffdvgeduffefleeuheevtddugfdvveeigedu
    geenucffohhmrghinhepvgigphhirhgvshdrhhhofienucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrd
    hfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthht
    ohepfedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrrdhhihhnuggsohhrgh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhujhhithgrrdhtohhmohhnohhrihes
    ghhmrghilhdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgrug
    gvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhi
    nhgrrhhordhorhhgpdhrtghpthhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheplhhinhhmrghgjeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:x0heaQacsUW0VmkipHTcgOP7bzaqt_FAwgGghK4qfmqIeaGBHJ4FIQ>
    <xmx:x0headt2TuVedR_biaKOaZiD9V9dQ9scTL5ryadW6DQKUU173jY_jg>
    <xmx:x0heaZq66LkmUtgAaxDhfccsF2mnCj3uLyV3TTIAsrFDbBgTIIV_Lw>
    <xmx:x0heaXnl4kpjDj3sVzT5Vi3EOgsLlwv6aJOBq3fVP2TrLU9YiwZKLA>
    <xmx:x0heaZSH49OXE6qcQRj4fsclvKNnwvgMD-Sq42Nmr6vDCcC-Is5bcBLF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 06:51:34 -0500 (EST)
Date: Wed, 7 Jan 2026 19:51:29 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, aliceryhl@google.com,
	lyude@redhat.com, will@kernel.org, peterz@infradead.org,
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
	catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
	dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
	tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
	sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
	jack@suse.cz, linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of read_volatile
Message-ID: <aV5IwaxcIF4XJvg3@tardis-2.local>
References: <L2dmGLLYJbusZn9axfRubM0hIOSTuny2cW3uyUhOVGvck7lQxTzDe0Xxf8Hw2cLxICT8kdmNAE74e-LV7YrReg==@protonmail.internalid>
 <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
 <87ikdej4s1.fsf@t14s.mail-host-address-is-not-set>
 <20260106.222826.2155269977755242640.fujita.tomonori@gmail.com>
 <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87cy3livfk.fsf@t14s.mail-host-address-is-not-set>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_035138_349025_89F68A0D 
X-CRM114-Status: GOOD (  22.01  )
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

On Wed, Jan 07, 2026 at 11:11:43AM +0100, Andreas Hindborg wrote:
> FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> 
[...]
> >>>
> >> 
> >> This is a potentially racy read. As far as I recall, we determined that
> >> using read_once is the proper way to handle the situation.
> >> 
> >> I do not think it makes a difference that the read is done by C code.
> >
> > What does "racy read" mean here?
> >
> > The C side doesn't use WRITE_ONCE() or READ_ONCE for node.expires. How
> > would using READ_ONCE() on the Rust side make a difference?
> 
> Data races like this are UB in Rust. As far as I understand, using this
> READ_ONCE implementation or a relaxed atomic read would make the read
> well defined. I am not aware if this is only the case if all writes to
> the location from C also use atomic operations or WRITE_ONCE. @Boqun?
> 

I took a look into this, the current C code is probably fine (i.e.
without READ_ONCE() or WRITE_ONCE()) because the accesses are

1) protected by timer base locking or
2) in a timer callback which provides exclusive accesses to .expires as
   well. Note that hrtimer_cancel() doesn't need to access .expires, so
   a timer callback racing with a hrtimer_cancel() is fine.

(I may miss one or two cases, but most of the cases are fine)

The problem in Rust code is that HrTimer::expires() is a pub function,
so in 2) a HrTimer::expires() can race with hrtimer_forward(), which
causes data races.

We either change hrtimer C code to support such a usage (against data
races) or change the usage of this HrTimer::expires() function. Using
READ_ONCE() here won't work. (Yes, we could say assuming all plain
writes on .expires in C are atomic as some other code does, but hrtimer
doesn't rely on this, so I don't think we should either)

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 

