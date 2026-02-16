Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F982E7BD8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86+3Ol8ufgkpxEsjqivLYye2L+eLEE02N4njJxkXOz4=; b=dJSBvMRYITJcGYCoYKoXqzN/0v
	BRO4eNB7o61hoNkXMF9FRtIkjbiJJr9HEXEArqMqY4VkYxqb/Ev/E+0lShx4GgpFEpfO/Bwhv75jD
	67E5K3yAHCmZOYI/ev9Q1oabTf8vJwbWy/ogWLMzD5RAXo0DgGh5cy/Avw9fQfo6yjgDXBpvDO7kw
	jo9x7SuEpO1M1F0pvg54rHOXOenxJJWWLQmTz0Vt5doWK0FqRsZjY6rE1slTBY1EKUv1ZrxwxPqTf
	wXLUPoZq1TFbp0xYjmB5yNatfcqajTtwDJJBpN2nolbwEwf4I63GS+cN4v3O8MT4UJ/bDlI7tRv3D
	uWxw/aEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwTj-00000006Py0-01AC;
	Mon, 16 Feb 2026 11:09:23 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwTf-00000006PxW-0UOx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:09:22 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so34524235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240157; x=1771844957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86+3Ol8ufgkpxEsjqivLYye2L+eLEE02N4njJxkXOz4=;
        b=f7hxkbSSPJ5BdyPrP3Cbg328RsvFRx66fsH1rs6YiHdOyMcqP9ssbRUa/CYrUTPJOK
         9JIzD9jxSRgU7sD/NhHIvFHE9CQ9aYmBSJtEFk5A6xeYC3oWAhohI5704tPdjPUKkdCX
         1lQRWzIndUGbqOzkX0v40ttV4CPzfmhEVGflaYFq1V1N8JTM3imCX+lxZyLYg2QL1ewv
         AYQFxdqDmx2tQF2RbwCwVMIL0cmELLK4Z5FaiJ6av5UE0K9v6rCo8BjPaaDD3nXZwhYx
         fVNmxKoe4LUWmBFNBzbcCZQea2Hn7SYIcyBiOn0ENN73DLYSeOwebN1dA41uy3nIuGzP
         9X9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240157; x=1771844957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=86+3Ol8ufgkpxEsjqivLYye2L+eLEE02N4njJxkXOz4=;
        b=NDxTQOF4jcHSmJmUbJtqYTAoRLSdjW2FgU49Zgg/OGBsEWrSm4jd48Ud8/O8AlbbBL
         HgFEyYuVe/S5XOYNO0RZSiMJsVzQC18Bj3Cd/g2ZIuZkYiLSPMNsydTFqez3tUeH8oSl
         fMbroO9wspQle0+Ff0rgu3Mfwjgwe53rJe54Brci0cvLsqXZ36sqlBMsrfJPVGQHzfsx
         QOBD/Rtj8AiBciDsNMUz1XIC9n8SjrSYevy+Qv6t03kc3cmw4LqUjrTFTyHn2uPCl+ZQ
         7EnMtflf6Lg8w37yurfBCH5DISYyhcOO7g1A0RTNVcJheQcJIEefqiQewk/p0ld+tcx4
         J6dg==
X-Forwarded-Encrypted: i=1; AJvYcCVKre7Fr8sjISp2ox6unGRMUpL2FYvniDQLlwo9zwLPUzoaNsG9uxa9kD26avDsJJyv+yA7H4Asqi8EZpEUGvFI@lists.infradead.org
X-Gm-Message-State: AOJu0YwuT9CwZJ9K9Tbmg2FVjWWTuolJJpLTT/jQ6by4o1WhTOb8tYKL
	kgFSibTRrHZOl4xUXoYPMUJdSGI1mL9x0V4wNfXso2+6AJOtp/Z/56Eq
