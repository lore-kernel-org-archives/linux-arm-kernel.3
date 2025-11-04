Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8E5CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jfT88xD0KOzcLyagDzpznKX6WWcQ4Tbie23BrW5FcA=; b=FTgTokjlvE34AuN9MRKRmftVqP
	S+pZJeWsDBrD69JCNViLY6NcHhq1oE0ieXyG2n5g6GPH0olhhpPoaCGOO2dhBFUJalCN0acE1yKVI
	vtIFM7oES7piIkB1N1MOjweF9t3SbmoOyxCdjoZAynn0w+Cot9N6QQ+9HRkux8UjQFJvvcyCLAc6T
	15hW1TTyk0/ZjPR8CVHXd/hhfqZLJerpkQmcP6oRVaBWv/JqICpTx2nJyNDqMRjHiw1Df24RQdAWW
	sZdDG+KNOwPWurueU3o6d8hHezGBrmsLVYdS7Z98OYxORpFlZByMSv9dAJxepcXh0oni9f4RAaJZR
	VAFnUKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGL1D-0000000CI71-0Mif;
	Tue, 04 Nov 2025 17:40:31 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGL1B-0000000CI6Z-1LMH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:40:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-27d67abd215so4595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 09:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762278028; x=1762882828; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jfT88xD0KOzcLyagDzpznKX6WWcQ4Tbie23BrW5FcA=;
        b=jI5FyfrYMJrFZxd07k7/cnyyqnQhFPDIqKVcSY3N+gj4jF6ErEecYqZitMPNX4tHkY
         D99HAcBKv3ElASw3LFRt0saBaiDP28Xf010dI1jIH/mArPSkkZ28R29km4lX+U+94mUK
         BF/87X+FclFsQ1kZH3kVUMzMK4U9E7ZRRLQa/Y1YUejbwc9/ludOVUZz4viCL355NHZH
         5JnzaerEcc5lIBnQXbz6jXCCch8r0y3zXQBc0Ak0NSruduVC1ZVFxyqZjUqlcXE00mDi
         pXUHwE4VXfGmz7Dgt1/dBjB0EnLwdsJCw3Se04qZeONHI1eHvaGqw/sGKQJC92Uq+1eJ
         NjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762278028; x=1762882828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jfT88xD0KOzcLyagDzpznKX6WWcQ4Tbie23BrW5FcA=;
        b=n3SNH8J5g2YKSHB+sAyx3Z72fKelz7tCn5ZERdl6/7SSYMoT67RMy55738wcdBFkV9
         ired4G3/S6zPJAazlz8GbRcl3BZkYu1byauEaEtO2xognUh/HrsiG3bQh+wa1bVYrWSd
         ioxQs1fd/TdkgsJ2YhtlAj0lIBLhfgwPMEJhRe6yTE+gU7AAhkhLrZrPdRb/tKOPNW0r
         S1Z7NM79Z76D9/zdmV0XFwUdQ7lFxZf6+nn3JR/Lcz/tFYIufwXubSJpuB+CVabrktaP
         FsRK/N1/hQHUuY9CZ7BPg/VmTIt2J+R+dqzUHhHuGSJGMF2xJR7pA2zsKXcrU50xX0MU
         E8vw==
X-Forwarded-Encrypted: i=1; AJvYcCVmbExgZt9dDUi9/k0/+7v1/DU29ISTjj9RC3nIj7ssLuPZyDn90LZclbmp9MOYjo3EHZuGDD5hYuazz4H5HtPa@lists.infradead.org
X-Gm-Message-State: AOJu0YyOnq80uI4oXtOdHZmP67lW7SMD2AoFnG+fzuojdG0U/qhdyRel
	/sBn4+cjAualFbb83qfJes3nZP+8c3XlSdbgvtSGKfzoJGIMJMoZrodQAEQnSmPP6xo2m+HVDl5
	/n+etf8N1s7SFN16DZtEyHqRi9WkgMni/sWa+vPdO
