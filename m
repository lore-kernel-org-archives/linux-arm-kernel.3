Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1402CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljt9qo4CbaNAhZ8NBb8RScI9+T0M5HBa8xMXa6k6Vt0=; b=Io4l5B73s+9PQ/ka/+aTcmt2dv
	GKN6c6DgugLePtEOXkqFftYeUw0E4e4XtqtNS++LKezTqvEQej3xaWo6DXdOvDIK4fN7FACllkkHi
	pCD5RbExPZHbOYJfWOxWZGGW4PiV+la6irvPVWBCxETJOZ3SQuG3MuXG3HRraC016BNcy4XnTocMj
	op8PKxWfNV7pQstJaSJaMbGvXQ3DkTvqWGRmOTJaPr19xVzIYTwCJPr5l56QVLpjXkUmes0/Qo3eM
	Q9T2HJiV24zhZY3iil4sVpYVQpPAk9ZChO+DvnFphGTSpiQZnkPPaunmhUaUmDWV0NH1hdnZ6w7od
	s5r+odvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ1V-00000003oSt-0OQe;
	Tue, 29 Sep 2026 14:41:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ1T-00000003oSb-3hI0
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ljt9qo4CbaNAhZ8NBb8RScI9+T0M5HBa8xMXa6k6Vt0=; b=Sh1ieKRyY4jLW/3+YG52nZ5bta
	1H2em3c3NoUxvTElLPFWHrqzOokMjsbbgaTkLbeDoNV+pO9WHwISfEtgzdOtNn6IoSKfJFuIxZ8FX
	wyqxr+UgoXStEgF/uaL0ZNARdKzFy+dPxaoWZ0mqHz5RL1NDzZK/t/3EeocZ/fECD/a2tDhAiV7+E
	Fwn0laPEpbfatFm9RLtiy+U0ofZE2yhYpKWkoDIK+2WVf71o8ZC+7pbV61tbss1xd8HHR0OPGdbeA
	XNUjv4im8S88xqD2nFQeAl1mou6+p9MZQTFjeBX/QWyE6gXbBIFDLDgz+0IZcWX57iothIOpwyR7S
	dq9/XUmQ==;
Received: from mail-ej2-x23.google.com ([2a00:1450:4864:34::23])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZ1P-00000002kRw-2Wpl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:41:34 +0000
Received: by mail-ej2-x23.google.com with SMTP id a640c23a62f3a-c29703cb796so602704666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790692890; x=1791297690; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ljt9qo4CbaNAhZ8NBb8RScI9+T0M5HBa8xMXa6k6Vt0=;
        b=ozZ+LwWIpc44LfBrNif8BDl6ZTD4eoLchQzyKtAkkRo32JaP0MjNYJJ8wtgdz2YpaZ
         njYzz+HQDXPbKJtbTyPB+mJmWKnOdkj1fCjGxTRQMmYP+mtfVJNbtWZp2uQSstpVyhzE
         /kwWKFGK49ktE0C9OXQc5+Fh/GdfIHZN2j8E8pSPiUATDKH1a9SSrI9yfT776mP5lq0V
         rtZHS+u0R6hAMipiSWn4l9UVzSQ36v3OsGHdtlHL/4LgKSU9yITyRdjf8HtJAq5DWJM+
         Q6KlmiX8cPeCjCsdLUSjeBeu76Z+UQx2FhBNNd+A1T0Pg8lGFP0AVh3mfs6DV0ELDxI/
         FsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692890; x=1791297690;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ljt9qo4CbaNAhZ8NBb8RScI9+T0M5HBa8xMXa6k6Vt0=;
        b=CCQuRO56apD/k3uc8anUV0wtN2z50mKhmVOB82H4YDYULMXNrxX/x8xDZd7fA11pY1
         UzLRmKfpPkDa+BUzyo3MoLGnW032guQxpLuKUIeEypYJcRrMOP6miPG4nFX47EdZPR+S
         trJLMsFwkBvTvtTcPIxb9u2n19lqX4Lm/nm7eeTBEZ7iektdxI+OxJO2icbb65HZQj+O
         p50bPirOX+d9i6IFA+72DV0TjND5to0l/on5lyX4TUe38RkKLBpe+wRCUdgzyi+srPti
         pBgvkKCHqwijIY2g9kcgl2Ad+Xo6wxnsCHBNCxsoEXrqep8C/itG/jnra1cRpabfENfQ
         049Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7qOmmyO7U9GLZ4j8FDxW/hTPo+oUQGkel2/5lhdKVCwdJSHvQSQy3n5SDMSsaGA9IYEjtJL7GoDGX2oT42rKA@lists.infradead.org
