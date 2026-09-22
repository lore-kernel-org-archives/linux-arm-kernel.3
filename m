Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CB0C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXqAA6eqv8sionh8O8cNg0OP7IaRZQLQ2PAG3DzIVPo=; b=Aj8kD6goNkglY2r2n9jiBSjbtX
	c4R+lzfcMeF9790e0myUnhSBxAiFBhUSuBJ/GN+y/2s4f3BkFLcDlYRsJzDcQWtc1JKHDFTo/K0IX
	xisDB4rjoLQ5ouU9wuyQe1rnR5Slv77FSOc4+6z+2XqZ0DnU3SX6pVKwZ/FYvBWdEK0gAAGsmR136
	v8EfbGgCYnjgewXn918DrgD4jZelIJnhO/LiXZ5kB/LT6pTyhyAMI00PiI8V8rS/iP8yW1hHe//d7
	iaxe2kF62D8og/ZT5jJilwlWOtKeMR9fARkRF7WJtZw/I7xwEBpl7T+LHsdZp9/rs85S5uM1oyjQL
	Xkuq2Nlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93ov-000000067hO-3bKh;
	Tue, 22 Sep 2026 16:58:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93ou-000000067gt-1jer
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 16:58:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E16404184B;
	Tue, 22 Sep 2026 16:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332291F000FF;
	Tue, 22 Sep 2026 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790096295;
	bh=rXqAA6eqv8sionh8O8cNg0OP7IaRZQLQ2PAG3DzIVPo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ejyK/swq7jv9XXaZWQ1mvyu/Zpr06HFuYW+qYPcUuysGTx6mEJkqZgljnmzo1Jfev
	 Jf1GrFLudHhzyPlRyO4eTp8ColKO8GQLlcq2qTHwpj+EXQQ924ZyYAZc88n4ryC9FI
	 lL7Nzort/dgzd9L6RElfj0cwGARCylKiRgHyOZ5or+Ii3nu/C1dq2MR7QBWRZYR0iQ
	 ZYYFeCOObOJrORWRL4d/24Vb4guQ8oHULiOJjkb4YtjfgFD2gselJXHkdiOoMKcxWo
	 ExRNUznCF9dkJvM7v6xIyniRkt0P3SqylsC/fWryuWnvVUme+IHRgz0KGf8FIgFXwo
	 73QQK+vK/XAPw==
Message-ID: <ff6ace62-1cd3-4656-a3d7-5c0c78c8a218@kernel.org>
Date: Tue, 22 Sep 2026 18:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/17] platform/x86: serdev_helpers: Switch to use
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
 <2720286.Lt9SDvczpP@rafael.j.wysocki>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <2720286.Lt9SDvczpP@rafael.j.wysocki>
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

On 21-Sep-26 21:49, Rafael J. Wysocki wrote:
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
>  drivers/platform/x86/serdev_helpers.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/serdev_helpers.h b/drivers/platform/x86/serdev_helpers.h
> index 57eac75805e2..20267e1941f1 100644
> --- a/drivers/platform/x86/serdev_helpers.h
> +++ b/drivers/platform/x86/serdev_helpers.h
> @@ -74,8 +74,7 @@ get_serdev_controller(const char *serial_ctrl_hid,
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> -	/* get_first_physical_node() returns a weak ref */
> -	parent = get_device(acpi_get_first_physical_node(adev));
> +	parent = acpi_bus_get_primary_device(adev);
>  	acpi_dev_put(adev);
>  	if (!parent) {
>  		pr_err("error could not get %s/%s serial-ctrl physical node\n",


