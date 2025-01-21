Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD44C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 14:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x9XPqJuiHeFmslhn9JxO368mOzb+Ow/0VyVvRzkFXq8=; b=SwQGKVVqA6TMQpoKQ5SNxp4zDz
	OlUAe4UZGry6FUU45LBpoJX33kYctF9EpfxATw2aGZm6pdxjut0VSEDXFPCee/mNjcNOLuZuqocF7
	4TfgsI6MaYyQ+Fodr2Ge46ipcSgx7JwaF1g95GBfSvkG9A183rwgwz4di0iXDAFJfBf9pcpW14ZQR
	wJ+TIP/ZkRWrdElbOcuIHsrqABnYGKM96Ga62maBwxpHC1DgTVnWfL+huwIhZrkN6ZuECvOB9hBb9
	bi+7EDUR8W6VkJcPu55YbKhs0oSsYFZOOQswDYaYts0wlLHPZfIrJ6ysDGwn4ew5CJnlmRt0sYuTY
	8W4oGP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taF21-000000082fH-2a4z;
	Tue, 21 Jan 2025 14:15:05 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taEzm-000000082Jv-3Agr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 14:12:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737468762; x=1738073562; i=w_armin@gmx.de;
	bh=x9XPqJuiHeFmslhn9JxO368mOzb+Ow/0VyVvRzkFXq8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MDqCQlCdqWzm/hmvYobAfB9qMdYiVG/+SV6HE44ptNrMa7fPH89+BSunDp0VnhCg
	 ueUZwkDISyhqV3kRR+IEGINYM971J8nibhiOxQQz6Ts87WEmrboCx5Q0+qWy9WZCc
	 +4fCtS2fvLdlo1L89qZ0UbQOz9i9eesXLPYz6hQVsD1oBZfO6ZNifyvd2bfVQiJWg
	 /XsZ6buKUeKSUOGlXwYjRBlUMIw8haxFvg/icclaK5eeG1h6XRlKWQwjPkA0GBQri
	 qgEK12MEpnWiluunyzlmRFvTRFsFhVeq1FcVd3PN2Lio4Ky6HLSHgUEcYsiSEutF1
	 E/9WC/CLr/7V/rn87g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.253.70]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M72sP-1taWdZ1wwp-00Gegp; Tue, 21
 Jan 2025 15:12:42 +0100
Message-ID: <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
Date: Tue, 21 Jan 2025 15:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: Huisong Li <lihuisong@huawei.com>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org, oss-drivers@corigine.com,
 linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linuxarm@huawei.com, linux@roeck-us.net, jdelvare@suse.com,
 kernel@maidavale.org, pauk.denis@gmail.com, james@equiv.tech,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matt@ranostay.sg,
 mchehab@kernel.org, irusskikh@marvell.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
 louis.peens@corigine.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 kabel@kernel.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 alexandre.belloni@bootlin.com, krzk@kernel.org, jonathan.cameron@huawei.com,
 zhanjie9@hisilicon.com, zhenglifeng1@huawei.com, liuyonglong@huawei.com
References: <20250121064519.18974-1-lihuisong@huawei.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250121064519.18974-1-lihuisong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:7/G4V4KAu+etM0B4X0zIj2cDFjln5bReWl7v+Totq/edMUjLLWH
 zFxOxapMoT9n+dnxkeWM2B7x42rqhWIweUhJVly4GKBKa6ntyoArNQMzhbAoj4MypZHxKRZ
 MZ7sYbMHuTiMO5RIoulxNqBUkyxCBvXKK6z4e1cszmQPsyyCxDDCT4ORExJtlnvH3VRF5o4
 uIZg7LKg/5IPk3gEfBLIA==
