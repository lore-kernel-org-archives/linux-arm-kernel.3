Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F4AC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnUbX0O3XIbl3s6CjnpHoRa+mFzwtuOYYOW3lsScYJo=; b=bWf+5deU6ubvmNkGPrP3kC0Mu+
	Vg9Rb37YTFO0XtxjCMH6MLTwXnfQ4q8IiDYYDg5AaGMKEdEJ4fd1HvEFLr3mdqnnRDQPd6SvNkl4E
	MwHeyo1J0Qmc6bjAaW38u22UuXcB9zcyC0vXLXjnWZgiiVyf/pILoxZvvceFMG35ddUW+B5uCWiQl
	h5WpolQ2qvw4iYxKq1EAcmJib+ySAmmp4V8m4u/RoT5AJwjqFBooXUZ+Pr4K8z0ua5rqtqlwnvvcA
	BQR2415WxOJsTn1Eaqy9mkfHIxjQFjOvFFnczWyE7pEZ2fQEOjrYsPihG7ACevahcrx9i4gfiKVN0
	sHl0MZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92T0-00000005qMn-3c6P;
	Tue, 22 Sep 2026 15:31:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Sz-00000005qM2-1wSm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:31:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F24260E41;
	Tue, 22 Sep 2026 15:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D291F000FF;
	Tue, 22 Sep 2026 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091092;
	bh=RnUbX0O3XIbl3s6CjnpHoRa+mFzwtuOYYOW3lsScYJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XV6eXBJ9wZazvZIQBB2YkJk4/WbhDvnLSmhZsy7zJMOblJ24O1UZ6mP+I47TDv/P2
	 fG3E7NpVbcjNfQQJy8ON02b5puSY9D74uS/zQUp74mzobyRuL8Qz3tKcX7vORs7hgQ
	 /qrZsgpoyZD3xP2qf63pkxyCb3iyt2TT36q4NQuyyxr2BI2x5FTslegufvih8hLLpz
	 JkSfZ1DK3ViOJFlQwmDdwUQMl+RlyTiMhSEWz7SbOUqYgbCbdfD/aLc4OT/GF9uTCP
	 SaY7idbMIv1eqZOrTIJCO4LS8mwvyUqbK05982Yvj0PXeVzhQvo4/a5y7M5Abummoa
	 UP7KYbXUlSqmA==
Message-ID: <2a882f5d-fb85-45a8-9405-f9a506b7c509@kernel.org>
Date: Tue, 22 Sep 2026 17:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/17] platform/x86: yogabook: Switch to use
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
 <1973238.CQOukoFCf9@rafael.j.wysocki>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <1973238.CQOukoFCf9@rafael.j.wysocki>
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

On 21-Sep-26 21:48, Rafael J. Wysocki wrote:
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
>  drivers/platform/x86/lenovo/yogabook.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x86/lenovo/yogabook.c
> index 1a4b2ab1f35d..8a91d440724b 100644
> --- a/drivers/platform/x86/lenovo/yogabook.c
> +++ b/drivers/platform/x86/lenovo/yogabook.c
> @@ -353,13 +353,13 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
>  		goto error_put_devs;
>  	}
>  
> -	data->kbd_dev = get_device(acpi_get_first_physical_node(data->kbd_adev));
> +	data->kbd_dev = acpi_bus_get_primary_device(data->kbd_adev);
>  	if (!data->kbd_dev || !data->kbd_dev->driver) {
>  		r = -EPROBE_DEFER;
>  		goto error_put_devs;
>  	}
>  
> -	data->dig_dev = get_device(acpi_get_first_physical_node(data->dig_adev));
> +	data->dig_dev = acpi_bus_get_primary_device(data->dig_adev);
>  	if (!data->dig_dev || !data->dig_dev->driver) {
>  		r = -EPROBE_DEFER;
>  		goto error_put_devs;


