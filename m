Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B632CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e7WNMh2XrLf8IMGJokdCRDYr1c9FXmc3gyN5d0ofidA=; b=lpYroPihrVqGb945AautRPKkGI
	VN0IOo0An3Rc1xGlGaynJ+U7I3B41FD3ZyrVnNdhwl2iAdakxvvSgAuk6hkk8ZoHq3p5ZkI/FBixl
	l7yt9WhQVigX6H0bY+tBUf/kyoRQvpsG7+i5W9nxed8RWw/Y86azl8RBmTG1ent55jzYtd3cBjXDz
	3SAosLLFoNgOFB+xdpAT/1fkQZhQVQ4B8lpWKvGKqcj6brU2quGiSfzBoddNEMLwSvX2jM6W+sT/Y
	my0zLhacpiBvormVtSq0b8aBYI5sHtaew3fvnDTfV9P7+ysjCh8ULHcDG2aKMkPZtORKmhVSUd1VX
	c5P7Q4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUX42-0000000Dqsz-0ZMZ;
	Tue, 02 Jun 2026 21:54:22 +0000
Received: from mail-southcentralusazon11012034.outbound.protection.outlook.com ([40.93.195.34] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUX3z-0000000DqsS-1jvP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hg1PMehcAbb7pH8WpmdcdTiGa9rNKfMPdkokCKWBtECr04C+A2EDr9aCMcb+f+RJFI9LowOuwnJKegxTSlH96nTHHjTO0gO6fWYwxSBmkE/NSG5JSI52I5sF8NMRp2fToFa1b56qWDnZmcitGPWFNaMb9dh1npzksAj3fblnAPpzfPgR1DruouFLOFNsJFyYR15BF2fmnotqckJfrIQLqrhYzGyurMqnr4LbfOYc2KgAuIShrx5syP56Q//3n9GOxVQ+7KBV6gUpbA0J+65KpKfIWXY47DtjKlE4YtnV7HRfwGwsJxArF8JdkyvoAC39vXBq+fWy5jAyytCegB1qbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7WNMh2XrLf8IMGJokdCRDYr1c9FXmc3gyN5d0ofidA=;
 b=GWQwb5PC3P85aKRHupnOCBuJmnLgx+jofmZHHUoksfxsj0YFhS642bceWI44UEvx4REfwkRDqvrEBje4wz2arsZTk0ZbNeU2I6rsmUICv+8dPCJk7XtcXSbZzISecAokuJ/0n/v6LciekiR6kTB4yqryLc6Y07ROFsth2KTjiK+X8TdAg0ZlfgH3Y29twO8ajZ2R5ZYOwXaPPscP5pUavMs+YKTXfQxQiCWiuRsrTL3IvjWlCH6X9SAf9KToIWVP57x1WT8s92Z1kNItfUF4t2W13CTTg3fPvEFT0oZeExTtCQF12keochaCp6bQ21v87mZEB0NnwtwzEwU5v2GO3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7WNMh2XrLf8IMGJokdCRDYr1c9FXmc3gyN5d0ofidA=;
 b=aEbpIClu/omJz520yPfnfw4fzyji42oQPmmcVSuogXfeRG2pDnWF2zlrVEeurl39ZrdcpAY41jfAiqByBgGCt2VeM0NHRwwfg2whUHUEd0XfVvCNM8rknIqMrAKtd+I6i9Ai80LTJv96Df7xG/82lNzDykmUsWGu2QR1Nc7QxPQKKaRytXYRoS3Kc50XDW3YtWQRJDvEh5CCCQ9NpJlwAllMc2bnlwC7SCiSifXTQ9y7dsyPsrqsYVqjD88R6ioiFCY8b9t5pdfIHhEiq5BVitgKQRANakyVtz1pL+3Eo4d4/4vtR8tearJhpU6M9WBr6QBHbyKmmLAIHAazly3S1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8768.namprd12.prod.outlook.com (2603:10b6:8:14f::20)
 by SA5PPFB2BF91BC0.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8de) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 21:54:13 +0000
