Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7420CD1BDFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EzIIL5jV51s8QxZDArUoUfDkcHu/NNqV1EZULNrSbms=; b=gUU3eyWOwpR5UeB2dnYNdBeo2j
	kK4kpfYZWqidTi3lHPg7XE3xVtuGtLVyeJtFsWOkt4CJA1OQovxr+Avq+1kV/pt15Bt0pQMVEgAER
	kVdFcNyhJBfdjgQWV9SqCcdKYvaCJl6YU7Xl8GQBKUS1E20MUb0/P3M9Bt79M2w9IYwbWiY+bOVWp
	2kIxwHc1PB4e2kJKinPGTcvdmhsMfYikaBpplA7E5VLlUrwHzFtTzjplLaa84dGtCS9Av5ZIRWFRY
	AYLkvcYlkzbXAZg08A6RItSPWXdVjWu07+UVx0ms1uYvtpDtHpn1nRg1IxeRjPVjcKogADgqCQYbc
	/iWN9CUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84s7-0000000FD9A-1msa;
	Mon, 04 Nov 2024 21:44:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84h9-0000000FB51-2UL0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 04 Nov 2024 21:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EzIIL5jV51s8QxZDArUoUfDkcHu/NNqV1EZULNrSbms=; b=R+XnTxQYsL/G1l7E2Yd+y9SMjG
	4nWSpPtZrv+FMWmwuXWcdJjY4FVyWI0PQE2XEXgqe183CBZrt1/ZEyO1iu11i1NFxWduDymHVoPfU
	8hbw3naTAv6LihINda/KPUQY+HL9AqL8R8KTn6IshnaT5j9pBjMY0o4nOLc4engOBKSivYjjLWbt8
	DoHA3h9jt69j8UhDxXAJ1d9AS5PPuljJ9Kcgto2OoWDQHu6DoSpZQ8BNxIZMgmRFovRP0YCvQYIdq
	jlaCVm65Xzt9egY2RMU7v80WOxsqQE5xoxw1xAAy9oPMdOu7AnGv+k6VD1im3H5nqxGOBbX76k3uC
	/VW3kJAA==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84h3-0000000Ba2d-2Wmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 21:33:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-720be27db27so3767366b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 13:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730755977; x=1731360777; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EzIIL5jV51s8QxZDArUoUfDkcHu/NNqV1EZULNrSbms=;
        b=VvNTuHIniX0zk5sB28eq7jz4AkqmVBwQ7U191Hwg4SiXvzHhIKgDzX1SitfMjwu5p7
         AoeW95ao3nPMycrTSc71MhSAR22DmCclaz3Lw8Ja3BbELVFqLetqNroHYXNGdUm/jtWf
         3eiX1Wso4xLiNbDB7fxiQUAPci4eVyG6IknR4ycWm5aDW+zbnbej04iko8XEq31A+shX
         +JrmqRlc/zPf0LMCJ5/u2FGtVDJKKTvyhH/m4149P2RfnmBZQ4to7WnM+NXDkZPGraiH
         SkA6GlNPfFGPoMWFC/EPiE1Y2nL4EARgr9BU6f1DMA5UVwBzCESgIuQa/RlPdi8fjNnX
         rSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730755977; x=1731360777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EzIIL5jV51s8QxZDArUoUfDkcHu/NNqV1EZULNrSbms=;
        b=FkmY8lfvx9pIGcbW3MqqXofuqlh6wh1PzAZWTEKMkFf/z2Jhi8KRi9ie5vVYBCiFkk
         lW626qYwGVi7HXfKpNcQURj3FQrCXXN3tuPK9BnBKnSfX5BVc/N7gi6otjqJdFcwOEkB
         d3pZhRIyUwoV2OHWTX+s4jnrycr/CU+x3GpSbetuX2GeMV2+FComu2vEURBPT8gvlDGC
         PtoH8G13VZVIAg7KgcFA2ex5PgnF62185SAApgjr8M7OYkHzMaqiTg7tHoZO4EBC8dnT
         h8emaKN/kPnqyvSJUaIZgxX+k9lkO+wjiHn+3I9Jp4JGgDYTNLfZoKFI3+Cj3ezfahN3
         uiSw==
X-Forwarded-Encrypted: i=1; AJvYcCU0lJveaRhmNTflFh7yMQuvFVBeGBNW3fZBDbkBEK5r1QbA4889daQICoaw8tdjRxWw9hrdFVmnBJA0ruRLfcg+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmmyoz1jxV82aPvKRL0SLID0LK1+KcmTKJpFfJmKScW/QWZQyx
	1SuIkpBF/TUUy9CHxG+SaoZtF4uT7IC00i294LtVeBjPsZVT5ZK2I6wmr3rJN7w=
X-Google-Smtp-Source: AGHT+IE1gCnZHDhbNSzOxIsLAwqp2zm4KQPfqsRjT/TyxizeRL+Gzx/ZXVxE+GJ5uzuO8nBhG5XzOQ==
X-Received: by 2002:a05:6a21:9993:b0:1db:d8df:8c4e with SMTP id adf61e73a8af0-1dbd8dfc276mr7417523637.12.1730755977373;
        Mon, 04 Nov 2024 13:32:57 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ef7d9sm8114469b3a.83.2024.11.04.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:32:56 -0800 (PST)
Date: Mon, 4 Nov 2024 13:32:53 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, guoren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFT 00/16] perf tools: Use generic syscall scripts for
 all archs
Message-ID: <Zyk9hX8CB_2rbWsi@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_213303_834373_050CA885 
X-CRM114-Status: GOOD (  27.91  )
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

On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > Standardize the generation of syscall headers around syscall tables.
> > Previously each architecture independently selected how syscall headers
> > would be generated, or would not define a way and fallback onto
> > libaudit. Convert all architectures to use a standard syscall header
> > generation script and allow each architecture to override the syscall
> > table to use if they do not use the generic table.
> >
> > As a result of these changes, no architecture will require libaudit, and
> > so the fallback case of using libaudit is removed by this series.
> >
> > Testing:
> >
> > I have tested that the syscall mappings of id to name generation works
> > as expected for every architecture, but I have only validated that perf
> > trace compiles and runs as expected on riscv, arm64, and x86_64.
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> 
> Thanks for doing this, I had plans to do this myself, but hadn't
> completed that bit so far. I'm travelling at the moment, so I'm
> not sure I have time to look at it in enough detail this week.
> 
> One problem I ran into doing this previously was the incompatible
> format of the tables for x86 and s390, which have conflicting
> interpretations of what the '-' character means. It's possible
> that this is only really relevant for the in-kernel table,
> not the version in tools.
> 

I don't think that is an issue for this usecase because the only
information that is taken from the syscall table is the number and the
name of the syscall. '-' doesn't appear in either of these columns! 

- Charlie

>      Arnd

