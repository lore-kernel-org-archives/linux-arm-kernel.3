Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FF2FC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=waAdU2fd11VjWFtuBnc4765v0whhaqV8peKb/HVBD9s=; b=xsOIaeGcTmRoLYcMgVeeqkN+0N
	1PnLavgyz0Q3jJC8BFE066a7wu1dio1b+PW1RiyBiwiqylUovmMZjRC0tciFC173iz9BXai7OO1fT
	W4V+HsQZXXmF+jAZ8OhutPtj0rgAbMwsBtho9TAfVpRiz3mNgFsRObZQ/G37nUJ1xZCcFUckR/H55
	5fwSWkVuftRTpsh7tlKSNjyUrZj1QaO4FnO+zqMlrx8vVOl3Dm1mI5QsfN7L2SNw49Pandr7D569p
	nm5O++xs7YM3qU4bPImJaWWdZSp/9P+t9z8BgdY7KPgLqUnEXpTFNikEoavAoeNhvFI06OM6pODMG
	O5G5yN8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXVN-00000005lbb-2CuL;
	Thu, 26 Feb 2026 09:17:57 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXVK-00000005lan-3Cm4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 09:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWXGfGYKCYKbXTZ2lqHq3xBfPB/lQXojuLw9aDPDWFNVRO/9D/PeYQLAdLdd4Y1X/DX9FVfb4zZCPg9VV5izIt4BVYAEhiviDNoiCbZ7dC2iba4S/JEnrns5eI/rW37GSe7S8shcP4hnEvikXYis+FULIjwGePyztfJ7lVbuSlggRDArgefS8bs0G7TfskBHYERB0Jm8lBW4XUDmjrPQQNp98WqTVNyNt3bYUtq9vMp4sM9YP9bTo1I6BNbc7UkU4TUi0c2V8S9oWScCenzEo/FLaRAuBuZQG/2kUMBgIY2gXgO8jTtN1MDdTYHZSqlPJ5SN8E+bZpREyM+eZXV5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waAdU2fd11VjWFtuBnc4765v0whhaqV8peKb/HVBD9s=;
 b=zDj1Otoqc5tZjJrY/OVeyZE9I0ocpzAYqppcdeT9bvt66evZwoHN4NQgxA/6ZJgQ32tmomFG+xit4RNPEV08tA3H83Lg0aM+ymajhxDmH9+ZNb8X3vyUf0+sTFp7jP6VcCInLkVXJbUVbDrAyzduTmqC5eIxsDm5FoQEW5aYFt0RTqTDOGsD8cid4RQckemyo8CX5ARML0kRm/Vvnfy6Gq7itaqJe8IZjYyTtcnpchtkG3EOGTO92tuI3Z/ohgHwOjZPb7OF+k82riUsQW3KbmnlNxr2Mh3X2J6zMDPu/SDGLOZc84s239Q2T0Uv2y0b0a93aqpBzmy1OnLXhgre4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waAdU2fd11VjWFtuBnc4765v0whhaqV8peKb/HVBD9s=;
 b=rgI4k1TTg1+BsfldE1VIqw0VNhbi+s/KzuB6wJAGIhik1feS8WZjwvjmSAiK6PmK9QgzoHXXHoJXmKACvVrgSvqRU+CLcitj5c0vDCTd5kPDNEkt1/eYO+Of1GpySaMh7Izfa3HiZMuJDibRFy/GDTp4DzkGveySBSXUhKNl/XI=