Received: from DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5]) by DS0PR12MB8768.namprd12.prod.outlook.com
 ([fe80::c16b:c351:2fc7:95e5%7]) with mapi id 15.21.0048.016; Tue, 2 Jun 2026
 21:54:13 +0000
From: Seth Forshee <sforshee@nvidia.com>
Date: Tue, 02 Jun 2026 21:54:06 +0000
Subject: [PATCH v2] firmware: arm_ffa: Handle maximum RX/TX buffer size
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-b4-ffa-rxtx-map-fixes-v2-1-7cb06508da84@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAP1QH2oC/3WNzQ6DIBCEX8XsudsAoqY99T0aDwhr3YM/AUNoD
 O9eas89fjP5Zg4I5JkC3KsDPEUOvC4F1KUCO5nlRciuMCihWtHUEgeN42jQpz3hbDYcOVFApTU
 56qS51Q0Ud/N0FkV99oUnDvvq3+dNlN/0t9iKf4tRokArOjlIZUg09rFEdmyudp2hzzl/AIMhu
 I27AAAA
X-Change-ID: 20260531-b4-ffa-rxtx-map-fixes-244ede71a935
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Seth Forshee <sforshee@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MW4PR03CA0054.namprd03.prod.outlook.com
 (2603:10b6:303:8e::29) To DS0PR12MB8768.namprd12.prod.outlook.com
 (2603:10b6:8:14f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8768:EE_|SA5PPFB2BF91BC0:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ca606c-ac57-45e9-c03e-08dec0f17bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Fz7/UotueqWG9b4w5pXucLcyTS+3pw2WWDbyg77kYYncGJIRjPMl3RHOFyf2r81NIrR9l1xG4yc273Ws2K1eqPUVKi8N/e7QfQQ2VxJinzMfol50seGI5SLW8G1/m1hZVD6kGMKx3fZEAWEBMo8E/57i0rAhZGNCwrZHpUVJuLODfxONHvu9CiI9Wa45hOYJ2UqI5YlhRet4Xam3ay+6kfOel82hOozx9tX5J1sohP0tRCvRQM6mV4MI1ka3hytjSskYwX35/XaK2fLk4JxuDmxhBaCyHjjNLwBtRQgtgJt+FxFueQsAO4KjxF6QdCzp3qQc2aJGSC0NbKUEN584+EJdTIdqJjdK90vY7+EFiZHYtQfM7QE+LbhN0PhHYLzzVXgcCk+hNgbyvzokrXrb1ch8aJycrtfsROTGU4btQLUidrch+2IMMCkYHk2NIVXanMxEo5L2wfY/55fYqEkJanXrvplwni/aL4C023IFS5Gzf1bmeSNIhnYgqFHm7+gpcoFQLuiNZlql2hypjXo8uCHVGEmQRRTBaOoy51N3/kjQAL36xXvh0s+D4xD12MJ+mv/T1ziPWpBj1x52A+sl71TTLHBJu4DRM9S8rXBkFFOHOtE+tTI1n+mExNflcSGKQsmD9Wbf1ayDu9ZGzySXuEe1n1dzlnYrof78xghynzziZcswfVqjeo24esZH3SEnuXIS6jS14LC86pMB94WhlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGNxblNsOVRxL2haTUVjZEZoMTNzZHRtR01qR2xpbE0vYlkzREE1MDkrRU1S?=
 =?utf-8?B?bGtjOHV2RVpPZHJ1ZVI4UGxvNlRsQVpPbFhPZ1NwZ3RBbkdjVjNoZHpuR1dJ?=
 =?utf-8?B?YVh3MHlraXRwK29QQ2gyL0pLNEZ1M1pVTUVFa3FsYXNwYUVkanFlMzhSWXdR?=
 =?utf-8?B?ZnY4Nlc3WlNnQWIxMkRFQ0xrMFk2cnVDL3g0RHR3MTdIRGh4UnBoR3NZanRa?=
 =?utf-8?B?T3BGL3BUdW4zNnlwUDNiVnA0aVNEQUQvUmt2Y3AyZ2xtWVAxV3Y5dElUZFRv?=
 =?utf-8?B?YWsvaGdMd3N5eHlmbmNXNjBEOHVESE5saVFRajQyT2VzVjRaUDRybVJ0clFt?=
 =?utf-8?B?R2JmdGlCdjBqMUcwT1V3Q0ZMWTdQWDB5cEZUZXFnbEJOeXBCejFrMFlrSXVO?=
 =?utf-8?B?dFJLTCtPa0VqcExURFF3dkloeXd3TWM5c3dpZkxPNFpEVEplL3NCa0F2L0tj?=
 =?utf-8?B?clh1RzV1S282dDI1WHpoaFpRTDBkcWU5ZzkyUTc2RnMxM1JLNnBtc2lUVFJR?=
 =?utf-8?B?dzdaZ05RNG9NZXRiRjlsdmRwd2NHNVA5SjJiVnVMNG80bVc5V1U5a3RTSFJv?=
 =?utf-8?B?dU9YSmVKZTM5RnpmOTBtZUJ2Z2FKeFI0T3JwUWNwNWFTY3NYSjY1RDdHcXh3?=
 =?utf-8?B?T0E1bHMyTU9adGFRMURJQmZrWjhDODRsVXpyamJoWTBBNkxyK1FGMXZpbWZ3?=
 =?utf-8?B?U1dUYjduc1hIWG1GTG9kWUFyejEvbFloWkJBN29XWkxqdEJBbHM0T3B5NUJQ?=
 =?utf-8?B?NHhNNmZMdWtuUitPRzZ6c1FGRW1tWDJJUUdsVEoxL1dHMzB0dVIxK1JaQkJG?=
 =?utf-8?B?US9WZmRxRGZPN3hGZjhTbEJWQ0V0dS9oY1FRUnJwZFdVRCtOcXZ1bVU1N2pl?=
 =?utf-8?B?KzM4V2FwTmlMSUpMWjY5em82Zkxib21kaVFIY0UyTUMyTDFHWlA2VUNuZHNv?=
 =?utf-8?B?ODh3SUJmSzJGQllHY1dYK0hIbFFhQWJZUC9CMk5nemxBK0xibTNyOXc1a0o0?=
 =?utf-8?B?SllPTUtrOUNUdzJvNHVFd1ptZ0wzak5ZdHZMWDlwVDdGMXY0cVdLWHg1UUxq?=
 =?utf-8?B?VzBVeEZzUmUxbURNaDFoQ1FNMjlwNVFSRVQwbWxJUkx5TDFDQkFEY296K1F0?=
 =?utf-8?B?eWZZRDRSeWwraFFJdFNMd1AzY1BaR0xMN3E0RmVueE0zZWw2WktJTUNyRm1D?=
 =?utf-8?B?STl5V2FTOFhyR0dteVI5SUcyOXNtRWFva0lhUHVvbDVBN1REWmx0M0FsM0lt?=
 =?utf-8?B?c1YvNlp4Y3V5YlVOQ1BsSVV2bU5KREUzdjJJL3loSjNIQWYxeFJIekZHZ2Zr?=
 =?utf-8?B?akgxRWtmbWZuOEF3QUNyVVlGamQvWkRNMVdlcWIxRDhkMytzcnZlNG5uT29s?=
 =?utf-8?B?dEhyZVhZbzk0YlZFQW9wOHVNS3FySHRQbThUcDJuMVowZTd1Ymsxdmh2SWl3?=
 =?utf-8?B?YkNXR2RZOXE2M1BuYUVOa3dtd3VncnlTRUt1ckdhZFFiY2pFZ0dhdXRTSHlL?=
 =?utf-8?B?Nkw2V1NxSGQ0NEFISWJ3T25hZmRxMlVtZUQ5ZCs2b1FKOHZnMnIvT2habWls?=
 =?utf-8?B?a3daYVM0bXBkTjNxajZILzZBczVUbkI5RjdyZmdNa2J4RDR6REI5RlNtNVUx?=
 =?utf-8?B?TmFsVWZDeTNZQVFiSXAycDllMVkyVzlEN3JUWjU1T1N3UmNzZlc3T3QxRUli?=
 =?utf-8?B?ekhjRnZnOGN2NmRMVWFZQkNXZDR6VXNiZVBLK3pySGpaZUZvNFRUYWpQUkds?=
 =?utf-8?B?VzRJWS9QUytVTTF4N2tKVVNzQnNKQUtrdjlySkxrMUVLKzZlS1hCMjVSc29q?=
 =?utf-8?B?SVdUN1kzaWk5a0RyUExzY1JLdm5PVmxhcVJUQWk0dmpjSno5RXhRY3hCREFh?=
 =?utf-8?B?NHFNcFExRy82cnpuRXJlYmd4VTRodzZoNkNYTTdJSUdGa3RsWmM5WnZ4S1JE?=
 =?utf-8?B?Y0tTSmJ2U1c0VlhRZGJUOGNzS095M3FESzB5bTlZM2ROMWRMQzRkN3RXbVpp?=
 =?utf-8?B?SThxOW1NRjN3RUViWXpET0JPR2hVVEZtcEVpaE05dlFuTGduL3JqSWo5MGRp?=
 =?utf-8?B?MTRJWFR4SC9rNFJWdWZScUgwYjlEZndCdGdhdDF0bFd5WXlHajc0RFA2N1R0?=
 =?utf-8?B?R08wbDBrSFpyRzl5VDJpZDB3bkd3RExtQUFoV2ZnSDE5eDAzUDdFQ1V0ZGF0?=
 =?utf-8?B?RkxKVVlmaHgxRlNDZG1oSVZLS3RIQWJrQ0Z3ZXc5VFZkUW84QitvbnJCMnJp?=
 =?utf-8?B?SzJJdkRxWU9pWWtxSnRUbUhGdE9xdVpHNitnMEM4dEFrQldyMXQxc2xRREE0?=
 =?utf-8?B?WnUrRmE4NHcwamtNVDNHQmdLZXdTazZDdU9sVmxEU0E1cURjOTBxdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ca606c-ac57-45e9-c03e-08dec0f17bdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 21:54:13.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSDAKvxsifCgyAiBqxWMwZf0F0WwdGO683l+SRgpc4RbTc/ytkNkz+NEuzFMV+bMpsumQG8t3qVQYEKEFfptQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFB2BF91BC0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_145419_485888_42F872B7 
X-CRM114-Status: GOOD (  18.00  )
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

A partition manager may reject unsupported RX/TX buffer sizes by
returning INVALID_PARAMETERS. Commit 83210251fd70 ("firmware: arm_ffa:
Use the correct buffer size during RXTX_MAP") has the effect of rounding
up the buffer size from FFA_FEATURES to be PAGE_SIZE-aligned, which may
be larger than what the partition manager supports. This caused RXTX_MAP
to fail for some FF-A implementations on kernels with PAGE_SIZE > 4K.

In FF-A v1.2+ the partition manager can specify a maximum buffer size via
FFA_FEATURES, but the driver currently doesn't use it. Add support for
decoding and honoring the maximum buffer size.

Some v1.1 implementations also return INVALID_PARAMETERS from RXTX_MAP if
the buffer sizes are too large but lack a mechanism for discovering the
maximum buffer size. The relevant bits must be zero in v1.1 and earlier,
corresponding to "no maximum" in v1.2+, so we can handle both using
the same logic. First, try using a PAGE_SIZE-aligned buffer as is done
now. If this fails with INVALID_PARAMETERS, retry using the minimum
buffer size, which should always be supported.

While there, also update RXTX_MAP_MIN_BUFSZ() to use FIELD_GET() for
consistency.

Fixes: 83210251fd70 ("firmware: arm_ffa: Use the correct buffer size during RXTX_MAP")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Seth Forshee <sforshee@nvidia.com>
---
Changes in v2:
- Combine into one patch.
- Remove unnecessary check for FF-A version when decoding maximum
  buffer size, as this field must be zero in earlier versions.
- Simplify the implementation.
- Remove unnecessary typecast.
- Remove unnecessary comments.
- Rebase to for-next/ffa/updates.
- Link to v1: https://patch.msgid.link/20260601-b4-ffa-rxtx-map-fixes-v1-0-c071b12ae05c@nvidia.com

To: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/firmware/arm_ffa/driver.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 0f468362c288..bc2685331b27 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -32,6 +32,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
@@ -59,7 +60,9 @@
 	(FIELD_PREP(SENDER_ID_MASK, (s)) | FIELD_PREP(RECEIVER_ID_MASK, (r)))
 
 #define RXTX_MAP_MIN_BUFSZ_MASK	GENMASK(1, 0)
-#define RXTX_MAP_MIN_BUFSZ(x)	((x) & RXTX_MAP_MIN_BUFSZ_MASK)
+#define RXTX_MAP_MAX_BUFSZ_MASK	GENMASK(31, 16)
+#define RXTX_MAP_MIN_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MIN_BUFSZ_MASK, (x)))
+#define RXTX_MAP_MAX_BUFSZ(x)	(FIELD_GET(RXTX_MAP_MAX_BUFSZ_MASK, (x)))
 
 #define FFA_MAX_NOTIFICATIONS		64
 
@@ -2101,7 +2104,7 @@ static int ffa_probe(struct platform_device *pdev)
 {
 	int ret;
 	u32 buf_sz;
-	size_t rxtx_bufsz = SZ_4K;
+	size_t rxtx_min_bufsz = SZ_4K, rxtx_max_bufsz = 0, rxtx_bufsz;
 
 	if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT) &&
 	    is_protected_kvm_enabled() && !is_pkvm_initialized())
@@ -2132,15 +2135,18 @@ static int ffa_probe(struct platform_device *pdev)
 	ret = ffa_features(FFA_FN_NATIVE(RXTX_MAP), 0, &buf_sz, NULL);
 	if (!ret) {
 		if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 1)
-			rxtx_bufsz = SZ_64K;
+			rxtx_min_bufsz = SZ_64K;
 		else if (RXTX_MAP_MIN_BUFSZ(buf_sz) == 2)
-			rxtx_bufsz = SZ_16K;
+			rxtx_min_bufsz = SZ_16K;
 		else
-			rxtx_bufsz = SZ_4K;
+			rxtx_min_bufsz = SZ_4K;
+
+		rxtx_max_bufsz = RXTX_MAP_MAX_BUFSZ(buf_sz) * SZ_4K;
+		if (rxtx_max_bufsz != 0 && rxtx_max_bufsz < rxtx_min_bufsz)
+			rxtx_max_bufsz = rxtx_min_bufsz;
 	}
 
