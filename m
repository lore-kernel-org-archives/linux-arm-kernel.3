Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01968CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 04:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GcExelvZHgLHmnH/LZ0YNu1y/pUMQdmMrtdtUrutEo=; b=cD7+gAQXCi8AeF8WJdvKePf9+5
	FL6s4oFuI5PLO4VS8cisryfwFfFtAj/OSectJND4e8UsjS3T3As14KizaJq6HwtG6x7/tHoZ/ywrF
	fvvptrSx5FGPBFsgC6OhOxiWxH/PKuQoqzITjWdzqvYAI66wkpK+PVm05wVIo30ZwZOKipzaIZAP6
	hu4Yla9IIzRMKBkUIY+eOOBmXTxPOTx6uVtIjGCZM1qA+xsg7uqKF3g/iemIifJJ6VfQbolFkS6XZ
	nwMtkfOFm4CmqmTPZXVB17mp5qB/327gZVzUGxwtLXMhcLH/p5Xifx0N/x5waCWArJ+ac/dq0YEhh
	om/l7SSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgTE-00000005MtF-0Q2W;
	Fri, 31 Oct 2025 04:10:36 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEgTA-00000005Msr-3h17
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 04:10:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WU0ek1Vycn5YFK6YZ3nWO5T0c3akarf4dwOQJh2ZGN7FFCbRkUd6ZTNAJloRzyrt3r8K0Uvvk6WK6ZN0cX+tkVyKYC/0B551rcpezMlDhStrxnrMzmLvIbyfQCv6Gh9n29/0hp27Ii/f+5Gg03Lw5oUOJ8oBkvLqSrP2TIiJksDgF7HyhB11tfMszooEHxn1yZ4GYaYmNYypZu9PdLgfrqOYF137nNcqLJ8k5eZ0zkLKFhV5u7aSAaZS9RWa8xIkjR4SppPAzR+qfjtHEi2q09VCQ/5QwYKYCd1w5sFChFtZKKXG3bnWxBoipVNB7QytLp0i0LP97EeR78krWwblKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GcExelvZHgLHmnH/LZ0YNu1y/pUMQdmMrtdtUrutEo=;
 b=cbcPvTI+fqxIJLqghFeRO3Uz+gX9LjveiJwsj5c4GldUmTDKQwv1tXLwbwCFypZ78Nt4V7lLVJwnQe3V1Kjj9ml1GryX95RGEEE5WUrkxhNE56bMX2N2b0a5KVf2adB6Q+L+WRNwbU8QWPpWldwJhWF8mCmH1Yu1IAK05XFqYEZjs1uRSxaAAkoqVnchkRgSRu6BhsSrkw4QM2OR8nRj/kDhgX9Yz1fD4nhsnBV2IaX+QFu+tKim6cb/Um9SjlO+NWwTZBwwyn51t3SvfJi+QGSU/qxo7ASr9sYdQyAJNvEE4m41rYycBUCJnWeMqM6dD+Fk8KdMS4TFXDvOn9TDCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GcExelvZHgLHmnH/LZ0YNu1y/pUMQdmMrtdtUrutEo=;
 b=Hy8Nn9rCuPQCiq/WwgGMlYb5xZ61EO6wcGlPu4OLwh4n0Q1MYzeZTsg4MepAEN6eUw9fnXIe3f9Fr6IT5elrxdy+f/jbxPfIPqF5HvDLA+q7R3r8OWWwuTfz8xmka/5r6XFU8jv7iJqS/b4et4d7a6mmCzy1QlzoNRx8DQ90Gw8=
