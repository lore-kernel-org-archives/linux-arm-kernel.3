Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC48EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8krPoULTruwY70IV8mkb0o2YltWVPqZHO9RRUo3F2tE=; b=fThwjrJmGB0wvUGmjgNaC2MsPC
	lxW60YPHgzcsbcF2a17Vs+mcfN1jpGKwQYQksdWNpKlSMCb8UZkJf0/nJiCLitcBiOvqgk/zX0Yr3
	cj8opitGrF/3fFK3VA2aF9mkuvX7zSK+WLVj2R5Bf5aJYSu8JHahOWAhcsbai9ihZ//UELbS0XxJm
	xs4jBBn/llXiY32/11CHeORTbP6J9PCOb3x7K7sqeU0e/BUMDLrIxuQ8wU1Fkpaf5AdJSawHOewOy
	GCixn+NSUjayRkeeCqC/eMbzycv+WB0eoy+R/sV0ubreYtvyp90JRGkdXLF/MVt+b8qrd+cwwSVPE
	vrn5lUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9De-00000004o5v-3VAE;
	Fri, 10 Jul 2026 11:16:34 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9DX-00000004nx8-02jO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:16:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmQVt8A27zfv4pxBJT4wCCdbuQaM7QTPaVPCb2GGlQg4fv4CbatAR+kFL2f6Vf8tCzJ4sc35raWXj7PWPk9XaCFdfy8EUsILXkV+ue4bR/QafPhuFEXBgRYlYGQtWHm6EnDp/1GDzyOeITO6bErLhjx+sCMV4XCWc95ORxWmPOYZuo2y7qS5bbM6zVtoxeTbOPOf1WTDtatZ3lwnC0TN1nt4+zxVI+/Xipu0RXGePf6/7eHFTHrpRdC4KB7slnhUcVQatdu1TbS8spKg7FvthaRugsPmAu9Ty+y7WEUInWZm/0d1K8t92ua/XlcCdSjYW+n30tYBSq/h6EqfGAkBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8krPoULTruwY70IV8mkb0o2YltWVPqZHO9RRUo3F2tE=;
 b=Bt8A22n+Um0yOZxBEmm/8EGXvI596bjgQpUqtiUr0k8RV6dD+qrjTI7I5HNjnoKMZAEiFZS6XFCspvB1BXAP27BnBG/6EsXZBb4KGNmoKMnSKg4mim8fOLObDkQpTR6S/gRof3e1dANKkeWwICf0exy9DBTecqs1NdbJqOU9eCjTB0syYObdGORYDzE7/s7o46KAdUQCNdFQe0AtqXjv2ZKAOg5fOV7/3Vg3ddIdPKA0ZlHiYlBnCwtfieeWJIgMhrEDMm0cr2Qol38WuTLDIuGyXRu1dftqRow/ZBW4+51KuAydxb9+sIvdU1ghSZNhGoFMVxlscBdK5OTgH7EHbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8krPoULTruwY70IV8mkb0o2YltWVPqZHO9RRUo3F2tE=;
 b=T/Vu+rnsNfveFq2WgG60piaQNsXS88doI6gd7c7+aJjOBr9FhDlwA6Vmj6B8QYi1vqQcuQ03oc0fpnJcGsigfn9RLqbnAbTs6JtksEpsj22OPH6SoulCcvgsUi/DscPgE2EBm/tqGBfPF8E4SaeKP28ez8QBUuqoKlmyy0v2ycOfIeIm3P4sJwFL0hXmmXIKnjUhLAgBmkjD1CWzGlOgpeo7eZD6YrREaSIej2sCsrTwv2cSTQbD9XjYAOWpgrCBgMwCWK1gaF+O8d8aIhWe0YU8rPBCAKjeLNe4tMcIm7SqScabtEXBiFCsppwpxZ0Fz414Oh68bN+GA+nbtDqIuA==