Received: from BY5PR20CA0014.namprd20.prod.outlook.com (2603:10b6:a03:1f4::27)
 by SA2PR10MB4428.namprd10.prod.outlook.com (2603:10b6:806:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 09:17:49 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::64) by BY5PR20CA0014.outlook.office365.com
 (2603:10b6:a03:1f4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 09:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 09:17:47 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 03:17:34 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 03:17:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 03:17:34 -0600
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [10.24.51.206] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61Q9HVfe2108067;
	Thu, 26 Feb 2026 03:17:32 -0600
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <u-kumar1@ti.com>, <gehariprasath@ti.com>, <a-dutta@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI flash partition details
Date: Thu, 26 Feb 2026 14:47:30 +0530
Message-ID: <20260226091730.2735587-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SA2PR10MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e4438db-b303-46b5-e57f-08de7517e81d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|34020700016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: P1U/4oj6/SghF8EALAow8AZKTSMVaQFRd/P3w6/dHV+A/7n9PcpErqgJrf15rcDbHboaDkKR1iMR3OYRn6kC41SQAREuxDQjVHEHY+hr04GCxYMR5aXMPrqXXWQSSgy9WiqCjtQlKIKfz7oTWTHB0O7kCD/c1RuJ+I0gDuxtKIXJF5YWTi88smbDHFWzzWo9hLgafhQ630/iAsmo7S/PcoElQUQUAXwxLWy+DeUCBcGyWNBByXHqBfN280BSbsKkfcmz5nolALeVV6SPFZEwxomqdh1HtHFwT9kWcIr6PYUDuQeFMap5BJAs4qenWoRZ0UsvyccJN6KIdPB9vNP8EZT77BCOlWpA+YR6hh5gpsYnzvpMy0zopjEqQvekKOwhjQXk7Vjt/pHQZ2Tfg0AmZW+n5oyv/L0hpw4fBCIMCdw+HdbkgoDx+IJGkZSez2f69vZwzyO8q2HQUw7GIVG2XdsBum30nn1X5x73+xKKkoSat0+WaWHT1PBqWJscpEuHzZLolEL745DOC+bQNpgJ/PzhSJKWsCQAUaNfGRoEZLA+qGnEDl8R400S43dV1gZIegOUBSmbBy+dSQh2zuf9gqzrMvy4hEobeGBGPyZliNiiYbh86w8DkxgVzfjKwqJWpOOs7yA9SxlHu/8Ckh3Gh4QYDoAxTLS/2L4IPh5BaBaq7NLmJscVg9fmD35YSiKeJbA8qq47RiqsVlqFJ2EE2wr3p+okNWTKAZqU/8MMq/aBh/SIfxMlhEWFJU9onN0Nx34ck/c/vSnv1gQXIzv2vIoOVIcqJ/Rinoy1Tg0jPc2ks4DeLkUjKhc5I9g6FUpYzBBXyDEIc3WEfBdxu1xvBw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(34020700016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Y/DJJGMjzJa2YA0tsFZDwrTm2UgFo+0eSpHxoAwZjhbkogFN+pI6sP85f6C8SIxcQ8OnN+vl2raZGktlX4K0uhvUmWZ2A1gGbLnx8ZDv8HgYiX4pfCQKTOVdoSidnTtGw67384RkFS7g3X4CMOQV4EqEwJnTrJUSLMr0AY4c9i21gua6F91BpNBoxk/DQ4x/r/etdxSo/LMo+IqfhktzSZ12M7cpBV9wlKV68uQgFg1QWcH4ynkoPYD5aa0MWgPqLrEtPEOdaJezM/SrW2b9h6KNrRvXMJtRt5F4+6LNzfjFcgwap+GjLWIlb4dFd3uYyzKAFIGszV87OiCoTOGme3S9othxeA8NFQc57zjwE163pfXXCd7O6+nfeOjz+pNLO4LwYTma9YbDMVGj2GN8o3ugA8/IUmL17uibwM2xxnsZpPsM2A7T58LuSuQFn32X
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 09:17:47.0907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4438db-b303-46b5-e57f-08de7517e81d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_011754_916111_8D65EEF8 
X-CRM114-Status: UNSURE (   7.59  )
X-CRM114-Notice: Please train this message.
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

J721S2 EVM has MT25QU512AB 64 MiB Quad SPI NOR flash connected
to OSPI1. Add the partition information as per bootloader.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

changelog : v2:
1.  Added bootph-all to qspi.phypattern

Link to v1 : https://lore.kernel.org/all/20260121051855.5890-1-a-dutta@ti.com/

 .../dts/ti/k3-j721s2-common-proc-board.dts    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
index 4fea99519113..1b48294e47ac 100644
--- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
@@ -530,6 +530,48 @@ flash@0 {
 		cdns,tchsh-ns = <60>;
 		cdns,tslch-ns = <60>;
 		cdns,read-delay = <2>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "qspi.tiboot3";
+				reg = <0x0 0x80000>;
+			};
+
+			partition@80000 {
+				label = "qspi.tispl";
+				reg = <0x80000 0x200000>;
+			};
+
+			partition@280000 {
+				label = "qspi.u-boot";
+				reg = <0x280000 0x400000>;
+			};
+
+			partition@680000 {
+				label = "qspi.env";
+				reg = <0x680000 0x40000>;
+			};
+
+			partition@6c0000 {
+				label = "qspi.env.backup";
+				reg = <0x6c0000 0x40000>;
+			};
+
+			partition@800000 {
+				label = "qspi.rootfs";
+				reg = <0x800000 0x37c0000>;
+			};
+
+			partition@3fc0000 {
+				bootph-all;
+				label = "qspi.phypattern";
+				reg = <0x3fc0000 0x40000>;
+			};
+		};
 	};
 };
 
-- 
2.34.1