Received: from CH2PR18CA0008.namprd18.prod.outlook.com (2603:10b6:610:4f::18)
 by DM4PR10MB6693.namprd10.prod.outlook.com (2603:10b6:8:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 04:10:27 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:4f:cafe::cd) by CH2PR18CA0008.outlook.office365.com
 (2603:10b6:610:4f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Fri,
 31 Oct 2025 04:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 04:10:24 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 23:10:13 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Oct
 2025 23:10:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 30 Oct 2025 23:10:13 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59V4ADZu3280795;
	Thu, 30 Oct 2025 23:10:13 -0500
Date: Thu, 30 Oct 2025 23:10:13 -0500
From: Nishanth Menon <nm@ti.com>
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, Richard Genoud <richard.genoud@bootlin.com>,
	Udit Kumar <u-kumar1@ti.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: ti_sci: set IO Isolation only if the firmware
 is capable
Message-ID: <20251031041013.kfyveddq7rkmtvfv@wince>
References: <20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DM4PR10MB6693:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a751068-1f97-4374-fd74-08de18336a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|34020700016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4YKfbbKdHiKShwfSzTEqvMMFjGPOA95b8itDZ7idVvcM0Pcdcj4c9RpoOh1J?=
 =?us-ascii?Q?m7EWbRUuYq+OIogriOWEpzGTVhcgY/krAKVKufOBlHelBdf03QdNQF9/wAjB?=
 =?us-ascii?Q?D77wq5gDJJbDy8rPZPlP/HFO29ejqYa7/TpNrV+7MSLBAVKlEpZdRJUNYw0g?=
 =?us-ascii?Q?JsdgNsUsMTKWngOOVA6ReGdhmQNpY4hJyvelNY5BVgzVeDKyhWS32wAMUkn7?=
 =?us-ascii?Q?Htkhg2/H5KJ3YAkxaeWbOl7MmItgwsrwt/wN1OWYY5KCSZYMu1DwrLJB8jdB?=
 =?us-ascii?Q?3Tbk+PNpZgQUY7vxUylesRcRfyBR6CyxEgpubFDE7OI6A9qvFJck9YGg7Ogj?=
 =?us-ascii?Q?WXMbAhoJPy+8yI4Q6P0DCcE2jDfPXn4BqPJaXN6/YQsIttwQOqlPrVVgsHjf?=
 =?us-ascii?Q?J/4eKswcPdJMCwebF8Pd9dfOBqXND7IA5b4DaE+hsBiQ+8wmiEdcAGaZnJLb?=
 =?us-ascii?Q?rY+rkPSS1maebIxVYHM88Togo/8dk2PukZXyCeJCZX5LX+bNeeRDGbXTRqNU?=
 =?us-ascii?Q?CLH3Rm8VZMEFW7TaEBwtBKl/LVt62DpxSy6ukvppXsbN0qydhqwHP7DjhAgb?=
 =?us-ascii?Q?cAnriFA9seGQMfKITcVLqtrSKpVlMrapE8fRlCNlcAMMkEMJPkDBN7c9rwX+?=
 =?us-ascii?Q?HNqdzxJIdtZFBW771Bw/Wh+BfIE7vGBXtN3vXi6aM0vt+6c4d2I34tQNWIiR?=
 =?us-ascii?Q?GoKjJ1yNHu18Y+iPspa/gmbdcA6XAWSKETBVvX9X6OuSLTLxz3UhW4X1EWu2?=
 =?us-ascii?Q?pAj1zw3bur9Y+mawARgmLuKkW+P2xKYyApAFq1cCBX/MoAqRVMCz2rQaDfkS?=
 =?us-ascii?Q?up8lkaF7cag+ys84ijd163I5yPWHlJAVE9cf/JpJCbVVRiWVKEJfUUIkzQ2a?=
 =?us-ascii?Q?qKswG9oNMXmfhEKBtOY4PEdlgbWF6Q3AMgsBuHKsUVIHwh2ZfUtOc2xE9N6I?=
 =?us-ascii?Q?a7GuScDyPxNMdNionVxG0E9zWopF0pvqgyi19qw+Osew5hJESWiyYDfGabkN?=
 =?us-ascii?Q?M1oe2BDy1wYxsoSzooUhuB/9Ve/zyvA9tl5T/E7DhZ+UHFG/CZhKv7I9vIAg?=
 =?us-ascii?Q?EOSIZe+I4k6B4LsaPzRPB6Njj5kM6oNV4ZVanggtmboCsrA44dzdM7Lu+Y7X?=
 =?us-ascii?Q?0K+W+JEAn39+C4+Ge8T72w9khQlJ9zt9ZUtz7NarVOyOjBsw6BnNzWXa2i1M?=
 =?us-ascii?Q?fJ5RO6I5b8fYioeaaZGA1bcIuIEs5eOwbdaxGM6vfSLzlzjgDzuV7bvT/0kq?=
 =?us-ascii?Q?ywqx0Pdk2AAtiD7VIurrCaD97j4gyMMqdKHWNE7jTtFbJHp2XKwk3IVZHRHb?=
 =?us-ascii?Q?re623KJuWADZPaP4LPiIcXAGa1DrWJlkvinl+k1g7HRyiJngaMsbO3NCXmAK?=
 =?us-ascii?Q?Y3M5PZBOs35aoFd4KDuphMFQzTa9m1ZvF6upw/qMK6X50s6Rp4b5vIFCYle4?=
 =?us-ascii?Q?Pz1MKkRmc0KjF6ukjC9RHqDnqp2WgC023GgVKxo4N6bUbEBmW9qKv7Zq3jYv?=
 =?us-ascii?Q?VTK6Z+EhtaRCIgwnmsPsbD60GEuQB2DtmRmePxshefufrr6LHz0A14fckfMd?=
 =?us-ascii?Q?kwzr3W0WJWlt/KUJ6cY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 04:10:24.0388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a751068-1f97-4374-fd74-08de18336a6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_211033_304754_0B7337C0 
X-CRM114-Status: GOOD (  23.16  )
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

On 10:31-20251014, Thomas Richard (TI.com) wrote:
> Add the IO_ISOLATION firmware capability, and set IO Isolation during
> suspend only if the firmware is capable.

How about:
Prevent calling ti_sci_cmd_set_io_isolation() on
firmware that does not support the IO_ISOLATION capability. Add
the MSG_FLAG_CAPS_IO_ISOLATION capability flag and check it before
attempting to set IO isolation during suspend/resume operations.

Without this check, systems with older firmware may experience
undefined behavior or errors when entering/exiting suspend states.

> 
> Fixes: ec24643bdd62 ("firmware: ti_sci: Add system suspend and resume call")
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>  drivers/firmware/ti_sci.c | 21 +++++++++++++--------
>  drivers/firmware/ti_sci.h |  2 ++
>  2 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> index 49fd2ae01055d0f425062147422471f0fd49e4bd..8d96a3c12b36a908097805b44dc3343172fbbfec 100644
> --- a/drivers/firmware/ti_sci.c
> +++ b/drivers/firmware/ti_sci.c
> @@ -3751,9 +3751,11 @@ static int __maybe_unused ti_sci_suspend_noirq(struct device *dev)
>  	struct ti_sci_info *info = dev_get_drvdata(dev);
>  	int ret = 0;
>  
> -	ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_ENABLE);
> -	if (ret)
> -		return ret;
> +	if (info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION) {
> +		ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_ENABLE);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	return 0;
>  }
> @@ -3767,9 +3769,11 @@ static int __maybe_unused ti_sci_resume_noirq(struct device *dev)
>  	u8 pin;
>  	u8 mode;
>  
> -	ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_DISABLE);
> -	if (ret)
> -		return ret;
> +	if (info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION) {
> +		ret = ti_sci_cmd_set_io_isolation(&info->handle, TISCI_MSG_VALUE_IO_DISABLE);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = ti_sci_msg_cmd_lpm_wake_reason(&info->handle, &source, &time, &pin, &mode);
>  	/* Do not fail to resume on error as the wake reason is not critical */
> @@ -3928,11 +3932,12 @@ static int ti_sci_probe(struct platform_device *pdev)
>  	}
>  
>  	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
> -	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s\n",
> +	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s\n",
>  		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
>  		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
>  		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
> -		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : ""
> +		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
> +		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : ""
>  	);
>  
>  	ti_sci_setup_ops(info);
> diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
> index 701c416b2e78f8ef20ce6741a88ffa6fd4853b2d..7559cde17b6ccfeeb1bc357fce5c5767c3f75c54 100644
> --- a/drivers/firmware/ti_sci.h
> +++ b/drivers/firmware/ti_sci.h
> @@ -149,6 +149,7 @@ struct ti_sci_msg_req_reboot {
>   *		MSG_FLAG_CAPS_LPM_PARTIAL_IO: Partial IO in LPM
>   *		MSG_FLAG_CAPS_LPM_DM_MANAGED: LPM can be managed by DM
>   *		MSG_FLAG_CAPS_LPM_ABORT: Abort entry to LPM
> + *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
>   *
>   * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
>   * providing currently available SOC/firmware capabilities. SoC that don't
> @@ -160,6 +161,7 @@ struct ti_sci_msg_resp_query_fw_caps {
>  #define MSG_FLAG_CAPS_LPM_PARTIAL_IO	TI_SCI_MSG_FLAG(4)
>  #define MSG_FLAG_CAPS_LPM_DM_MANAGED	TI_SCI_MSG_FLAG(5)
>  #define MSG_FLAG_CAPS_LPM_ABORT		TI_SCI_MSG_FLAG(9)
> +#define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
>  #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
>  	u64 fw_caps;
>  } __packed;
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251013-ti-sci-io-isolation-63a8bcd9d4e9
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

