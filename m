Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDC9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 05:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esD73XR6mDBiRZFpcl42HCqPB1Ekd/L66eyzC1w66ck=; b=rpMqMnegtpXyNi4okqKOgYAthm
	dNyLd7WjLyJP8OWlnE/U9z0x7BKXNOZNezvMEkW2bbabmfwN4IQ3KwdyNIh3Pb1ru0POtonWyRszd
	DqLgh31IIK78aY1Xapc/9+prPGZfvOjpIariyAzOUjrXLuBN5vqSxiexqdS3uDG7EC9iek0fmfjXb
	47LvJgOD5GvfoAoh6llbehFrPS9Ie8+wDxfjobKKsGiNRLrdQ/ZiqLNLqV6ccMPycRvr7YN9QLwEw
	lveb2E+WwPPGh7ujftEdpi703kY99EhiSPF7u9TLJQa7slz1j6U/ze0WRAf94ENQ6B8YMRvxBwRdl
	GW/BkGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9V3-00000008Aql-3ES6;
	Mon, 13 Jul 2026 05:46:41 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj9V1-00000008Aq4-2mH7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 05:46:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fB2EQ6PCCr1zMPzUzs3afCpeBEewJaVglBVUrvfzkIVzvPgHrtAw/qTAVxZ5qUkmVXR8vT4pS8nNr24UVockDaoAl5QRWqRjObOLJhIMbwW/kJKenS9w2Zl9WsZSY+QT/ax31SbbB3cvKc11gybdHKvSPQFI5xAQXs9UKGeH9XkpFVHgyHXJYcbNNaS6WwHZtOpq4vGINmYOCLucnn9IP1kVK+mus5bfyO1VRgTkiOVw2twSsU9S5g1JDtN9LJefEdD15y1iNch1RtGGMHmfusar6IBGi+YnYXyRl4M+IdbvrnkGzDvnDJXLjf4ZEqw4JoZGTaH+aFKyNvRhQgrKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esD73XR6mDBiRZFpcl42HCqPB1Ekd/L66eyzC1w66ck=;
 b=QjvU1t0aEz6089IvZMJ9DWf9hX1hPf2jrnUZs4IEQ3vFPqqteaV7pQdNx8PA+JoSmGjbxOW8nKDZzGEomFq6rYbUf0eP7eLgwsLehqljuDjB9IZ/haGl5oaCfizDGoIyWc1xxLxYZ4LcTL7oPzuHoffOUHk+43MHA8r4om9ewcFhnhrqGYzSh+JcKQ3JKO8kgdpS77gwaW0Aayxyxkxqyl5yEXG8sAqZInHIcBFgXsChdstWfc2cde5xH8egwNiSDg+MlTSE1Z9p+kdCdM+QCYjt5gAgER4F3hKtpIXj4NaSrTuXukhPbOgf0iTn+eW5GxOuEQZ05MDkfzleLOBTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esD73XR6mDBiRZFpcl42HCqPB1Ekd/L66eyzC1w66ck=;
 b=V7ybBbYeRIiUElEUmHz9lwz4GeFOSiTCfB3bk5OmygeTtHyeO1VetsD5k3UmOM6RdtDM5ZfnL5mXvuttUe1MoR+Gm/KBbxoooQna/m4sRyz0Tiwcm3bbx1CL7usVJz25eMTRV/4X2EmHcJHezbRGuYOr7wdt4pWkmIbL2ceDeUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MN2PR01MB5615.prod.exchangelabs.com (2603:10b6:208:11c::29) by
 PH0PR01MB994865.prod.exchangelabs.com (2603:10b6:510:3b8::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Mon, 13 Jul 2026 05:46:33 +0000
Received: from MN2PR01MB5615.prod.exchangelabs.com
 ([fe80::996f:e4f2:dbd8:120e]) by MN2PR01MB5615.prod.exchangelabs.com
 ([fe80::996f:e4f2:dbd8:120e%4]) with mapi id 15.21.0202.018; Mon, 13 Jul 2026
 05:46:33 +0000
Date: Sun, 12 Jul 2026 22:46:27 -0700 (PDT)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Robin Murphy <robin.murphy@arm.com>
cc: will@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, 
    ilkka@os.amperecomputing.com, bwicaksono@nvidia.com, 
    linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-perf-users@vger.kernel.org, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, 
    Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH 1/4] ACPI/APMT: Use stable device ID
