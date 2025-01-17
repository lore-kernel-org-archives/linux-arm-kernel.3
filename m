Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2E9C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxU9CD7AEL7DsxPgdOBnQcaQoJw6EsEU9GDHeVBapzk=; b=uMdUetDn4SbxwQrCdFOgblVBM7
	UTlnVmfh/pSqU30Z9PiNE6XcNnMkyRBvDTvHgadmi2DaHoSnuuF8Ba/fzZFAdH0/pBjuo36b3DWHF
	cT3dk+d/yNX/VIfwIm5yuPjIvCDAlaP8mb59Eu/qdX4lXNu5j2+DAoiCKbMFf3+6sb1AQr0NjZ6zQ
	nMuTrwoBry0Wa36iDPqXlB9rg0K4DxjBfVpyN1e3cpWG1EaVWU641PHJYUGAJLcQgAEXmjjBMfk/F
	vBDo7TrqVQRAholsl39BjPgUnJOdiHes/u2spOJgymm2fLI0DiQgPrNEmZuJDL52isvV8dIFate1H
	OsLTk0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqZl-000000010hw-31w6;
	Fri, 17 Jan 2025 17:56:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYqYU-000000010N0-2UNN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:54:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E7A6A5C5A44;
	Fri, 17 Jan 2025 17:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5346C4CEDD;
	Fri, 17 Jan 2025 17:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136489;
	bh=IkLn0NUjJr3fRLkhhx+GSKLsB9SD/Hl6TVgxBLGOA2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eOc9ta3gkWAn3Ou50TPzvcaoJhumR/Y01YqIRNTO2bAnW7UeGUm6HfpQuFm1YAVwe
	 kmyQOkzNy1wsFqf48iDAbBRYQD3XK6B1rUg7mbsDezinfKYy/Iowp2W/LETxZIqto9
	 //a90tMic8n6QZYc/+i1h/eTmeJvEte/2IDNOSJfqVMX8KskdfNf3TcLm6ta4FsgLJ
	 xWXwrprfpfo5KV61zofv0te2fQgPKIO5R6Tf4gZss5aw5lzbFaGmKaGH5bOhkAyreQ
	 Y6Zvj4zS5WJRPgTxW6/TkUSaJVw/rWXl1SjC3brpXFzWuz6to+BLZ0B5HTRTokCdbE
	 4ISTMvjNukxZA==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>
In-Reply-To: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
References: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
Subject: Re: [PATCH FOR-NEXT] perf tools: Expose quiet/verbose variables in
 Makefile.perf
Message-Id: <173713648876.2190713.3137931166483000893.b4-ty@kernel.org>
Date: Fri, 17 Jan 2025 09:54:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_095450_678924_C4DE1BEE 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

On Tue, 14 Jan 2025 11:35:44 -0800, Charlie Jenkins wrote:

> The variables to make builds silent/verbose live inside
> tools/build/Makefile.build. Move those variables to the top-level
> Makefile.perf to be generally available.
> 
> Committer testing:
> 
> See the SYSCALL lines, now they are consistent with the other
> operations in other lines:
>   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
>   SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
>   GEN     /tmp/build/perf-tools-next/common-cmds.h
>   GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
>   PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
>   GEN     perf-archive
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   MKDIR   /tmp/build/perf-tools-next/jvmti/
>   GEN     perf-iostat
>   CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


