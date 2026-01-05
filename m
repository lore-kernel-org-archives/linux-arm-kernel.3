Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63894C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnUxkfbkwL5HMlg9rlbioZWw3oqTsXNiPduQWW1+NW4=; b=aGK10v1MFhMbkPNJoKVUu/67ZN
	zqoOMIzpWKbvpEnQ7jDM2vWGamE0z8hRTdlqKOyCBF5lyD8pbuFM/tHVaRAPOOgxHxYj+4zY2JsGJ
	ZrPr1kbPf93aQnP20anr4+BETt2S9Tq5Ft6RD8mRWNeR2GBAHGLhLlUYpJhuVE4JVDNIoIHMs6dWr
	J8+sOxFFlPY73EgTm5RlLNchPXqyTwKtovc+/qp9EAy4oxrxWAGPcMQ+oVO3udRRRm+pIcu/9zD33
	xSZntj9yJox5maXfmQ4Em+cTSJGRL0Vbl8AqMAB9aHPXjmrfwTuhI3TsguIn0gjFpNDybBiUH73Wd
	zqDDjmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclyR-0000000BZml-3v0I;
	Mon, 05 Jan 2026 14:54:23 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclyO-0000000BZmL-3BWI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4kJ9zEGqgKlmCxO7jpShU7YHM4lbzANp85PH5jrtMZ185WnojF8FHu9ILVjVMYcnz8xLyHDNWd2RI3ogJA3K+OtGUT70P8twsTxD5ysH8xaB2ODu3W/cHUP4H8s5AFQv6bKNqq3QXjUkEncrxL9IHWMf+SsJ+QGawGhMSiJSbEAcQ0Coqjz3zWewslDYXTi+DAZpgdG/zED9mIPnilon3JONuPkNNNstNsPyzmAyWAwTRnU5wSdQCOUi9L5H8ucOBjKBknz03rF8LRpGedbB19CeSkAnyxVC2UyiwAM13SsHvB6PDERUpA3UCBAI/h0okXtsiLoMp+TK/26vHsvpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnUxkfbkwL5HMlg9rlbioZWw3oqTsXNiPduQWW1+NW4=;
 b=useVcuMZNJPy4GoFYi6B1O2z7HoabjUYAKXJ81JEe6BLpDzNUokjDEnoytkBSKtuhX28CfW8LwCfWUiUYjKhk0C5Q1XopLtZ+VGZCgFempaCE6CC79HrQEu+nxKvqpfIEuS5e1R2zS/qq29omAZW1GVykJxjyINR7aoVrhXHdGZgcGsYyGZXVEZl20A1iARFJfQYFrgsAlMA464BGzQTpFoQTuoK1O0iOUX6clmuK8EAXwaKL7KH61xDDoLDpN/A+p+vyve4YzPPCHA655LKDgBJaIm3PeW43qDiO5WKIs7WE5WvOAUdGwH9Z5s/ANAtdCZHWqvWX3oayqq8r4QtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnUxkfbkwL5HMlg9rlbioZWw3oqTsXNiPduQWW1+NW4=;
 b=QfaJBaIU3zBW6Aq0yyJgPmjjEUeVQDcXwisGthm0A91JKVfhZH7rIF2fnGzMSOWT8AiYRZMR2uxU2TotwtQy6fq9rxtwKa+Pm+m6jDUeqLL+L9GBu8iy3NERvtj2VpIGuJ+3tasGUi7LCXEXn8CD7qp9tjy4VZGd+G7AdAgBoMI=
