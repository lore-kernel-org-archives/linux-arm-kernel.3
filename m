Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B9BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 06:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3bZ88C66V6HFKhaWI5jy3JTUop5eLI3MOR7Pc6VePI=; b=Vk6Z/cS1hQZ7/JUqs6Dv6v2SL2
	QlJ14EcJY+3cHAKt2GWBm0KIgeDtZDlJhKdD/AaKau+IVPcySia3h09c2Aj7OhWqMayrrTM3VCrCw
	3h+CHqLZGAfiIQuvgutkyVUTTEsh+jgwiBIHlR8ZY0d18dxyquD4gc9Z8ntkDCLNMr0Z36MhhdRqE
	649Wd7W4zS/DmjJD4S56QlTASbkCf1UuP+PjRFsIBzDBraovUnhAOaF1+T8pPpgrDZy5F2yT7fUbl
	5gaEyOPZC2plXdyOr7Va5dl2VRLjNHa2Y4M3Fg/ohR0ny5CrfhpR10h2NGZHFBATp84VtCTcE7vhj
	xDD2fKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLYb-0000000GOde-3E2U;
	Wed, 08 Jul 2026 06:14:53 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whLYY-0000000GOd0-1hCe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 06:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuoNlP2lnSmN79zravD+PDF0pR9eysu+++JDXlK3+G2e7u5DEwwTAAIna4qEqS1PbcpJjwWhKs9P5wmAHUf9YodjbvSTXhVYRKtaEpNj0oesYICwh3786iPCvoheQUAZhql2K+WEssw9dn/7ylVmZGJ4bv9saUOYj76bTiXeFgOs5mQO9fPYFqYUCbaWrYODV/gYnP3COXj7b1a4geCpMjC8xsV00z8kirlz8/G3OAeqHUkrVuVUbhbasYaJOD2T8I52bmPHJ9Hg1qcPcQqO3cTXM6WNTxe4NUGpEaZ+H7oOynEW03wYwDVnvoPRfb84VybYJm4txiaaKFYhTX7mlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3bZ88C66V6HFKhaWI5jy3JTUop5eLI3MOR7Pc6VePI=;
 b=H7olsI7Mu3NiUQPcKfzi2Eyx6nFnuaiPP14s56qzBc2kEUcsAIzFx1bdZDo9F1eqfkDne4gQ18tbQhHRSIwO/Lez5ADatHXoBioTQqijDH3ckzoHtVOSjOzQzD4BmxYYYazho+JNfOpnko7a6wA4lajqXAbZdvKLGVK1tBjjv122ptK4HkhvcqOCIhGQx7tZPj95DnpzH/HazIysYD4lWH7nWvVK/yDHieA433UiOiPWaaBjcxbGoBiVhuy6MVu1qxv00CXwFKurxs6ehy/zAcwgdjI08mPv86DQFyKtW0/MzvYI2mjGoWjFbZ3465/kyeLf7mfw9wBHgFf+pR612w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3bZ88C66V6HFKhaWI5jy3JTUop5eLI3MOR7Pc6VePI=;
 b=cOd7wxjIoJNSTK2pTjufGKF9aGYe4MCmz/Q8r/pS6LoAf652yoFl8d4JrLNG2MHMe3oJZa23zVCIpX9heJ8z2sC+H/Z9wtOfIpz3FlVhgrw+72s80mFUFED2UrtOu2yf1elLNPw1zQdcEXHYL/1GWIKIoye9MC57v0BozSGY+YGhWfxXk4yCKEOc36WhVxffCQTNoBTaSyV8WV/m6mX7GxaRf7nA6+7btEEIHLGU+fFFZSqdVMQ8b12aCMsx60wco0G0Atj0KTKmDYVXOm9XkCRINzKecGfv2q9elWHmRTaygrU0XrlnNy1piB4LIpi7G4gDR3bpja6UiPV50ilymw==
