Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5706FC44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chN8aLVvFGWQ+JrcCF2Cd3o3W+9FD6vs9BxYNNUH/BE=; b=LbwOmidD6Z7w0w4ZY4/WA4Rt39
	YvI5ozSaATJ/cbVmYOQ5DEXpGvrse3pAxfHHZ/Qs/B2HD5nYcgj/BjMuPk5uZkTp879c3/0KUAmEH
	nMqmDhcdl1xJlOpBXIfyZlempUuX6lJwziuVE8kjlWp4JPeJ7IVPKxBzNF/eHI56H5P9Ux497NlB3
	ETnfxaakZZ3hwMSyqbRmZk59Sp07nYDItcdrxjQ1+KxZIrVhUB7lQIiGCFqKnzagzUXeXSzusi0bL
	2oGEGL05sCGEB42JbZgmZq/3xMP8aT7+wnhoSq3X50N+QfxjeXaxoIMG18uzeOektrcbSKmP5Bs6b
	4SBsckCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQ40-00000000ISk-3MsH;
	Thu, 16 Jul 2026 17:40:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkQ3x-00000000IRo-24p3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:39:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so1426072a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 10:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784223596; x=1784828396; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=chN8aLVvFGWQ+JrcCF2Cd3o3W+9FD6vs9BxYNNUH/BE=;
        b=FjuDHtGmT8SqbBkPAlsq980d9d9RlBKggPUd/CIyWFPGRGdsg8N+BxWERYF5FpmCzh
         9h8aGAFyMAxrZalgJdcUlOgU1wXW1/4033CU5EzEVtCQuxG/WELekMiK6NnpQftuwh0y
         OTJtNItBx3Br4sjxqciBOvff8QqwcJXJgUfWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223596; x=1784828396;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=chN8aLVvFGWQ+JrcCF2Cd3o3W+9FD6vs9BxYNNUH/BE=;
        b=EdsbV/xSFlmelOv5B+Lk7Kiq9xfLfiI+3p/p16lU7I7oaqE3u8c9x9BHLnhuE4z8z/
         ABYBoZkE8AbP48GBTjYTsaFHmuJ6I3dQhX/bcCBpATlrgvynTphLXx8Qd4NryFDSJN7g
         WI8PhPJKzSoecVWXOYwtzFLAfX0Rt8rXaY0yZmvweb0r2ai0FXVSXUyQ9oJ5+bpO29Xj
         /LMEDrB6sADQseDJoL5ZWbNt2Mr9ZHa7hTPPKn1uJvd2KudvWbc3r9UA4CQLzFcI86Xy
         GAY6rD6jRULn6fHU7QCJuiTnw3RlTDuP9HbngfbZeKan4kYnlW9VqtsDooHiHxVgEb8d
         KFkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBeJJ6AZdDXO3eNcL9hLBHYHJAeIM1X92U9MvuM97nW9U4Vq3Zg5B1985MMbZOjiwD9aqi97mmIR5QDwHrQ40n@lists.infradead.org
X-Gm-Message-State: AOJu0YwIj7OB1OCjeM2kSQa1edXQA9VfPKb3B156gsz8iXx21hJItR82
	P6FyEstR5IlR67F1u0fDyCcET29JeQIc81ftQipOoespOu3SoESVOQlEpEklGtPJ5w==
