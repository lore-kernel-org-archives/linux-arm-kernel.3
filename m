Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EC0D38FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aM/LziR/MOUWagErEGlU6MilNCBiZcJdHoA92XdBDRI=; b=tt8GqAiH/hILEKUr58tiZ6zRNP
	0VfusyNJLyxBieBWXz6h2dEunsq5da6zHedbhiLU0KqbkoZS2jxJhXqZmDdLxIfCihUvQzSZPejbw
	IvKj56NQ92d25qCnLJPQNqG/9zsjBWi5lCYsx0BxrgodVljlQ/H6YfMKH+uwcCI5p7FFZvGvQ/Vt8
	WEnBsS3n+VjI+M8sF3HmOgOAa7LOBWws23X7bGUG7PCYoZCgaA2Et7Ib/keZhIwBwj+polAFjyJW5
	EiwzlebM7NEyv6Im7bwl0v8r7WXIHUEp7IFu1hzE9k7+enMQ9xsEfVLr4zXtGRQBvvB1W0b4AthJg
	qSYio9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4OR-0000000A4Ou-3ypT;
	Wed, 14 Jan 2026 17:10:54 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4OO-0000000A4NA-2pJo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:10:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1D76oyZwIjjT1i5ECn+CToO2Qja0hF/9OrFnSopw4jznJegDn5GossKItLcpUDcvnrdDAR0ctlRc0+we67kZKLDcF+D9pAIk7qi0qRZMQnBo7GoSzqH1tpPtBnr87+jXtOxgjdGaer9VcMQHWQQLzOiC9aEP/GTu+rd6ZHucFl1Jg2Bnv3zJob0E+upii34tdcUuk1VeqWTCmexwsJBV2tA6feA38Z9EcAzGONQSGW66q1Te3VybqyBoV7aGibdU+uH5N7v3W2I2z1DhCMpopVGZIfENH5frmLTFsTnbvenBuG+yeByeYPwBfrM44cGNkMca5e59Zwv+TEiOeqHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aM/LziR/MOUWagErEGlU6MilNCBiZcJdHoA92XdBDRI=;
 b=BCzQo6m59pyBUZSMlNnBIBnw921up1aPKo/g1fzZ4/w9FUl7Eet4xfTjk8YaQBGMvyE294IR7jSFNk/uJ2f8cIBkZwemChZU73k9JL1kYpL5E8mE3U6I7L27Shm8Gg0KOE3XH/tQLoXJPeuYKJtVTdgUO8yP+CTvGNG8pw8hshChB7LCebtQ8s3wPr8NrdiEBQVx7zijb8cb1m0/gRSSzQnuV3h4Pt5YqcBE9vuoRklEI6srJL7P9O85u5vowjRpiIDeVgMan3zhedr71jNlqc+4waEXns5NaICTqfkfyYTy2Kc5PUjTXqEbhzkaoacjbaIPG9Vd0sZtB5v5WeA6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aM/LziR/MOUWagErEGlU6MilNCBiZcJdHoA92XdBDRI=;
 b=GqfzxaIigerbsDYAFCkQ9z28NTD5ug0BfyN4N3hhu8m4zQ6C26XkugGZHJgW3tiocLiSingMU5ab4NQ9C1h7p61YaQfndzYOVm261iB0lCB5aPQeqhghU911bKmY71WDnZ5o80W3lMoUDvcKMF71YG/2Ktim+4jLcgPOHOCYVi8=
