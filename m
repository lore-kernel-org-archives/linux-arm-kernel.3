Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8991C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAcmbEg4lP/YYaPl+kZi3CqP1gal7Vkehy2RJ4E0NKg=; b=Z/cJ0i/nETcWmSLKxX4vg3LV7O
	hWO4GsRbfqokZgyzuHG6HBglhKokVuy0sKslNM8tXKITas/m+3ifWEQgMlozo2WkNhAwA1Zmo0BoV
	GcnJ0DFjauCoPITY6180EibT3jCiJwtX4guAbdj0ot3tQcvXI7a7YZijc68LQV0NT1wl6bqxRA526
	7jz6PrV8RRXNalOFZUwnwHtO9OnoRB1SHtAaFKGYTOUPzeuPb0UjJnf74jyRUNBMoGyHRo16E4lvt
	CnCmoZVMIFQff52GDbrbvfd+hOELHUeHUzGZznURnA5HQOY/nVbm26s1DFbeglXtEBqBYH0p+vIwz
	r/iQH51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFNs-0000000F7CP-48hV;
	Fri, 11 Jul 2025 15:09:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF6F-0000000F4Au-3OY9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:51:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bdvhz6gzzz6L55l;
	Fri, 11 Jul 2025 22:48:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 43D00140279;
	Fri, 11 Jul 2025 22:51:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Jul
 2025 16:51:37 +0200
Date: Fri, 11 Jul 2025 15:51:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Arnd Bergmann <arnd@kernel.org>
CC: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Cristian Marussi <cristian.marussi@arm.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: convert to SYSTEM_SLEEP_PM_OPS
Message-ID: <20250711155136.00000fdf@huawei.com>
In-Reply-To: <20250709070107.1388512-1-arnd@kernel.org>
References: <20250709070107.1388512-1-arnd@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075143_995888_B4DB169C 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed,  9 Jul 2025 09:01:01 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The old SET_SYSTEM_SLEEP_PM_OPS() macro leads to a warning about an
> unused function:
> 
> drivers/firmware/arm_scmi/scmi_power_control.c:363:12: error: 'scmi_system_power_resume' defined but not used [-Werror=unused-function]
>   363 | static int scmi_system_power_resume(struct device *dev)
> 
> The proper way to do this these days is to use SYSTEM_SLEEP_PM_OPS()
> and pm_sleep_ptr().
> 
> Fixes: 9a0658d3991e ("firmware: arm_scmi: power_control: Ensure SCMI_SYSPOWER_IDLE is set early during resume")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/firmware/arm_scmi/scmi_power_control.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
> index ab0cee0d4bec..955736336061 100644
> --- a/drivers/firmware/arm_scmi/scmi_power_control.c
> +++ b/drivers/firmware/arm_scmi/scmi_power_control.c
> @@ -369,7 +369,7 @@ static int scmi_system_power_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops scmi_system_power_pmops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
> +	SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
>  };

As a possible followup IIRC we have a macro for this

static DEFINE_SIMPLE_DEV_PM_OPS(scmi_system_power_pmops,
				NULL, scmi_system_power_resume);



>  
>  static const struct scmi_device_id scmi_id_table[] = {
> @@ -380,7 +380,7 @@ MODULE_DEVICE_TABLE(scmi, scmi_id_table);
>  
>  static struct scmi_driver scmi_system_power_driver = {
>  	.driver	= {
> -		.pm = &scmi_system_power_pmops,
> +		.pm = pm_sleep_ptr(&scmi_system_power_pmops),
>  	},
>  	.name = "scmi-system-power",
>  	.probe = scmi_syspower_probe,


