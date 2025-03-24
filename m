Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DAEC36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 06:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDQMuzn1wuGm9BNhBkxeTUO1O1AZW1knRf+ijj2Yicc=; b=JsDH0Ogivlagg8xdG/2KcMpRpB
	Lfe8xH5urRBlZNVvY4XWYDqjm4phWj/3ROhb4AMWsUWo5fIJilCWt12Nwp6x7BK/WYC+4rGMw1YQm
	wXbKJ55IDi1LYlWFVY8KJzlMmy04W/WFlUS70VT/QDKZEX1VCBM38h0Xnt5NzVJBZYpipeM88r+CI
	7D/3gtx5hR9aChB7uYZjLETYLM6errqglAduiXC3c7jLtl+RMKRf+yVeZdamFNFlMayuRyLSUfOpW
	qm9y9qd3thoOlrHmdDVSpVGibgt9WThzGIrNEDLHSVNDZmahsOWdL5LIelzbt7KK2fRHdPVodo3Wj
	vxhoMGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbSp-00000002LkK-2jeh;
	Mon, 24 Mar 2025 06:39:11 +0000
Received: from mail-am0eur02on20627.outbound.protection.outlook.com ([2a01:111:f403:2606::627] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbI8-00000002K1m-2T5l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 06:28:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akkA6nStn3x3gDUZDymCr+n69HQlUR0I76wDGTNO/ONjv7dLsvlAhqb9Y/VSR3hhfVWhmYZJGIyxxo+RikrHnIjlb4c1mfP7ep9toBCR5bjYPkbN3P39+FR/oBZbGXEOZHgPKPT68tu+VZN8iQ8bq46V6XqbKueinojH2OFzz2pfikVDemcXK+/yzaKVauPYrsDh5036a+Vi4YTudTpQNaVXhgO/2c+dW0Rfs5He1Sm2T7pLwYv2VwySwQLt8GSJNvYgX2qUP6ynyEM+LBE0hwoWRuxbVmo+jYHShw4nx09RhL7jAlVKpQWSh/5aM6iRDAmZOgmOvj8vdBYZ2CNadw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDQMuzn1wuGm9BNhBkxeTUO1O1AZW1knRf+ijj2Yicc=;
 b=UKUTnCKZWMiC/2LTtdsUgt2dwyNr5zXWRTI1qVcB5HRty0HhcPWyrb5tFoZvWM3NNPe7H1g0S78X3O2lgZAgSiKRGMRkkBMF8MPZHpthA/KaTO3lNvia3m0VlOSSoH58jsXNNjLjKydZpLBn/82aQ9L+evOWjESr24UjjIbjuVKl8Db50Do9xpUgQH74cNGTzQey7AiA0pXSmwMkkR/gForO74gNHpb63bQ3y03q/BMCJyzIyYy9QQ9dP1W8+07EtSjKJ2h+Z7MxkQUWgdUyY3k6gktBWRZj3BmYeQ3J7Kv5+F10/F43oZkvchq7x27iYlg7fT3FOFS2z7dbixz9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDQMuzn1wuGm9BNhBkxeTUO1O1AZW1knRf+ijj2Yicc=;
 b=rxcSSprPBNwSyVrnANrU8qADq9tTlDBOrD1XrPJwk0JTiFbzlPHi3JcdtjgPUkurZ4DkWx2F/88UzdCtRgwTeSjZI1PWvAHp3zx1TuxpL0kc7Zr0VJY1pWZ2GPkmag8vatJZj00nAOaa0zX1aETjBFpt6ASG/zwOsWkmcWzRCPp78OMBVD2QSHBZYgEIHuEYE5pogc5hzJ5C5PTIzXj4jedX0NamIaaz4DqcJQbSd0ay0xfVWpjeYj3tRTOuZS/bOo4bJBcHo6PF8dOINdb2C+pJsxZyIJc/Sfo6YEiFy+WKq4aggCkcBMkL9WjZyWrPeKU7lOCKcn3MSm+PYRYeOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by VI2PR04MB11003.eurprd04.prod.outlook.com (2603:10a6:800:279::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 06:28:00 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 06:28:00 +0000
Message-ID: <fa9d57de-9eb3-d317-3d39-3940248ca17a@oss.nxp.com>
Date: Mon, 24 Mar 2025 08:27:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: s32 architecture upstream tree
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, chester62515@gmail.com,
 Matthias Brugger <mbrugger@suse.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-S32 <S32@nxp.com>
References: <2f686d68-4852-4aff-a551-51e8515de6e7@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <2f686d68-4852-4aff-a551-51e8515de6e7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0033.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::27) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|VI2PR04MB11003:EE_
X-MS-Office365-Filtering-Correlation-Id: 069888ec-c2ce-4479-6e63-08dd6a9d0609
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU1DZXUvY1praHE1YmtkdkZFcnhHb0JDQUZvcnhwQnN3MmlvVldwTzVqSG95?=
 =?utf-8?B?NTdGckZXVnN2QTRaREpOcjB2Z2IrK3lRMVNxWkJsbG91ckxqamlFMmNwOTBL?=
 =?utf-8?B?RCtFVmZlZ3BVMzRUcitYS0xGM0ZyVDUyYTlKYlA2eWpYVnF2U3dVZGV1aWdi?=
 =?utf-8?B?K0lYQ3lMcndSRXgwamxQTWVGVmpRZUZrZUVIR2RGblhSbEQ0blk4dHRLMmJh?=
 =?utf-8?B?T0tUcnpDN0NIeFpHaUNhVFA2SEkwRTRFMmlOWGhHVU5OVU91dmpjdjN6SzJj?=
 =?utf-8?B?bnFRK3hlbXduWkNLcm14QkFNZ2prWHZVZk9aK3JGQVE5bGsyUndXcm1TM2lO?=
 =?utf-8?B?cUZxL2FjcGNMUkVLV3BWMHpVeFo5aFhjdmRkTnVPMWNjcnRBSi9tZHY3YS9r?=
 =?utf-8?B?SllncG1wMWR4U1pGdW5YZjh5SVUvQkkzQzdvY20rZCtmbXF2WUZ1c2huSk9S?=
 =?utf-8?B?TGd0ZG5WUHJUS2UzcGtNNDJqc3BWcjNYeFhLYy9GR0Q3cVVoenZ1TXRYVHV0?=
 =?utf-8?B?bkw1MEpNdkZYS1lBZnpJSFNEV001US8yQjJQSzFock1weUx0L3VkOHVWcVlP?=
 =?utf-8?B?cnlLcHB6SUhBa1B1RVdESUl6YW5ndWF0ellRTS9NeGdCZWdsdEZMbktoRzVx?=
 =?utf-8?B?VkRJRkdEc3hqakRnbFdqc1Z1UGVLZWNMUXlGNTJRbmx6bkhxa1lzNEFIYWVz?=
 =?utf-8?B?RjJNSmhaMnRlZmtVSjluYUZ3OE9xYS9DdmFHSkxxak5vYlRJM3Q2U3hxS0M1?=
 =?utf-8?B?Z2VwOE1KbEtHNlZuRjFMbnZubVZ2YmlWdExteG9nMTJvcGgzV3lrRC9pNnJ0?=
 =?utf-8?B?R09CYUlEZUpQRkZROUg2Zm05eVBBejRJYjVkUFRoVmNSb0FoOStCMzY0bVN1?=
 =?utf-8?B?cEVRTlhESXM3bXd2L1hoYzhwck9MdTZBNVBTTEJyU2tQYXJKNDlDd1d1Y0tx?=
 =?utf-8?B?TXRDQmtHNys2WXdwbHcvOU5DL0NvNDRkbms2a0FNejAvNmovTEs2ZDR0WVNB?=
 =?utf-8?B?bVB3L2liSEV1dUc3b01tY0x1Z1g1dk1rS1IrUDVjNkpKV0VLamNpSjI0N0pz?=
 =?utf-8?B?cXhHVWRLcHRsbzhoLzBwS1VWRkxUOFZKQ0hHaW1iaVlWUFpVdkdtaGhCNWR6?=
 =?utf-8?B?UVhWaFkxbFE0amRkRm5LWFRBQnFkWFdRMFRTd1ZiS0dOQ0Mya01sSXNJK3JG?=
 =?utf-8?B?SCtHYVZMVXN6ZTdjQW4zRDVCK2JRY0p5YitHWTdUb1VFUUFWTW9jemtVTGdI?=
 =?utf-8?B?eTF5TWJsalpWMzQxRnJyTFpZSStSSDBrQVlNdGtGTVMrVXFuQjJwcFp3QTUx?=
 =?utf-8?B?aStVK2lSbVUvQ3FsTzMzRXp0MkxpdENaTHFXcWVVWStyak1JR0psdnU1TFh2?=
 =?utf-8?B?YzV2WjRQb280UkdwcWVzY1YvajE5b2gxSTJtRFpPcmdMVnQ5QWRRU204cjYy?=
 =?utf-8?B?Wlg0SVlqenNQQ0hZLzlZNi94YlhtNmRRWkxHNkJBTFQvV3hnNFVNNStaMWpD?=
 =?utf-8?B?UDMrMUZyNEJubi9YbnExOUtnYkxkY0gvNWFFbmdUM0V5UTNablJlalorcjNu?=
 =?utf-8?B?dDFENVJVcUQvdGJjeUZueSt2STQzNFVoOW5FZlNMeTBGVTA3Rmxaa0tIYlZI?=
 =?utf-8?B?RTUvVWY2SndQN1FSMHhhbXVOSmRFV1lGYk1GbVF2MVo0akx1ckVxekw2L2kx?=
 =?utf-8?B?ZGc3TGpncHlqSXhPbVRNYXJVWC9RRFA4ejY0ZnYrb0lvR21JUmd3dEtCZ3FM?=
 =?utf-8?B?WHNJaE1tbm9PUTZmN3NDZG9MNUNzUzNBVzdZTVFBb053dHd6RzFKbGpVZ20y?=
 =?utf-8?B?TTRIbzNUNFZaaXJOMTdLeThkRURRbCt3YzRSQmt4eUtyenBXbGZWVUtQNlhi?=
 =?utf-8?Q?8NUg6WvnNBqOR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXd0WktJN0JvMkN2b2FieFJ1U2g0US85S29iR3FpM0FSME9GdmY5NTFId2Rt?=
 =?utf-8?B?WnovVm01Qk5paVdvTlVNcVQyTCtWaXdGZndhN0R3Y2RPMzBPbFBtZ2t4THg0?=
 =?utf-8?B?UG1TK3N6ckJDQ1l0VFZ4a0lURHNSVkJhcmQ0VnpJQTkwNVFDVVpIZHRyWTkr?=
 =?utf-8?B?WUxTQlVvTjZtbVE4eUVTVEgrN0RjbHdzQnZMUnBEVDRhSzRWNWxWaFV3MjIx?=
 =?utf-8?B?OGkraUg2YlM1R3FlSFVkb2NCcDhPQTNoQkhrYWhsTlNYamZYaWNHMnZ6cjFB?=
 =?utf-8?B?b1d1TWpBVUExaHhRR1laSyt2MjZUQWFJMWZ4VmZJQTF2cjdyOGcwOGZWREZV?=
 =?utf-8?B?WGl4WGxDK2VYVU82TUppV01aN3YvaEdTZmw4MGVjVEtjT3MyYUFxOStjVUpr?=
 =?utf-8?B?eWRPdzdGaUsyS1VxcFFVdGZERVFpUDdFdTlxTlhxK3JBZUtlNGhEVnNnOVdR?=
 =?utf-8?B?ZXJMVXZpOXpsaXlUV0x0SDVEb0ozMHh0R2VUVW03QjNpUkRIMUJVakwwK1Jt?=
 =?utf-8?B?WUpTL0MxSnhmb1paTk1XMmkrSGdIdGZTMlJQTFdzOUxjemNIMktBRUFMWGhl?=
 =?utf-8?B?UDJuckxsOGhkNDdMRWV4TGhLT0hJV2E0Zi9weWtXZ2FvNEEzaXZKNWdZNTRs?=
 =?utf-8?B?cWMzejlhR3pUY2U2TGptZ2pubUhmZU5zeXp4MTFVYml1MG5uLzhtQ2hpTUpo?=
 =?utf-8?B?MFRVVjNRaCtuN3VmZUQ0ekhsN293V0FmbkU2ajU0bmZhUy92ek8xR21SOFBk?=
 =?utf-8?B?WUZucE4zTnE3VEhsZS93M29uS0FZdkNmai80OGo4WndoUXBwSjZEUnVUd0tx?=
 =?utf-8?B?amllbDgvM3ZmNHRvby84MmJJQzQ3QmNWR2M3ZVRIQ0p0RUExcVd4Umw5b0Fp?=
 =?utf-8?B?aDU0TDdpbjExS3N1d2M2MEdOaU9pOU9idXJkTVh5c3VKb1lWU2ZwQWpJY3Uv?=
 =?utf-8?B?Zm1Bc2tKY0prSXI2dmZOSWptZUJHeEZOdUErRU9yU05UUnVMbzFXZzFRZGpz?=
 =?utf-8?B?VFRXTzRhWTBwVFlHL3cwMFNEZHlscFN2dEdhMnZjSzk4WVlPVDAraXlpWWFz?=
 =?utf-8?B?cGwzR2toYkZUZUhacWVxRUUwYVllLzJXNk55cCtIUzMwUnh6bTluakJQMTZu?=
 =?utf-8?B?U0c2YitxTzd0UE16UGc4Y0R6dHRIVVp6bHE2RWJIMXc1VURybitxMmNtN3ZO?=
 =?utf-8?B?ejErMzYzSHBzTnkwZGhXZW5XVXZxTWkreEQxM2k5VHJCL21JYkd4eUcyeFpm?=
 =?utf-8?B?eTBzV2pXcTBlRzU5OTJ1ODhxb25YMng1QVBTTWFQd2tRdzRNbjNlRmpQL0VH?=
 =?utf-8?B?MHdiUzkwelV1Y2tZRG9TUDBlNDdyanlyQ0ZFQlovS0tlSVVjK1N2WERTZE8w?=
 =?utf-8?B?UlE0QUhrRHdxdThQeExramdrSUVLNEI2QjUvRHJ1NHJHS0xZZWJJVzZQU0xM?=
 =?utf-8?B?ZllUQUs2UW1SdnpEMG9TNURXamFUTk12cldQTExaOEc2N1VnT3U2WDRUVFpL?=
 =?utf-8?B?QWhjbTREN0sxVEpDdWJHaUlKNHpaV2p3YjJIYjhpUFY3MGV1eExRYWtuK2k4?=
 =?utf-8?B?L2tINzRueGNHZHFpRDM1cU00MS9OMlFURElBSW5jQkNibmFONjBEVjVPMUQ3?=
 =?utf-8?B?enBLUkdqV3Yxam9vazZUTFBNL0UzdDdkS3N5ZmowajRpQ0JFZjliQVI5eXVR?=
 =?utf-8?B?SlpPdHRIQSs3U3pyZ0FjSzI5M0dtbmxacDY5ZEJZQ2dOclNFSTNvWUk5eDNn?=
 =?utf-8?B?SXRiU25za05Nc2lMNitBaUJpL3VrNGgzdDFwNnArdWNybHVBWFMvTUJScjV4?=
 =?utf-8?B?QzF3Zk4xMktWTjZFYnZLN1kybi94VVlmSkRZWjRraExRZGE3aXBweTBuaFNt?=
 =?utf-8?B?d1k5MDF5RHlaZ2NpckdjK0VERmUvN3d3djBBU3ZEa0o2QjNFNlJwaTFvamNa?=
 =?utf-8?B?NUQyRStldWlNRFVRVTc4azBiRnRrekxCSG9iYXVqR3lwNzM2U0YvUmFSL2VL?=
 =?utf-8?B?T2d0RDRjU0EyYTJyTjJob0d4ZHhqNmYvNERpOW1Oc2I2SlBCemNHRWNLK2N6?=
 =?utf-8?B?UWpLcitYc0F0STJHNzd4UU9GRllhUHZwcjNnSVd1QUxvRmlRdXNudTh1T2lV?=
 =?utf-8?B?aFFBeUZZS1JOcE5KcGRmWTJ1eWNxMUpJbDU4RE1NRktxeUxWOHNBaFBLSll5?=
 =?utf-8?Q?x4naVcqZBR6TW5rBNPoLEFM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 069888ec-c2ce-4479-6e63-08dd6a9d0609
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 06:28:00.3385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Frulshnh96PtLLrpRAuMIhMz4/0YSdgUTHKfEurBa8RbWfEUKXRuL7jo2N5d8hMFo0bjuFSP7cZNX8d/nZzOGo9YenxIgJEEWVtitFq6TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232808_635888_6D205144 
X-CRM114-Status: GOOD (  11.92  )
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

On 3/22/2025 1:39 PM, Daniel Lezcano wrote:
> 
> Hi,
> 
> the MAINTAINER file does not give the information about the location of
> the repository for the s32.
> 
> Where is the repo to base the work on ? Especially the device tree
> 
> Thanks in advance
> 
>   -- Daniel
> 
> 

Hi Daniel,

Shawn Guo's tree should be used for the device tree patches. Please
refer to the 'ARM/FREESCALE IMX / MXC ARM ARCHITECTURE' entry in the
MAINTAINERS file.

-- 
Regards,
Ghennadi


