Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6574AC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+TVNlmwLo5DFQXSKMd0595gZhidubjKDsk4gS7IkUE=; b=aXEhy527uX0PEIpUDOLl0xWA4O
	BzBz5tJfWj4XoJmmwO8WzbH20zNnnEqDAf5pCK1GO38oxs1YDqyMf/x4x/GdMkz+EDFqned9tO615
	/W9dUQQ8WvaBCauYKWBsKKoMZDmwF289ojV6V3uRKt1MKY3dbhjIK8nrC/HiKNyjIotot523JowEE
	u3Khszt/70PHUTFuiAjjjGksoIJ+jAAE5vPKXZmBou5YnRAO4ejSfQejmlB/LwzURpCSNda1+CHKS
	NM3pypkvy06nEyEHZe3QHAVBVPQd4+UyeK72a3yp55LPgb6C4rtXCoYGXaNPHV3BSjRfJ+bEKs8nO
	skD/h47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA9F-00000007LdB-11YA;
	Tue, 21 Jan 2025 09:02:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taA7x-00000007LSM-0yR2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 09:00:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F0E65C56FF;
	Tue, 21 Jan 2025 09:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2ECC4CEDF;
	Tue, 21 Jan 2025 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737450052;
	bh=vFNoBZ+nI5T4qVwrUslpx8ALifj8Vv/ubexULfrSCjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlbgFgPwb8HYu2JbNrOg38Y0v91/KxpL5P5hBNQe0BjeZs+s3abzX6Kxtah4qD/e1
	 ROy6PcpdCvI1cjjcRRAXeOHAZIDdtcSs3ucyHYoRrx9SX+d/2qtkoyoc057c7R+kjv
	 vdXQABuPkmnGDnn25izHoWOwLrgBL7a0zGSbhONwhwxtSr8TVPpVJUivaExs9tmr76
	 cBGHDKAzQL3khAvvRNNsdst4mz1KA0lL/RX5wGzer6ITHjlIIkgr9Uj3gSMq8kGedR
	 gEgSmskZUR+Si96fbkMpTaJbRqGFIB2TL6N7ZYvuoZiH28C7uAwyhmSYK6WplP85cD
	 8Kff8JAyx0PYA==
Date: Tue, 21 Jan 2025 10:00:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] coresight: Add remote etm support
Message-ID: <20250121-honored-turkey-from-sirius-ad2caf@krzk-bin>
References: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
 <20250121063900.3211-3-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121063900.3211-3-quic_jinlmao@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_010053_395859_23FFE591 
X-CRM114-Status: GOOD (  28.21  )
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

