Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567A9E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 22:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3oDZ2m1euIcBDzKIxLfzy1OawEkIeEt94Z00ZcYSUk=; b=pPcXHI8XLc3Nh3R6hEek21X3k1
	PaDqNJvIWLEiIMEAihIf68cN2HZxYLxUlsKFke64gTmGQcvk5caX6J6/lKaPp/0o73nsej46zgicV
	0WvO4tE6d+DPvlX553hIX5ayaQ3rgemaEn9eY1JyxrGl9bFMENiX1gOmG61faJo6GlRSGewuJiNuf
	1wo/DZeiSvHFlLjN45w2zXsC0HAe8uis8lg/y56JE5x6l7+VhYRh5nfs49cCb3uBoHZX3iUn28VS/
	eekqAKnpKl7NPyO0H4yzPVZQOYUpX9RteL8+FMmUd1O9+hT0XHrIoP4vZ4Pm6ve602+8k1N7QGzBc
	ubvQjNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrnc-000000026wT-2W4h;
	Thu, 12 Dec 2024 22:36:48 +0000
Received: from mail-westus2azlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c002::] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLrmX-000000026r7-23uk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 22:35:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hLfYstjmhOo8dSVEwa7YPtUzlGWbw0qEhWC6GFCcsryz3QOW/7BWz8+vlvYuni72NUD6VfWnzJ/uCRmEdu69f26axefZbbMdww6s4w0M8M7APHziKtkgh6E7q/zCN4Rr0dfWmvE8cdvYJ9Kn1GXlHzjSw/IrjCBvwxKqAJ8bw7wTyJ8seJlhxwiwMv396zZ4dVOU+EF5vVsg27mKjm2hlmIiT71QOhcG/hvrEF5JvFIEoU6Yx+INnpH5EJeCyK7sFaKV8aFu+ZzVreWR+FI9JXVWD6IF79ZuFtnLerH7hOwvMuqTvzNSgyB4pHsfx12exoC+dZ0to8KSpPeQpuvQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3oDZ2m1euIcBDzKIxLfzy1OawEkIeEt94Z00ZcYSUk=;
 b=xYDqfxZeMaoPlCUE34T/vREWPSt82GAnXU4g71G+7j44dO/5z6/3Ey+lddOG8QfIhpuyt7hCkLeCTu+adymIahHbQBvMgzizgGxq+jVCRQBgv6GZoHqa/eWC4ExCUyCJ3tt9RtQTtTHXeF7Y4CDPlMWN0pKhXtcxx2XlqVviAZsrpj9aHAVkQ0SH1lhME6+zhpYyQafq9c1wFHug1goffcR1fuSR7CMQ6S4NBItbvaNW4/2hwRDw1EZGWBkH0ZKphTvqsKp1sKVF8dB64a70seCc7WSF4WEpvDxJiL3oHAyNiYdjMB7CHATbj4iIrCxildTtVjUcstkjrUHMLw2cYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3oDZ2m1euIcBDzKIxLfzy1OawEkIeEt94Z00ZcYSUk=;
 b=tWClYCAXASVaQUdXrOj38RtwD4pb64iuT89vtYk4Gjz4jO0uqRzf60EE1Nf580avFl4KYNuHKcEu8jeG6LZIInxadijsFSGJmxUzK3IahyQJEOq46Vd9ugKg8QRlhSxzYvsE67GQC+4CPz5kQZePQOPClpB9kkUQ7ldxZM1CqkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 PH0PR01MB6181.prod.exchangelabs.com (2603:10b6:510:8::7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.5; Thu, 12 Dec 2024 22:35:26 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::13ba:df5b:8558:8bba%3]) with mapi id 15.20.8272.005; Thu, 12 Dec 2024
 22:35:24 +0000
Date: Thu, 12 Dec 2024 14:35:17 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Will Deacon <will@kernel.org>
cc: Robin Murphy <robin.murphy@arm.com>, ilkka@os.amperecomputing.com, 
    mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm-cmn: Permit more exhaustive groups
