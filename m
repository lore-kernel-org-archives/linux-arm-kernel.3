Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913D6CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIMwYMSnE8nDfuMUHS/9B89S1OitLWwePgV+euX79MM=; b=nw5f0IfclVMSe3jCBxkFHucj+N
	LOvm4MMmTiPl9Fz9KK4wYpsGwflavbpONlZtvkDZW09Q0G1djxYXlV7p2O6LIsGR9lTKtsXSf9FNc
	twusx/ftDF4xQYk8bzoeA4NchSNsVq4U3N9JT9nK6glBqvSEVItnWNp9CXaG69vi4DQsq7xfC0C5/
	tVv1aEMUlWn0SNJ5xX1sGU2mUs8qhbqGZD2juCReM92xklyFFgIkoY58HJdpGkMyR2BEBTjOzYHDa
	WtHpvxxQSdwBthQFh66LavOG2Cp1bv9ZK8oJ9jTH+R5TClRLRwrfIP1NnlguC4A7SAj1gwCg4oiHM
	1qv4P+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC1a-0000000H6dl-42qF;
	Thu, 18 Sep 2025 10:38:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzC1Y-0000000H6d4-2saC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B7EF41B18;
	Thu, 18 Sep 2025 10:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23865C4CEF7;
	Thu, 18 Sep 2025 10:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758191880;
	bh=3wLU6rYHf7utHzIANk8nK0heYOD/FcW8/1SsNTd/TNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A5E6Pp7WkZ6ZhzfTDXPr0l2+wqXgliX2Mp8KjhOeOsDgvGO2D75+jOAkhLYlyaQZ7
	 N3O1DZMqrmt6Y5gLH4Y2TY1Gt5wiYzbJcI+o7VrWRC8SJVZAO+n4tfabmw3tQlFOMr
	 SO2BMMzV75ta8jdULM9mL4kxIwvZOlPS0tBXY0z6iNkjk1Y7lttAzjyRSRKePXFqmp
	 0ZBRQgfm62kGaevn1Z0irlM0Dj4tGtU3DkeYSmSjpfRdl5C9g61qyszcAcM03zkFqK
	 e77E8mC1whTqazcK0cgZ5ZsNUNzgNAzmRpDX8S2oH5jY4kP3pg6yuasNTn9OpP+R/D
	 E1Ocy/BjljNlA==
Date: Thu, 18 Sep 2025 11:37:52 +0100
From: Will Deacon <will@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Liang,  Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>, Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Leo Yan <leo.yan@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v5 3/7] tools: arm64: Add Cortex-A720AE definitions
Message-ID: <aMvhAJ_NIgjGxuvA@willie-the-truck>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
 <87ikhgnun4.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ikhgnun4.wl-kuninori.morimoto.gx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_033800_745481_7E61C8B2 
X-CRM114-Status: GOOD (  12.53  )
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

On Thu, Sep 18, 2025 at 06:26:39AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A720AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A720AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> ... in Table A-187
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  tools/arch/arm64/include/asm/cputype.h | 2 ++
>  tools/perf/util/arm-spe.c              | 1 +
>  2 files changed, 3 insertions(+)

Acked-by: Will Deacon <will@kernel.org>

Will

