Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73345D1266D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 07:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTFdKw13W0Kkr7Ei/JRAhchQa+Qc4tuxw7O3rUA2v6Y=; b=s9rPxaZqTkxzGHoDf7fAnM985k
	CR6lPSXCJ3HcZExZtAdWkuXOhJe9Hz+JSJNVMnQEHHhTJDKshJ6Xmn+2yjOWFKvR2jHA1SFvuYsIR
	ZZsYN209pnaLh/JH8XKuVAR2MdfOn/9lpyWs7LcC95+yyvJT/eQDxY27PUkAPWzdzIjpQojpb/+xg
	1V2Z/j4rL97fb6tU97PI6k4PW1Qq5OvGPD+VQyygkaecl1G2S3Wu+uDdo95WeCqQsaR9UaGrJClkY
	w0PCLdCMNUcMqimVKW2VdQYB9NC5ztl1WjiCJI3JjTUsOlf39KjcPEuVlg148hjTAJ3YSR5ZLDXjS
	xdFgzrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhdN-00000006Gnh-1xzJ;
	Wed, 03 Dec 2025 07:50:45 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQhdH-00000006Gn4-3QuN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 07:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkklMJu9FFqAiZhztikGzdZ9ELoI3KClpc7D82q7U/EtT1YeH5elznwP+6sB3hySdO/sHy9udlc7siuCSqzPWkps0pwkjjC/dATP/PCQ8dghS7JoyK9Ocnr0psCC5LgKqdz2IykNju/GMhtyHT1QHRvhNDDhMbcRm6DQq/QmCTf5hzaLzW0FHwwIBrTYq9kEDq2IjxEO+u54+L58jHPzW+uVp4v+dWJJzF3A0dI1xhoo1lfJskLbfVDtfVbd9RUHIeXciJfTK9Od53nXEqoOUei6M7Q3tXyDcAVbpApLKYa0csGGyiMOhYTTeNuam2Xjte4/ITzIi1bqZLHICkgG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTFdKw13W0Kkr7Ei/JRAhchQa+Qc4tuxw7O3rUA2v6Y=;
 b=Ls796wm/Wac+3U829hLHTMaN/1JakXT3DZ8iI6NqsTuNlUUfaEDcG3J3bUA/DvQrDrVaqDnpmar7rn1JsRlwxa6biCrs7R0BPo65sNTBhEwXmFQ09Ayxeo56JMwnHpDSx2WtPCnKFLX883vBWCDB5+KZpiLcjvGgN5jIrKqMtg00Y3Xm+0pZTKpbMlffUC0VC+PloAM7cVsXKkTWsNLmu6jmJnjghSrcrt8seBRptUQS4vnDTrWp3AbMLvA/9nOIHcAejgncViEfNATcUFdo0rGV3D1KMulVhvLRWUpyVTDTdj6gBfi8q8lrQZZP+qDUV0opqiBbf1KT/pruIpVM4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTFdKw13W0Kkr7Ei/JRAhchQa+Qc4tuxw7O3rUA2v6Y=;
 b=VY5AXu3ziTE/ly9DQKEnfTZQClZtecUF2YNjUeImeqSMu2aNcccjyobRM0o4A4KNq9uOrnREog5Q+XzhVfIYZ/wlRl19YjwECRjm/pdgnqSw2FoT1/AqnjuRSRJthskaXts3yctemEl/qONgaHGWifLsY3YCR58PXFwf5xwW68Q=
