Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE563CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rl6LgXxPLAVsnYwBosaHNVVrrWGDgEJ44oBQ4KSFjBw=; b=McH/DlKik7G2F4qgqtahsD5YFb
	Ce6uIOxYaoBVzI2TKXqrXoBd/FeMwEX2fhpxHYBKfKSkOi4551arGM+saefpoT8JHEK5LrR6/jvW6
	K2HwWPqD6LWlPAJXUB6Iz8/HiyKRBcjpQ/WIlJ1ZkfKX5R2xR3SC49ev899gTqjS21JMTrAwF322e
	6p2FcHPJLZTbDEe1Ny6tKvvkrQjJllC6KpGzPV5zySXDXOHCu4HLvGylL7Xp1RxWl4GBllZtfbAxk
	T0OAOmQUhNIN6B5Wbs5wt3OmkJj0RIIdEeeWJo5xUrIvnnRKWcBB9tgwTEhUioUmn6xv8DT8/E5je
	V74cFDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuK9-00000003DHf-43l4;
	Thu, 07 May 2026 08:43:13 +0000
Received: from mail-westus2azon11012018.outbound.protection.outlook.com ([52.101.48.18] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuK7-00000003DH7-1ruO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBvIH+SFJiKYcFzQfl8sUuED0ddlXSZloVL8CdZX4u+vvSUDwGFlDROZcVwvq835NryfOc4CKtEKFkRgUcWcDpPHtERaiDTDm/4rtGQXbsRF99Rr6oVVIldcUpdCTfMrGuAM8cLkR1WbKcptCYDA+JwNSgxcoDErvxSWBtH2VxRxNwcNwHKihFnGBY9Z+waH0COZXeJ4zxr+9oCSrrCysKGwjwZ5N0u14+wacZFb55eBfRnlAmSEzGqNO0uWJTbP/ajaRKs1I35LUy98xIMPlhXOj/PPAe1h3lZDFaRTF20EDgeAHihrbmW8dqjhcmSxDDNNRRuUeiodyvXxmcyJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl6LgXxPLAVsnYwBosaHNVVrrWGDgEJ44oBQ4KSFjBw=;
 b=gWU4yxvj66f57ZBUPFGVGvbRDfJvroV5CnsdKp8bnVELdE3sCABLZvpsEWTMIGUMs+Wb0igo5Y8Pj3jrs1bZAZ6Wjx1V4LFdP8YwgW0WyXjKNp233nwTdiTSlsH7WdoCAsBu+nRY7uTssYVy+A7L3/JAfpDNJvXsOAMK0OHVCRIoCXIyPOH6GzZ0mCp7zm9VyZ/784Yx6ULN4hBOonhImRlon0yK9ny3ZuZPShL0l7HDZ+8oD36AiLPktW0gMcyJ3zGIgj3EgfVBAL18i8iWX9VRBInoLdzrwwul1LS7FQ5gK2DcWsbepRkVDddVZw57BgOYvpVmcbIOWmKFE/W1xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rl6LgXxPLAVsnYwBosaHNVVrrWGDgEJ44oBQ4KSFjBw=;
 b=rlnXXvQl2LkShuq5oFB0slPLh7y8K23fka061mpM2xYWReCV433J1MM6LYkG79tT9jdresOAvGR3HSrdCVSONPg7WkxQEkMNHQU0+7BdydyiZ2zrePbiTQrOvX2ZxW0VdARgaePPYkjjdT1J51eCki1YhBCT/vNSzzY5wBjEp3w=
Received: from CH0PR03CA0373.namprd03.prod.outlook.com (2603:10b6:610:119::7)
 by PH7PR10MB5816.namprd10.prod.outlook.com (2603:10b6:510:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Thu, 7 May
 2026 08:43:06 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::69) by CH0PR03CA0373.outlook.office365.com
 (2603:10b6:610:119::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.17 via Frontend Transport; Thu,
 7 May 2026 08:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 7 May 2026 08:43:05 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 03:43:02 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 7 May
 2026 03:43:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 7 May 2026 03:43:02 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6478gtxF2944601;
	Thu, 7 May 2026 03:42:56 -0500
Message-ID: <0043574e-6721-445b-ad01-54446dd72395@ti.com>
Date: Thu, 7 May 2026 14:15:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <josua@solid-run.com>,
	<matthias.schiffer@ew.tq-group.com>, <d.haller@phytec.de>,
	<francesco.dolcini@toradex.com>, <joao.goncalves@toradex.com>,
	<emanuele.ghidoli@toradex.com>, <ernest.vanhoecke@toradex.com>,
	<rogerq@kernel.org>, <eballetb@redhat.com>, <robertcnelson@gmail.com>,
	<afd@ti.com>, <u-kumar1@ti.com>, <stable@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <luis.parga@ti.com>, <srk@ti.com>,
	<s-vadapalli@ti.com>
Subject: Re: [PATCH v2 02/13] arm64: dts: ti: k3-am642-phyboard-electra-rdk:
 fix USB clocking for compliance
To: Wadim Egorov <w.egorov@phytec.de>
References: <20260506141040.1368918-1-s-vadapalli@ti.com>
 <20260506141040.1368918-3-s-vadapalli@ti.com>
 <d0eb7931-bcbc-4ca6-8ab5-4c12d134545a@phytec.de>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <d0eb7931-bcbc-4ca6-8ab5-4c12d134545a@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|PH7PR10MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a2f48a0-7f67-4ff6-faef-08deac14a80e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 3iWMAdsYcHK4yyYuf5YSMJyL88Q5DYFsom2dNEUkOZHgrQmyL0kSAcPVjKDj5rdFRPo+A1QEw8whLJ5Cq86reT7y2Ql64iSk42jVYXwUZGiUlbzVfut6D53VpiTrNZVgFpYQARan/TBb9oUt8hgV0vJJGFUlXu5Qpi2evixr+en60jlWFcnfcupv3JGSTij/J80w3q3lsXYAmNTaj8SGCOXjscRq/QwXr/ZaXYh8waI0iC0H6GyAjhsnkWkw6P6uQKhkRA+S9/VeKra/cNZCXQvCArwVCngshnRp96GMswLTrT8yICzC8AiCPvrO1z16Wkp/XCq0vEXf81ntCko5ZdmooJRHQSqgZ9CSmdeWATc4YVXz224bNZAp++TGdXy2xCUkoChuCQqrRevP6riPUWPseioeSa2uJ0TMZkCD50Zlrqjt1APjapLvXz2HnIFPa1SHwvwM3gHYf3ZMzYlgPwxuCNpUtYgfJv1GzQfhlcXQ1s2oOj2zFAewg7poQJRGR6AL07YhYapXsopT2+yYgf5MH3lXCOnqirdcdxWGBdpvUaC4OWSUANYqaGDcD5fVKmiObeV7zj7w6XMy4+QqAEDdKlTQictX7JybBY/m/qd8RMYkbgBvBlI8CbXzSNbahoQIel1rQrbRGiUJz8Hujs271Av+d7GU/0jCwn5KHTAMtDYsy3GPh2P58tA9ncrDZpn8VU+30if/8wYKlY6k0os2HDZF6AfAmiN8dAivpYo=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EtS32vw6W2Aa8fjYsSIWAmILhm/yx5986cxUgXpJ6plOVAMx/+TiowUWA4WX/QkJ55QC1otABm3D+CuBwG4MveS7matpAjOvJuhY3jfnZF6AQwW3tEnKZRH2W97mviiY05DtzBRy0769T0XDm1kupKhiRy9c5KlkJitZ2Ox9pg0GgW1JgrR3rLGOdZvTKCP9A9u0yypdW1ro8EeyO91BNEUK9Di8pOcVrANhomHK+znCkFzziqydnNHB//AzQrXuL+SDW3gVwMO8FlWXNlgmGJYk8bvFyMOtZYmfCzpyatPUBxHreGQDhH9RDb9x4Y+iGIKtGtW2zAWpjgRXgwqZXwhXEByft/+geTCUMokbg85OByVOsJpxAqjTtRX1MAAbZo7JKwbWQa/b5Rc7X002AbGA7Vb/wSABJTnfMV+yyeNUfzDBkWr5EYCc8tgnqaXf
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 08:43:05.1071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a2f48a0-7f67-4ff6-faef-08deac14a80e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014311_543159_117B5462 
X-CRM114-Status: GOOD (  13.95  )
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

On 07/05/26 13:55, Wadim Egorov wrote:
> Hi,
> 
> On 5/6/26 5:09 PM, Siddharth Vadapalli wrote:
>> According to section "6.5.3 Normative Spread Spectrum Clocking (SSC)" of
>> the USB 3.2 Specification, SSC should be enabled by default. This protects
>> against EMI violations. Hence, enable internal SSC for USB SuperSpeed.
>>
>> Fixes: c48ac0efe6d7 ("arm64: dts: ti: Add support for phyBOARD-Electra-AM642")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>
>> v1:
>> https://lore.kernel.org/r/20260505110631.1144200-3-s-vadapalli@ti.com/
>> No changes since v1.
>>
>>   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
>> index 793538f94942..a85d7d08bd1b 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dts
>> @@ -439,12 +439,21 @@ &sdhci1 {
>>   	status = "okay";
>>   };
>>   
>> +&serdes_wiz0 {
>> +	ti,core-clk-sel = <1>;  /* Select internal reference clock */
>> +	ti,ssc-enable; /* Enable SSC */
>> +	ti,ssc-type = <1>; /* 1 for Downspread */
>> +	ti,ssc-frequency-hz = <33000>; /* 33 KHz */
>> +	ti,ssc-depth-per-mil = <5>; /* 0.5% depth */
> 
> I don't think the comments are very helpful. The property names already give a meaning.

The comments have been added for three reasons:
1. The meaning of the following properties isn't obvious:
	ti,core-clk-sel = <1>
	ti,ssc-type = <1>
2. For ease of 'grepping'. Grepping for '33 KHz' for example based on the 
USB 3.2 Specification's modulation rate will not show '33000' in the results.
3. Completeness / Consistency. Since some of the less obvious properties 
have been described via comments, the remaining have also been commented 
on, although it is obvious what it means (ti,ssc-enable for example).

Unless you have a strong objection to removing the comments, I would prefer 
retaining them. Please let me know.

Regards,
Siddharth.

