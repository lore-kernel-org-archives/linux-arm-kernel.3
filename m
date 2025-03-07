Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E46C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUDKNDG/tInyWlHoCkbaR1ggJD0IdtGW73EaUN7wdZw=; b=cCylCcJ8G6tdYsSaFbZOFPGkUj
	XdNC+qXWDV6aQcQ2t7ksFwt+zt58M6qcVONKG9tJDBSSbjLwWGDPFvz/9P9EAeK9t685QD5ATcyqU
	imr3Ej+IGKoIBlDs16Jf94fSVv4uvrl75l2ZCJaJV5E4PmaqPdzQQB+qwMRr4VWf15p7xIih5K2KQ
	n3uGNtjTFG162B81y950KlFveQhIiN3vNK8viwN5fnaW1QwtpDlkJZbnfDbdSLmsPjk5AhsgYfq9u
	OJ0RrCO3xtCF8cX2cDjje9wVRLVSf0y6wNUyjRxuz5+alL/rg7esGM4BWYUQTTxuKscSOpfdzxqrc
	zh6pYGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMr7-0000000CqcJ-0RQy;
	Fri, 07 Mar 2025 01:50:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMPw-0000000CmwM-1zgt;
	Fri, 07 Mar 2025 01:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D8B85C5AEE;
	Fri,  7 Mar 2025 01:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD6CC4CEE0;
	Fri,  7 Mar 2025 01:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741310543;
	bh=qoWrscZOahCo4c1kw/Xs9+mG1u4iBzWCpyeXDPmje18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixMTgMBN5bEz5ywSEjw16lOymw3RAJaEk2QN1yCrCQ0/VC/jp02rZwjim3bweOKU1
	 inl9oBWKtjr0LIOvJJ6bs6vrkJexp+13IoBrLc+gxuGzZXYLMjpSjHO0WKu0udD6gi
	 YOPtf2AUGSLOC2QVKO/Gx59xuWDmBDnu5kq8yeGzjOH790tpdJE7RNCk/maGNdbumO
	 uOhSjdhOaiJipTJjCHQVW5CxwryBHVpxn6hXQOLyRtM72BW6Yin+U2n2XYDey1hGok
	 GTVwxD73YcSoxwO7jfitu7qi7esTTxO+LgD8RsUgFAt3X6RldmxuxrnNqPB23LwmKf
	 fgi8nNNzcIFRw==
Date: Thu, 6 Mar 2025 17:22:20 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-riscv@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 06/11] perf dso: Add support for reading the e_machine
 type for a dso
Message-ID: <Z8pKTE7tOqdqNUdA@google.com>
References: <20250304050305.901167-1-irogers@google.com>
 <20250304050305.901167-7-irogers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304050305.901167-7-irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_172224_598795_32FA4E17 
X-CRM114-Status: GOOD (  20.35  )
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

On Mon, Mar 03, 2025 at 09:03:00PM -0800, Ian Rogers wrote:
> For ELF file dsos read the e_machine from the ELF header. For kernel
> types assume the e_machine matches the perf tool. In other cases
> return EM_NONE.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/dso.c | 54 +++++++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/dso.h |  1 +
>  2 files changed, 55 insertions(+)
> 
> diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
> index 5c6e85fdae0d..7f2f1af4f73b 100644
> --- a/tools/perf/util/dso.c
> +++ b/tools/perf/util/dso.c
> @@ -1170,6 +1170,60 @@ ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
>  	return data_read_write_offset(dso, machine, offset, data, size, true);
>  }
>  
> +uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
> +{
> +	uint16_t e_machine = EM_NONE;
> +	int fd;
> +
> +	switch (dso__binary_type(dso)) {
> +	case DSO_BINARY_TYPE__KALLSYMS:
> +	case DSO_BINARY_TYPE__GUEST_KALLSYMS:
> +	case DSO_BINARY_TYPE__VMLINUX:
> +	case DSO_BINARY_TYPE__GUEST_VMLINUX:
> +	case DSO_BINARY_TYPE__GUEST_KMODULE:
> +	case DSO_BINARY_TYPE__GUEST_KMODULE_COMP:
> +	case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE:
> +	case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP:
> +	case DSO_BINARY_TYPE__KCORE:
> +	case DSO_BINARY_TYPE__GUEST_KCORE:
> +	case DSO_BINARY_TYPE__BPF_PROG_INFO:
> +	case DSO_BINARY_TYPE__BPF_IMAGE:
> +	case DSO_BINARY_TYPE__OOL:
> +	case DSO_BINARY_TYPE__JAVA_JIT:

I think some of them can be possible in recorded data.  But let's go
simple with EM_HOST as we haven't supported cross-arch trace.


> +		return EM_HOST;
> +	case DSO_BINARY_TYPE__DEBUGLINK:
> +	case DSO_BINARY_TYPE__BUILD_ID_CACHE:
> +	case DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO:
> +	case DSO_BINARY_TYPE__SYSTEM_PATH_DSO:
> +	case DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO:
> +	case DSO_BINARY_TYPE__FEDORA_DEBUGINFO:
> +	case DSO_BINARY_TYPE__UBUNTU_DEBUGINFO:
> +	case DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO:
> +	case DSO_BINARY_TYPE__BUILDID_DEBUGINFO:
> +		break;
> +	case DSO_BINARY_TYPE__NOT_FOUND:
> +	default:
> +		return EM_NONE;
> +	}
> +
> +	pthread_mutex_lock(&dso__data_open_lock);

Hmm.. I'm afraid it'd slow down perf trace a bit more.  It sees
occasional LOST events.  But it may be ok as it's cached in thread later.


> +
> +	/*
> +	 * dso__data(dso)->fd might be closed if other thread opened another
> +	 * file (dso) due to open file limit (RLIMIT_NOFILE).
> +	 */
> +	try_to_open_dso(dso, machine);
> +	fd = dso__data(dso)->fd;
> +	if (fd >= 0) {
> +		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
> +		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
> +		if (pread(fd, &e_machine, sizeof(e_machine), 18) != sizeof(e_machine))

I think it needs to check the endianess and swap the data.

Thanks,
Namhyung


> +			e_machine = EM_NONE;
> +	}
> +	pthread_mutex_unlock(&dso__data_open_lock);
> +	return e_machine;
> +}
> +
>  /**
>   * dso__data_read_addr - Read data from dso address
>   * @dso: dso object
> diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
> index f3ca2a5e7670..ba9b83db061a 100644
> --- a/tools/perf/util/dso.h
> +++ b/tools/perf/util/dso.h
> @@ -818,6 +818,7 @@ int dso__data_file_size(struct dso *dso, struct machine *machine);
>  off_t dso__data_size(struct dso *dso, struct machine *machine);
>  ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
>  			      u64 offset, u8 *data, ssize_t size);
> +uint16_t dso__e_machine(struct dso *dso, struct machine *machine);
>  ssize_t dso__data_read_addr(struct dso *dso, struct map *map,
>  			    struct machine *machine, u64 addr,
>  			    u8 *data, ssize_t size);
> -- 
> 2.48.1.711.g2feabab25a-goog
> 

