Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737C0C79FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2J+epp5AvZfa5OqY70gHUXlSNLpDer+LSF5S5sfE6I=; b=K+MCCE74bzxEdbXSQH25SIDRDu
	GWBjd6DjGDDi2Px4YdxB6zYMneXMGoxiH5eGbHaOr5wkE5KTHyxDdSrYAkzcstaAOJVq51q9GA2Mh
	lxALH6GUEemONjWiTRI6ZxKUU47Wo7u0kcjUC5IUDbSoHXNn2mmsTyzDqIO78ixZ2SisjT/EYMLHk
	eMgjrJyXMm5JVqHQONRii+gKy8Xfu2IAcm4ZmA2thi2DzrUbKcaDW0p+7kZyT2YMB8a4FDZiYs9ks
	ga+wNH6qB6+qdt4q6ULg6+x32fz3+F9MYNKW56QiyHE8Tqfqh3EvtYc1CWX48UFKq/p5P4veeSRxc
	rkYPiHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpjw-0000000BwZy-1L14;
	Mon, 05 Jan 2026 18:55:40 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpjt-0000000BwZD-15LR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKejSlqT8/GDKDL1UwuGP3FrasTVIvvbjiWf6Xd9AwtMbm5ozviZoBPFFs3YPcdri+DzTj7x2wwolCntF30wFRXiyzKimAjNnc8i4fDTu6NF7rsq75VuHhgRS73PZH2uD+yCK1knYIiWp611D7mGlSXF3XnUPYc6sLxBmgmyIxApJ+vdpkfJEHrJjRVVu6PmSlXcLE8xZuIJuY2JaSHj49eUWcBwIdpXLx8a9auw6Xo8/MaqMWkBLx+x/x7qCelFc/kp1FEYNgT6TYU70msGFhPla/nwK+ol04Fn+/EU2HzZplIO5Y/RtWLh4388+eQhnHFqb6zlesZfv8s5dveE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2J+epp5AvZfa5OqY70gHUXlSNLpDer+LSF5S5sfE6I=;
 b=W3C8f6exyI+C0DYuriPru3YZFdUx1zSrBzeQQAQjgKXKJq5RYNpH+1P9G00H2QbkjPUxAL+hHW5yrUkENXwvId54geZ6tiSUpIIrjjqa0wyKckJKbW84rSlwyi40hMhhGChluHIOrhVqK549VkZGFcSGkTuDXWQHKDqAIwyOY0utIF6p695XUmf8cBv4vUl3oeSG+8D0C8O7xzGKqIt5TWfJgDvxF87Kkwinjro8t5xzqWyhFcnI24lT1mQKOkBrJ4zip4eCw4ReRfz7M/4X8ufL1eQJsS16PMs41mdnl9lA+1QAX+dgjLg9rTZayRuh+rwjs6aMjVl/d/WdawS9LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2J+epp5AvZfa5OqY70gHUXlSNLpDer+LSF5S5sfE6I=;
 b=CVxIo8LTUsqz3W9wyEsV6LiTaS0r04HM/1Oc0zuzYdncUHRygbhP2rj/GWPEIlJok/1IJ9BGmqSUX3JXBDXS4nJ1ADHZeQCaWKMIo0lA9xftC3kQ5VR/iaE0JDTBAw5PMEbh69LQhon5inE+BH5Xj8hk/KCksWyLhTW0GDxEFYY=
