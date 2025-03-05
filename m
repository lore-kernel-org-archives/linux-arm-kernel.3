Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2110EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 17:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPAlpWnv2bEa5EM+qlw7ITNlgCIirGMd0ucOaC5mWMk=; b=DAO1y3kFZL0IHjLIYScgN2j31P
	YQFkarcpOy9JoqEwu73vMMU5iZmEwOeCJFoMcs+obD/UBnirGyoKenHst+ccW/uANaLlEFl6XsrjO
	WzTDLJAxQ6Lw+XjZxi9AQMflydGNZOdPyH9IT4Nkxr4SZFr6WVXRFZ8QQDF/HoXZrhHkP/f3ZErOV
	xd/FGKiEfnp8qHOYFTNNNfmeiGaQ40/QINQwo8DpEx6Y3Aboiew1Hyb8M7tZfP3HP81EtspNlc0rW
	XcxNTDTAd9XRkhm8UWhh9d4BbHVyGnjMhdTSQJ4JUCsUr6z8UHuWW7HxDKgyFG8v5ZNnGHswHZRet
	wa6dl2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpt0T-00000008rAw-0D85;
	Wed, 05 Mar 2025 17:58:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpsxG-00000008qoE-3luE;
	Wed, 05 Mar 2025 17:54:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F9DD5C6BAE;
	Wed,  5 Mar 2025 17:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ED8C4CEEA;
	Wed,  5 Mar 2025 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741197288;
	bh=CZvT8ToSGo3UU6++Tcrfw84ErbpHK8lmJvvMCeXw168=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fg4oGaG0y42LSBGs7V0znH7544RvMBBRiZyIo96lRJSdMqdL2sU6ArZCWg1EcNuMS
	 1VLMz/T/LjIOfn5drQ1RHoxFkDO9c9S0MP8mD+l+8O/B6bsGboGkviFsXSaJ5Ss88T
	 PjCAOf/rGVMsRU+Tzevtw2UctKvhE51b6/6e5cvgbuiqQu5Sem3c94gJkz1XPOUyBd
	 fvt7koOLHNXKj5A060sLoiSGOqtN8YdhPjsP9E9CYDcfxtcNHQDEVzlIiCjsPQxx+A
	 6+hxkxL88Kr4jriNF6uilCguTVn6v6CU+NVhsPZD1tOBM9vzUX93s9UYjX3oc59nTs
	 rwkXoB+DCGU8A==
Date: Wed, 5 Mar 2025 14:54:46 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	guoren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 02/11] perf dso: kernel-doc for enum dso_binary_type
Message-ID: <Z8iP5r3nVyCG8Iai@x1>
References: <20250304050305.901167-1-irogers@google.com>
 <20250304050305.901167-3-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304050305.901167-3-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_095451_025863_34E73DFD 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, Mar 03, 2025 at 09:02:56PM -0800, Ian Rogers wrote:
