Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21180CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 09:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BczC8+Ico00o88w4h1AHt9D9Nm4mbj8KeQgy8FmGBlw=; b=xGJ2M2DZukCawRMkTIsLnTZgOl
	6/avyb0MvcJQhs8HA1qQYtH/HJL7lWgUvKMCPw+OQbt2f/340lF6B031bdEj2Kdp+cIkjsNPEmras
	LEWUq1RZXFbmSFZ8ceC1VRH9NJ2QptrMTzzT/7jzBxk98PAYoktbBymLanOuXYAR9nClmdzoWZyw2
	GUR7Qzg8iOlRhv6k4Pbb0NG9ogAgLnPoJe0nVwG0iT1hOBEhL/VfViTlLrTj6sp5UfVbksXUFF0Ib
	Iv1CMPN2wZ4JS+CVrK/rQu7kx6t/3cv6eNTWtrkNNTTXR2NBN1qP3TSWAlPiDkGab9E23lKonbXbJ
	xDttq45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwH6C-0000000DD6X-1IJf;
	Wed, 10 Sep 2025 09:26:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwH68-0000000DD41-0YqX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 09:26:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cMFf600s8z6L5R0;
	Wed, 10 Sep 2025 17:25:18 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1377E1404C4;
	Wed, 10 Sep 2025 17:26:30 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 10 Sep
 2025 11:26:29 +0200
Date: Wed, 10 Sep 2025 10:26:27 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>
CC: Gatien Chevallier <gatien.chevallier@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Julius Werner <jwerner@chromium.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Jonathan Corbet" <corbet@lwn.net>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	=?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v6 13/20] perf: stm32: introduce DDRPERFM driver
Message-ID: <20250910102627.00007a40@huawei.com>
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-13-ce082cc801b5@gmail.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
	<20250909-b4-ddrperfm-upstream-v6-13-ce082cc801b5@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_022640_477847_33F215CD 
X-CRM114-Status: GOOD (  40.75  )
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

On Tue, 09 Sep 2025 12:12:20 +0200
Cl=E9ment Le Goffic <legoffic.clement@gmail.com> wrote:

> From: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
>=20
> Introduce the driver for the DDR Performance Monitor available on
> STM32MPU SoC.
>=20
> On STM32MP2 platforms, the DDRPERFM allows to monitor up to 8 DDR events
> that come from the DDR Controller such as read or write events.
>=20
> On STM32MP1 platforms, the DDRPERFM cannot monitor any event on any
> counter, there is a notion of set of events.
> Events from different sets cannot be monitored at the same time.
> The first chosen event selects the set.
> The set is coded in the first two bytes of the config value which is on 4
> bytes.
>=20
> On STM32MP25x series, the DDRPERFM clock is shared with the DDR controller
> and may be secured by bootloaders.
> Access controllers allow to check access to a resource. Use the access
> controller defined in the devicetree to know about the access to the
> DDRPERFM clock.
>=20
> Signed-off-by: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=E9ment Le Goffic <legoffic.clement@gmail.com>
Hi Cl=E9ment

A quick drive by review,

J

> diff --git a/drivers/perf/stm32_ddr_pmu.c b/drivers/perf/stm32_ddr_pmu.c
> new file mode 100644
> index 000000000000..38328663d2c5
> --- /dev/null
> +++ b/drivers/perf/stm32_ddr_pmu.c
> @@ -0,0 +1,897 @@

> +
> +#define MP1_CLR_CNT		GENMASK(3, 0)
> +#define MP1_CLR_TIME		BIT(31)
> +#define MP2_CLR_CNT		GENMASK(7, 0)
> +#define MP2_CLR_TIME		BIT(8)
> +
> +/* 4 event counters plus 1 dedicated to time */
> +#define MP1_CNT_NB		(4 + 1)

This is never used so I would drop it and rename the MP2_CNT_NB
to indicate it is the max value for any devices supported.


> +/* Index of the time dedicated counter */
> +#define MP1_TIME_CNT_IDX	4
> +
> +/* 8 event counters plus 1 dedicated to time */
> +#define MP2_CNT_NB		(8 + 1)
...

> +struct stm32_ddr_pmu {
> +	struct pmu pmu;
> +	void __iomem *membase;
> +	struct device *dev;
> +	struct clk *clk;
> +	const struct stm32_ddr_pmu_cfg *cfg;
> +	struct hrtimer hrtimer;
> +	ktime_t poll_period;
> +	int selected_set;
> +	u32 dram_type;
> +	struct list_head counters[];
The absence of a __counted_by() marking made me wonder how
we ensured that this wasn't overrun.  I see below that's because
size is always the same.  So
	struct list_head counters[MP2_CNT_NB];
If you do want to make it dynamic then that is fine but added
a local variable for the size and the __counted_by() marking so
the various analysis tools can check for buffer overruns.

> +};



> +static void stm32_ddr_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	struct stm32_ddr_pmu *pmu =3D to_stm32_ddr_pmu(event->pmu);
> +	struct stm32_ddr_cnt *counter =3D event->pmu_private;
> +	bool events =3D true;

