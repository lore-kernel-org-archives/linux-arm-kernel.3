Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52A2CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gFz16OXxdVWNpZ+XAvrYshRDoVNNNdGGCZgE4lW13o=; b=pcSHM6KirOE7VmY4UBJ+YSzgat
	QJEI+DQvuOBEdqu0p/0GK/wAzElQ4d2ca5CLhYqt0aOz0QWYdIJmsmcsNAUVxJeNSlL62Vz3VV9/W
	nrdsTVOA/bemja/xrKP1YkGaBkKv2xpnhuB6G0kcwi3KTruhrQRniyNjDp6GK2HOfZLaHVAfa/1Ki
	j+zDP+32Q85yBPo5+8Zp+0Fgx59jaZg9lCuhq4lftAe5qGkkdZQBK5tUQ/B/z6bttt2ckC6X2yJhb
	yN7/yNFvGbOLUoac3867iLplmTC8abfPh8PX+xIWNN88HtmYNgrK86Dn7p4in2GVXAGKOV3pTE6aL
	go9XLsUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwe2t-00000002FH5-04BH;
	Thu, 11 Sep 2025 09:56:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwe2q-00000002FEk-0mf9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:56:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3d118d8fa91so158653f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757584606; x=1758189406; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gFz16OXxdVWNpZ+XAvrYshRDoVNNNdGGCZgE4lW13o=;
        b=U91DEtUlXDwIpKXX94uXyjBbECSjZJW5qAxxCygty/qjB4UZSHQfEbyYEFw21skRNr
         /H1Tsq3I1PftNXojO4ioI5fIpgU2anLMJ/yiYXr8ygMFm4tayLeCh5P3fwzqow8BsnVD
         v/EWMxDfLF6g4KJMqiZ7XQclzxRkLUScsUbO9Gv26CJofigfljFBGzo59J0JydX8sJOg
         +uxX30AoKOY00LPRuQ9PsHt5xjnQS4TkMLBBdLtU/8J8j7MMNQKuIwZTc5dERvbEdZuk
         HkX2KE8MkODQVzf1omTNj4UtHLM5BHTFVEy6D8XNZjIcbgy3W2MZjcNVkNS0DM1iWSoU
         DJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757584606; x=1758189406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gFz16OXxdVWNpZ+XAvrYshRDoVNNNdGGCZgE4lW13o=;
        b=JFUeaSJ3+jFyrR0lVWmvzGoYVIGRs4mt/1Uo38CHOo7rhWBOzwPEL9t36YTkh2gP9n
         TXKPFNQsen42N8yN5oEARYaHm1OqSCOxSmap6PBgsTcd9niqlTQs44zI8Kg3PCLYOR4z
         YmxNRX6XJ5bzmW4wo+P5vcGYyjpmiw29kJH/MWs3priacIIqyPT/IqN8dJj/Qp4BImzk
         aLp9brqH+NO7c7IgITqOD904/kkLPzS6/5dbbgnyoNEFvdkEX7e5yTq/RERS1Ru6UQVk
         DWyeZjpda6Zgapq4n4+fJHTUJlYRwA3uxGUhJzoZ0ndYI1GkkUnWIwSxSX7nUYtMeEbF
         dvFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw1wN64+H6LIxhuG9Q4nIRaixhaI6gxE/xbrqHKwjJxrFBmHWdexfrAXQAPc5GZqQ88gGsrjOSoj0073b5qsfG@lists.infradead.org
X-Gm-Message-State: AOJu0YyP+QXoJgQN5joV7XQeJUkgpkmUWWfdD8OR2Zrm/m/z80OIXJzM
	uKu1VUWVfkYXlyg/MtJipi9VV8puigAuqa7tqeYHjHJn0EP9OzfETp4E
