Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86576E7719F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVtNiN/5nBBT9gWYseRrzePL91kV9DsufoqzndJ0u3c=; b=O+TPW69/xGCMQUu9KeGJTOk+6g
	3TuwwbTK0+9pGkLzwi7Nc5myj/VTrKlv7A71pInIhbQVB6702Ulhy0E5ydIXJvEKs02iaRaYcD43T
	hU6yUmQ1+v+3moGfRxlCAy5Jz1tY7k56eyb9g9QDDB8ctAGr5WzpDZPoeCx7lytvogFx9kNocUazg
	upyBvzBtbAbHuh6HWkgmYyZlpXt92xOeDJ8rFAb90C5m3U8dtPtkMVeVynW3a4ly7hBK3PscL4+vq
	LSeuuBkQPXYyRwbb3Xe9YxPt7VBQlM0px6d5T/pCe5CLSFc7Nn9e1qYK0v0LT5z21dbexCO13G3p2
	vSV0iMcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJDY-000000052I1-20Zs;
	Mon, 13 Jan 2025 12:06:52 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJCK-0000000525j-0zcM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 12:05:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3862d161947so2104489f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jan 2025 04:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736769934; x=1737374734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVtNiN/5nBBT9gWYseRrzePL91kV9DsufoqzndJ0u3c=;
        b=P1YG0Evb8Re9awSuuirNM8KuCy7jeJ2YAovaMT8SEjpGYzBQKNsu7f8VeSmPnwCqKc
         944mvybCyDjLGe6shUxRFBV/qA4k1X2nEpbgjdXO6oFNaaCFn0+pwF80v1orSh0+Wf44
         wHL0JT4o4fAmQchZYY90O7PVWhqtxdpZ6RCE5fJjGH8OE/32Oh9hwmel2x8BmppkwjLn
         dn4/jtNgYmauFu0HSGVQqwOb7iujc8e1z7Z2qP7dskFB9qqp/Rr6Lz/Yiqk5McjdH/AY
         Un6Ec9nD2s5cg6B7CSmudwPo4JFY+VO4AbyTS3SM19ZAo9hHlox88c6Jdzg2gn0T5iVH
         Pq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736769934; x=1737374734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eVtNiN/5nBBT9gWYseRrzePL91kV9DsufoqzndJ0u3c=;
        b=SYpxfPLlsRgdR9sKu0Gr6G+tbsAnBGP3QK27VKGU2/+wI+tGYwUBm47utvxMeLezxB
         i7g3cDZ9d9iWK0rxaARVImo0FY4DFXNZSCTezrOzz/ksyUjlno+tznOGrlIXTU5VelsI
         r0fOP2rZoNi4OacRXhL7kozvx4usV34HmqQXarwv7uqSzERM1r/y2azZWdWgQi2c0UXI
         E9g9qHslC2JXp7iCFLM4MntZvil77aA4FjQCxpCi3NlbJ4yLjecvS+3su+kAsda7WnaB
         aaTnwF2kYuxYR8OizjL4FIlcnEHTa8e9j3Yex1jBkaQS66+OmNzNeFeR1lL4j207VnAB
         KLgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZf2k7bPhx5vXXn4+uciN0ZzfIwnCG4lEtPtniCnGwnsTD7joTjh8kK3mUx2kFi6i613G5B7YVE9VLd5Kubot/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+30Wc7FBdbKVw8M1wNy/MzBhQYSwaFeleM8CSkHVcrTF2NEgx
	dphSofSyPgPqr+MP9vECKbuFiRgd1Y1HxwfuyIvSTZ9Kj1eunmNGv7CkI7E5pX8=
X-Gm-Gg: ASbGncvi35p+aqFFgTdN6UBL/aDg7mil+FNHtifyOTyIsNcXpDwNIaWwtwRZu6whz/1
	NxXUr4XXcYcINclzms2fKkM0EvBaRDIuH9Thiqx2rk3pIrhBMagG2MiTZXJ8TaYk3RgT6DQEEKH
	wk7uq821FuvupzyeGOvNWqb8g//trqJVhbGTuPNmjAZqoxHJA5iOQcygbqNWSSFMHXDMJUMveE0
	0LcPLc+Cow3BAKvGW3p0dCGEUBpS0nhmFpgDL+nsFjeae9xVOtXEblmFhfexWUB4flS
