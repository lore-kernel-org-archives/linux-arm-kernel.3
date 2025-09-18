Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D69CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 11:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNZUT0/z5L2ajO369jP95ubiNxwdFqBMgHYjkR6XMJw=; b=3QswH/vGRgz4b7v1d0oJFAH3GY
	IuRsjPI1eaBx2leM63EUkFTs633jc8oJby4dbTPY4/f93yYRtWvnTsFlO/z7Oq5mBU1RKW71xJxip
	enyWlugzd44tV1E8L0EH55Y+aZqe7aX/oC3va4LTKem/iKcsraXa4SOX+wntFj0AhsEujyPZKPImj
	ul82oJXZTgSLei8doah/DDg0+59Aa6ix3Z+iMalKXkHiKdH/jJOcefwrOJ47xt/nB3lY1lvN4TEZR
	Tsm3YDoEZsNuGJ2yQbFnpj/tDdXpZjAKFvF4bkXcII5zI8THYKE6pT4e0AtpcuYQi+/2aI5TVxYVi
	2C6ATn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCTU-0000000HAzt-3SGy;
	Thu, 18 Sep 2025 11:06:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzCTS-0000000HAyI-3Mc8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 11:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 295C84368A;
	Thu, 18 Sep 2025 11:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4C7C4CEEB;
	Thu, 18 Sep 2025 11:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758193610;
	bh=tLCrfcwuvmqPecuw/USrpVPpjk1XTTQBWxdekuHCy/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBef1k3P2JyWc9LBWFAz6ImTtdvOwDQn6zp/dKDsPHP4Jc1ELZP0a1OBbDHZYRq25
	 FEENxEfLwSAaOA0OVE1zmGTvB8Dcqb7s/BC/Za5PEFIFXxhFXFT0E0aBjtA0BGf+LU
	 9EXN+s65WmQ5ItxX5LeuWXtJAOeBSCPNfTZEKW/iF8MqI+fTSyKhoDYaqzXChqyrzA
	 DbjOMRKjHimtUflLNy+xZtbs81X8DmfrXSgogRsVdiTGReljuX7BekvciP166Koa82
	 xfe2EfwqnTFFfk287DUlREOMPKxP9mGfmARdwYYjL59cezZODjnsLVGWH2rXipvnGI
	 HvbbTs9WVUlng==
From: Will Deacon <will@kernel.org>
To: "Liang, Kan" <kan.liang@linux.intel.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@linaro.org>,
	Jiri Olsa <jolsa@kernel.org>,
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 0/7] arm64: add R8A78000 support
Date: Thu, 18 Sep 2025 12:06:35 +0100
Message-Id: <175819208575.1966292.14850843650367600650.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
References: <87ms6snut0.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_040650_857134_94239145 
X-CRM114-Status: GOOD (  10.37  )
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

On Thu, 18 Sep 2025 06:23:07 +0000, Kuninori Morimoto wrote:
> This is v5 of R8A78000 support for Renesas.
> 
> This patch-set adds R8A78000 and Ironhide board support.
> It is based on SDK v4.28.0 or later. It will be released at end of Oct.
> 
> Link: https://lore.kernel.org/r/87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com
> 
> [...]

Applied MIDR bits to arm64 (for-next/cpufeature), thanks!

[4/7] arm64: cputype: Add Cortex-A720AE definitions
      https://git.kernel.org/arm64/c/f38c2c3e572c
[5/7] arm64: errata: Expand speculative SSBS workaround for Cortex-A720AE
      https://git.kernel.org/arm64/c/3ba8d4aa42bd

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

