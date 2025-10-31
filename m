Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7417CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 04:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hL6X2dib5gxWObO+IUAr7/ebtIOwZTsyaVCuihIOeyg=; b=boabrBVaIlccNSQTKXaL0Zl7OV
	LF69SoffEeI3wu25ddZJtqW0dtJOII2BUS6yswuL54rFU26ItiU/Jz2mK7xJBSFrxW8+GqYMLbQEl
	hp2fj87lKCah4TNRM0BIXTMs0v/92UYxPKF28tpUWUN29uM846PXOrKp78PIycE1iu8s4jCYBqx48
	s4aQ9iwAwYqakvNfDfmieCfoOhDarlnMzBoVwgOJuHJ8nERz9JJ8o+J5nu6sdd2VoFAFoysWPuA0j
	uRrSApdJIjxazFFXjZ+4DGMj80l4stHCCQz6GDEmm96cGTn/1IfVsaGu7SXcwePDNovesf75RFhmt
	Y5PW7eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgUT-00000005N3W-1GP7;
	Fri, 31 Oct 2025 04:11:53 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgUQ-00000005N2Z-2mdZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 04:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKNVRm/hpTjCXA5LGk2DCWRyM6M2mwdo6QuZS+lp90n2692cMRbK3TBJpGrKj9u0dTA5wsuxepYeOm3DTOvRKD23xThJDDkpK1eMNA5IIavOlCXY2CKVijtmZYIh+PDvzEQUt0/4oElx5WYsJOJSnPn7XRfnzRYaLYOnOv0DcOWJTGSlWYtrrsmJxk2aliEsUbZgq6fEf82XqTTAolBH/cdt+YDtuyUE9t1HpJO2grhJOLK+aWNoIPXL/Zq0g/QSunAee3aTUfaAidPTJ/k+uqheSEsvFZU/CWqTaz91l7ki4kP9gMkZDo82PG4qpIpSZSTLFcqaXmQAItocZtVSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hL6X2dib5gxWObO+IUAr7/ebtIOwZTsyaVCuihIOeyg=;
 b=TmZzfZdW+TrCnj152AfQAolXxmpreLFWgpPdT0Go9iA3AiY73WRFjlM1jJdIV++PT8O8C91AN4I7gwzWMznRR+5BLzdPrA1q+e/2RcTIx6AXzHq5TbbyvpxwXrsK5/mOee/ijBAHCx4pSZEJweOzN2PhebbfmyjwdJJ7jlMN/cAE+TIoG9zS8EJ2C6mzDFQaGhoLs75zjTW4uSquMXUWHcgxUpX5ZieDVZlEAWT+cCzJPp9mUulj0Rny6XtauUO7Zrh//LnQs+IFKs0cphU5l0so5DeOQH3ubeaht5hQ+9idaJgaexIngHN80f3YR0+uMrWh5DalYWuLVZHC8iARTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hL6X2dib5gxWObO+IUAr7/ebtIOwZTsyaVCuihIOeyg=;
 b=nPmfXkf4SF2VLscgB0nY9i+nPsXmfkUgjqfW6OLB5JpJBivaK6Hrna8c/ZBX3N3CdDZUnUthoF9ZEK/OzEkV7Ap2/YQXo7dzs7QANbtADw+AhQBGi/bXA5JnIJeVdhIDm7JK1WNI/oObaib/Offahn2xPSnswspuWibRNk2PNFc=
