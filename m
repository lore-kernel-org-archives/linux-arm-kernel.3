Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A61CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 01:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpqXTvgRYWvKkEIxc96hbTswApcldVGeoBlXf2I55nE=; b=qKIKsvu3a0E2yemAWkG6mhfUwx
	B/JHVwmVlhnF2CBvGiPb6xbwI01mlCZMXdo+b8AwxTk6eiR9H6oPGZjvPnkVLDR2w/PheF/fncEh8
	Zlnqupn5Zg93SxH0TFmqLx4VcKUcBpNcQ59jYKPA+DWf2VKdcBAUXzjXZNgp77pfeX7CQ4/qPkgXJ
	+q/CpIjxZOQIG//WD3U7cbh9OOSlWDPzm/iCNgCoaHL+0bocO3kp+awQXOJ6TM5XdCPQ6owgQHQwI
	bOHROuJpq0pP31LQs6gCsd62jhfWEsJ7QosGe80lz+Rnl9jW1gOMZKl0ucwuWskp7O30KpZ7vvRbP
	pIKVVrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBZY-0000000GXAZ-34v4;
	Fri, 07 Nov 2025 01:47:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHBZW-0000000GXA5-1Cyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 01:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 13DA143B13;
	Fri,  7 Nov 2025 01:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A97C4CEFB;
	Fri,  7 Nov 2025 01:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762480044;
	bh=z+81QhvzdMj0gydU3u9K7LAH1toJQiw/zUrK/FYwljw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HD7SploWbmhatVjZQ8r+tkxsKWb5KWR+PMDq3BP38S7GV/GlNmFyKvG0FvVSwiAUf
	 9LY0TRIQoIJ/pC9d0SX/nSETugSKOZxeFHV77RKTvDSjFMpWkyI+QorJnEbGMFlq2U
	 uN1/WBRLD8Y5b2NYqE7+FbfVO0Qnt1Tu1TbFKf1hRVXZU/wwbHFufNPIRSJgXF8b4/
	 1SEjUQsjWRpbxY/AgLb236c+MxCnfsNpZC3F+EF41360vZAjKL0BJZAHWL8DGJQ51N
	 OqN9eGRTnYsg4hsnoNQXEK+FpwjonFV8kd1UyU6R/p+FB2MMzScMrWvg7oIcu8YvyZ
	 L+eZ+AY4d4SYQ==
Date: Thu, 6 Nov 2025 17:47:19 -0800
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
Message-ID: <aQ1Pp6GF6svXDXoy@google.com>
References: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com>
 <20250821-imx94-ddr-pmu-v2-3-052c6420605d@nxp.com>
 <wlziowwtfqbhzsltffm4l3pxntev3lgjan44wfixztnk3gw5d7@z2selm5eczsq>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <wlziowwtfqbhzsltffm4l3pxntev3lgjan44wfixztnk3gw5d7@z2selm5eczsq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_174726_379623_38697DF2 
X-CRM114-Status: GOOD (  19.31  )
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

Hello,

On Tue, Nov 04, 2025 at 02:33:08PM +0800, Xu Yang wrote:
> Hi Namhyung,
> 
> Could you please take this one?

Yep, will add this patch to perf-tools-next soon.

Thanks,
Namhyung