-	rxtx_bufsz = PAGE_ALIGN(rxtx_bufsz);
-	drv_info->rxtx_bufsz = rxtx_bufsz;
+	rxtx_bufsz = min_not_zero(PAGE_ALIGN(rxtx_min_bufsz), rxtx_max_bufsz);
 	drv_info->rx_buffer = alloc_pages_exact(rxtx_bufsz, GFP_KERNEL);
 	if (!drv_info->rx_buffer) {
 		ret = -ENOMEM;
@@ -2156,10 +2162,17 @@ static int ffa_probe(struct platform_device *pdev)
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
 			   rxtx_bufsz / FFA_PAGE_SIZE);
+	if (ret == -EINVAL && !rxtx_max_bufsz && rxtx_min_bufsz < rxtx_bufsz) {
+		rxtx_bufsz = rxtx_min_bufsz;
+		ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
+				   virt_to_phys(drv_info->rx_buffer),
+				   rxtx_bufsz / FFA_PAGE_SIZE);
+	}
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;
 	}
+	drv_info->rxtx_bufsz = rxtx_bufsz;
 
 	mutex_init(&drv_info->rx_lock);
 	mutex_init(&drv_info->tx_lock);

---
base-commit: 18706ea68fc4344049bf693b702cb311a7c27ca7
change-id: 20260531-b4-ffa-rxtx-map-fixes-244ede71a935

Best regards,
--  
Seth Forshee <sforshee@nvidia.com>