Always set before use, so don't set it here.  I'd move this into the
scope of the for loop to make this more obvious.

> +
> +	stm32_ddr_pmu_event_stop(event, PERF_EF_UPDATE);
> +
> +	stm32_ddr_pmu_free_counter(pmu, counter);
> +
> +	for (int i =3D 0; i < pmu->cfg->counters_nb; i++) {
> +		events =3D !list_empty(&pmu->counters[i]);
> +		if (events) /* If there is activity nothing to do */
> +			return;
> +	}
> +
> +	hrtimer_cancel(&pmu->hrtimer);
> +	stm32_ddr_stop_counters(pmu);
> +
> +	pmu->selected_set =3D -1;
> +
> +	clk_disable(pmu->clk);
> +}

> +
> +#define STM32_DDR_PMU_EVENT_ATTR(_name, _id)			\
> +	PMU_EVENT_ATTR_ID(_name, stm32_ddr_pmu_sysfs_show, _id)
> +
> +static struct attribute *stm32_ddr_pmu_events_attrs_mp[] =3D {
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_rd, PERF_OP_IS_RD),

Prefixing perf events with perf_ seems unnecessary.

I guess perf_op_is_rd is counting all reads?  Is so why not call it simply =
'reads'
or something else short like that?  If it's cycles when a read is going on =
then
maybe a more complex is needed, but perf_op_is_rd doesn't convey that to me.

> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_wr, PERF_OP_IS_WR),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_activate, PERF_OP_IS_ACTIVATE),
> +	STM32_DDR_PMU_EVENT_ATTR(ctl_idle, CTL_IDLE),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_hpr_req_with_no_credit, PERF_HPR_REQ_WITH=
_NO_CREDIT),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_lpr_req_with_no_credit, PERF_LPR_REQ_WITH=
_NO_CREDIT),
> +	STM32_DDR_PMU_EVENT_ATTR(cactive_ddrc, CACTIVE_DDRC),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_enter_powerdown, PERF_OP_IS_ENTER_P=
OWERDOWN),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_refresh, PERF_OP_IS_REFRESH),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_selfresh_mode, PERF_SELFRESH_MODE),
> +	STM32_DDR_PMU_EVENT_ATTR(dfi_lp_req, DFI_LP_REQ),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_hpr_xact_when_critical, PERF_HPR_XACT_WHE=
N_CRITICAL),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_lpr_xact_when_critical, PERF_LPR_XACT_WHE=
N_CRITICAL),
> +	STM32_DDR_PMU_EVENT_ATTR(perf_wr_xact_when_critical, PERF_WR_XACT_WHEN_=
CRITICAL),
> +	STM32_DDR_PMU_EVENT_ATTR(dfi_lp_req_cpy, DFI_LP_REQ),  /* Suffixed '_cp=
y' to allow the
> +								* choice between sets 2 and 3
> +								*/
> +	STM32_DDR_PMU_EVENT_ATTR(time_cnt, TIME_CNT),
> +	NULL
> +};


> +static int stm32_ddr_pmu_device_probe(struct platform_device *pdev)
> +{
> +	struct stm32_firewall firewall;
> +	struct stm32_ddr_pmu *pmu;
> +	struct reset_control *rst;
> +	struct resource *res;
> +	int ret;
> +
> +	pmu =3D devm_kzalloc(&pdev->dev, struct_size(pmu, counters, MP2_CNT_NB)=
, GFP_KERNEL);

If using a fixed number of counters why not put it in the struct
definition and simplify the code?  I agree it is probably not
worth making this dynamic given small sizes but I don't mind
if you do want to do this.  The only thing that isn't a good idea
is this dynamic, but not really, current situation.


> +	if (!pmu)
> +		return -ENOMEM;



> +static DEFINE_SIMPLE_DEV_PM_OPS(stm32_ddr_pmu_pm_ops, NULL, stm32_ddr_pm=
u_device_resume);
> +
> +static const struct of_device_id stm32_ddr_pmu_of_match[] =3D {
> +	{
> +		.compatible =3D "st,stm32mp131-ddr-pmu",
> +		.data =3D &stm32_ddr_pmu_cfg_mp1

Trivial but if you are spinning again, normal convention is trailing commas
in cases like this because maybe other fields will get set later.

> +	},
> +	{
> +		.compatible =3D "st,stm32mp251-ddr-pmu",
> +		.data =3D &stm32_ddr_pmu_cfg_mp2
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, stm32_ddr_pmu_of_match);
> +
> +static struct platform_driver stm32_ddr_pmu_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.pm =3D pm_sleep_ptr(&stm32_ddr_pmu_pm_ops),
> +		.of_match_table =3D stm32_ddr_pmu_of_match,
> +	},
> +	.probe =3D stm32_ddr_pmu_device_probe,
> +	.remove =3D stm32_ddr_pmu_device_remove,
> +};
> +
> +module_platform_driver(stm32_ddr_pmu_driver);
> +
> +MODULE_AUTHOR("Cl=E9ment Le Goffic");
> +MODULE_DESCRIPTION("STMicroelectronics STM32 DDR performance monitor dri=
ver");
> +MODULE_LICENSE("GPL");
>=20


