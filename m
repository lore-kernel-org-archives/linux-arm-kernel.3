Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F6ACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DD8TObGOPn7D7Vdgquh39HKJ5mGyhMlltWWCwU/KcV8=; b=Ri6kbNNEDz7ItCCUFqyeQ7Lk84
	2gXt3uEexX8gX2V3vPO79JRvFrNjJ15H/6vsLG0b51Vyt2XBZXMq3cuHJMtDGBAalyqPnY5plJIcK
	FpfQCbRij/TVqB9AKnwf9lB2p+jSgaBZcLrbZGewwJh3lSD60hMdns5KHu7R6eLvIXKF6pAZRehFB
	7WOVRUk5ShGAYvGdLdKPnlXGpUSPKzLgbE2AGPe7nTg5ynOaKF1WPpv5FzKNm0jX9kSD8hS5GnBzF
	LKfoXaWwfl0kQuqHDjgy6NSpWhqXPbZ3XKnfV8L+MKbxUIA65YJ0IE1XwsTp5nO44Bkt0eTgqQGLO
	E7K17HnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQfg-00000000MVZ-2qDR;
	Fri, 07 Nov 2025 17:54:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQfe-00000000MUt-1tvo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BE7A61913;
	Fri,  7 Nov 2025 17:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C74BC4CEF8;
	Fri,  7 Nov 2025 17:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762538085;
	bh=WU7NZ37QH/2z1O6WY2Xy4ePTQRdnSUSd/yHy/qMlRHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dp9UCJ+Z/kBOTJt3aGLyKq1STWGqL4lxGta15RFcLRyICCUFoaK6Rq0sfjWgvZ+OT
	 n0sKB+wSxSUizC+aMLa7mcKpH+Rl8IdfwHrEX8ynDWNa5MI/7SnmknEgLwqGIiMRh4
	 GhmwTybgneQ8atuqnI/EOSiCGk9pNwwagw9qQDCde0LiI5a74a/oDI3IzoadSkdG9T
	 oIjHJeM7paDgpcjVrTlZLKGcJ4SIY0ZYk0rKJGk9fveb98CodKSuxZsA+KvK7uS83r
	 ZdIEs2wSLsdIbbEQVskAEUy2B9bI4SpU5py4QuSGE49ISXKdNEdvEtd7nB4numSoyC
	 dsMr8J3KiHOYg==
Date: Fri, 7 Nov 2025 09:54:42 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	John Garry <john.g.garry@oracle.com>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/5] perf vendor events arm64:: Add i.MX94 DDR
 Performance Monitor metrics
Message-ID: <aQ4yYi05pYL9j-Mt@google.com>
References: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com>
 <20250821-imx94-ddr-pmu-v2-3-052c6420605d@nxp.com>
 <wlziowwtfqbhzsltffm4l3pxntev3lgjan44wfixztnk3gw5d7@z2selm5eczsq>
 <aQ1Pp6GF6svXDXoy@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aQ1Pp6GF6svXDXoy@google.com>
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

On Thu, Nov 06, 2025 at 05:47:19PM -0800, Namhyung Kim wrote:
> Hello,
> 
> On Tue, Nov 04, 2025 at 02:33:08PM +0800, Xu Yang wrote:
> > Hi Namhyung,
> > 
> > Could you please take this one?
> 
> Yep, will add this patch to perf-tools-next soon.

Applied to perf-tools-next, thanks!

Best regards,
Namhyung


