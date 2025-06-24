Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C07C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7C/AvsVjKXGOCeuen0fY1kmunTzFwWn29v3UAYJXPVg=; b=V2tHr5rqxcoiDt1q1VmykZi3CK
	uS9d5yIZN6sZS1JZLIL/JHU3Jfv75xxKtb0CL9tXvcBTVKyhOeuA3tPDmaNNP5HQcxAcVRTk8Qygq
	+nnA3ABn1zCyxMn/fTVIGNR5mEcNoi80ImO29WBHmfyk0it2CfQMgOCBBoIh7TFw1IQ/4GXzP3ee3
	GsVU4uDKzIVzid5olo0olBFPmpFDubfiv5P02Vk3Bu6EjEA/IGOanaEyrBTZmweIopbkx2ly2/8Rd
	sAhYGOJ4gwXNOLq0ikr4jnevbR8wPnDsiBv8TX0IzI2XXSxlcFtJ2wLKtPvvcul7fj+pSMuvyMPln
	vcEzterQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsVm-00000004N7s-1a0T;
	Tue, 24 Jun 2025 01:31:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTsTO-00000004MuW-0rtx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 01:29:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2363616a1a6so38840965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 18:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750728557; x=1751333357; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7C/AvsVjKXGOCeuen0fY1kmunTzFwWn29v3UAYJXPVg=;
        b=JUp38LzD7wUwAycJlTNFDAQNRLcm4u3q0SP9AUo8KhXtz1bM7Lzmxvhx0I2VbkpXmF
         hVFADAsfjvk38Ae1YkD3z8oPqc3zEw6zCBPazRpglIClIAtt9l9wPDYnZPe6BVXEhSAN
         e2KksOGP0qO+st+VIVSYPKWjoWp0IZ/q8ARZa7AEaICEOhPKKpJBW2fW6jXl7wWYI0dh
         JVMSQwV6QXv7d3MIs2+lauqYi0z6lbd+SyMM3Lh3uB6kHNOIZnPBCbW5TxkcES+uF7G8
         nXNAv4Li5pLQszPwMC0rRTSYS2E9YbM9pUOHTu1l/cCvoqCsB8N4D5fXB1tomOcF9PNQ
         zO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750728557; x=1751333357;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C/AvsVjKXGOCeuen0fY1kmunTzFwWn29v3UAYJXPVg=;
        b=Bqi5H4M3miA/tskMjsOV6z2563KudPGTW7aLVNjjdz1q9BaTfJYK7faWX5soG45U1z
         VUVZe1bNuEbXuflk/H4LH1K2EJ+BJYxRrou5YlYLdAwTH6GacRYdCRi/MM884P8QJans
         PZgzac2iE2mxNwZL7FjP9qMosBiD3Jy1f+botI5qGlWmFN75LKH3fcvUO+TQzk7Oq/Jf
         aKEKCN1JbFMPgjRQQMU80LyniTNSWEZ031iyFuBHmudOgIKg2K787AETw6om6cv8Ag03
         47WpbhwwfDGpR7tXi2fok/C9dj6Dx8/tFX5JodxuaQfmzsDgvbsiG0AVD8vfBGNC9x1a
         wFCg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Uyh2W8Pt3U2jwefC3bOAwfn7cbQMf4X/Zyn3trnRVEt2E9RsiLC9bjmxHi77v7PqjkpSgbXSD40+rKydA99S@lists.infradead.org
X-Gm-Message-State: AOJu0YzcuHR9vJLs4FWFzZNQzJ5FKw8DXmmS3sjkcNT1zUgUy3SZ0lRw
	NT+pKL07o8Sf6ZuTqHmbFUaz/pqI2oqfVv83HRamCRYPSjITu+l2rONp
X-Gm-Gg: ASbGncujwGymYRpjdXnHW6zSeJXPOd1jPIx/JqF4Bn0CcdFBoJyYd5Wxu/gxtvDrKgQ
	8SNPr0lRbkSgkvuQv99kiAKYRihACSZ86xix6sJcbmwe6hKyNyjBka7OvS8v9vQD6F1KxTlktkQ
	O7z1jEnTsvF5OKQPcVXKIx8csy67ijsGRppUCxkqGEicCOqqs9X09IqmyeHkDRmsk8onArNV+Zv
	DQZe6YfJ/wJm+ytBRfjZ15KmurhruEA4d1RTV444vE3+z/gv4xzgPcSMkBvCDMXUCwv508tm8Iz
	lcLNf2sbL5jLxYB0wlqRDmUOC6lMwYsJGlNvgSW43cU=
X-Google-Smtp-Source: AGHT+IEzZpfM7q9rR57opZGg9qPwYrln15z6WF3j6cMTSbVGYFJSxloyEh1jwTmoWiABsuY9/u+/cg==
X-Received: by 2002:a17:903:2f4b:b0:235:f70:fd44 with SMTP id d9443c01a7336-237d9870d24mr210941125ad.21.1750728556942;
        Mon, 23 Jun 2025 18:29:16 -0700 (PDT)
Received: from fedora ([2601:646:8081:3770::1707])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937bcsm93228865ad.43.2025.06.23.18.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 18:29:16 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>,  Ingo Molnar <mingo@redhat.com>,
  Arnaldo Carvalho de Melo <acme@kernel.org>,  Namhyung Kim
 <namhyung@kernel.org>,  Mark Rutland <mark.rutland@arm.com>,  Alexander
 Shishkin <alexander.shishkin@linux.intel.com>,  Jiri Olsa
 <jolsa@kernel.org>,  Ian Rogers <irogers@google.com>,  Adrian Hunter
 <adrian.hunter@intel.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,
  Mike Leach <mike.leach@linaro.org>,  Nick Terrell <terrelln@fb.com>,
  David Sterba <dsterba@suse.com>,  linux-perf-users@vger.kernel.org,
  linux-kernel@vger.kernel.org,  coresight@lists.linaro.org,
  linux-arm-kernel@lists.infradead.org,  bpf@vger.kernel.org
