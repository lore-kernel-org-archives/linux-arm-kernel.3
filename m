Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37DDC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCFWoQsxxvcIGets8kLMeKmFrMqSoLG7cv3B4SulRtI=; b=kT3xRoWV//roA6IXrlNfeFaMrZ
	UXtknxw97MGTMhY0SroR7WmfR7EiCv83AcSwMb1Cw6VXfgoAG+s8WgqTRqcfTDWCwtWMpqRNxlU6F
	yPdNp85qDpEYFjX3LVJdW/7pwXnSe7N2CqlyWtBlu+nndCGePTKsl+cTur1udXoyEbZs8JjdnQa6a
	f9lULy8b/3kVCEPzr5XKwyOL2P85SHwsTHcWcKlViCpLAvUKXpvLYm11N4O06yTmhY9A2fJ6XUkDi
	mJBZ1HWprXyGSspbWUYT2P+WUobe+PNktvY4PeueF/tzft0JSohFFghvfupCmY+tVzP79XDQwhIXH
	0j99vh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh9v-0000000FrL6-0fT2;
	Fri, 21 Mar 2025 18:31:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvh8D-0000000Fqw2-13rb;
	Fri, 21 Mar 2025 18:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 449BF443B6;
	Fri, 21 Mar 2025 18:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EF2C4CEEC;
	Fri, 21 Mar 2025 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742581808;
	bh=Aon3MpuqI2KphyJJxW/mgSijVLrvb2iG67m72HH1MKc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=da/wdTBUJ5ngQarDW94IRkO6+fhSqJjh3qAwgHe0AJCeraT/nuof6vKiDPfEldpB+
	 Ev9nJ+X7z6zIQr7K43miMJoSW4ar1pZoxHfE3vTdbXIrfafARUt0OxKYL7JS5+0JUd
	 +5ErgfRoLQgGUHhut1mQqpofgYCAvW8xIKr8iQ+DocDidcBTccppwAHCTQBZ87zcKH
	 UCvJ5M8VlfE0l/vmF1WL1aA7zGrFk5YtcIABNy2L0PI602Q8TvRekFkB08FDXcd9GV
	 7591axIwNbAESKy5nBIYVWl04wD+RQF7MHRGuQta6/mYx8tEarXLlWGXzClqbL8fcD
	 6fFNqXKe4IrCQ==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 guoren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Charlie Jenkins <charlie@rivosinc.com>, Bibo Mao <maobibo@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Arnd Bergmann <arnd@arndb.de>, Ian Rogers <irogers@google.com>
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
References: <20250319050741.269828-1-irogers@google.com>
Subject: Re: [PATCH v7 00/14] perf: Support multiple system call tables in
 the build
Message-Id: <174258180770.163787.17026526140964969734.b4-ty@kernel.org>
Date: Fri, 21 Mar 2025 11:30:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_113009_312023_77F10D08 
X-CRM114-Status: UNSURE (   9.78  )
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

On Tue, 18 Mar 2025 22:07:27 -0700, Ian Rogers wrote:
> This work builds on the clean up of system call tables and removal of
> libaudit by Charlie Jenkins <charlie@rivosinc.com>.
> 
> The system call table in perf trace is used to map system call numbers
> to names and vice versa. Prior to these changes, a single table
> matching the perf binary's build was present. The table would be
> incorrect if tracing say a 32-bit binary from a 64-bit version of
> perf, the names and numbers wouldn't match.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