Received: from CH2PR15CA0005.namprd15.prod.outlook.com (2603:10b6:610:51::15)
 by BN0PR10MB4949.namprd10.prod.outlook.com (2603:10b6:408:12b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 07:50:35 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::c6) by CH2PR15CA0005.outlook.office365.com
 (2603:10b6:610:51::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 07:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 07:50:33 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 01:50:29 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 01:50:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 01:50:28 -0600
Received: from [172.24.235.38] (lt5cd2489kgj.dhcp.ti.com [172.24.235.38] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B37oOE63667076;
	Wed, 3 Dec 2025 01:50:25 -0600
Message-ID: <1283df52-ee41-477f-8d91-5c4a02385cef@ti.com>
Date: Wed, 3 Dec 2025 13:20:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/4] clk: keystone: sci-clk: add restore_context()
 operation
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, Prasanth Mantena <p-mantena@ti.com>, "Abhash
 Kumar" <a-kumar2@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <u-kumar1@ti.com>
References: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
 <20251127-ti-sci-jacinto-s2r-restore-irq-v2-3-a487fa3ff221@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-3-a487fa3ff221@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|BN0PR10MB4949:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e73eee1-e214-44a2-bac0-08de3240a3a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXZ5RFNpNDRicVhVL0Y1ZVlJTjdETVNjMThNSVorUmg1NkI5UGxRK2tpN0dw?=
 =?utf-8?B?RGJaV211bEJ3RjZPZFRjdEl0S01MRWNQMzVvQzhYby9UR1c0Wm4rTVBlMU4z?=
 =?utf-8?B?RU9NdE1ZdHVIS0E2b3N6YmNQNWZHSWl4bUpic2t1aUVlbjlPTk5XWFJmUTJL?=
 =?utf-8?B?ZVRxMnl6YmI3V2dQSGV2VEJLVU10WEJLazRMeDZvMkFLbjJpZHRGYkZQbVhK?=
 =?utf-8?B?VjlvYWNjSTNOQ1poa3hpYWloL0JFRk51Q1c4S0wrWElaM1JLamRleTJNOW9o?=
 =?utf-8?B?NDZUb2UwOXhTRno1U0dyZkpCc2pJNm9qY0MyVWJNOFFNOUhUV28yNmpuY0h6?=
 =?utf-8?B?MHd0RHA2MzRZYUdBdElSaE1qT0xMVHZwQUNJYy9nUFQrWlRVa3Q2bVg1RmtR?=
 =?utf-8?B?WGlzckNWNktGTEllWTU4M0tmQnhsY1VtRXZhQVhZWTFoN2FHU010QVZlUHVY?=
 =?utf-8?B?Umd5ZnlZQU1YUS8rT0cwdlA5UDlVT01XWmg5TVh5WW04MGtVUW9LVjFYT2tZ?=
 =?utf-8?B?TmdIWUxiQksxOHUya3RnakUrQU9zTVl1L0hDVTBOTkxydXRQTXZyWEZrKzJJ?=
 =?utf-8?B?UmJhZmJUQi9IS20rOWZDTHY1ZGpRNnhYVUZyQnRyekpWZlp5VFlaL1MzU3lu?=
 =?utf-8?B?Zkp2dVlLdWx4ZU5hY3paeW83NFRZRmVZb3IwTFU0RUM0NTdWM3RPcnpqWXJW?=
 =?utf-8?B?Z290N3duYXJpQmovd29QR0daTURybHZVTGwrdDRROFdWY3BocXVjbXVTRURD?=
 =?utf-8?B?VzlBU3JBamRlUTl5YVVoMDVtMEkrRCs0RWthQ29RcW9idG1GSWJ5c1hRbi85?=
 =?utf-8?B?SzZqNlFXUTZvVzFmZlJzWDNiRFVCZ2JyK0o0YnhadDU5RVRqWnZTa1B4ZFYy?=
 =?utf-8?B?bEY1bEJ5RFp0U3U1aWw5QnYyQ29LaHh6S2hjbUNFNjNiamFsWXprcTlLZXdx?=
 =?utf-8?B?d1pvOVByR2QxWmRlVHNFeWhtbitQN2tvcDl6K3NDa2R5Q2dCblphTUdaQjky?=
 =?utf-8?B?QzRpNmVPMEpwNk1JRTBVMjA0OHBwVUZ4dEFoZXMvY2V1UHNleEJVbm1VTVpP?=
 =?utf-8?B?QnJGYlJ5Tzh5N2o4M0c5SDFHOHFDdkN5azNWSEZVeHpqV2NFVTVOckl6Z0tt?=
 =?utf-8?B?RmpKT0o0Y0ZGQWEyWmp1OCtkaW5yOWhIY2o2ZVlmWWdVRWVoTGhHM3pvVlM3?=
 =?utf-8?B?dFRKRkFPdkhrSStPdE1XTHR3TlNPWkZCWjQ0VkdVMUlOVW5xYlJHcUxmVWdo?=
 =?utf-8?B?VFpERklkS1F4TTFMMGFQeGkxVjRieVY4S1Vodm5lcG1YWjkyK3ozenEycXlE?=
 =?utf-8?B?ME9BRUc2QkZmUnNTQ3I1L2F1MGF0eDU1RGkreWd6YmxBUjk3V01SWkJsUmc4?=
 =?utf-8?B?VHY3RjFhL1RNd0hSZGtXQ2JDa29jam5VUkFPeVppbmV1OWhNbDducXhjaG52?=
 =?utf-8?B?STh1Wk9ySjdoby9OTGViTG5nQlBqVnp1bzQyOGdmZUhpYnY1SFJDeVNSd2hr?=
 =?utf-8?B?NFpJNnNpNVl2UllXVDVBVjJWN2dkdi9OK3k1SUoyZkd0R3dVK0pmSDdyZEdR?=
 =?utf-8?B?c29LOWpmTE5neHEyOFppRitGMXh6S1NDSjdPTE5MVlRsaXhtKytCUWYyalZH?=
 =?utf-8?B?V2NWdjRXSlZBbmV0MytvZjNaNEEwalZTYXNoOGhWQWJEOW1KVm1yZS95OEJN?=
 =?utf-8?B?SGVrSysxY0Q4Mk5xVzZwQzMwcUtVLzZMRis3S3ZOMXZtU2J6NVpBOFhxRUl4?=
 =?utf-8?B?TnU4WGlpSDdoS0kwQjBLaWladFNzTW5KeU1MZ1Y0VkxPT0Rma21uL0VHUzBz?=
 =?utf-8?B?ci9BdTJweE5hTFRORVpZUnlCUmpzY3lwZTBtSE5vNVZ5Ri9BRXg1YWZXZGNQ?=
 =?utf-8?B?NkJTMGFXTlk2SURQOHdVMlVITWs5TVBKUnlUMUF2R0tIb2twOVFVWW10VDJ0?=
 =?utf-8?B?eG9MdFFjUEJrSjhSUjQ1Rm1KejB2MGxPU0N0RW1OWHdBcUtnSmVublB3NU9k?=
 =?utf-8?B?SEFPRnhKLzMxTFZoL2FjdzZRK3dwcGcyZVJjcWJOK3ZBUnk3elRkUlR5aXI5?=
 =?utf-8?B?UVJCZTFuSlV2NHMyenlwS1lpK3oxclJKZkpHSmlMcjhiRk1FL0hPTTIzSWhm?=
 =?utf-8?Q?UZT8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 07:50:33.7402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e73eee1-e214-44a2-bac0-08de3240a3a6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_235039_976989_C48F1073 
X-CRM114-Status: GOOD (  21.26  )
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


On 11/27/2025 2:08 PM, Thomas Richard (TI.com) wrote:
> Implement the restore_context() operation to restore the clock parent
> state. The parent index is saved in sci_clk struct during set_parent().
> During clock registration, the core retrieves each clock’s parent using
> get_parent() operation to ensure the internal clock tree reflects the
> actual hardware state, including any configurations made by the
> bootloader. So we also save the parent index in get_parent().
>
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
> ---
>   drivers/clk/keystone/sci-clk.c | 25 ++++++++++++++++++++-----
>   1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index a4b42811de55d..1e5dd01484d1c 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -47,6 +47,7 @@ struct sci_clk_provider {
>    * @node:	 Link for handling clocks probed via DT
>    * @cached_req:	 Cached requested freq for determine rate calls
>    * @cached_res:	 Cached result freq for determine rate calls
> + * @parent_id:	 Parent index for this clock
>    */
>   struct sci_clk {
>   	struct clk_hw hw;
> @@ -58,6 +59,7 @@ struct sci_clk {
>   	struct list_head node;
>   	unsigned long cached_req;
>   	unsigned long cached_res;
> +	u8 parent_id;

you may need to restore rate as well


>   };
>   
>   #define to_sci_clk(_hw) container_of(_hw, struct sci_clk, hw)
> @@ -237,9 +239,9 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>   		return 0;
>   	}
>   
> -	parent_id = parent_id - clk->clk_id - 1;
> +	clk->parent_id = (u8)(parent_id - clk->clk_id - 1);
>   
> -	return (u8)parent_id;
> +	return clk->parent_id;
>   }
>   
>   /**
> @@ -252,12 +254,24 @@ static u8 sci_clk_get_parent(struct clk_hw *hw)
>   static int sci_clk_set_parent(struct clk_hw *hw, u8 index)
>   {
>   	struct sci_clk *clk = to_sci_clk(hw);
> +	int ret;
>   
>   	clk->cached_req = 0;
>   
> -	return clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> -					      clk->clk_id,
> -					      index + 1 + clk->clk_id);
> +	ret = clk->provider->ops->set_parent(clk->provider->sci, clk->dev_id,
> +					     clk->clk_id,
> +					     index + 1 + clk->clk_id);
> +	if (!ret)
> +		clk->parent_id = index;
> +
> +	return ret;
> +}
> +
> +static void sci_clk_restore_context(struct clk_hw *hw)
> +{
> +	struct sci_clk *clk = to_sci_clk(hw);
> +
> +	sci_clk_set_parent(hw, clk->parent_id);

You should restore,  if this is BOARD_CFG managed


>   }
>   
>   static const struct clk_ops sci_clk_ops = {
> @@ -269,6 +283,7 @@ static const struct clk_ops sci_clk_ops = {
>   	.set_rate = sci_clk_set_rate,
>   	.get_parent = sci_clk_get_parent,
>   	.set_parent = sci_clk_set_parent,
> +	.restore_context = sci_clk_restore_context,
>   };
>   
>   /**
>

