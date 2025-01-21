Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A06C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5q9yQxZ7qCRWB5N9g0tbP/E5H3IqId9T8M1S/6gGqmU=; b=maffQf9k7R/hm6QWTcbWybgA/+
	9JnE7C5jWMIMvsD9L7pSiDPFD2QW8O7KXEWIeZnNdiWnMi2+JBRPpDf8Uu305VVsib/VyGd0meSLe
	V+KPx4GTH+DLo9iNpUUfK7vz92PUEcT5mpVHTELtDeaUBxx8GF8e+w/BtiDG9Jv2R4dgJ3/bY1MF4
	qQqSPTAG8k58QjR2AokKsN2ZdsOgIclVW67ydYKzyYkwRzLN4UzTqBTZFnSCGlde6TdVhwU/9fPZF
	gmjrE6wOjQFyjUfmsnscZCQgJeBIC4XooVjRptgxbTm+Glxrr334IHVX2rF9OJe/Lp6orm7DWEct+
	GupzvwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHwV-00000008Sfm-1FP8;
	Tue, 21 Jan 2025 17:21:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHvD-00000008SSg-10sT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 17:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5q9yQxZ7qCRWB5N9g0tbP/E5H3IqId9T8M1S/6gGqmU=; b=GciTIOuOH+7z6FIEQSCiuQWUdn
	Lac+a6Qas11PDpxfxikk9qKlgXiCCFtlMzAJe1E6UlpZbRM/x8QIuP107azsvGn60uKyXwEKhcfGg
	F2PDh74Iymh0jzLQOgqvUgqL6eb0J0yolXdifkFiIM4/+I2erxk+OTvJlAZOCp9raslRcnSoLHHn4
	MIa/v697Xq5DdoMXB5BqyasXJe2KNdGofqbYniMIiOvWQsPl0WF2vxFy4eB3fQIwgT49n0d9JQtLy
	BwESQqcEeDE2DrTRQIIvAVPJRj5jzu8cz+Kn4frH+wrQH89A/GjBRfrVtvZfl6qXufO5On9XJUF2l
	gHmPPi+g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53924)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1taHv3-0007VH-2A;
	Tue, 21 Jan 2025 17:20:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1taHuz-00044S-29;
	Tue, 21 Jan 2025 17:20:01 +0000
Date: Tue, 21 Jan 2025 17:20:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>, Huisong Li <lihuisong@huawei.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, netdev@vger.kernel.org,
	linux-rtc@vger.kernel.org, oss-drivers@corigine.com,
	linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linuxarm@huawei.com, jdelvare@suse.com, kernel@maidavale.org,
	pauk.denis@gmail.com, james@equiv.tech, sudeep.holla@arm.com,
	cristian.marussi@arm.com, matt@ranostay.sg, mchehab@kernel.org,
	irusskikh@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
	louis.peens@corigine.com, hkallweit1@gmail.com, kabel@kernel.org,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	alexandre.belloni@bootlin.com, krzk@kernel.org,
	jonathan.cameron@huawei.com, zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com, liuyonglong@huawei.com
Subject: Re: [PATCH v1 00/21] hwmon: Fix the type of 'config' in struct
 hwmon_channel_info to u64
Message-ID: <Z4_XQQ0tkD1EkOJ4@shell.armlinux.org.uk>
References: <20250121064519.18974-1-lihuisong@huawei.com>
 <03b138e9-688f-4ebc-bd01-3d54fd20e525@gmx.de>
 <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9add68ac-7d10-4011-9da8-1f2de077d3e9@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_092015_287899_0D7A2676 
X-CRM114-Status: GOOD (  24.73  )
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

On Tue, Jan 21, 2025 at 06:50:00AM -0800, Guenter Roeck wrote:
> On 1/21/25 06:12, Armin Wolf wrote:
> > Am 21.01.25 um 07:44 schrieb Huisong Li:
> > > The hwmon_device_register() is deprecated. When I try to repace it with
> > > hwmon_device_register_with_info() for acpi_power_meter driver, I found that
> > > the power channel attribute in linux/hwmon.h have to extend and is more
> > > than 32 after this replacement.
> > > 
> > > However, the maximum number of hwmon channel attributes is 32 which is
> > > limited by current hwmon codes. This is not good to add new channel
> > > attribute for some hwmon sensor type and support more channel attribute.
> > > 
> > > This series are aimed to do this. And also make sure that acpi_power_meter
> > > driver can successfully replace the deprecated hwmon_device_register()
> > > later.
> 
> This explanation completely misses the point. The series tries to make space
> for additional "standard" attributes. Such a change should be independent
> of a driver conversion and be discussed on its own, not in the context
> of a new driver or a driver conversion.

I think something needs to budge here, because I think what you're
asking is actually impossible!

One can't change the type of struct hwmon_channel_info.config to be a
u64 without also updating every hwmon driver that assigns to that
member.

This is not possible:

 struct hwmon_channel_info {
         enum hwmon_sensor_types type;
-        const u32 *config;
+        const u64 *config;
 };

static u32 marvell_hwmon_chip_config[] = {
...
};

static const struct hwmon_channel_info marvell_hwmon_chip = {
        .type = hwmon_chip,
        .config = marvell_hwmon_chip_config,
};

This assignment to .config will cause a warning/error with the above
change. If instead we do:

-	.config = marvell_hwmon_chip_config,
+	.config = (u64 *)marvell_hwmon_chip_config,

which would have to happen to every driver, then no, this also doesn't
work, because config[1] now points beyond the bounds of
marvell_hwmon_chip_config, which only has two u32 entries.

You can't just change the type of struct hwmon_channel_info.config
without patching every driver that assigns to
struct hwmon_channel_info.config as things currently stand.

The only way out of that would be:

1. convert *all* drivers that defines a config array to be defined by
   their own macro in hwmon.h, and then switch that macro to make the
   definitions be a u64 array at the same time as switching struct
    hwmon_channel_info.config

2. convert *all* drivers to use HWMON_CHANNEL_INFO() unconditionally,
   and switch that along with struct hwmon_channel_info.config.

3. add a new member to struct hwmon_channel_info such as
   "const u64 *config64" and then gradually convert drivers to use it.
   Once everyone is converted over, then remove "const u32 *config",
   optionally rename "config64" back to "config" and then re-patch all
   drivers. That'll be joyful, with multiple patches to drivers that
   need to be merged in sync with hwmon changes - and last over several
   kernel release cycles.

This is not going to be an easy change!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

