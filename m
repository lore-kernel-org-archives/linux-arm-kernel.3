Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1920ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyBPtCHg5D/EjT8uTbQbLQ8LVoszQDo0Ue2taA2mz7k=; b=Fv/k4t8QIU3dufuUPm2tLHxMFj
	tRcxICq9QnnVYtjJC37oUqr/ap1B1zCDJVge7HI99HIM1W7nTG22azLYcilj8ApxkLy8K9Qjn80Az
	7ABYMMWOXDz05aau3sNZmlTQS1kcMBBeKR4IphBQZWspoq3IY3RFs8vmVS7elr+TZb2nFC7dZ/Hos
	fD2MvCgatEGZ1vKp4GzXUQ5WcrQEYJQGuZ+jlgBMYIcn+WiPq1Fd2wk0XurzUSpiokD0HW0QDFWlo
	z24mWIpxAfVL4HLQe+D7ux/P/yo0tDKSHSHiBV4D7Fr9moIonPTdCc7xOnp0qHJWJMZPynveuqR5e
	xFuaQdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zZe-0000000CyaF-2CD3;
	Tue, 23 Sep 2025 09:44:38 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zZT-0000000CyZN-2wPt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 09:44:30 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58N9iFhl965751;
	Tue, 23 Sep 2025 04:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758620655;
	bh=NyBPtCHg5D/EjT8uTbQbLQ8LVoszQDo0Ue2taA2mz7k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zH+DBw9jgG1XKscE5MCC6KXkbyh5nnikp6dGToCoShbQ00epKAy/o+fg1Hc7bJ8zm
	 12f5w4pBziulisj7Ae3nYS7/p9V6OvHx1FsLZglT66A3gX2WRE8o8sIEsAsmY4dowZ
	 gbkA/WbYZsRXDmKHwdkaQJ+5AaDRp+PL1gOsEPRQ=
Received: from DFLE206.ent.ti.com (dfle206.ent.ti.com [10.64.6.64])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58N9iFTE988034
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 Sep 2025 04:44:15 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Sep
 2025 04:44:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 04:44:14 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58N9iDEa4041921;
	Tue, 23 Sep 2025 04:44:14 -0500
Date: Tue, 23 Sep 2025 15:14:13 +0530
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
Subject: Re: [PATCH v4 2/5] PM: domains: Allow power-off for out-of-band
 wakeup-capable devices
Message-ID: <20250923094413.quvxrj2ru46qdjgb@lcpd911>
References: <20250922-pm-v4-v4-0-ef48428e8fe0@nxp.com>
 <20250922-pm-v4-v4-2-ef48428e8fe0@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250922-pm-v4-v4-2-ef48428e8fe0@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_024428_518256_9BC31F1F 
X-CRM114-Status: GOOD (  21.93  )
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

On Sep 22, 2025 at 10:21:07 +0800, Peng Fan wrote:
> Currently, if a device is configured as a system wakeup source, the PM
> domain core avoids powering off its power domain during system-wide
> suspend. However, this can lead to unnecessary power consumption,
> especially for devices whose wakeup logic resides in an always-on domain,
> i.e., devices with out-of-band wakeup capability.
> 
> To address this, add a check for device_out_band_wakeup() in
> genpd_finish_suspend(). If the device supports out-of-band wakeup, its
> power domain can be safely powered off, just like regular devices without
> wakeup enabled. And same check in genpd_finish_resume().

Seems very well structured now! Thanks.

> 
> This change improves power efficiency without compromising wakeup
> functionality.

On a lighter note-
This seems like an AI generated sentence to me :P

I've often seen LLMs throw around terms like improve code / power
efficiency, etc...

> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pmdomain/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 61c2277c9ce39fcd2f7e77df549626e49a4d5310..4925bc1c441078a8d38600192ee696bf550e80f0 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1545,7 +1545,8 @@ static int genpd_finish_suspend(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +	    !device_out_band_wakeup(dev))
>  		return 0;
>  
>  	if (genpd->dev_ops.stop && genpd->dev_ops.start &&
> @@ -1600,7 +1601,8 @@ static int genpd_finish_resume(struct device *dev,
>  	if (IS_ERR(genpd))
>  		return -EINVAL;
>  
> -	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
> +	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd) &&
> +	    !device_out_band_wakeup(dev))
>  		return resume_noirq(dev);

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

