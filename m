Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FE4CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOkSrmlf0aOWsDYEHY5io0janLDt+V8WTrWiBQZVLTA=; b=NHSdKg0I7dPSu7KBJZgphuQH9L
	sDHwYn7qVRTsDlhd4H0c+/GJbN0JFsIvp17frXnYld9vXxbJJdAQuoD/H8CM/oJtbV4Wo3frCekGj
	VJye/vyThGJJXLtcU+EW+c99BdVZPZICSAwGdTGuoiNTO/e5mCwAxlLMN0rMXXTfZUtb/Ga/cqoD3
	97BM4K1Yj/OC7Wmik8D7v4IDIpkLBA8+HPZRfD7RB+kEZA3ikeg8PqyMAzI8oe5sgsJglYHylwFA5
	zK6I9WadxLlFbeb1h5GKBFAg4WZxJf0PC9tdYtN4e/JzA28eOPOuhG8tHYA7+l3a/jQmD9DGmeTdV
	IlwaBPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzC9-0000000AU13-1Rjy;
	Mon, 03 Nov 2025 18:22:21 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFzC7-0000000AU0J-0HHN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:22:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwRvKneVrny9FKsvOV+tU3SxHuY1xfigNzEPSpJ2SX1laRz5Ap7Da7uvjc5+sv0uicSJYteKTl6lCa68iYw6HMlkUtgjNEowzJMOJeu5NmfL/wAnYX6iHKrG3USEW57wzKFR5bpm0EkZ/lGmfjgJf2O/z9L4z9GTZqmlyxB5ID8uw3NOVxYJU0nJw5Op+MX3jjktgXS79s/kH3uzuul6m46L7ayQ5cQRxt+V06NBzGIMTgnw0ExRF/ig6lYQIV+9A8ZLuwxX+2I1IzIsGLnMMcuaeyBqWGXpSaELNFjcZQD3oQoHBA+MewNxfBMvTdaQpHmTzyuNgrU02wtQ2vfP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOkSrmlf0aOWsDYEHY5io0janLDt+V8WTrWiBQZVLTA=;
 b=baS2dsl5nXdj7cw0xYx8cecKDkcWIpnzG/H9QTjCwPkxM2x7uhiKNLjF0WGpRU6qQaSjR5852qHp2zYMIU4nbKtPCwB+xiOtQS3+BS03UYBHIxQzMml39XvJSHHRIY7ZQ0zM0RTFswC0Er+UTjpHsHKNBTTKGNBmHdipAIV3xKsBcQGRMUZB71zEpLQAnLR2yeAOQ2osVgNKSTdquMRUj18nRqnoHnNIcO2t5idyxoUK5QhddBlOvcuaHKvKDDn4fUoBsNGStZ6CTJcUgu8kutE8prYeF5mvDf0bP3T7ZirNH5J+vnS0nFwa2+u3i15j3FPXvvMw9t39lKxUwXjTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOkSrmlf0aOWsDYEHY5io0janLDt+V8WTrWiBQZVLTA=;
 b=FXC674GqrESbeFLzKmQakaDX84FYoCLh3jwLGPBwL8poJc+7hcquGtSwdrGJm6k/YfQG2r05mT/Z3zZ0Wk3zpExqSOTG1ncSmenI7zYaLt6DnfIvsMfZG6lCjJXU+ZGJHruxPMmDYV0ezuhDYcyDC7kWkUx+dY/sYNgpf4iynxs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV9PR01MB9399.prod.exchangelabs.com (2603:10b6:408:2ed::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Mon, 3 Nov 2025 18:22:15 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 18:22:15 +0000
Message-ID: <3fe7e501-b319-4b9b-b129-dce5e945bf9a@os.amperecomputing.com>
Date: Mon, 3 Nov 2025 10:22:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [Question] mprotect() can't clear PROT_MTE
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: LAK <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <04ea9978-e6aa-4498-b899-76d56e19b084@os.amperecomputing.com>
 <aQUEk6a_3OWapRbE@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aQUEk6a_3OWapRbE@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY3P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::8) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV9PR01MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: c58c8fc7-a697-41db-ddb1-08de1b05ea65
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1BVZS9Bc2pTM2E2UHhyNy8yL1c5SE5jQTFNQnRPdWxkS3lNWmdwZHlGZ3Z1?=
 =?utf-8?B?SDlIM1NlMncrTzdRM3E4OHJSWDE2RnN2Yno1dEdJejFGT2dKLzE0aFZraGh6?=
 =?utf-8?B?NFYxTXUxaFA0dytrRmNhckIzSjZybm54NUlEQkw5VXlZOFlYMXIrd2xTWFdz?=
 =?utf-8?B?SG15VVZjRFdwQWorL2I3R1Q4Wk9UaUxYRE5VT2lCL09zVWIzN2pUZzZ1L1dL?=
 =?utf-8?B?OU9temhYZWFEeW92YWFNSlpNQVV1bStxRWxFaE55SmRacXhPdEV5TFhVaFA2?=
 =?utf-8?B?cE1DMEQyNWNlNmJXWWxiU1diUW82cUtsMlVoQXdTcTFtb2ZhZDlFZTlSaFcw?=
 =?utf-8?B?OHpPWFRCdUluTkIvbWZwMXhXNDdGbXpKNDVGaVBXWTRMZkhMOXVjb0NIc0J5?=
 =?utf-8?B?QmdhbFNPRk1OWXc5WjRpRnNCbzhEQXRqRHhncU5YcjFhTlNWcEltYkpPTlNz?=
 =?utf-8?B?ZTNMZ2ZWZEpCOFJqU1Zkd3BTaWZxa2xoZ0Nia1RYUURNSTZ0Vm03NzJENTFt?=
 =?utf-8?B?RksrbHlBVTc3K0N5M1RPWDZqTTJYbDZSMnhxOExWRDNDOUNRRG85QUh4aTJP?=
 =?utf-8?B?dEpjUzR2K3FFVmFJQUZvTmlIRm9WZVhEdUhxcUFBb3dnSkd6RllKSTNPQzZ5?=
 =?utf-8?B?ZStmb0Z2VkE0NW8rZEI4UGNIOGNIMHJCMG04L0Noa2tDdCs4NEI1Qm1uR0tY?=
 =?utf-8?B?YmQxcDRxcVUzd3hDc282SEhERklmbWJwekFtb1VqY3FtMXptdUwzNnhCS0R0?=
 =?utf-8?B?TFZ0cWs3UklYbTQ0c1E1am1xalB1RndTVHd0SEo3Smd0bDZhRUZibE9sSmlH?=
 =?utf-8?B?amlLVDJsQVBUcS9OU0w5RTRjM05hek8zZm40b1NaZ1FjTS9VSlp4cXNoeFhK?=
 =?utf-8?B?c0NLaUt5R1BOS1ZBb2xaWE9BVVMrcTZNM3MxY2craXpKWXVKejMrNkZhWkE1?=
 =?utf-8?B?eTJUWjFleGRKeU9nVGUrbXBkbjZjOFhWcjg1SkdzdXcxK0lGeG45Z1BPYmRa?=
 =?utf-8?B?SzJLd1N2NFAvQWwxMy80ci9uandyMlpvcUFSc0pmcy9SV2Fwb1dnQ0d2RnFo?=
 =?utf-8?B?cE0zR2UrVlhzL3hGNktUSm5Pam1FdUlxNFdkdHdabmpoaFZjK0FYbllZSDdl?=
 =?utf-8?B?YTV5cHpFY1BmeEFUOVBiYnh6SktvQ2JIOUh2VHR6UVhrNmhsWTdBeEE4WWdy?=
 =?utf-8?B?c2tJMGpkU3pSTC8ySWoxamlTMnlSNTN0SWhmbWdRL0xXVk4xSDRlSURxaW4v?=
 =?utf-8?B?aFBNVFV6OVpZSDAyZm04SUlhY2lMb1ZwL283dUhkUDdFN3h5bkZxYUdlZ3Jw?=
 =?utf-8?B?YXRydzRMSVVkM1lqRFFER0lwcTN5WjM4Wm5mbEhEVld2dUFaZVNPWXJQaDZo?=
 =?utf-8?B?OXM3Q0lUVnBiQ3FOMXlLU1RUM3pXdUJvS0dVRk9TbGdOSlJpUUZLTDdjais1?=
 =?utf-8?B?cnBJNW1hemxkTkpxOWsvRy8zaUYyN1VUK2xhcG1KOFRUY1JsN3Y1Y2w0bjYv?=
 =?utf-8?B?MVJQMFFSS0EySmxuR2tKVWsrQm1ad3pPTS9CSkFHNEg4d1E3MWtlMXI5M0lo?=
 =?utf-8?B?c0pzMm9IWndzV3gvaTdNVElOTWIxY1ZNa01oQVkyeHpaUC96NW5ZV2ZNc2xm?=
 =?utf-8?B?M1lBYWxuZFUwOTdkYW13WURKTVIwM25jOEVzcElseHlOdVpUSEJXVGpPWXcz?=
 =?utf-8?B?dmpOeHFsZFZUTllMdGpVcE9Od0w3TnN3RzZSc0lzWjV2TzAraXMyZU1FSjFt?=
 =?utf-8?B?T3hoWkl5QmVBK2htckJUVEVYY0ZyWUZ6U2x6VUpIQWRydWwxR1Zlb1Z1dDdO?=
 =?utf-8?B?OGJ2TkhaQWJLWlJNRWhmbTZjbm5CUW1BR29yVHpTOUl2a3Irekp1enNHeU96?=
 =?utf-8?B?eUdxUUd1TW1sR2d2emh6QzFtZngvTDdhNit3K0lNM0RaRXViMjdob0JTeHBL?=
 =?utf-8?Q?9QC/kBURGTb0NiRJK9qBov+LMWzlYAGM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpqNUVrNkhZV3pwQzU1Rjc1WnltTVk3RW5xREF3KytRQmNjN0ZvREkzRVp1?=
 =?utf-8?B?Q1V5bGlrWktPRjVkb3k4M1lYYkh2cjU5bFdwSkJSRE5oRnRFMCtHeGhTR2hu?=
 =?utf-8?B?RTZtdTBZK3RVVlYyTlkvQnUwWU5LYlN1MVVWeXNGdTk0aFJTcUJWRisxNHZv?=
 =?utf-8?B?QWFDVWFOZjB5eG0rSU9pWVBucjExYVdveG1ONHNxbkw0eE1ENk9qeVlpbjlz?=
 =?utf-8?B?Nk54YVMrdzA2ZzhwbGphRXlCaTAxV3RhMDFpRG9kcEJKanhJaW9vdjJGN0F1?=
 =?utf-8?B?K1lWNG56OFFja1hZL2dCWmgrbDVLS2lHVHg5Ny82UVNROHNkWjdvRnk2NVU0?=
 =?utf-8?B?SVNZNzBpUGNleEh5UUkydEdNaEpWSVozUjdrYWM1NysxeFJqaVFjcnEvV3k1?=
 =?utf-8?B?ZEI1ems2RWxuQ1FZT1BiTmcxVGFuMDVBaitXbGt5Y09XVVFnZnp3c3Q1d2tn?=
 =?utf-8?B?RVFjQjRqVW5GR1QwZUN4bXU2ekUzU2lBWkszY3ZzOUxVQVFnb24rR1NCeXVX?=
 =?utf-8?B?VnlCc05XaVRnem9zRmFucCtxZWxmd2hSRXkzMytKY2ZtVUFjK1ljVkdNYzMy?=
 =?utf-8?B?aXhjTGRFOSt2cE9PUmhaVXordngyK2hJTTJGSHBKUCtZb04yOEdnY1JPcXFt?=
 =?utf-8?B?bUlzalp1UG5BczExbkNuS0hNcDRKMWFDN2JZc1NFRU1ubmgwRTRrM1FGdnVQ?=
 =?utf-8?B?bWxJdDJTSGF6Z1pHRWVlRlVRQlkwd21CcFdoZG1mNnNQdkNQTTZmdTJRS2Jn?=
 =?utf-8?B?RnFXdkZEcmlDMkVWTHNxVG1PMUQyTGM4QWhwenU3NnBubXJ0Z3VwZ1BIdzFG?=
 =?utf-8?B?ZG8vZXAzSkhUNUVBZngvWVJab3lWRG5JU3duTkFKNit1N2xnaGNnU1JFRXdF?=
 =?utf-8?B?VFo0ZWZOa3lPcEFHMWlXZVZ3WktqbFdDd2RmR3BZZ3JNOW94Tm11WHRqYjVO?=
 =?utf-8?B?NWF5M2l2eGx0bzRvSlBONGxaZ1drK05lYk9tWlR2WDNtNzBJdHQraDBFWnN3?=
 =?utf-8?B?K2F6Z3VhRmFGdU9zdGU2ZEFES1Z0K2pqazNVRSt3VEtXcXd1cXFDUGRBeVAx?=
 =?utf-8?B?YUlPdm9pUjZtSmkwa1dWaHBtQXFXM3d4QTNBNzJsK1ZVM1I0T2UxQko1ejRj?=
 =?utf-8?B?TjZETjMzemVDck9adjJZM3l2LzBGTXhlVnpMeXZMa3l5RXUwcktzWEJWTnhD?=
 =?utf-8?B?c3hYRHFOQnpDZk03QXJEL1AxMmpMTU8rcjJWOXVJd0ZHM2lLN1laRG5iUmdJ?=
 =?utf-8?B?S2tiQm9NVS9ZYUdYSEs2eUliVmpHNEg3emhWUTlyVUFITlR5OHpqVElaa3RQ?=
 =?utf-8?B?UUdQU2crdm45cmZBTDVKN2YzMEZiWUdFamt6aFV3am9OSWpaZng3QlFCODVl?=
 =?utf-8?B?UW1telJkMzJ4SFA4RmdmamEwbkVtMlJDSzl1bUNXa281bkhiU1RMOU1mejJy?=
 =?utf-8?B?WmdVbUdxVEZ6amF0NGdUUW1PaEhpaDdYRWordTNCV2U3cGR4TUlFRUsrRjRj?=
 =?utf-8?B?SEpiZElzNDRqQXd1aVp3UUhnZ05tL3hkajdTa1ArVEtuSlpOQTRWc1JRUTdU?=
 =?utf-8?B?ajJLREdmWnpsUEk2WkFQVFhRb2VqRDdlQ2ZwTk55L3RIZENOZTJQSEtIbXhM?=
 =?utf-8?B?YTEyUTFtTURCa0xSbW1MQ3h2TGxZZWpCTzQ2dEpVcjEyMHJSckpNUEFMTmJZ?=
 =?utf-8?B?Z09wV08rdmxuQWE2cTNMakhORnVNUElqUGxscHZnc1ZicnFEY3pWZDBFWVRz?=
 =?utf-8?B?NHJSYmwydk9IOS9TbkcrNkVMMzdhdVJlVGxYWjRvdGE5ZDgxTFlUQUU1VFZn?=
 =?utf-8?B?NWlZMHNLSGdEbWVwRjlTOW5nTXE3eXNCUVRZck9ETjRodTJxRnlIUE0rU2JD?=
 =?utf-8?B?Z25BU1lzeFhQMnNNYVRqdzIycGxMYnE5ZTFWcTBBQ1ZLaEIxUVFnWTRpdmpk?=
 =?utf-8?B?RXJTeWtoSEhoSHdrSWNrRUphNGxNN2lFRW5XN0p4alBKNUtmblYrellvMERk?=
 =?utf-8?B?NzRqRXBVYVdaWWJnbGFqQ1d3WTFVQTlvMkM3RXFobXhaRGVmQWZlK2tzVFhT?=
 =?utf-8?B?WEt4eHNZdmVtazg0SHcyd1k5VG14MkFBWHFVVXgzNmJPWHpmb3pHS0JabGpo?=
 =?utf-8?B?QWhFSWRtOFBIMGV5OGoyOERVYnVYdFZJbUJBZUplajJUTUVZTm0rdmpqb092?=
 =?utf-8?Q?Pbk41V4XavTcomwZCjpb3js=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58c8fc7-a697-41db-ddb1-08de1b05ea65
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 18:22:15.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2SJ4myyouWc4pTuSK7pMn4dXMywePRAeXnyGuWCNDx/EPXsZ4A4Z+gRKjFsYNVM0V00T4raB+B0DhzNdNYEXY8CXVFrQaekOT2E7PZ4k+lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR01MB9399
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_102219_114951_625E6820 
X-CRM114-Status: GOOD (  20.65  )
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