X-Gm-Gg: AfdE7cnw6cr7T4JKc14VqcYC7i4XVdFAXfTbF8Wp6f+gQqEo+/UCqXD6ZMw/S58R1ct
	YvEGnwFM083g7JtdZj0g/1Wqf2VHwO9BGr4RabASx+n4AaurcDc/fECRntewLcjYaMbFp9wSdFc
	oKCxtE4grOD0r2xIeeCxzB6q1TuHtbIlHGer+Aeo+IGOA1XyMRV5KFcYYGJky+v8Av17t4grbhH
	2AChJz61wyvaC4AHZbE6U4RgE4x6pwg7y3GiCvP7tyMDUBZSq9ePWXnUZ1KueIf1cFz+Tbp6BoQ
	FtrqeqmYg9v/28pJziFi9oH8uEtC4Bx+/jyM0U2Zm9ny3aImsbohXrhmV487SLBeYIIHrPegkRU
	R0RjrJ63tuNvYVZCSWiSq7oQotA7cM413+ngCNeinILt+q3gMgILXjwlKkKcgojI1RhxB1f+c7X
	UHerlWj63Zjz/6fjS5JUfQqWbRqwOw0mvRH4AyRbTr
X-Received: by 2002:a17:90b:1a89:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-38e1add8ec6mr9675333a91.8.1784223596017;
        Thu, 16 Jul 2026 10:39:56 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:53a1:1e69:10ef:bc65])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3140e5647aasm13360547eec.13.2026.07.16.10.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:39:55 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:39:52 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jens Remus <jremus@linux.ibm.com>
Cc: Indu Bhagat <ibhagatgnu@gmail.com>,
	Dylan Hatch <dylanbhatch@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Weinan Liu <wnliu@google.com>, Will Deacon <will@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Kosina <jikos@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Puranjay Mohan <puranjay@kernel.org>, Song Liu <song@kernel.org>,
	joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <alkXaGJpP5BhU1a_@google.com>
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <agcEMEl-QR0g6DgF@google.com>
 <CADBMgpx38SUUuYYCm612STqh01jqv817WnJeeXYTD7Uc1r-fug@mail.gmail.com>
 <4f429a50-df5d-411f-b40e-048d3cad5133@linux.ibm.com>
 <alWCuAA7r1otvROg@google.com>
 <6e0d0afc-8a54-4763-b25d-dea122c4cd12@linux.ibm.com>
 <alezZ6tDIXSBY-v9@google.com>
 <f2be839a-07c0-4884-9cc2-afd37d025f9e@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2be839a-07c0-4884-9cc2-afd37d025f9e@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_103957_574059_F85FE978 
X-CRM114-Status: GOOD (  13.05  )
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

Hi Jens,

On Thu, Jul 16, 2026 at 01:03:35PM +0200, Jens Remus wrote:
> This proves thet assembler option --gsframe did not originate from the
> kernel Makefile, but was supplied by GCC for the assembly step.  I guess
> it gets injected by some GCC .specs file.  Please review the output of:
> for "sframe":
> 
> $ aarch64-linux-gnu-gcc -dumpspecs

Thanks for all the pointers!

$ aarch64-linux-gnu-gcc -dumpspecs | grep -B 1 sframe
*asm_options:
%{-target-help:%:print-asm-header()} %{v} %{w:-W} %{I*}  %{!m16:%{!m32:%{!mx32:%{!ffreestanding:--gsframe}}}}%(asm_debug_option) %{gz|gz=zlib:--compress-debug-sections=zlib} %{gz=none:--compress-debug-sections=none} %{gz=zstd:--compress-debug-sections=zstd} %{gz=zlib-gnu:}%a %Y %{c:%W{o*}%{!o*:-o %w%b%O}}%{!c:-o %d%w%u%O}
--
*distro_defaults_asm:
 %{!m16:%{!m32:%{!mx32:%{!ffreestanding:--gsframe}}}}

I looked further into the bug trackers here, and I see that:

(1) it seems Debian testing(?) and Ubuntu may have enabled sframe by
    default

(2) my distro is Debian-testing-based

(3) other people have already requested my distro disable sframe, due to
    issues like the following:

      https://github.com/rust-lang/rust/issues/155704
      https://salsa.debian.org/toolchain-team/gcc/-/commit/bd33f862a3f93c3d3b1fbc8dfb6b0366905d7ab4

I'll follow up with these to make sure #3 is fully resolved. Hopefully
that resolves this problem too.

Thanks again,
Brian

