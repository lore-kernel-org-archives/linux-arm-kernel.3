Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFAFC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33YJpQwOIeSZeTAgBok9y/2Ug35qVKcBR74swDnKfU4=; b=AJjicX+uC3bZ+sE9F8TlGCON33
	bXScEtu16NlTnNlJivQh2yOSpaYpsXrKVQK50u2psuWyty5DgDlBJDUHYTpmdpqHwsk+wsZ6DsIPB
	oVWUO3MlF3I6hgeGg4zmlbHQ34sHNZVQ4J7EJzL6Mt7el7Xt90AUkP1B6y/1740kr4zVTyy+9X+lC
	UgX+fcxP0SaHJC+OBZPm1lIn1+DCTtggP9pmgpf/ipej1A1dCey2zcy+e7IyxxYMwyqs2VZpp0oLL
	Rx34j+aOoOUsU4dzH8csaOurJj6mr4G8NBjrd8JBt/vESN3Nb9fyAjpptJ1z1Ch25Rh1+WVtpbCt2
	Vg9N7QPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtokh-0000000EOfe-2Hf1;
	Tue, 11 Aug 2026 15:50:55 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtokc-0000000EOe4-2GXp;
	Tue, 11 Aug 2026 15:50:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IN9oe5SeGqznAISWgj6npxliNxqKAiMLgLpJwhAKZrhpYpN1pKMrzvhs/lF4KfhsY4TpRDypxgHfQqgNcYaf4o9usXUJAhBol4iob4wg3wt8Yj2mU3xFhSJcrJKTBk4aVys4RwFjIbsxG13EoTmGCSd8+njZ8QPklzYCVmRQnb4Mf6/jdpLuup60Mica2xfCJsno/DGRl30YQ0toUGW0DAUcxpjYWZxW7gsf39V6Vqd6RFem07LgLSK+w77Yq+WDo8nhUd2lPfcQMGGN5k6LaklZjv1/1uroibF+ufsbxmlFoBYa3lzPGIxA3SmLTPgMJx9kJGYo9uhki1W+AD1DTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33YJpQwOIeSZeTAgBok9y/2Ug35qVKcBR74swDnKfU4=;
 b=sJj4+r0hBVDfUD8zSmhSyBwZcvMoez47VYCpkagWfU/chq0lY9AmlN+c/dZjwepGkxt1643t7fEcLx1gBSwzdsU6ZB9rK8NC8jN27FM5rUWbxZNzo9gLmxCndvR5Vmd7Fr2DD0hptwa8Z51XZmnSCGDxaPRZd0I5nnJjZD5if/2x/dkKtX5ovS10iLBpxX+UdmWrntM74amkFMvo0CPiZHU+qHLLsU59az4EPeWz3nJ+Ex47k0fHR8y2rGpc5jN0fWSHgFVOfXSkOHRPVe0wVD6dJ4xAMfOR8l7dKGgB0tQ00AkFvDKtod7pNBuKjiJk0xAPsyctr5eUSnMPtJh8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33YJpQwOIeSZeTAgBok9y/2Ug35qVKcBR74swDnKfU4=;
 b=w7c41NVBsqTxBwbQVoXXQhdV9PmEgkbIUY08bsKsqyPXmHWnm2bOvRcSVEAkCAqJFhyyTGIKp1n2jCe4+aXQxMFCwPhNC0CyJWTmN8XaiBt1EPRvM3gJ7pJ8L5IeGrE3Qr0NA+65ve0VyFWZGY5OwCo7OyYnTE1fULEgXGjiGxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Tue, 11 Aug
 2026 15:50:34 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 15:50:34 +0000
Message-ID: <f0e8a9be-6767-4cd5-9c92-c5e6c33332db@amd.com>
Date: Tue, 11 Aug 2026 21:20:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: zynqmp: register PHY provider after probe
 initialization
To: Vinod Koul <vkoul@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: tomi.valkeinen@ideasonboard.com, neil.armstrong@linaro.org,
 michal.simek@amd.com, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 git@amd.com, Sashiko <sashiko-bot@kernel.org>
