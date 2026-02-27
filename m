Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408D610398B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WNFvWid6yR3dTBRSHBWdFznPTEiMFrty9qoaAvK0+k=; b=j8GK+IAJiV7AWFTA1dvEqJ1uM7
	y3tALz113ubdd7V5530of4ZFGMSZEdGs1pS4FWBWLgH139vGG/YS7NUWGpr3O0zvhIe49amgQ7AiN
	MWtQdHbmuWKZg5aosEHOcss+E5Wlz3z2PhoIaGs+3La8M+td8PfsQVsEpokozVckdbF9uLbeZJm1r
	nONeHvyp6BNP1AenSFRLFY0Wh9ZQZRZ7RZhEZ+NYPxwibcKQSNXj8fLYtn/05gbdwWS2rumuC04p8
	r00fvIQx6z5NBHEj1jvIh/8V1z6JcB3txvohbw8jnM0LpBehdO624523OYwKyfxiJbJZhm3ISq0uI
	IrudINZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5SA-00000009BRC-1oIq;
	Fri, 27 Feb 2026 21:32:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5S8-00000009BQs-3LDz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B4EE4450F;
	Fri, 27 Feb 2026 21:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF47C2BCB1;
	Fri, 27 Feb 2026 21:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772227970;
	bh=4Bcq5DBmzV7NDGcNBIn+YI+kh7IQgvwZm4evcOFBoLw=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=FucmdOkhG0G3t8fD7dPJpJ85fCukaaAVGID1Hjc3oLNbQzV3d3TskdVucQ5C+ednr
	 mo1SeKCFPgQmBSJOlRBr+zJtV+MJm2ZzEhs+YRBQ86lW5p56evELqxXrTeSWnppWXI
	 D5HjFakXA5D+/ilmvxR2Rmq3tgKQzq21bARbgO+45vaCf9G5RM47ZINPwpABxcl8Xv
	 kE4/yoXTv7Z9RnQ2pgguvovj8jG+JzN7wiAikEqDG8x596HjVnTvX6Enn/gy7cJLol
	 ORvV9WFeycp/tmCb1TPYD1stBj9Kd+s/O/IXTTBQ5qTqUVPY5aYN/HRqtIndqS6Avx
	 /wubLjf/Kx1Xg==
From: Namhyung Kim <namhyung@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Dapeng Mi <dapeng1.mi@linux.intel.com>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ian Rogers <irogers@google.com>
In-Reply-To: <20260226175936.593159-1-irogers@google.com>
References: <20260226175936.593159-1-irogers@google.com>
Subject: Re: [PATCH v2 01/10] perf vendor events intel: Update alderlake
 events from 1.35 to 1.37
Message-Id: <177222797041.277001.16540713245344430231.b4-ty@kernel.org>
Date: Fri, 27 Feb 2026 13:32:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_133252_885792_035FE571 
X-CRM114-Status: UNSURE (   6.39  )
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

On Thu, 26 Feb 2026 09:59:27 -0800, Ian Rogers wrote:
> The updated events were published in:
> https://github.com/intel/perfmon/commit/632936400cfc5978c7b4519c865c137de523bfdd
> https://github.com/intel/perfmon/commit/a96d6bf4b50d6ce31e2ffd0be8d13022d07ae319
> 
> 
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