X-Gm-Gg: ASbGncs7FczAnGKnHWP5rcuylvVb5+c1lESUbnPOMXZglAiJhsRNpCjh0zDeBP0rnRH
	tvM5B8cRyO7WrVowYV7KtiPH7pUJvtYCm8g9P63AF38rrilyz9+4t/6LzRexGJbTfEwD5JjCUsX
	C4niOGJ+UBpbSihR3jX1hJmxhw0znCwcLY1WAig9FxoMq8DGD4/66fre5Q8KJjyKdiq1A9WG77i
	9WSSvVZ9+CsPZ7Yo/czFLlp+HiFwVMHxowLEfzBDO44f3Nh869/8G1+ZggmoFLnFabBZRxhHbxA
	QVYKE4cv07kSdaQ=
X-Google-Smtp-Source: AGHT+IFtI0ANt6r/2+hZEYdPo9MIQ3FgcReJoH72fieCO+sc5XMcyfjciKQKi955Fim4SjjM2xy1Dd4lSJ7bJl+AH0k=
X-Received: by 2002:a17:902:e888:b0:26a:befc:e7e1 with SMTP id
 d9443c01a7336-295fdaee3aemr6120715ad.12.1762278027330; Tue, 04 Nov 2025
 09:40:27 -0800 (PST)
MIME-Version: 1.0
References: <20250821-imx94-ddr-pmu-v2-0-052c6420605d@nxp.com> <20250821-imx94-ddr-pmu-v2-3-052c6420605d@nxp.com>
In-Reply-To: <20250821-imx94-ddr-pmu-v2-3-052c6420605d@nxp.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Nov 2025 09:40:15 -0800
X-Gm-Features: AWmQ_bmwvZDCteGTl9ZAIX7nqQG3lPWAF4Bp-vTXqzNi5uHkHP-MkyAZWUz5qN8
Message-ID: <CAP-5=fUd24kWOG7=8DpmiaMXkwdf9=BOzmoTrjn9b5Da0ZfP3g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] perf vendor events arm64:: Add i.MX94 DDR
 Performance Monitor metrics
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.li@nxp.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	John Garry <john.g.garry@oracle.com>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_094029_416105_A98C954A 
X-CRM114-Status: GOOD (  19.33  )
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

On Thu, Aug 21, 2025 at 4:02=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Add JSON metrics for i.MX94 DDR Performance Monitor.
>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Ian Rogers <irogers@google.com>

> ---
> Changes in v2:
>  - add Rb tag
> ---
>  .../arch/arm64/freescale/imx94/sys/ddrc.json       |   9 +
>  .../arch/arm64/freescale/imx94/sys/metrics.json    | 450 +++++++++++++++=
++++++
>  2 files changed, 459 insertions(+)
>
> diff --git a/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.js=
on b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json
> new file mode 100644
> index 0000000000000000000000000000000000000000..aa7b58721dc7e23dc9d9905a7=
9e0c1778b7bbf11
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/ddrc.json
> @@ -0,0 +1,9 @@
> +[
> +   {
> +           "BriefDescription": "ddr cycles event",
> +           "EventCode": "0x00",
> +           "EventName": "imx94_ddr.cycles",
> +           "Unit": "imx9_ddr",
> +           "Compat": "imx94"
> +   }
> +]
> diff --git a/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics=
.json b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json
> new file mode 100644
> index 0000000000000000000000000000000000000000..629f1f52761e2210ef43a9cbb=
a175871817e1230
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/freescale/imx94/sys/metrics.json
> @@ -0,0 +1,450 @@
> +[
> +       {
> +               "BriefDescription": "bandwidth usage for lpddr5 evk board=
",
> +               "MetricName": "imx94_bandwidth_usage.lpddr5",
> +               "MetricExpr": "(( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi=
_mask\\=3D0x000\\,axi_id\\=3D0x000@ + imx9_ddr0@eddrtq_pm_wr_beat_filt\\,ax=
i_mask\\=3D0x000\\,axi_id\\=3D0x000@ ) * 32 / duration_time) / (4266 * 1000=
000 * 4)",