In-Reply-To: <20241211215139.GE17486@willie-the-truck>
Message-ID: <e5216abc-584f-a047-ca55-735e8d93999d@os.amperecomputing.com>
References: <bdfd1e58dac449e407c5cacfd6bf8577dc0a5899.1733943898.git.robin.murphy@arm.com> <20241211215139.GE17486@willie-the-truck>
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-ClientProxiedBy: CH2PR11CA0003.namprd11.prod.outlook.com
 (2603:10b6:610:54::13) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|PH0PR01MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: 02bf57e0-0e39-4044-4614-08dd1afd44ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h1YYjExLOw4+FswRkbWqEsNnhev6bOew6s9npmTxxWZIimmMiO/MB1JhfZbz?=
 =?us-ascii?Q?zaZ+ApTlC1SC+vh/Wj4SFgcLag/ULu3ez6ZI2uRUKitr/3CHTca+I/gl+ao3?=
 =?us-ascii?Q?rbsAXsMlhTHCt44LayqLyxVoWW8ol/X9GDqw2b8K87SoDUYqQxD6eQsyUY62?=
 =?us-ascii?Q?0+EgkgGnq+Um+pAeEcPybkk8X+69TIPpcZVxNxSjYUnOgQEXh03p+5vKbDFI?=
 =?us-ascii?Q?yYaU2vQNPVrVZmgY7/+kzDfyrH4Xa4nRr49GXouYRDPsWMrYV+lDI0BmCKlm?=
 =?us-ascii?Q?vSyuV9Nw5E/tdtemyHo3VQHLT3Zht4fquliVrGT/x1VnU/q5YaXhjUQbZWED?=
 =?us-ascii?Q?sB+TBYzu7jsynX0nnGnJKfWfWrwrg2ZEexDeCJdnC/94u5WQxl/MXfkMf4OE?=
 =?us-ascii?Q?kPB1PUkwbI3NsqErMGFp6qxGjp9GgHvtXHamO614mchaD4d/b4jjNG6yKutw?=
 =?us-ascii?Q?0nu6pKp2rtTd5HFq7vG6VV74zkJeFSIetZV7Tn5hQHyVM/KgMY4UGFu0SNLo?=
 =?us-ascii?Q?hbRWZq+1EMOc5KWp70GyMF5DPFv6H+5zV3vlV91g4PTnntW+scpXAeojC4vD?=
 =?us-ascii?Q?kWpVkYwd3752InUcD2PthdrD9lULPEna5Tt73OWf+Deer/FpiX9obNW7ljEX?=
 =?us-ascii?Q?152dYQwE9osnqE/MvLXKiivcEtCDMeGXGrOveDUopvg/xJg1CW/GL4Xgl3sn?=
 =?us-ascii?Q?tr+StRhlh7i+KHVsiStXRCwpV5J0lsPplmFsrwN7ZBdQ1UJeBfomnDYYLrpL?=
 =?us-ascii?Q?73pY5jqOI4G11sDDxMh7G5jRnOlXLbvrZA5fltxXCKmVb1jQYQ3MGXiaBiGL?=
 =?us-ascii?Q?kgKGL8lBVN/dX/QFmP+O1dK23egvjks6UWiYm6LvOlNYMIj73agC82phO4eX?=
 =?us-ascii?Q?KSWU5C1/vtiIbMLYZ8vncFG3W9eelMmX5DD8l815aflzTO/sAO1245O+x33d?=
 =?us-ascii?Q?7VGEdYUpLuD99CvtbSsKwvaQfqetTzuKFsU5Eakl5XmKGM9WOHDVeBVJ8ueA?=
 =?us-ascii?Q?N9LSyS/8lJZiLODKIC8k+igH958sBk8fhFkbeIBNn7Q6OokrKnCu83EzAaFA?=
 =?us-ascii?Q?doKcLT57gSND8cX73WYyIrMXyJ1dT6JZ1XPlG/VfUXnnaGL96nqA/aaRkDOA?=
 =?us-ascii?Q?NvIVH/R2r3MHBKlDpng9/l8ZK6o2sQ8NHXfjy6Vop2Ht1XclGj2XfDT0qXb/?=
 =?us-ascii?Q?lE6tANmwueuQ4Ub8IZxuCyiY+Xg5642FUSyws92plDNpJ/dx1Xm4fL/5g8kQ?=
 =?us-ascii?Q?F2QYcOLTW8kMQjYEhFBe4phZACy67piGMX1hzOjeRkDIgGus7LrymkK4BjcA?=
 =?us-ascii?Q?jZ93H+Y65xxBtflmNemcL1CB3t7nFkesRz5SxJ9E5iC1ov4D2eNRQl/HZ3BU?=
 =?us-ascii?Q?fjoKaAQLEtMYcm3fkWA7sDDdrZycK5vhuc89TJUlNz8dPCBRsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?17LkaX2eoYt+xhj6Xo0LmlT0Jst0sedFAmxYtguntvNhZcxp8uA8ahYObCaI?=
 =?us-ascii?Q?0NIHtfbvaBb8RtMB6GhZixVfuohzcqOJeI4vp5L/uPl0JOLvBxJptraJYpkQ?=
 =?us-ascii?Q?21DKeG9VkohcesdNxbb6sQbDdBQE/Afp+xmmTU6PXLGfT0K+yC5eaaDM6oBu?=
 =?us-ascii?Q?i2Iixj/EjLDRloSqe0S5Z0gf74Fj+3u0VZQoZWnq1o0QFILrKLEc+ZMstRjy?=
 =?us-ascii?Q?rS5E45w7UXlZoJnlASG2GOhkCfwPjZDrHJ6yWeOX9sk+7tYByB6vJOINJ6/6?=
 =?us-ascii?Q?BSgTTrVV72U0v5LFJTH5Ezpyd9Dc/YReg0gy5aUyA9MloHt0cWPsAMH7l7mg?=
 =?us-ascii?Q?BskgzFzgcaLoEfJZ5gnr+SQRrEuuam3WidZNHvkV3dWUwRH/AL5mK1m9HAus?=
 =?us-ascii?Q?E06HeuN+lmjtL2C58SJ08sjLiAfP2X10vbcXaZaDo8pbh1zvZhjQLMs87+EQ?=
 =?us-ascii?Q?s0OkK+spwTxq8PGAhE7fYCWJmv6m6WzRFNv84SyQ2v8TOUT9rU1eL+3YLCkc?=
 =?us-ascii?Q?9JmSoG8v0oH99oGpNXaRL6Bijx8u2G2XtglMJ9CNFNcKBJT/TTIfQT90mBkl?=
 =?us-ascii?Q?jIHF7Dlsdfh2NsFIZioXjYmQ1zrqxcL3KquWkuJCtWi+2ZgKc61ykgrRqzf9?=
 =?us-ascii?Q?zeFgHic7P2d2ZAYeGnB9mChWrWRNPtYHoRLC5Q3aGjEL+q+pmQoujAnwWUgP?=
 =?us-ascii?Q?QWYtnVMG+6eyExnXCs5g0SpNAZqj+mxkL2cE98FWTBNeXvPTjzBjqo9kon47?=
 =?us-ascii?Q?bECSmZYyL/MYIV1/IklG45LooS/fzPbD3Q7q/tbj5T9gvdimTERu0iEaRGGc?=
 =?us-ascii?Q?xuZulwWHeDzWyzBC89FaHWhRJXuwtJC+mGibVP56c2vJlgHeiUD7R8r18yC9?=
 =?us-ascii?Q?YM8kaYuCH4zTPT8tiQDJ9YNIbaBTD2oAS9xhOKfZseuCzLbmX6XiUjrDDz1w?=
 =?us-ascii?Q?AUdi2c1Q8IeyOmS4pF+zt7hZzV+08dUvgVGK7Krxm5qCTlB/5r8ZPG1xnMe3?=
 =?us-ascii?Q?BlPcONUJaRoAY0I0EGemuoclvUEq0NKMuTpfycwnyEjHfJDM2pRlL5hy5+lj?=
 =?us-ascii?Q?Y9+7I+I+oI+n5sBeIUzlt8iQI7sEnCJmd6Z8US1iSesWO3+Jp4+Bi4oodllQ?=
 =?us-ascii?Q?YiblV+2ixr6Lni395xfYYDXoGCKPeiPIbyS/equ/btKijzjeMbNJMkVNVWBf?=
 =?us-ascii?Q?MMWjTal4dUjexrGVdTyEBrzn7I7qUZMmXE/8zn1dg/SzdecdlSLtj77IZjZA?=
 =?us-ascii?Q?l4v0GxbGojmsLyO0qmAK/k62Xt7ltp1Ss3ZImViZRmK0vntbxrHkbU9VITDg?=
 =?us-ascii?Q?m82u/y12B/RAHzckz5GEi1V3W7lo/+hHb0JGYxe73LVHU1rrDczgB1l62jGt?=
 =?us-ascii?Q?cBDCa1ZYciIAU7Mnms+P2rptEJofMkd3HxqwsBdIZdd8aUaim9vhdKFB9gaT?=
 =?us-ascii?Q?tWcmTyfvG/V4bBxR6phuD4yDOVFYqLPg5YoQ83gXL1x/Qype6CBl6M5EoSBM?=
 =?us-ascii?Q?UrhlJfe9giG5fQ5CreFMVbLCM9coYL4dBUfp6hAQs3vGvA/LZDUB3daRuHPC?=
 =?us-ascii?Q?HvKKAIdGnywf6n1JgHYqBGwCR50KWhDAyZI9fKdNB0t+o5fcPoXnrtWr+Yum?=
 =?us-ascii?Q?L8XVigNgfOlXQqDFbXW92kA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02bf57e0-0e39-4044-4614-08dd1afd44ce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 22:35:24.2654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bd1pKHxNyJUe9e3vQktdnhYv4ysh5HQkKmoUixCzxs3g7A3wZEXjG7vJmywFdkSrbMgK1vOiB15IAnvTue8ENcM6a8Ff8yBHP95BHdPlzH/9oZQ4of2xBvWbERycZiGx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_143541_543123_733FF3FD 