X-Google-Smtp-Source: AGHT+IFsb3yGZvvP2wEwLT0wiKxlNzjlKgWTeZfG9mQp1rnTYe/EhMN71/DxU9unKU0hxtWa58Y2ig==
X-Received: by 2002:a05:6000:4615:b0:385:e013:39ef with SMTP id ffacd0b85a97d-38a872f6993mr16400128f8f.6.1736769934185;
        Mon, 13 Jan 2025 04:05:34 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80d4sm11698622f8f.85.2025.01.13.04.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 04:05:33 -0800 (PST)
Message-ID: <5d8df2d3-41b9-4c21-ba63-c184bad50041@linaro.org>
Date: Mon, 13 Jan 2025 12:05:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241226011022.1477160-5-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_040536_298170_425D146B 
X-CRM114-Status: GOOD (  40.61  )
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



On 26/12/2024 1:10 am, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |   8 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-ctcu.c | 273 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h |  21 ++
>   include/linux/coresight.h                    |   3 +-
>   5 files changed, 305 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169..152eab0b9b2a 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -133,6 +133,14 @@ config CORESIGHT_STM
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called coresight-stm.
>   
> +config CORESIGHT_CTCU
> +	tristate "CoreSight TMC Control Unit driver"
> +	help
> +	  This driver provides support for CoreSight TMC Control Unit
> +	  that hosts miscellaneous configuration registers. This is
> +	  primarily used for controlling the behaviors of the TMC
> +	  ETR device.
> +
>   config CORESIGHT_CPU_DEBUG
>   	tristate "CoreSight CPU Debug driver"
>   	depends on ARM || ARM64
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..1b7869910a12 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>   		   coresight-cti-sysfs.o
>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/hwtracing/coresight/coresight-ctcu.c
> new file mode 100644
> index 000000000000..7650dbe9a41e
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +#include "coresight-trace-id.h"
> +
> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
> +
> +#define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
> +#define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
> +
> +/* The TMC Coresight Control Unit uses four ATID registers to control the data filter function based
> + * on the trace ID for each TMC ETR sink. The length of each ATID register is 32 bits. Therefore,
> + * the ETR has a related field in CTCU that is 128 bits long. Each trace ID is represented by one
> + * bit in that filed.
> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
> + *                                           bit5
> + * ------------------------------------------------------
> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
> + * ------------------------------------------------------
> + *
> + * e.g. ETR0:
> + * 127                     0 from ATID_offset for ETR0ATID0
> + * -------------------------
> + * |ATID3|ATID2|ATID1|ATID0|
> + *
> + */
> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
> +		((traceid / 32) * 4 + atid_offset)
> +
> +#define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
> +#define CTCU_ATID_REG_SIZE		0x10
> +
> +struct ctcu_atid_config {
> +	const uint32_t atid_offset;
> +	const uint32_t port_num;
> +};
> +
> +struct ctcu_config {
> +	const struct ctcu_atid_config *atid_config;
> +	int num_atid_config;
> +};
> +
> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
> +	{0xf8,  0},
> +	{0x108, 1},
> +};
> +
> +static const struct ctcu_config sa8775p_cfgs = {
> +	.atid_config		= sa8775p_atid_cfgs,
> +	.num_atid_config	= ARRAY_SIZE(sa8775p_atid_cfgs),
> +};
> +
> +/*
> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on trace ID when enable is true.
> + * Reset the bit of the ATID register based on trace ID when enable is false.
> + *
> + * @csdev:	coresight_device struct related to the device
> + * @traceid:	trace ID of the source tracer.
> + * @enable:	True for set bit and false for reset bit.
> + *
> + * Returns 0 indicates success. Non-zero result means failure.
> + */
> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				  u8 traceid,
> +				  int port_num,
> +				  bool enable)
> +{
> +	uint32_t atid_offset, reg_offset, val;
> +	struct ctcu_drvdata *drvdata;
> +	int bit;
> +
> +	if (!IS_VALID_CS_TRACE_ID(traceid))
> +		return -EINVAL;

Minor point, but this was already done in the calling function.

> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	if (IS_ERR_OR_NULL(drvdata))
> +		return -EINVAL;
> +
> +	atid_offset = drvdata->atid_offset[port_num];
> +	if (atid_offset == 0)
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +	CS_UNLOCK(drvdata->base);
> +
> +	bit = CTCU_ATID_REG_BIT(traceid);
> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);

