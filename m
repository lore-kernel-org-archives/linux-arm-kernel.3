Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B83EC4453F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOCfGAWgbE5McsMYyOnuSGnx0+90LTimQv11BfBA474=; b=SgejdERO62t8I2ifYjN27AtcJ4
	wNePey2AODkCRaOLZgLrRgvJvr2udnmJ88DldmfO3XcPpTuNd9Gq3zaebGemr4zmnSraOGjjTrNSr
	0AU6Yhstb/oZJKTYc34CDA32dpYfpjjI0kUdRyDSCLhsGqyOcN+vk0/ssRxjDXtEUH6vyl5B3+sXR
	Iy3J+vjIXXr7TAUS02n34Yz0mB9ZcMuxnEF+65SAhC1jZzTbDlAGwxolKwNMF6M+s+iTcrhXoheXi
	wC5JFI86Q+m3+s7xDxc8Gp6u6ZygT2xm4Q19hPfQ24DUEBZuQGj+QnrKXHN54xEAOQ2Vyy8eJHTrl
	D7psqpqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuK-0000000C9t8-2VME;
	Wed, 22 Jul 2026 15:30:52 +0000
Received: from mail-northeuropeazon11010051.outbound.protection.outlook.com ([52.101.84.51] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYuH-0000000C9pf-2Y9S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 15:30:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8POvpc84BYROtQnwnmtEZpZ6eEwVyrlEwLa8/PkcDO23SmauhUhX+SHCzpmSIqbS9d44lmKEtzmmyOpZZhBusX7j5airHfxaT3nX0FQFiBcmz3KiJf7EEmhI85+7XpRzoIbUUGJkVpx+MirXjw1Mehk28sejw1r/CaOkKAugk7+yq8MiYSfHjS+VmidUQtfiiv87g6WMn7L9tQwsyzk3zeBXO/pytJZorer8sx/aPZvQZXPxRRVavdqBcioyEK40lU9qcsVhmo+kG17j7e+Ww4iWBz1f4+bbcIw/eHLKs/Zg4eJJoPR45MGjJYk9eYYcVSd5B3s2WGuW5J3Sl0pDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOCfGAWgbE5McsMYyOnuSGnx0+90LTimQv11BfBA474=;
 b=XhEDXQQzGjq8SpJHaTsBAiiXiAtdMdVU2r5e6zSV/Jodf+mMWp8ebrrMhNEZImP/eohj5zOrY+XIy3eKPTBfeiFexWZzu4vW0oq8fHdTTzy2xMnb8WlsykSjQAaYoLYV6l2DFyJMlvKwK1ujGGk7zPTXQHAZEFXyuu1pEM2JZ2vFg4Aw8elNiN8N1H4j8Ivg09Iaxcf0cqNMzqeXCCiXICtdN7kbBNoqarvZzQ6pKRRWAuIVNqo0vIBBYhJ8BqBlROxY+ksgUSrvuiltfQ7K+liZJumJhRdmhBzjcBt/TudI/+36yWz1CGSX6e20Dxco1Ee83IPKOV0yg/NLco1+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOCfGAWgbE5McsMYyOnuSGnx0+90LTimQv11BfBA474=;
 b=mU268o3DsnWboRzqIR9RL69QKem+wY/WG8LLwnML1jNGWP7VrTrBWdxardtl4dZATGF72JKYRtztGhpvuyMQXMMhXlA1S4aEp5zQep3r+2rF14T4M36Jni8dYrJrRMm8KGpabBHOkzO7VMMU9DBVlC2HxroM2uhhga6iq/xxGsD3J8t+fHvtwfQNWCBDhohbzuWKE8I8/MxJV3nC4U5Jz0KJRlHvX52sy5hZCdroYIz4uKmdoPg53yIHW3DAoa9v6wX0e+dAiCcVHA/crrVL0sXdVm9z05nTw5NSQATL2JEvJU7yy2LagcFzTyXUiMvrkNcwREFPr9K6d/wKmoa49Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9980.eurprd04.prod.outlook.com (2603:10a6:800:1d0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 15:30:44 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 15:30:44 +0000
Date: Wed, 22 Jul 2026 10:30:34 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Can Peng <pengcan@kylinos.cn>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/imx: Disable clock on runtime resume
 failure
Message-ID: <amDiGlN13RX9J1rC@SMW015318>
References: <20260722084909.463437-1-pengcan@kylinos.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722084909.463437-1-pengcan@kylinos.cn>
X-ClientProxiedBy: SA9PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:806:27::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9980:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9ba6eb-418f-43cf-f8d9-08dee8063236
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VPabih3ElMy7YnokdNe1YusX+JVcDBX8J4ZnPQgV4F6vp4hPhz85HvlPjqotTOO1jeidw8bHD55OckLjHxZCE01O94JUYvh9GcSpM9saeRxObvgchA7VN23/PrmxMN8xhCN3PxO7bdIPKaUSN2XLQnjF/p0CgEl/rxyt2nm52cfWdJzMmvndng3PLYrZYKN3DKT3SO1gX7SSh1Qv8/fbIIETbsEteZboaj2pmhDjxreFX1TDFixUpTXAprti4/eQMPzG/orrp75nwPzy+x3KR7TuQo1MdpTwZWsRnnClu00CFp6M9Uv4iSDRV+y7sZeEpIIE4jK43xYDJktEoa6SiKyqdGn8LdsfuqFHxvOD9eZQ5szykB51BexjfodXq4JoLkZmvBEcJAIXREiyfF9jrzEsmqZ4oSr6Sj83VKFURfuVs6gBr6I9qYacx9/+UjtpwsZuTlHAuuw4VhzxTfcDjd8SFQaNkAYXCXOgPnDG+7IJhRZ3r3UEk6hni2JMjjzdua64kb8brh2ooq++x6nWPd8LVLVEsIQ5Nww+h0iXueKOfmVx5hvcgu0dLlUL7+XuvZFigl+XqGKd1cutmsuJihW96W2OfnoySQlEbj2XM6lZl7JPd8mLeEpsi1dTkBDNfHb7umpHHAJnN7v+Yl+7uywbj8YWNOGiR571uHVtfoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?96MiDxi8WSQTik+mmZdFaO4yxyCh4ubOf96z8rsZ75exZhblMyFaJIa9Aqvm?=
 =?us-ascii?Q?Z9rY4LUrYe5WFRSsHbkOv+JwGuC92Z7C66os2pt08AJxzJGkZRNKMc5KLfme?=
 =?us-ascii?Q?/PQVRAQNpu8vq118RpAWbuq33m7qm1QfDZ2vLwyF5Dcky+JfQru1+SG8K19F?=
 =?us-ascii?Q?U5zd0qmP8oiSb+G8yBCTTBLr5CvYyC3/A2qgnFqRB0wI+O2CV9/cUGvOT3dc?=
 =?us-ascii?Q?aX8cJwpRmlftr0m7shemyhK8VBegynH8rMEMm1L7idRMpgC7DFaTgRSKg0iA?=
 =?us-ascii?Q?9Pv+WQqXOtKzh+RC7gzJOQZA2wtL98fBE7tRklQzVPoTM8n528yjK3bBuClb?=
 =?us-ascii?Q?nY+KVgZkuBJNQDjm2GXZEh5Bq3PkalCaaVUrqipezn2Uap6pe+srReylwItS?=
 =?us-ascii?Q?sXLQ22L3+ajldL7sOX9oNAoTP7PjYCBaHpxRe90ubNnnbFVDwhx+b0t32njh?=
 =?us-ascii?Q?4Cq85mgvILr55Ov1TXShvKyE6cfBmKsRa9Yk+Ir8TY+Ip2XSCoR7U5JU7sLd?=
 =?us-ascii?Q?JtNzPVg4x7zq8ZLe0x1iMWuwl+8B5ybABNFfbt+pnU5heBjX61/kWJgqzvf5?=
 =?us-ascii?Q?tGIAxXV/3ToDhxFsoBCeONaXb5+NAcOtSES29kK8VYRFpU0uB4gC4ci1t+ZO?=
 =?us-ascii?Q?2VcntSyqsPBonY+30I3riiB8f3lwIKZ0jfdJb7sNfZzB86+n0Rd3BCGOSkm7?=
 =?us-ascii?Q?OlO7qvkZArww+ACeqh7qSr7ToGpb4/OeL/s0gfR7Ala0HXZVk+O+79ojCLmn?=
 =?us-ascii?Q?kQl3Ig+9sWDlBdmzbgBTY12j0UsDO086jE+OINuVjsa6Vf3d5EolHSA0J3q9?=
 =?us-ascii?Q?E61gIf3D5WTCQnue2RrbLlXS5UjAditWKagO1Fv9d0PGFC6JEAFCkG205RnH?=
 =?us-ascii?Q?vWKEXZ61llOfps5sG8Yo1TP+l+zcrfqeL23EYlfIU36BoGAVsyM5wgieL6bZ?=
 =?us-ascii?Q?pdaO1YIeKxCfSzHjk2CXnjZmsc2ILqEBmeOpqc5cWwwvMVR/KSk6IZVW+q11?=
 =?us-ascii?Q?js+07n8dXg33fzHV/Nm1RaVHPdQ8+jjS7FlbKAWWPXrHhQljl9SwNa6nni/y?=
 =?us-ascii?Q?NiIKeFTiE4f0yW2lYIgL8fRpekk9wR8E5HV0EAwOPr+ejD5m2DhqvI6+XpYL?=
 =?us-ascii?Q?WsCpUXDxDqpv+IOMfv3XVfrWeM7wBdfuPSJR5M/UNSP02mvbmRWG1orl8tuH?=
 =?us-ascii?Q?zLoyQ1/uzehQgRYumQ0SVB/gg/CZfCSzWF9oq3yK0Rlr8iSeSJ1+XrbQpEEf?=
 =?us-ascii?Q?zjaUoyB2cYpU0YKbYgk/zI5kEfLpT5UNCksVZi3ahZswd4aYr79TgDq9GJR1?=
 =?us-ascii?Q?F/ChuhT2IqY/6Dti09cgE/Jx0y82HR1L9Vwua00OmoBUzRQ4FwPbaEzvJYqB?=
 =?us-ascii?Q?4FLAL7Mccwr7OYFOZpI9YE31EDLgqDabeA4FvqTCU9BlB3zK2BSBtYWCULR8?=
 =?us-ascii?Q?JZyxwq1iTq22mhiIVP2ylGPomJ5fe2iCKI7KgMPZICgxaocyWConi8/vNpJe?=
 =?us-ascii?Q?meoReVpRjh32D4SBwJshT7B7aSjrtzZWx3kcg/hPgD3vECcMbwoKiNlDrH7h?=
 =?us-ascii?Q?vebRs5XiVvLUVW+U1V5Lz6NgZ1k7kiq3tsCQbT3WIiep/jtWF+Xs7z4Plkv+?=
 =?us-ascii?Q?nYjdYN7K3yETeK1gPOM5nxY7FihZw9vJpMLEiArSWguBXv+spjVW7TozDX3+?=
 =?us-ascii?Q?zKrPsZa3VO5e0uPwn5hfGNMACKYCtrAJK83teXTlyZ36paewRSgCl/442n54?=
 =?us-ascii?Q?1i//J2LFUGXF3jdYMXKvIL2iRPH0D/paTxg1p1WS20TGCDw+9Ujm?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9ba6eb-418f-43cf-f8d9-08dee8063236
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 15:30:44.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ur4ih+L2/SmsuYezZ8UQwxeAAg38yfpr0liBFCgb6oHoIa1sDcVvN62oKOPF+bDFJwTTQonw8c00qnRnQaE5EGhZ0E/80iKv7jqvlpO1m57NJEM8soN6fUSLKck67Qnh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9980
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_083049_655239_FC98FEFB 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Jul 22, 2026 at 04:49:09PM +0800, Can Peng wrote:
> imx_thermal_runtime_resume() enables the thermal clock before
> powering up the sensor and enabling measurements.
>
> If either regmap_write() fails, the function returns with the clock
> still enabled. This leaves the clock enable count unbalanced after a
> failed runtime resume.
>
> Disable the clock on those failure paths before returning the error.
>
> Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Can Peng <pengcan@kylinos.cn>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/thermal/imx_thermal.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
> index 5aaacbc53478..b0e88b6a9352 100644
> --- a/drivers/thermal/imx_thermal.c
> +++ b/drivers/thermal/imx_thermal.c
> @@ -832,12 +832,12 @@ static int imx_thermal_runtime_resume(struct device *dev)
>  	ret = regmap_write(map, socdata->sensor_ctrl + REG_CLR,
>  			   socdata->power_down_mask);
>  	if (ret)
> -		return ret;
> +		goto disable_clk;
>
>  	ret = regmap_write(map, socdata->sensor_ctrl + REG_SET,
>  			   socdata->measure_temp_mask);
>  	if (ret)
> -		return ret;
> +		goto disable_clk;
>
>  	/*
>  	 * According to the temp sensor designers, it may require up to ~17us
> @@ -846,6 +846,11 @@ static int imx_thermal_runtime_resume(struct device *dev)
>  	usleep_range(20, 50);
>
>  	return 0;
> +
> +disable_clk:
> +	clk_disable_unprepare(data->thermal_clk);
> +
> +	return ret;
>  }
>
>  static const struct dev_pm_ops imx_thermal_pm_ops = {
> --
> 2.53.0
>
>