> On Thu, Aug 21, 2025 at 07:01:51PM +0800, Xu Yang wrote:
> > Add JSON metrics for i.MX94 DDR Performance Monitor.
> > 
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > ---
> > Changes in v2:
> >  - add Rb tag
> > ---
> >  .../arch/arm64/freescale/imx94/sys/ddrc.json       |   9 +
> >  .../arch/arm64/freescale/imx94/sys/metrics.json    | 450 +++++++++++++++++++++
> >  2 files changed, 459 insertions(+)
> > 
> > diff --git a/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..aa7b58721dc7e23dc9d9905a79e0c1778b7bbf11
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json
> > @@ -0,0 +1,9 @@
> > +[
> > +   {
> > +           "BriefDescription": "ddr cycles event",
> > +           "EventCode": "0x00",
> > +           "EventName": "imx94_ddr.cycles",
> > +           "Unit": "imx9_ddr",
> > +           "Compat": "imx94"
> > +   }
> > +]
> > diff --git a/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..629f1f52761e2210ef43a9cbba175871817e1230
> > --- /dev/null
> > +++ b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json
> > @@ -0,0 +1,450 @@
> > +[
> > +	{
> > +		"BriefDescription": "bandwidth usage for lpddr5 evk board",
> > +		"MetricName": "imx94_bandwidth_usage.lpddr5",
> > +		"MetricExpr": "(( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x000\\,axi_id\\=0x000@ + imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32 / duration_time) / (4266 * 1000000 * 4)",
> > +		"ScaleUnit": "1e2%",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bandwidth usage for lpddr4 evk board",
> > +		"MetricName": "imx94_bandwidth_usage.lpddr4",
> > +		"MetricExpr": "(( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x000\\,axi_id\\=0x000@ + imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32 / duration_time) / (4266 * 1000000 * 4)",
> > +		"ScaleUnit": "1e2%",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of all masters read from ddr",
> > +		"MetricName": "imx94_ddr_read.all",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of all masters write to ddr",
> > +		"MetricName": "imx94_ddr_write.all",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x000\\,axi_id\\=0x000@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of all a55 read from ddr",
> > +		"MetricName": "imx94_ddr_read.a55_all",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3fc\\,axi_id\\=0x000@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of all a55 write from ddr",
> > +		"MetricName": "imx94_ddr_write.a55_all",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3fc\\,axi_id\\=0x000@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 0 read from ddr",
> > +		"MetricName": "imx94_ddr_read.a55_0",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3ff\\,axi_id\\=0x000@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 0 write to ddr",
> > +		"MetricName": "imx94_ddr_write.a55_0",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3ff\\,axi_id\\=0x000@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 1 read from ddr",
> > +		"MetricName": "imx94_ddr_read.a55_1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x001@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 1 write to ddr",
> > +		"MetricName": "imx94_ddr_write.a55_1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x001@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 2 read from ddr",
> > +		"MetricName": "imx94_ddr_read.a55_2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x002@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 2 write to ddr",
> > +		"MetricName": "imx94_ddr_write.a55_2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x002@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 3 read from ddr",
> > +		"MetricName": "imx94_ddr_read.a55_3",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x003@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of a55 core 3 write to ddr",
> > +		"MetricName": "imx94_ddr_write.a55_3",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x003@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m7 core1 read from ddr",
> > +		"MetricName": "imx94_ddr_read.m7_1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x004@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m7 core1 write to ddr",
> > +		"MetricName": "imx94_ddr_write.m7_1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x004@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m33 core1 (in netc) read from ddr",
> > +		"MetricName": "imx94_ddr_read.m33_1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x005@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m33 core1 (in netc) write to ddr",
> > +		"MetricName": "imx94_ddr_write.m33_1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x005@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of pcie2 read from ddr",
> > +		"MetricName": "imx94_ddr_read.pcie2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x006@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of pcie2 write to ddr",
> > +		"MetricName": "imx94_ddr_write.pcie2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x006@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of Cortex-A DSU L3 evicted/ACP transactions read from ddr",
> > +		"MetricName": "imx94_ddr_read.cortex_a_dsu",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x007@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of Cortex-A DSU L3 evicted/ACP transactions write to ddr",
> > +		"MetricName": "imx94_ddr_write.cortex_a_dsu",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x007@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m33 core0 read from ddr",
> > +		"MetricName": "imx94_ddr_read.m33_0",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x008@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m33 core0 write to ddr",
> > +		"MetricName": "imx94_ddr_write.m33_0",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x008@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m7 core0 read from ddr",
> > +		"MetricName": "imx94_ddr_read.m7_0",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x009@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of m7 core0 write to ddr",
> > +		"MetricName": "imx94_ddr_write.m7_0",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x009@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of sentinel read from ddr",
> > +		"MetricName": "imx94_ddr_read.sentinel",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x00a@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of sentinel write to ddr",
> > +		"MetricName": "imx94_ddr_write.sentinel",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00a@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of edma1 read from ddr",
> > +		"MetricName": "imx94_ddr_read.edma1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x00f\\,axi_id\\=0x00b@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of edma1 write to ddr",
> > +		"MetricName": "imx94_ddr_write.edma1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00b@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of edma2 read from ddr",
> > +		"MetricName": "imx94_ddr_read.edma2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x00c@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of edma2 write to ddr",
> > +		"MetricName": "imx94_ddr_write.edma2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00c@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of netc read from ddr",
> > +		"MetricName": "imx94_ddr_read.netc",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x00f\\,axi_id\\=0x00d@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of netc write to ddr",
> > +		"MetricName": "imx94_ddr_write.netc",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00d@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of aonmix read from ddr",
> > +		"MetricName": "imx94_ddr_read.aonmix",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x00f\\,axi_id\\=0x00f@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of aonmix write to ddr",
> > +		"MetricName": "imx94_ddr_write.aonmix",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x00f\\,axi_id\\=0x00f@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of npumix read from ddr",
> > +		"MetricName": "imx94_ddr_read.npumix",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x010@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of npumix write to ddr",
> > +		"MetricName": "imx94_ddr_write.npumix",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x010@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usdhc1 read from ddr",
> > +		"MetricName": "imx94_ddr_read.usdhc1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3f0\\,axi_id\\=0x0b0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usdhc1 write to ddr",
> > +		"MetricName": "imx94_ddr_write.usdhc1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0b0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usdhc2 read from ddr",
> > +		"MetricName": "imx94_ddr_read.usdhc2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3f0\\,axi_id\\=0x0c0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usdhc2 write to ddr",
> > +		"MetricName": "imx94_ddr_write.usdhc2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0c0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usdhc3 read from ddr",
> > +		"MetricName": "imx94_ddr_read.usdhc3",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x0d0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usdhc3 write to ddr",
> > +		"MetricName": "imx94_ddr_write.usdhc3",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0d0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of xspi read from ddr",
> > +		"MetricName": "imx94_ddr_read.xspi",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3f0\\,axi_id\\=0x0f0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of xspi write to ddr",
> > +		"MetricName": "imx94_ddr_write.xspi",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x0f0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of pcie1 read from ddr",
> > +		"MetricName": "imx94_ddr_read.pcie1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x100@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of pcie1 write to ddr",
> > +		"MetricName": "imx94_ddr_write.pcie1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x100@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usb1 read from ddr",
> > +		"MetricName": "imx94_ddr_read.usb1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3f0\\,axi_id\\=0x140@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usb1 write to ddr",
> > +		"MetricName": "imx94_ddr_write.usb1",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x140@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usb2 read from ddr",
> > +		"MetricName": "imx94_ddr_read.usb2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_mask\\=0x3f0\\,axi_id\\=0x150@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of usb2 write to ddr",
> > +		"MetricName": "imx94_ddr_write.usb2",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x150@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of pxp read from ddr",
> > +		"MetricName": "imx94_ddr_read.pxp",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_mask\\=0x3f0\\,axi_id\\=0x2a0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of pxp write to ddr",
> > +		"MetricName": "imx94_ddr_write.pxp",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x2a0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of dcif read from ddr",
> > +		"MetricName": "imx94_ddr_read.dcif",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_mask\\=0x3f0\\,axi_id\\=0x2b0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	},
> > +	{
> > +		"BriefDescription": "bytes of dcif write to ddr",
> > +		"MetricName": "imx94_ddr_write.dcif",
> > +		"MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_mask\\=0x3f0\\,axi_id\\=0x2b0@ ) * 32",
> > +		"ScaleUnit": "9.765625e-4KB",
> > +		"Unit": "imx9_ddr",
> > +		"Compat": "imx94"
> > +	}
> > +]
> > 
> > -- 
> > 2.34.1
> > 

