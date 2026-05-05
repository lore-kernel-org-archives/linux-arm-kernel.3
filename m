Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8CEFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Fl7XhYPv1HkfDSpIxXCPR3XjtIcoEb7yD43Q5Xn65Q=; b=XMb5qQqiaXJ3WxROe6vvt424fm
	tzTxUANFTmLlXUs1HUe5ooJyC8n9PTdR1SKSmUKCgqTtEXm28jCt6KUKDiSgoI/IYL0vbCHorG5Z1
	U0NSxryxjwRRTicCcvH95gMsVT6MQ/NRuq9xmmo3V2s5AjeArbqfcXBtGwQSNFdGYI6iWV613/ZoS
	YyTLF9tOTyNvBg+kDCV06DZoom1gkeG/6YCM1jBgpWgoNgG4+kQNBFG6cNWbkKMTgvTQZcIsAtyvk
	ufYIPvwtahtCNZrII2vpRlXjCBm/Mx7kA1ivzkbcRbKLgtQF3EW6BA6OwbXw7czCeJF81CvJOIPPD
	Fo3t2ESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGMj-0000000GQOB-0uG8;
	Tue, 05 May 2026 14:03:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGMh-0000000GQN5-1SRd
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 14:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4Fl7XhYPv1HkfDSpIxXCPR3XjtIcoEb7yD43Q5Xn65Q=; b=cEfMxFcVK14pJs0Avd1uEnmokF
	5GEVCPzDpw/se87iwd6PuY2iA5KLminB5NbPE+uTLQmR+wAt+GTYZV3kZS+CUW6hS0x+VVgGeei+6
	9tB4zbzfFdG/hAUlTtBtsZhpqHbbJfvKFo5NjcG5LQwAOC5d8qVajgl+7WMucZng032t3+QhDb5g7
	AIFaMkgPZ1SlCsDUgBs27eZdageDgANuFiiUI2+L6OOI3emFPnIvuyCtqxGOkp0mKAHBkcnLDLfMP
	jE7FJjtOB+LNVWtAb9hDQfNDkr0ALzVH73R6t4x1wqyBlwJf/tXGV6o9g/mDURQVBJuKkcTOLc67L
	Bbz9MYOw==;
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGMd-0000000DiGU-161X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:03:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwQYXXGGhIM3tIRVp7Q6VtIYju4T6LeDD5i3pmZTuvjdgIbOkbqvJ27qFvdwSvOOA7GrERaTX053+VDCuIYq/Y0917JUfkB+tuGKvr8Gb7N0yDkhagGYAnEwKhqb3Q6Hh02f8ZSn1jQ+KimBQTF7zERKJpv+nJLV2d5P2eRwmeL6uWGAUYWIQ2IQp2u7RaPdT+ovx+x+NzYa0Hlfw1fRwdctdawe9k5CbyKYirS0VWHApAx61Yp111utaFxIKdt/5bKlc/+9R5N2rMZ2w7l+Up7ujS8x0cBNymATxjYRorcB6Ti2ezu/gedlDqn4nCBJdh3y3I9GcQKEynXWjpKlrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Fl7XhYPv1HkfDSpIxXCPR3XjtIcoEb7yD43Q5Xn65Q=;
 b=ma86ZaJRf3hxcww1v6pOJfIR1jy4ivvrXKC73m5lIwCKYP9hE0p+EVNTPtj7H+14G0C4EN9Cx8qV8V3XaJ/6ZDalACC3rYGvr86k022MHQ/ySIYnYOjdbADxaRmLDH9+GsMojW1GffvIWlJcim6QWvqriQ+85JsqBUFche+C3O0hRguaqdQzwIR7SQyZyhK2FBCw0o95hHNcIcxHtxB8vXYA7nh9d9KxzMMQcUISiS961ob8/SPJhuZh3wC+BTrZPZmKQfxryOmoqXxpUj/7vIostDgb9dR+OG2FnE1ud4a1Bsxkfk+TXXTUhMUql6j8JJYIF36GgAIDEfpKkSKdTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Fl7XhYPv1HkfDSpIxXCPR3XjtIcoEb7yD43Q5Xn65Q=;
 b=J2jHoR1/NmlCplx7SkPIH6UIK/g7aBl6KUZk4yIMQ/i7J1PuokibIHuWheONkhWLkqN+Xb45jr7ye8blrcT3aFTDP92X5ZCtmRtLX3pwJYYxhju7Z9GY3lXeU2Ysqw/TjMfUysPlcBTAKL1y66LO8FGUHsUVkUN/ZuE6w2zWoDo=