Subject: Re: [PATCH] perf test: Change all remaining #!/bin/sh to #!/bin/bash
In-Reply-To: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
References: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
Date: Mon, 23 Jun 2025 18:29:15 -0700
Message-ID: <87bjqehqqc.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_182918_251916_9FD38BC3 
X-CRM114-Status: GOOD (  20.24  )
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

James Clark <james.clark@linaro.org> writes:

> There are 43 instances of posix shell tests and 35 instances of bash. To
> give us a single consistent language for testing in, replace
> all #!/bin/sh to #!/bin/bash. Common sources that are included in both
> different shells will now work as expected. And we no longer have to fix
> up bashisms that appear to work when someone's system has sh symlinked
> to bash, but don't work on other systems that have both shells
> installed.
>
> Although we could have chosen sh, it's not backwards compatible so it
> wouldn't be possible to bulk convert without re-writing the existing
> bash tests.
>
> Choosing bash also gives us some nicer features including 'local'
> variable definitions and regexes in if statements that are already
> widely used in the tests.
>
> It's not expected that there are any users with only sh available due to
> the large number of bash tests that exist.
>
> Discussed in relation to running shellcheck here:
> https://lore.kernel.org/linux-perf-users/e3751a74be34bbf3781c4644f518702a7270220b.1749785642.git.collin.funk1@gmail.com/
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/tests/perf-targz-src-pkg                          | 2 +-
>  tools/perf/tests/shell/amd-ibs-swfilt.sh                     | 2 +-
>  tools/perf/tests/shell/buildid.sh                            | 2 +-
>  tools/perf/tests/shell/coresight/asm_pure_loop.sh            | 2 +-
>  tools/perf/tests/shell/coresight/memcpy_thread_16k_10.sh     | 2 +-
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_10.sh | 2 +-
>  tools/perf/tests/shell/coresight/thread_loop_check_tid_2.sh  | 2 +-
>  tools/perf/tests/shell/coresight/unroll_loop_thread_10.sh    | 2 +-
>  tools/perf/tests/shell/diff.sh                               | 2 +-
>  tools/perf/tests/shell/ftrace.sh                             | 2 +-
>  tools/perf/tests/shell/lib/perf_has_symbol.sh                | 2 +-
>  tools/perf/tests/shell/lib/probe_vfs_getname.sh              | 2 +-
>  tools/perf/tests/shell/lib/setup_python.sh                   | 2 +-
>  tools/perf/tests/shell/lib/waiting.sh                        | 2 +-
>  tools/perf/tests/shell/list.sh                               | 2 +-
>  tools/perf/tests/shell/lock_contention.sh                    | 2 +-
>  tools/perf/tests/shell/perf-report-hierarchy.sh              | 2 +-
>  tools/perf/tests/shell/probe_vfs_getname.sh                  | 2 +-
>  tools/perf/tests/shell/record+probe_libc_inet_pton.sh        | 2 +-
>  tools/perf/tests/shell/record+script_probe_vfs_getname.sh    | 2 +-
>  tools/perf/tests/shell/record+zstd_comp_decomp.sh            | 2 +-
>  tools/perf/tests/shell/record_bpf_filter.sh                  | 2 +-
>  tools/perf/tests/shell/record_offcpu.sh                      | 2 +-
>  tools/perf/tests/shell/record_sideband.sh                    | 2 +-
>  tools/perf/tests/shell/script.sh                             | 2 +-
>  tools/perf/tests/shell/stat+csv_summary.sh                   | 2 +-
>  tools/perf/tests/shell/stat+shadow_stat.sh                   | 2 +-
>  tools/perf/tests/shell/stat_all_pfm.sh                       | 2 +-
>  tools/perf/tests/shell/stat_bpf_counters.sh                  | 2 +-
>  tools/perf/tests/shell/stat_bpf_counters_cgrp.sh             | 2 +-
>  tools/perf/tests/shell/test_arm_callgraph_fp.sh              | 2 +-
>  tools/perf/tests/shell/test_arm_coresight.sh                 | 2 +-
>  tools/perf/tests/shell/test_arm_coresight_disasm.sh          | 2 +-
>  tools/perf/tests/shell/test_arm_spe.sh                       | 2 +-
>  tools/perf/tests/shell/test_arm_spe_fork.sh                  | 2 +-
>  tools/perf/tests/shell/test_bpf_metadata.sh                  | 2 +-
>  tools/perf/tests/shell/test_intel_pt.sh                      | 2 +-
>  tools/perf/tests/shell/trace+probe_vfs_getname.sh            | 2 +-
>  tools/perf/tests/shell/trace_btf_enum.sh                     | 2 +-
>  tools/perf/tests/shell/trace_exit_race.sh                    | 2 +-
>  tools/perf/tests/shell/trace_record_replay.sh                | 2 +-
>  tools/perf/tests/shell/trace_summary.sh                      | 2 +-
>  tools/perf/tests/tests-scripts.c                             | 2 +-
>  43 files changed, 43 insertions(+), 43 deletions(-)

Patch looks good to me.

Reviewed-by: Collin Funk <collin.funk1@gmail.com>

Collin