On Tue, Jan 21, 2025 at 02:39:00PM +0800, Mao Jinlong wrote:
> The system on chip (SoC) consists of main APSS(Applications
> processor subsytem) and additional processors like modem, lpass.
> Coresight remote etm(Embedded Trace Macrocell) driver is for
> enabling and disabling the etm trace of remote processors. It
> uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from
> remote etm source to TMC sinks.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig           |  13 +
>  drivers/hwtracing/coresight/Makefile          |   1 +
>  drivers/hwtracing/coresight/coresight-qmi.h   |  89 +++++
>  .../coresight/coresight-remote-etm.c          | 316 ++++++++++++++++++
>  4 files changed, 419 insertions(+)
>  create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169..871dd83649ea 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
>  
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called coresight-dummy.
> +
> +config CORESIGHT_REMOTE_ETM
> +	tristate "Remote processor ETM trace support"
> +	depends on QCOM_QMI_HELPERS
> +	help
> +	  Enables support for ETM trace collection on remote processor using
> +	  CoreSight framework. Enabling this will allow turning on ETM
> +	  tracing on remote processor via sysfs by configuring the required
> +	  CoreSight components.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called coresight-remote-etm.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..e0781d729eb3 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>  		   coresight-cti-sysfs.o
>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> +obj-$(CONFIG_CORESIGHT_REMOTE_ETM) += coresight-remote-etm.o
> diff --git a/drivers/hwtracing/coresight/coresight-qmi.h b/drivers/hwtracing/coresight/coresight-qmi.h
> new file mode 100644
> index 000000000000..c9b49500d11c
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-qmi.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_QMI_H
> +#define _CORESIGHT_QMI_H
> +
> +#include <linux/soc/qcom/qmi.h>
> +
> +#define CORESIGHT_QMI_SVC_ID			(0x33)
> +#define CORESIGHT_QMI_VERSION			(1)
> +
> +#define CORESIGHT_QMI_GET_ETM_REQ_V01		(0x002B)
> +#define CORESIGHT_QMI_GET_ETM_RESP_V01		(0x002B)
> +#define CORESIGHT_QMI_SET_ETM_REQ_V01		(0x002C)
> +#define CORESIGHT_QMI_SET_ETM_RESP_V01		(0x002C)
> +
> +#define CORESIGHT_QMI_GET_ETM_REQ_MAX_LEN	(0)
> +#define CORESIGHT_QMI_GET_ETM_RESP_MAX_LEN	(14)
> +#define CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN	(7)
> +#define CORESIGHT_QMI_SET_ETM_RESP_MAX_LEN	(7)
> +
> +#define TIMEOUT_MS				(10000)
> +
> +enum coresight_etm_state_enum_type_v01 {
> +	/* To force a 32 bit signed enum. Do not change or use */
> +	CORESIGHT_ETM_STATE_ENUM_TYPE_MIN_ENUM_VAL_V01 = INT_MIN,
> +	CORESIGHT_ETM_STATE_DISABLED_V01 = 0,
> +	CORESIGHT_ETM_STATE_ENABLED_V01 = 1,
> +	CORESIGHT_ETM_STATE_ENUM_TYPE_MAX_ENUM_VAL_01 = INT_MAX,
> +};
> +
> +struct coresight_set_etm_req_msg_v01 {
> +	/* Mandatory */
> +	/* ETM output state */
> +	enum coresight_etm_state_enum_type_v01 state;
> +};
> +
> +struct coresight_set_etm_resp_msg_v01 {
> +	/* Mandatory */
> +	struct qmi_response_type_v01 resp;
> +};
> +
> +static struct qmi_elem_info coresight_set_etm_req_msg_v01_ei[] = {

Why, unlike every other instance, this cannot be const?

Anyway, you cannot have DATA in the header. This makes little sense.
There is no such patterns so I don't understand from where did you get
this.

...

> +	{
> +		.data_type = QMI_UNSIGNED_4_BYTE,
> +		.elem_len  = 1,
> +		.elem_size = sizeof(enum coresight_etm_state_enum_type_v01),
> +		.array_type  = NO_ARRAY,
> +		.tlv_type  = 0x01,
> +		.offset    = offsetof(struct coresight_set_etm_req_msg_v01,
> +				      state),
> +		.ei_array  = NULL,
> +	},

> +static int remote_etm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct remote_etm_drvdata *drvdata;
> +	struct coresight_desc desc = {0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&remote_etm_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	pdev->dev.platform_data = pdata;
> +
> +	pm_runtime_enable(dev);
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &pdev->dev;

Use the cached value, if you cache it.

 = dev

> +	platform_set_drvdata(pdev, drvdata);
> +
> +	drvdata->qmi_id = (u32)(unsigned long)of_device_get_match_data(&pdev->dev);

Ditto, everywhere...

> +
> +	mutex_init(&drvdata->mutex);
> +
> +	ret = qmi_handle_init(&drvdata->handle,
> +			CORESIGHT_QMI_SET_ETM_REQ_MAX_LEN,
> +			&server_ops, NULL);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Remote ETM client init failed.\n");

Syntax is always: return dev_err_probe. I am pretty sure you got this
feedback before.

Best regards,
Krzysztof