X-Gm-Gg: ASbGnctFQxGX1yUJpE2tWQMqXQbz2wDumdQeUG5xp8tAE07kLiFeD4JdCoXj+f+1bkM
	7tIMJpxbstwUdfclK57GHBvp3skFub9TsepzO+5SYJA3s2fwXKncPuG6/Wx/GpD9W40GoC/QcAR
	s4iPxEkqkeuEDo+l0SJGr527s3nGSQQzX7RMZ7bj6ZXeE/i46IKhO9pqrXfDFwFCEJv51d9M5UM
	M6CnPcnBiQqzDc0DAsJ7wrgS/Lw2e1qulO+cM8FaDlrta5G90sMgiD5PbUb8H/kk7CRsFnbSEuk
	Zkpo9EtK/cjOSyo2wymUVPCWY6prsSJO21t9Rj5OdrY4G8Up8WStqs3rtLsrW5jN4goupPkU2I9
	S6SiP490mr4K9M1X+x+A9f5u80gliPvIKpIBNNOEY8nqV36b5QaiYtvlwgOqiXL98RIYbfxgUVF
	Fs7RziiRdHZYSQ2cCbNL7OMmGc8txQa4qqkE6IDygo0RsQcfA/ePf8P1UFOmUl0GHwYw==
X-Google-Smtp-Source: AGHT+IFsyOKmEcChP9t0DqmtXOvTU/RBxiKR0aH0FNUztPJysvQ4Mcixg7qVyb6OlqpSIPNKJ5m26Q==
X-Received: by 2002:a05:6000:1a8b:b0:3c2:d7f0:9c4e with SMTP id ffacd0b85a97d-3e75e0fadc1mr2058003f8f.8.1757584605567;
        Thu, 11 Sep 2025 02:56:45 -0700 (PDT)