Received: from CH0PR04CA0058.namprd04.prod.outlook.com (2603:10b6:610:77::33)
 by SN4PR10MB5621.namprd10.prod.outlook.com (2603:10b6:806:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 04:11:47 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::3b) by CH0PR04CA0058.outlook.office365.com
 (2603:10b6:610:77::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 04:11:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 04:11:46 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 23:11:31 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 23:11:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 23:11:31 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59V4BVPt3248099;
	Thu, 30 Oct 2025 23:11:31 -0500
Date: Thu, 30 Oct 2025 23:11:31 -0500
From: Nishanth Menon <nm@ti.com>
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, Richard Genoud <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: ti_sci: replace ifdeffery by pm_sleep_ptr()
 macro
Message-ID: <20251031041131.3qmqfitiertc7vdp@scotch>
References: <20251014-ti-sci-pm-ops-cleanup-v1-1-70b50b73ac85@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014-ti-sci-pm-ops-cleanup-v1-1-70b50b73ac85@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|SN4PR10MB5621:EE_
X-MS-Office365-Filtering-Correlation-Id: b520bfd3-3e44-4b1d-743a-08de18339b4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sI4wOkUDkgw8K/iC6b8iIdVRPZ19yNgKNLWCUJwcX/aZk9R+X46Tz3m60dkO?=
 =?us-ascii?Q?EzyqdXnwC2eDvU5FeZxRGP+1Ar39i6O2tPUQ1SuFzBNv6vX/oZhiaf0e0tWK?=
 =?us-ascii?Q?R4p3IGZG8funPjjntc3YZBmtUTQtbKhZPBINqTbton047sanzzNsCPj6Jmka?=
 =?us-ascii?Q?dbZgiLN2lz7iTqbu+dRec/33r1Aceer55qQFpmVfpyb6fektKJRUrRj/Fffb?=
 =?us-ascii?Q?xhUUzNz3jqjFj9iS7F5fRWPItY0cR9Z9m4LobUFa5Ye2ehaQNyhY+s8SECg9?=
 =?us-ascii?Q?nLlUzN92ZIKicKDV+yV8x+X26oL9ErdBQ7IQxRipAHMJ4p8mScNsYLYx+mKr?=
 =?us-ascii?Q?fFoKOPkHrPm/pKCiJYChyBJvGCYBVG76eydCX0pHXtwL5z8u7Nc9nlT84RI/?=
 =?us-ascii?Q?A93C1sE4WK3NqrYFCA0pr4GMSAr2XyBMm7dpxYzfe9lm7MwWjJE2bz17uYFb?=
 =?us-ascii?Q?W0zJk4SCj/9AcPHipzegNQaXOycbcrtvz+Ohy4WnGUdArkHA86FMjbRsdqoA?=
 =?us-ascii?Q?KReMiUeQo3jtpdFoFL+d52a3au28/WtLqvDfzjFNjWdxj0i4eKkihaK/xnh4?=
 =?us-ascii?Q?4ADiqYz3J5ZtcvDyrpSUiIOJ4tRxzWWDmdVyGos4Zm0qLoF4ZsGvUthkGWgc?=
 =?us-ascii?Q?82tLAu4LvLzS6Q5ltHqrt9PDX1luyzwb7jQVySoZ5d8VwjlWz/v8KE5EW7c1?=
 =?us-ascii?Q?0k7DNHp3T8tWBQtSNcUXANAngjlHoGGR/Kyf3+HY32W5Dz32RCKYF1b1+tQ5?=
 =?us-ascii?Q?xZb2+8amtBiPc9+TiblkKyfXexioweG5wGM+q7X45soHT5AakZ50HQDE8tnc?=
 =?us-ascii?Q?VfCbnYscHUC6BNgnSfI8Tn/rtbWaivBBoJYSkjzlS9ojx3NTomBSifhZvcQg?=
 =?us-ascii?Q?qqGSfFmZ6NK/upwzidVD7FWL+0QDCXiRGR67Jp90963Yfy+eOyrdrNiXGujd?=
 =?us-ascii?Q?KsdmzcMZMuycSQ3iWUmbyOIfMRH38RZhONrRafpLhNmdO2e9J402fIltGNZb?=
 =?us-ascii?Q?zidR0gXTdGut/emiVCGnpGt7oGCe8O4ui3HUG6LMziOt8Cx3wwCCEQZuFUFU?=
 =?us-ascii?Q?hINgrY3WVQEogOhi8/ZlSbnUMmOtdbJ2G9sdq+EkKZVcfQunw14URKKjPD51?=
 =?us-ascii?Q?ivcrLZtmlHdGCnvyZSxHmCbb2Ep1b7UFYssHZZP87QmuWocO0qmknLr8wZ8L?=
 =?us-ascii?Q?Uywf4n9HPl0U2WKtrIjwAQLCYJHAg4axWhuh27zi4DHr2LK4HB7EHPJzXssX?=
 =?us-ascii?Q?akR5seIU8AE2/Y+Pd9bD6FC6jUDahxvygxB+12dgGzjGr6t+Jqdh//u/81Wp?=
 =?us-ascii?Q?QlI348qYvdkeihGDRoD9yXmlXsgUHWB3HSqqJ25lEXtNTnJKgsqjVNLuxMR4?=
 =?us-ascii?Q?Lkca/EKNG/N/TumKPLE/Xo+vK+a5/jFp85Ny+y1yMQEALXRCCp11NVtdvuKb?=
 =?us-ascii?Q?vfEy22+ivmEAy6zrX+aDS+5OWyMVLakkOIb9/MWMZZWjIJkFPZl8mOtbNjvi?=
 =?us-ascii?Q?9XYuCap92ZkFSgkUO306yhGhCdkCi15paeBEeawwlpZJ1LkJK2t9vGCE6QJW?=
 =?us-ascii?Q?eiYhC3E11PwSK3ptdWY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 04:11:46.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b520bfd3-3e44-4b1d-743a-08de18339b4d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_211150_805351_02310A04 
X-CRM114-Status: GOOD (  18.06  )
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

On 10:35-20251014, Thomas Richard (TI.com) wrote:
> Using pm_sleep_ptr() macro allows to remove ifdeffery and '__maybe_unused'
> annotations.
> 
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>  drivers/firmware/ti_sci.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 49fd2ae01055d0f425062147422471f0fd49e4bd..99a2e0e2960f463918950fef8829409ec365ce70 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3706,7 +3706,7 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
>  	}
>  }
>  
> -static int __maybe_unused ti_sci_suspend(struct device *dev)
> +static int ti_sci_suspend(struct device *dev)
>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	struct device *cpu_dev, *cpu_dev_max = NULL;
> @@ -3746,7 +3746,7 @@ static int __maybe_unused ti_sci_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
> +static int ti_sci_suspend_noirq(struct device *dev)
>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	int ret = 0;
> @@ -3758,7 +3758,7 @@ static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
> +static int ti_sci_resume_noirq(struct device *dev)
>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	int ret = 0;
> @@ -3780,7 +3780,7 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
>  	return 0;
>  }
>  
> -static void __maybe_unused ti_sci_pm_complete(struct device *dev)
> +static void ti_sci_pm_complete(struct device *dev)

PTR_IF when CONFIG_PM_SLEEP is disabled will result in these static
functions unused, no? should we leave __maybe_unused as is?

>  {
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  
> @@ -3791,12 +3791,10 @@ static void __maybe_unused ti_sci_pm_complete(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops ti_sci_pm_ops = {
> -#ifdef CONFIG_PM_SLEEP
> -	.suspend = ti_sci_suspend,
> -	.suspend_noirq = ti_sci_suspend_noirq,
> -	.resume_noirq = ti_sci_resume_noirq,
> -	.complete = ti_sci_pm_complete,
> -#endif
> +	.suspend = pm_sleep_ptr(ti_sci_suspend),
> +	.suspend_noirq = pm_sleep_ptr(ti_sci_suspend_noirq),
> +	.resume_noirq = pm_sleep_ptr(ti_sci_resume_noirq),
> +	.complete = pm_sleep_ptr(ti_sci_pm_complete),
>  };
>  
>  /* Description for K2G */
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251014-ti-sci-pm-ops-cleanup-1b7ef3f43cbc
> 
> Best regards,
> -- 
> Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

