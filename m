Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CF3E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWi0Eghj3xi161PysLI0KrpGNdQD8oYgIL/QlYOb5cw=; b=zItoEFR142AbECx+Z4azZwybL1
	+OenLKOGBc2ulqkTu0g7v16eoMCd93cnsc7JUTNu1IvdMMhOQ+d3M3xa3Khp5+wCwGua8CXZ+GHOH
	2JkFTJ7RBXfXmc8Ia7StNh39lHarKUvBGlNobkM4reEu5jPZQpyh/R2E2GdzilQp4fj+43836WDh/
	mFTlFr+JPVHIKojw98RwS164akjA/Z76EznERw0FE59IrWZXATW2ZkonrJ17Pb3zkPeRBqgJpNx4K
	P6fikYtbhlIuw1VKN1CUzIvOP8PHs3YB++RGLbn0BTfkBWwRLGC3+wKSvy55YbNtq7vikSzBMFJyd
	/qcjW2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzse-0000000DL4I-0eoX;
	Thu, 09 Jan 2025 21:15:52 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzrO-0000000DKrH-2c1P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:14:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso1842667a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736457274; x=1737062074; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWi0Eghj3xi161PysLI0KrpGNdQD8oYgIL/QlYOb5cw=;
        b=HMsQ6gut475uFPOTsnrJ+NfZwZPgqSV40ZfCuLwZEPgOVICwIziqnUZ1sMlyzOn4e1
         tuAmKtLpi9nxti6dVaQczBDPCfjJDs+nvwoyKtqjvljQeSdkQsgQefXo14h5O3zDvjzj
         yNiEed1wJDAwdIuj1wsAwEpAO7eKaVJ2yrbzQOHTxFguywgFpGtKRLXo6IEzKZv+fmNs
         HVZMBYyC+KovyWahagkqz+R9ISMBaMLzmqoJdEE+WTT1Q30Tdo1R8dJfMRPvg/FV5THk
         MjrauZynqxifeOJrhvz5LdD2tq43+5DoPQuL4oKEKknVmqxO2yiiBPfyABd+MWMjNwkA
         ohjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457274; x=1737062074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWi0Eghj3xi161PysLI0KrpGNdQD8oYgIL/QlYOb5cw=;
        b=bFchSTjrGAfkb5OlLArVevC6flYsdnc5oHQjr0RK3+HDnVwYiIEHJdJOQzVrqRuXtY
         H9wvXw0VkuTngCE2Vu7kuhj5idfV61PxMLMUhic94U9SFXacKnaDCzgClIstQF2swLDc
         NiJ0NPfN/4FRv3uamaCFh7wTwXvc4d8f2Sb0iZXBuvmP0s00TFLTgxHZ/Lo8f2/K7QKd
         9GCg3Lkuko81OkX2hpYLXHcMq8pkVw10jcpD8LJypf7kTOgXmVtIUNLxp/LujIvkaDBR
         qQl9c+1EQF4PwAMvQMECavR6Khl/hHJYjkG9six8c97vFoNcCfo0pFe0xAGq3H20nMAH
         67nw==
X-Forwarded-Encrypted: i=1; AJvYcCWjBXpck03uf7VfxsuuqV2ZWZtIpk/ohGmfmw2XProVlJ3MygKyV6oCcPEhGIcWUmTjtBvE1srArYYncFeBKZMo@lists.infradead.org
X-Gm-Message-State: AOJu0YxLDJpsTYFkuaw56TET1rrKI/oapm+Ndu6pqwuQGFTmdHAVUYkE
	TnjZ571+0HCr9c7aBsiyQiba6MzjXlSjNsiTrWKEqGcj1v2Jd3g8mrkk6VjAiMI=
X-Gm-Gg: ASbGncuDfpLX8Kf2Btj+n8Kxh1vYQqxb6oAp6yUfxSkEvm/fDADUTDcLwvsLaO4oecd
	BVESHW/U5e3JknMnbGTAs475E28QJ1CxTxTjHZa+AF0bkcC+zl5abG81vQWkzzuHECd3Y11vQKD
	fEOjTjFRtbNLF/Y2U8XPPFu0xI2lJg7ljkNLk1UjC3W3s7NkvKNYH084FCDCZ7BY60lUovLLJJy
	P2KpjTXnaoP7ajD/qDlsEXPaMgkkqIBv+pWnG2edRKQiF+i0lPo
X-Google-Smtp-Source: AGHT+IGGpIFpDMCF6QbYUycaFsLmnN4FCC576ZSX1GeEVOuZ9RO46wvil+eTCx3t+IaGa75ky/Kjtw==
X-Received: by 2002:a17:90b:520e:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-2f548f424b1mr12478961a91.33.1736457273807;
        Thu, 09 Jan 2025 13:14:33 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2ad3b7sm4117850a91.31.2025.01.09.13.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:14:33 -0800 (PST)
Date: Thu, 9 Jan 2025 13:14:29 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
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
Message-ID: <Z4A8NU02WVBDGrYZ@ghost>
References: <20250108-perf_syscalltbl-v6-0-7543b5293098@rivosinc.com>
 <Z3_ybwWW3QZvJ4V6@x1>
 <Z4AoFA974kauIJ9T@ghost>
 <Z4A2Y269Ffo0ERkS@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z4A2Y269Ffo0ERkS@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_131434_924941_5AFDB49D 
X-CRM114-Status: GOOD (  15.35  )
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

On Thu, Jan 09, 2025 at 05:49:39PM -0300, Arnaldo Carvalho de Melo wrote:
> On Thu, Jan 09, 2025 at 11:48:36AM -0800, Charlie Jenkins wrote:
> > On Thu, Jan 09, 2025 at 12:59:43PM -0300, Arnaldo Carvalho de Melo wrote:
> > > ⬢ [acme@toolbox perf-tools-next]$ git log --oneline -1 ; time make -C tools/perf build-test
> > > d06826160a982494 (HEAD -> perf-tools-next) perf tools: Remove dependency on libaudit
> > > make: Entering directory '/home/acme/git/perf-tools-next/tools/perf'
> > > - tarpkg: ./tests/perf-targz-src-pkg .
> > >                  make_static: cd . && make LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX32=1 NO_JVMTI=1 NO_LIBTRACEEVENT=1 NO_LIBELF=1 -j28  DESTDIR=/tmp/tmp.JJT3tvN7bV
> > >               make_with_gtk2: cd . && make GTK2=1 -j28  DESTDIR=/tmp/tmp.BF53V2qpl3
> > > - /home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP: cd . && make FEATURE_DUMP_COPY=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP  feature-dump
> > > cd . && make FEATURE_DUMP_COPY=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP feature-dump
> > >          make_no_libbionic_O: cd . && make NO_LIBBIONIC=1 FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.KZuQ0q2Vs6 DESTDIR=/tmp/tmp.0sxMyH91gS
> > >            make_util_map_o_O: cd . && make util/map.o FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.Y0Mx3KLREI DESTDIR=/tmp/tmp.wg9HCVVLHE
> > >               make_install_O: cd . && make install FEATURES_DUMP=/home/acme/git/perf-tools-next/tools/perf/BUILD_TEST_FEATURE_DUMP -j28 O=/tmp/tmp.P0LEBAkW1X DESTDIR=/tmp/tmp.agTavZndFN
> > >   failed to find: etc/bash_completion.d/perf
> > 
> > Is this something introduced by this patch?
> 
> I don't think so.
> 
> BTW this series is already pushed out to perf-tools-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/?h=perf-tools-next
> 
> Thanks!
> 
> - Arnaldo

Thank you!

- Charlie