On 10/31/25 11:48 AM, Catalin Marinas wrote:
> Hi Yang,
>
> On Wed, Oct 29, 2025 at 03:41:17PM -0700, Yang Shi wrote:
>> Our customers have usecase to untag memory w/o unmapping it, but mprotect
>> can't do it. It seems like an intended behavior because I saw MTE doc
>> explicitly says PROT_MTE flags can't be cleared by mprotect().
>> But I don't see why mprotect() can't do it if I don't miss anything. So I'd
>> like to know why it behaves in this way.
> It would be interesting to know more about the use-case. At the time,
> clearing PROT_MTE got in the way. The theory was that an allocator
> controls the tags and the PROT_MTE property but if that range is used by
> something like a JIT, toggling between PROT_WRITE and PROT_EXEC would
> inadvertently clear PROT_MTE. I'm not sure whether this would happen in
> practice though but it's ABI already, so we can't change it.

I'm not quite sure about their usecase yet.

Yeah, understand. It has been an established behavior.

>
> I'm happy to add support for this if there's a concrete use-case but it
> will need to be gated by a prctl() flag to keep the current ABI. A
> weirder approach would be to add a PROT_MTE_CLEAR flag (I think I prefer
> the prctl).

I agree we should not change the current ABI, some applications may 
already rely on it. prctl sounds fine to me. Anyway we can discuss more 
about how to implement it once we have more solid usecase.

Thanks for educating me about the context.

Yang

>