Received: from CH0PR03CA0290.namprd03.prod.outlook.com (2603:10b6:610:e6::25)
 by LV0PR12MB999094.namprd12.prod.outlook.com (2603:10b6:408:32e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 11:16:14 +0000
Received: from CH2PEPF0000009B.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::5a) by CH0PR03CA0290.outlook.office365.com
 (2603:10b6:610:e6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend
 Transport; Fri, 10 Jul 2026 11:16:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000009B.mail.protection.outlook.com (10.167.244.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:16:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 04:16:01 -0700
Received: from 82875d6-lcedt.nvidia.com (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Jul 2026 04:16:00 -0700
From: Nirmoy Das <nirmoyd@nvidia.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v3 4/8] firmware: smccc: lfa: Register ACPI notification
Date: Fri, 10 Jul 2026 04:04:41 -0700
Message-ID: <20260710111545.439956-1-nirmoyd@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-5-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com> <20260706134455.132091-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009B:EE_|LV0PR12MB999094:EE_
X-MS-Office365-Filtering-Correlation-Id: 77fbb1c0-d444-4cfa-ee2f-08dede74a78d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003|6133799003|5023799004;
X-Microsoft-Antispam-Message-Info: 2ylGVUo6yJ1Tt/CaE3A5GSxVZPDA6gv8nrt6qGIQHlUH0qPkx3VygTxuT/VmrPPQbNfx/KJ9nTibj06q0GAIZyg39naWEHl8282IC8t7FWWUtb4XqtL1piE+EbGW/rjB9uJVEqDHKEgfAsIcMfnbyxiXwmaJF3Uu3QLNQqAlxIjlCuaSy/WvrVgotYPhJcci3xgJT9aWb7PqNU7li0LdKxt/4V5Ayi7a3ILVH/REki2WxUzTVHeOI2BKiiE9NSCVU3eS6ZMMgo0NrM0QEwF2bKIBpv3zF/AtbVfkCKHEAh8mhb2iTYkrk9/eQeo/5CQwIb9VqgKn7WUh0KPoqztsTB3vSpRhgCnHf2ThTahxODUGBWBitVF71mhubGx/e9fSzL4vDyLxShEYfhHUO5PE/R7Xo7BkdnhIt4WSfm8Z3YKmqsL+kZMuVl7KpkhL7CJ324goeqCP5EoD/Fa0LrL2g6187CP22Z/HdGZFDe8SgvgJpA8dWPeKq2TG8wwsGuDjKNXrQFtp4DwakYRE7Q0YCH22t99w0ZLuaQ0D8uQetLKf3ub4u3INcdCsz53COWYSDVewtm7GUhzI3F2EaKRVy/P2AS7pQoU+eF+yPsM3cpO098QRgE9uNgTTib4G1WhhlHd0MPtJrrzL15GQxVfiJ3v2S+VnKbCkdgM2sPHa37HjDVCxXUCjep2gedWRQU1flTyxkwJPJ5Q7cAQFKkrNoA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(6133799003)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: q8/3LWCKI2bwdp8RWZRPR5Mtxq1pY5wypP5lwyE7GcFBldoH/Bz7tQsZvKVZM6yDr4SZJ4X5ZgtAt8K16GsXmhx67Al7phAZP8jYn65xonzsSmWeUyhn1Uda3g8WY8V2zfkj/0OJxhD7sQTMUSf6OaMwD8UjXT837A6uIA+OEkzKc+6O5A4hXY0QaBlgF6XZKErMcTcQQMFdpR9PaWoyuLJHUjuq0uGEKaBlj7LvCdlEv6qEfI9VweTLycYvDI2eM7SW4yobr1n8Y9CEeOsAVnea5o7Ov220xswQa4AL0Cjkl24ak8cuHewRfE2RUYRdmCihuT/n88X6RUg4FqoRrJ2MZylBcRNuxSPj4Ga9ztaT1edZMCkv5AQEqdftSAmqKpGcLl0jwWzIAfXh1QUxch6j39vhPvIjiWjaR2tt8XMv/crac+Kb9F4vpjYFuiv6
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:16:14.0313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77fbb1c0-d444-4cfa-ee2f-08dede74a78d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_041627_060839_92320F02 
X-CRM114-Status: GOOD (  25.25  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, 6 Jul 2026 15:44:44 +0200, Andre Przywara wrote:=0D
=0D
Hi,=0D
=0D
> From: Vedashree Vidwans <vvidwans@nvidia.com>=0D
>=0D
> The Arm LFA spec describes an ACPI notification mechanism, where the=0D
> platform (firmware) can notify an LFA client about newly available=0D
> firmware imag updates ("pending images" in LFA terms).=0D
>=0D
> Add a faux device after discovering the existence of an LFA agent via=0D
> the SMCCC discovery mechnism, and use that device to check for the ACPI=0D
> notification description. Register this when one is provided.=0D
>=0D
> The notification just conveys the fact that at least one firmware image=0D
> has now a pending update, it doesn't say which, also there could be more=
=0D
> than one pending. Loop through all images to find every which needs to=0D
> be activated, and trigger the activation. We need to do this is a loop,=0D
> since an activation might change the number and the status of available=0D
> images.=0D
>=0D
> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>=0D
> [Andre: convert from platform driver to smccc bus]=0D
> Signed-off-by: Andre Przywara <andre.przywar@arm.com>=0D
> ---=0D
>  drivers/firmware/smccc/lfa_fw.c | 123 +++++++++++++++++++++++++++++++-=0D
>  1 file changed, 122 insertions(+), 1 deletion(-)=0D
>=0D
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa=
_fw.c=0D
> index 357e41f95206..5b7f9b07f6c8 100644=0D
> --- a/drivers/firmware/smccc/lfa_fw.c=0D
> +++ b/drivers/firmware/smccc/lfa_fw.c=0D
> @@ -3,12 +3,14 @@=0D
>   * Copyright (C) 2025 Arm Limited=0D
>   */=0D
>  =0D
> +#include <linux/acpi.h>=0D
>  #include <linux/arm-smccc.h>=0D
>  #include <linux/arm-smccc-bus.h>=0D
>  #include <linux/array_size.h>=0D
>  #include <linux/delay.h>=0D
>  #include <linux/fs.h>=0D
>  #include <linux/init.h>=0D
> +#include <linux/kernel.h>=0D
>  #include <linux/kobject.h>=0D
>  #include <linux/ktime.h>=0D
>  #include <linux/list.h>=0D
> @@ -18,11 +20,13 @@=0D
>  #include <linux/stop_machine.h>=0D
>  #include <linux/string.h>=0D
>  #include <linux/sysfs.h>=0D
> +#include <linux/types.h>=0D
>  #include <linux/uuid.h>=0D
>  #include <linux/workqueue.h>=0D
>  =0D
>  #include <uapi/linux/psci.h>=0D
>  =0D
> +#define DRIVER_NAME	"ARM_LFA"=0D
>  #undef pr_fmt=0D
>  #define pr_fmt(fmt) "Arm LFA: " fmt=0D
>  =0D
> @@ -694,6 +698,112 @@ static int update_fw_images_tree(void)=0D
>  	return 0;=0D
>  }=0D
>  =0D
> +/*=0D
> + * Go through all FW images in a loop and trigger activation=0D
> + * of all activatible and pending images.=0D
> + * We have to restart enumeration after every triggered activation,=0D
> + * since the firmware images might have changed during the activation.=0D
> + */=0D
> +static int activate_pending_image(void)=0D
> +{=0D
> +	struct kobject *kobj;=0D
> +	bool found_pending =3D false;=0D
> +	struct fw_image *image;=0D
> +	int ret;=0D
> +=0D
> +	spin_lock(&lfa_kset->list_lock);=0D
> +	list_for_each_entry(kobj, &lfa_kset->list, entry) {=0D
> +		image =3D kobj_to_fw_image(kobj);=0D
> +=0D
> +		if (image->fw_seq_id =3D=3D -1)=0D
> +			continue; /* Invalid FW component */=0D
> +=0D
> +		update_fw_image_pending(image);=0D
> +		if (image->activation_capable && image->activation_pending) {=0D
> +			found_pending =3D true;=0D
> +			break;=0D
> +		}=0D
> +	}=0D
> +	spin_unlock(&lfa_kset->list_lock);=0D
> +=0D
> +	if (!found_pending)=0D
> +		return -ENOENT;=0D
> +=0D
> +	ret =3D prime_fw_image(image);=0D
> +	if (ret)=0D
> +		return ret;=0D
=0D
I think this can end up using "image" after it is freed. We drop the=0D
list lock here without taking a kobject reference.=0D
=0D
> +=0D
> +	ret =3D activate_fw_image(image);=0D
> +	if (ret)=0D
> +		return ret;=0D
> +=0D
> +	pr_info("%s: automatic activation succeeded\n", get_image_name(image));=
=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +#ifdef CONFIG_ACPI=0D
> +static void lfa_acpi_notify_handler(acpi_handle handle, u32 event, void =
*data)=0D
> +{=0D
> +	int ret;=0D
> +=0D
> +	while (!(ret =3D activate_pending_image()))=0D
> +		;=0D
> +=0D
> +	if (ret !=3D -ENOENT)=0D
> +		pr_warn("notified image activation failed: %d\n", ret);=0D
> +}=0D
> +=0D
> +static int lfa_register_acpi(struct device *dev)=0D
> +{=0D
> +	struct acpi_device *acpi_dev;=0D
> +	acpi_handle handle;=0D
> +	acpi_status status;=0D
> +=0D
> +	acpi_dev =3D acpi_dev_get_first_match_dev("ARML0003", NULL, -1);=0D
> +	if (!acpi_dev)=0D
> +		return -ENODEV;=0D
> +	handle =3D acpi_device_handle(acpi_dev);=0D
> +	if (!handle) {=0D
> +		acpi_dev_put(acpi_dev);=0D
> +		return -ENODEV;=0D
> +	}=0D
> +=0D
> +	/* Register notify handler that indicates LFA updates are available */=
=0D
> +	status =3D acpi_install_notify_handler(handle, ACPI_DEVICE_NOTIFY,=0D
> +					     lfa_acpi_notify_handler, NULL);=0D
> +	if (ACPI_FAILURE(status)) {=0D
> +		acpi_dev_put(acpi_dev);=0D
> +		return -EIO;=0D
> +	}=0D
> +=0D
> +	ACPI_COMPANION_SET(dev, acpi_dev);=0D
> +=0D
> +	return 0;=0D
> +}=0D
> +=0D
> +static void lfa_remove_acpi(struct device *dev)=0D
> +{=0D
> +	struct acpi_device *acpi_dev =3D ACPI_COMPANION(dev);=0D
> +	acpi_handle handle =3D acpi_device_handle(acpi_dev);=0D
> +=0D
> +	if (handle)=0D
> +		acpi_remove_notify_handler(handle,=0D
> +					   ACPI_DEVICE_NOTIFY,=0D
> +					   lfa_acpi_notify_handler);=0D
> +	acpi_dev_put(acpi_dev);=0D
> +}=0D
> +#else	/* !CONFIG_ACPI */=0D
> +static int lfa_register_acpi(struct device *dev)=0D
> +{=0D
> +	return -ENODEV;=0D
> +}=0D
> +=0D
> +static void lfa_remove_acpi(struct device *dev)=0D
> +{=0D
> +}=0D
> +#endif=0D
> +=0D
>  static int lfa_smccc_probe(struct arm_smccc_device *sdev)=0D
>  {=0D
>  	struct arm_smccc_1_2_regs reg =3D { 0 };=0D
> @@ -730,11 +840,22 @@ static int lfa_smccc_probe(struct arm_smccc_device =
*sdev)=0D
>  		destroy_workqueue(fw_images_update_wq);=0D
>  	}=0D
>  =0D
> -	return err;=0D
=0D
Should check the err value and return early.=0D
=0D
> +	if (!acpi_disabled) {=0D
> +		err =3D lfa_register_acpi(&sdev->dev);=0D
> +		if (err !=3D -ENODEV) {=0D
> +			if (!err)=0D
> +				pr_info("registered LFA ACPI notification\n");=0D
> +			return err;=0D
> +		}=0D
> +	}=0D
> +=0D
> +	return 0;=0D
>  }=0D
>  =0D
>  static void lfa_smccc_remove(struct arm_smccc_device *sdev)=0D
>  {=0D
> +	if (!acpi_disabled)=0D
> +		lfa_remove_acpi(&sdev->dev);=0D
>  	flush_workqueue(fw_images_update_wq);=0D
>  	destroy_workqueue(fw_images_update_wq);=0D
>  	clean_fw_images_tree();=0D
> -- =0D
> 2.43.0=0D
=0D
Regards,=0D
Nirmoy=0D

