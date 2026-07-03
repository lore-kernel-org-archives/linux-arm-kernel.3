Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB19C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 05:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnFr9SsKoWhH0VbC5TpdXJL3GhBI/PsHNYw+slux2eg=; b=0X8JLwCHUAlYcXJ9yW+0mjWg5L
	Bckfq94dIOOtehtcNBk6KyIdMpOqVKAonZQxM+JApV+k4DlVGhxykC/pTxUdXDEJeFh5s9sYdNNpC
	y/saiukTt0GI+rLJCI37tEXy2PKTjWck4YR34Vs5javQD//9LzF7sBREIGyyFbo/IpiME/XjbZ4H2
	oXZ8VDjVE8L9WG+SWjG57pBM7gz4XKTSsT7qtYXGjBy3pdJXn0Hk6MI/fjwTHWGEZv3seRH2DKTG5
	uJsvGfIh0ppKbFRjUmcOAtQN7FZWSg6+ywztpqVeism5mpU+D0cof7Jbld7LWN7mYCJQNGVRydSEd
	ufA6Fnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWYy-000000065an-1UiX;
	Fri, 03 Jul 2026 05:35:44 +0000
Received: from mail-centralusazon11011030.outbound.protection.outlook.com ([52.101.62.30] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfWYw-000000065aI-0t8V
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 05:35:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwB0hB2QOtrCaRS8SjaHVyb0uB0ZJdh2+vAZL7mrIWFgciB0gYAPMNOx1c4JB6Fnmu6BVUfg51+1MGVNrsuu3aHNP9qCl1ibnFDxydNxW+erKVFaYBVoCfJ6lE+AXievAJ8ts6kTGEWfJaRqAO18GrpdFaKMWB8+oQaP84SNjnxSPE1eD0DXKwaZm7D02cmqaxGRUamCUJjXfrsnbTWXEDR8s+vp8lVqylRnd2S5IP+jx9WaatSvlVGgoh8FTzcxBXbfAAzyxyhdpDusoJFDsSep4P5q3aTld+3hTcfgyh3E+fDQFDJJRSTCiLuobhO+NU50om+zNFkdwdq8O7lqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnFr9SsKoWhH0VbC5TpdXJL3GhBI/PsHNYw+slux2eg=;
 b=sySRNwApenlL4BSFGR84JDHoMUvD6yjVy6YdhH33eHTMPbtG6o5ch3Era0B0kSFRORgkfFWV8rP8Ntk5bjPa7/fYSS0ePQuqRc+ckUTZjcXNmDHFlGtHiMPNh2ma1/1vhjFcbDQzkmRtNco9M1gF19X2QtDA8UuCTQdmGfqfZLYU3nYuIeKO9mIy15856j0Hx2nl4tW/WF0S9hgUoO8OdmpCRsLunPpWfM8XKhVzdfo/fhbInsfsU8JDIz9P7mz9TMdBLJ8RqyGaReXSL9NO7sAw9LiHult+UWS3/5uOgXxRbsPqEAdX+EoPQExnQzcyBSquBjzHskRSZVkj1lWeJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnFr9SsKoWhH0VbC5TpdXJL3GhBI/PsHNYw+slux2eg=;
 b=Gi8W99VJWHKvVKN8WgFatooGMa49R1Xw91YYU5XbV6S8FsVrM3T0e1uK8Bj2y/rp+qi+SjNvJwlnXoOhrB8WDgQwADA467FKGWBujOgPbwUMGfezU8npyI3Ve1nuYoWP4JxI1/Mp3fCNTHwvsxunPAWAPb0aD4PCwq64TXhH915vlpWUc/U9qOR9j9KCul5vsBPr2Io3gh0XyTkiiIC9u7wikMYgiDJ/SP5kxguiweWRdVG9++K2d4O63tPL26WxOuy2dsXTGGXEbEAaFdPM6VSU5txSKfAvU0u28ocYW16dNo8dXcXYprRqhgbTjBLI9+tpktNud8CET3/4EcU6WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Fri, 3 Jul
 2026 05:35:33 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 05:35:33 +0000
Message-ID: <30dfcfd9-80c8-42f7-bad4-3c0523146504@nvidia.com>
Date: Thu, 2 Jul 2026 22:35:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
 resctrl_arch_reset_cntr()
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 gshan@redhat.com, james.morse@arm.com, jic23@kernel.org, kobak@nvidia.com,
 lcherian@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, peternewman@google.com,
 punit.agrawal@oss.qualcomm.com, quic_jiles@quicinc.com,
 reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, zengheng4@huawei.com,
 x86@kernel.org, Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-5-ben.horgan@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20260520212458.1797221-5-ben.horgan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:334::20) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 8274639a-9154-4517-e3f2-08ded8c4e6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DNDNPKDM0a5nukumJByL/O2guG+3hsXJRGsTNi/CB8C5eb1LgWaz7XlleKJg2G0aioZikECp4QB4lVr4Jm9DVy24GwpI950mfvxRRWkRN6GodH21cOnCptq5EiaG1uuZrZ7ID/siruuFotfLR35gqNI4Vrm2WORnPSsTcffFuJOjunV4DXJuZ9StxaQGtcdLanXmWPLNW/VgTTUAJAzMpPJdXS20aNFc6U9l5xzOi+G8P+qqVYDnqR4ggn0MKVlqB0V3i7xnVkaY4YEIHMFCnq3sSeQAnRfcnXz7buFM8FVJB1VizA/AdA9i3GEhZ6Djfdil/sNwUimW0w5cGbVrFScE/7m4zhKRdWoshfM8/sEoREDn/6njUFgL/82Dr3E/BBtlUzI5uYuJwNZtFMex3om1lZD4/Kz0t5SE7ig12kx1pxl+uxDXXRv/0io4YCp/2YG9CtA7Wiu/ngP4fbZqjlSRUOn1whhOp2CUD9pSs+q8nRmMAfryb9618VMfnY6gQ6HXIoz9dWqIQ+id1scYXyLvfXfgxXOmMSqz5Ygzs4WbQ+8WFxUCpWeOfReIpjwVdmNQN8dapAVCu5CQZEVPakiADPYWo08vtebF8GT70eAcTIealv9LzDZZrinS0unHHvzlpigZc4t+kzH5BIyc9gxAO4CmRRtztdkzXLWeVyg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmxsYVMzUFY3ZVVud1NPM3ZnUkZPT0xMVVBJeVRoYk9Qa3dGV0J2M29aeHo3?=
 =?utf-8?B?RkRyL1BwMk9tQjZLck5UWVAzRTRTWW9PWWNiR25FM0M2RjJKWFNBZE4xOFBn?=
 =?utf-8?B?UVltTWdKWTB6QjAyRHY1Q1N6MXd2Ymo5S08yUUg5dEZjeTBnejBWUWdMdzYx?=
 =?utf-8?B?RXViaXZlK1cwbHI5SU1zYnVqdldtN1A5QlRjeThCeUNlUUdyRVdQSXpmNito?=
 =?utf-8?B?UXg2QlRldk4zdDFWYUpKVGtWREtIU2dHblVsMHpOWW5kTS9raFJISzF4eGxX?=
 =?utf-8?B?VUduVTNGOXRIa29FYm1nbkNjZngwb0xGSENwQURnT3czNXJqRUQ1bC9ocHhI?=
 =?utf-8?B?WWhMZVIzdHBLdWNHMDZFVDllL3BmSXpQNzl6dE4rS3E4T3lkakU3OU9aeDZW?=
 =?utf-8?B?c3Nmbjl3S2owYitoS3NkSTVGdFUxdmdKTFZoSVIwR1M2RUZtdmxyck02b1Jy?=
 =?utf-8?B?WUVURjlUV0lyNyszTTQyZ2tKc2ZVUWVldFh3YkhPa2sxaGozZEZUYWgyVGVF?=
 =?utf-8?B?a1NGSFFxZW5FY0JoQnVtcFFLUlB5RERZRmhRWStPS2lEeXBhdytzN3B4b1Rx?=
 =?utf-8?B?T3VsOGhDdm1BVjRUKy9JOGhhYnVyMkQ3UkdoR1BOR04vQTVMazdtNk1KUkll?=
 =?utf-8?B?SHZiQWJZRHhCQSsyN2ZsbjJLRnY2eHR5SFBGa3YrRmVBSEtJNkFLSzdUTnUw?=
 =?utf-8?B?UndiL1cyMmdhdUoyd2FYODFZazRseW1SR1Fwd0dIS3RZa0JEeXVuQmtHaVcz?=
 =?utf-8?B?NTQrblNxaWRsbUVZZkU3STJ6REh5Qlc0YTJDdk1CS0tqUW1YcDhNWXMvRnI2?=
 =?utf-8?B?VjZCK2lUa2VVRWovTzV2UVhMK01oMkJ4RjJUZjc0NkErQmIrUENzZEFqSDd2?=
 =?utf-8?B?S1dVcGlsNlBFYTRsUm1yTWpjZ3Z4UXNIMmxJbXcza1lWTmxPREtlNUEzdHlX?=
 =?utf-8?B?LzZvbEh4OGpoNXFDOWRRNVY4bEhMMkgxeHNrWGJDcmllTEJXUyt5S1IxM2po?=
 =?utf-8?B?Y251QUM1K0NSL3BXd25JekgzTUtWYVNWQVcrKzZaK3hpeWpaRm5EN3VrcVY0?=
 =?utf-8?B?eEtkaUJLL0pGYitlaTBKZ1U1S1lKbkFzL1pwQi9Qc2ZhVXZUZ3djN09xTzRR?=
 =?utf-8?B?YUs2NktLMkpOc2F0RW1HeEtMbUpsZFRiTFgwMituSGl2MzVBSnJUSXUxZGpM?=
 =?utf-8?B?WUVvcGE2NUwrWnFwcGVkZ2tpOTFJWjMzcUpmbG1HWWFDdUxLYWVLd0lqL045?=
 =?utf-8?B?c1d2aDJ0bEh2cVUwZis0dGRFcWNIZDBvN3V4d0tvRVlOcEdBOE9NN0NTVnE2?=
 =?utf-8?B?VjMxTlFjcEFUSlZRUENIbGl2TzF5RFJJdXFHZXlUbjBReVVXQWxrU1UzbHox?=
 =?utf-8?B?WkpkYXZhak5jUW0wNWx6TlZQZ0VlREREYzE3QXd2ZW9kL3hycTBIYzhicjFl?=
 =?utf-8?B?UzBESGI0enBjZktidk9aOWxIaWRlaWZ4QWNuOUxYM0x2ZmowZjFGTWJsVG96?=
 =?utf-8?B?U2RBdG04OFpWNkFNMlFCNHd0WE5HVnVGZGhhZmVzUUlIWTFEeE5FZVQrejlN?=
 =?utf-8?B?SGE2SkJZcEdXVTNkQkhNbTVOZUtEUHhKZ09BeTVQcnVPQ0ZwWFRqQlZnQito?=
 =?utf-8?B?MHdGZGl4Wno1ZGxBckl6cnVpMDdweXNycFBWb1IwaU1vcE9qZVA1YjNEVzQ1?=
 =?utf-8?B?Y0ZTYjQ5Q1I3R1JHS2ZENUdndHZmckcxaC92aFpHNW41ajJJVjNDUTI4Rmp2?=
 =?utf-8?B?aEJUUEpxdnpOZ2NqK0Y0a3k0UE1xVk5vVEpNMmY1ZVRyQjJLdWg2UlUyekNm?=
 =?utf-8?B?RU5MQnFtcENoRHdQRkhIZHlHTmZNdG5xRGlja0lWQ0Z4UUtKb1VPWk5LMjU5?=
 =?utf-8?B?dGhydHRWVHIxaGRBTkhSdkQxSGNHeEFOTUxKZEZzaktFUGF6VFB1R3BZcjJa?=
 =?utf-8?B?bVBGeDArckpiRnkyQ1FtTGh5eFJTTmpVZDRRRXFsS3FNQW5vZFAyeitVUHo4?=
 =?utf-8?B?MFo4bi9HWVc0djhxYmFoTkVsaUJtd2g3UnFsL05ReHJuYkZvWWZuQ2pKWldB?=
 =?utf-8?B?blNmRzJUSjVjYkNzaHhodUVNbDVQSDV1L1pkMDBGV0lEUnh3WFo4djJEbEg4?=
 =?utf-8?B?bTNrYzRMSTd1cHJHME5BWHNZNkZpSTFwOCt0bUpkV0NhTVNGVVFYTHg2SWVB?=
 =?utf-8?B?dnZBaVBrK0dMUUVFanJEaGQ1ZkRYUjkyN1NXOS8yNEtob0lvRDhuWVN4b08x?=
 =?utf-8?B?WVpCaVNTUUE4THR3UlY0aThjY01vRy9xekRhYU9neE16LzVXMHBvTWs0MlQx?=
 =?utf-8?B?cDZNT3dXeDBjOXFhOThzdWt0VmlsK0tBekVCeGtVR0RrSlZzV25Gdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8274639a-9154-4517-e3f2-08ded8c4e6e1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:35:33.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jyN5OJZAE36q0JMDrUQ4VzjeciC6X+rBSg4+5f8uS+/EKofkwSlHnMx0Xagb98DLksrf+aa6KXdyf0PyXo7Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_223542_258164_AE4BAFDF 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message.
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



On 5/20/26 14:24, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> When used in 'mbm_event' mode, ABMC emulation, resctrl uses arch hooks to
> read and reset the memory bandwidth utilization (MBWU) counters.
> 
> Add these.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

