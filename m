Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868D6C2A09A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:CC:To:From:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/89jwACi1TKpA05n/HrFMyAa3LWf2vlTO//D9DFKrY=; b=3TYuzn3x3TWgEW3oTpAe2ZWfWV
	7KccTf2XycEWF2t7yAX4BdkpUEbIf3ZQeiNLv/LIdA60BrqyBLg6jXHH85zZBh/HN2wUuNVL+jatj
	c2SpdjEscOWSPl55BBLtGURUJlNcsldKYus+wAZ/OnWd1UMwuSEEUY/4PAalFT5te8y3xU9OuqcpV
	mJoy53s6Y/x4A6Xjb3RNnSgt8lgtsugdYgmKeJiJUW4uwLwxTHYhlMj9wRlXv4y6Kz6qOyygOdP5i
	28whzV5j0yST0OoNiVPzIQbBGWIMV64k4GpdjtIv9sEm9s1Jq/gCyVmnSRH3dRlRA9vpNwX8wZuCZ
	S5UXCxuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcij9-0000000BBA9-2vRA;
	Mon, 05 Jan 2026 11:26:23 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcij7-0000000BB9b-2ObR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 11:26:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFfls8nvHwrvOHVJNJMXsnRwXhCc1CodR6mVyZZ5QFGR2yBsxZYJtALxznXlf8UU+alaGtYyAWvano/5ztaYmOCpnAO4j1+aHDwgEK4js4Gyx3NzXmvXV/U2NJY39QxjsTRYB7GfNLlNk3TejjxzNosWzSIAV/VCwLKTGwQ7N4fYH2FvtXW0P8unDFS0KqoI4n91R3OQkTvSK0OWyD+M/WlTtb9X/McUksTYzmhJxVaTwCEgrRWGkeWRxSGMo0m++R5M2lV8p2JadY7OdZ2ok+c4oVjoHHwFaPD2tADnql418x/GAYa2lHSSNT2AvdsqA+Q7dtbrwKEjb9EnvBTonA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/89jwACi1TKpA05n/HrFMyAa3LWf2vlTO//D9DFKrY=;
 b=ac0uXT8evpPje2wpda0ryVw3JWi3KWqzJ+SRm1zZS8dJUC+upCVGZV2C5Bk9T/YPuuk0w8vr/08oqyDcfq2N8nep2tewjOzJT4Tgnc5vipfCHtTWUlXszqqu6l0KdyfFMibqU+upi6piPhC3+U83ZM7Dox+Oh5q23Lsck+E9niDM6F08234cFP66kTf+PrPKfkBWeDzbYbQRcMbti26c0CNdECZeZf69F0nMMo3PgSi/YNJvT8JzOtXkuBKMtGgsjq3r9O/SJX3k+aPAo1Gjyzt710uboUPXNDR6Qbh1r++fXkCxbl7YnLl12Cge/Jjj9x/M4Z93kWj3OOaVfbV22Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T/89jwACi1TKpA05n/HrFMyAa3LWf2vlTO//D9DFKrY=;
 b=o9sFHbegcHZ6wc7IAbPJYRlmLES3uq7Iy2RT9q5loHRkA3QJ6oEzLnfP7XUoqeVPyO5yF6jGiPrE9poiV1mMI5Baw0WQjZ15RMZdH38XfQeCd27zXjmj9Tk8lFUfEgg5ynQZHcuyO/pGXWxOcIsj+UsUK0LIV3odc+zJ9amjOYM=
Received: from CH5P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::8)
 by CY5PR10MB6093.namprd10.prod.outlook.com (2603:10b6:930:3a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:26:15 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::8e) by CH5P220CA0017.outlook.office365.com
 (2603:10b6:610:1ef::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 11:26:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 11:26:13 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 05:26:11 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 05:26:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 05:26:11 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605BQAiY1191156;
	Mon, 5 Jan 2026 05:26:11 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 5 Jan 2026 16:56:10 +0530
Message-ID: <DFGMAGLHN1X7.2Y4CBP7MJZD6D@ti.com>
From: Anshul Dalal <anshuld@ti.com>
To: Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Anshul Dalal <anshuld@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v6] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com>
 <1844147d-543d-4739-a1ec-a59f8a4564fb@kernel.org>
 <DF5GPF5U7NPA.2ODE22YOF8E1R@ti.com>
 <e516b73b-2dc3-4ae4-966b-278a946491c8@kernel.org>
 <20251229174638.btuhliymlmuy5op3@submarine>