> There are many and non-obvious meanings to the dso_binary_type enum
> values. Add kernel-doc to speed interpretting their meanings.


Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/dso.h | 53 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index dfd763a0bd9d..f3ca2a5e7670 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -20,30 +20,83 @@ struct perf_env;
>  #define DSO__NAME_KALLSYMS	"[kernel.kallsyms]"
>  #define DSO__NAME_KCORE		"[kernel.kcore]"
>  
> +/**
> + * enum dso_binary_type - The kind of DSO generally associated with a memory
> + *                        region (struct map).
> + */
>  enum dso_binary_type {
> +	/** @DSO_BINARY_TYPE__KALLSYMS: Symbols from /proc/kallsyms file. */
>  	DSO_BINARY_TYPE__KALLSYMS = 0,
> +	/** @DSO_BINARY_TYPE__GUEST_KALLSYMS: Guest /proc/kallsyms file. */
>  	DSO_BINARY_TYPE__GUEST_KALLSYMS,
> +	/** @DSO_BINARY_TYPE__VMLINUX: Path to guest kernel /boot/vmlinux file. */
>  	DSO_BINARY_TYPE__VMLINUX,
> +	/** @DSO_BINARY_TYPE__GUEST_VMLINUX: Path to kernel /boot/vmlinux file. */
>  	DSO_BINARY_TYPE__GUEST_VMLINUX,
> +	/** @DSO_BINARY_TYPE__JAVA_JIT: Symbols from /tmp/perf.map file. */
>  	DSO_BINARY_TYPE__JAVA_JIT,
> +	/**
> +	 * @DSO_BINARY_TYPE__DEBUGLINK: Debug file readable from the file path
> +	 * in the .gnu_debuglink ELF section of the dso.
> +	 */
>  	DSO_BINARY_TYPE__DEBUGLINK,
> +	/**
> +	 * @DSO_BINARY_TYPE__BUILD_ID_CACHE: File named after buildid located in
> +	 * the buildid cache with an elf filename.
> +	 */
>  	DSO_BINARY_TYPE__BUILD_ID_CACHE,
> +	/**
> +	 * @DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO: File named after buildid
> +	 * located in the buildid cache with a debug filename.
> +	 */
>  	DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO,
> +	/**
> +	 * @DSO_BINARY_TYPE__FEDORA_DEBUGINFO: Debug file in /usr/lib/debug
> +	 * with .debug suffix.
> +	 */
>  	DSO_BINARY_TYPE__FEDORA_DEBUGINFO,
> +	/** @DSO_BINARY_TYPE__UBUNTU_DEBUGINFO: Debug file in /usr/lib/debug. */
>  	DSO_BINARY_TYPE__UBUNTU_DEBUGINFO,
> +	/**
> +	 * @DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO: dso__long_name debuginfo
> +	 * file in /usr/lib/debug/lib rather than the expected
> +	 * /usr/lib/debug/usr/lib.
> +	 */
>  	DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO,
> +	/**
> +	 * @DSO_BINARY_TYPE__BUILDID_DEBUGINFO: File named after buildid located
> +	 * in /usr/lib/debug/.build-id/.
> +	 */
>  	DSO_BINARY_TYPE__BUILDID_DEBUGINFO,
> +	/** @DSO_BINARY_TYPE__SYSTEM_PATH_DSO: A regular executable/shared-object file. */
>  	DSO_BINARY_TYPE__SYSTEM_PATH_DSO,
> +	/** @DSO_BINARY_TYPE__GUEST_KMODULE: Guest kernel module .ko file. */
>  	DSO_BINARY_TYPE__GUEST_KMODULE,
> +	/** @DSO_BINARY_TYPE__GUEST_KMODULE_COMP: Guest kernel module .ko.gz file. */
>  	DSO_BINARY_TYPE__GUEST_KMODULE_COMP,
> +	/** @DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE: Kernel module .ko file. */
>  	DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE,
> +	/** @DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP: Kernel module .ko.gz file. */
>  	DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP,
> +	/** @DSO_BINARY_TYPE__KCORE: /proc/kcore file. */
>  	DSO_BINARY_TYPE__KCORE,
> +	/** @DSO_BINARY_TYPE__GUEST_KCORE: Guest /proc/kcore file. */
>  	DSO_BINARY_TYPE__GUEST_KCORE,
> +	/**
> +	 * @DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO: Openembedded/Yocto -dbg
> +	 * package debug info.
> +	 */
>  	DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO,
> +	/** @DSO_BINARY_TYPE__BPF_PROG_INFO: jitted BPF code. */
>  	DSO_BINARY_TYPE__BPF_PROG_INFO,
> +	/** @DSO_BINARY_TYPE__BPF_IMAGE: jitted BPF trampoline or dispatcher code. */
>  	DSO_BINARY_TYPE__BPF_IMAGE,
> +	/**
> +	 * @DSO_BINARY_TYPE__OOL: out of line code such as kprobe-replaced
> +	 * instructions or optimized kprobes or ftrace trampolines.
> +	 */
>  	DSO_BINARY_TYPE__OOL,
> +	/** @DSO_BINARY_TYPE__NOT_FOUND: Unknown DSO kind. */
>  	DSO_BINARY_TYPE__NOT_FOUND,
>  };
>  
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

