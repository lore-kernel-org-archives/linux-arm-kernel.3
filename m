Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E8EC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 03:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAyDKAK1rz2PpQOq5hEJgQ7NhABJsydRXG26xd7jJH0=; b=q2SUBR8thlFO7aNkZ+zeSD2qqU
	mgHi1aWldELIEB6uF2GWMI1KZFJx73EmdYXYH0BOoUeAtDSPhJYeqbr6ECKjNhcg9jiXmmZras+q/
	m/s6/EyLXYv2ejazoNZxDOcjkU6bofgzp5jKQ4hrCNt0APaYZqzLsN7pnm5qpvUV73nFgVQKWZ+Xk
	bGxzAV9koDsgbHM36Vu7ywB6/aHmHwzIkcobjUGmMoid0q6Wo6zDVT7xfPZRkYXO8FtFZBMy1QVg4
	7Pi31a2QC83uUKaqtWLMrn1FL3Au58kiHw/Vo7MAUfat9Hz0wMz13cueOWQX662A6OSFJLizTfoV0
	TkD1XJZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taRYm-00000009KfU-14WC;
	Wed, 22 Jan 2025 03:37:44 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taRXU-00000009KQb-2rwR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 03:36:25 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Yd8ps518lz1JHkG;
	Wed, 22 Jan 2025 11:35:17 +0800 (CST)
Received: from dggemv703-chm.china.huawei.com (unknown [10.3.19.46])
	by mail.maildlp.com (Postfix) with ESMTPS id CA4FD180044;
	Wed, 22 Jan 2025 11:36:17 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 Jan 2025 11:36:17 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 22 Jan
 2025 11:36:15 +0800
Message-ID: <c7cdc9cb-e10f-097e-bd53-bca9b3e2c8d4@huawei.com>
Date: Wed, 22 Jan 2025 11:36:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
To: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>,
	<linux-hwmon@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
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
	<hkallweit1@gmail.com>, <linux@armlinux.org.uk>, <kabel@kernel.org>,
	<hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<alexandre.belloni@bootlin.com>, <krzk@kernel.org>,
	<jonathan.cameron@huawei.com>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <liuyonglong@huawei.com>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
 <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
 <fd412ce2-ec40-fe73-6b1b-284a99a39f12@huawei.com>
 <b965f04e-a706-4abf-89ed-4749a2c0b9b9@roeck-us.net>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <b965f04e-a706-4abf-89ed-4749a2c0b9b9@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.121.59]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemn100009.china.huawei.com (7.202.194.112)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_193624_899706_210AFB10 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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


在 2025/1/22 11:19, Guenter Roeck 写道:
> On 1/21/25 18:52, lihuisong (C) wrote:
>
>>> Those are not hwmon attributes and should not be (or have been) exposed
>>> as sysfs attributes in the first place, but (if really wanted/needed)
>>> through debugfs files. Even _if_ exposed as sysfs attributes they 
>>> should
>>> not have the power1_ prefix (except maybe for the last one).
>> I plan to accept the suggestion Armin proposed that acpi_power_meter 
>> can use the "extra_groups" parameter for these "not generic hwmon 
>> power attributes".
>> Should we drop the power1_ prefix? But this will lead to the change 
>> of these attributes.
>> Do you mean 'power1_is_battery' can be added to hwmon power 
>> attributes in hwmon.h?
>
> No; power1_is_battery is still not a hardware monitoring attribute,
> much less one to standardize. Also, don't change any attribute names.
> They are wrong, but they are the ABI for this driver.
>
Ok, it's clear now.
> .

