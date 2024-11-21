Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F48BD75BB0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 04:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=; b=b6xcR3jBzIoEDa4iAqXWDlBIVd
	q3FrNsFzma1AO7uB21C9sIdITQHTYcZdir3emZPIZWUoqAMo44VrYJseFMaO7aAIH5ZU47YmNr6qC
	e+jpaoYLPWsHkTQUvHmo3UVAZN2zdcoMO2j/bwpuimwjuD/VnXhctF1+WpXewKLhmihqtDxdYfOkf
	sRMielobDBVV2GBvEnLjCA1VN2v1DYF7DWhzKjF2nYwsSwPLYz48wmkITo7TzGYntnyEB1PcDkaO9
	iLQ9T9Up3lrBgYsbi0OZ5H8nkS3LbuhTfnK/70D2O8STHrhyKPS2yVBxXMUZFir0AX2lYBMM7A5Xq
	Q3w+yM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyj1-0000000Gltv-2cSb;
	Thu, 21 Nov 2024 04:23:27 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyi4-0000000Glkr-1uly
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 04:22:30 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-6eea47d51aeso4117927b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 20:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732162947; x=1732767747; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=;
        b=Qt+Pohig3fM9/2HYcf7m6nD9Il+Syqf7PoERE56KXA80TRcJHpnhFqfWjJDlGV7F35
         XFFtDxvnrkqhKQrrSJqClrkJ19qfbW/L3lztSwvp0PsXjlMKuc3XigyEwrz8XyLIg95C
         pMDuPyCkK9k6xIx382hWT/Iiy3YjxeaVFSgrKGfsVLeC8bZNtEXSbMaBI/WQvZhc45+7
         ecy2tO62R4g2qfq2gXBRDTPZ/RLep/ZHXPgDDV7WQgSXSEz6ck+M45QaB/VV+8iedeKS
         qDkDk0wyFsCaORvsb4+2KXyziWO612HZK9iHTnAHlDSeCSzVBZHGwX5wKdMH97e6coqQ
         ds6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162947; x=1732767747;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cP3Um0hz7Gv16Gtk91dL7DlYT6sIqAVCB2yrXnpMevM=;
        b=dVmKWxvveEE6oFNVVann/KwR219acaVxw2IRmvFdlysjQcg5Y6ogafZMh/5iiQt/b1
         stpujW4oqGb+6B3aEV31tVyO2l5kb3j2YOpzMNTlCrVqfn2td+vYxpe/5Djs4nG6d/0c
         gB5EqgbX9J982QSy7qtS0ZsOMDj1cqOGoaIWix8cJFkY9QlomALeXygtnggXN85GcPEt
         hK52oKka6/WXOf2KvpjYtH8EWAOTTd5Brr+KXx0ogy5eOf+7+E0wBLex9Jgl9lMiHrfW
         u2NTLIJ2RkhjbVnY9zxa8MSkIZPjRD1TR1eieYqplWuL1KPP37WeFYksVQBvWAC8W9lR
         R8LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXaFPz9k5ojtmuiTr9Dc2Eg3jwhYBEgmz771oM7NnFvBb9Mwgp25tvQZAGzgdXM1gtdw8lNNiZlnMWF+hjiYJG@lists.infradead.org
X-Gm-Message-State: AOJu0Yykgl6BVBqSTVIhLn0W6qKYr2FM+vY2YM/YMkTGkEY2rtqx3DJU
	Liw8a59aZfPz5d/Ry1ywXwiwhcRbSPpqRsqSElPtfeMlQiiXpAUZw0wawjH6CwPCJzJdQmhQ7o8
	w
X-Google-Smtp-Source: AGHT+IFG/0lmdLf+PuJVUiUVDthedJQkU+yi8kvRYeLAcyp/RSQ9OGzeQL0b0Fr9yTqYmM0khQUKNg==
X-Received: by 2002:a05:690c:5a15:b0:6ee:5068:7510 with SMTP id 00721157ae682-6eecc57b073mr20304047b3.26.1732162946630;
        Wed, 20 Nov 2024 20:22:26 -0800 (PST)
Received: from ghost ([50.146.0.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71341e4dsm25749277b3.90.2024.11.20.20.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 20:22:25 -0800 (PST)
Date: Wed, 20 Nov 2024 20:22:23 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Ian Rogers <irogers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
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
Message-ID: <Zz61f02p8s52G6ba@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
 <Zyk9hX8CB_2rbWsi@ghost>
 <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
 <ZylaRaMqEsEjYjs6@ghost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZylaRaMqEsEjYjs6@ghost>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_202228_766521_CEDCE309 
X-CRM114-Status: GOOD (  41.61  )
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

On Mon, Nov 04, 2024 at 03:35:33PM -0800, Charlie Jenkins wrote:
> On Mon, Nov 04, 2024 at 02:03:28PM -0800, Ian Rogers wrote:
> > On Mon, Nov 4, 2024 at 1:32 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > >
> > > On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> > > > On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > > > > Standardize the generation of syscall headers around syscall tables.
> > > > > Previously each architecture independently selected how syscall headers
> > > > > would be generated, or would not define a way and fallback onto
> > > > > libaudit. Convert all architectures to use a standard syscall header
> > > > > generation script and allow each architecture to override the syscall
> > > > > table to use if they do not use the generic table.
> > > > >
> > > > > As a result of these changes, no architecture will require libaudit, and
> > > > > so the fallback case of using libaudit is removed by this series.
> > > > >
> > > > > Testing:
> > > > >
> > > > > I have tested that the syscall mappings of id to name generation works
> > > > > as expected for every architecture, but I have only validated that perf
> > > > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > > > >
> > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > >
> > > > Thanks for doing this, I had plans to do this myself, but hadn't
> > > > completed that bit so far. I'm travelling at the moment, so I'm
> > > > not sure I have time to look at it in enough detail this week.
> > > >
> > > > One problem I ran into doing this previously was the incompatible
> > > > format of the tables for x86 and s390, which have conflicting
> > > > interpretations of what the '-' character means. It's possible
> > > > that this is only really relevant for the in-kernel table,
> > > > not the version in tools.
> > > >
> > >
> > > I don't think that is an issue for this usecase because the only
> > > information that is taken from the syscall table is the number and the
> > > name of the syscall. '-' doesn't appear in either of these columns!
> > 
> > This is cool stuff. An area that may not be immediately apparent for
> > improvement is that the x86-64 build only has access to the 64-bit
> > syscall table. Perhaps all the syscall tables should always be built
> > and then at runtime the architecture of the perf.data file, etc. used
> > to choose the appropriate one. The cleanup to add an ELF host #define
> > could help with this:
> > https://lore.kernel.org/linux-perf-users/20241017002520.59124-1-irogers@google.com/
> 
> Oh that's a great idea! I think these changes will make it more seamless
> to make that a reality.
> 
> > 
> > Ultimately I'd like to see less arch code as it inherently makes cross
> > platform worker harder. That doesn't impact this work which I'm happy
> > to review.
> 
> Yeah I agree. Reducing arch code was the motivation for this change.
> There was the issue a couple weeks ago that caused all architectures
> that used libaudit to break from commit 7a2fb5619cc1fb53 ("perf trace:
> Fix iteration of syscall ids in syscalltbl->entries"), so this change
> will eliminate that source of difference between architectures.
> 
> - Charlie
> 
> > 
> > Thanks,
> > Ian

Let me know if you have any feedback on this series!

- Charlie


