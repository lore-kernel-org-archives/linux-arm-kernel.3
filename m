Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3598BC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 02:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBjXw9ZQaovVac4/+fpxPsmSiBzxSV2XZtFBclH37NI=; b=WUbUuXjmXsJ0fB5oqsT56yvEr5
	JUPk4M4wkoGqiSKphfQjmT4ewEvgm9qlBRjbp/EWXyv/LVoQ4AnJTi+dKbwTyQeF+o1AQC5ImTOCF
	/SoKZfTfYywzl0jTXbbsNE1Jcq7+molWHM+U8oggduYrIFIPe04mX7lxiwPDufxo/p6qP8tU5D0oB
	ASUZqEcdO56Ev+pPS35NsGuq7GROUCxkS3L4Hf72ouQHZfWVw3YUHSZgdkIG36+SwZcC7sCGOzMD4
	4A6CcfkJU/qxRpGGLd8EEGlATuBj7tsiHej77Civ2+Aj143l7A61KwiDOBULgbgqlG39JthILAnwm
	Jc4d8irQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMdQ-0000000AkU9-0dtm;
	Wed, 22 Jul 2026 02:24:36 +0000
Received: from mail-japaneastazon11012023.outbound.protection.outlook.com ([52.101.126.23] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmMdO-0000000AkTl-06EL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 02:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kz7L8/iEHijUMZ5ZuN6CxTP8entl4n1zto9+DN/ZPlOeTtw2qOQ0g5fC6eE59WLYGba8cBuioFjF087VbprPbfknG+Q6OC18vuR3KW/xa/RlUo4jJk3hKQTOP7JiVifJQtKICMRcCgrj+z7bdao2cFIB9gBc1/oUMg1c6sSKCfkWNnW4IEy/Jhc63PGIYbrSWIX8IrYisbiBcwfzQ8HyzMw+peRXAJbV1IBl6VveB3+ftm2soOUQfMLcTKBii1sQGC+AECUKfNBVbkHwjkSDrYwRD4ICgFcPQcFMKdnL4SVvUQhQPCODWrG/4Yi8KFmb2dLPVk07wLcimN4W42/0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBjXw9ZQaovVac4/+fpxPsmSiBzxSV2XZtFBclH37NI=;
 b=q6nr+/38A83jEeL2W7uLBS1RhT677F8X+uMpNqGc5SmQhZF+a8kM45q3iJGf2B+6Y9ziLPj2nPtEW1LfHRpUOhj/9ESwgT97zQftIYt2QayLMw4nth3k4Tf/LpmmDkciWcTcTDttucueEcn9e/2HeBHHGGWgxuhfqpVfUmYqNHCZHMIaLpK37LHHfrlYyo6eD12BLJcVrpNMgWaXToSFljRVssoYGkDNqDRpVOjWUiNx+ytbggeg+d3mVxkm533QgUHeSDvOJVDm/p5RlXc2JreTctnM8B5BgQjP7x9MToVNcHWQ4juLHT+INnyPoZjUrBZybILvnNXo3nEoegbjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBjXw9ZQaovVac4/+fpxPsmSiBzxSV2XZtFBclH37NI=;
 b=Pji9Mdwl8MjM55IlBjBhXM0FGnNfEOEUm8+eoP2QGt5ZLwRtzaJP0+SZixi4/OcLC9SWYAyKkSzJHfRBxW8ufHjeBmM7NFdKCXIhA01ZinamjcXpgcWToSkIb8qWfl8zjU1Eq5QyCjF39+v4mqTPOTYEbrscGjyctRo9Q1OhJZ+1eAi0mAM8X0BItlGumpIVWDRSGTQnVqlLwU+4Kv0nFy002yaJ0b5QfTtEGMePirYkx9g0GguFqNZOKPmWOaHyM+J0QN7ilaKFbZfLcYOSucdHVFt9byVMGNoXswLpqV2BOqNVcXnek+3AJiPB+PYkHfGl/H7fUgty3sqSO7CeHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by SI4PR06MB8898.apcprd06.prod.outlook.com (2603:1096:4:2af::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 02:24:01 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 02:24:01 +0000
From: Pan Chuang <panchuang@vivo.com>
To: michal.simek@amd.com
Cc: arnd@kernel.org,
	jay.buddhabhatti@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marco.crivellari@suse.com,
	panchuang@vivo.com,
	ptsm@linux.microsoft.com,
	radheys@amd.com
Subject: Re: [PATCH 7/7] soc: xilinx: Remove redundant dev_err()
Date: Wed, 22 Jul 2026 10:23:48 +0800
Message-Id: <20260722022348.648883-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <859dccbe-0d00-4380-9543-3b81f2380997@amd.com>
References: <859dccbe-0d00-4380-9543-3b81f2380997@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|SI4PR06MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 9790f4c8-172b-4cd9-140b-08dee7984a75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|38350700014|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KcQLBP0mLA158wPqXtANI7PuXZJ+ldIJlAKt4q8kG/7QK3MoAauhR8tlXhkO0jZY8WXZcK1QZmr7cgnVwzBNzSpbO13f5+7fWesUDkF2BwF/HxXiPbg1D/oDn/k6aH6i8J3dqBDXrip1KlhAIsn5kGj9LblAB30lLIog1BsBrzwfFktxbpMSSHLCDMNaeSlm4+vee7nOMl20H10x4J82i1NAOVs4i1v5WQJPh9eUmDTSy4sd/WwZ77sqGPvtJL+wA+D8LXYU44gnf7DavTvBRE5LkZ7TnQirythmZEZ7jYsI/nzN8F0VooKzVSoW/iyg4XdfF70Q0B67pPP2GpkCqtUqumu1a+3EjGFq3DuxuDgLXNVPH3nA+Fq3PScy7n844GOymvnxx3JQbDrYHnzvyGRGQmxA0O/5TGVdDmQewbs2ZkAUCfrZHaLJG4P8cWV/anpxs6hNvspIrcY8Mibw45CjCdSwpsSIthCQTf7S8ASrFEu4gCGasZAlflnnHpue8ZJvazDd3ncA0ilZ6RLAFX0fpPFHrahpE1T1Fdag9IiIb8AiucqUotNklWtd6BGZqSoAI6kGCemmIMmQ52oVWANuUUG7GreS+VVziYcdRIIF5jlf/uNgdnpnhZswWiUwsXAOPrtagEnsRC14dZmL5Ix5AsW82RSUESeTQlUllXq8Cpy/AfgUu5xEyS/Pr8xkbZyEWF/fYoJPxc4l4Slalg1hAcSaovDEZjkh++kcxW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GdCl6r72kQDfygHhIHpoNvsltlnVDOUE4BNVEyIF5pklqAVSLFMIhTWzXJsU?=
 =?us-ascii?Q?FDBjUynBL5gwZ00RlK4RR6P+L9YMYedD+qt8CT6vpDNFipqlOS9+2xcafPkY?=
 =?us-ascii?Q?1e7koT4kp5Fk3xTHXReSFxLxI8lBmqqW8Xkp6FFDolTWAfvEG+c9L8WFIh5P?=
 =?us-ascii?Q?5Mb/oXMilAbybxCsqlQxKlFsnkZwnVMPrwHNAKr9fFVvxVVipN2XpM0iLoko?=
 =?us-ascii?Q?4VQoHFiCtT4Gso53AuSTHoGgAxPuJBz1GrBbfls5l7DUjzK3jJmihLBp32Da?=
 =?us-ascii?Q?671mk39ZaYbXVv0qftSDE0uapra6syQmUjJMDxdOuj4aR6pQo70pYtu42duZ?=
 =?us-ascii?Q?0Or1jH9ewZVhFEvX7LndzCJK/2zcpoXxhkQNdvtfzw3x1UixV9tf9ATYEaaB?=
 =?us-ascii?Q?tHJCWitjR0dGQxXHNJlq05n0HTcDMmc74pg2QPw5esepKS9DwrMkZRnozWvm?=
 =?us-ascii?Q?/FmpGW4wlynJlRTU3CBMUVDYMLE9T81z4rIbnuiFqfE7e0U2oEfbPQPjA0VF?=
 =?us-ascii?Q?BxlIHQUIO8JWoksSaUFcGmTzIVVEarKWa+a6AY8Hx37b/3F2UtBrUxmAR51K?=
 =?us-ascii?Q?PmGDiNFwPwT5I6W1Td2u36MjriSnmpiA0vrrBkZVdnggYw30t1aLSe3TTyD9?=
 =?us-ascii?Q?mOr7tX8NsqbLOKt955PWsa7x6d9ovg1TTg199jI9lYlfZfuPbh0w0d5hr4Vf?=
 =?us-ascii?Q?jPgg5P/MOQQU6cxlpuR7uGGk3xKlBS1p8maRqEY5uHHj8lURKC/4OhyPncJl?=
 =?us-ascii?Q?KSxT7BKCtry1kmS0c2Ul5nsA3davu5qrXbbAb2bfaeOMRQ6FIaxJzkhkAznx?=
 =?us-ascii?Q?+CnQx/J1crwoV+s9jqAf2Zo4wQCFjjA1vAP6ZC+5kfnhWLC9bV03vMLh1drL?=
 =?us-ascii?Q?dmNTLn8TmdPlwT5rzGatNsZkXFC01waQnb6UnVeaUnStJBc/7nf28zrH6IWU?=
 =?us-ascii?Q?ky+743ge0NfVFKu7/9ROLPycGfobABndb4z9t+d+F+BCH+Pwxc2lsC/yQsoB?=
 =?us-ascii?Q?x4AR/C+6TGzAgBkedt3dTFDP/guiGYzN7MQNf6uaSuKGnQ2nhrJJNG88YRRr?=
 =?us-ascii?Q?F0Znw4sFDKJaif1RL2xXlIOhn+kzWqmK5OtshYRXEz2BU6NFiEIeTYd4LpJL?=
 =?us-ascii?Q?ul/BCa5/xzRLvN7aXSCr8/8/Pp9NTsEQd0EPT0d8dFvzA+6oPUH7ZuaAbUSy?=
 =?us-ascii?Q?AKCApfCYSAHUoDD7PjtBdkRfEO5ELtajNCJ7pESn8705bAuM+293JzQH74f/?=
 =?us-ascii?Q?ULuWMt8DJJ2IQTaAPgf3pdRO097h8frBpNcI9ysgxheaKBwSKYioHMBpLkmx?=
 =?us-ascii?Q?M5qY040+VppgxH9acL9eUgAYpMElbcbm441pwlvMTdfejP41u6gPJ7s0IKtx?=
 =?us-ascii?Q?QL9ztWnD96BO7j6HAtyHuGaskkbtq3+eDBE68RTcEGloqHIc7yaSUrTPSCal?=
 =?us-ascii?Q?kq++QAIYn1JFesMji35h/Qo9EgbqGYvAoanR4p7YzJFY62JRwZj1EUntP2Rm?=
 =?us-ascii?Q?oZWwv/fBsfXgIK98wXjKvQPIwubqFH0jueRpJ2tlG3YhIwPBDAEPseB1RSDg?=
 =?us-ascii?Q?R42verEEQV83WJyBUnaiPw+NhxuaTdW940umH+j5t27vMFq8rAva91U5qIrN?=
 =?us-ascii?Q?ATZ0B1Q8Dn0RXRULoXQHGqdj5kWi2c5piILeHzlD6WY7CbBZJq2m9XROC/+1?=
 =?us-ascii?Q?yI5kR1llGDKTKigr0tHu9+/UHgIfXTFLC4KAKEga815pchTIetev9g4Geo7K?=
 =?us-ascii?Q?elqSajpRzg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9790f4c8-172b-4cd9-140b-08dee7984a75
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 02:24:00.6820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BgD86O6YwvYowI0+v95B+6BdPgUNjr0dbshwtUrRt9ULo4RZJxOy70QRtIitnNvKoHJ/Nc0nu0+dxUNfqL6og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR06MB8898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_192434_214543_68718FA1 
X-CRM114-Status: GOOD (  16.69  )
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


On 2026/7/21 13:49, Michal Simek wrote:
>
>
> On 7/20/26 17:50, Pandey, Radhey Shyam wrote:
>> On 7/20/2026 3:29 PM, Pan Chuang wrote:
>>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>>> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
>>> detailed error messages on failure. Remove the now-redundant
>>> driver-specific dev_err() calls.
>>>
>>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>>> --- 
>>
>> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> Thanks!
>>>   drivers/soc/xilinx/zynqmp_power.c | 5 +----
>>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/ zynqmp_power.c
>>> index 370e61ac47d8..54c796afb89e 100644
>>> --- a/drivers/soc/xilinx/zynqmp_power.c
>>> +++ b/drivers/soc/xilinx/zynqmp_power.c
>>> @@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>>>                           IRQF_NO_SUSPEND | IRQF_ONESHOT,
>>>                           dev_name(&pdev->dev),
>>>                           &pdev->dev);
>>> -        if (ret) {
>>> -            dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
>>> -                irq, ret);
>>> +        if (ret)
>>>               return ret;
>>> -        }
>>>       } else {
>>>           dev_err(&pdev->dev, "Required property not found in DT node\n");
>>>           return -ENOENT; 
>>
>
> No issue with this patch but how do you want this to be merged?
> It should go via soc specific trees and then to Arnd. I don't think Arnd will take this directly to soc tree.
>
> My suggestion would be to split it and get that patches merged separately.
>
> Just in case
> Acked-by: Michal Simek <michal.simek@amd.com>
>
> Thanks,
> Michal 

Thanks for the suggestion. I'll split it by platform and send each patch separately.


Best Regards,

PanChuang