UI-OutboundReport: notjunk:1;M01:P0:MdsFvjde5OI=;8iUQeccSnXW5OExW3MOjjqo608U
 UuPKnTXIMhIjDOxJ+WxeghaG1nPUqAsDE/BjwU/Mysu3bnhhYioKopErLT2SfiADnTSdcyaqf
 lVQOMw22z304wvfrsk43KmXoKdq/BwVuE0Zz8wYAP+Yb3pYas/gTSMdNDVzJVzONiC72ubmgV
 IUXLJquxGfcmg9WV8Dp4azyvMXAFT3YEwDdR52oNEL+4lJOhqf4V/8sjK8clPyVYAn3DryMR/
 5bHa64QNwxLIQJQbuvJM2sF99WqJaoiHMrlyeMAH2V9ul68wbmAHoH+kRwFtHc4mlfe7elHJu
 CGPi+z/yyIg0zPbkf5ydl5/9lXXWd5z6+eg/AhkfiuNM9qoIehuUxC0lbsszsNl58M2soUhRn
 kDP94KQnM931rMnb2rWaIqfZ/Jqx3MXZuo1GCVO0753AiPtblQnoDwa8xTBvuqfEYLLn/j/Hw
 clp4La2uS3Q6ZTDxKWg8hYrAU3NI7pGq9MBnieyvZZkZHxi37YOLOSDBxbmP0xWXMcQjZLh5B
 8HbxeuJq9ZwF+GNreUQaJ6uxYjm+1Me+d5uQq2vU1KZ4hiS4eAxHDZxagO00YnQ8jhrA4A58c
 hW0GuK0qcEUIdvMIoNeJzdaHG8Wquu2PU38Gi174EJcYFbc+hCYa6fzomkm3BoRSFINHtucBR
 iZSVXByjDliubDqy7S+7veGcCIHiKFVK+SXIaKFuKfpL+sfq1UPMRN4bWkGCx/gnvHhSPeuYb
 JFUNwaiwTbrp4RQLNx4yX14GVD+6BIO/41XrYbZR9Xsl4uQw1WlULfIYwXvfQufGdir/+WNO0
 SHU6jGxsIkJchVwfTKCaaQCsjjLrdDaCmwI+X1aBJFWWoUPb8cMGRkU7NPOmxc5VNrwsk4Z5n
 PvbVA218nKmUBTd/uiZ64RN+UuLpT1azGjWkuBz2afSuOUp4OYOXJ9yZkUQMXf/uTrIUt/01c
 2NzAGMd/GxrqlibB4O2KU4SArZzSsJUeKsNqPCWjmx3fp7DCEMRkXy/EpNfujE6YInjG+Uqh6
 s66ljRjsyPKRO96kwxCe+B/t6Q9iAjpYB9K07Rpigzh6hS78z0aSvk6Y7Svkml2x5QmYwH1Fh
 CDPfE/CkYFrBjBHC/e2fnGPqYtZ4J05oC+xVpnLH0dXGjaNw02cZYwLSU2P06ikk55MO5xkXz
 sASz0ETR5PmRBRcDYspQgn9PkWEZN6Qtu07Rzupwncw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_061247_089390_39DA3406 
X-CRM114-Status: GOOD (  17.71  )
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

Am 21.01.25 um 07:44 schrieb Huisong Li:

> The hwmon_device_register() is deprecated. When I try to repace it with
> hwmon_device_register_with_info() for acpi_power_meter driver, I found that
> the power channel attribute in linux/hwmon.h have to extend and is more
> than 32 after this replacement.
>
> However, the maximum number of hwmon channel attributes is 32 which is
> limited by current hwmon codes. This is not good to add new channel
> attribute for some hwmon sensor type and support more channel attribute.
>
> This series are aimed to do this. And also make sure that acpi_power_meter
> driver can successfully replace the deprecated hwmon_device_register()
> later.

Hi,

what kind of new power attributes do you want to add to the hwmon API?

AFAIK the acpi-power-meter driver supports the following attributes:

	power1_accuracy			-> HWMON_P_ACCURACY
	power1_cap_min			-> HWMON_P_CAP_MIN
	power1_cap_max			-> HWMON_P_CAP_MAX
	power1_cap_hyst			-> HWMON_P_CAP_HYST
	power1_cap			-> HWMON_P_CAP
	power1_average			-> HWMON_P_AVERAGE
	power1_average_min		-> HWMON_P_AVERAGE_MIN
	power1_average_max		-> HWMON_P_AVERAGE_MAX
	power1_average_interval		-> HWMON_P_AVERAGE_INTERVAL
	power1_average_interval_min	-> HWMON_P_AVERAGE_INTERVAL_MIN
	power1_average_interval_max	-> HWMON_P_AVERAGE_INTERVAL_MAX
	power1_alarm			-> HWMON_P_ALARM
	power1_model_number
	power1_oem_info
	power1_serial_number
	power1_is_battery
	name				-> handled by hwmon core

