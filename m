Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573B8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPQIDLZyKVJHe0H275s/l6bQZT14fvavMu+z64bXzk4=; b=yHc0oGSA3Y9LcO3kSCrctnnwAj
	JLEuU2A049bAt3MFth5UGM73rtIja5OF7DuJ9R726RDkYEvj7YdUjGBTGiE6Mstr+Xxq6PpzZnO1A
	AW+z59usU7DLh+reRe3ZWVu55cxJsRp4YNdf3UGSrhcNaJnEoI0XH5FCCBG3xXvPk0vrHhx5Qzc+S
	UBvEPLsfNgYcEFToBmmkXjExAwznoE8mbSfF33h731+Z3kCCqUCLkvIBOYcn30T0AHtIt6Bx3r7vK
	VdkE0jjtSjzdJopBRh2PlK0i7Rs6mQ+owWRW5+hYtoMOh5uPxlY4ovNbAScPdL1UAihn89UMv7wxd
	U0pjjOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG54-00000000j2e-2HOo;
	Tue, 19 May 2026 08:45:38 +0000
Received: from mail-northcentralusazon11013018.outbound.protection.outlook.com ([40.107.201.18] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPG51-00000000j1Y-09JK;
	Tue, 19 May 2026 08:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQSx0IBxIF4iMHCFfR+SL4TeMhQP7uDA+nu/e2dwNxG/swVzINbZdB8WqZR1nIX8QMh6s/J5w1yt4D/vqZWAUdlp2zRzu+wkdrCVRK/cbC4P9IGWTj7iaAw45KziuwdECLSk07j/JIJWl1xsKEyCpl8cSWaUL0oFBA7xIQ6DbEeYhWM+KQVj3ZI5jQVmfWw4423M88ZcAZFrKYBOFU1vu26M1BrhFglxsMEk339wS/85DSQm/U7ELMm76gS5pPQUpNb6JhLxVT7YzDSmicnHq4HymfQKhjC37B+9kA5hLob51z01Oxd3FL27OUtFrEU38VY3A1Hlt66cxDBuyZQfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPQIDLZyKVJHe0H275s/l6bQZT14fvavMu+z64bXzk4=;
 b=UzHMmEasMQuwqo95J09pM3EAZr85ng/VudOzcM63ty2P4fyUemXrS9SDfiddrI6AyeYLUfCNMu3Us1vxtZgcGXljlj+kZ5QylxPkghWnyTjiuQ9gVq49PsCA5uTfDXtbgDluvdpamN1ICd2TkK2i4UO8b5HsPd6UUlFT48vTfmGCt3yw835bdBhL6VRoeNk3kc2kZrhAalDuHFOo84IyjAUe/OUhM/j01Y6Av/llspVKf8Zk32MiKQv93RhgjbkpcIdn2ieBczVGcL7IJ1hNZynkWDLDJH4K4C8YyN7xeDiDR9TE1pRgjx2a7FH3YpiVmPs77UIlPkCghrlyQKjlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPQIDLZyKVJHe0H275s/l6bQZT14fvavMu+z64bXzk4=;
 b=OPf1OICy1iiplLxncZjOEbim16W2f5QqWs+S+REa2Px0bHlGVyr+sflNMFBDKA0MRCTJqptgurYcM7R9XF5LXjC4VQHxMsNHuausYu3BOzH7z4crw3lDvV7ImF1JAyHx4lxK25KS8ezKYiQdWzPANwlvghgr8Sdr9uNbJFthrIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by CY8PR12MB7172.namprd12.prod.outlook.com (2603:10b6:930:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 08:45:28 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 08:45:28 +0000
Message-ID: <af789a44-416b-415a-bd41-47d3e46b569f@amd.com>
Date: Tue, 19 May 2026 14:15:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] phy: zynqmp: fix SERDES scrambler register handling
 and enable for USB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, michal.simek@amd.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, git@amd.com,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20260511163135.2924642-1-radhey.shyam.pandey@amd.com>
 <20260519082526.GB16205@killaraus.ideasonboard.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260519082526.GB16205@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::12) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|CY8PR12MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: bc08c197-97f7-4bcb-f45d-08deb582fa2d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4143699003|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: +/RtCU15p42H9mST15fKo7PJI4LDTQZu81TH0oh6S7huvayohxqAh3DmkJ6uStZ3n/2ZL8F3DOLNLFMlGkGy+PHVk2ZvhNwbJ23SP2iR7aTG/mdFoAjqvO67rbeWxnY0Vb2tNM8AVFKvY2QfHTwfv2RpscS1Ars6RH188Tscijf5z+FyX42hyLqm99GgeX/De9UwXo72M8LBXS+DHqoQAugiCzgd+iZt1hgBnXxLVMjEHeNsNcjZEoI2O65Rn5ULbwblsh3QRz0HB3jHaFIzlO+s8qL7ZWn0ZBvpE3VO4S02OpjpBTOPf3eVlsd29TXWeScya8K+ixArX7m1expRQoavfgio/aLBS7dQX1xZ2ixIdWigeljCZDVOlX9dGTEh0ujFZ7up0F+442EZOz3IOjXfzuUqQmBlwjRiiokIU2nSXtE8hkc6SDPnLUROJmTVSFqFLE/D1+FbXGsgfmNW/h6nAvExtinWzavemXnPlQCRCc6qIFx2WO32xcGC+lODCldI3mYbqhvSJ9W2j3Jn6DGrFX01gdy4fo7SPKFoCJde1LbGtml3twiN66kuRxrPa3trjbG3hX0z4geczAfHwsmfwk6cSk+2RwgeLdE352gWnMVEBPsMBW5L43DSoNo7lH4+As9KiJlm2I3FweMAjU7bpvYeQ+ei+X44DGyNo5PCHKntWEkK3J3kZlh2OwRq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4143699003)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjFlc1gra3FMTGp3MDJSUjJISXcxemtuYUpTVU9qSDV2Q01EMHREZy9BQ1Fx?=
 =?utf-8?B?cUpHelpQSHhBZzh0b0xoWWJ6YVBnbHMrQ3ZSalRxTjlwbnYxNnZmcnJ2bFY2?=
 =?utf-8?B?NnpORzd2OXBaVVFIVXd6SHdqRStZUXQvSTJBR3pMak9HOS96a3BGbC9SclI1?=
 =?utf-8?B?czhMQmNJbTltMy9HQ1B1SEg1eHUrWEFYajZhZGFBK01GWGV0bHYxbVhYU0h0?=
 =?utf-8?B?QWRQTjQ2RzlMdVc0d2o4aTdpaEM0SUpPcElDQ3RHVlo5QjN3U0V2SnBkQjNF?=
 =?utf-8?B?b2hsVlRvcGt0eWs3UytLbG5DV09NaFNUNWxoT24yV1poeHdHRFVsVHRGRzVt?=
 =?utf-8?B?OWRLcStrUkVNNFp4dldlUHVrZVhtQ0pGRUkzZnh5VHNVWmZpZ1V3dzBsVjFr?=
 =?utf-8?B?ZDRxUFpUeTE1RGl5WWx1RWhFdGRLbE4rZVhxeHU4bHhObjZkNS9nQndnckRt?=
 =?utf-8?B?MVZzVVJNU0pYSlgvOWVoNHcyZHZWZ0hwQWN4ZU9UYVUwWnZrRVJFVk9keVFZ?=
 =?utf-8?B?cTA5ZG1MSytxelBodElBS2FudWdEeCs3em56Vk5CYlJwdVVKelhUbnZOWkZn?=
 =?utf-8?B?QTNaTlFtcWFsRUFLWnNXSUNmZ2NIdUVablVMT1ZwaFpGNjVQNkFpcERDZFFD?=
 =?utf-8?B?bzNxY2pPbFVONzdYRy9IWHVhaThRWlFlNnAwYmFhTjBGM0RwNStGU0hocXQ5?=
 =?utf-8?B?SWlLeVY5TkJ0VnNnS05VMnZrRDVlUXZRTTRuY0pDSm5pNVd5cWxmR0NWRktv?=
 =?utf-8?B?d1RPcmpZT2VsbjAzWDNCelZkNllzMkVRYWpCRUNhMUswTnZqMVJUa1ZCMXNv?=
 =?utf-8?B?YkNrQUYrUTBzbmlXWmZiOW43NkpCcG1Wc0Y5SjRaRWx2aEVLMjR6ZE84WFhC?=
 =?utf-8?B?czB5NmtMcG9zNzNTNGV2bmVWNmVqQVFmaUYvcVJsZmpscU15bFNYYnBzbFU1?=
 =?utf-8?B?RzFGNUhQa045cXpwTnRBUGVTRXJWRnJLbVVldzNkZkwxK0pBRlZGUHk0UW5V?=
 =?utf-8?B?dnF0UzBxd1pGNUZzREY1cEd1bFlwRVdsN3dJYmEyY3VvQTZ0R3NBcGFtS0s0?=
 =?utf-8?B?QkN1azgyRElpc05PZ3pMakszYjdhTzJsZk9MN1d5NU9jb3lPUXlzWmhld0dI?=
 =?utf-8?B?Lytoa2hVckNhbnJjRGk2dGd5Qi9Sa29COE1aNmdMblI4dGJaeE1BUnpYeDF1?=
 =?utf-8?B?R3Rta1lrT1I3SkFnSmN6cmtHWjVvZFN6TXJURVZmSmVadlp0cWZ5OE5tbExj?=
 =?utf-8?B?SVdtWWZtVHIvZHV4WnBRbE5rdVZKYWFNemR4RnRIaWM1UjB3UGJsNis5aG1i?=
 =?utf-8?B?alM3QkU4K2Y2TUVoaFNLR2ZobmJuZWRubjVWTG4vaGJHL0YvZVFVRS9rbDNj?=
 =?utf-8?B?dmh4b3RpVjYya2ZQK0NVanFiaUtYakF1eDVuSHFnMVhUZmNHY3ZkK2g4c25C?=
 =?utf-8?B?cVUvc1VrYjN2RUJwQkpDcDBXcmRaV1V0eWh1T201K3NrbEhzclpHSFNQak1Y?=
 =?utf-8?B?WkNDcnlZb2VvdzVBaWJ1OWp0YnBFNVhQcVdxY09ZZWlIdEhmWnRYZzVVczVi?=
 =?utf-8?B?dDNuNmFyTlQwQ1hTWlVnRVlSa0NwMDRobnFHbGRGcFZTOTJSRUxCWlh5NitW?=
 =?utf-8?B?bW9XcDBuREtiZVJ0VW5hdmpCMkZ4UEdTN1hvaVFaSTdGKzEwSGRaSGZZN3Nt?=
 =?utf-8?B?eUg4VUR6ZFFBT2FCN2thUGYvdzVRLzZDYmdkV3dsYXd6bFM1TW03MUhJZTZq?=
 =?utf-8?B?UEVFQTYxSGNzRk1qRTVmRTdaeUxzUlFoQzFnV2RVWFJPM0dNU205cmZjOUZC?=
 =?utf-8?B?U1k3aWorY01sdE9iQWUwcjh2UDBSS0VlRERDUFg4WTcrMUVJbzNUbTViTGth?=
 =?utf-8?B?bkZqeDIyODdYbyt4NCtBSW10L1JnN0tZdng3dERlWk5DaU56SnhnVzNmZ0pR?=
 =?utf-8?B?a2RidzYzNkxZMTR4Y1RQUmU4UE9SUXJhY1JZcm5OSjRvNW5MTlBRZUVPNzdU?=
 =?utf-8?B?L2kzazNYWkU1dHdmQjgwNzBHSGhEUUxjd2ZVSW1uNVhCOWlrY2ZLYXdQR1lL?=
 =?utf-8?B?WXFpK1ZPRkRQZTI3dzljQk5zYk9Nb0JienNrVUVJazVLenZMRTB3d09IYXJk?=
 =?utf-8?B?Q0RSWFRYczVWNkRUOGp3M29MZGhoTFpqc3pyNkdLQ1YwTngzZVBQT2piTEFL?=
 =?utf-8?B?NVUzQXBMallqRUpyanl4c2Y0dFFHWFprUFFPUkd2MnJQT1ZxdDU2d3lhczBq?=
 =?utf-8?B?dTMvTlQvcHlGNWlBdUNzemxVTmFtUWJINjVjcVc1YTFZK0F6R3lmYmFHQzFT?=
 =?utf-8?B?Vzg4WXZ1Y3dkRjZybzRsM3BTNHpFUWhHaVJtS0xlM3JkUFl2VGhqUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc08c197-97f7-4bcb-f45d-08deb582fa2d
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:45:28.1991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DQlnQwz5GB2j4pUk12DTYDwu/nKwezjqk27C+LaWz0NA48TroGAMv6ERVcIALWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_014535_081006_FC26A3FC 
X-CRM114-Status: GOOD (  16.58  )
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