Received: from ?IPV6:2a02:8440:714e:6956:5ea7:44db:f723:be79? (2a02-8440-714e-6956-5ea7-44db-f723-be79.rev.sfr.net. [2a02:8440:714e:6956:5ea7:44db:f723:be79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7c02sm1803049f8f.52.2025.09.11.02.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:56:45 -0700 (PDT)
Message-ID: <1a9ddd04-7877-4b4b-b746-0f3cf6ce0d8b@gmail.com>
Date: Thu, 11 Sep 2025 11:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/20] perf: stm32: introduce DDRPERFM driver
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-13-ce082cc801b5@gmail.com>
 <20250910102627.00007a40@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <20250910102627.00007a40@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_025648_298998_0B421AD4 
X-CRM114-Status: GOOD (  55.90  )
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

On 10/09/2025 11:26, Jonathan Cameron wrote:
> On Tue, 09 Sep 2025 12:12:20 +0200
> Clément Le Goffic <legoffic.clement@gmail.com> wrote:
> 
>> From: Clément Le Goffic <clement.legoffic@foss.st.com>
>>
>> Introduce the driver for the DDR Performance Monitor available on
>> STM32MPU SoC.
>>
>> On STM32MP2 platforms, the DDRPERFM allows to monitor up to 8 DDR events
>> that come from the DDR Controller such as read or write events.
>>
>> On STM32MP1 platforms, the DDRPERFM cannot monitor any event on any
>> counter, there is a notion of set of events.
>> Events from different sets cannot be monitored at the same time.
>> The first chosen event selects the set.
>> The set is coded in the first two bytes of the config value which is on 4
>> bytes.
>>
>> On STM32MP25x series, the DDRPERFM clock is shared with the DDR controller
>> and may be secured by bootloaders.
>> Access controllers allow to check access to a resource. Use the access
>> controller defined in the devicetree to know about the access to the
>> DDRPERFM clock.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
> Hi Clément
> 
> A quick drive by review,
> 

Hi Jonathan,

Thank you for the review, below are my answers

> 
>> diff --git a/drivers/perf/stm32_ddr_pmu.c b/drivers/perf/stm32_ddr_pmu.c
>> new file mode 100644
>> index 000000000000..38328663d2c5
>> --- /dev/null
>> +++ b/drivers/perf/stm32_ddr_pmu.c
>> @@ -0,0 +1,897 @@
> 
>> +
>> +#define MP1_CLR_CNT		GENMASK(3, 0)
>> +#define MP1_CLR_TIME		BIT(31)
>> +#define MP2_CLR_CNT		GENMASK(7, 0)
>> +#define MP2_CLR_TIME		BIT(8)
>> +
>> +/* 4 event counters plus 1 dedicated to time */
>> +#define MP1_CNT_NB		(4 + 1)
> 
> This is never used so I would drop it and rename the MP2_CNT_NB
> to indicate it is the max value for any devices supported.

It is used in the stm32_ddr_pmu_cfg_mp1 struct which is the device 
platform data.
> 
> 
>> +/* Index of the time dedicated counter */
>> +#define MP1_TIME_CNT_IDX	4
>> +
>> +/* 8 event counters plus 1 dedicated to time */
>> +#define MP2_CNT_NB		(8 + 1)
> ...
> 
>> +struct stm32_ddr_pmu {
>> +	struct pmu pmu;
>> +	void __iomem *membase;
>> +	struct device *dev;
>> +	struct clk *clk;
>> +	const struct stm32_ddr_pmu_cfg *cfg;
>> +	struct hrtimer hrtimer;
>> +	ktime_t poll_period;
>> +	int selected_set;
>> +	u32 dram_type;
>> +	struct list_head counters[];
> The absence of a __counted_by() marking made me wonder how
> we ensured that this wasn't overrun.  I see below that's because
> size is always the same.  So
> 	struct list_head counters[MP2_CNT_NB];
> If you do want to make it dynamic then that is fine but added
> a local variable for the size and the __counted_by() marking so
> the various analysis tools can check for buffer overruns.

Oh I didn't know about this __counted_by compiler attribute.
I'll have a look and try to use it.
The array shouldn't have the same size basically it should depends on 
the platform counters number.
There is definitely something to rework regarding the allocation.
Thank you for pointing it.

> 
>> +};
> 
> 
> 
>> +static void stm32_ddr_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +	struct stm32_ddr_pmu *pmu = to_stm32_ddr_pmu(event->pmu);
>> +	struct stm32_ddr_cnt *counter = event->pmu_private;
>> +	bool events = true;
> 
> Always set before use, so don't set it here.  I'd move this into the
> scope of the for loop to make this more obvious.

Right, i'll remove the assignation.

> 
>> +
>> +	stm32_ddr_pmu_event_stop(event, PERF_EF_UPDATE);
>> +
>> +	stm32_ddr_pmu_free_counter(pmu, counter);
>> +
>> +	for (int i = 0; i < pmu->cfg->counters_nb; i++) {
>> +		events = !list_empty(&pmu->counters[i]);
>> +		if (events) /* If there is activity nothing to do */
>> +			return;
>> +	}
>> +
>> +	hrtimer_cancel(&pmu->hrtimer);
>> +	stm32_ddr_stop_counters(pmu);
>> +
>> +	pmu->selected_set = -1;
>> +
>> +	clk_disable(pmu->clk);
>> +}
> 
>> +
>> +#define STM32_DDR_PMU_EVENT_ATTR(_name, _id)			\
>> +	PMU_EVENT_ATTR_ID(_name, stm32_ddr_pmu_sysfs_show, _id)
>> +
>> +static struct attribute *stm32_ddr_pmu_events_attrs_mp[] = {
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_rd, PERF_OP_IS_RD),
> 
> Prefixing perf events with perf_ seems unnecessary.
> 
> I guess perf_op_is_rd is counting all reads?  Is so why not call it simply 'reads'
> or something else short like that?  If it's cycles when a read is going on then
> maybe a more complex is needed, but perf_op_is_rd doesn't convey that to me.

Here I just extracted the name of each event from the datasheet and for 
some of them there are prefixed by "perf_".
I do not have enough knowledge of the HW to just rename it read and let 
other event with their "scientific name".
To me I should stick to a policy either rename all the events with 
understandable names or keep all event names like this.
And I'm unable to find an understandable name for each event.

