Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E05E98E13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGlaHEdwrrXTusD4aBpdCue8yRdOf2fPl5nJ/NTEFf4=; b=vZYI2jgy//KOLQ5XjORjgPQjL3
	0rqP+fgz69pTwROcgUXixKjYdRSU7TOLtijHEK36qQgpe8Z0RyczZUojpckQFrLG0KKQ6QDD5ALWg
	BpAyISqLc1uPle8jJhS6gxA9uOpNYrTA1TIR+c1WaYvGCzFxexQe2J/DkB7Eo7uC1EYViFqFWA6x1
	AqvimiGVEmHDMjPKC7MaUwewEobNKVVcJ5VRFInnGLZ8BP3ToPeqMdXQvc29HST2i0dctqk7hBb7V
	vLOh7fU1plPzvZrEWetyg/e8maMeCr5IRCAH5Pb3O+/UDN6MzJ+Ubs6FHaSQjMPJRpnggxE7/oCFp
	n8uFxLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTQv-00000000566-1Ta4;
	Mon, 23 Feb 2026 10:44:57 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuTQs-0000000053n-045t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzSNPNXGtRTUSg039BXlD8axdmbPgYqVN2hJ44A32wL1L0yOHGTyF3lGeKf3EcTX+3K1bm2CYM3qHxgngM5FFePs5DOt3A0pwI9pkR16WwUZA8QAmUJygCUj+8Euz5VST49/A3qFbHjwfn7iFFYrTl+uwSI7oGgiGe9u7AX7f6ePBCVSEfHogwbBHh2kWq+pkGKQf+iwLQeYW635CHWJKe+uULY+Yj2LGJzKb/WaX3KLS6rz+stFXZFhQXq0TdGr3yVOwg4C7jErrqLhwidZKQOLfZgFHcMPupVqPqk6uq5/qvMnHDV9EQ2Wkutxj2fxFq8ZinAaq77Kyv/J3oVI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGlaHEdwrrXTusD4aBpdCue8yRdOf2fPl5nJ/NTEFf4=;
 b=jNg9H45pzBiSzQxZYY7Vini0j53X2oaGZ+eBUiI/lsjf+60auO+COPpbMVRP4cltpkTvv0sn5VuPvDqjO9uHsXDCW8g1To6M7v2CXa+iFK614HZU3Epal5plQfpGOE2339uxdA7i+QTNhA6KCKuucfSCrrzIa/63tIdchbNPTXLGkPFFlNRnA6HcC8mKxOEkE6mbOOx+EKa2OaUt2ySV2tWL+UFhKoyUNLvPxdIal84pRp8vrIsmty8jrSoDb24r6w9z/o74oYfhMJHWmDcNAUChHEItuV/5k6n/he5BIhcG+gQQB6LSNSrS27GDcjxySmc/R08yKyjuqRsft7YZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGlaHEdwrrXTusD4aBpdCue8yRdOf2fPl5nJ/NTEFf4=;
 b=xIkWhRpgYc2tJb/pSWbHrNy/GwkGxXHp7cqz8HQ4/m7tvlgEhcM+V+danzqvWKQdlemOj4wP5W72M4J81I/5FLsxl9KeoByOj/eiptqcKJr0IQBKBVS6C2op/bstCFCRHSvew+ZIxjFvkJbIONotQ7jfozp2fHO/6eMbUFd7XDQ=
Received: from BN9PR03CA0866.namprd03.prod.outlook.com (2603:10b6:408:13d::31)
 by SA2PR10MB4459.namprd10.prod.outlook.com (2603:10b6:806:11f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 10:44:48 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::63) by BN9PR03CA0866.outlook.office365.com
 (2603:10b6:408:13d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 10:44:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 10:44:47 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:44:46 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 04:44:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 04:44:46 -0600
Received: from [172.24.231.225] (a0507033-hp.dhcp.ti.com [172.24.231.225])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NAihvm170191;
	Mon, 23 Feb 2026 04:44:43 -0600
Message-ID: <33c4d9c3-d4aa-44bd-bab0-65445cb7014e@ti.com>
Date: Mon, 23 Feb 2026 16:14:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] PCI/DOE: Add DOE mailbox support for endpoint
 functions
To: Lukas Wunner <lukas@wunner.de>
CC: <linux-pci@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<bhelgaas@google.com>, <corbet@lwn.net>, <cassel@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<s-vadapalli@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
References: <20260213123603.420941-1-a-garg7@ti.com>
 <20260213123603.420941-4-a-garg7@ti.com> <aZr_cD9LIQgvywri@wunner.de>