X-Gm-Message-State: AFq9FYIHlCFx0HT6RNUsAl0ueBApWP3CkVRAR8NFZ5qVOdWhs8bRjln8
	2RiYRgwFHhtnJUX3Eipkz3FxIF4Mkey6zkfLNDTncriXZ8tV/TaNlTpvwD31v8svxf0=
X-Gm-Gg: AYBFou1S8G1paR5eOOhasXRiJKmoVRUs3Z3rNUp7C5ZI0jMxCIxBpQRQqu0J5/8IjB2
	NgkASHoNDdLrNH25jqmOqmAfzcJpO555LkNPxE8Ane0uMoLNuYlfQ8anB5Zufuw5ThO1uL81Vzd
	+w7gtxJTcuQceqHtq4pG1DmFdSEAbF4qjya17j7EzVCxXjof5vB1qsNM74kxXwuqFuZDvE/Vft8
	vTtiMpnpllwFKXoC0HI8dI3S9pwcMrCfr0RvArRpLC2l54ogv8h6+71qDvNHHHiKJeiRUI83cPP
	kOt9l7xsxttfhsR/V4Yej81h1K1nrbgCGNr/xx3L3pq5nSZ6BaJsEnyjOE0tNgR3CNl2psAgwLH
	TvEwuv9GjDJvA9yau3O70c0b6/qwqH8aYCB6//ML/yzug/sMWDgVdF0AdqnQipXPVL69b2OViTl
	BvFLnb+f13jSst6GXMK7z6rPuyVlxNKs9MhqduquNfeS0QQKKArLUs5QEVq/SL
X-Received: by 2002:a17:907:c310:b0:c25:32b0:e56c with SMTP id a640c23a62f3a-c2ac23862eemr1446037966b.4.1790692889352;
        Tue, 29 Sep 2026 07:41:29 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6acb905c6f4sm966711a12.37.2026.09.29.07.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:41:28 -0700 (PDT)
Message-ID: <8094040d-cb75-4f44-9662-97987f6eadef@linaro.org>
Date: Tue, 29 Sep 2026 15:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] perf cs-etm: Fix bogus branch samples on
 exceptions
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Mike Leach <mike.leach@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260923-perf_cs_etm_fix_non_taken-v2-0-6ab8c07a5455@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_154132_533918_439B6503 
X-CRM114-Status: GOOD (  24.78  )
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