Received: from CY8PR12CA0002.namprd12.prod.outlook.com (2603:10b6:930:4e::26)
 by CY8PR10MB7121.namprd10.prod.outlook.com (2603:10b6:930:73::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 17:10:43 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:930:4e:cafe::c4) by CY8PR12CA0002.outlook.office365.com
 (2603:10b6:930:4e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 17:10:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 17:10:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:10:43 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:10:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 11:10:43 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EHAhPS134096;
	Wed, 14 Jan 2026 11:10:43 -0600
From: Nishanth Menon <nm@ti.com>
To: <ssantosh@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH v3] soc: ti: pruss: fix double free in pruss_clk_mux_setup()
Date: Wed, 14 Jan 2026 11:10:41 -0600
Message-ID: <176841062848.1986261.4427039972750135925.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260113014716.2464741-1-vulab@iscas.ac.cn>
References: <20260113014716.2464741-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CY8PR10MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 2580b339-9cdb-42fd-6b13-08de538fda1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|34020700016|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU1lMTVpNkwwOFRDd1h3S1NQaXIydWpVdUVtQ2MvZ3VQWGtqZTQ1ZGYzSXZF?=
 =?utf-8?B?dnp3WGpLb1BHV2U0eWc2N25uZ2xEY0Y0MWtVNU1JbkQrL2cvWEwvNStMWkJT?=
 =?utf-8?B?UkNmS3RIU3FiOTJodjVSQzhYVFRJcklWYkluYUlDQ1llNWVRQ0lvTm4xZFU4?=
 =?utf-8?B?WWRhVS9kdDcycGhmNTd0NnhOK1JvY1lGQ1h0MlFISE9xYmc4ZCtKMk1LTWRQ?=
 =?utf-8?B?UzhvMEtVQzI4VjdzUDliTWYySG1uM1lHVS9ydzRUNWV2QytsVUt3aFhUNHBN?=
 =?utf-8?B?SjRUTzR0TFg3Ty8wckxFbGNBVm5lZVMxcXoybkFuTW9QZHZmT0FLeVNhbmFx?=
 =?utf-8?B?YitXR2VaL0djRjczWHdwUDcwaG1GaDdSRWtueVNYUmkvUVJMdk5uNXZBYWtr?=
 =?utf-8?B?RnhDOGgvcW45cDVxc1FQMGxpdThyVFZjd0lVM0VuTS9GRUNFOHhsUUxDRk93?=
 =?utf-8?B?bkdCWVg5eCthU3pIaDJwSnk3RG5GYnFRb2xvVE4zQ0hiZHNYRE8vdnVTTmJQ?=
 =?utf-8?B?VkZyUVcvNkpnVFFsTjRWVWV0ZFVuaVZ6Y0QvbDRhZEtsT05pYXU3VGJkbCts?=
 =?utf-8?B?akdTMmpqTnBLdzFRTkNXQlNIeVVUWXhwVkQyYTJFeGtpNWx3WFdVU3hxK2Vh?=
 =?utf-8?B?TThjcDRCUFV5WEdneXRoTmFXMFpPaGVDc2IvTTJaSFFEQ2JVNFg0Rkx4WVZS?=
 =?utf-8?B?dXNyNmhpVVJNdFBkMU1MRkdka2JVZTU3ZUs4VXVWUXhXY2FCazJjd283c0hX?=
 =?utf-8?B?L0VpYzhRV1hxczRhc2dMNXZiWmpzYmxORXRremlWVkg2SSszeHhpZEJTZ3d5?=
 =?utf-8?B?UzYxS1FVQ1lRbWNEQmF5OWdmdGpRUEFUVSt3Q2RTS2ZMdTJFWk94cHdiVC90?=
 =?utf-8?B?eUk3czBuLzFvdUZkOG5JSkJub2VXNVVML2kzNUhQQWJPa0xkN043L2FDakRU?=
 =?utf-8?B?U254U09tMHRhTXNuejkwL0phbkh6ZW9PM3VrV2gzZ1ZUaG5FTDRwMHlnSXFL?=
 =?utf-8?B?dzlXVFJOOGd0UE9TeGhwdEtOUE9lMVovMHcvWUp2OCtVTGxqdE15U2JPbjBI?=
 =?utf-8?B?Umo0OFRWSEhlOEhOc3phc2pacDllNTIrcDFiUWNjZDJMem1wRXVLUVMxZEpC?=
 =?utf-8?B?YzY5ZDk3MDdzclppQ3VvT2M3MWVaMUk1U0RSa0lSV1lTTnhkbWJjZ2NKbHZy?=
 =?utf-8?B?NHZ3MTJmMG1SbElWUmZVelFKUklWQ1prOE9HeUhubXVnN0taZ2xsRVIvaWJZ?=
 =?utf-8?B?MVdOQ1RramRyL3hRa3lQajhKQkpOdFM1NmxkUHB3T3JqeUFZTTF3aFkyMFlK?=
 =?utf-8?B?SE9OMDdHMWZGT1RibGlXellyQk55bWpxa0tqMU9mTjhDQlFFdWxDV2U3MVBn?=
 =?utf-8?B?dk4yeXBZQVBlcVVBZ202cHN2THVhUHdyUityWXVEbkZ3TzhHb2U4N0FWbjJx?=
 =?utf-8?B?SE41RHR2SG5GaldSUm9zdUk2REJ3MWI5UlJROGxQUUh1MERkbWFtN1h2Nzlz?=
 =?utf-8?B?c3U1dVFJZ3Y3aUhnVS9vbjhYb0lUQm1DK05QOHJDZVBXNW1RR3NFSHdhS3VF?=
 =?utf-8?B?aE12eE53dHMyTkJJZ3QrVXczVFcrU2tqL042WnVTUmdaYnd4dTFqcGpQcXZN?=
 =?utf-8?B?VXZvR0k4SklZYW9RWWpxZjNNQ0JXNVl4UFZXYzM5L3dKaDd1NWl5NDFvRFZX?=
 =?utf-8?B?eVMyenpzajhmbmlIRTd6SjNrY3FqNThoZTI2R0ZuSXorWU13Z1hJQlNxYk1i?=
 =?utf-8?B?R0F2TEV5NkdRV1RuNUllR2oyWGU1aGM5ZkQ5aXRYbXdDRElBQllwbzNFMkxH?=
 =?utf-8?B?MEozOGg5MTNqN0xQMGNTNXZDQ1hMMjZ4VHdBcHZjbkkzR29NdGxnbzNMRXB3?=
 =?utf-8?B?aU5GckZCWWdJRUQ0bHcyVHo1V3haSjVCeDRENFFEZVVxK2ZYVWhobW1nU1Jn?=
 =?utf-8?B?U0dvaXdFUGUvNldtSjdsZlJxMXJ6S0h0b0doanlKM01hSVFFZUM3WXFCRXBR?=
 =?utf-8?B?NTNUakR6RVZXZjJIZVN1Z0lSVkFweWhFc0JSdSs0cVRqU3VTOVV0TkEzQkRx?=
 =?utf-8?B?eUhUSlZab21WUTNXdzNDeFZCZm12S0swRk4rdURZUCtYZUNjRUcyQitPWjA3?=
 =?utf-8?B?anJoU200RlhOdnhabGlxNStMZ0E0bFd1MzBpV28wUTJFZG1RWlgzQjJRSDZx?=
 =?utf-8?B?alkrczhocCtrUll4YmwySzFtcC9RQnF5RFJnckVkUWhPYWcwQmc1NDN2U3Q1?=
 =?utf-8?Q?BxSj3dKHViRWdLr4zr8C3SoQGB4Pnc310AwTC+VHsg=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 17:10:43.7190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2580b339-9cdb-42fd-6b13-08de538fda1f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_091048_717844_1D2E0F56 
X-CRM114-Status: GOOD (  13.99  )
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

Hi Wentao Liang,

On Tue, 13 Jan 2026 01:47:16 +0000, Wentao Liang wrote:
> In the pruss_clk_mux_setup(), the devm_add_action_or_reset() indirectly
> calls pruss_of_free_clk_provider(), which calls of_node_put(clk_mux_np)
> on the error path. However, after the devm_add_action_or_reset()
> returns, the of_node_put(clk_mux_np) is called again, causing a double
> free.
> 
> Fix by returning directly, to avoid the duplicate of_node_put().
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: pruss: fix double free in pruss_clk_mux_setup()
      commit: 80db65d4acfb9ff12d00172aed39ea8b98261aad

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