References: <20260807162510.3681572-1-radhey.shyam.pandey@amd.com>
 <ansFRgkKgEHVVFJL@vaman>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <ansFRgkKgEHVVFJL@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0178.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::7) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: c09ad0c0-74fc-492a-b56a-08def7c047c1
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|22082099003|56012099006|18002099003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: JSO5fukMr0ukwWz7IaFTUX6pVRx/r+KDXS7kZZFRkOajbMIZgFyrCInwSLmYQ5DqT4IubNETvTbggdW7vRClSweshLYBxkXpq4KFgYa83YPFqzuGC2BljvlzvQ7FvBs3Pis/zqRrm7RnbgDkJgoc7iNvTVB+f0q09U4bd/ODAJN2o/x/AlefRvviDUIdujJtmpuDMHLm3yYoEdkZvNJU5srfKglunWtS8X81Zzhgrl9r/4sqL/UOfjMf/AtSxxecXL/Byv/3NYTJVb5YmSmzohioC/iUA4bKYe/XQxl5ydqIXGP+s9k48ZwPRxBZVRCKS/A1mvCAAmH4cxcq6Y+X3DyC9WVXYAhRT3PLoJBEddAvypxHxiG/zCdh2tVS2ctcUO6I9nDLId+C0CPIgKWySgrFF008NECWh5qqo8rYpdmqNLTkdJ2b/IOmzS7mhwOc24c/vEdtKeJ0SgcwwEQwLGkmqQhiZQji3fK6StQDVvaXTulnyzseOhT6eJB5YVnh5+Hm/UgSaQlZ6LJkrqPynMXWXqtAQ+B9oqjPB0Gks180MXpe70uEpFmWi5M6r7c4T4uXQhmkGelJaVj+qctmMM0WLo21aZg4xtyFimW9HMJDFZKPvuYhDlTmszXmTTQUaiznzbfIE2TCl9GHEoUyHBqrsS1hQJlTCKzixal2+Bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(56012099006)(18002099003)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aExBZmFQa2dCVHdBajRJdThSd2ptN1ZlWmRDdVdOTDBER3RiaUpib0REVHRW?=
 =?utf-8?B?MjQvWE84RzgvcmRHNnYwdElYNG1Fa256ZU1ycEVGNE9NcUpFdEpKaWpUSW9s?=
 =?utf-8?B?ZXpwS2ZjY3pBU0xuZnI0eGdlUnUrSjNrV1E3bWJkMmhFQm03ZkwvaFI3dW5U?=
 =?utf-8?B?QlRHbEcyaHNyM0FaUDkybGF5V1RFQktScC92VTVxNmNIM2NscGNnNURmaXlF?=
 =?utf-8?B?TEtUbm4xT1k0N2NQb3dhVDRHRzJnaDkzUk13dThTVTdHd3ltSE95b0kvY3M3?=
 =?utf-8?B?Z3V6aHVONVlBeWtpVGpSdFlLL2hLVWE4RFNRbTN2ZTlISHcyUkx0ekNJcFd4?=
 =?utf-8?B?OWJQMUI4WW85OVRBMUVJR25LalY2SDcwZHpUc3VhS01zVEJKTytNNk92RFJm?=
 =?utf-8?B?ZmFIMm1URnNaOVpFbnRaZ1YyTzNMNGltMHhuOHBPY0tJYXREemVJMTNKa1hn?=
 =?utf-8?B?S2E4YUFueTUyZzR3Y2pVUTlZbmExV0tIODRoYVgyVnBWc1RXUEhLWnMyR3Bw?=
 =?utf-8?B?SXNMR3o4UzkwQllQSkR5clJkellyazU0RmhpRU13YlpMOEtGbkdpUjEwRlBJ?=
 =?utf-8?B?aWIrWVRUSHhxbGVRNEVGblFMdGxvd3hMQlNBM3VoeS9WeXVmSTJqV3VadStn?=
 =?utf-8?B?T2l0aURWUXlBTkR4Vmk5VloreXFrV1YwOEtaOWEySmdpdFFxNnhZeWVDRHhR?=
 =?utf-8?B?cHA1cTRra1lqRlRuVHgyRG0yNW05d0NNVUkzTmtpdWZHTy83cGVnTENaL2dh?=
 =?utf-8?B?c2tKVC9wVmJQa00zeVBFbDgxOFgrM2JtUGQ2K0FvN1E1RXJLZFVhRlRFSnFJ?=
 =?utf-8?B?eVhpZnp6WmQvYXovblJmL0JLY09lZ1RqYlF6U3lCOXVOQS9mbDBZTFpoSXpn?=
 =?utf-8?B?U1JaRUY2dzJNZ3BtclVyTy91c0dJaG9odmNobWdUMWs1WXBqVEtPOUl0bnA5?=
 =?utf-8?B?MlE0ZkVlc2tBd1dsWUNhS1lMNzNYZkFUaVI5NGxQYWZyeDVwOTZBK3VzSUs4?=
 =?utf-8?B?RjVWcm1EcDhzUisxY0V0RTFQNlV6NzFGWHpKN0FoOGMvdWM1TmVWajE3QXpU?=
 =?utf-8?B?bVhWT3V3dHp1byszcGNveGFRaUtwZkgrNXk4Ty9scFJpZlF3eFRDV0pVQTl2?=
 =?utf-8?B?YXJUOEQ2ZGtWaG5wRmZKSEFrRHZOdTZpY2FKRVBRaDRWUnlYY2ZBSHB2R3NE?=
 =?utf-8?B?dndSUmFmT1laUmFjTVVaS3hoM292QWc1SDBoMHl2RWwrRmlzeHdZU240RXRE?=
 =?utf-8?B?eWx4M1RqQWE5ZEpsSWY2MnpYTmdZakpjdzlBQTVDemxjVUk5RENXblFDOGZV?=
 =?utf-8?B?QzFrMlhQYU0vZ3pQL3B5RVkwWjhLeERQM1pDclhSMXRvN1dsWklKNmdrWHd3?=
 =?utf-8?B?Y2FaS0U1a1k3VElQRHlDYmFheENISWx4anhCcjdycDRnU1U0QlNoV1d3enZJ?=
 =?utf-8?B?eWxyN09xd0U0S1pxNUZsOGk5cGlqVEVMeXg5bDY4TnQyd0c3Qkg0WXFlNnMy?=
 =?utf-8?B?ZGEzOHYvTWpvVEJyZ1RKQmJTa2I1U0c3Ky9IQ0I1dW9OVUV6YUpFTXg0VVFR?=
 =?utf-8?B?OXpITExkQm00R3M5NDBjVzZ0WUNhcVk4bCszUU8xaVMwSVRtdG1yZDBieHB5?=
 =?utf-8?B?M0hzTUtGaGJ4MGhmNmcrSGJzWVBYd3BMbGpmUSsxc3FyblpleUY0ZUtDM1pO?=
 =?utf-8?B?NVkvZGprMHBDeUpjMUtPd1VxMVdhRVl6aVE0c3hxb2RZZVRoUHdNUTU2Wmgw?=
 =?utf-8?B?VEg2RlV5WHlGWlNMSFFDTEN2SU1VcytQVHJ1YXZnaEcxMkdlcFBIMWJGM3lu?=
 =?utf-8?B?VnVWNUtrdW5Ea2tTSEtmOG5oZ2hidlFKcUgwVG9qN252aEgwVm1iYUhOc2Z3?=
 =?utf-8?B?bUhXU2RJUlNmamxlNlY4WU1WMWUyeHZmL09QU01UUzI1b3NuYVdtanRqcWN6?=
 =?utf-8?B?NTc4VW9wTm04cFVEa1lQUEFtUGZSYnlxekRaTVBhZkprbkt2bml5aGJ3ZnVE?=
 =?utf-8?B?MFoxRHBneEk5T0tjeXdPUFJ2YXJPRjRVNFhmMTl6djdVSzBjVEE4OWVGWmU2?=
 =?utf-8?B?VkRibVRacmtCWDR6Z1BmNnJ4cG5sOENXNmt6ay9yZktaeCtkbVV2aHk4cVhD?=
 =?utf-8?B?Z25QUU5GbmNvZjNZT1hCcEtrZjFvbm9XM3pPRkJhZ3RTTVIxOXdPZHJNSG9n?=
 =?utf-8?B?L2wyMUIwZFdkRTRiSjdKWVMrVU43b0V0RlpBYXRpSVBab3hiOXNUbkc0d1NM?=
 =?utf-8?B?TjNXR0ZscDd4V1JvS0FaOVhkVDZ4RURpOUNiNEtoSXVUb2FXTzAzSHV6Nno4?=
 =?utf-8?B?WTFoUkhBSlJsQ2pTV0NpM0pjMEVJTWZIWldUZGxjRUVaaHUzd3pvdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09ad0c0-74fc-492a-b56a-08def7c047c1
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:50:34.6304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQrH4IbKFXEtUl7srNdgWuVaz1rdD5oy5TAH0KPN2mb20gS+1wkwGQ3UDqIaEonB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_085050_589737_0972296C 
X-CRM114-Status: GOOD (  20.05  )
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

