Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1690CCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/98G9Vg3CdJ3Avb1ED+urdXHDQjxeUzKi/QRqUAozA=; b=axR4ujqaOQ/lb4fG/ZiVpLMWu6
	45HhDk893fDu/T/fLlaB3lqtoDYsBPzTMKlNvpuzILJnOUuPy/YiK/PlPY9sucsQco52Hmg1iWC9l
	ZsfdVxlb9iOVENKCHEzvBNlc4qBC8CgPQTFpZPCKiSx+50c8/g/oj5V8a3LdTez48zpPrNI6+6VRg
	MgZ+xn9uKuEJp1k7K7moUCWpyr/VNzO4cpn4LkJBksgLYXNez+zUN2x58xRQafvtLsS59Xw4iWZS2
	Gjt6Lrs575803XHryPyzawaAzyEQUdvMre1WpRQY3t17EsE8tT75LAiElITyLBfF4n8i3TPNyY4ia
	gh/kXr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjY-00000000fAM-3nSU;
	Thu, 18 Sep 2025 16:43:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHjP-00000000f45-3PBX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 16:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B23343C32;
	Thu, 18 Sep 2025 16:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21495C4CEE7;
	Thu, 18 Sep 2025 16:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758213819;
	bh=qFtgFQc45qH6NI8BCfmuOT4L0z37VVKN0klbtf67YnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q8hFiwiWtw0hUG7YjuNfM7nuZGywpt1+gyDojeilUUUPtmmmWVyvgdfauJW+/hvnP
	 PpWXdWzALUFGC9hAGJh2MxtLazBVKNJxqMm9LvTOIrQ/wbcz1Rj1YqLC+oNaLzWke0
	 JuaSL3ovkaOhx9XlQO7U2QXEhQPU2g5V4NDQX8jgoEYfFk4W1Ke8/CVFkpH4vHNQrU
	 sJaWTSauMGgvU+5FbiBbBQEiMKTYsAYwj7kFHvBj3ef79ljQJYX/ZZlUhyoLGHtaEI
	 O42oZtalg3qihlhLN4/wVoXbgCEcA2yUQxm6tV3azdFnYNgeFcrbLyZ786BPj1RjqY
	 5Rs6f6knzNy6w==
From: Will Deacon <will@kernel.org>
To: Frank Li <Frank.li@nxp.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>,
	Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Xu Yang <xu.yang_2@nxp.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 0/5] add imx94 DDR Performance Monitor support
Date: Thu, 18 Sep 2025 17:43:10 +0100
Message-Id: <175819950650.3462177.6226529699819628940.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com>
References: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_094339_873735_843FA96A 
X-CRM114-Status: UNSURE (   9.90  )
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

On Thu, 21 Aug 2025 19:01:48 +0800, Xu Yang wrote:
> The i.MX94 Soc has a DDR Performance Monitor Unit (PMU), this will
> add support for it.
> 

Applied drivers and bindings updates to will (for-next/perf), thanks!

You'll need to route the .dts and tools changes via their respective
trees.

[1/5] dt-bindings: perf: fsl-imx-ddr: Add a compatible string fsl,imx94-ddr-pmu for i.MX94
      https://git.kernel.org/will/c/f8cc02321bfc
[2/5] perf: imx_perf: add support for i.MX94 platform
      https://git.kernel.org/will/c/e4d9e8fb406b

[4/5] MAINTAINERS: include fsl_imx9_ddr_perf.c and some perf metric files
      https://git.kernel.org/will/c/2c599c68c43e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