> 
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_wr, PERF_OP_IS_WR),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_activate, PERF_OP_IS_ACTIVATE),
>> +	STM32_DDR_PMU_EVENT_ATTR(ctl_idle, CTL_IDLE),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_hpr_req_with_no_credit, PERF_HPR_REQ_WITH_NO_CREDIT),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_lpr_req_with_no_credit, PERF_LPR_REQ_WITH_NO_CREDIT),
>> +	STM32_DDR_PMU_EVENT_ATTR(cactive_ddrc, CACTIVE_DDRC),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_enter_powerdown, PERF_OP_IS_ENTER_POWERDOWN),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_op_is_refresh, PERF_OP_IS_REFRESH),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_selfresh_mode, PERF_SELFRESH_MODE),
>> +	STM32_DDR_PMU_EVENT_ATTR(dfi_lp_req, DFI_LP_REQ),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_hpr_xact_when_critical, PERF_HPR_XACT_WHEN_CRITICAL),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_lpr_xact_when_critical, PERF_LPR_XACT_WHEN_CRITICAL),
>> +	STM32_DDR_PMU_EVENT_ATTR(perf_wr_xact_when_critical, PERF_WR_XACT_WHEN_CRITICAL),
>> +	STM32_DDR_PMU_EVENT_ATTR(dfi_lp_req_cpy, DFI_LP_REQ),  /* Suffixed '_cpy' to allow the
>> +								* choice between sets 2 and 3
>> +								*/
>> +	STM32_DDR_PMU_EVENT_ATTR(time_cnt, TIME_CNT),
>> +	NULL
>> +};
> 
> 
>> +static int stm32_ddr_pmu_device_probe(struct platform_device *pdev)
>> +{
>> +	struct stm32_firewall firewall;
>> +	struct stm32_ddr_pmu *pmu;
>> +	struct reset_control *rst;
>> +	struct resource *res;
>> +	int ret;
>> +
>> +	pmu = devm_kzalloc(&pdev->dev, struct_size(pmu, counters, MP2_CNT_NB), GFP_KERNEL);
> 
> If using a fixed number of counters why not put it in the struct
> definition and simplify the code?  I agree it is probably not
> worth making this dynamic given small sizes but I don't mind
> if you do want to do this.  The only thing that isn't a good idea
> is this dynamic, but not really, current situation.

Yes something need reworks here as said above in your first comment.
I will try to find the best solution.

> 
>> +	if (!pmu)
>> +		return -ENOMEM;
> 
> 
> 
>> +static DEFINE_SIMPLE_DEV_PM_OPS(stm32_ddr_pmu_pm_ops, NULL, stm32_ddr_pmu_device_resume);
>> +
>> +static const struct of_device_id stm32_ddr_pmu_of_match[] = {
>> +	{
>> +		.compatible = "st,stm32mp131-ddr-pmu",
>> +		.data = &stm32_ddr_pmu_cfg_mp1
> 
> Trivial but if you are spinning again, normal convention is trailing commas
> in cases like this because maybe other fields will get set later.
Yes this is something I should keep in mind each time I init a struct.
I'll fix it for the next version.

> 
>> +	},
>> +	{
>> +		.compatible = "st,stm32mp251-ddr-pmu",
>> +		.data = &stm32_ddr_pmu_cfg_mp2
>> +	},
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_ddr_pmu_of_match);
>> +
>> +static struct platform_driver stm32_ddr_pmu_driver = {
>> +	.driver = {
>> +		.name = DRIVER_NAME,
>> +		.pm = pm_sleep_ptr(&stm32_ddr_pmu_pm_ops),
>> +		.of_match_table = stm32_ddr_pmu_of_match,
>> +	},
>> +	.probe = stm32_ddr_pmu_device_probe,
>> +	.remove = stm32_ddr_pmu_device_remove,
>> +};
>> +
>> +module_platform_driver(stm32_ddr_pmu_driver);
>> +
>> +MODULE_AUTHOR("Clément Le Goffic");
>> +MODULE_DESCRIPTION("STMicroelectronics STM32 DDR performance monitor driver");
>> +MODULE_LICENSE("GPL");
>>
> 

Best regards,
Clément


