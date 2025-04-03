Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5E9C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=; b=c8idmPZO5ebjEkmmXUtDGD1phE
	kmpjFpIdjjpSOs16OvBB8uTov+duTB6ZgWdU8jahNV43U9BaQ76ZkJgHahglZ3oVvRJkos+xLwcb7
	71PuiVUYR9IuXhmEvljfjADOUANn0zq8Lfix0lu59U/CqHxo9czid+yfhCgWvyF0wvk/fkf+g5JOW
	Shq0IKogeWgdArlLdBC4KLeXrmvC5dd4Md49lLfkeEx1VKKarrSSePUT4gV1+ZQSBYgoqZnzqOxBd
	x5gbBAoNOTzdOaosNs2IcY4WW/8IKOO/dLQbqXi+fqOf5iDS9DvKt/4vpyZWje+zxqbc+QUX4WnlM
	g/TXJ2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0R0L-00000009vXZ-0uHn;
	Thu, 03 Apr 2025 20:17:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0QyU-00000009vBH-1esi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 20:15:43 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2263428c8baso10005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743711341; x=1744316141; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=;
        b=qcVk4nkfiK7qgYz0Uf0U4DlGhFjSmkOTTtbEiBJi0wTA7khVo6n7z7mPZmIg6Zu26P
         bq0Ewbqs+4Np6kny6IZtcf1hu1Az3rn6Jw3suImS95lzKyxDaDAFxkkjp4yXgu/wudJV
         S6rm+DUPkIaV1bm5oLpnGStJlbv48htiTR9sMfAH1zQ5jfelsZNlTaMfbkeXagOsVeRL
         +wPHRJCgUtIShBoEae5LfSIVKtBbOCZ8ALDepWN0B5J9h6zig048e3nqT6TpPK8hIfOy
         +NpY1yWlW1NS/nSMFwExjQvAZs8+zuheb84yNWBdw4iVntH/ythd2tEodSCfwO+KmLOI
         S09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711341; x=1744316141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9FiIG9VAdbY9vvhPrckluTadBWrK7mI9etYkWzR0uM=;
        b=L5Z4b24248e5GdDXM+oRIf9foeOY5DWXwmB5jo5BM6dpmxusUyqBq4oeK8RTYs4SY6
         Kp3cK0ns46SHhjjpvwqA4jqEpv4qk0qraRL8JP2QgMT2B/2lAaJrUmlDHXxd7PTRhvVi
         r4DTmYfLaJnbDqfOdHtghZPdQGdJk9MVpUtEwbtu3Ylt08/Lum3x/Bxct/oj+WaHbCq1
         QDrtbLcVFD+5QucPR2JlcZjyl0+VEWknOfg+u0ITYaeCEjQDmy/3cO7TNMrxW3AubHZQ
         xUBE+yP763+TcIw3dxleU56OUJvvPzAsHrtbPUcUyLBKT8L6wE1prLxaynuizTLF2nzV
         QMJg==
X-Forwarded-Encrypted: i=1; AJvYcCUBMEWkZpowITm0EskJ1Q68q8km8XP2wshetv6GP5/5YKSyc6aaA2iau1vg42Od8SPMcxkCTAjgGf569d/hnEh3@lists.infradead.org
X-Gm-Message-State: AOJu0YwA8yB2k+ij6r9yQokYzfdVOknVoaFuUv76jY7XdPn82GCMYb3p
	H7ypiNJO/8UubuUqrd90h2wU28+xlN3jo8LEcO+hWmfmG5teWbBY6086ytdpeQ==
