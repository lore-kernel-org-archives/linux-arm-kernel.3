Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF39CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bg8Oys3ldqONp1rkDm9KHUE8Nsow8X5TQBNQvmAkmM=; b=jdATbWc+TXSlheRWLENq/1MGzD
	mH5K1+Dc0H1MeKvVvH28yrAbztI1re67AosoYmii+DEHlU0WHh2engxQoRGxqmnlMj6FOO2NMqPFh
	575zzrobFbMZY2RAZrZ8f68TLnCbvVA/yWj7R1AMT3JMlbNFCmKq4q+iqsKqiIBk5yMlUoBkakRPy
	0/aCXjObTmPpaRsKpP/8ULxWq2jFh/7/j2VBwsJDeGQGJwKk9JpPor6obQsqsob/FCxNE9qel8VkB
	n6Or+Qjt6nu2EJlk42iEMcTdxUTZ1KwOqotQgcv9ROA2zVGgDw2O8rk1HtEqvsTIjvz+Rc92wCeZw
	3iGUl/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zVg-0000000Cxux-36sP;
	Tue, 23 Sep 2025 09:40:32 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zVd-0000000CxuR-3qoL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 09:40:31 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58N9eMLE1427212;
	Tue, 23 Sep 2025 04:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758620422;
	bh=8bg8Oys3ldqONp1rkDm9KHUE8Nsow8X5TQBNQvmAkmM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gyx6BDujLPlhRSIYt1R2kGpS4iOH9Y3YRjwHY/C0QD8H6fmioS4w69VaCpOB71bsx
	 /0tshFMmA7o5ZscQu5RjfNcJEDv4SObCuipjI1YnIz4lnrDlalxaIaQwTR02DdX3gD
	 W1GsRLHs0bPL0l+QWJjZUco4UENx+pJHvJ5WKfV0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58N9eMnJ986154
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 04:40:22 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 04:40:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 04:40:21 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58N9eKtg101593;
	Tue, 23 Sep 2025 04:40:21 -0500
Date: Tue, 23 Sep 2025 15:10:20 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Peng Fan <peng.fan@nxp.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha
 Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 1/5] PM: wakeup: Add out-of-band system wakeup support
 for devices
Message-ID: <20250923094020.ogc2nr5nxryxoavq@lcpd911>
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
 <20250922-pm-v4-v4-1-ef48428e8fe0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250922-pm-v4-v4-1-ef48428e8fe0@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_024030_090195_58CC4C3D 
X-CRM114-Status: GOOD (  13.85  )
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

On Sep 22, 2025 at 10:21:06 +0800, Peng Fan wrote:
> Some devices can wake up the system from suspend even when their power
> domains are turned off. This is possible because their system-wakeup logic
> resides in an always-on power domain - indicating that they support
> out-of-band system wakeup.
> 
> Currently, PM domain core doesn't power off such devices if they are marked
> as system wakeup sources. To better represent devices with out-of-band

This commit message makes things much clearer now. Thanks!

> wakeup capability, this patch introduces a new flag out_band_wakeup in
> 'struct dev_pm_info'.
> 
> Two helper APIs are added:
>  - device_set_out_band_wakeup() - to mark a device as having out-of-band
>    wakeup capability.
>  - device_out_band_wakeup() - to query the flag.
> 
> Allow the PM core and drivers to distinguish between regular and
> out-of-band wakeup sources, enable more accurate power management decision.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