Received: from SJ0PR03CA0218.namprd03.prod.outlook.com (2603:10b6:a03:39f::13)
 by MW5PR10MB5764.namprd10.prod.outlook.com (2603:10b6:303:190::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 14:54:17 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::6e) by SJ0PR03CA0218.outlook.office365.com
 (2603:10b6:a03:39f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 14:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 14:54:15 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 08:54:12 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 08:54:11 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 08:54:11 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605EsBRt1436456;
	Mon, 5 Jan 2026 08:54:11 -0600
Date: Mon, 5 Jan 2026 08:54:11 -0600
From: Nishanth Menon <nm@ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v6] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20260105145411.6ybff7i2s4wz3lsc@prorate>
References: <20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com>
 <1844147d-543d-4739-a1ec-a59f8a4564fb@kernel.org>
 <DF5GPF5U7NPA.2ODE22YOF8E1R@ti.com>
 <e516b73b-2dc3-4ae4-966b-278a946491c8@kernel.org>
 <20251229174638.btuhliymlmuy5op3@submarine>
 <DFGMAGLHN1X7.2Y4CBP7MJZD6D@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DFGMAGLHN1X7.2Y4CBP7MJZD6D@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|MW5PR10MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 6baa3e55-95a0-4a9d-39b1-08de4c6a4bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H7g1VTdeQGosI9LsdWAhyCtyNUWER1zqDOKIqpBNaaUSpOGcutwAo/IgY2Tw?=
 =?us-ascii?Q?E/uYosYZi9qbjtwQGlei41EBvaiQ8X6JRNuVWzhQ5oGEWFNnoNrXvHcU8LIN?=
 =?us-ascii?Q?pDvHG5+Agt65bQDGhh3/T3/FJkfy9J9IPbBIbOptAi86c2ogfYMuQDCvwdRc?=
 =?us-ascii?Q?R+A9Hw0ybKobhco1KzjfZZhGoIgeRfJiRO4Jf+KQSGbmG5XHMEVTX8D7VIxJ?=
 =?us-ascii?Q?IqWeCLiEOu+bn8SZcKomWmlXmaiIQ5Yu+iYIDt8Q18my9YjFCijOOuy3p0uw?=
 =?us-ascii?Q?FCy1i2UOF/tJ4tH6UOW0hSEK0B7v8jt53Stz7HQkyY8qUGFHBq+Ln9BTlyk9?=
 =?us-ascii?Q?xkyySsyBOo6IpJUYNJGG8gU1/Km56oqxIEbrS8g8XzlZDe7rBvnwD2ST6Xmm?=
 =?us-ascii?Q?ew96VWNVc4nRorSKPKUFuNYfpBZ4DvHo+VVvltCE+H4VmK6kvdWd/xffff3i?=
 =?us-ascii?Q?NVLLz38+vr64a0EPRM+MDuHzsYyB3kAYqwi7o3HrtsKo1CuLlCy7f1u22TCb?=
 =?us-ascii?Q?xh+BLncTOueu+7ewAxRNfbg7Gaj90ormtdRGp5lvEuZUENNQWIvzGk8Wr6/j?=
 =?us-ascii?Q?sPW2MgjMH6U/iwEjnNFb3IAT2I9imK/XpiVq/biYXCI2JipqYeWtxrgm/tbz?=
 =?us-ascii?Q?Bt5DuoqmyUceKr9VXtmzt/0B5L5j4cVsbVNszn4ujZB8P3pY2j1eEcPNTNwg?=
 =?us-ascii?Q?fctz+4hfpbpsEHPjUfhzA1qs7pHqPAfYpmD7n3dP3GaZAYscOAC8TUhEm0fg?=
 =?us-ascii?Q?J7SqsHS2cc+f/3hdK0WP0lqjHJI6D8RuZ0xWGCs/3Ksa0/bbvrJkNJpWeYti?=
 =?us-ascii?Q?ocITIGFGBZRb/6zPi/hmt15FrlMyEECInMkmHCg84kGYfmk8Op2XfaRs5IfA?=
 =?us-ascii?Q?bgP7WqwFigtG7kgvsxzz725HuBmq3AFabnX5ls2Q/5FH7uibrZyApoV5ZgG0?=
 =?us-ascii?Q?7HaCwFLTY4vZukAgvnOpQhpPFF7qzmvVIMgnK+1B3y6Cy+grfagWAX9R2/pi?=
 =?us-ascii?Q?ErVJ8nK14tbs7G+8/ulUvCVu64NFOn3eLU3WZ1i5zgGZYmAlPs5l481gha73?=
 =?us-ascii?Q?d7SkDCKYPtYSi7ckDdUFn1VTn8jDLDeNEvOSesEUtdCUW2iCtFOMU7gGOOvZ?=
 =?us-ascii?Q?eewinRtOwVBJSpzQUoNEXv44GqOjmZvjlTQIkrksffbl8SFekv/DKcJuhLHH?=
 =?us-ascii?Q?daiI2sq0ERHurlTUem4ufKTxE9G/+q1SUc16kdzTUYB56ivK4/pAqXKHqZtV?=
 =?us-ascii?Q?mLQMjFJfmTR5oNSiAFDKp3Rncvovm3A9NPU2s1hP6WdZzln64UOfhzOrV4vN?=
 =?us-ascii?Q?oilZmbexOd79rir0s817ectK5eGCRPgXxbcV11pwNbViOD6symQTEBICOlNV?=
 =?us-ascii?Q?ngtSVnX45yeUvsyN42unCHdW+hNJja7A+3lF75iw9ZhmSrJMHGGR2fpo8hIt?=
 =?us-ascii?Q?h9p0PKUKAWmlUkpESSvpm24VqDfdlXQweHc50zBCmiEy17CR3ugUhU2Lr7bo?=
 =?us-ascii?Q?XkyqeqU7T8q3+ZYx9FsNI2TDsAbTQ0ev4zkSDd9AnIWpo40FpNp/4V+9vQK+?=
 =?us-ascii?Q?axZVuw1Z2xFYDHcYN6kaYwpIWxV1ggJUETzCdCxJ?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 14:54:15.5011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baa3e55-95a0-4a9d-39b1-08de4c6a4bda
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5764
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_065420_899127_0A323382 
X-CRM114-Status: GOOD (  27.58  )
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