In-Reply-To: <2a1ed630-3f88-400e-85cc-596b4dd5f5a8@arm.com>
Message-ID: <b79dad48-0a70-5e27-d074-38df81367485@os.amperecomputing.com>
References: <cover.1783605641.git.robin.murphy@arm.com> <c113eff51124250fc5798589ce905052046b43b3.1783605641.git.robin.murphy@arm.com> <2a1ed630-3f88-400e-85cc-596b4dd5f5a8@arm.com>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: MW4PR02CA0027.namprd02.prod.outlook.com
 (2603:10b6:303:16d::32) To MN2PR01MB5615.prod.exchangelabs.com
 (2603:10b6:208:11c::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR01MB5615:EE_|PH0PR01MB994865:EE_
X-MS-Office365-Filtering-Correlation-Id: cefdc82b-6ac0-45c2-96f0-08dee0a2179d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|22082099003|55112099003|56012099006|4143699003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: CkO5iYuw4n/EmD8B8q8ygCpCFHzVnZFICeBltLW/zLtn9ZP2UTsB9LxVEDeeYTstsJqT01Zr+KqTjA5AnELmoTC3EcNwe/rTtFEoBvvCexcuE1Orv2dlYKE5QlvoUkBx2P/e7YpyJut8CMeRDG4tEV8BGwjJMUMcpVN5uisq5ZRT/irf9mwW87+OoYMJdRZtdGVmMOK0+ac5/7FQ5aIfDgGvAK6ub4P4/5OrVpQOgxL6shq08Id9mEw6oRGBdH3atR3DBqt1FthUWmG/ViQctp/CL5IZRE5e4Io9nWvUw/WUuoX6oQKiWLYufiovVwSXUHse1S1WDUs9NYUIU8sOrY6v5MgzdPpR+PD9loUkumnZ9N49LzsrF/Ho50Ozgp+A2o5O66n1b9x/x8xKJmxSUcZBW4IWHiRIZVJ8VcQwY9HTSfENxedrxjzAq1371w26zgFMbNOSmzqxCMoBKI6+CoSkG5cj0VwF2TgjriA8oAuoMFCWFK3GsXhiAakLXMPrs1wkcJsnWe2cI/79sGMO5P7xcaYLg2egk79HhmfRAB1OPdbSvWIBlIsq5Q5gkx5BbEAO7UtJTpzdmJPQlcIybAs5O8UTeKlgAEVVblDKtYwofsYP75LBdLV+A/f5JS6Z8HKUJ3PdsGGz7rgeXW+pM+WpbF+2mPPwM9Aias7itpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR01MB5615.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(22082099003)(55112099003)(56012099006)(4143699003)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2FVFtt1xPG1iTtusYOsMHLnKTghWy3LHeHcMs99Ok+buCR51Q2zwuhlEMOCZ?=
 =?us-ascii?Q?UjMHtQ2FwC/IEBTtBefoXzI6kl/8tpqcQgeHBCfBuFzqEmrEqQiUF6cAgDW7?=
 =?us-ascii?Q?R3Jb4lqy4RmBvw7lYsvThQFPEOB+LEUFSNvyDl9RIAKmOrtYDVNjPaP4OuNr?=
 =?us-ascii?Q?3ymKI17Tq0CDylgMJMAG8tcyi4qH7kvE+0/NWFhoeHH6z91qfMCWKCy7lLXR?=
 =?us-ascii?Q?GLisqV8cd7A8BrsA/T9EGlmmtK1rgBSwe0UrQp935PKT7/cqPHZdq13ZdWoD?=
 =?us-ascii?Q?Var1zPyuHy9uJePxxmxaZacyXcXo1AYSP6tPlQ7arjqS4BLIl60+FSpxqnuz?=
 =?us-ascii?Q?6mn1LPoajzRFIvx1ur3Pq6kQbRpKzzgvGGofc1c9TtJj0kVetNwGnMlvJuOU?=
 =?us-ascii?Q?JJENjI37tkE8mGDwecpLTeZIRfAXpXdkDhxn5Ah0d0abrIYF8Uyx4BwOB1YF?=
 =?us-ascii?Q?wPwId7i80rRGRvh/X1DZwqlenqeuPlqNEeuxJcBWLAadPAqHTGvIm+27ixrK?=
 =?us-ascii?Q?dHD7nRGkQecNCIpRy4i+gG5HmD3auwzfFxEa2Q24mOWLk5PlusBVZls3B1Lt?=
 =?us-ascii?Q?1rjxlWFkp9SeYZygOpCcGa44sLhYE+Cqts6iDz8SdWEOIxwpHrizYYxxaLiZ?=
 =?us-ascii?Q?++/jOS9B32pKAa2azOHYSum0A36K2cf3W+1UztkYvYKC2g2O8+bGyKgQa7wo?=
 =?us-ascii?Q?XLL3h+CWADVQlzPc//8nEZ8ln6ETVHAqVY0VBddclqDI5nOMmO1qIQ/uE3Hf?=
 =?us-ascii?Q?c+hOb++FCmfApjwC67zjS23mZgIlwtNx4xQydIA32S8Ct3JC4PYddiDLw/bC?=
 =?us-ascii?Q?RVnQkikG/UUcwlaBrRzDJy4/k5V5kUzDq2kTjcpwCfY8NBFZQ1lR7lBNO+lg?=
 =?us-ascii?Q?iWUJvSJXwS93CidBrhBW5h8vz83QlsyfkU+odiQG3cm144NdmXVtaazobbV/?=
 =?us-ascii?Q?FrHnRtUKKHyEU4BQDz283oJpALrIzj0WwKSlkvzrLgdNvYu5FGhdYN/BQqrZ?=
 =?us-ascii?Q?VCt30pZRx4JcnApJ7DueKhWn+jpqFF9F2XW7RQ6PWdLv3Uuj1jBREoFPTtXq?=
 =?us-ascii?Q?wozCHvqWrc5inTeS1zfn0MGXcxohcswDztKTQpgQ23tfeMDC0nuyeZ/6kWJD?=
 =?us-ascii?Q?drQjPUJFjsLNxqDoLxFDzG18zTZXmuEnxEtAFM86Tj/5uECLY7aPLVZ5RyvG?=
 =?us-ascii?Q?lZxEp5YyxSZ8sr6PadBME3GevTv3TMRL8rtKX83dg0zcp+RE0gcF29vLuzmR?=
 =?us-ascii?Q?2hUpm0j5K7CV1CzZ22evOP4flG11LL/PnQn2zb+jz9zB4whaxnybtN38hn/O?=
 =?us-ascii?Q?iLs2r0s2wp2vsXt4cWodcK245W4+i7RSQoGauZpF1fHsaXMyo6NlWGBoXgct?=
 =?us-ascii?Q?QthpZ9LVEYQe+mRyrZ6UZV3hkF9vx0nPwIGEHRm0OsDKmZgwQRPY3ezgljAq?=
 =?us-ascii?Q?427hcXpwhSFhGc5iXmnLN5xrakczdRBfaZ2I+XQrKy9Id7TTRhyErRJNhpln?=
 =?us-ascii?Q?MG2i1inQBRIqWYblv+qqVDGOggiWkU1mswXHdRA6885BEKgtmuw2CacxoEMq?=
 =?us-ascii?Q?vGtVsJfcKJM7P765w9f1qTw5XXcuows/hze8BPuAWLUbueys4NjqFHFD0Mfe?=
 =?us-ascii?Q?L+woU7ZH84RHIi6ud88llupH+s3tcZMHIAiJlqAUl9mLobY+qui0iB2zhGx1?=
 =?us-ascii?Q?MDUsVSYNxqcZ4fUz9wo8JBzBtOZWYmC+w+Cur9w8s2juyLTzdO5oCGhw9Kgl?=
 =?us-ascii?Q?/nvEfXVKoj731tqwO6zQ0HuVn1fLyME=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cefdc82b-6ac0-45c2-96f0-08dee0a2179d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR01MB5615.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 05:46:33.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q29H4GAmBzEZqWd8Ojga3ZN22u0BbF4Jf7+txB8QRCuBDVjLsR265Py55UoXq7/h+N8wlxnhWfR6rBQHWRalWIY6yjzLhpMKWPV6RONxqcmjhVXU4F4U6ZtdJA1FzPEE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB994865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_224639_714306_2C7C1B54 
X-CRM114-Status: GOOD (  16.64  )
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


On Thu, 9 Jul 2026, Robin Murphy wrote:
> On 09/07/2026 3:39 pm, Robin Murphy wrote:
>> The APMT node format includes a unique identifier, so we can use this as
>> the platform device ID to give userspace stable and identifiable device
>> names, rather than auto numbering dependent on how the table is parsed.

That's a good idea.

>> 
>> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Cc: Hanjun Guo <guohanjun@huawei.com>
>> Cc: Sudeep Holla <sudeep.holla@kernel.org>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/acpi/arm64/apmt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/acpi/arm64/apmt.c b/drivers/acpi/arm64/apmt.c
>> index bb010f6164e5..ba48fcb26d52 100644
>> --- a/drivers/acpi/arm64/apmt.c
>> +++ b/drivers/acpi/arm64/apmt.c
>> @@ -79,7 +79,7 @@ static int __init apmt_add_platform_device(struct 
>> acpi_apmt_node *node,
>>   	int ret, count;
>>   	struct resource res[DEV_MAX_RESOURCE_COUNT];
>>   -	pdev = platform_device_alloc(DEV_NAME, PLATFORM_DEVID_AUTO);
>> +	pdev = platform_device_alloc(DEV_NAME, node->id);
>
> Per the Sashiko comment, while I really wouldn't expect it to be an issue in 
> practice, I guess we could explicitly check and truncate node->id to INT_MAX 
> (probably with some degree of warning) here just in case.

Yeah, it probably and hopefully won't happen but it makes sense to have a 
warning message regardless. With it

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Cheers, Ilkka

>
> Cheers,
> Robin.
>
>>   	if (!pdev)
>>   		return -ENOMEM;
>> 
>
>