X-Gm-Gg: AZuq6aLfXyvwSB4HgRjSQbCd29LxFPLgXSQO+EwsjziTwdWL1+JVSHlN7VAi+jrMIGw
	q15rZzZmUGxTRTo3aOLf4/8M8UylFMfgph7fD4mdJsb1wixhPx+yY6Wjkc27t9iE1FQ562ReCjI
	NKXHHGZrsKXBq4KFJaSiJSFkeYGuhaJoNORr2wLmC7y3Mdv//qpbe9ekAYaBKd3u9x7nd+C24TC
	xLmH/zNxpHC2oVhvaiGPKeSLN35qct74DrzIXsFdtxQcBYb4CboDLtrHYN3mZaj07+Hw7kl6pjQ
	o494qANBDVIdq6fLNVhCvRd4TsAM8N8Gsavey911TxziEDYffBIGkXqvASMAGSRiJ9RZ9ebN/Le
	BI5gk+iv7Q2SIP9CO1uSkS13j5jo+OM7hMn1jymZwW+oRyFQj1ZnBerqUEFdevR7c55mSs/dmm1
	8tZEhW6+E/oaBHVRkh7+jDsmCssqd/qoQOjUa79xezde1PSVbS37FJ7gyZLywMhXjr
X-Received: by 2002:a05:600c:3e87:b0:480:32da:f338 with SMTP id 5b1f17b1804b1-48373a0f961mr151759405e9.14.1771240156943;
        Mon, 16 Feb 2026 03:09:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm657254105e9.9.2026.02.16.03.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:09:16 -0800 (PST)
Date: Mon, 16 Feb 2026 11:09:15 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, Arnd
 Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boqun Feng
 <boqun@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260216110915.4f0d5490@pumpkin>
In-Reply-To: <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
References: <20260130132951.2714396-1-elver@google.com>
	<20260130132951.2714396-4-elver@google.com>
	<aYDFOIskB20CbztD@willie-the-truck>
	<20260202192923.0707e463@pumpkin>
	<aYHgNSF5a3F7UGU_@willie-the-truck>
	<CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
	<20260204131400.GI2995752@noisy.programming.kicks-ass.net>
	<aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
	<CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030919_176414_F8F60507 
X-CRM114-Status: GOOD (  26.76  )
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

On Sun, 15 Feb 2026 15:40:07 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sun, 15 Feb 2026 at 14:44, Marco Elver <elver@google.com> wrote:
> >
> > I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
> > case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
> > 8 bytes (due to that static assert), but that itself uses the
> > __READ_ONCE() helper which these patches were touching.  
> 
> I think we could just make __READ_ONCE() be totally unchecked - just
> make it be "const volatile typeof()" and leave it at that.
> 
> Anybody who uses __READ_ONCE() would then have to deal with it.
> 
> There are very few users of that left, I think it's mainly
> arch_atomic_read(), which just doesn't want any of the checking that a
> regular "READ_ONCE()" does.
> 
> In fact, there are *so* few users left that I think we could probably
> just remove __READ_ONCE() entirely, and make our "atomic_t" use
> "volatile" in the type itself.
> 
> I generally absolutely hate volatile on data structures - it's a
> design mistake (an understandable one: it was at least partly designed
> for memory mapped IO accesses), and the volatile should be in the
> accesses, not the data, because very often the volatility of the data
> depends on context, not on the data.

IIRC The bots are now bleating when there is a READ_ONCE() in one
place but a write without a matching WRITE_ONCE().
That is effectively forcing all the accesses to be volatile regardless
of the context.
Which is pretty much equivalent to making the structure members volatile.
So if all you care about is 'inverted CSE' and read/write tearing
then volatile structure members DTRT.
What you probably don't want is 'volatile struct foo *'.

volatile structure members are almost free, you lose CSE and some versions
of gcc 'forget' that a load zero/sign extended a byte and do it again.
(I had to use barrier() rather than volatile in some code where I really
did care about single instructions.)

I've never see gcc reload a local, but I have seen it do CSE then
spill the value to stack.

	David


> 
> But our "atomic_t" is already properly wrapped, and nobody should be
> accessing it with anything but our helpers, so putting the volatile
> there looks ok.
> 
>              Linus
> 