The locks only need to be around the read/write below. bit and 
reg_offset are all local and shouldn't be affected. Doesn't really make 
a difference but makes the code a bit more readable.

> +	if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE) {
> +		CS_LOCK(drvdata);
> +		return -EINVAL;
> +	}
> +
> +	val = ctcu_readl(drvdata, reg_offset);
> +	if (enable)
> +		val = val | BIT(bit);
> +	else
> +		val = val & ~BIT(bit);
> +
> +	ctcu_writel(drvdata, val, reg_offset);
> +	CS_LOCK(drvdata->base);
> +
> +	return 0;
> +}
> +
> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> +{
> +	int i;
> +
> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
> +		if (sink->pdata->out_conns[i]->dest_dev)
> +			return sink->pdata->out_conns[i]->dest_port;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				struct cs_sink_data *sink_data,
> +				bool enable)
> +{
> +	int port_num;
> +
> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
> +	    (sink_data->sink == NULL)) {
> +		dev_err(&csdev->dev, "Invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
> +
> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
> +}
> +
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
> +{
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	return ctcu_set_etr_traceid(csdev, sink_data, true);
> +}
> +
> +static int ctcu_disable(struct coresight_device *csdev, void *data)
> +{
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	return ctcu_set_etr_traceid(csdev, sink_data, false);
> +}
> +
> +static const struct coresight_ops_helper ctcu_helper_ops = {
> +	.enable = ctcu_enable,
> +	.disable = ctcu_disable,
> +};
> +
> +static const struct coresight_ops ctcu_ops = {
> +	.helper_ops = &ctcu_helper_ops,
> +};
> +
> +static int ctcu_probe(struct platform_device *pdev)
> +{
> +	int i;
> +	void __iomem *base;
> +	struct device *dev = &pdev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct ctcu_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	const struct ctcu_config *cfgs;
> +	const struct ctcu_atid_config *atid_cfg;
> +
> +	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	dev->platform_data = pdata;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
> +	if (IS_ERR(drvdata->apb_clk))
> +		return -ENODEV;
> +
> +	cfgs = of_device_get_match_data(dev);
> +	if (cfgs) {
> +		if (cfgs->num_atid_config <= ATID_MAX_NUM) {
> +			for (i = 0; i < cfgs->num_atid_config; i++) {
> +				atid_cfg = &cfgs->atid_config[i];
> +				drvdata->atid_offset[i] = atid_cfg->atid_offset;
> +			}
> +		}
> +	}
> +
> +	drvdata->base = base;
> +	drvdata->dev = dev;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	desc.type = CORESIGHT_DEV_TYPE_HELPER;
> +	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
> +	desc.pdata = pdata;
> +	desc.dev = dev;
> +	desc.ops = &ctcu_ops;
> +
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev)) {
> +		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> +			clk_put(drvdata->apb_clk);
> +
> +		return PTR_ERR(drvdata->csdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void ctcu_remove(struct platform_device *pdev)
> +{
> +	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	coresight_unregister(drvdata->csdev);
> +	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> +		clk_put(drvdata->apb_clk);
> +}
> +
> +static const struct of_device_id ctcu_match[] = {
> +	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
> +	{}
> +};
> +
> +static struct platform_driver ctcu_driver = {
> +	.probe          = ctcu_probe,
> +	.remove         = ctcu_remove,
> +	.driver         = {
> +		.name   = "coresight-ctcu",
> +		.of_match_table = ctcu_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +module_platform_driver(ctcu_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("CoreSight TMC Control Unit driver");
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> new file mode 100644
> index 000000000000..fc85f3377872
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_CTCU_H
> +#define _CORESIGHT_CTCU_H
> +
> +#define ATID_MAX_NUM 5
> +
> +struct ctcu_drvdata {
> +	void __iomem		*base;
> +	struct clk		*apb_clk;
> +	phys_addr_t		pbase;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	raw_spinlock_t		spin_lock;
> +	uint32_t		atid_offset[ATID_MAX_NUM];
> +};
> +
> +#endif
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 1929f0088c0f..18bb4de1d1e4 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -71,7 +71,8 @@ enum coresight_dev_subtype_source {
>   
>   enum coresight_dev_subtype_helper {
>   	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU,
>   };
>   
>   /**


