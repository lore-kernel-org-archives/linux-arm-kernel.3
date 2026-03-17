Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06B5F3029A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3+PHo24e+aDi4WeNBRVStbJTyni+x5rpOhGeG97lCQ=; b=BfTDyJw5oy4W13PHoEJ60eCaJa
	9Qap7VaGIL6dPvqR5jlVYB7TcKs2kYSinQe6e3mmZY4+wcC0NySyOaJQJXYZW/8T1O1aHJQaJ+T+w
	Wj3Q8IA36NG5fmuxQUeURPdZ4x4lMVSZdYBZv1dpKSmlt4vFTVa5H/Gy5scyWel9NDZsNN4XXq6NC
	0EXxJMzyzy1qffAoikJbGknPeveoQB6+CXqilW7dNNsyw58c+ti7vuhzOKBbNVSxWXa2RsYnO4Wri
	TldaY2g3VcnYIh7ORJntGxtyfQeScBcd5lnXHtEoBSkT5wHtVSm67EW23OxGgRQVmNv6Ta/BdJ4f4
	a2vZns8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NIa-00000005SYo-2sOw;
	Tue, 17 Mar 2026 05:49:00 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2NIX-00000005SYI-3H9X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 05:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuMr5NSOTh67gSAcX4gSVpj8vrAyHOuH+1ORwtjiO1uqrb9g7NvGXU293n9e3LcpSCXbOO1Cr1lMSzMhuRHIjrdauHDqngsJFIiVsqo5UJ27KYWj2a8k1PN28Bm3bLI+IFHwn/nHq9uc7+sxFBHmrPudTzZRRbUTHYV7Di+cuZjuClb1DqHUZeWltdx8JccqKoBgpmDr9Ek2iZlE4T3Gw00CxtkVX5+aTSgprqi++14E9UpnGkhlLg51R6G6jbMYFWIU51vPFgTyLBJzzkqy76PG5e19cjS8L+3O/cOtQKslIegj2Ei+L9odSwSmrqrQloU5S8CiPmq9dSk/u+XQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3+PHo24e+aDi4WeNBRVStbJTyni+x5rpOhGeG97lCQ=;
 b=u8+y0/YuzbGVdtEEbp5Ew3UG2Vu/bnTZWGMDTPqMRtr747mWDKaxgsbpTE6DeVysm6uUmfEnLm3GRSgK6I6+aBUaDzIYjijKh9dxJZaNsXRVGBBJpMIANCSTdiZqHvcNzMF301Gl3aYO4Nc+se/bkStDJF1qDI2vrDKmQBnmE5oAp9KbrPjH4J4ipkMStbnaCSD6NArZ45jY8W53eFe/U3rlHjMIj4rVjey/PgfwpUY2coD566HfZF3sB5qI4T/csEfjEBOkuc22Jg/SE60LZsa1l0gognRbrdiIhT6hqaTEe5ysnETLiE0MdPG1Ugn1kuYAyW1xztgIsF3+ti88Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3+PHo24e+aDi4WeNBRVStbJTyni+x5rpOhGeG97lCQ=;
 b=pZN9Y2Y8sSaIW+u1yiHmy/dJrSvSDsyb6pkRAJfnlnpUZ9wYkTzR71v/cEf37W/tVmfZ05ffEenBb5EKxPy8kOpvsGwBZKf7vnTATCMABdrgat/FPBm5ajRe5lEV8nMbx8RcX7rEmXyxVPXN/X/aNFFLBThP9WqQVmGUMvLpJfI=
