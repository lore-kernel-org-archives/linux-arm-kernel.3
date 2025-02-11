Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C6C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slWw1TiRIa+fnLGWH63JJF/dAx3EWeR1a3tRrHk8+u8=; b=CbTVyFdAgR9dT6j6TCgtp+eAhX
	NkqH5fR9OsSxYUnmw8uL1Ff2+2AqyBUQ/L3NrBw+L/lwqVyGpJqK8NMQhgoPAnPP8vkJFFqBbhzKb
	OpUXqsNpzXB7t8fJhe2J/N6c6SI/EMhX7b5w869baSvPzI7wZYw2a0CpNO39zwJHYTbvt1RkkDpe+
	gg3tqIDRYdPPLY6SsKC9Cien+R2uaZ2yYwKaqFSYQCCsPrRI4kTucW5uOz5CWvTMtxD/By7YVE1yc
	IfRf/ZNIB+hM6Wx58m2oXhkTHq+okvEc1ixo5Aw9hPOtmcnOSAHp3xchdjPoTFFsMaLL8QdW8TT0B
	yJn7jYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlO2-00000002x6J-26zF;
	Tue, 11 Feb 2025 08:12:54 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlKc-00000002waw-2udA;
	Tue, 11 Feb 2025 08:09:24 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id DEC151380188;
	Tue, 11 Feb 2025 03:09:21 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 03:09:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739261361;
	 x=1739347761; bh=slWw1TiRIa+fnLGWH63JJF/dAx3EWeR1a3tRrHk8+u8=; b=
	JU9ZdgJE5Tf33djcc75aebLdMNBe8w47L+vuLeLb/AOYoZos8niDLnLZvnGlwalK
	iYKxL53dmvMiJUFHPtBuHqWiHWxbWmPd2btMeRgMrdLHEfmg3Ve/tZQlW8Fj38Ka
	phWf+YPSO7iZwTttd0gVP006zPfSQNAfklGZgjGAdmRC7RDDtigLlkbjGyt9f0+4
	5tF/KbVxl11Y5GefKt4XX3QO2ecovLZwUYeE0kOt4WsIMVaMez9Ft+zSRWiMnfXZ
	qEqgAS11b3rToDh4XPqx7qrqOMwNH3h7SgOET17njLz8sW96ZE7ca4vUkfBTD0jF
	XCVhwHmgenRUwofwb3eiXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739261361; x=1739347761; bh=s
	lWw1TiRIa+fnLGWH63JJF/dAx3EWeR1a3tRrHk8+u8=; b=Y/qcIq11BcnE0QQAy
	URxL+it+DGPHmzD7SxsY0zqubOCab/kOAhNrAzwI0xZhD42O17aOzTWq29aX1tfu
	aildwrM8zBsfR1fmUkZAtFpZd2nsZar/uznPC6s31yrISYsLs2jC4SDrK+ykmnNq
	eWnbN+rt1OdBfvrobmmUZ1iF9vzE9EF9IKwwPqmZm6Yrb+ztogBUrRWqZfQfamdu
	kRKbPc5XY+LgJ9KYIdUFNBdYBOEoujjti2rbhQcWSq/kb3POnr5LfDgexwpvx5NY
	ZHSqohe0kVBQacsNbHYpP7TqGymU6X/O1GjdM7Ze6cMkhCFN38iXpb6pDouEJvTP
	nsFJw==
