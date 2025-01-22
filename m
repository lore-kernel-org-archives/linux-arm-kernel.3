Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B897AC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 04:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awdK9ex/VzmZRt8TV9W8S0wQ5FMA9hTLwQgPFZrcPE8=; b=eFUdFtPikAAzpT6MDX07yuw5Q/
	Ujvw8cdRUX4aLFJn8U7BbC0Qe+nI/+spXtybHFhs9CkxPeRZyWmF/Ym7qdVxCMmJNQDQ/gExLSXdz
	fFZRMp8ssC14bdfVahXu2DrLVgZHeJQbwr2sfM6Sit5BB7HCOSx6e122r5JOKQ2doq0o2dRzDOhQW
	mUQLuzYE6EXw0lLOU6GQJHEyrtCnjwPW3Rhpubn61A8v+GujruckagVhM32jLkNQ34JhkzJENzcLM
	y+d00sI8v/WX+lBtpQXGby+IU1vxBtmulr72GDDLp72SxhWUj5C4R5rG/EQEj1CuskFyEgj2cT0Vt
	JRBR92gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taS2A-00000009M8D-2C1w;
	Wed, 22 Jan 2025 04:08:06 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taS0q-00000009LxA-3fHJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 04:06:46 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Yd9WR3cwTz20p8h;
	Wed, 22 Jan 2025 12:06:59 +0800 (CST)
