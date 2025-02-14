Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A28C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 21:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlhiDPymIkAFpqS31cawovxC1cl4Iu2FY1GLOTebs9Q=; b=q3Vep4y64OlWoQJDKeIHKqekhO
	8XdbPYQSbg2mtJV1+VPXQ+JT8DY/2IIquM9YVQt+7DYPTOHM/2xqjpZ4Ns4gnH9dKYPsbho3fyIhV
	Fiyz0RtyfOLKfOC0pSQYKDGWjSxQWPmr21GXrznuGjS3/R79breWuvn6m31vkYVCaG6vESpUQQIG+
	q8ZxtlgynjDCDOdK/WwtQHkMmW6gv0/h5sma4F2bkl3ihxbEpYkgpDkntObIlhUZkguY3wR4SKjiL
	hvo/85DLNNbSM+vhtBR3K/tYC9mNZLHPmtoIFIkJaJGpoVKcXR9WOuVAB7z1o6hVpFpgZQrp6dPTR
	7JN4MA7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj3Ay-0000000GG9s-2lW1;
	Fri, 14 Feb 2025 21:24:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj39X-0000000GFyQ-0TfE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 21:23:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 072C4A44B87;
	Fri, 14 Feb 2025 21:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A541C4CED1;
	Fri, 14 Feb 2025 21:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739568193;
	bh=5gjSx2IlYtsRAfLRTCLW0PQUepqheWM8EALOFBH1aWg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aXiHOGw7sSyTp1dD57ZBhGwSN4fWVuc+SVggRE3XZwYqlLcQJKY4kIWdcD7e2ehnZ
	 2lPFGPXJSRkN4RSiuOfnS38THL5bXYGz5FBkm8R0bYY5PQiesqQOOYHbpVP3eJUKSg
	 incJM+Qq2SK1GepQa4UMBVpP7oa+bNTEpvFkm/TQnlHxmWw8WKToc5IKv8MGh11nPN
	 N29ua69//qrQM+h6JoZ0wS3H4YgFkxaEqH7/YPHMZS7j5aQ+juttR50/XIVW5SoOUy
	 9EEyG45Qhuj5/k3kM8mOeLzcqX2PvrgzMwjOxSCOvQmRZDdjz15W8EfQZNbNLjGzuL
	 VgcjkV5D0R5vA==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Ian Rogers <irogers@google.com>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
In-Reply-To: <20250214111025.14478-1-leo.yan@arm.com>
References: <20250214111025.14478-1-leo.yan@arm.com>
Subject: Re: [PATCH] perf: arm64: Fix compilation error
Message-Id: <173956819350.2296227.13350055330369051271.b4-ty@kernel.org>
Date: Fri, 14 Feb 2025 13:23:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_132315_218088_EB5BBFC1 
X-CRM114-Status: UNSURE (   7.58  )
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

On Fri, 14 Feb 2025 11:10:25 +0000, Leo Yan wrote:
> Since the commit dc6d2bc2d893 ("perf sample: Make user_regs and
> intr_regs optional"), the building for Arm64 reports error:
> 
> arch/arm64/util/unwind-libdw.c: In function ‘libdw__arch_set_initial_registers’:
> arch/arm64/util/unwind-libdw.c:11:32: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
>    11 |  struct regs_dump *user_regs = &ui->sample->user_regs;
>       |                                ^
> cc1: all warnings being treated as errors
> make[6]: *** [/home/niayan01/linux/tools/build/Makefile.build:85: arch/arm64/util/unwind-libdw.o] Error 1
> make[5]: *** [/home/niayan01/linux/tools/build/Makefile.build:138: util] Error 2
> arch/arm64/tests/dwarf-unwind.c: In function ‘test__arch_unwind_sample’:
> arch/arm64/tests/dwarf-unwind.c:48:27: error: initialization of ‘struct regs_dump *’ from incompatible pointer type ‘struct regs_dump **’ [-Werror=incompatible-pointer-types]
>    48 |  struct regs_dump *regs = &sample->user_regs;
>       |                           ^
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