nit: It is possible to have metrics use other metrics, this may read
better as (although I can't recall if the '.' needs escaping - I'm not
sure if the 4266 is significant):

((imx94_ddr_read.all + imx94_ddr_write.all) / duration_time)  / 17064e6

> +               "ScaleUnit": "1e2%",

nit: I think this would read more easily as "100%"

Thanks,
Ian

> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bandwidth usage for lpddr4 evk board=
",
> +               "MetricName": "imx94_bandwidth_usage.lpddr4",
> +               "MetricExpr": "(( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi=
_mask\\=3D0x000\\,axi_id\\=3D0x000@ + imx9_ddr0@eddrtq_pm_wr_beat_filt\\,ax=
i_mask\\=3D0x000\\,axi_id\\=3D0x000@ ) * 32 / duration_time) / (4266 * 1000=
000 * 4)",
> +               "ScaleUnit": "1e2%",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of all masters read from ddr",
> +               "MetricName": "imx94_ddr_read.all",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x000\\,axi_id\\=3D0x000@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of all masters write to ddr",
> +               "MetricName": "imx94_ddr_write.all",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x000\\,axi_id\\=3D0x000@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of all a55 read from ddr",
> +               "MetricName": "imx94_ddr_read.a55_all",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x3fc\\,axi_id\\=3D0x000@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of all a55 write from ddr",
> +               "MetricName": "imx94_ddr_write.a55_all",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3fc\\,axi_id\\=3D0x000@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 0 read from ddr",
> +               "MetricName": "imx94_ddr_read.a55_0",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x3ff\\,axi_id\\=3D0x000@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 0 write to ddr",
> +               "MetricName": "imx94_ddr_write.a55_0",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3ff\\,axi_id\\=3D0x000@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 1 read from ddr",
> +               "MetricName": "imx94_ddr_read.a55_1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x001@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 1 write to ddr",
> +               "MetricName": "imx94_ddr_write.a55_1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x001@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 2 read from ddr",
> +               "MetricName": "imx94_ddr_read.a55_2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x002@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 2 write to ddr",
> +               "MetricName": "imx94_ddr_write.a55_2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x002@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 3 read from ddr",
> +               "MetricName": "imx94_ddr_read.a55_3",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x003@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of a55 core 3 write to ddr",
> +               "MetricName": "imx94_ddr_write.a55_3",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x003@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m7 core1 read from ddr",
> +               "MetricName": "imx94_ddr_read.m7_1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x004@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m7 core1 write to ddr",
> +               "MetricName": "imx94_ddr_write.m7_1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x004@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m33 core1 (in netc) read fr=
om ddr",
> +               "MetricName": "imx94_ddr_read.m33_1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x005@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m33 core1 (in netc) write t=
o ddr",
> +               "MetricName": "imx94_ddr_write.m33_1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x005@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of pcie2 read from ddr",
> +               "MetricName": "imx94_ddr_read.pcie2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x006@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of pcie2 write to ddr",
> +               "MetricName": "imx94_ddr_write.pcie2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x006@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of Cortex-A DSU L3 evicted/ACP=
 transactions read from ddr",
> +               "MetricName": "imx94_ddr_read.cortex_a_dsu",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x007@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of Cortex-A DSU L3 evicted/ACP=
 transactions write to ddr",
