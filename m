Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56AFD1CA0C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 23:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=; b=iEZxLoqhlhAd6rGOe15Cmufst2
	OCI0fGmWDnEt0qEFzxV+cLOZhkGUMVlD82znCBNH4plaWghhXntO+NBw1LSPsngV3OrLSo9WVuQrs
	VPgYEjP1OAYlFOLZHOAeCWcMmRjcSbzAV0sIgHw74/8y/4Jj9EQpw8JZLiun49l381NCzFdx+UA33
	jFlctu9J08JDGhoy/6jX5Un1JLJ7ZjozrY6QE29hkOJnd4mKWnXa2tRRA3m4lOI6/FbeGO9dCkRBQ
	bgiycpjRM7hw3i0Zp2vkyIjSDNWIP8m5ey094ZLhqeLaMTwcS2+tWnrYcndCkqnQaHtISOkwkTjRT
	NhbnRCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t86dR-0000000FP6p-3msM;
	Mon, 04 Nov 2024 23:37:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t86bh-0000000FOpm-3s2v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 23:35:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21145812538so15179295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 15:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730763337; x=1731368137; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=;
        b=Imk9Lry9nHJxqt0tPBLxLrzA49VR8RXM+XYEXFbdQUEY/dOTUe20Wb2zZAOvetle2D
         dt5uO1U0kRYZRmoOP9o5eHanB/zSotrF+LIXuuOZBQa2M0lUpTNgaqo/q9X23de9erqD
         GME2wykUxdxAXuAx/Ud7OAyf4W1apAYz62QeeqLx/ta7GVSLll3SGsU7Cf4PaXvAC7U3
         CDmnmXky/c3m6UmDJqpSjSTXoSZp/DnmSLcr2vCOmkfNBxn+XpcIuFrbSwt2y6qRRLrf
         d3j7d/lA1up7UDh69tCQSBXJ7GRoQihEAdz6jnAYKVjaDGsxD+wJJ3raSaJq1ek9VFsI
         N3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730763337; x=1731368137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=31BGTQSdIkP/4Zu0IN+x2yZh6+VSpCdF3MI1H4dhuNY=;
        b=XpmVgCSAjaq+UeJfT1qvxVAc8mtiiTA/j4OaK0gZlQIbr4kdQQVSzi1cvhXhHBXncQ
         dKjvB5C3XuyPLYCRT0Bu8SGuPHeq5GR5UUaa0PenmSvVzwUBvKI7PSas2zOEFaRmagLO
         07Br98FXFoeVfnTKjJpsBTAwdKzCPth6Fc8KBrMkC42fKgfiaIoa8K04+yQuwFkNCe1F
         F8rs/L9vIzAg5cJvqLm9KFftozKIZywCuwz2oKigjR9cNG5SgQFUHPNV7FUIcCiX1iav
         Wb53+aneugJX0A2Mmt0dYmC6LOX62TbREl24L4BNWVvq3KoiqDGcEs02FMt+4gBkelcE
         i+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGWaRbznJDh55jImpeFKQAsVkq1h7YWDytvFXZyVTXYMM5cc14ABYT5g+tetI3S/IJTyAsoNnS7Ou9rZWF/cox@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Jpv6YYcGWOVEtw25Gg1PqdPn+yaNn7kjF9P4RXbQKj0/GL8g
	ZwCL6cB3TfAXvOF7CFkV73bYR7l3QYZo2yNrxnqAB+tDPgQU1PRojwks/cJYPZ4=
X-Google-Smtp-Source: AGHT+IHUkdei85jsd4jEJe1dv8cR5cqR+1/XIGSXNDsrFT+G8g62SWEwp7GVusVEZsJaOrWKuYtEtQ==
X-Received: by 2002:a17:903:40ca:b0:20c:a19d:e73e with SMTP id d9443c01a7336-210c6cf2237mr433175125ad.57.1730763336945;
        Mon, 04 Nov 2024 15:35:36 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c7560sm66579565ad.237.2024.11.04.15.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 15:35:36 -0800 (PST)
Date: Mon, 4 Nov 2024 15:35:33 -0800
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
Message-ID: <ZylaRaMqEsEjYjs6@ghost>
References: <20241104-perf_syscalltbl-v1-0-9adae5c761ef@rivosinc.com>
 <3b56fc50-4c6c-4520-adba-461797a3b5ec@app.fastmail.com>
 <Zyk9hX8CB_2rbWsi@ghost>
 <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUdZRbCp+2ghEUdp+qJ1BuMDuTtw9R+dFAaom+3oqQV_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_153538_663058_F2B29F06 
X-CRM114-Status: GOOD (  38.51  )
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

On Mon, Nov 04, 2024 at 02:03:28PM -0800, Ian Rogers wrote:
> On Mon, Nov 4, 2024 at 1:32 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Mon, Nov 04, 2024 at 10:13:18PM +0100, Arnd Bergmann wrote:
> > > On Mon, Nov 4, 2024, at 22:06, Charlie Jenkins wrote:
> > > > Standardize the generation of syscall headers around syscall tables.
> > > > Previously each architecture independently selected how syscall headers
> > > > would be generated, or would not define a way and fallback onto
> > > > libaudit. Convert all architectures to use a standard syscall header
> > > > generation script and allow each architecture to override the syscall
> > > > table to use if they do not use the generic table.
> > > >
> > > > As a result of these changes, no architecture will require libaudit, and
> > > > so the fallback case of using libaudit is removed by this series.
> > > >
> > > > Testing:
> > > >
> > > > I have tested that the syscall mappings of id to name generation works
> > > > as expected for every architecture, but I have only validated that perf
> > > > trace compiles and runs as expected on riscv, arm64, and x86_64.
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > >
> > > Thanks for doing this, I had plans to do this myself, but hadn't
> > > completed that bit so far. I'm travelling at the moment, so I'm
> > > not sure I have time to look at it in enough detail this week.
> > >
> > > One problem I ran into doing this previously was the incompatible
> > > format of the tables for x86 and s390, which have conflicting
> > > interpretations of what the '-' character means. It's possible
> > > that this is only really relevant for the in-kernel table,
> > > not the version in tools.
> > >
> >
> > I don't think that is an issue for this usecase because the only
> > information that is taken from the syscall table is the number and the
> > name of the syscall. '-' doesn't appear in either of these columns!
> 
> This is cool stuff. An area that may not be immediately apparent for
> improvement is that the x86-64 build only has access to the 64-bit
> syscall table. Perhaps all the syscall tables should always be built
> and then at runtime the architecture of the perf.data file, etc. used
> to choose the appropriate one. The cleanup to add an ELF host #define
> could help with this:
> https://lore.kernel.org/linux-perf-users/20241017002520.59124-1-irogers@google.com/

Oh that's a great idea! I think these changes will make it more seamless
to make that a reality.

> 
> Ultimately I'd like to see less arch code as it inherently makes cross
> platform worker harder. That doesn't impact this work which I'm happy
> to review.

Yeah I agree. Reducing arch code was the motivation for this change.
There was the issue a couple weeks ago that caused all architectures
that used libaudit to break from commit 7a2fb5619cc1fb53 ("perf trace:
Fix iteration of syscall ids in syscalltbl->entries"), so this change
will eliminate that source of difference between architectures.

- Charlie

> 
> Thanks,
> Ian