Received: from dggemv711-chm.china.huawei.com (unknown [10.1.198.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D1DE14013B;
	Wed, 22 Jan 2025 12:06:34 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 Jan 2025 12:06:33 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 22 Jan
 2025 12:06:32 +0800
Message-ID: <15d63183-3bdb-e934-a68d-393ae2dcb8ea@huawei.com>
Date: Wed, 22 Jan 2025 12:06:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Guenter Roeck
	<linux@roeck-us.net>
CC: Armin Wolf <W_Armin@gmx.de>, <linux-hwmon@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <arm-scmi@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<oss-drivers@corigine.com>, <linux-rdma@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linuxarm@huawei.com>,
	<jdelvare@suse.com>, <kernel@maidavale.org>, <pauk.denis@gmail.com>,
	<james@equiv.tech>, <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
	<matt@ranostay.sg>, <mchehab@kernel.org>, <irusskikh@marvell.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <saeedm@nvidia.com>,
	<leon@kernel.org>, <tariqt@nvidia.com>, <louis.peens@corigine.com>,
	<hkallweit1@gmail.com>, <kabel@kernel.org>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <alexandre.belloni@bootlin.com>,
	<krzk@kernel.org>, <jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
 <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
 <Z4_XQQ0tkD1EkOJ4@shell.armlinux.org.uk>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <Z4_XQQ0tkD1EkOJ4@shell.armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_200645_286490_107111FF 
X-CRM114-Status: GOOD (  32.81  )
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

Hi

在 2025/1/22 1:20, Russell King (Oracle) 写道:
> On Tue, Jan 21, 2025 at 06:50:00AM -0800, Guenter Roeck wrote:
>> On 1/21/25 06:12, Armin Wolf wrote:
>>> Am 21.01.25 um 07:44 schrieb Huisong Li:
>>>> The hwmon_device_register() is deprecated. When I try to repace it with
>>>> hwmon_device_register_with_info() for acpi_power_meter driver, I found that
>>>> the power channel attribute in linux/hwmon.h have to extend and is more
>>>> than 32 after this replacement.
>>>>
>>>> However, the maximum number of hwmon channel attributes is 32 which is
>>>> limited by current hwmon codes. This is not good to add new channel
>>>> attribute for some hwmon sensor type and support more channel attribute.
>>>>
>>>> This series are aimed to do this. And also make sure that acpi_power_meter
>>>> driver can successfully replace the deprecated hwmon_device_register()
>>>> later.
>> This explanation completely misses the point. The series tries to make space
>> for additional "standard" attributes. Such a change should be independent
>> of a driver conversion and be discussed on its own, not in the context
>> of a new driver or a driver conversion.
> I think something needs to budge here, because I think what you're
> asking is actually impossible!
>
> One can't change the type of struct hwmon_channel_info.config to be a
> u64 without also updating every hwmon driver that assigns to that
> member.
>
> This is not possible:
>
>   struct hwmon_channel_info {
>           enum hwmon_sensor_types type;
> -        const u32 *config;
> +        const u64 *config;
>   };
>
> static u32 marvell_hwmon_chip_config[] = {
> ...
> };
>
> static const struct hwmon_channel_info marvell_hwmon_chip = {
>          .type = hwmon_chip,
>          .config = marvell_hwmon_chip_config,
> };
>
> This assignment to .config will cause a warning/error with the above
> change. If instead we do:
>
> -	.config = marvell_hwmon_chip_config,
> +	.config = (u64 *)marvell_hwmon_chip_config,
>
> which would have to happen to every driver, then no, this also doesn't
> work, because config[1] now points beyond the bounds of
> marvell_hwmon_chip_config, which only has two u32 entries.
>
> You can't just change the type of struct hwmon_channel_info.config
> without patching every driver that assigns to
> struct hwmon_channel_info.config as things currently stand.
>
> The only way out of that would be:
>
> 1. convert *all* drivers that defines a config array to be defined by
>     their own macro in hwmon.h, and then switch that macro to make the
>     definitions be a u64 array at the same time as switching struct
>      hwmon_channel_info.config
>
> 2. convert *all* drivers to use HWMON_CHANNEL_INFO() unconditionally,
>     and switch that along with struct hwmon_channel_info.config.
>
> 3. add a new member to struct hwmon_channel_info such as
>     "const u64 *config64" and then gradually convert drivers to use it.
>     Once everyone is converted over, then remove "const u32 *config",
>     optionally rename "config64" back to "config" and then re-patch all
>     drivers. That'll be joyful, with multiple patches to drivers that
>     need to be merged in sync with hwmon changes - and last over several
>     kernel release cycles.
>
> This is not going to be an easy change!
Yeah, it's a very time-consuming method and not easy to change.

Although some attributes of acpi_power_meter, like power1_model_number, 
can not add to the generic hwmon power attributes,
I still don't think the maximum attribute number of one sensor type 
doesn't need to limit to 32.
We can not make sure that the current generic attributes can fully 
satisfy the useage in furture.


I got an idea. it may just need one patch in hwmon core, like the following:

-->

  struct hwmon_channel_info {
         enum hwmon_sensor_types type;
-       const u32 *config;
+       union {
+               const u32 *config;
+               const u64 *config64;
+       }
  };

  #define HWMON_CHANNEL_INFO(stype, ...)         \
@@ -444,12 +447,22 @@ struct hwmon_channel_info {
                 }                               \
         })

+#define HWMON_CHANNEL_INFO64(stype, ...)               \
+       (&(const struct hwmon_channel_info) {   \
+               .type = hwmon_##stype,          \
+               .config64 = (const u64 []) {    \
+                       __VA_ARGS__, 0          \
+               }                               \
+       })
+
+
  /**
   * struct hwmon_chip_info - Chip configuration
   * @ops:       Pointer to hwmon operations.
   * @info:      Null-terminated list of channel information.
   */
  struct hwmon_chip_info {
+       bool hwmon_attribute_bit64; // use config64 pointer if it is true.
         const struct hwmon_ops *ops;
         const struct hwmon_channel_info * const *info;
  };


For hwmon core code, we can use the 'config' or 'confit64' and compute 
attribute number based on the 'hwmon_attribute_bit64' value.
New driver can use HWMON_CHANNEL_INFO64 macro. Old drivers are not 
supposed to need to have any modification.

/Huisong
>

