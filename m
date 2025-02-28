Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E959C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IWAR+IBURm6fLbHh3tr2O3zeACO2+3CQvBtXQZTu6M=; b=F6flJ/9LSyb/a2q5CXhI2osvL5
	/eAa1rZHzk6nUWnFZ9ujHj5UxWJEv/r0NzqOSO7g9KdzsdPPccrTKVf04JrxpkgdEEUVTaSYXe7cG
	LJ5CBshWos+VjymGqnEZMuutIX+GM1zxMHRkWiBuqEkjSAdGwHQd7GoA5P3MMZYEAqeYgdpYtfB1r
	2zwJzGK7opHrxYiwqmymALvCjzHGT3iklngbb36Xula7cyyYTkLe2lpFYbhyikQX2I49g1Eg9R2IZ
	R2Yb6Igz6x94mFIg7pnuBFbSNTK9ghq20t9ulxIhCzZzQN5plZXczfly+Ab7CwXzdPfW0CWCGBXUd
	os38KUFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to8oZ-0000000CrhJ-0Az7;
	Fri, 28 Feb 2025 22:26:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to8n0-0000000CrOl-2PKA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 22:25:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A9845C69FE;
	Fri, 28 Feb 2025 22:22:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6CEC4CEE2;
	Fri, 28 Feb 2025 22:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740781501;
	bh=nl0RxLxluqEXdwZrRYcWUvlPQj16buT8wUVR1+IW6iM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=kLYoa5ZD1tgEpJrzTr028axEhdyIgCeEEujQNZ+krj6mzvUouRhGZQ8em5TF2zHM7
	 ShRDbMBadSb5IAkSXm2Lg+UFy8bZ6fqVLGJNfPTNYRonz2a/G0tf6XGq8oSpc/gyLr
	 SBKjq2MaTK5I3RVuBQMXk5ZyKRnaS95Ubv6CJ+/SY48mLvWem58bPzLjyg5FYJbMVx
	 aAlGcVaLYA+kJ5/aWYyuHKo4CXMQ0ZWNvDUrhfb9PeF6Qaee2pug9/lIDHB+hbBmzM
	 30SeD0ZIw2Pw2yOnV+0t+aj7O+JEmTNFe9pfjQ2wr7bdiNnZuijUgzSESdT57CrWrF
	 Id+Krrv4JXJ+w==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 Mike Leach <mike.leach@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
In-Reply-To: <20250227085544.2154136-1-leo.yan@arm.com>
References: <20250227085544.2154136-1-leo.yan@arm.com>
Subject: Re: [PATCH v2] perf arm-spe: Report error if set frequency
Message-Id: <174078150058.322575.7287434251293207744.b4-ty@kernel.org>
Date: Fri, 28 Feb 2025 14:25:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_142502_676902_733A0CA0 
X-CRM114-Status: UNSURE (   6.77  )
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

On Thu, 27 Feb 2025 08:55:44 +0000, Leo Yan wrote:
> When users set the parameter '-F' to specify frequency for Arm SPE, the
> tool reports error:
> 
>   perf record -F 1000 -e arm_spe_0// -- sleep 1
>   Error:
>   Invalid event (arm_spe_0//) in per-thread mode, enable system wide with '-a'.
> 
> [...]
Applied to perf-tools-next, thanks!

Best regards,
Namhyung



