Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F88BC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 11:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wenl9bkmJ89Thwbl4p9pf1LrAS6uzvKUZ3dP6ZkG59Y=; b=Gxenm2ZxiGI3uvHndU2U2sZTNn
	YqaVwIf0Zh2sHUZ6R8iImqTmvLk2dybrO1bYvzp0cMfO7AE1x1+/oJLC6OeAoGI/oevBfeXAEKxTb
	pkDaIUvHQ7DSGCi4615eA7KPJ36Srxkr9rcWrYfdTgjJVqJ0optZnp2QMJ5g5G8BYKk5Vx8KwDi55
	jUPT857ry15tclZgNwQX6pHZhtM7TF5Iv4uJ3hwheum9FOUYYCubM9wjT5ZYAVnKrYxxkQ1ehmzD+
	KeZgi2WZPBWS02BzVdfYbjI3l06+qmxYtkFZvm/74ou6VR9f0AWG+tPEEGYPi/XxcCsgOzlLKrZxd
	sz/9rUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufGd6-00000009ijw-0IbB;
	Fri, 25 Jul 2025 11:30:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG6q-00000009eCd-42Mm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:57:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bpPpz1MQQz6HJRn;
	Fri, 25 Jul 2025 18:52:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A06C61400DC;
	Fri, 25 Jul 2025 18:56:57 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 25 Jul
 2025 12:56:56 +0200
Date: Fri, 25 Jul 2025 11:56:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, "Gatien
 Chevallier" <gatien.chevallier@foss.st.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Gabriel
 Fernandez" <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, Julius Werner
	<jwerner@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 12/19] perf: stm32: introduce DDRPERFM driver
Message-ID: <20250725115655.00002304@huawei.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
	<20250722-ddrperfm-upstream-v3-12-7b7a4f3dc8a0@foss.st.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_035705_289522_8D18204A 
X-CRM114-Status: GOOD (  33.07  )
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

On Tue, 22 Jul 2025 16:03:29 +0200
Cl=E9ment Le Goffic <clement.legoffic@foss.st.com> wrote:

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
Hi Cl=E9ment,

Minor comments inline.,

Thanks,

Jonathan

> --- /dev/null
> +++ b/drivers/perf/stm32_ddr_pmu.c
> @@ -0,0 +1,896 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
> + * Author: Cl=E9ment Le Goffic <clement.legoffic@foss.st.com> for STMicr=
oelectronics.
> + */
> +
> +#include <linux/bus/stm32_firewall_device.h>
> +#include <linux/clk.h>
> +#include <linux/hrtimer.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
Why? =20
Looks like of.h is needed so you should include that directly.

Check all your headers.  mod_devicetable.h should be here
for instance.

> +#include <linux/perf_event.h>
> +#include <linux/reset.h>

> +
> +static void stm32_ddr_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	struct stm32_ddr_pmu *pmu =3D to_stm32_ddr_pmu(event->pmu);
> +	struct stm32_ddr_cnt *counter =3D event->pmu_private;
> +	bool events =3D true;
> +
> +	stm32_ddr_pmu_event_stop(event, PERF_EF_UPDATE);
> +
> +	stm32_ddr_pmu_free_counter(pmu, counter);
> +
> +	for (int i =3D 0; i < pmu->cfg->counters_nb; i++)
> +		events =3D !list_empty(&pmu->counters[i]);
What is this trying to do?  It seems to be only setting
	events =3D !list_empty(&pmu->counters[pmu->cfg_counters_nb - 1]);

If so just check that but my guess it you care if there is anything
in any of them lists.

> +
> +	/* If there is activity nothing to do */
> +	if (events)
> +		return;
> +
> +	hrtimer_cancel(&pmu->hrtimer);
> +	stm32_ddr_stop_counters(pmu);
> +
> +	pmu->selected_set =3D -1;
> +
> +	clk_disable(pmu->clk);
> +}


> +static int stm32_ddr_pmu_get_memory_type(struct stm32_ddr_pmu *pmu)
> +{
> +	struct platform_device *pdev =3D to_platform_device(pmu->dev);
> +	struct device_node *memchan;
> +
> +	memchan =3D of_parse_phandle(pdev->dev.of_node, "memory-channel", 0);
> +	if (!memchan)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "Missing device-tree property 'memory-channel'\n");
> +
> +	if (of_device_is_compatible(memchan, "jedec,lpddr4-channel"))

Random thought, feel free to ignore.
I wonder if it's worth using an of_device_id match table here?


> +		pmu->dram_type =3D STM32_DDR_PMU_LPDDR4;
> +	else if (of_device_is_compatible(memchan, "jedec,lpddr3-channel"))
> +		pmu->dram_type =3D STM32_DDR_PMU_LPDDR3;
> +	else if (of_device_is_compatible(memchan, "jedec,ddr4-channel"))
> +		pmu->dram_type =3D STM32_DDR_PMU_DDR4;
> +	else if (of_device_is_compatible(memchan, "jedec,ddr3-channel"))
> +		pmu->dram_type =3D STM32_DDR_PMU_DDR3;
> +	else
> +		return dev_err_probe(&pdev->dev, -EINVAL, "Unsupported memory channel =
type\n");
> +
> +	if (pmu->dram_type =3D=3D STM32_DDR_PMU_LPDDR3)
> +		dev_warn(&pdev->dev,
> +			 "LPDDR3 supported by DDRPERFM but not supported by DDRCTRL/DDRPHY\n"=
);
> +
> +	return 0;
> +}

> +static struct attribute *stm32_ddr_pmu_events_attrs_mp[] =3D {
> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_rd, PERF_OP_IS_RD),
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
> +	NULL,

No trailing comma for a terminating entry like this.  You got the other cas=
es
so I guess this one just got missed.

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
> +	if (!pmu)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, pmu);
> +	pmu->dev =3D &pdev->dev;
> +
> +	pmu->cfg =3D device_get_match_data(pmu->dev);
> +
> +	pmu->membase =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(pmu->membase))
> +		return PTR_ERR(pmu->membase);
> +
> +	if (of_property_present(pmu->dev->of_node, "access-controllers")) {
> +		ret =3D stm32_firewall_get_firewall(pmu->dev->of_node, &firewall, 1);

Jiri is busy driving dev_fwnode() thorugh to get rid of all the directly re=
ferences
to of_node.  Probably better to use that here from the start.


> +		if (ret)
> +			return dev_err_probe(pmu->dev, ret, "Failed to get firewall\n");
> +		ret =3D stm32_firewall_grant_access_by_id(&firewall, firewall.firewall=
_id);
> +		if (ret)
> +			return dev_err_probe(pmu->dev, ret, "Failed to grant access\n");
> +	}
> +
> +	pmu->clk =3D devm_clk_get_optional_enabled(pmu->dev, NULL);
> +	if (IS_ERR(pmu->clk))
> +		return dev_err_probe(pmu->dev, PTR_ERR(pmu->clk), "Failed to get prepa=
re clock\n");

Comment doesn't match code. This is going to enabled, not just prepared.

> +
> +	rst =3D devm_reset_control_get_optional_exclusive(pmu->dev, NULL);
> +	if (IS_ERR(rst))
> +		return dev_err_probe(pmu->dev, PTR_ERR(rst), "Failed to get reset\n");

> +}