In-Reply-To: <20251229174638.btuhliymlmuy5op3@submarine>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|CY5PR10MB6093:EE_
X-MS-Office365-Filtering-Correlation-Id: 932b69f3-636f-4519-e1b1-08de4c4d3c44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b09OanpsZlZBS01hNmoxNU1Oem9raWFzcVFpSE5LTXVnRnV6MktiQ0hGTmNI?=
 =?utf-8?B?a0NkN3VDQ3Izd1MvVjVWV2dJRjNmZnpNbVdVMkRoYjF1WitrQWNNWjBGb3lI?=
 =?utf-8?B?ZnpNQlVadWdrek9odWw0dUVhQ05DN2RjZ2lzL2hxSFZSVXljcUx3NFJFUGN3?=
 =?utf-8?B?azJVK1BCdXpjV0plT0p0eHFTWk9mczZqZWloTHJnSStDTUhPQXJyMXVMejZG?=
 =?utf-8?B?d28waTErVWVJcjlibmdsdE5Ncjk3SlgyVytuNWp6S2JsUDkwamxzRG5oZFZZ?=
 =?utf-8?B?dXZHdjRaL29WWkpJTTdyTUNXTEZmQlFBYmpHK2NwU2ZjbUtCYWhRY3N4ckpJ?=
 =?utf-8?B?Ryt5WHMxaXFiMS9XNFZmT3pyNFBGTjJjNmhVdDVVWnZ2MURIQUV4YXNRbEdo?=
 =?utf-8?B?SGw3YW1jb0g3c0ZucExlM05QYTFnTmJESUF2K2ZtY3BxQVFtQnltcnJENDlL?=
 =?utf-8?B?S2tMcG96WUE1OHV6N20yVlhsUU8wN005eXFVV3kvZ1RwOVI0a3dKdnFwL1pp?=
 =?utf-8?B?WWQ5dHI2bFEwV21Nd29aWHJWdCttZXp4R2lxNkZsRVJpZVQ0V0tmYjg4QUZt?=
 =?utf-8?B?SDhhR212N0NGaVNaWVl6Qnp6RHNmc1lQREczdG1JWTBXR1NhbW1IMldyMGp0?=
 =?utf-8?B?enROY2VRWi9QbEcvUUYrcC9hNVEvQmNVVEhyVUpDU3c4WkdNaUJ5b21mbFox?=
 =?utf-8?B?Z3I4bGFhZmxPSEhLeDNnWUZQRUlXUHpmSm42U1ZxbWdMQ0xRZlJsNGV0dEh1?=
 =?utf-8?B?QmlsQkYzQk5lOXBPa20wSlRaYjUzYUwvMGI1WXZ3WEJrVlFMWHFMRjY1YURH?=
 =?utf-8?B?K3psNmt0bS9pMTlTREw2MDA5VWk2Y3BucE5iUUk4MytNdjhXVVg5Y0E3MGk5?=
 =?utf-8?B?ZGo3VGxqNlkxZDU0SHZsRWRyTUU3ZEhYWU5rRmdWWlYxU3VnNXhKV3ZrWXpF?=
 =?utf-8?B?UVZFRDBGR25pZnpydnFMYTI1ejRiTVEwb2tDSTBheTlyL09ydzFHRXQrQnpD?=
 =?utf-8?B?MjR5SWRNazMwUVltck15d3g1M1Z3YUM5U1VTbVNYMHFVUDR5MklVSUIrTDQ0?=
 =?utf-8?B?Tk00TURVUDVEYlIwWks5eEpTQ0pPNU45cUFZZmtVL0h2dm9LdSs1MHova3o3?=
 =?utf-8?B?NExvVDRCamwxZWZraTRFVElkelBzMGgveEdJNWdDaDFFekVmQWNQL0xLUkZk?=
 =?utf-8?B?dEJFZjdETm0rbkpIZWpxV2lKSHQ4YjJYZEtZSS9MM0tzdjFsYXNQNkpocGhj?=
 =?utf-8?B?L2FwTlpLam5EbDRiako1aDVYb1BOUTNQNnUwc1RNY3JSQklOcDVHMlRJMVZi?=
 =?utf-8?B?NnFjTVBhMTNWSWJoVzZUL3BzQWtSb2ZkYWNxaFMyNjA0R1NkZ0RHNmZmN2l5?=
 =?utf-8?B?T3JOWHJwR0N4VnBmSWZTRlBWWTAwbVg1cVNLRHZYdnl2T0ZsK05qanV0ZHU3?=
 =?utf-8?B?RGlPbHJHd1BHeEcrSVJnbWxHMjdtcGRJenlsa3lQV0RoRnlRYUZmNmVYWnZw?=
 =?utf-8?B?UlphTGpMQnJjaFdzcThxRVdTRjZjVCtHdnVnU1MyMHVUZUNZeHhGUVphQWtl?=
 =?utf-8?B?RERHT3FYL2dwL3pYdWZkQk5sRXo2TGZkN0R1UTFTVGJmY3VWZ3ZKZE5jZzNV?=
 =?utf-8?B?Y3UyZ1YwNnFRT0c0SjREMitBNDlOVDVvRDIvT0Z3NW43eGhpUU5jOUFEVWRq?=
 =?utf-8?B?djlwaGpPSmN0VUo3d2o1WUZQeTBCYWJWRXh4UE04alFlZHg5cDhZQmpzSXMw?=
 =?utf-8?B?Y2ttcUYzMTlXNE9QRjVwMzZIYlZUQmI0a0VHZzlEbDBOeURCQm5XRXNJSms1?=
 =?utf-8?B?ZU1ubmpOYTlWYkdVSjZJWngrN0lEVFdmWjNFVExZdVBCelhXLzhUN3JyZVVk?=
 =?utf-8?B?MFJ1d0lkNFBGMXN1aU5sOXNWT2N5YVo0Tlg3aVdaUEVNcmRpNUs4WGxBZEp4?=
 =?utf-8?B?dHpEaHgvNWJnVk1saHRwbEZBV1NOblgyby9FVnM5UGJ5NmZ4azZMSGF2TTEx?=
 =?utf-8?B?S013dURhUHNYOGh4TkRFdGhaVEQ2QitJaUZvYU5xcjREeHNuV2cxdUJLYUZB?=
 =?utf-8?B?enRYUFdnUkhTUFlKM1hRYUZJekh5Rm00RHljZWZGM0RnZno4NjJVT0NoVUNU?=
 =?utf-8?Q?ZSRI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:26:13.9611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 932b69f3-636f-4519-e1b1-08de4c4d3c44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_032621_735072_4C46C763 