Received: from DM6PR07CA0127.namprd07.prod.outlook.com (2603:10b6:5:330::28)
 by IA4PR10MB8279.namprd10.prod.outlook.com (2603:10b6:208:55f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:55:30 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:330:cafe::51) by DM6PR07CA0127.outlook.office365.com
 (2603:10b6:5:330::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 18:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 18:55:30 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 12:55:26 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 12:55:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 12:55:26 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605ItQlh1750277;
	Mon, 5 Jan 2026 12:55:26 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: Minor whitespace cleanup
Date: Mon, 5 Jan 2026 12:55:25 -0600
Message-ID: <176763931245.635707.2697464462490524016.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251223152535.155571-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152535.155571-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA4PR10MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: 4433f33d-1063-4e25-a231-08de4c8bffc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2pDWUtrRkZJWTZQMFlPdmkxZGZwblVDTWdzaHUwempQQ09EQkFLdDdxZ0pq?=
 =?utf-8?B?aG5MT2M4ZzlpZmJZVXo5Z0prZG55K0tPcHRsdHJPUnRNLytSR3BicksvaERY?=
 =?utf-8?B?OFd5WVk4TVZkci9rUGRkSWtWWDhPc0hJWnpmVnJ0Y21DUmpNdkZnc0d2T3Rm?=
 =?utf-8?B?UGJvaFQ1amlyUGtPTDhRSUFHTFgrZlNQV25xUy9WeTJ5VVd5dm53ZVN2T3JR?=
 =?utf-8?B?c3FkMnYwT2tBbHJ6b09JZlFwRmVEMURBWDFETzRPZEYveVhpa0JWdFRNMGlZ?=
 =?utf-8?B?RlVKRUwzRlBIY2pLQjhjVGhRZHlZNXNVcGRaREg3b2dkb0phb2JBYVd2Mll6?=
 =?utf-8?B?RXZHMHlMcWFPZXplMzl4VHV0dUxXQzBlYnNSQWZUQ3RLVVd2RzJJdXNRVGhp?=
 =?utf-8?B?K0VKeWQ5VnJiSTI4Mk9WNWhXMEFoRFJEZ0R3c0Q1WWUxRzg2M25XV0p2U1cw?=
 =?utf-8?B?Wms2dmxXMFladHdNbDFmaFc4M015MVc0cEgyU2lia1Y1aVI2Z1ZkUzROWXpx?=
 =?utf-8?B?YlZ5TlhzektHNGNwVEpvT3pUV0dUSXhDcVVEK2JvcE5qNmJadmQxaWV4a3Vn?=
 =?utf-8?B?VHZ2ckgzcjRSMXhYWTBRbXNReUZabUxEZUdOcEZIa3RyY21DSEtUbHAxUEhO?=
 =?utf-8?B?UGNNOFA3S3ZFaUtUZTVZUDR1dGFJWkxIKzIxTlRoNmRzQXArY3A0NXZqWSs5?=
 =?utf-8?B?MEM5cytRTTN3aThxMVdaL2V0TERnaXBRM0xUNEpWZDBxNmVzQ0dVa2ZNSFpE?=
 =?utf-8?B?bllOTjRXQjNIdk9sTjV6VDJabStKZ01rSjR6UThDNnRTRURVbHRIeVNITzNX?=
 =?utf-8?B?K2NNZHkrbC9JKzBxazY5NHZRdFRDRWpYNUI0cnc0S1BZWXBpOXFJZm5FWGZV?=
 =?utf-8?B?M1NxbUtsMmR2ZXR4ODBoRHMyMkt3SjRNaFoxR0ZVRlN5cUgyQmhNMWEzOEgr?=
 =?utf-8?B?MlBpQ0JMN0xkdGZqL01adzFMOEo2dG9LcGhRdUJ2TGN5Z0czdmJJL0ZrdUls?=
 =?utf-8?B?dHFRblBjYWMxSk5lTkY1VmpQZnppdWNXcHE4d1VRK0JsY1lITWsvNyt6U2VF?=
 =?utf-8?B?VDYrZ2orZm5zbldzaGhPNDY3QWpla0laTjdTWGNwYURwcnFubGlSRXFiZVpS?=
 =?utf-8?B?U0hjY01Ua0dzZFBmS3laVVhlMXlkdlJYaHE3UjJJdExNNFhCaVJCd3hCL3ZK?=
 =?utf-8?B?SnhiOTBKaTlSM1I1VXBwMkFwN3YxaUdSdW4vK2xwZ1Z5NUtwekd6ZzN3eWpM?=
 =?utf-8?B?VFhzQ1Zhc3F3aHJMWlNiT0xxRWhxbnpPamwxVWRDZE96OTF2ZFFWdnp0S05T?=
 =?utf-8?B?MUNxVm4yU2xBNENYVG9VQllwUGZ3NENKT3hTK0FjQ3RtYjZ5aFFic0xxbk5Q?=
 =?utf-8?B?OGp1VVN0UVNzQVhTYUtGNHNaVmdOOWNkMXRTVEFSVkt6OFZTN1B1RVVPWFdw?=
 =?utf-8?B?SlJrc2xGN0dETzFsckdNcFVRcHJhVDdNcXV3Ri9PN1RKZGpYc0lyMXZabDhl?=
 =?utf-8?B?NHdGellZQ3plSks5cERQTmdFNklUNGl4aS9HYUVFbUpDN2pDRElVM3hBZWRN?=
 =?utf-8?B?VWd0T0FORWY0TC83bWdtU3lGY1FvNGpkNVo4aEptakZhU3NQK0hhYkFZdFB0?=
 =?utf-8?B?cndOWVNuVXE5Z21kakdrZlhDNStGc3NDbUFJaWhUS1FNbHNzRjVmNmNPenJj?=
 =?utf-8?B?R25rYlNBUTJMZ1JQZFQ3N3VCZ2tadDRzNk1sWmx4bVR2NlVjR0RMZXRWMFZ1?=
 =?utf-8?B?Z2NDOXlqbXQwKzBBellqSkROV2FNZTdKdzNSUEdvT1ZRcmZxZGtNUmtuQjB6?=
 =?utf-8?B?OHJXOEFmRlFaQ0d0SllBOG5DQWg1QjlLQTRFSzlXYWx1VVlWL1IyREhZcXBY?=
 =?utf-8?B?QzQwZkFqOHkzK0tSUGhTTVM4SlRqejBNN0g2NitDdTFJaEIzaEFEZE8xT241?=
 =?utf-8?B?MEFrYXVOOG9Ga0l0NkpQalE1UC9OVzQ4YkluNmdQRU1Fa3l6OVhKU1pJa1Qz?=
 =?utf-8?B?L3B6MWdJQ1FkdWs5U2ZrL0M2VkpxbXNRTlRLNk9Cb1RLamxESEg0eXdISEtW?=
 =?utf-8?B?WGlHdWZuMkJ1Zmd2MGpGRDZGRW9IeUhpVHZpK0FxMlBhY0xjQ01ZTTUyUjhu?=
 =?utf-8?Q?3m+Q=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:55:30.8039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4433f33d-1063-4e25-a231-08de4c8bffc7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_105537_318342_D38D47FA 
X-CRM114-Status: GOOD (  11.54  )
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

Hi Krzysztof Kozlowski,

On Tue, 23 Dec 2025 16:25:36 +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space around '=' and
> before '{' characters.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: Minor whitespace cleanup
      commit: c84b6dc36b2f81b79145459a9805302fe5e658f8
[2/2] arm64: dts: ti: Use lowercase hex
      commit: 234a884d67fe3b5741481e6991f7ccf140c206ae

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