The remaining attributes are in my opinion not generic enough to add them to the generic
hwmon power attributes. I think you should implement them as a attribute_group which can
be passed to hwmon_device_register_with_info() using the "extra_groups" parameter.

Thanks,
Armin Wolf

>
> Huisong Li (21):
>    hwmon: Fix the type of 'config' in struct hwmon_channel_info to u64
>    media: video-i2c: Use HWMON_CHANNEL_INFO macro to simplify code
>    net: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>    net: nfp: Use HWMON_CHANNEL_INFO macro to simplify code
>    net: phy: marvell: Use HWMON_CHANNEL_INFO macro to simplify code
>    net: phy: marvell10g: Use HWMON_CHANNEL_INFO macro to simplify code
>    rtc: ab-eoz9: Use HWMON_CHANNEL_INFO macro to simplify code
>    rtc: ds3232: Use HWMON_CHANNEL_INFO macro to simplify code
>    w1: w1_therm: w1: Use HWMON_CHANNEL_INFO macro to simplify code
>    net: phy: aquantia: Use HWMON_CHANNEL_INFO macro to simplify code
>    hwmon: (asus_wmi_sensors) Fix type of 'config' in struct
>      hwmon_channel_info to u64
>    hwmon: (hp-wmi-sensors) Fix type of 'config' in struct
>      hwmon_channel_info to u64
>    hwmon: (mr75203) Fix the type of 'config' in struct hwmon_channel_info
>      to u64
>    hwmon: (pwm-fan) Fix the type of 'config' in struct hwmon_channel_info
>      to u64
>    hwmon: (scmi-hwmon) Fix the type of 'config' in struct
>      hwmon_channel_info to u64
>    hwmon: (tmp401) Fix the type of 'config' in struct hwmon_channel_info
>      to u64
>    hwmon: (tmp421) Fix the type of 'config' in struct hwmon_channel_info
>      to u64
>    net/mlx5: Fix the type of 'config' in struct hwmon_channel_info to u64
>    platform/x86: dell-ddv: Fix the type of 'config' in struct
>      hwmon_channel_info to u64
>    hwmon: (asus-ec-sensors) Fix the type of 'config' in struct
>      hwmon_channel_info to u64
>    hwmon: (lm90) Fix the type of 'config' in struct hwmon_channel_info to
>      u64
>
>   drivers/hwmon/asus-ec-sensors.c               |   6 +-
>   drivers/hwmon/asus_wmi_sensors.c              |   8 +-
>   drivers/hwmon/hp-wmi-sensors.c                |   6 +-
>   drivers/hwmon/hwmon.c                         |   4 +-
>   drivers/hwmon/lm90.c                          |   4 +-
>   drivers/hwmon/mr75203.c                       |   6 +-
>   drivers/hwmon/pwm-fan.c                       |   4 +-
>   drivers/hwmon/scmi-hwmon.c                    |   6 +-
>   drivers/hwmon/tmp401.c                        |   4 +-
>   drivers/hwmon/tmp421.c                        |   2 +-
>   drivers/media/i2c/video-i2c.c                 |  12 +-
>   .../ethernet/aquantia/atlantic/aq_drvinfo.c   |  14 +-
>   .../net/ethernet/mellanox/mlx5/core/hwmon.c   |   8 +-
>   .../net/ethernet/netronome/nfp/nfp_hwmon.c    |  40 +--
>   drivers/net/phy/aquantia/aquantia_hwmon.c     |  32 +-
>   drivers/net/phy/marvell.c                     |  24 +-
>   drivers/net/phy/marvell10g.c                  |  24 +-
>   drivers/platform/x86/dell/dell-wmi-ddv.c      |   6 +-
>   drivers/rtc/rtc-ab-eoz9.c                     |  24 +-
>   drivers/rtc/rtc-ds3232.c                      |  24 +-
>   drivers/w1/slaves/w1_therm.c                  |  12 +-
>   include/linux/hwmon.h                         | 300 +++++++++---------
>   22 files changed, 205 insertions(+), 365 deletions(-)
>

