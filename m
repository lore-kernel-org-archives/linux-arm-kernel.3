Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE12C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2l878moTEqI2t+Rvm4n0EFds2k9pUQPPvvAkNFpXCYA=; b=RWgYUqlng0T0PixDqzOOM0MW6q
	durq13hQMuG974ggnUxfFe1FCLmw2NiKaE8ZDV31fuPcUEeJ9jVhYLDRcRatLCiMU6PdJfR2lPBxm
	jfZUCkX7DsNs9pxHMsjt0xVMAPFxP/05u6DIY1zwNcfN79fPVDuuzgGz3hwqhu9QWE8LVk8aU/ZWz
	TE93gM6yjKdWggjfpb/6BeQEWYxR6fmY3Iu/FWhIDCAETdpo/HxNNreZJWsGlwS4+aNkoAcP2yX78
	anZkdYoUXKOzm4fDTcR7ilpmWXR3mYrokiauVAslCukMHkc7zEwLsvpucAoMzmzM6NUvfURzI3HR9
	ckrIc4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTyK-000000032vt-1oC8;
	Mon, 27 Jan 2025 18:36:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTwz-000000032oZ-0ipK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 18:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7183BA41986;
	Mon, 27 Jan 2025 18:33:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F808C4CEE0;
	Mon, 27 Jan 2025 18:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738002908;
	bh=dERTfVk9xbmRISZO2txnelT4RFFG9bNlKVozSZahXk8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qivj5U5MNVlTMYwFLLfOT4FDpqjuyeHy1Wu2gEC9RMj3HN+BnN7aSFZpyZgMifzbw
	 Iv3YUC6R3KcX3bhSXEHw3Kz593MIUzLJ2zC8q0jJyWebFxpE/ciA19ZDtoJTOULpjp
	 WK3Nl9/XvzN6XWFCJV1jX01BcUqPOBlgl75eHkVZtyIjElTDHLb6Be+TTOV656zm+5
	 nV7ZiBWlHEhFdPl3oSHm0ZG2mqutalDQp3PKlVafhhJ+XXD9XA3moAlaw5YN0XBYWe
	 PSzvi0kvuEVD1Wy115wI1A+saqSGjFEEO1VjbL1GN9QOKBZWiHcJJZ3Zlkrp0RCUXi
	 GDD40br2dFEzg==
From: Namhyung Kim <namhyung@kernel.org>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 "Liang, Kan" <kan.liang@linux.intel.com>, 
 Yoshihiro Furudera <fj5100bi@fujitsu.com>, 
 Akio Kakuno <fj3333bs@aa.jp.fujitsu.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250122163504.2061472-1-james.clark@linaro.org>
References: <20250122163504.2061472-1-james.clark@linaro.org>
Subject: Re: [PATCH v2 0/2] perf vendor events arm64: Add N3 events/metrics
Message-Id: <173800290747.34478.7772336329501115835.b4-ty@kernel.org>
Date: Mon, 27 Jan 2025 10:35:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c04d2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_103509_275567_9D8016A3 
X-CRM114-Status: UNSURE (   7.57  )
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

On Wed, 22 Jan 2025 16:35:01 +0000, James Clark wrote:

> Changes since V1:
>   * The generator script wasn't adding new common events properly and
>     also wasn't generating groups for N3 and V3. I've fixed up the
>     script and regenerated.
> 
> James Clark (2):
>   perf vendor events arm64: Add N3 events/metrics
>   perf vendor events arm64: Add V3 events/metrics
> 
> [...]

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