On 16:56-20260105, Anshul Dalal wrote:
> On Mon Dec 29, 2025 at 11:16 PM IST, Nishanth Menon wrote:
> > Anshul,
> >
> > On 14:40-20251223, Krzysztof Kozlowski wrote:
> >> On 23/12/2025 09:44, Anshul Dalal wrote:
> >> > On Mon Dec 22, 2025 at 2:23 PM IST, Krzysztof Kozlowski wrote:
> >> >> On 22/12/2025 09:43, Anshul Dalal wrote:
> >> >>> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> >> >>> which might be different than one's available to the kernel (firmware
> >> >>> spec).
> >> >>>
> >> >>> Therefore, this patch adds the missing mailbox entries to the DT binding
> >> >>> if the matching compatible is ti,am654-sci to represent the mailboxes
> >> >>> exposed by the hardware during boot for the purpose of loading the
> >> >>> firmware.
> >> >>>
> >> >>> The new ti,am642-sci compatible is also added to represent SoCs which do
> >> >>> not expose a "notify" channel as part of their TI-SCI spec such as AM64x
> >> >>> or the AM62 family. The newly added mboxes are made optional by keeping
> >> >>> minItems as 2 to remain compliant with existing device-trees.
> >> >>>
> >> >>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> >> >>> ---
> >> >>> Changes in v6:
> >> >>> - Added ti,am642-sci compatible to represent SoCs without a "notify" channel
> >> >>> - Added new examples instead of editing existing ones
> >> >>
> >> >> Why? Rob asked not to.
> >> > 
> >> > I had followed what Nishanth had said[1], I'll wait for him and Rob to
> >> > align first before posting the next revision.
> >> 
> >> 
> >> Existing examples are fine. There is no rule saying you need to keep
> >> updating examples or keep adding new device to examples. If someone told
> >> you about such rule, tell them to stop inventing rules...
> >
> > As I had responded to Rob (the reference you posted), leave the
> > existing example in the binding as is, we do not need to add new
> > examples either for each of the compatibles. We have enough examples
> > in device tree now. So, IMHO, just update the binding.
> 
> That makes sense, I will remove the new examples in the next revision.
> 
> Though should we add the new am642-sci compatible as well or just
> re-order the one for ti,am654-sci to ensure we can handle the AM64's
> edge case?  Since, the added compatible makes the if-else chain more
> complicated than it needs to be.

I believe Krystoff already suggested the same.

https://lore.kernel.org/all/1844147d-543d-4739-a1ec-a59f8a4564fb@kernel.org/
"
Move the notify to the end, so you have only one common list defined at
the top and you only change number of items per variant."

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

