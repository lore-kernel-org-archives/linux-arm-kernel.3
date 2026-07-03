Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWLcGYQHG+p0vbxGz+bkaTUohQqMGx9L+nfl87YUc0s=; b=EaTLPRKTXFmS1eHMiyIJy99uFg
	xza4cBIYkkUHxkm0BaZWC4GV5M9TY+S6kxDg7ZR9l7b4S0x6cFGuSkD3+SFc2ycDAFQz67KJVbKH2
	YWUeD0rNiJKG4aiWnaWPBitgQACu1DyStiWEvdFiAWuyaP9KFET9SMl3M8QTcXbspt4zLUzic1UcH
	sVaIsT7MdWIMacAxcEPqkJXbfMRRm/ey0j9e2cwUq0RPLKiteAzIFtk/QAALackbtO2/UrfR5jF48
	53Kuy+U27tjJM0hYd+t6DmOP8ZctZagP0aM3iS9viYF0s0f/M5XCQLUsGUqYFjhNYNSzFvgF++XKd
	B3Otc/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgtM-00000007Ydi-1jZ1;
	Fri, 03 Jul 2026 16:37:28 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgtJ-00000007YdL-26d4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:37:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3hZnCLPW0uDwCwACyQvFn5f159/ImrSm80MCHRx5pm66JrSsPOswNmE4uIhg/h6OS42mx7Vs92psQ6l5Jg+X8N/w02/8wbSYqYYilwCeL4CaGraZ/PIesgFB+ukw5erH1TExedknR0VCFkaSteMxMW8GyCXROwmWXQg7OqY7ib4F8VQAwPRGEy0y5DukLBVOpkBkNuWhCjfzjDz8mIkrHnyRj78r6uzDpAPQ0rhHO7aSp2PifdcqLeQtte5+lgbfNYezWaRz3cDL9PVroAo+kpADKfAujyxU8ASnX7bUu9/GhmZsP/9gNQPE4nPbMxteA9kJlATuUuj2sharvmfWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWLcGYQHG+p0vbxGz+bkaTUohQqMGx9L+nfl87YUc0s=;
 b=Ojiz6QthEgLAlWsQgSBmVJctXiFwZGowcxBzqPfhEOyMX2pvZUf1GRDtLKrEiA/zSS1P7i2ObJMhivqeQrS25jaBENZ1VTBpqcLBMOK7CS77XmGdVVLznaasc6TAT9Dh/UUFztyHncfc3IvA0zJbmd0+CQLfRV5AoA7Jn5SuqFaNIUIJuNPvgXOUsiio31ZBXf6YIemHRX2t3JTEZIRXi1Xb3Dsvr/GuyyCK6q5Yu9zWd2bZ8Bn9ndVvSawJRfIS9XaeBzGX/GKXJYeXfiqZvQ4zr+bc7BLsQbzFFGu9qTonhjAQzLbAgEXWIKJ5S8+KFW65Vt0sNYCIQaaB2ljv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWLcGYQHG+p0vbxGz+bkaTUohQqMGx9L+nfl87YUc0s=;
 b=FkFzkEW0iZ52LgmhsG6PkKo92NLkmIvFmI/tHqg7TT4vp0x4hWa8VnVFXk8f46MNl/5aQgHyetJViOYcowLJDNLvdKyu+pflTIDeHTIculyHaDjIVpcfMuWJag/u6YiyBgwnZmN2KVzJjCCUVhJrlhfcswVko03WU2a249HIpoWY2zxWbEKXyr1waQZyi6yn0DW+T36XEiEHXcn5yhCw7GTMhp3zxUxg9wOE/ZpE2EYVQUGME0eh6DUChLIM2rUGAuwIDr3CYuAPg31tN80CJ5RCLW6pjIyrE8wfHVhDAb2m8Szhz4fUhslGxzJ3mBoTxrsTVri8XIs88+VoWnANIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11)
 by DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 16:36:52 +0000