On 23/09/2026 16:21, Leo Yan wrote:
> CoreSight currently models exception entry by changing the preceding
> instruction range into a taken branch. This can give an IRQ the source
> PC of an instruction that already retired and overwrite a real branch
> immediately before the exception.
> 
> For an untaken B.LS followed by an IRQ, perf script currently reports:
> 
>    hw int  4000f8 => ffff800080010c80  b.ls #0x400118
>    ...
>    iret    ffff800080012284 => 4000fc  eret
> 
> The hardware trace supplies 0x4000fc as the preferred return address.
> For an IRQ, this is the architectural resume PC (Arm ARM, R_VBQMV).
> B.LS has retired, and the saved PC identifies the boundary before the
> following MOV. Using this PC as the IRQ source reflects the
> architectural state at exception entry:
> 
>    hw int  4000fc => ffff800080010c80  movz x2, #0x1796
>    ...
>    iret    ffff800080012284 => 4000fc  eret
> 
> The IRQ sample represents the transfer from this architectural execution
> position to the handler. The series synthesizes exception entries from
> exception packets, preserving the preceding branch and its outcome.
> 
> The supporting changes:
> 
> - Let decoders supply sample.ret_addr so later instruction fetching cannot
>    change thread-stack return addresses. Apply this to Intel PT
>    asynchronous samples as well.
> - Prepare packet ISA and instruction-size handling and share sample
>    synthesis helpers. Mark untaken branches and break history when
>    instruction memory is unavailable.
> - Add a thread-stack regression test and four AArch64 CoreSight tests.
>    IRQs and page faults must resume at the entry PC; SVC and emulated MRS
>    must resume four bytes later.
> 
> Based on the AI search and test on my x86 machine, this matches perf's
> Intel PT handling of IRQs. Intel PT records the next instruction's IP in
> the FUP packet, and Perf uses that IP as the interrupt sample's source.
> 
> This series is verified on Orion6 board with "perf test coresight".
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
> Changes in v2:
> 
> - Rework the fix around exception packets to preserve both exception
>    entries and preceding branches.
> - Add explicit return addresses and the Intel PT asynchronous-branch fix.
> - Split out packet/synthesis preparation, record not-taken branches and
>    handle unreadable instruction memory.
> - Add thread-stack regression coverage and four CoreSight tests.
> - Link to v1: https://lore.kernel.org/r/20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com
> 
> ---
> Leo Yan (14):
>        perf sample: Allow decoders to supply branch return addresses
>        perf intel-pt: Preserve return addresses for asynchronous branches
>        perf cs-etm: Break branch history when instruction memory is unavailable
>        perf cs-etm: Centralize packet ISA initialization
>        perf cs-etm: Use the recorded instruction size for A32 and A64
>        perf cs-etm: Mark branches that were not taken
>        perf cs-etm: Factor out final instruction sample synthesis
>        perf cs-etm: Centralize branch sample synthesis checks
>        perf cs-etm: Classify exception calls using the exception packet
>        perf cs-etm: Synthesize exception entries separately from branches
>        perf tests: Check CoreSight IRQ entry and exit
>        perf tests: Check CoreSight syscall entry and exit
>        perf tests: Check CoreSight abort entry and exit
>        perf tests: Check CoreSight emulated instruction entry and exit
> 
>   tools/perf/tests/Build                             |   1 +
>   tools/perf/tests/builtin-test.c                    |   3 +
>   .../perf/tests/shell/coresight/abort_entry_exit.sh |  21 ++
>   tools/perf/tests/shell/coresight/irq_entry_exit.sh |  37 ++++
>   .../tests/shell/coresight/syscall_entry_exit.sh    |  21 ++
>   .../perf/tests/shell/coresight/trap_entry_exit.sh  |  24 +++
>   tools/perf/tests/shell/lib/coresight_exception.sh  | 165 +++++++++++++++
>   tools/perf/tests/tests.h                           |   3 +
>   tools/perf/tests/thread-stack.c                    | 106 ++++++++++
>   tools/perf/tests/workloads/Build                   |   4 +
>   tools/perf/tests/workloads/branch_not_taken_loop.c |  33 +++
>   tools/perf/tests/workloads/page_fault_loop.c       |  37 ++++
>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    | 106 +++++++---
>   tools/perf/util/cs-etm.c                           | 222 ++++++++++-----------
>   tools/perf/util/cs-etm.h                           |   2 +
>   tools/perf/util/intel-pt.c                         |   7 +
>   tools/perf/util/sample.c                           |   1 +
>   tools/perf/util/sample.h                           |   5 +
>   tools/perf/util/thread-stack.c                     |   5 +-
>   19 files changed, 656 insertions(+), 147 deletions(-)
> ---
> base-commit: edd8a9fe2eca009599e013a29c421c7a6b5ad1b9
> change-id: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e
> 
> Best regards,

Reviewed-by: James Clark <james.clark@linaro.org>