Received: from BYAPR06CA0051.namprd06.prod.outlook.com (2603:10b6:a03:14b::28)
 by PH0PR10MB4631.namprd10.prod.outlook.com (2603:10b6:510:41::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 05:48:53 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:14b:cafe::1) by BYAPR06CA0051.outlook.office365.com
 (2603:10b6:a03:14b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 05:48:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 05:48:52 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 00:48:46 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 00:48:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 00:48:44 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H5meKH2126174;
	Tue, 17 Mar 2026 00:48:40 -0500
Message-ID: <7ff12e4d-a1c4-4a7f-b80c-62b68f698672@ti.com>
Date: Tue, 17 Mar 2026 11:18:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] soc: ti: k3-socinfo: Provide reset reason
 information
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Andrew Davis <afd@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, Abraham I
	<kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
 <20260316070429.1545707-4-alexander.sverdlin@siemens.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20260316070429.1545707-4-alexander.sverdlin@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|PH0PR10MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a22fb9-3507-4bb3-f2f4-08de83e8def4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ACJDDT2fzHNrm/M4yZOpJu5KgjQjJN+LrRagEUeKPWHIBPRz4rsnNwz5BXw0k+JI25hqxomZHZR1FQo3icmmlqW0uHvnv+m8viM1S1VF7BmA1m12HxqyGPIzngYf2mX729DlaovN+6PqAR82uXoizvzgKL9dL4jtTm3WlxZGphTvF6+H1T08eSVZyqRgL3gn3NNTNli51D2kvULPYVVp+UVAGnmcOU38k7P6FIkbiKlX17tvkGMHvDc95SATBXOavpa1VwqdPVLyyZX9hLaWk6WdAgNmaQA4OMu/KE8weKEgP++OSXpQWJi5vzFSUNoGMhMjN13QZD5LfQGfc/IsFzLkyh/xjMzRk2XhZ0JT67gjDd2+VXIN0nHKOLyHCvJDDSrKkiPjY2QdO0Zz0WyDk5ooajE8g9mquDNb2C6EMWduMwGIpU49kwai+vQxwFFx1aVD9aMKo24zMJG1x0SiTz1jTs7fbROjMqoIU1T0Pu8lRohoMWun/JhSAMvq62dq7kudV+iPIYqptDComMd0eI97VjDAdgD6l6OO5ikuBO1XmRqiMm71OfjZMQDR1NhP7JQHbXOqFXUWupqM1ER7A5JHeYBFEV5+ap1KifegrrCA0m6YM0Tjr4hMhZnmXk6VWBVRF93GlwP6qFTgQompSpFb5+98RlA2H7pk4yDBkCWcxxyr8EziT827KSreaP8uyoK+ebdXo7ahsyhZrf1YHxmRzgKJ75p5xe66rqoyETk=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2aXmZyFhQw1R5CeMVq3AAlgo9QxPjcUjcfNtqlee1gU6BOrYLbpv7eQK7she9Z/Zy1KTc8ltQOFWWefb5XuLHJsAdjdInSMyRk9BpLrWPM4kc8uIxj9RDZCgb7FSweGXFV19774IQjgQ3WIN38+W4PRDtamDr7HlBCAzWC+CimtOYMSFgEF3afRP8Vlk0gFqV/XBFP0V0CZTstJie5c2TKr/vZ0r+hrQiSrT+qKQ1h6QqQWQ11p4TvWgvjghgbotO3AgjAfjOWMostLgdulmezOJYPAZcODBRkMm3Z0f2PLNL33vRWEoBUx2EQ6GU6akcxDv0K8nYDA/0ViEzUG9H9F/g2htvXX5CbrQQRKUMgGwitIAbVMpjuLeJZE+qk9rWAt9qn44gcSw7DSSnrsgTtKAIipMqcjDxbXWRF1uYlHe+ETFmbVjVYNXB0d+t5O/
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:48:52.7990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a22fb9-3507-4bb3-f2f4-08de83e8def4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_224857_881664_EC23DC66 
X-CRM114-Status: GOOD (  28.87  )
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

Hi,

Thanks for the patch!

On 16/03/26 12:34, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add reset_reason attribute decoging the RST_SRC register present in AM64x

s/decoging/decoding . please run spellcheck on commit msg

> and later SoCs of K3 family. Textual representation of the bits was taken
> from the AM62x Processors Technical Reference Manual, except the POR, which
> is not signalled explicitly by the reset module.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>


There is support dumping reset reason in U-Boot for AM64x:
https://elixir.bootlin.com/u-boot/v2026.01/source/arch/arm/mach-k3/am64x/boot.c#L107

This conflicts with kernel as U-Boot currently clears the RST_SRC after read (Its
necessary to do so, to detect additional resets at bootloader level). So, this
information would be lost by the time kernel driver comes up.

Is there a usecase where kernel can make use of reset reason information exposed
via this driver? If so, the driver should at least take a cmdline param from 
bootloader in order to overcome above issue.

