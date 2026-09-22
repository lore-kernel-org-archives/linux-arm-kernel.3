Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EE1C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1wJMpHGmgVSXq/apVaQv39c3+7htkTrGoZWFd8MsVI=; b=xctzH8sUJZrS+Z0u39wGUiNJ4V
	31H/KovKMC636YROcR5pgzmDVRThzwTddZeGL8ol00KB/L/xc4B2Dy8i6C2+wXNdZkZeEFwTaeLn6
	UkkHb0luHeatnr/jNwSg0fT8F2A5/qOxxdzOwCQqRrpdHe89/gQHLk4CnHz4gFYVV65G+WtkA+m2G
	RJRwG1arpLmJcYshotlQeiNApp4M6aCxovpaEFNB3fHy0XGw3RRNBnsL3MmtpPgr1oywOTO5YpBQD
	esK8yzrfki8b3hNWPFk4a0u/VQVIphN8h5qpFEECawZAGLjn3MjHoCY8vFeY4j1QmvX7jji+werdn
	F3DUVlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93qf-0000000689H-3ryn;
	Tue, 22 Sep 2026 17:00:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93qe-00000006897-387t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:00:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E93942B6A;
	Tue, 22 Sep 2026 17:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6BE91F000FF;
	Tue, 22 Sep 2026 16:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096404;
	bh=e1wJMpHGmgVSXq/apVaQv39c3+7htkTrGoZWFd8MsVI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jGHNR++NPSVXNuPYrmF1QmiPjnD/wNjMRKlPDurqcKffL2GkIhAUP4ocDQVyfo8zB
	 GNlRK91S/zHEleP3JLgn18qTRbR1BJTvYlO8Aql02ef4twDUU9DHaorsU5UvJLfma1
	 qnbw0qOfKVc9phA+PRoRFN+z7RA2o8RqwnaQRVo/tjp0+WwX59SdfdtL5aq/+cmfoI
	 Qe5NRKVHXie9bnKJIDMmncQ2ZeALgipiKShVTcW62KLl4q/jatWuO42BVXUN5fzNn4
	 4nx/2q8fkO2ez/+5dkJaxy1NaPZ3SyuY0PwQ8xDdviIzhn9z0UJVbv+MaEsT+3reWx
	 X3h2vvNu4Afvg==
Message-ID: <e6d30881-c590-43db-8912-dbf03c459032@kernel.org>
Date: Tue, 22 Sep 2026 18:59:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] platform/x86: x86-android-tablets: Use
 acpi_bus_get_primary_device()
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-efi@vger.kernel.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Sen Wang <sen@ti.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
References: <7995179.EvYhyI6sBW@rafael.j.wysocki>
 <3912360.MHq7AAxBmi@rafael.j.wysocki>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <3912360.MHq7AAxBmi@rafael.j.wysocki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 21-Sep-26 21:50, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Replace acpi_get_first_physical_node() that is slated for removal
> with acpi_bus_get_primary_device() that takes a reference to the
> device it is about to return.
> 
> This addresses a potential use-after-free that may occur if the
> device returned by acpi_get_first_physical_node() is removed right
> after dropping its ACPI companion's physical_node_lock in that
> function.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans

> ---
>  drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index cfff7f5eac5d..2c262f117235 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -390,7 +390,6 @@ static int gpio_secondary_fwnode_init(struct device *parent,
>  {
>  	const struct software_node *const *swnode;
>  	struct fwnode_handle *fwnode;
> -	struct device *phys_dev;
>  	int ret;
>  
>  	if (!node_group)
> @@ -418,7 +417,8 @@ static int gpio_secondary_fwnode_init(struct device *parent,
>  		if (WARN_ON(!fwnode))
>  			return -ENOENT;
>  
> -		phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
> +		struct device *phys_dev __free(put_device) =
> +				acpi_bus_get_primary_device(to_acpi_device(dev));
>  		if (!phys_dev)
>  			return dev_err_probe(parent, -ENODEV,
>  					     "No physical device for ACPI GPIO dev: %pfwP\n",