X-ME-Sender: <xms:rwWrZ7NrJjhqwazfmoyzQtVyBjqV9iRQwxY4o-dh_ZLO4sOhq_-Q7w>
    <xme:rwWrZ1_JGDjp4PMLSfSUvNvNXobU9RQHG3IVgTLjF_b-PwbGKAulOazDx2OfSrtqe
    YRlFJJROZIVSmnMHpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegtdegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfekledtffefhffghfetteehuefhgfetgefhtdeu
    feduueeltefghedtjeeifffhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfedu
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgt
    ohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoh
    eprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehhohifrghr
    uggthhhuleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhrohhgvghrshesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheprggurhhirghnrdhhuhhnthgvrhesihhnthgvlhdrtghomhdprhgtph
    htthhopegrtghmvgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:rwWrZ6RvbSTCiJfZhcc1wviX371cOxFdxpy1jgK3YWb8t3Ly9O97fg>
    <xmx:rwWrZ_tM-TyjUy98K7B6J9NsnL96ZP9LPTCHE9Cgaqe3-9tFrg1diQ>
    <xmx:rwWrZzcN985Xxl6Id4XCdL8uVRy3FAYMAvVIspf2ggoy2F44d2KQBw>
    <xmx:rwWrZ72mqnYlgFqEb-_n2xkmTnUMexXg2qVZ1hfH-r7-3zCk_FHi5Q>
    <xmx:sQWrZ_oxO7aagZ_10p5YRjluCqaet_alPpnufAcGM4EYfH3nvoSxklK2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 371CA2220072; Tue, 11 Feb 2025 03:09:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 09:08:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ian Rogers" <irogers@google.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Kan Liang" <kan.liang@linux.intel.com>,
 "John Garry" <john.g.garry@oracle.com>, "Will Deacon" <will@kernel.org>,
 "James Clark" <james.clark@linaro.org>,
 "Mike Leach" <mike.leach@linaro.org>, "Leo Yan" <leo.yan@linux.dev>,
 guoren <guoren@kernel.org>, "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Charlie Jenkins" <charlie@rivosinc.com>,
 "Bibo Mao" <maobibo@loongson.cn>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 "Howard Chu" <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-riscv@lists.infradead.org
Message-Id: <d47c35dd-9c52-48e7-a00d-135572f11fbb@app.fastmail.com>
In-Reply-To: <20250210165108.95894-6-irogers@google.com>
References: <20250210165108.95894-1-irogers@google.com>
 <20250210165108.95894-6-irogers@google.com>
Subject: Re: [PATCH v2 5/7] perf trace beauty: Add syscalltbl.sh generating all system
 call tables
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_000922_808407_B36AAD81 
X-CRM114-Status: GOOD (  11.45  )
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

On Mon, Feb 10, 2025, at 17:51, Ian Rogers wrote:

> +# Each line of the syscall table should have the following format:
> +#
> +# NR ABI NAME [NATIVE] [COMPAT]
> +#
> +# NR       syscall number
> +# ABI      ABI name
> +# NAME     syscall name
> +# NATIVE   native entry point (optional)
> +# COMPAT   compat entry point (optional)

On x86, there is now a sixth optional field.

> +#if defined(ALL_SYSCALLTBL) || defined(__arm__) || defined(__aarch64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/arm/entry/syscalls/syscall.tbl" 
> "$outfile" common,32,oabi EM_ARM
> +build_tables 

The oabi syscalls probably shouldn't be part of the default set here.
Technically these are two separate ABIs, though EABI is a subset of
OABI for the most most part. Some of the calling conventions are
also different.

> "$tools_dir/perf/arch/arm64/entry/syscalls/syscall_64.tbl" "$outfile" 
> common,64,renameat,rlimit,memfd_secret EM_AARCH64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__arm__) || 
> defined(__aarch64__)

Hardcoding the set of ABIs in the middle of the script seems
too fragile to me, I'm worried that these get out of sync quickly.

> +#if defined(ALL_SYSCALLTBL) || defined(__mips__)
> +EOF
> +build_tables 
> "$tools_dir/perf/arch/mips/entry/syscalls/syscall_n64.tbl" "$outfile" 
> common,64,n64 EM_MIPS
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__mips__)

What about n32/o32? The syscall tables are completely different here.

> +#if defined(ALL_SYSCALLTBL) || defined(__powerpc__) || 
> defined(__powerpc64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl" 
> "$outfile" common,32,nospu EM_PPC
> +build_tables "$tools_dir/perf/arch/powerpc/entry/syscalls/syscall.tbl" 
> "$outfile" common,64,nospu EM_PPC64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__powerpc__) || 
> defined(__powerpc64__)

This skips the SPU table, but I think that's fine.

> +EOF
> +build_tables "$tools_dir/perf/arch/s390/entry/syscalls/syscall.tbl" 
> "$outfile" common,64,renameat,rlimit,memfd_secret EM_S390
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__s390x__)

This skips the 32-bit table, though I think that one is already
planned to be discontinued in the future.

> +#if defined(ALL_SYSCALLTBL) || defined(__i386__) || defined(__x86_64__)
> +EOF
> +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_32.tbl" 
> "$outfile" common,32,i386 EM_386
> +build_tables "$tools_dir/perf/arch/x86/entry/syscalls/syscall_64.tbl" 
> "$outfile" common,64 EM_X86_64
> +cat >> "$outfile" <<EOF
> +#endif // defined(ALL_SYSCALLTBL) || defined(__i386__) || 
> defined(__x86_64__)

This misses the x32 table.

   Arnd