On 5/19/2026 1:55 PM, Laurent Pinchart wrote:
> Hi Radhey,
> 
> I haven't really been involved with the phy-zynqmp driver for a while,
> despite still being listed as a maintainer. I have just sent a patch
> (you're on CC) to hand maintainership duties over to Tomi Valkeinen, who
> took over maintainership of the ZynqMP DPSUB driver. As Tomi isn't
> really involved with the PHYs, in particular with the non-DP PHYs
> supported by the driver, it could also make more sense for someone from
> AMD to take over maintainer duties for phy-zynqmp.

Thanks for your continued support. As i am handling this driver
internally will send out a patch to also add myself as maintainer.

Thanks,
Radhey>
> On Mon, May 11, 2026 at 10:01:32PM +0530, Radhey Shyam Pandey wrote:
>> This series fixes three related issues in the ZynqMP SERDES PHY
>> scrambler/encoder bypass path:
>>
>> 1. The L0_TM_DISABLE_SCRAMBLE_ENCODER mask incorrectly included bit 2
>>     of L0_TX_DIG_61, which is a reserved read-only field. Correct the
>>     mask to (BIT(3) | GENMASK(1, 0)).
>>
>> 2. xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which
>>     performs a full register write, clobbering unrelated bits. Switch
>>     to xpsgtr_clr_set_phy() with clr=mask, set=mask to preserve other
>>     register fields.
>>
>> 3. USB Gen1 requires PHY-side scrambling and 8b/10b encoding as
>>     mandated by the USB 3.x specification. The driver was incorrectly
>>     bypassing these for USB, the same as SATA and SGMII where encoding
>>     is handled in the controller.
>>
>> Nava kishore Manne (3):
>>    phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
>>    phy: zynqmp: use read-modify-write for SERDES scrambler bypass
>>    phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
>>
>>   drivers/phy/xilinx/phy-zynqmp.c | 37 ++++++++++++++++++++++++++-------
>>   1 file changed, 30 insertions(+), 7 deletions(-)
>>
>>
>> base-commit: 5d6919055dec134de3c40167a490f33c74c12581
> 