Received: from CH2PR20CA0029.namprd20.prod.outlook.com (2603:10b6:610:58::39)
 by MW5PR10MB5690.namprd10.prod.outlook.com (2603:10b6:303:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:03:00 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::48) by CH2PR20CA0029.outlook.office365.com
 (2603:10b6:610:58::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.27 via Frontend Transport; Tue,
 5 May 2026 14:03:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:02:59 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:02:57 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:02:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:02:56 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E2ubE3108552;
	Tue, 5 May 2026 09:02:56 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "Thomas Richard (TI)"
	<thomas.richard@bootlin.com>
CC: Nishanth Menon <nm@ti.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>,
	<u-kumar1@ti.com>, <a-kumar2@ti.com>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram property to PMIC-B
Date: Tue, 5 May 2026 09:02:54 -0500
Message-ID: <177798976638.338258.10253070900100713533.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260429-k3-j721s2-som-bootph-pre-ram-pmic-4c-v2-1-31a0e7677216@bootlin.com>
References: <20260429-k3-j721s2-som-bootph-pre-ram-pmic-4c-v2-1-31a0e7677216@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|MW5PR10MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: f1511715-64c8-4f98-46cc-08deaaaf03ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: nYbgAZp+cyAekilAn8SQ8GrZQXPh7saL1AIUCMaWdKA8FR2F1eYVU7/Sjzr9SjlWryUrGMK847Lwrf7p2R9yv2ESgLZwcj+yK+0N+4/rWZUyiZ4/bhzij1Ra/hW/VdSZDS1cv17qurq1K9IJkA2PkpQGQ7/uPJtTZI8RoDpqTtVuzm2M50Mc+p/ezFJNNHMM/L+UVjOnhgDTvfEWNC5bwhAI/JCQBI/AloMPwylImO0Ks26tHTPce/LVYAud/dqNFmiUdMsztSuGdAQQU4zX7FjVe/CLioDUyWZ6VeIoHRE6WV8wHK+Pfd23g4CJXLwvGBgAT7CgJWsG0DEk+8PYtV7vWpNFguQMafXdhXwCzTbnELV/SfDgmAEmOKzyrLJu1BrGYUvwVYDzHmlnrzMt/gT+ukwPQhzwHVRtwASOtxusznjrmC/Y6yVTVTI2LIOS/GYzpjsUfKlD1JhbDuFEQtCBvS20UypVX7adJ2yMo5nfbLkrBtb15DkZVrXsQ1l1s3fBmHN+BQMcYZ/LFk34LMKmWhLEOuAW/el1R6dvZO5n6VLkUxeun1qQkdEguvp8Z9JbzHyB9po8i8BuoSXYFtw+xyCe82/6NoUGThN5au2oetUNhfMaNaeG1UHjYDemQLEU7XYIXpJez19/EGjnVrxbVWtRir6OVTcfyMCqeYQJvLzC0EmxIUG3pLbmJnaymTkAum9VEoow0f4o1kp8uldVc/1mQrGDciFSbjuC3M8=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wtgPuNpAQD787eNUmauDJ2NFUdaPMb56dnX0Eg7uv6BRic5VQ19o+f7pYyUMv+l733fV+KB+cgFg3ANPhmA1s+k72k4p1bawJVIeGj5Thxwpy0b0FuwDW+fBK8Hs11KlKXi1+ZUP4fGQ4ZUY9GUSmkd+2dISbiTAmpmALKTo9DG9dExqj6z3Nuwyop5Dq3+93y1v6xRdjT/OcoctRJSzPIK4ImwAn1BHWJo75WF9joJfm6rPlWmwH3Dt6E3UPRcR5WrWI43pou/Q5d+UAGyoSAWx1ybqUGGwvfQOBpsZcebmvbyTicO62+SBnI0d3Z7DcB9QHYM1wXQUimwTtsTXg3cC9qWnrp9TEf3R/bJAUF/VpzgtYf8yJdg62glKQoH3bsWa2/gLVGiT2qY0gIb27MvLOOTJ/ePKXv5rafc/GDCa8gxGx/hkdF6sp8sx7mLy
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:02:59.4206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1511715-64c8-4f98-46cc-08deaaaf03ef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_150307_442484_7287E3E2 
X-CRM114-Status: GOOD (  11.91  )
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

Hi Thomas Richard (TI),

On Wed, 29 Apr 2026 14:19:48 +0200, Thomas Richard (TI) wrote:
> On j721s2, PMIC-B is needed to exit the DDR from retention after
> suspend-to-ram. Add bootph-pre-ram property to make PMIC-B available to
> the bootloader in the phase that sets up the DDR.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram property to PMIC-B
      commit: bd9fbe2781993259ea9241be7452e1355ceffb87

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


