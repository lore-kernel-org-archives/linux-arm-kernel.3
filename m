Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84736F3D5FB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpMIWxlgywMEqLQv5zSVQimAvUIfI6o/TiivW9uj3tw=; b=ekGfhDPYz6/yfCQs0OxR7JSgBp
	x8XvouUXKKrWhWYUVDwKON1ks2p7QSkQ0lkuTs8AF6pVwjKShrNVp+WQy/QANuNlqRjoxZxiCUm8L
	Mz8sXD9YauTaPRETkBWR0pBafPN03yKkncVMv2mcftgoY78Pj9u/e8Xk27jKgcXGEgysql7sPoe07
	YI5gS/1fK/rs+Vq4Gv8YWrElQQLTuOwwgjq3954EjXBc90djx7tySJxy2RUDrUkjP3GMywtjumFEX
	AlV8t8xwbvY6/jOG1dKOSvQKi3LpKUSrP7xtjFq+H3vY6Bdk9+KG8ppf1VMpSwqOc1928kC83TPS5
	lk9WqNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rRP-0000000A1vf-0QIV;
	Sun, 29 Mar 2026 14:48:39 +0000
Received: from mail-westus3azon11012016.outbound.protection.outlook.com ([40.107.209.16] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6rRM-0000000A1v4-3ISr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 14:48:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXCeus9+2inOQVcpRiKrBeKONMJn4IMinx2awRX8IN8AYS/OiGM1CXPvgJ1Yv9inSy8TFhewIC+Z84yRKd+5YTSc72vDG31KuVjK1KQdyCwzNARLziTrmVJDAz44Ng7zZskFYtAiWYqKH39pECiLyQHKaE40vdsp+iD+klH+QJtcCgZbZv/W58SIGzp+HoCTLP34WOhW+w0aRTJYmouurHbdajlQC0WyvmFQVi2Tutmj9T/v7YzcaIE8v89v2vDRVmUIQQelsexyPKExmf09vOAxVN8M89a2wAxVNNHkuiLJp5WXBjqNpVX6iKyNnD26yRG14Xt3DTVGkG/+hZsV2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpMIWxlgywMEqLQv5zSVQimAvUIfI6o/TiivW9uj3tw=;
 b=Aq62DyD1JGALhcF/SUP0DelaVPHCS35tHRhu2yQLAaMUsZWXPMVDiPfsA+TEl/vPvkBFJ9qhrZeDn6PuFHKRfP7/uS5LwDU4C6VBOFPhWY8+BjzrofrbdbSBwmCtfViKb3a6W8IkbLgoeYGZDQaPFFkBYXpW8PwoLxsxAxwdJkDbQ1doYbaWru95tWkgLCRrFCNr5hveQVcSCAWaWEqIaZ9NIeRLvPgenpMRVoCbiMmeUfgbBiZKrt0V0Sk7BZ5qtFuXIKWJ1HKVMyiYNNXq+5CZm2xjfFb2vGiZ9Jfb3PBA9wY6ZKkw3OFwYiYccAJU6kgrWF8dRJiunMsNUbf2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpMIWxlgywMEqLQv5zSVQimAvUIfI6o/TiivW9uj3tw=;
 b=GfRtqn8g2q6H+OLVzPbzspOXPeKDdMoCKmfeht8RRokAtpjZ0XuktwMXoHra2kPZc1YI0F4EWkgorJOlOMJPw8bSfyt7eWQEgJfdUqRxLOM3kpPdql9nnhpX74LNjQ5EkG6uZPWL/rPlrbHtTNIR/Yg/tqyBr0qhg5LvHCtz0E0=
Received: from BL1PR13CA0373.namprd13.prod.outlook.com (2603:10b6:208:2c0::18)
 by BN0PR10MB5045.namprd10.prod.outlook.com (2603:10b6:408:116::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Sun, 29 Mar
 2026 14:48:32 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:2c0:cafe::8c) by BL1PR13CA0373.outlook.office365.com
 (2603:10b6:208:2c0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.27 via Frontend Transport; Sun,
 29 Mar 2026 14:48:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Sun, 29 Mar 2026 14:48:32 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 09:48:31 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 29 Mar
 2026 09:48:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 29 Mar 2026 09:48:31 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62TEmRUS3261270;
	Sun, 29 Mar 2026 09:48:27 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Meghana Malladi <m-malladi@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <srk@ti.com>, <danishanwar@ti.com>
Subject: Re: (subset) [PATCH v3 0/2] Add ICSSG0 dual EMAC support for AM642 EVM
Date: Sun, 29 Mar 2026 20:18:19 +0530
Message-ID: <177479566270.2177634.4781035540543493303.b4-ty@b4>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260311053852.1034244-1-m-malladi@ti.com>
References: <20260311053852.1034244-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|BN0PR10MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: f14e52c8-ccd3-4a0e-e420-08de8da23f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Ln3DxGl/do28/YG6fnw+EcI89yKkF3fMShwL8muCGTXtUQDjeBpqVAeLZhtLBgpSYaJCUhOwz4NZmV/4j1dMaJpYrbAqU3vEwil5/lwjGFb3+esbxxmCr8w9HFaiRJkhuS9yFf42gNqK7NnZ3Q5ugoG4Rbd8yXSg4cv/nFjh8B+hStZDjsJ+/WGXXX6RvlmlPtvhS5JwcV4ApCfdbvMhsOu8RQPb4986W4CXjdRe/ct28OJkSu9m3Awd+o0tm2HcOIyeihZOo846nGFfXkic+PKeYxNLXlt490j47oYZZa1P686onVSwPOBfSAUvHKy45CcLQykHfi2uERUWeyJzLykxEAK5i8yYeJ4v9XhFtpwjEVA0pre4eZF931b4LeISC/omK+pGN6UBYgXReMAfU9hY3d1TqTuSRD0itDo8WxiuE6s2vImI1DqWCcptAqn4kxCe8gR+MQnwrEP1Dxm650Q4YhVjW3PFzck0kL1qDJnxyKNqba/kMYmxKCslS4m8ezeK01AaPJpUcANtmVWwuf5mYLLZzAFYtwZrO1TONJL/J+xktYQGoXuHGe2TgfaGKCfVLa8dWR9UnJfQ1hxXCbjXE4472F9S6ljc8hDC9h1GEFHXDatseOtSdbGAAoGS+pxbEXAtgYw8B5BEYvAr1ZwV+z+dBlH/2/BOq1z05wixpiXWxCxZKEWAF5qQYNbPUsRL4RqLxGDy3ZDoPmnW5om/cfv5WD16/RJvrRh+Ls61E/eID/SOZsP7apZtzeSC6KzCZrO6pabAF/mNz2puVA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4J+y6fQJdxQDLhgfHesiywtBzijPwSxPLCMJycV1WJ73uYDWDqgTNWp8U61LstSs2PDZRTSLqB3zbFf46w+Dn3CrcGp5RfW2Vlcq/hVPcWGorz3BmK2lzT54YGhs3Vd4GOS+IYprrBRO9htv+Dp/3uqAVvWbZNsDTEThtg1ZawAvFEqRTV48j3hEQ/6zBJgNZukPu/O7r/YQmbvzoVRhurO7fVml7m5J5Rxeauyvklin0GDbmSlRqMulu3rmxXDZWzxSYvLQAxOr/8W85ZrG9q+pqZn7DARpnIxt4DRoy6uhmrX5mgF59b3fCDg/9wCZ6U2SZEK0NyKwsi0of1rqOX8DL1a51JqhQ3urwz8aDk+uhjMOxH/it+fWhB4oVEC84HBV+47BLgDx47ldniRHXkdITAaHwqg0cnkrFXDWwB6ifYB6moCyIc52F+hfPF22
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2026 14:48:32.0110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f14e52c8-ccd3-4a0e-e420-08de8da23f69
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_074836_824950_1DFEA057 
X-CRM114-Status: GOOD (  13.93  )
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

Hi Meghana Malladi,

On Wed, 11 Mar 2026 11:08:50 +0530, Meghana Malladi wrote:
> This series adds device tree overlay support for enabling ICSSG0 dual EMAC
> on the AM642 EVM, along with the necessary PHY driver configuration.
> 
> The overlay enables both ICSSG0 Ethernet interfaces (port0 and port1) in
> dual EMAC mode and can be combined with the existing ICSSG1 overlay to
> enable all four ICSSG interfaces if needed.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC support
      commit: 8bafdf5dd89b961b698d8bd2cfcebc8e4d3764fd

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
Vignesh