X-Gm-Gg: ASbGncv3+iWY9iIa0lwDlN7ezqGD4A21t2jNEBiU9Qs6aX6uSlQsja/kDIGHDXLw8i2
	Jh1kprSOu4cK+FH/GyT74+BuBkybYPgZszHK+wjNozp4Iy2JJFIU53NO/tAFnERFaeWgfve79jQ
	kCuQnlCIFKTQDVcA9X8ZWNivDYSeotNMFlEDJYAmKGQTeGsVgpQqpy0sibyX4kDp4ahC0LUgHBi
	QP8KsjWSzhnql0bP5Lp0Bcki4YR9uEzeuzGg3Ku9sSX4qA56g/0ksl/ITVpD3Fp6MZnmHmf5kzC
	OA3X4qVPvgFTiVHwI5NuHFy+eqDDfas6LGlDf6vxaUEoJJs0LLr2tzyccuK6kvlyqw25Vzf71jP
	mlQ9YDKU=
X-Google-Smtp-Source: AGHT+IHjSj+UBbEWgXjBxDtxoLUefEdWlIf+aTvXEvObr0AnxhKwZTfr4leY27mrWcr7YIZG65soJw==
X-Received: by 2002:a17:902:d487:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22a8b6b2832mr11915ad.3.1743711340284;
        Thu, 03 Apr 2025 13:15:40 -0700 (PDT)
Received: from google.com (69.8.247.35.bc.googleusercontent.com. [35.247.8.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b41f1sm1978828b3a.147.2025.04.03.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:15:39 -0700 (PDT)
Date: Thu, 3 Apr 2025 20:15:34 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Fangrui Song <i@maskray.me>, Joao Moreira <joao@overdrivepizza.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: kCFI && patchable-function-entry=M,N
Message-ID: <20250403201534.GA197065@google.com>
References: <Y1LBGZPMfCZ8A1bl@FVFF77S0Q05N>
 <Y1QEzk/A41PKLEPe@hirez.programming.kicks-ass.net>
 <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1Z12xuY9fDaHuCm@FVFF77S0Q05N>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_131542_434207_ACC8F80C 
X-CRM114-Status: GOOD (  30.83  )
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

Hi folks,

On Mon, Oct 24, 2022 at 12:24:11PM +0100, Mark Rutland wrote:
> On Sat, Oct 22, 2022 at 04:57:18PM +0200, Peter Zijlstra wrote:
> > On Fri, Oct 21, 2022 at 04:56:20PM +0100, Mark Rutland wrote:
> > > Hi,
> > > 
> > > For arm64, I'd like to use -fatchable-function-entry=M,N (where N > 0), for our
> > > ftrace implementation, which instruments *some* but not all functions.
> > > Unfortuntately, this doesn't play nicely with -fsanitize=kcfi, as instrumented
> > > and non-instrumented functions don't agree on where the type hash should live
> > > relative to the function entry point, making them incompatible with one another.
> > > AFAICT, there's no mechanism today to get them to agree.
> > > 
> > > Today we use -fatchable-function-entry=2, which happens to avoid this.
> > 
> > > ... but I understand that for x86, folk want the pre-function NOPs to
> > > fall-through into the body of the function.
> > 
> > Yep.
> > 
> > > Is there any mechanism today that we could use to solve this, or could we
> > > extend clang to have some options to control this behaviour?
> > 
> > So the main pain-point for you is differentiating between function with
> > notrace and those without it, right?
> > 
> > That is; suppose you (like x86) globally do:
> > -fpatchable-function-entry=4,2 to get a consistent function signature,
> > you're up a creek because you use the __patchable_function_entries
> > section to drive ftrace and now every function will have it.
> > 
> > So perhaps something like:
> > 
> >  -fpatchable-function-entry=N,M,sectionname
> > 
> > would help, then you can have notrace be the same layout, except a
> > different section. Eg. something like:
> > 
> >  #define notrace __attribute__((patchable_function_entry(4,2,__notrace_function_entries)))
> 
> FWIW, I think that'd work for me, and that was roughly my original proposal on
> IRC. My only concern with this approach is code size, since all uninstrumented
> functions gain some point less prefix NOPs.

It took me a couple of years to find the time to look into this,
but here's a Clang patch I committed yesterday that adds support
for a section parameter:

https://github.com/llvm/llvm-project/commit/acc6bcdc504ad2e8c09a628dc18de0067f7344b8

Sami