> +               "MetricName": "imx94_ddr_write.cortex_a_dsu",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x007@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m33 core0 read from ddr",
> +               "MetricName": "imx94_ddr_read.m33_0",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x008@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m33 core0 write to ddr",
> +               "MetricName": "imx94_ddr_write.m33_0",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x008@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m7 core0 read from ddr",
> +               "MetricName": "imx94_ddr_read.m7_0",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x009@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of m7 core0 write to ddr",
> +               "MetricName": "imx94_ddr_write.m7_0",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x009@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of sentinel read from ddr",
> +               "MetricName": "imx94_ddr_read.sentinel",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x00a@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of sentinel write to ddr",
> +               "MetricName": "imx94_ddr_write.sentinel",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x00a@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of edma1 read from ddr",
> +               "MetricName": "imx94_ddr_read.edma1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x00b@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of edma1 write to ddr",
> +               "MetricName": "imx94_ddr_write.edma1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x00b@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of edma2 read from ddr",
> +               "MetricName": "imx94_ddr_read.edma2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x00c@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of edma2 write to ddr",
> +               "MetricName": "imx94_ddr_write.edma2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x00c@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of netc read from ddr",
> +               "MetricName": "imx94_ddr_read.netc",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x00d@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of netc write to ddr",
> +               "MetricName": "imx94_ddr_write.netc",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x00d@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of aonmix read from ddr",
> +               "MetricName": "imx94_ddr_read.aonmix",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x00f\\,axi_id\\=3D0x00f@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of aonmix write to ddr",
> +               "MetricName": "imx94_ddr_write.aonmix",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x00f\\,axi_id\\=3D0x00f@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of npumix read from ddr",
> +               "MetricName": "imx94_ddr_read.npumix",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x010@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of npumix write to ddr",
> +               "MetricName": "imx94_ddr_write.npumix",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x010@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usdhc1 read from ddr",
> +               "MetricName": "imx94_ddr_read.usdhc1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x0b0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usdhc1 write to ddr",
> +               "MetricName": "imx94_ddr_write.usdhc1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x0b0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usdhc2 read from ddr",
> +               "MetricName": "imx94_ddr_read.usdhc2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x0c0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usdhc2 write to ddr",
> +               "MetricName": "imx94_ddr_write.usdhc2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x0c0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usdhc3 read from ddr",
> +               "MetricName": "imx94_ddr_read.usdhc3",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x0d0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usdhc3 write to ddr",
> +               "MetricName": "imx94_ddr_write.usdhc3",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x0d0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of xspi read from ddr",
> +               "MetricName": "imx94_ddr_read.xspi",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x0f0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of xspi write to ddr",
> +               "MetricName": "imx94_ddr_write.xspi",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x0f0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of pcie1 read from ddr",
> +               "MetricName": "imx94_ddr_read.pcie1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x100@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of pcie1 write to ddr",
> +               "MetricName": "imx94_ddr_write.pcie1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x100@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usb1 read from ddr",
> +               "MetricName": "imx94_ddr_read.usb1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x140@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usb1 write to ddr",
> +               "MetricName": "imx94_ddr_write.usb1",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x140@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usb2 read from ddr",
> +               "MetricName": "imx94_ddr_read.usb2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt2\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x150@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of usb2 write to ddr",
> +               "MetricName": "imx94_ddr_write.usb2",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x150@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of pxp read from ddr",
> +               "MetricName": "imx94_ddr_read.pxp",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt0\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x2a0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of pxp write to ddr",
> +               "MetricName": "imx94_ddr_write.pxp",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x2a0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of dcif read from ddr",
> +               "MetricName": "imx94_ddr_read.dcif",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_rd_beat_filt1\\,axi_=
mask\\=3D0x3f0\\,axi_id\\=3D0x2b0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       },
> +       {
> +               "BriefDescription": "bytes of dcif write to ddr",
> +               "MetricName": "imx94_ddr_write.dcif",
> +               "MetricExpr": "( imx9_ddr0@eddrtq_pm_wr_beat_filt\\,axi_m=
ask\\=3D0x3f0\\,axi_id\\=3D0x2b0@ ) * 32",
> +               "ScaleUnit": "9.765625e-4KB",
> +               "Unit": "imx9_ddr",
> +               "Compat": "imx94"
> +       }
> +]
>
> --
> 2.34.1
>