X-CRM114-Status: GOOD (  15.56  )
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


On Wed, 11 Dec 2024, Will Deacon wrote:
>
> [+ Ilkka for comments/testing]
>
> On Wed, Dec 11, 2024 at 07:04:58PM +0000, Robin Murphy wrote:
>> The group validation logic still somewhat assumes the original CMN-600
>> case of events counting globally, such that if one tries to group 9
>> events where the first 8 target a single DTC domain, the 9th will be
>> rejected because *a* DTC domain is full, even though it might only
>> target other non-overlapping domains and thus still be schedulable.
>> Improve matters by only counting the DTCs that the new event actually
>> needs (as arm_cmn_val_add_event() was already clever enough to do).
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Good catch, I must have missed that one. I did some quick tests on 
AmpereOne and everything seemed to work fine.

   Reviewed-and-tested-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>


FYI, I'll take the rest of the year off and will be back online in the 
beginning of January.

Cheers, Ilkka

>> ---
>>  drivers/perf/arm-cmn.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
>> index edefb51ac90a..b49e353e10ab 100644
>> --- a/drivers/perf/arm-cmn.c
>> +++ b/drivers/perf/arm-cmn.c
>> @@ -1779,8 +1779,8 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
>>  		goto done;
>>  	}
>>
>> -	for (i = 0; i < CMN_MAX_DTCS; i++)
>> -		if (val->dtc_count[i] == CMN_DT_NUM_COUNTERS)
>> +	for_each_hw_dtc_idx(hw, dtc, idx)
>> +		if (val->dtc_count[dtc] == CMN_DT_NUM_COUNTERS)
>>  			goto done;
>>
>>  	for_each_hw_dn(hw, dn, i) {
>> --
>> 2.39.2.101.g768bb238c484.dirty
>>
>