Received: from BL1PR13CA0191.namprd13.prod.outlook.com (2603:10b6:208:2be::16)
 by CY8PR12MB7564.namprd12.prod.outlook.com (2603:10b6:930:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 06:14:40 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::82) by BL1PR13CA0191.outlook.office365.com
 (2603:10b6:208:2be::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Wed, 8
 Jul 2026 06:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 06:14:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 23:14:24 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 23:14:21 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: <sashiko-reviews@lists.linux.dev>
CC: Jacky Huang <jackyhuang@nvidia.com>, <andrew@codeconstruct.com.au>,
	<joel@jms.id.au>, <robh@kernel.org>, <krzysztof.kozlowski@oss.qualcomm.com>,
	<conor+dt@kernel.org>, <andrew@lunn.ch>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Date: Wed, 8 Jul 2026 15:13:43 +0900
Message-ID: <20260708061352.2885386-1-jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706101526.2556226-3-jackyhuang@nvidia.com>
References: <20260706101526.2556226-1-jackyhuang@nvidia.com> <20260706101526.2556226-3-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|CY8PR12MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: a8fecfa8-5edf-4bc9-c484-08dedcb831d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|30052699003|7416014|376014|11063799006|4143699003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: CtiOzK3IWcQlLQgENkx5Osi+eI0qD/DfNWQ74UEgFTcBWTr/FY4eJFQOy9iMNvTg7hCuAEQrV33whNGXfdbrxwHqzjfONDAHalBLmxI4BZercDBfpvO3v3ilJr1VKSMTcJ/KLRliCm1LrwUAdgYT5Gz2qqBD55nGLbdBuLAgSM9gMFdRlRRhNrproejaSizJF2vHHnu9UV/ElZQNs4bVwk+MgrM+tK+5r+PDs1vnVTy8Q6+6lGQPHNuUKitw6qqGbQxd7o6JhBc0o13KslI2EaqlrS4oZbNIWUlUHOZRjcDh8RniBRI/Vxw3R1lSsXMN7FsB2Zsz35C2zITGXeg2DACX5e81/k2UkAW29+RbgwNOjF+SNMdkTgxAyEkQzOpOQ0Xh0AhU/GODW9YVBmjSP1ni+lSf1KLzNoIH7RvHN/b9NA3ll9L7SB3Ocj1okz6kJ9sfROaDggrxHETotDmW3IbHDMziRz58IoNTJeUmE2GxixdIPDcIvGqCVrv92mcVbaK+Km/hr1dc8uuy4q3PSf4ek7R5xkm5Q21Z7xjKnlYp77sqam/iw06RjtfEX1kQNTbe+Mr4/W+jbiFrCRm0xYIsrlLL0R/n68wQZSMmN+OKFp6WzxarZfYECUt43hNe0zgImBVsiWeuoPqd8RV/EgwS+J9lrpV1HTSMZJWYTP2onCSlESqLWLDFxsr03zL4ZP/y1lhLZvAmG/OZryY9vg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(30052699003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xdZ4R90iNcYQu77M2arQMfjBukuw3DjblNZ3P/rlgXwBQiRYrRLCIBZkfUKdnhqVsRJAbfZx/mIvLQ3rE3UBcjY8hS3Li1raKTYg2NH9M/mvUDkCo5MlYZWYsx05bDQUINYSq/lKIVUt/jG23uwwyC/ZZDTmX/lE9/J4gK2sP/ADNFKEYG/5tBgf0hI/lkvUNjel4bYEdUJiH3hQZbN0hrJ60nP6MEaepkJbx2oNQGdWt0ZalM5lX2LkUMiDqih6YDbs00vk8grBE7ru8a/BwGGJxCYHUv9ubmBlkHg0XyuCIdySAeCLFkiWMWtJFGRrJY8iHz9Ja4O246W3mVdEns0JLiqGZ5tGgmF0dgjge6YGoUFKD/yw+M92NupB4XODmy3FYnkuxxObAanVFDVlBxgKosum99ChpD77a4TezhiU+IvAGJpGoTW+zn+GV71M
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 06:14:39.9617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fecfa8-5edf-4bc9-c484-08dedcb831d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_231450_538898_CA5AAB9E 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Jul 06, 2026 at 10:24:00AM +0000, sashiko-bot wrote:
> [Severity: High]
> Does this incorrectly nest cp2112a inside an interface@1 node?
>
> The CP2112 is a single-interface USB Class 0 device. According to the USB
> device tree bindings and the kernel's usb_of_has_combined_node() logic,
> shouldn't this be defined as a standalone device node directly on device@1,
> similar to how cp2112c and cp2112g are defined?
>
> By nesting cp2112a inside interface@1 with reg = <1 1> (specifying interface
> 1 when the CP2112 only has interface 0), it seems the USB subsystem will
> fail to match the OF node to the device. Could this cause the
> gpio-controller and interrupt-controller properties to be ignored?

This was already addressed in the v1 thread. cp2112a and cp2112b are
NVIDIA composite devices that expose 3 USB interfaces, so
usb_of_has_combined_node() returns false and interface@1 is used.

> [Severity: High]
> Are the properties for cp2112b also incorrectly nested in an interface@1
> child node here?
>
> Similar to cp2112a above, defining this inside an interface node rather than
> directly on device@1 could prevent the USB core from attaching the OF nodes
> to the instantiated devices, silently breaking GPIO and interrupt control.

Same as above for cp2112b. No change is needed.

Jacky

