Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F6ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EQOTOXxwL8J8TPwmL6aKDGINpM5bQJF7/0qjTVFDRc=; b=Hez3TuOfraXI6qN1HZWgYfH7Dv
	EIB3Li8xg5xUPgRL8ObA85V7cgZzKyE+OdpcHss/i8WwWTdA3+HY5aDyikeb2RPseZc/uwAebdRma
	DF1+Vbl7jlgMFtG593hTVtj3LhnrM4K2/Z7Z2rDAdEfpq/2r26U7i9czLmgqBDnH3ow/4AHTMRYU7
	kCKwNYMqGHLfuVE59UQdpaE7kjCZvFkkgVHFDc46hEvpl8ip+oDHgTdaTaBX+YvVsoii3n1/FoUfc
	eWEdXHR8gMHvFTZq5O+ipEI4RiowUK5funjN3Q53BlB+qgieAoXnjQeFEP1oHHyDfjUHBmgsqNcOo
	Ru/H4NQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqpN-0000000BDHA-3aVo;
	Wed, 17 Sep 2025 12:00:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyqpM-0000000BDGK-1AF1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 12:00:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BDA9601AF;
	Wed, 17 Sep 2025 11:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4441CC4CEF5;
	Wed, 17 Sep 2025 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758110399;
	bh=iR5+nco2EXNlSn4A2SXA42HaKbUNS/VQWh8sK0f6yhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S0b0Z0LDC7ZatNJWoSFifZpi5eMunY/GMLlAQgcDKrKfB1tHTmXZtjARH19jixr4b
	 U+AFtcAh/obHUbw3mHT3AKzlUDSdBbDHkSwx3p4SxQ9DoLn8r0JwppUxwiCWYXpzxt
	 tI1YhLmSbnrP2fzwKh+jbHdm33vjW5kL/D0iMf7zPuA80yIxfn1UrMQpHcJ9GzmfOZ
	 nxt+fjgPRD0cASGO/3Me1AkjyiRstx/j6qOLFn3ImJfSHR1MaXZSfH5XP4gTIQMjJS
	 gGDRuJ9zIcdV6zdxY0rqsQpnB3LbA11UxNJFyFzV3JQXEtNJAkEJF9L6WrMkamOJw5
	 BkbvDQX+6MANQ==
Date: Wed, 17 Sep 2025 12:59:50 +0100
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
Subject: Re: [PATCH v4 1/5] arm64: cputype: Add Cortex-A725AE definitions
Message-ID: <aMqitjILn1GomkXt@willie-the-truck>
References: <87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com>
 <87bjn9abne.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjn9abne.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Sep 17, 2025 at 05:30:45AM +0000, Kuninori Morimoto wrote:
> Add cputype definitions for Cortex-A725AE. These will be used for errata
> detection in subsequent patches.
> 
> These values can be found in the Cortex-A725AE TRM:
> 
> https://developer.arm.com/documentation/102828/0001/
> 
> ... in Table A-187
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/include/asm/cputype.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index 661735616787e..b10eba7f52476 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -96,6 +96,7 @@
>  #define ARM_CPU_PART_NEOVERSE_V3	0xD84
>  #define ARM_CPU_PART_CORTEX_X925	0xD85
>  #define ARM_CPU_PART_CORTEX_A725	0xD87
> +#define ARM_CPU_PART_CORTEX_A720AE	0xD89
>  #define ARM_CPU_PART_NEOVERSE_N3	0xD8E

You seem to have sent the same patch twice but in both cases you're adding
A720AE whereas the commit message says A725AE.

Will