Received: from DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73]) by DM4PR12MB5230.namprd12.prod.outlook.com
 ([fe80::6e87:1bde:1853:3b73%4]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 16:36:52 +0000
Message-ID: <7f3e9f56-b656-4fa3-8294-6c18421c9156@nvidia.com>
Date: Fri, 3 Jul 2026 09:36:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] arm_mpam: resctrl: Pick classes for use as MBM
 counters
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
 x86@kernel.org, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
 <20260520212458.1797221-2-ben.horgan@arm.com>
 <887e73b3-a3ec-419e-9583-6a2c288106f2@nvidia.com>
 <b8159f62-51a0-4c67-8058-65109d21b3cb@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <b8159f62-51a0-4c67-8058-65109d21b3cb@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM4PR12MB5230.namprd12.prod.outlook.com
 (2603:10b6:5:399::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:EE_|DS0PR12MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 50e7cb2a-0f50-4939-6f13-08ded9214947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: bm/ibN0jOsRmCpQ67AJhpyiNAiBLOAGdDyazJKTLMolMtVEJ5ymvffIqkWZKD3BXkfIbS1x3bWIpAp9XM9bPRofcTojSeyUy2skj06hgemELQraxBbgl++2d1Bx7OkoJktesanPy9dyPHA+bLjxANBxBv0cDX68FIKEMcNJQCzriZA5x8qCORQawf4jZfTIB2nRbUGlPzOJH4J942D21MohpDrelK4W25NdG2Dg4AKP06ZiTob7vl0KRVXEtp7NSq6GH6rSK9Hmz7X1cl2mu4zVqMynQM/Mu8o6mHF7RvfBQ13UxukIxVmQISuinJ9VJna0sKYFlx69IxF9+F/cHGlRk+ykbAVVoOsEvwfwo5snrVCnH6KyPkAzD+JkJF1BAtBsWZ8EBVUB8C2/dYFdgLO/WGUfGuaiKbbxXuJ0Gb/ylq7s4uz8WQlzxpImfJBgNW15/J/PuYP4/oAbfooZeirO0sqjfpZwFRD9tHi+j2Vfg8z9VifK+72NdIiPH069MGZFZ5ii3Og8+TovnSybaymTz++/CeKhQi96/KZV2G+q5BW2KrmYbd3+ULs6lglcEFy5JDYz5o2WQFAp3s626T6gvXRq85j2I0JOQyVzqCSTHPQIqfmDJgBWYqVgMK54WqWUrr+FOtnkr8FnFK/y6qJVJ2tcog7iIoF+nNDuztYI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5230.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVBBdWlIanlraEZlQlVqeFc1WXdMNVlETUQ5UTE1M1I1bVBhcDJLb0FnY3J4?=
 =?utf-8?B?RnB4aHhIQ3UyYXhicVpOMWVseWFMaUYvWlZGVXRJdE00cit2OWpCZUZwL29i?=
 =?utf-8?B?d1hDOS9jZmN6bEsvUUg4RFJUTWNhdzJEblJvVXRRT2c4TWloQUpaRVJldEFr?=
 =?utf-8?B?MWN5d2d0WmlneE1XK0JCczAza2VBQ3EzNHdEVzZaM1FuVXVEd1dTOGZOdW5h?=
 =?utf-8?B?dWZ0emdoK2RmUnZkZmY2dnlYL2RxeHg0dGdNbFJlSzloZEZjR0lWQVJVaGx3?=
 =?utf-8?B?RlR3RVBydkNxdW0zTXljTmlJekcvTDMrb2pUcllRS1crWFZLSEo4c2pRaW1S?=
 =?utf-8?B?a3Z4Tzc5aGErcDl0cTVZVWpPNzB1ZDJDbENhblluWlcwWHZMTnpGcEhYblBJ?=
 =?utf-8?B?VW0yeS9RVlhMUlNtSEtlaVB6ZFBhcWJYQzBTR05JRzhmM2hENEZmZ3hzMzU5?=
 =?utf-8?B?TDgzd1I4L2tHSjV3M3F5TDJzclVUdWhwL2VXUnhPTnlBWGdaeXRsT1ZNZzkv?=
 =?utf-8?B?K2dOeWtiWGtHSzZDeFdNTGx6TVR2cGx5TDVOeE9ZcndWd2hQMDdVTlpZR0Fr?=
 =?utf-8?B?dWp2WWh0V2Uvd1lCODEvMEswdjdJVXAvYXE3MWNWR2JEaklCdzRXS3BVQk1Q?=
 =?utf-8?B?dm1xZ2pmcHY3NVkvSFpWRnRmdXFkN2JqK2pKaEg3ZHYveUxPYmo3TEFUUmdu?=
 =?utf-8?B?YWJEU01WUUdicFNsVHZOSklQU0FmbWRkTHp5QnU2UDJub1FtRFZveUJsSEJx?=
 =?utf-8?B?SXlIWWxLZ0RyM3lKeWxSblYrbDltbVdTKzh1a3dnRUE0dmkvQXhrMzZrQ3dz?=
 =?utf-8?B?cWx6U204azFPVEgvZnF6NGZXeU0zTjNGT1RiL1A1eXJ4aHdSbFByMUdkbXBQ?=
 =?utf-8?B?aUdPMElaTTM0YmwzWGlEVDhuNWJBVmxQdTkzM2dMRlZnSGpJTlNQOExLTUox?=
 =?utf-8?B?ZDV6ak02WnNhYkhUUURCVWhEMVJhTlUzNFozbXRBWGRNbUM5NTR0VURzeHFZ?=
 =?utf-8?B?VWtoalVHUHhkbWVTM0ZFYUFnWXIvWlBTbmpadjZUTFRqUVdxSjk0Z2ZNcExZ?=
 =?utf-8?B?aFFzMFFHY1gybDB1YVRycTM5NUNsOHRJNU9XZXJsaklzSVJmVXduRUo1cW9X?=
 =?utf-8?B?dWVJYlE0M3JjOWVNV1E1NG1uL2RtZ0prbWQzM0NwcFFiaXBqMGd1WnlhVzM0?=
 =?utf-8?B?MUU4Y1RvOVlPRHZhM1h6MlV2ZzV0NEJTK3JReVgxOU04cHFYb3pMdGthbERs?=
 =?utf-8?B?c0k0L0p5V1ZGMlQrSEFyWms1MXhKd2hRUjlqUHArb0RuWThaTFBjN2l2RG84?=
 =?utf-8?B?Qk1ka2JVZ0ZuZ1ZDNlBCTGV3Ukoydmc1WjFLc3V5dThaOUlPV3JNTCtORHk2?=
 =?utf-8?B?bE9sdDNGOFBtNC90dkNlQ2dzQVpEaVNieFUwZTl0ZDBCa2FPcWlLbGhHMlpx?=
 =?utf-8?B?WTJ4a1lqUDNwVG5HTkhmOUwrYmFzeHpUQXFSRlVIYUxCaWh1RThsS0ZKYjB4?=
 =?utf-8?B?T3JVVnlKcE1NdmtmTHdvUllrTjl2YUkvY0szeDZPOVdYRG9XaEJVSUE1Ry9t?=
 =?utf-8?B?RXZRV3R1VW13MEpMK0wrM01IVXl6dUtKcTVEV2N3M0pMVWdMa1N2VldienJz?=
 =?utf-8?B?dkhMd3NrWU0wNWYxMkc0MitPTE9XQ21CeTBhdTA3RTROcVhMYzA2ZkZSL0Yy?=
 =?utf-8?B?RlIrL3lIUllpRm4vRXNpbFErakhXNW5QMENoUTZPck1CWWp3dEpjUlJidVp4?=
 =?utf-8?B?c1phVFVjdjRZczYxYkMrVVR6c0VSbVdacG8rK1lPWHUxUlpNdDlkS2FMVkFl?=
 =?utf-8?B?UTZNUUdlT3RnQnIyK1ROVU00N2pNR0wvaHYvQ0pmdjJMMWU1QkU4TU1Vc1RT?=
 =?utf-8?B?eU5FSlQrVnRsbWlnaXp1VFRveHAraGg4L0ZhQTRyMmplWnZKMHYxcStJK2xG?=
 =?utf-8?B?OFJBU0tHTHZxVVRPU1ZpMGdBZ2hCYUs2SE4wYVhuOEhSSHpwYjdCaUhLMUVv?=
 =?utf-8?B?RDZXM0RkNThvTjg0SXZQU1V5b0hyZHEySjNhM1VEMnNWK1l4QkZraVIzTWNw?=
 =?utf-8?B?T3B6amd1MG1iNVF5eWtOYmJuRTVsM1NFWm1xOXUvNEU3WEo4VWU2ZG9XMENN?=
 =?utf-8?B?bkVnU1RuemdrUStrTnFqUkJ3ZVRDbE9ub0hLNlM3QXNLSW1uQVZDeXMvMUxG?=
 =?utf-8?B?NG9JMkY4aDhyUnl4RFp1dzRZUTFWYzlEZjJoTWlEWGQ3LzhoZVREWmVjZFM3?=
 =?utf-8?B?VDhsckpLcFFuRjJ3VnNNUlF3MnlQSTFjSm45emtEUmp5V2FtTmNLU1VPQU5X?=
 =?utf-8?B?SzhkaEx1ZFBKNUlNRXBFZkNFMTN4dU1HWTI0WDFJWEhEYVc5ZmZodz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50e7cb2a-0f50-4939-6f13-08ded9214947
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5230.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 16:36:52.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syuOruA4X+yx3fuaI7/7ZkhjpZT01MXqqpbtai7UPSztpfWBvHDlt7eQ/ocpIPuWVw8hvQosbr8weVzdOqLCnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_093725_566931_A5AE78CB 
X-CRM114-Status: GOOD (  17.81  )
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

Hi, Ben,

On 7/3/26 07:01, Ben Horgan wrote:
> Hi Fenghua,
> 
> On 7/2/26 17:30, Fenghua Yu wrote:
>> Hi, Ben,
>>
>> On 5/20/26 14:24, Ben Horgan wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> resctrl has two types of bandwidth counters, NUMA-local and global. MPAM
>>> can only count globally; either using MSC at the L3 cache or in the
>>> memory
>>> controllers. When global and local equate to the same thing continue just
>>> to call it global.
>>>
>>> Pick the corresponding MPAM classes to back the MBM counters. As resctrl
>>> requires all monitors to be at the L3 cache, we can only use the counters
>>> at the memory controllers when they have the same topology as the L3
>>> cache
>>> and the traffic they see if the same. In particular, for the bandwidth
>>> counters at the memory controllers to be exposed to resctrl it is
>>> required
>>> there is a single L3 cache and a single NUMA node as otherwise cross NUMA
>>> traffic will be counted at the wrong instance.
>>>
>>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>> Tested-by: Zeng Heng <zengheng4@huawei.com>
>>> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>>> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>>> ---
>>> Changes since rfc v1:
>>> Move finding any_mon_comp into monitor boilerplate patch
>>> Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate
>>> Remove free running check
>>> Trim commit message
>>>
>>> Changes since v3:
>>> Extra paragraph in commit message
>>> ---
>>>    drivers/resctrl/mpam_resctrl.c | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/
>>> mpam_resctrl.c
>>> index 226ff6f532fa..f70fa65d39e4 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -606,6 +606,16 @@ static bool cache_has_usable_csu(struct
>>> mpam_class *class)
>>>        return true;
>>>    }
>>>    +static bool class_has_usable_mbwu(struct mpam_class *class)
>>> +{
>>> +    struct mpam_props *cprops = &class->props;
>>> +
>>> +    if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))
>>> +        return false;
>>> +
>>> +    return true;
>>> +}
>>> +
>>>    /*
>>>     * Calculate the worst-case percentage change from each implemented
>>> step
>>>     * in the control.
>>> @@ -983,6 +993,22 @@ static void mpam_resctrl_pick_counters(void)
>>>                    break;
>>>                }
>>>            }
>>> +
>>> +        if (class_has_usable_mbwu(class) &&
>>> +            topology_matches_l3(class) &&
>>> +            traffic_matches_l3(class)) {
>>> +            pr_debug("class %u has usable MBWU, and matches L3
>>> topology and traffic\n",
>>> +                 class->level);
>>> +
>>> +            /*
>>> +             * We can't distinguish traffic by destination so
>>> +             * we don't know if it's staying on the same NUMA
>>
>> This sentence makes me think counting only on mbm_total is a "software"
>> limitation. In fact, it's a MPAM hardware feature (or limitation).
>>
>> Maybe add a sentence like this to make it clear why mbm_total only comes
>> from originally?
>>
>> MPAM only provides one memory bandwidth usage value for each MSC that
>> supports memory bandwidth usage . We can't distinguish traffic .."
> 
> How about "An MSC measures bandwidth for a path determined by it's
> location in hardware."?

Looks good to me. This sentence and the following sentences clearly tell 
us MSC can only measure mbw on one path and resctrl reports the mbw in 
mbm_total.

s/it's/its/

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