Content-Language: en-US
From: Aksh Garg <a-garg7@ti.com>
In-Reply-To: <aZr_cD9LIQgvywri@wunner.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|SA2PR10MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b7d51b-1d38-4c70-7a12-08de72c89040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJ4aWlJd01BTDc5UnRJNE1zTUVqR1MrZlJaTlBJVEhYbzRYTmVNalorc2Ro?=
 =?utf-8?B?Ym9IUlBLRjFTNkdPcGZidDBQbnJPZWpHOGZxR1RYV2pSWFZLdFVQekplMllQ?=
 =?utf-8?B?ZjZ4RWZJSmdVTHE0NzJRa200YXVNZjMxVDRqbkNvakpDYklMRzFIUUtxbkUz?=
 =?utf-8?B?bXBYUmJwcDF6am1GZ0U5eGQzNG1HNS9xUW5QeHRBZ0JVTWcrMnhiZ1VFbEk1?=
 =?utf-8?B?Yis1a2NKamVaQWl2akRoSTU3S0VIUEZvU2hXN1l2WHZ3NW1FOVE4YUZ4UGF5?=
 =?utf-8?B?d0tPakd0K25aRlJFeUk0STJoNE1qa2kvQzBscE5zSHZwbG1ZYm9QbzhYdVFv?=
 =?utf-8?B?dTE3cWM1ZG5MY0kzVC82V3ZNSkhxdFRJNkpicWFkbUVoSzA4eGpWb21xbkV4?=
 =?utf-8?B?aHdwd0hqWk5FVnd1a015YXFsMkE5Sm51Z1dQdzVHM010Qy94UXR5bldRVWcz?=
 =?utf-8?B?YkZjS2JIdzFleHJobUhWVE9tL1RsOUx3VlFrM1hOU1hrbkhJc1phNDNjV0hI?=
 =?utf-8?B?UTlpOCtBMXV0bTQ3R0c5Y21ZdVcxcnNZa0dibWpJcEU2V3l0bmpOcDUwU01t?=
 =?utf-8?B?dTNGaFNEK2dJcWdBMG4yRzZDd2RzdE50WHJieXR3bStHeGlBSUo2N05NYnMw?=
 =?utf-8?B?VVludUZQV1FoQTduTXhIeG1pOFlpZm0valBBZDVSelNuSkVKcFA2UU50cy9P?=
 =?utf-8?B?eit2aXRLY0poSldWdXBiZFUxdG1Dc1dhQ05BM3NtcWlYN2FaQ3F2WU0zbXYw?=
 =?utf-8?B?Ynk1WG1ZQmJCMkE2NDh4M3NCazYxek1KZjg2Z2ZlRkdZa3lNV1ZudWRPQmg3?=
 =?utf-8?B?RXN6TnhlOE82b3RrNG5BR05EWnhLSER2TnJpRy84cTcyVmRRbStXR2VzbElk?=
 =?utf-8?B?Q3pSc3FjRld1UHFxbk9ZU2JxRVp2TThMM2VQRk12WmI3TFhaWG14QnQ1WEpa?=
 =?utf-8?B?YzZ2aXNCWlFUb3I3VGp5YytoZHYwNi9DdG9yekZpa1luaEUwdXRmOHlabmtH?=
 =?utf-8?B?cklGYjdKa3Q0RnRhUGhEWGdLUHB4VmRQTEU0cDhpRHFGQnVwOUlIbGg3M1V2?=
 =?utf-8?B?UzNLSHhjK3RyeUpTb20vS3E2R01IK25TWHg4UEY2dWU4K2cwYVl0N2plSVhs?=
 =?utf-8?B?NU1GRHpZRlVIVURLcXpTNFZRNHZCQWwvbDI2OTRlOVh1R1lMeWJnNDBvRnZy?=
 =?utf-8?B?YUhEakx3ejNEOFFiMjhSUndnWGNGUFNGQm83RjNWb3l1RDMxdlJLak5nUG8y?=
 =?utf-8?B?d21sZWo5dWIzYWs4NThUMDFSSFd2QTVBQzlXajRYaXdoN3NIZGJjUk9leXJH?=
 =?utf-8?B?bzhCOWpEcTNKaGN6SGhkd25Nbkc3MlR4NENVY0xkVlo2SEVORnF6cjZHemxF?=
 =?utf-8?B?K1FCcXhpYVVoTUxVa01uSytQZnRpLzg3UzVpMnZpSzIwakFmK25UMExLZ2NZ?=
 =?utf-8?B?SXA0ZXIrOTllM1NKbWQ3TW94dDRldjFseFZmemJ5ZFE2QXk4OGVUNWJVbVFX?=
 =?utf-8?B?K3R2c0IwRFphMG9wc2ppNXVGZzJyWjJsKzFtWHhlbnBmYStrVFV6ZDVvM1dw?=
 =?utf-8?B?RkY2L3A1d0oyYVpjTkpZRmtXSSt6K0RRdkRCVklXMng3UUJMWW5Fc2d0OVdt?=
 =?utf-8?B?REhsblFkTk9MQjNQVEJTMDRnOXB5SWJrcENjVUhEekRnSmlRTE1uY3BneFNk?=
 =?utf-8?B?OXFRMG4rQTNxb1dSakVUUVd0Y25NNHA5ZUxaN1pkT1VGRlA1WjBEMXN3cjMx?=
 =?utf-8?B?SWI2NlFLenY2WmxSUXJEaEdJTTcyUWZxMzhWNThyNW52M1V5SGtIZnRCTndh?=
 =?utf-8?B?VDZLelYycFR0dlRMZUx1TWEvaUdMYnRNeTYzM1h1cUFVVmxicFhSc0dCdkZM?=
 =?utf-8?B?cXBpWkJDejNVUXkzTnBxMVptMVU2WUVDWTJRczJtNkxRR0lLak9xaUNaam5K?=
 =?utf-8?B?NlFVczIrV25ZTDE3RmxKSldQMGxqRDFXZDVVYjNmLzBCZ3RadXpsd3ZuN2RU?=
 =?utf-8?B?eWhpenM2UXdReVNrd3ZnaVBmZCtjRXFtL29PZC9vTkNQZXQvaEo1RnJzeUEx?=
 =?utf-8?B?MXR1bkk0K1NzRk9ZVXIvVElJOGRnNVRYdU02OWREZVl5ejJOaEJCMkdzdDNp?=
 =?utf-8?B?eG1jYmppWkp6MVJNaW1ldFJhaFRnY1RuU1JlN1VsMVUxV1d4SFRJbUFHL0w5?=
 =?utf-8?B?d2pKUXYvU2wxZzBVQ2JCcXFLYUVQN2lPeXdTRUxzSnlTZHJSUEZQRWR5VzBk?=
 =?utf-8?B?ZVJPdXBTMElaWkdRaHRGM0ZYcitnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mXFaH0jpPZaGPqASUiEeLj7R9skRPjlaN+I7d4UIUsvkc7VEoXsUmizERX8DDoCVNrogkkZjsPeZU+bOic6EkvnEfiIWOEJ8cxbxZS+OGOdrUIPkGZC80DWtjiU7fL6JpX8UFA+sXa8y9GCAg/hoHM6h8xML7iZi+PTaLQ1QvZVJtxdBb+TUt26JMFbYaRxD74TDP3P5p13RSQKg9s4xX1VC3kL6oaW9+PzsQXYiCp0PVDWlBH/LhJbDa4xMWBUWR+RbAbyxzfo53M+Rm391CBAqgnwFWoDzjxYimZFdKlFBtHGbpxNWY8by5iyPnl7G3FK4f/U1AQJYb+Kh0RLlPHef+uXiyk4YUcu+3L4nqcMHtpHcUPQoRuHWqcCA8ZRcabD9pAlYG9Ep9MvLONIVEqmXNoHQvXh4pVxcRPEiO+Km8PRABzlbM7i8JT649f33
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:44:47.1226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b7d51b-1d38-4c70-7a12-08de72c89040
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4459
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_024454_272259_14D936C1 
X-CRM114-Status: GOOD (  19.03  )
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