X-CRM114-Status: GOOD (  19.05  )
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

On Mon Dec 29, 2025 at 11:16 PM IST, Nishanth Menon wrote:
> Anshul,
>
> On 14:40-20251223, Krzysztof Kozlowski wrote:
>> On 23/12/2025 09:44, Anshul Dalal wrote:
>> > On Mon Dec 22, 2025 at 2:23 PM IST, Krzysztof Kozlowski wrote:
>> >> On 22/12/2025 09:43, Anshul Dalal wrote:
>> >>> The bootloader on K3 devices makes use of mailboxes as per the ROM s=
pec
>> >>> which might be different than one's available to the kernel (firmwar=
e
>> >>> spec).
>> >>>
>> >>> Therefore, this patch adds the missing mailbox entries to the DT bin=
ding
>> >>> if the matching compatible is ti,am654-sci to represent the mailboxe=
s
>> >>> exposed by the hardware during boot for the purpose of loading the
>> >>> firmware.
>> >>>
>> >>> The new ti,am642-sci compatible is also added to represent SoCs whic=
h do
>> >>> not expose a "notify" channel as part of their TI-SCI spec such as A=
M64x
>> >>> or the AM62 family. The newly added mboxes are made optional by keep=
ing
>> >>> minItems as 2 to remain compliant with existing device-trees.
>> >>>
>> >>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> >>> ---
>> >>> Changes in v6:
>> >>> - Added ti,am642-sci compatible to represent SoCs without a "notify"=
 channel
>> >>> - Added new examples instead of editing existing ones
>> >>
>> >> Why? Rob asked not to.
>> >=20
>> > I had followed what Nishanth had said[1], I'll wait for him and Rob to
>> > align first before posting the next revision.
>>=20
>>=20
>> Existing examples are fine. There is no rule saying you need to keep
>> updating examples or keep adding new device to examples. If someone told
>> you about such rule, tell them to stop inventing rules...
>
> As I had responded to Rob (the reference you posted), leave the
> existing example in the binding as is, we do not need to add new
> examples either for each of the compatibles. We have enough examples
> in device tree now. So, IMHO, just update the binding.

That makes sense, I will remove the new examples in the next revision.

Though should we add the new am642-sci compatible as well or just
re-order the one for ti,am654-sci to ensure we can handle the AM64's
edge case?  Since, the added compatible makes the if-else chain more
complicated than it needs to be.


