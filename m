Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D7BFB44A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 04:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ+TOZuUoAlnC+nRF2LG4UBTesTzQsXmHBvPKenL6HI=; b=uritzogEk1+VNuCdWAk9eYODnU
	9AAfCGVKtX9+FGiGN/9vgqNBBBkri21OVSSA9lZNAIuPa1K3HUyzpAgcZ7ZdIvPwH0BjvR2OGmJeE
	NY/9TOj7wYCA3Q3W9fzpsbhaXiVBaz319T8ks6f1Q0hvxNQi+VtVI0BnONQt4XlHYljDfkzBki4Mv
	e5oTpFOrJDkEZzC8i1g9uJGBsaEGhDjWOyXeeIn8YIFKNkAB7/+IEg98IdgNEWJIBQr1XtOYPbK2U
	VpgQOB6iOVST7NhDbNimlSGFLILfLNsObxktFma1vI/QQ/HNj5rpZ4takQageJTZShEhofGhSPWnv
	Ou8oHtsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG8K5-0000000Ce0n-2eC8;
	Fri, 24 Apr 2026 04:39:25 +0000
Received: from mail-eastusazon11012060.outbound.protection.outlook.com ([52.101.53.60] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG8K2-0000000Ce0P-357H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 04:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miXitZqvJaVf7VE7tCudTQWfwQMjUnxWIP5YYwARBOtsKD8b0HTGdLYDymRVUQW9FWYpb5DAk8p80b2DfnCpIF5g4BbRFZEOmDmX24TvI7PFWt7mvdlsZFfPfDs4xzaxzkFiyVvr2tJ52a695yQg0UDYE/fG98MFrqh0YA8sEFBgZygUxulivLk4tlOCvFcPcEgLGd9/GUrui2N6Ar7C2cJ6llUedgGe9pM/ODjUbFN/adYg5IicD9y17U4Ij4WLyFSI14LZ3yh5RSw2QTwp2oanaV9oo17Nc4g8pHhxy69FlUdlT65jI1OupYNXUAZLMu3LrEGitdENM6hh1TRx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ+TOZuUoAlnC+nRF2LG4UBTesTzQsXmHBvPKenL6HI=;
 b=fmloIpFhIyIx4mD1xwxnWlATc9Cyzw6/rPLk/XjtG+yuaGJwO4OUfjY/qYdtkR6tPeuKhpqoAAbcOp9fI1O6AxKIUZAITWmxSbBvyCt3hiGxY8P2m/rbkNzGrwFcT2BVCpWLkA/+oFe0O2kuLunWhjYLGqkEc6aTYeQpaYffttZPWjYP/d8CyGedHQFgT7z/KzaRinwm2bWOXjWS1h1yJ+NMWzTxgDobW0LSWKcgJcLMmsuAXOlSoIvP/Kjnj8zaWR65jdfhGEOSGpzHJXcwmoVwefCrFhMWo57TguqNKOgfG5QIJ3qUuWQFKFearUI2hhjsaRfBmvzRZfQQ282Oig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ+TOZuUoAlnC+nRF2LG4UBTesTzQsXmHBvPKenL6HI=;
 b=Fe4ItwAAgzdadJP4IalujzrantPJkLjV25FoVdHSS4oNIekgJ/HHNldlZeE2cc1gfztdv8lpx+ghIh9VddImn4gp/42epYC9AJ2zyFx3iQq95SNypmEO/6eFcp3YHvNm9o/AX+Fv2EdYpsoO6TvZ9lV2er3ZLkSqFPeFyttUYt0=
Received: from MW4PR12MB7285.namprd12.prod.outlook.com (2603:10b6:303:22e::11)
 by DM6PR12MB4204.namprd12.prod.outlook.com (2603:10b6:5:212::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 04:39:17 +0000
Received: from MW4PR12MB7285.namprd12.prod.outlook.com
 ([fe80::ba9e:64a2:e92d:8cff]) by MW4PR12MB7285.namprd12.prod.outlook.com
 ([fe80::ba9e:64a2:e92d:8cff%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 04:39:17 +0000
From: "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>
To: "Jain, Ronak" <ronak.jain@amd.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Jain, Ronak" <ronak.jain@amd.com>
Subject: RE: [PATCH 2/2] firmware: zynqmp: Add dynamic CSU register discovery
 and sysfs interface
Thread-Topic: [PATCH 2/2] firmware: zynqmp: Add dynamic CSU register discovery
 and sysfs interface
Thread-Index: AQHcx0zVS3Iep2O3q0SQvSQiaBigHbXtuJGQ
Date: Fri, 24 Apr 2026 04:39:17 +0000
Message-ID: <MW4PR12MB728503ED85B98A66805CE997E22B2@MW4PR12MB7285.namprd12.prod.outlook.com>
References: <20260408114244.2852015-1-ronak.jain@amd.com>
 <20260408114244.2852015-3-ronak.jain@amd.com>
In-Reply-To: <20260408114244.2852015-3-ronak.jain@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-04-24T04:34:05.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7285:EE_|DM6PR12MB4204:EE_
x-ms-office365-filtering-correlation-id: 2ba098d5-852b-4ab5-fb62-08dea1bb71d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: zegBaEge81b03jZyk1KtEM5fCKVp86dnkB1zvXJd/aevRHdV1XB0rUccfGyKqokZfqrXQ45xpHaO9nCKKy0fAcedZd1IkvC9p95d+1f6QNXvKOFmshn8cC2yrzkRWpqiMX6GP7qWc3rgGKFM4PZVhiM6DyXqdeXLuE1ZXN2UGusq6clkJAxXp3ODgEn8jfVTDz7l7C7IYZHQJf9cDFFuQxIANxL1ijInqqiH2UEZuPyTi7u7zOfzwjGgktvs4h9c7FZRAWbHt1uM/4IYtRpLHDrWFvqUXdqYC6opkil0yl9FXx4MSDQ7sD411tQj/499DuJnA4hwHZulMj+q2C1+FLEpzN9ws9j46NrjfaLnG5ADViry5T9rJBQ3iD+FDwBi+BLxDk4rAndwaBdrCi7AEzPzzu+JMLTwpmpLJsGG5Axkj89NdolvS3tomh3UESYxnPbGS6rvJYltTJ/g21vKADvgRQEWU3G8Hjcy67zZ0asJCPpfr+2eUSDH4C9eEKuISZZjwdZjxNOuBiIhRKqxECm3Ps3i02aKQHko4T4Y4ma8iDxpaUZ2Q1552A1cDTVKwRfdqnM0kx/Ea4pr+PkVXi58dlyR18ujKsbEk/NS8kI5rw+phe4hOGIYEYzr0cDMeIvFjAG16JB89J/kDg/5orrc2BKXmk2Q53PQkV9McMG0RYXVIpH20QaZp+Pc7jE35dpuaOFR2yuH5i+NIcvjvdz/UOWWYTIk40ogMe9pPhDt/9bd/CeUt4nRyJtQ6sa/zpsnCdicgyUKKjoQR5VQRNeYqMid8sxIok5qPq0qkkQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7285.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D3iYQoV1MItar7OP8zkqlqdY6Rgtlv6Zri5Duzw+5VfT04PTOrOWUDPj30Pw?=
 =?us-ascii?Q?7CaUBS8vMKB+fCHOzdHae8CfOyIwDOOOPQia3uBJtVXpD0FLzpe43box1QLU?=
 =?us-ascii?Q?vKLa/HEBuzsZTAcjI+XQW+uOCeHOyhN9BlizcFB+WLrJCQnRttQqhqrzcyCN?=
 =?us-ascii?Q?2aIV0VxwnAEZHXr4uZoJo4mAvd+nD6/nMWYsdrY6LtZ5i9XnlObpkD8Wt08U?=
 =?us-ascii?Q?k7o3e+Imm71iV8/BlgzeSRji+7yuUiNUWQiRg31zNXKfHqljls9z0GZVKfs0?=
 =?us-ascii?Q?Sf7+f9IO3eSuWyWqW1G/3Mot+PF0jRZ8bx9X8yOpRKFHKtQ7MvPwKRR86qt9?=
 =?us-ascii?Q?wPnqlVtNKEWfoneiDayvIGhEKL5xWoOyaklDgrzYFneg3YfYm8O8w3KhMkcs?=
 =?us-ascii?Q?tKqGMCPOUpgVyWApCVdClLI2n9SJNoUWRqNkTFcaYyeM7nVGei5p5w1il7Or?=
 =?us-ascii?Q?FteDjHDIa0EoTGXdvdxWqc6VJX7Bt6gpTKSCRUB6YEymKBcRQU5kFcDu2Gti?=
 =?us-ascii?Q?AiCaxgU2lUbgq/jSksvWx6c/Xwfe6Ms6Uqb0483MObuE0X7u1tTnvQ8PFUHp?=
 =?us-ascii?Q?oyQd8TU+0YyzSurS0dJKTWnQgcaUhjX8RdttK7U4aRmfTiTE8xgOGjl0+I1p?=
 =?us-ascii?Q?vJ0mQc/CkNUzPQXoJnnpEgVnh0gS1wbs9Y9IQg1I3XIavvkl1aEHgJt7Mdrc?=
 =?us-ascii?Q?7eqrZC0+uJ1zsiV1nfMxfsxGqUX2dmWpDo4bREFIHv6U/3ey/VPB6lvQaw4D?=
 =?us-ascii?Q?AlF9P6eSOaw41a0G7I78lmbMKQ+FMmBxApAMoScWCudjZQ/iLz1b4LodhbqY?=
 =?us-ascii?Q?woi+W7zPaj9NPFx1LCcXTeg7VBKptmajNJPaLXOKT70nRAKrK+Cjrihu7RaB?=
 =?us-ascii?Q?HXQcQZM2Acd0kgeUUaoD+S+iWqXreGFJYk+nOZs9/xfeCDJ0Bz3cNd43+01x?=
 =?us-ascii?Q?NnpimlpwIoBf/BzylhjAoeWUTDGDrbSkc7hP1udfCYj4yq75Fm/SM1NrOyu6?=
 =?us-ascii?Q?UAulkdvV9DZTnvENQ1vjJlov4mCC5Zm9CzyI29kzVqauCVno7To9L40isU0B?=
 =?us-ascii?Q?l1RwMZ/pmMO/l1jipMyWPldhd7NA/wM3UgWLgFcnwsnRGDFkZ7ykiaub51BC?=
 =?us-ascii?Q?94dyDGyFJojqCyYgX34A3EwbkosrPgaZU370XR8YjDZn/CzQWhH4YIUXDzm+?=
 =?us-ascii?Q?CxCWJ4dQVlZY+OMeQ1FQW+FdYmsflIQEk0irkapFlTEIkZ5mTqg1cdIqP27i?=
 =?us-ascii?Q?qTK+bGOBKi1xUFYH61eZljCx6lOAIF05g4DQTFCM0ws0N2GaJPNLsG865teW?=
 =?us-ascii?Q?U6cBH8TD7TeYMhCPFAN3VB1yGuHsdPsNzoEO2husp/Fc1bcKFFgRNURftSDX?=
 =?us-ascii?Q?e1UqenaNJODIQ+tTBcDqOlx8gQ86BKun308bxcQGw777VaEctXZia2xJHmgI?=
 =?us-ascii?Q?I2fqkv93BsByQC+xB+eYX4x4chPn/UfAJ7xBKawktFBdGdhSBe+ktA2TWWWZ?=
 =?us-ascii?Q?xYMLTkbBK5dIg7D1e3SGeNl5A59QZyoZVVjBSlJfSva4nHzoBZHWj67eg9rf?=
 =?us-ascii?Q?LNPFaPgGtOZChaCS+CJ1RgJZ3AlshBUUrLSKlwonRJi+8mnWP+u17EyqPq2K?=
 =?us-ascii?Q?rMe0/NYklI2bZOkn5s/uMCnUb0fTf2Gr23ES2VohW/rU+UYh0CVijlsT2QBg?=
 =?us-ascii?Q?RwGfolEhqlM71lOWUg5CmXiKMjvRrV/9DKqlrdIXHHC+SRNg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7285.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba098d5-852b-4ab5-fb62-08dea1bb71d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 04:39:17.3939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BW4atwUTMADLnW6CLB9zuDL+RlDWdBu4BGdQadbCfvKf6Mbp7rOfjDvinnj0FEqqrNz6/nQdxd/UhEhRsZiKHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_213922_872953_94366943 
X-CRM114-Status: GOOD (  29.83  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Ronak Jain <ronak.jain@amd.com>
> Sent: Wednesday, April 8, 2026 4:43 AM
> To: Simek, Michal <michal.simek@amd.com>; Thangaraj, Senthil Nathan
> <SenthilNathan.Thangaraj@amd.com>
> Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; J=
ain,
> Ronak <ronak.jain@amd.com>
> Subject: [PATCH 2/2] firmware: zynqmp: Add dynamic CSU register discovery
> and sysfs interface
>
> Add support for dynamically discovering and exposing Configuration Securi=
ty
> Unit (CSU) registers through sysfs. Leverage the existing PM_QUERY_DATA
> API to discover available registers at runtime, making the interface flex=
ible and
> maintainable.
>
> Key features:
> - Dynamic register discovery using PM_QUERY_DATA API
>   * PM_QID_GET_NODE_COUNT: Query number of available registers
>   * PM_QID_GET_NODE_NAME: Query register names by index
> - Automatic sysfs attribute creation under csu_registers/ group
> - Read operations via existing IOCTL_READ_REG API
> - Write operations via existing IOCTL_MASK_WRITE_REG API
> - Firmware-enforced access control (read-only registers reject writes)
>
> The sysfs interface is created at:
>   /sys/devices/platform/firmware:zynqmp-firmware/csu_registers/
>
> Currently supported registers include:
>   - multiboot (CSU_MULTI_BOOT)
>   - idcode (CSU_IDCODE, read-only)
>   - pcap-status (CSU_PCAP_STATUS, read-only)
>
> The dynamic discovery approach allows firmware to control which registers=
 are
> exposed without requiring kernel changes, improving maintainability and
> security.
>
> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> ---
>  MAINTAINERS                              |  10 +
>  drivers/firmware/xilinx/Makefile         |   2 +-
>  drivers/firmware/xilinx/zynqmp-csu-reg.c | 249 +++++++++++++++++++++++
> drivers/firmware/xilinx/zynqmp-csu-reg.h |  18 ++
>  drivers/firmware/xilinx/zynqmp.c         |   6 +
>  include/linux/firmware/xlnx-zynqmp.h     |   4 +-
>  6 files changed, 287 insertions(+), 2 deletions(-)  create mode 100644
> drivers/firmware/xilinx/zynqmp-csu-reg.c
>  create mode 100644 drivers/firmware/xilinx/zynqmp-csu-reg.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10d12b51b1f6..37fe2b7e0ccf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29212,6 +29212,16 @@ F:   drivers/dma/xilinx/xdma.c
>  F:   include/linux/dma/amd_xdma.h
>  F:   include/linux/platform_data/amd_xdma.h
>
> +XILINX ZYNQMP CSU REGISTER DRIVER
> +M:   Senthil Nathan Thangaraj <senthilnathan.thangaraj@amd.com>
> +R:   Michal Simek <michal.simek@amd.com>
> +R:   Ronak Jain <ronak.jain@amd.com>
> +L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers=
)
> +S:   Maintained
> +F:   Documentation/ABI/stable/sysfs-driver-firmware-zynqmp
> +F:   drivers/firmware/xilinx/zynqmp-csu-reg.c
> +F:   drivers/firmware/xilinx/zynqmp-csu-reg.h
> +
>  XILINX ZYNQMP DPDMA DRIVER
>  M:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:   dmaengine@vger.kernel.org
> diff --git a/drivers/firmware/xilinx/Makefile b/drivers/firmware/xilinx/M=
akefile
> index 8db0e66b6b7e..6203f41daaa6 100644
> --- a/drivers/firmware/xilinx/Makefile
> +++ b/drivers/firmware/xilinx/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Makefile for Xilinx firmwares
>
> -obj-$(CONFIG_ZYNQMP_FIRMWARE) +=3D zynqmp.o zynqmp-ufs.o zynqmp-
> crypto.o
> +obj-$(CONFIG_ZYNQMP_FIRMWARE) +=3D zynqmp.o zynqmp-ufs.o zynqmp-
> crypto.o
> +zynqmp-csu-reg.o
>  obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) +=3D zynqmp-debug.o diff --git
> a/drivers/firmware/xilinx/zynqmp-csu-reg.c b/drivers/firmware/xilinx/zynq=
mp-csu-
> reg.c
> new file mode 100644
> index 000000000000..1f304ce858b1
> --- /dev/null
> +++ b/drivers/firmware/xilinx/zynqmp-csu-reg.c
> @@ -0,0 +1,249 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx Zynq MPSoC CSU Register Access
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + *  Michal Simek <michal.simek@amd.com>
> + *  Ronak Jain <ronak.jain@amd.com>
> + */
> +
> +#include <linux/firmware/xlnx-zynqmp.h> #include
> +<linux/platform_device.h> #include <linux/slab.h> #include
> +<linux/string.h>
> +
> +#include "zynqmp-csu-reg.h"
> +
> +/* Node ID for CSU module in firmware */ #define CSU_NODE_ID 0
> +
> +/* Maximum number of CSU registers supported */ #define MAX_CSU_REGS
> 50
> +
> +/* Size of register name returned by firmware (3 u32 words =3D 12 bytes)
> +*/ #define CSU_REG_NAME_LEN 12
> +
> +/**
> + * struct zynqmp_csu_reg - CSU register information
> + * @id: Register index from firmware
> + * @name: Register name
> + * @attr: Device attribute for sysfs
> + */
> +struct zynqmp_csu_reg {
> +     u32 id;
> +     char name[CSU_REG_NAME_LEN];
> +     struct device_attribute attr;
> +};
> +
> +/**
> + * struct zynqmp_csu_data - Per-device CSU data
> + * @csu_regs: Array of CSU registers
> + * @csu_reg_count: Number of CSU registers
> + * @csu_attr_group: Attribute group for sysfs  */ struct
> +zynqmp_csu_data {
> +     struct zynqmp_csu_reg *csu_regs;
> +     int csu_reg_count;
> +     struct attribute_group csu_attr_group; };
> +
> +/**
> + * zynqmp_pm_get_node_count() - Get number of supported nodes via
> +QUERY_DATA
> + *
> + * Return: Number of nodes on success, or negative error code  */
> +static int zynqmp_pm_get_node_count(void) {
> +     struct zynqmp_pm_query_data qdata =3D {0};
> +     u32 ret_payload[PAYLOAD_ARG_CNT];
> +     int ret;
> +
> +     qdata.qid =3D PM_QID_GET_NODE_COUNT;
> +
> +     ret =3D zynqmp_pm_query_data(qdata, ret_payload);
> +     if (ret)
> +             return ret;
> +
> +     return ret_payload[1];
> +}
> +
> +/**
> + * zynqmp_pm_get_node_name() - Get node name via QUERY_DATA
> + * @index: Register index
> + * @name: Buffer to store register name
> + *
> + * Return: 0 on success, error code otherwise  */ static int
> +zynqmp_pm_get_node_name(u32 index, char *name) {
> +     struct zynqmp_pm_query_data qdata =3D {0};
> +     u32 ret_payload[PAYLOAD_ARG_CNT];
> +     int ret;
> +
> +     qdata.qid =3D PM_QID_GET_NODE_NAME;
> +     qdata.arg1 =3D index;
> +
> +     ret =3D zynqmp_pm_query_data(qdata, ret_payload);
> +     if (ret)
> +             return ret;
> +
> +     memcpy(name, &ret_payload[1], CSU_REG_NAME_LEN);
> +     name[CSU_REG_NAME_LEN - 1] =3D '\0';
> +
> +     return 0;
> +}
> +
> +/**
> + * zynqmp_csu_reg_show() - Generic show function for all registers
> + * @dev: Device pointer
> + * @attr: Device attribute
> + * @buf: Output buffer
> + *
> + * Return: Number of bytes written to buffer, or error code  */ static
> +ssize_t zynqmp_csu_reg_show(struct device *dev,
> +                                struct device_attribute *attr,
> +                                char *buf)
> +{
> +     struct zynqmp_csu_reg *reg;
> +     u32 value;
> +     int ret;
> +
> +     /* Use container_of to get register directly */
> +     reg =3D container_of(attr, struct zynqmp_csu_reg, attr);
> +
> +     ret =3D zynqmp_pm_sec_read_reg(CSU_NODE_ID, reg->id, &value);
> +     if (ret)
> +             return ret;
> +
> +     return sysfs_emit(buf, "0x%08x\n", value); }
> +
> +/**
> + * zynqmp_csu_reg_store() - Generic store function for writable
> +registers
> + * @dev: Device pointer
> + * @attr: Device attribute
> + * @buf: Input buffer
> + * @count: Buffer size
> + *
> + * Format: "mask value" - both mask and value required
> + * Example: echo "0xFFFFFFFF 0x12345678" > register
> + *
> + * Return: count on success, error code otherwise  */ static ssize_t
> +zynqmp_csu_reg_store(struct device *dev,
> +                                 struct device_attribute *attr,
> +                                 const char *buf, size_t count)
> +{
> +     struct zynqmp_csu_reg *reg;
> +     u32 mask, value;
> +     int ret;
> +
> +     reg =3D container_of(attr, struct zynqmp_csu_reg, attr);
> +
> +     if (sscanf(buf, "%x %x", &mask, &value) !=3D 2)
> +             return -EINVAL;
> +
> +     ret =3D zynqmp_pm_sec_mask_write_reg(CSU_NODE_ID, reg->id, mask,
> value);
> +     if (ret)
> +             return ret;
> +
> +     return count;
> +}
> +
> +/**
> + * zynqmp_csu_discover_registers() - Discover CSU registers from
> +firmware
> + * @pdev: Platform device pointer
> + *
> + * This function uses PM_QUERY_DATA to discover all available CSU
> +registers
> + * and creates sysfs group under
> +/sys/devices/platform/firmware:zynqmp-firmware/
> + *
> + * Return: 0 on success, error code otherwise  */ int
> +zynqmp_csu_discover_registers(struct platform_device *pdev) {
> +     struct zynqmp_csu_data *csu_data;
> +     struct attribute **attrs;
> +     int count, ret, i;
> +
> +     ret =3D zynqmp_pm_is_function_supported(PM_QUERY_DATA,
> PM_QID_GET_NODE_COUNT);
> +     if (ret) {
> +             dev_dbg(&pdev->dev, "CSU register discovery not supported b=
y
> current firmware\n");
> +             return 0;
> +     }

Should we also call zynqmp_pm_is_function_supported(PM_QUERY_DATA, PM_QID_G=
ET_NODE_NAME) to verify firmware support before proceeding?

> +
> +     count =3D zynqmp_pm_get_node_count();
> +     if (count < 0)
> +             return count;
> +     if (count =3D=3D 0) {
> +             dev_dbg(&pdev->dev, "No nodes available from firmware\n");
> +             return 0;
> +     }
> +
> +     /* Validate count to prevent excessive memory allocation */
> +     if (count > MAX_CSU_REGS) {
> +             dev_err(&pdev->dev, "Register count %d exceeds maximum %d\n=
",
> +                     count, MAX_CSU_REGS);
> +             return -EINVAL;
> +     }
> +
> +     dev_dbg(&pdev->dev, "Discovered %d nodes from firmware\n", count);
> +
> +     csu_data =3D devm_kzalloc(&pdev->dev, sizeof(*csu_data), GFP_KERNEL=
);
> +     if (!csu_data)
> +             return -ENOMEM;
> +
> +     csu_data->csu_reg_count =3D count;
> +
> +     csu_data->csu_regs =3D devm_kcalloc(&pdev->dev, count,
> sizeof(*csu_data->csu_regs),
> +                                       GFP_KERNEL);
> +     if (!csu_data->csu_regs) {
> +             devm_kfree(&pdev->dev, csu_data);
> +             return -ENOMEM;
> +     }
> +
> +     attrs =3D devm_kcalloc(&pdev->dev, count + 1, sizeof(*attrs), GFP_K=
ERNEL);
> +     if (!attrs) {
> +             devm_kfree(&pdev->dev, csu_data->csu_regs);
> +             devm_kfree(&pdev->dev, csu_data);
> +             return -ENOMEM;
> +     }
> +
> +     for (i =3D 0; i < count; i++) {
> +             struct zynqmp_csu_reg *reg =3D &csu_data->csu_regs[i];
> +             struct device_attribute *dev_attr =3D &reg->attr;
> +
> +             reg->id =3D i;
> +
> +             ret =3D zynqmp_pm_get_node_name(i, reg->name);
> +             if (ret) {
> +                     dev_warn(&pdev->dev, "Failed to get name for regist=
er %d\n",
> i);
> +                     snprintf(reg->name, sizeof(reg->name), "csu_reg_%d"=
, i);
> +             }
> +
> +             /* Create sysfs attribute - firmware enforces actual access=
 control */
> +             sysfs_attr_init(&dev_attr->attr);
> +             dev_attr->attr.name =3D reg->name;
> +             dev_attr->attr.mode =3D 0644;
> +             dev_attr->show =3D zynqmp_csu_reg_show;
> +             dev_attr->store =3D zynqmp_csu_reg_store;
> +
> +             attrs[i] =3D &dev_attr->attr;
> +
> +             dev_dbg(&pdev->dev, "Register %d: id=3D%d name=3D%s\n", i, =
reg->id,
> reg->name);
> +     }
> +
> +     csu_data->csu_attr_group.name =3D "csu_registers";
> +     csu_data->csu_attr_group.attrs =3D attrs;
> +
> +     ret =3D devm_device_add_group(&pdev->dev, &csu_data->csu_attr_group=
);
> +     if (ret) {
> +             devm_kfree(&pdev->dev, attrs);
> +             devm_kfree(&pdev->dev, csu_data->csu_regs);
> +             devm_kfree(&pdev->dev, csu_data);
> +     }
> +
> +     return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_csu_discover_registers);
> diff --git a/drivers/firmware/xilinx/zynqmp-csu-reg.h
> b/drivers/firmware/xilinx/zynqmp-csu-reg.h
> new file mode 100644
> index 000000000000..b12415db3496
> --- /dev/null
> +++ b/drivers/firmware/xilinx/zynqmp-csu-reg.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Xilinx Zynq MPSoC CSU Register Access
> + *
> + * Copyright (C) 2026 Advanced Micro Devices, Inc.
> + *
> + *  Michal Simek <michal.simek@amd.com>
> + *  Ronak Jain <ronak.jain@amd.com>
> + */
> +
> +#ifndef __ZYNQMP_CSU_REG_H__
> +#define __ZYNQMP_CSU_REG_H__
> +
> +#include <linux/platform_device.h>
> +
> +int zynqmp_csu_discover_registers(struct platform_device *pdev);
> +
> +#endif /* __ZYNQMP_CSU_REG_H__ */
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/z=
ynqmp.c
> index fbe8510f4927..b549d07f7497 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -27,6 +27,7 @@
>
>  #include <linux/firmware/xlnx-zynqmp.h>  #include <linux/firmware/xlnx-e=
vent-
> manager.h>
> +#include "zynqmp-csu-reg.h"
>  #include "zynqmp-debug.h"
>
>  /* Max HashMap Order for PM API feature check (1<<7 =3D 128) */ @@ -2120=
,6
> +2121,11 @@ static int zynqmp_firmware_probe(struct platform_device *pdev=
)
>                       dev_err_probe(&pdev->dev, PTR_ERR(em_dev), "EM regi=
ster
> fail with error\n");
>       }
>
> +     /* Discover CSU registers dynamically */
> +     ret =3D zynqmp_csu_discover_registers(pdev);
> +     if (ret)
> +             dev_warn(&pdev->dev, "CSU register discovery failed: %d\n",=
 ret);
> +
>       return of_platform_populate(dev->of_node, NULL, NULL, dev);  }
>
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmwar=
e/xlnx-
> zynqmp.h
> index d70dcd462b44..a4b293eb96ce 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -3,7 +3,7 @@
>   * Xilinx Zynq MPSoC Firmware layer
>   *
>   *  Copyright (C) 2014-2021 Xilinx
> - *  Copyright (C) 2022 - 2025 Advanced Micro Devices, Inc.
> + *  Copyright (C) 2022 - 2026 Advanced Micro Devices, Inc.
>   *
>   *  Michal Simek <michal.simek@amd.com>
>   *  Davorin Mista <davorin.mista@aggios.com> @@ -262,6 +262,8 @@ enum
> pm_query_id {
>       PM_QID_CLOCK_GET_NUM_CLOCKS =3D 12,
>       PM_QID_CLOCK_GET_MAX_DIVISOR =3D 13,
>       PM_QID_PINCTRL_GET_ATTRIBUTES =3D 15,
> +     PM_QID_GET_NODE_NAME =3D 16,
> +     PM_QID_GET_NODE_COUNT =3D 17,
>  };
>
>  enum rpu_oper_mode {
> --
> 2.34.1

Thanks,
Senthil

