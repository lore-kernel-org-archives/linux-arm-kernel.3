Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65818C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 17:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skiy0t/2D1qmrP32rNpVRNd7pVJJPqrYexsHFwmhkqg=; b=jjjr4jnoRZZb90KZh60c5cuvtv
	mY3n0oY0y0Yto8wSSyyvGyJGPLLA/E+i2cj9fatCWlLRkwlHnViWIjWYS6FfHym7w4CJ9bYSPj6dJ
	sRmzHZ8A2u37tvHXTlsKmRdX+8rBQjz0D55mQlYmVbah16E1qFoxACm30ojW1945gGvih1j5aiR02
	X/Z1QegC7LNU5bN83fe62JXXq5/iphcgOB4m45e2tINIeAkr0xeBdB0QpweKqn4MO62EFBIj7sQ3P
	PGtufnrHLD/4/Em/X4RpodxjfxS0/C1w7aQtaL974oVWWBibTiRRKy/D4XmVk7+BA43FRfFIC+qte
	braJQp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqda-0000000CONf-09jB;
	Thu, 26 Jun 2025 17:43:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUqbH-0000000CO1E-0gBe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 17:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50FE55C6583;
	Thu, 26 Jun 2025 17:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11182C4CEEE;
	Thu, 26 Jun 2025 17:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750959685;
	bh=ahu7b8h0/NS1zVvXZWP+eDKOIDBXGlxQOOeuTnPcU5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZAUVqbDUZD+a0kiN0Om7EaZvqcvUG8kOiE6BCVsV6rTd/pHhyhgEfih95vYm3zS7a
	 /paQaeusn1W+w3mcMoLEqh3lRHmVMgKZVC3n2mtzO/2CjR/D36hUlTQ/CMep4B2w2p
	 RQ7oZnpgfesHr1bqEG9O0ZU9S9GHrPM324Q6HcYjMkvuK+Sctn+VH6Fn9DAF5dnBW6
	 fu6goiF6T3Eu322AplhVrjrfnKjqCT+z7pxGsNcsjBJW8lfx9SGrin4Grde/nrlvdv
	 GQ3eovw7RFjTDpqhbWIIVBuK7ZlOTj9TOKNtcPv1UYXBnY88Wg5si3sUmaX1IOGLYS
	 7pSleJtyTCh9Q==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Collin Funk <collin.funk1@gmail.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 bpf@vger.kernel.org
In-Reply-To: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
References: <20250623-james-perf-bash-tests-v1-1-f572f54d4559@linaro.org>
Subject: Re: [PATCH] perf test: Change all remaining #!/bin/sh to
 #!/bin/bash
Message-Id: <175095968503.2045399.16026333437061068793.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 10:41:25 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_104127_248154_9D356D22 
X-CRM114-Status: UNSURE (   9.84  )
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

On Mon, 23 Jun 2025 10:00:12 +0100, James Clark wrote:
> There are 43 instances of posix shell tests and 35 instances of bash. To
> give us a single consistent language for testing in, replace
> all #!/bin/sh to #!/bin/bash. Common sources that are included in both
> different shells will now work as expected. And we no longer have to fix
> up bashisms that appear to work when someone's system has sh symlinked
> to bash, but don't work on other systems that have both shells
> installed.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



