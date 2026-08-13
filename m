Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A201C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 06:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Mime-Version:
	Message-Id:Date:From:Cc:In-Reply-To:Content-Transfer-Encoding:References:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wy7JTPz+xuFrPRklb+y4gtwQ+LyjInDrwDQ324LLPGk=; b=iksILDmubhW2TfeDp0Kfaq0L/n
	pwwGdrV4ZY47m02dfHbmpTcJPAU2d7FIb2bLVdR4UHRCdNbh74yxKgd9lw8qb8MwQjBlJX1j0rps3
	cjYEwOh/If8X5BSrwhDyCIihPtLyBxv9AseqgtjtIz+BB7oxTGIgreFQaI70yJi9itSG6UVV5sraC
	g7vWEmFt6yX3Vu98Zjkhg9Xkfw/XIcOAHSTftZmmwOqy7cjJc5UIrCZQVXMJPcn8VGQr1rCbWJJ9a
	n2UHuUX5Rj2dIS1ntWq/oy8M0SG3iN3NzGowUGRXDDsSF0i6LeLCOAfI05Z8zbX1uIrKtB/1/fPfV
	UQ2chPIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOYm-0000000HSZY-2KCk;
	Thu, 13 Aug 2026 06:05:00 +0000
Received: from va-2-38.ptr.blmpb.com ([209.127.231.38])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuOYk-0000000HSYt-14VG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 06:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1786601090; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=wy7JTPz+xuFrPRklb+y4gtwQ+LyjInDrwDQ324LLPGk=;
 b=UtvrOEZO8ZTfzCPy++o+RWirTYyRzYlfrq1miGh/SoYwYTWL1Xp+HMISlakHGmJ8XQMfcD
 mWsjddcldXtnXtaEOdVjwDCRMKbZXLSKxaRTs8XU8GZDTuaan4J6GK9VeEELNIKcoK/On/
 SC0FbJOoisMSq8LEzWkoRo6FIRym3PyzS61zS9nKI3gwPPU6/PdpLDZZcrNX+Swvi35AhU
 yPDnHcSeqg0hzcEkt0v/SHHAw/kBBO9EIu5rqXxCbb5OXr2DuF4vsg4N1gMrtKHxr4G7pQ
 lsfGzVW57Lh+DfnfEo7L61Hjk//RSJY5ZXXgzu/twUarfLN7cGeaHYGjvlfEzA==
To: "Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH v2 1/2] perf/dwc_pcie: Avoid nested bus notifier locking
Received: from [100.86.210.149] ([120.234.91.243]) by smtp.feishu.cn with ESMTPS; Thu, 13 Aug 2026 14:04:47 +0800
References: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com> <20260811160649.28255-1-zhangzhanpeng.jasper@bytedance.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260811160649.28255-1-zhangzhanpeng.jasper@bytedance.com>
X-Lms-Return-Path: <lba+26a7d5e80+b5a9d3+lists.infradead.org+yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: "Shuai Xue" <xueshuai@linux.alibaba.com>, 
	"Jing Zhang" <renyu.zj@linux.alibaba.com>, <yang.yicong@picoheart.com>, 
	"Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>, 
	"Baolin Wang" <baolin.wang@linux.alibaba.com>, 
	"Jonathan Cameron" <Jonathan.Cameron@huawei.com>, 
	<linux-arm-kernel@lists.infradead.org>, 
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Thu, 13 Aug 2026 14:04:45 +0800
Message-Id: <d7ccd4f5-5804-4c0f-992e-48fe6f0efcb0@picoheart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_230458_508258_C5360BFE 
X-CRM114-Status: GOOD (  16.77  )
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

On 8/12/26 12:06 AM, Zhanpeng Zhang wrote:
> dwc_pcie_pmu_notifier() registers a synthetic platform device directly from
> the BUS_NOTIFY_ADD_DEVICE callback. Bus notifier callbacks run with the
> bus_notifier rwsem held, so platform_device_register_data() enters the
> platform bus notifier chain before the PCI bus notifier returns. When PCI
> host bridges are registered during late init, lockdep reports this as
> possible recursive locking.
> 
> Move platform device reconciliation to a work item that runs after the PCI
> notifier returns. Serialize it with PCI rescan and removal, and parent each
> synthetic device to its Root Port so their lifetimes remain coupled.
> 
> During removal, unregister the perf PMU and its CPU hotplug instance before
> PCI resources disappear, then defer only platform device destruction.
> Disable manual bind controls to preserve that ordering.
> 
> Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>

please attach the lockdep warning/trace in the commit for better
understanding the issue..

> ---
> Tested on a RISC-V system with CONFIG_KASAN, CONFIG_PROVE_LOCKING,
> CONFIG_DEBUG_LOCK_ALLOC and CONFIG_LOCKDEP enabled. Late-init PCI discovery
> no longer triggers the nested bus notifier warning.
> 
>  drivers/perf/dwc_pcie_pmu.c | 149 +++++++++++++++++++++++++++---------
>  1 file changed, 113 insertions(+), 36 deletions(-)
> 

[...]

>  
> @@ -815,7 +891,11 @@ static int dwc_pcie_pmu_offline_cpu(unsigned int cpu, struct hlist_node *cpuhp_n
>  
>  static struct platform_driver dwc_pcie_pmu_driver = {
>  	.probe = dwc_pcie_pmu_probe,
> -	.driver = {.name = "dwc_pcie_pmu",},
> +	.driver = {
> +		.name = "dwc_pcie_pmu",
> +		.probe_type = PROBE_FORCE_SYNCHRONOUS,

this looks irrelevant to the issue to resolve. need description here.

I suppose this issue is because both the PMU and the PCIe controller
are on the platform bus, right? If we switch the PMU to the faux device
interface [1] this could be solved?

thanks.

[1] https://lore.kernel.org/all/20260708084507.98242-4-yang.yicong@picoheart.com/

