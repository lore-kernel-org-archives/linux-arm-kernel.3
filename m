Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A89C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHBvQcOQPomOZhTlSjIL1XK/6X1vKagW1sUm3IufGls=; b=x9sZsnnaR7r66W9q6RhkSeK2Yz
	81/PsSzW3O8WauduQibxXX+D4CD9Po0175Qx8Hz3ep8nrCw5ZlLUr/cPUvAJPkGH9GhTHz9470yrn
	EEkmzF4LimzCpXsJd36bsvIuAt58pFzm6QoEc17hoCb1Umkz7v89UHJ+6tbFv9y9NeCUYd5n7yhSX
	AayQDp1Vz5Zq1fbfQ39YlvnlaqU7sk64AAEqURUdUKANOpKc4LUK7S/oURwslks7ujkQHhtzrPlIO
	I+bDwucGrDUZgiVw2Wo88qHKVO0rU34+RkJMJiWVyBWaDoMvx+FOIVPSCFctqMsBWFniC2VR9EYZy
	LYpeemIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taDFH-00000007qrx-10Xd;
	Tue, 21 Jan 2025 12:20:39 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taDDz-00000007qgI-0IsF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737461959; x=1768997959;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sPesZWYC0ulEJj/gesJPmVOOyLfPgsGZKiiMssRCLcU=;
  b=Pttwhbf9tGZYumaS81ufANHLlSyHu3jPA50qg4GQLL5p055GJr2igdO2
   q6shjvvFzZPFQZEfOqAMezdZK4jHGp+8dROKvFZlcQrB0vENFC+HwHOql
   WR6Je2+snL1NdRPkFpVd1F2FLo0E1qjuLh7LjI/j0p7Uq/J9fbK3TuHnk
   m8JwwdkOc4tXPudnWwnmdlGpSn0j78BdZDmaWdMllW9zsNLKdDlRMm/U1
   czh3rh8LHm3YfaLyYy/U/czboDWKpz63Ta62ZzfAxmbfw3mANn3hfhVsN
   oOwBpCvbNsv75s0Vdexcrr1pPdSVGG7pv3lE9B91Fc6P8Pt/O3AGUm+qT
   Q==;
X-CSE-ConnectionGUID: xZz8rzzyRXecd8YmfiA1nA==
X-CSE-MsgGUID: 6Kwb79FUT4S97x1qRyo0aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="38115463"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38115463"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 04:19:14 -0800
X-CSE-ConnectionGUID: gH3zVvHuQEysE1CEtIUNmw==
X-CSE-MsgGUID: XYxDmMaMQhuYGVua7yV6Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="111790831"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 04:19:00 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 21 Jan 2025 14:18:56 +0200 (EET)
To: Huisong Li <lihuisong@huawei.com>
cc: linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    arm-scmi@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
    linux-rtc@vger.kernel.org, oss-drivers@corigine.com, 
    linux-rdma@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    linuxarm@huawei.com, linux@roeck-us.net, jdelvare@suse.com, 
    kernel@maidavale.org, pauk.denis@gmail.com, james@equiv.tech, 
    sudeep.holla@arm.com, cristian.marussi@arm.com, matt@ranostay.sg, 
    mchehab@kernel.org, irusskikh@marvell.com, andrew+netdev@lunn.ch, 
    davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
    pabeni@redhat.com, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
    louis.peens@corigine.com, hkallweit1@gmail.com, linux@armlinux.org.uk, 
    kabel@kernel.org, W_Armin@gmx.de, Hans de Goede <hdegoede@redhat.com>, 
    alexandre.belloni@bootlin.com, krzk@kernel.org, 
    jonathan.cameron@huawei.com, zhanjie9@hisilicon.com, 
    zhenglifeng1@huawei.com, liuyonglong@huawei.com
Subject: Re: [PATCH v1 19/21] platform/x86: dell-ddv: Fix the type of 'config'
 in struct hwmon_channel_info to u64
In-Reply-To: <20250121064519.18974-20-lihuisong@huawei.com>
Message-ID: <844c5097-eeb7-7275-7558-83ca4e5ee4b2@linux.intel.com>
References: <20250121064519.18974-1-lihuisong@huawei.com> <20250121064519.18974-20-lihuisong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_041919_119369_6001C6D1 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, 21 Jan 2025, Huisong Li wrote:

> The type of 'config' in struct hwmon_channel_info has been fixed to u64.
> Modify the related code in driver to avoid compiling failure.

Does this mean that after applying part of your series but not yet this 
patch, compile would fail? If so, it's unacceptable. At no point in a 
patch series are you allowed to cause a compile failure because it hinders 
'git bisect' that is an important troubleshooting tool.

So you might have to combine changes to drivers and API if you make an 
API change that breaks driver build until driver too is changed. Note that 
it will impact a lot how quickly your patches can be accepted as much 
higher level of coordination is usually required if your patch is touching 
things all over the place, but it cannot be avoided at times. And 
requirement of doing minimal change only will be much much higher in such 
a large scale change.

--
 i.

> Signed-off-by: Huisong Li <lihuisong@huawei.com>
> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index e75cd6e1efe6..efb2278aabb9 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -86,7 +86,7 @@ struct thermal_sensor_entry {
>  
>  struct combined_channel_info {
>  	struct hwmon_channel_info info;
> -	u32 config[];
> +	u64 config[];
>  };
>  
>  struct combined_chip_info {
> @@ -500,7 +500,7 @@ static const struct hwmon_ops dell_wmi_ddv_ops = {
>  
>  static struct hwmon_channel_info *dell_wmi_ddv_channel_create(struct device *dev, u64 count,
>  							      enum hwmon_sensor_types type,
> -							      u32 config)
> +							      u64 config)
>  {
>  	struct combined_channel_info *cinfo;
>  	int i;
> @@ -543,7 +543,7 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *w
>  							    struct dell_wmi_ddv_sensors *sensors,
>  							    size_t entry_size,
>  							    enum hwmon_sensor_types type,
> -							    u32 config)
> +							    u64 config)
>  {
>  	struct hwmon_channel_info *info;
>  	int ret;
> 