On 22/02/26 18:36, Lukas Wunner wrote:
> On Fri, Feb 13, 2026 at 06:06:02PM +0530, Aksh Garg wrote:
>> Add the DOE support for PCIe endpoint devices, enabling endpoint
>> functions to process the DOE requests from the host. The implementation
>> provides framework APIs for controller drivers to register mailboxes,
>> protocol handler registration for different DOE data object types, and
>> request processing with workqueues ensuring sequential handling per
>> mailbox. The Discovery protocol is handled internally by the DOE core.
> 
> This looks like it is largely a duplication of drivers/pci/doe.c,
> including the asynchronous request support that was originally added
> but was never needed and so was clearly a mistake.
> 
> I'm wondering why the async suport is needed in the endpoint case?
> Why can't this (only) be synchronous?

The DOE framework for the endpoint case needs to be asynchronous because
a PF can have multiple instances of DOE mailboxes, and the requests may
be interleaved across the mailboxes (the request processing of one
mailbox should not result in blocking the request processing of other
mailbox, as per the DOE ECN). Hence, the request on each of them needs
to be handled in parallel for optimization. For the EP controller driver
to handle requests on multiple mailboxes per-PF in parallel,
pci_ep_doe_process_request() needs to be asynchronous.
However, I noticed the use of wait_for_completion() within this function
makes the overall function synchronous for the caller, which I
overlooked while posting this patch.


Please provide feedback if the following framework would work instead:

The function pci_ep_doe_process_request() would be called by the EP
controller driver when a request arrives on a mailbox. Instead of
wait_for_completion() in this function, the function would return
immediately after submitting the work in the queue, hence eliminating
the need of private data for completion in the task structure.

A completion callback from the EP driver would be passed to this
function along with the current parameters, which would be passed to the
task structure as task->complete. Whenever signal_task_complete() is
invoked, the completion callback of the EP driver would be called, which
would take func_no, cap_offset (to help the EP driver to identify the
mailbox), and the status of the work as input, hence eliminating the
need of task_status in the task structure as well.

This would make pci_ep_doe_process_request() asynchronous as per the
requirement.


While going through the driver implementation of doe.c, I noticed that
the pci_doe() was made synchronous in commit 62e8b17ffc2f ("PCI/DOE:
Provide synchronous API and use it internally"), which builds on the
internal asynchronous machinery using WORK_QUEUES. As the pci_doe() is
synchronous for the callers, why the WORK_QUEUE framework was not 
removed from the doe.c implementation in that commit?

> 
> Thanks,
> 
> Lukas