On 8/11/2026 4:49 PM, Vinod Koul wrote:
> On 07-08-26, 21:55, Radhey Shyam Pandey wrote:
>> Register the OF PHY provider only after saved_regs allocation and
>> runtime PM setup complete successfully. Publishing the provider
>> mid-probe allowed concurrent consumers to obtain a phy via xpsgtr_xlate()
>> while probe could still fail, leaving them with references into driver
>> state that devres would free on the error path.
> 
> That fails for me!
> 
Thanks for the review. I assume you mean build failure? If yes, I will
rebase it on the latest linux-phy next branch and send out v2.

Also to add - this is a theoretical race identified through sashiko and
not something hit in practice. fw_devlink does enforce the ordering, but
since it can be disabled, it seemed better to make the driver itself
robust rather than depend on that.

>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Link: https://lore.kernel.org/all/20260720155732.9DA581F000E9@smtp.kernel.org
>> Fixes: b3db66f62446 ("phy: xilinx: add runtime PM support")
>> Fixes: 5af9b304bc60 ("phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume")
>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> ---
>>   drivers/phy/xilinx/phy-zynqmp.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zynqmp.c
>> index 240626b55475..8930cbe24b5a 100644
>> --- a/drivers/phy/xilinx/phy-zynqmp.c
>> +++ b/drivers/phy/xilinx/phy-zynqmp.c
>> @@ -1060,13 +1060,6 @@ static int xpsgtr_probe(struct platform_device *pdev)
>>   					    xpsgtr_status_read);
>>   	}
>>   
>> -	/* Register the PHY provider. */
>> -	provider = devm_of_phy_provider_register(&pdev->dev, xpsgtr_xlate);
>> -	if (IS_ERR(provider)) {
>> -		dev_err(&pdev->dev, "registering provider failed\n");
>> -		return PTR_ERR(provider);
>> -	}
>> -
>>   	gtr_dev->saved_regs = devm_kmalloc(gtr_dev->dev,
>>   					   sizeof(save_reg_address),
>>   					   GFP_KERNEL);
>> @@ -1082,6 +1075,14 @@ static int xpsgtr_probe(struct platform_device *pdev)
>>   		return ret;
>>   	}
>>   
>> +	provider = devm_of_phy_provider_register(&pdev->dev, xpsgtr_xlate);
>> +	if (IS_ERR(provider)) {
>> +		dev_err(&pdev->dev, "registering provider failed\n");
>> +		pm_runtime_put(gtr_dev->dev);
>> +		pm_runtime_disable(gtr_dev->dev);
>> +		return PTR_ERR(provider);
>> +	}
>> +
>>   	return 0;
>>   }
>>   
>>
>> base-commit: ea2bff00da89d7767d677bb68470130ba96f4928
> 
> and this does not exist for me!

oh i see , this was on linux-next, will fix it in v2.

Thanks,
Radhey

