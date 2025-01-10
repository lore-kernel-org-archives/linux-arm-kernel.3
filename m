Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69349E7719C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=35HDL/9/HslTpj2dA5/nLIt5mYGPVauI7ryFnvfVDrw=; b=KR2+VySRJRplCRPPm0p7K/M9RI
	30l6V1BTiT1bwdFPZPdH3zHECUqf1b0vaFOZIYDbQMcSseVNohRb6R9HCPFEBpvnexvgj6azAt+zJ
	ehZhrkFPDPs/3UV0JAI4fwhjz0FopkNrB/yuO6hUvpfByv+F14M+uArUSm3LU0ccL3I+ncutkzy8N
	67o4kXT4IWmKfaLYH2ocQ0hqAtf27PiE38/HcO9LoNPmwoB7RGlO0UBf0LWsymYk06vVi4Ym7N4kT
	mjQQrlQj3lzHhjZ6FV4Iw2rAKjGDvORcL2MpJpayS+htLO6jdvjUJOT7RMjY6xBwTLFlr8kGIwfiz
	lE+gYVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGFi-0000000Ffz9-43zz;
	Fri, 10 Jan 2025 14:44:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWGEV-0000000Ffov-1YPA;
	Fri, 10 Jan 2025 14:43:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 654475C1109;
	Fri, 10 Jan 2025 14:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8930CC4CED6;
	Fri, 10 Jan 2025 14:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736520210;
	bh=NPB5NFD4Tgx2JiOc65v+cROQTjUVAMnTM2bpuZWaG2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unDx1OISNdVw+hc8QQjFywLA6bLYlIkgLF4Bu7z2BJxXHdNArtLsIO3LnoVN3Xc2J
	 ElKUQ7HQgy+0EQlk+p7C1h+CRo6UJZUbFs17FeQzBTgPSgLzAzSzR8RRMQK+BpTkPo
	 YZpCmpVc+iA1oMKoCoYqhPH06j/lx/o0iEfNXD86f8TKZLgUgzKSOGsAR7Tl2e6liZ
	 NI2WnSXGbNbj7oXPq5MTSo9NgPX6laQhclxAcalJAfwG2s3ua+UaUQpZsC4Z8KlrCa
	 xxoQP9cZwSV/uwlUDIPDgO8MJm9pe1vcTuBIx4fqx1Ph4XJD8l/RBPAd9eDKkeYXUU
	 m1C1mzZLZYlfQ==
Date: Fri, 10 Jan 2025 11:43:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 00/16] perf tools: Use generic syscall scripts for all
 archs
Message-ID: <Z4EyD_RgjjeD6G4K@x1>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
 <Z4A8NU02WVBDGrYZ@ghost>
 <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8639C367-2669-4924-83D8-15EAFAC42699@linux.vnet.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_064331_484617_49D59961 
X-CRM114-Status: GOOD (  17.94  )
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

On Fri, Jan 10, 2025 at 12:34:46PM +0530, Athira Rajeev wrote:
> 
> 
> > On 10 Jan 2025, at 2:44 AM, Charlie Jenkins <charlie@rivosinc.com> wrote:
> > 
> > On Thu, Jan 09, 2025 at 05:49:39PM -0300, Arnaldo Carvalho de Melo wrote:
> >> On Thu, Jan 09, 2025 at 11:48:36AM -0800, Charlie Jenkins wrote:
> >>> On Thu, Jan 09, 2025 at 12:59:43PM -0300, Arnaldo Carvalho de Melo wrote:
> >>>> ⬢ [acme@toolbox perf-tools-next]$ git log --oneline -1 ; time make -C tools/perf build-test
> >>>> d06826160a982494 (HEAD -> perf-tools-next) perf tools: Remove dependency on libaudit
> >>>> make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> >>>> - tarpkg: ./tests/perf-targz-src-pkg .
> >>>>                 make_static: cd . && make LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX32=1 NO_JVMTI=1 NO_LIBTRACEEVENT=1 NO_LIBELF=1 -j28  DESTDIR=/tmp/tmp.JJT3tvN7bV
> >>>>              make_with_gtk2: cd . && make GTK2=1 -j28  DESTDIR=/tmp/tmp.BF53V2qpl3
> >>>> - /home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP: cd . && make FEATURE_DUMP_COPY=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP  feature-dump
> >>>> cd . && make FEATURE_DUMP_COPY=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP feature-dump
> >>>>         make_no_libbionic_O: cd . && make NO_LIBBIONIC=1 FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.KZuQ0q2Vs6 DESTDIR=/tmp/tmp.0sxMyH91gS
> >>>>           make_util_map_o_O: cd . && make util/map.o FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.Y0Mx3KLREI DESTDIR=/tmp/tmp.wg9HCVVLHE
> >>>>              make_install_O: cd . && make install FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.P0LEBAkW1X DESTDIR=/tmp/tmp.agTavZndFN
> >>>>  failed to find: etc/bash_completion.d/perf
> >>> 
> >>> Is this something introduced by this patch?
> >> 
> >> I don't think so.
> >> 
> >> BTW this series is already pushed out to perf-tools-next:
> >> 
> >> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next
> >> 
> >> Thanks!
> >> 
> >> - Arnaldo
> > 
> > Thank you!
> > 
> > - Charlie
> 
> Hi Charlie, Arnaldo
> 
> While testing the series, I hit compilation issue in powerpc
> 
> Snippet of logs:

Yeah, Stephen Rothwell noticed it in linux next and Charlie provided a
fix, so I squashed it all together and will push it soon:

    Link: https://lore.kernel.org/r/20250108-perf_syscalltbl-v6-14-7543b5293098@rivosinc.com
    Link: https://lore.kernel.org/lkml/20250110100505.78d81450@canb.auug.org.au
    [ Stephen Rothwell noticed on linux-next that the powerpc build for perf was broken and ...]
    Link: https://lore.kernel.org/lkml/20250109-perf_powerpc_spu-v1-1-c097fc43737e@rivosinc.com
    [ ... Charlie fixed it up and asked for it to be squashed to avoid breaking bisection. o

Thanks for the report!

- Arnaldo