> ---
> Changelog:
> v2: no changes
> 
>  drivers/soc/ti/k3-socinfo.c | 88 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 676041879eca3..3736c982fd0c8 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -45,6 +45,8 @@
>  #define JTAG_ID_PARTNO_J722S		0xBBA0
>  #define JTAG_ID_PARTNO_AM62LX		0xBBA7
>  
> +#define CTRL_MMR_RST_SRC		8
> +
>  static const struct k3_soc_id {
>  	unsigned int id;
>  	const char *family_name;
> @@ -123,6 +125,90 @@ static const struct regmap_config k3_chipinfo_regmap_cfg = {
>  	.reg_stride = 4,
>  };
>  
> +static u32 k3_reset_source;
> +static const char *const k3_reset_sources[] = {
> +	[0]	= "Reset Caused by MCU Reset Pin",
> +	[1]	= "Power On Reset",			/* Reserved in HW */
> +	[2]	= "Main Reset Pin",
> +	[4]	= "Thermal Reset",
> +	[8]	= "Debug Subsystem Initiated Reset",
> +	[12]	= "SMS Cold Reset",
> +	[13]	= "SMS Warm Reset",
> +	[16]	= "Software Warm Reset",
> +	[20]	= "Software Main Warm Reset From MCU CTRL MMR",
> +	[21]	= "Software Main Warm Reset from MAIN CTRL MMR",
> +	[22]	= "Watchdog Initiated Reset",
> +	[24]	= "Software Main Power On Reset From MCU CTRL MMR",
> +	[25]	= "Software Main Power On Reset From MAIN CTRL MMR",
> +	[30]	= "Reset Caused by Main ESM Error",
> +	[31]	= "Reset Caused by MCU ESM Error",
> +};
> +
> +static ssize_t reset_reason_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	int ret, i;
> +	int total = 0;
> +
> +	for (i = ARRAY_SIZE(k3_reset_sources); i >= 0; i--) {
> +		if (!k3_reset_sources[i] || !(k3_reset_source & BIT(i)))
> +			continue;
> +
> +		ret = sprintf(buf + total, "%s\n", k3_reset_sources[i]);
> +		if (ret < 0)
> +			return ret;
> +		total += ret;
> +		/* Note that several reset sources may be active simultaneously */
> +	}
> +
> +	return total;
> +}
> +
> +static DEVICE_ATTR_RO(reset_reason);
> +
> +static struct attribute *k3_soc_attrs[] = {
> +	&dev_attr_reset_reason.attr,
> +	NULL
> +};
> +
> +ATTRIBUTE_GROUPS(k3_soc);
> +
> +static const struct of_device_id k3_rst_id_table[] = {
> +	{
> +		.compatible	= "ti,am64-rst",
> +	},
> +	{}
> +};
> +
> +static void k3_reset_reason_read(struct soc_device_attribute *soc_dev_attr)
> +{
> +	struct device_node *node = of_find_matching_node(NULL, k3_rst_id_table);
> +	struct regmap *regmap;
> +
> +	/* AM65x/J721E do not have similar registers */
> +	if (!node)
> +		return;
> +
> +	regmap = device_node_to_regmap(node);
> +	of_node_put(node);
> +	if (IS_ERR(regmap)) {
> +		pr_err("Cannot obtain %s regmap\n", k3_rst_id_table[0].compatible);
> +		return;
> +	}
> +
> +	regmap_read(regmap, CTRL_MMR_RST_SRC, &k3_reset_source);
> +	/*
> +	 * The register is only being cleared on POR, so we have to clear reset
> +	 * source of the current boot manually
> +	 */
> +	regmap_write(regmap, CTRL_MMR_RST_SRC, k3_reset_source);
> +
> +	/* Simplify the code a bit and use HW-reserved bit for POR indication */
> +	if (!k3_reset_source)
> +		k3_reset_source |= BIT(1);
> +
> +	soc_dev_attr->custom_attr_group = k3_soc_groups[0];
> +}
> +
>  static int k3_chipinfo_probe(struct platform_device *pdev)
>  {
>  	struct device_node *node = pdev->dev.of_node;
> @@ -183,6 +269,8 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>  	of_property_read_string(node, "model", &soc_dev_attr->machine);
>  	of_node_put(node);
>  
> +	k3_reset_reason_read(soc_dev_attr);
> +
>  	soc_dev = soc_device_register(soc_dev_attr);
>  	if (IS_ERR(soc_dev)) {
>  		ret = PTR_ERR(soc_dev);

-- 
Regards
Vignesh
https://ti.com/opensource


