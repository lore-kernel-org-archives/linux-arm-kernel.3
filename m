Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FB8C53209
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtLgjGXfxhPvG/eY2JTI66t7zDNQ8dEKDL3v8mykkq0=; b=0rP4JCkc4k3gIQRAMvUWZFH7MH
	rg/G5vRHABs7Um5awvFbPG4BV8kqQ7NBeev/MwLquNhZMxfWAlpd5uReIk3kuBW6/cSZYUGzekfB7
	oFHf5HqwCdUDuAPxIv8QhtIoE2rrLYFc958u3A2kR9lnXn1S/x89eyqnxFNBknTzhUNCWRjcyimeV
	Z0KJ9n8GVhQE3yLOZ2a2iGn/RDTxZY91Mlp8rn+Y7AK63v74w8I/P7uS13SUiIiVtNhn6MLKeyo8g
	sVGFZ0PZ/f9R0wyRpdxKV8lFMju/q8Dl3Mpe93KV1PAznrUaBvIeKbn48rbbekYLE3QTp5/sn2Qd2
	kD3SO8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIQ0-0000000DG3i-0Zil;
	Fri, 20 Feb 2026 04:47:08 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIPx-0000000DG2d-1J64
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 04:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQnWXfnzMCx6WpZLNiuHoVfl3Ad0PTNWpz6TneZ4b7Z75iJslRiF/o1G0NlJSV3hQLLZ/iw2WzzJnla0dUTs3+R1ejECtiMw5T51TWVbyH9sNsk6ro+8EmlWPJ8axUKCsij+TmitGC4BFa7B9XiKD5gU82xfzDKHbJsZx9Bmh+VbI3AlnZxNJYdf+j7l0blIr3+fDMN3SjnnU/WNWCEfrxdxolK1pBGpt/7M9fj/vQzaNeulYcaUL27WtjHdp/Ou3BfwsaI4qcJUB441s//x3cG6KO8DdeVE30pNMW6xx5GhEk1VAEnyBdY+zHZZveI15roDOC5juvm/49FWs45oGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtLgjGXfxhPvG/eY2JTI66t7zDNQ8dEKDL3v8mykkq0=;
 b=eTOtkjjHIYvYJkxIBb09/iOSH6x6IiqZ8641MK8vUcemGkbyqVbw0e0qXx7ScqkKsobMjKTQTyqD+3Crx/VIzAYBe2iWE47sHfAhk1C0mHgVSCM2iF79HCZxg+K0yfPlP7V93tXqaqYRvVV3sAeI00QZftLKuaqUmncslQY0T17zO6oWxX2LKN1VNcOZKtzSV+Gp80OMzvQQSJrEVjSxghnlMql5oZygN1Kz4Evzd2p7fPIS0s/v8XmD39KueA+3vJnuMdtrdrpiDZPocIshd3faqkMBblIKmgUTbXp+x2kLPi4MBK0dXoEM3FiBTLbBNrRS76OFNNHNKUxwRdP9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtLgjGXfxhPvG/eY2JTI66t7zDNQ8dEKDL3v8mykkq0=;
 b=E1MZmOA41Nflqr91xyOOeMSppoGYL2Xofchk5xM77sMU4ZiRlBqHv7W9QPrJzVcakCdbvFchm4UdWz2k2Fqp84jALRgxDW52Bw3jJ5Mt/Yz7Xp4g1L6E2lycpUx+cj4b5hoF5xYwKY+FStaLpVdTyGp7H1JmbH0MIeYgp1CGrTRWB6PiJqGhkXcYar8KKmcaZO9xLthW+yB+yEk7sJcOXV3l4zCPrZIt1P2KAokYT/6xREJf6iRrJYwkUB4WcDLJkdWN2jNuEcHlZLfEQbbq32gtRGy2iCt2MeyDkp2kapZWOz1WwQC1yjA7br3gPON/KqU97cjvcA10paBKTq6VyA==
Received: from MN2PR20CA0061.namprd20.prod.outlook.com (2603:10b6:208:235::30)
 by LV8PR18MB6197.namprd18.prod.outlook.com (2603:10b6:408:263::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 04:46:57 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::a4) by MN2PR20CA0061.outlook.office365.com
 (2603:10b6:208:235::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Fri,
 20 Feb 2026 04:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 04:46:56 +0000
Received: from vm-swbuild02.axiadord (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id 3CD954186B59;
	Thu, 19 Feb 2026 20:46:55 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pbolisetty@axiado.com,
	twei@axiado.com,
	kmitran@axiado.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: axiado: Use lowercase hex
Date: Thu, 19 Feb 2026 20:45:49 -0800
Message-Id: <20260220044550.4152148-2-kmitran@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220044550.4152148-1-kmitran@axiado.com>
References: <20260206-axiado-ax3000-soc-maintainers-change-v1-1-a39ad47eb185@axiado.com>
 <20260220044550.4152148-1-kmitran@axiado.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|LV8PR18MB6197:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aa1c1e35-d0e5-4f48-c674-08de703b13d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cv8u38EUO62bEjfhEWS8Ru7SYO/GBrvrnoH3dbI7AgllMi8/Ok2gzbG8jnjv?=
 =?us-ascii?Q?7KRSnpecZyPAAwqSI6UaQ+qoWhzCDQmUh3iPbq/Q3FSqPj9S59maytXT24PR?=
 =?us-ascii?Q?TAJswYYSKvrNydnLuMkMZaNT0oIg5qiPFRgPqOIhL+hMdVE84xdZy2j7WSFn?=
 =?us-ascii?Q?MLXNXGpnKX30l0rjwhHE+q6ShN/Ra01/VZQM8OOd1MeGdjB9ffvGRwhYr3La?=
 =?us-ascii?Q?7eZ8nUawd0Co4DCI4SLAvBTDZ8wTUDCJ0KtzwvXiMy60EBV8dMSi7ZZHKUNJ?=
 =?us-ascii?Q?8mSKyIkCTHA5Xk01mYiYzPW4Y2B45FkIu8yUfWSgwqj+vFgQNFwI7ADwAyV/?=
 =?us-ascii?Q?ZTU8I+5pEqpscSSdIVzuBgOF5YxPZJxljXG/yqojKkPTR31b5DjpR6DwCB2w?=
 =?us-ascii?Q?TIPek9w533kuLthcd1kgsgo3eqUqzRxEmp7lq+g5gLHJwuIqf/kWo0DsrsVe?=
 =?us-ascii?Q?+a4wx+CexUhqh8HAmHRDG6GMI6Uv+eHJnGB2J6JDpxKMd+v/nLgBfLXlduda?=
 =?us-ascii?Q?NYWbUzFb6q2wN59pgmMRym82e/56M5np41nOif7w2oFsGzdKPK5ht0Nzyjlz?=
 =?us-ascii?Q?mWyYIlvBi99EzgOAmIV7ifC/8tOfaufnJoVJa5PNx0LM5XNt5253F4PGD5jY?=
 =?us-ascii?Q?TW8vt87yDjMhw45juGpnuKUUwDx/mqFSFNDzobhdf8AK/KRYm0HtE5cvKlYi?=
 =?us-ascii?Q?f6aP2QuX8sMxoFs+3kP+l/CfNhEQyNMFinLS94q7nFpQW+WbCrsc8R1DPxVh?=
 =?us-ascii?Q?QXAwmQKWfKH1UI+k+467579s/N4Sy6DvSRhepMeXkxqUFNtz+4bJA3WA5+R0?=
 =?us-ascii?Q?oql7mEBSI0LVaS3JWIds2Iami3w45Ep46ES94HnIflkE8FnrxJ+lQOsjvTs+?=
 =?us-ascii?Q?5OPeOHgtGG5WGAUJQEVSbUB6yk7bRUHQo/NMKVCq/oHxMK8+dPsaK7/UNYDx?=
 =?us-ascii?Q?4eJkNreJoo5bfQYSiCMHg+sN+TRa4yB0xJ8WPsgpXBL4Mli4AVeLNJilpKYq?=
 =?us-ascii?Q?QUqG+s0Xnnb8hW/KSXNyL+fSITbtswbHUwpTHJlUi9dQvBsQDX/I5y6RrAMN?=
 =?us-ascii?Q?QslYCUzOqrMxVdGKoH2rwKvq6OVh/gZ7rtPlX3T1v05RyTMnlpJcGFF6PICr?=
 =?us-ascii?Q?2VJfQ4PKzRMwIUCOKHfqlWfcMtpH87iF6gFxnHcUPIKD+rb0y9cxIwAgfwog?=
 =?us-ascii?Q?D4OutKYyOfAhYPNs4IY5m7VfSKy8UrjIh+qcqXLeT7DFHj0TgUjJDTZ+jVFG?=
 =?us-ascii?Q?WPZILn2ItcNl6C6nAWYtfC3s61Hx1x9XfXDIbptpW9Kh6HZbryVf8JKQwW6x?=
 =?us-ascii?Q?mSH5pvPWIhGVFEhjIsKetk+FXPMFpJ0CjfIbdBeNvdP0XBbiNYHSKOydb4nG?=
 =?us-ascii?Q?RUI2VRnx4qFF9jxmr6SS/3gsL0kNOXMnbOeItL5Gh+qmJS2B+Tt1R/rSTuAS?=
 =?us-ascii?Q?1Jmk9pMUJ9gtYmqqakwxVWsvICF+tsETNvumRjPuMahbpATM99svNxl66Ddl?=
 =?us-ascii?Q?90WwNmzHE1UT3y3ruXeeNUk0zlF9l8DfGgfZlMNr8dr1fvlMewrIXu5FsB5a?=
 =?us-ascii?Q?2WddBQLZ1Ynz3vAcFrkyK7sehecROLAiooHuqis45UoUScmN9wjWRm+KEBhS?=
 =?us-ascii?Q?eDkFjbDLURj6Ywwzl//rMnRqZR7dZxm6uZDNxiCdAGMZ?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AYvn6ufw9/slt7YCoXyNNcN9jCiXat2kcVozqbcpk3jwaC38GI8vKhdM+BUwudci4KPFWPTPy326MBZZzLp84nZQRBhjGp8nZuKqofR4Tu2veGMKWjJ6MtqqVt4DPQhn1BInRZM/crxzQ3f9oRr8fqNPbW2HW7URpvBtKBbX8iYtFjWYMzUOrCnOoU6UM5tizwHbmg8/YXubbYU+9lqcQ04UK1jrt7JmshbTJe5LaG0uDPUnuGtlr1CLtGpW0+e8qId0bTBOvezgIUMFrtUaksI38JhZmBvFG0JWUoOr0+s2a3GP5Uga76nyPMuvqSnB82QBLeLus3l+AmOOjS7xN1bybEk2y52yKfwvjsbnDpBzmBsSlgWkTBFIWgX3CCaF++ME7JqMJpAl18cPLmWHgIMQ7AjxjAz3krq4vUE7+Xy9WUK6WYbl3AvIjEiPzix5
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 04:46:56.9490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1c1e35-d0e5-4f48-c674-08de703b13d3
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB6197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_204705_367653_87757191 
X-CRM114-Status: UNSURE (   8.97  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

The DTS code coding style expects lowercase hex for values and unit
addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd..d515f3141529 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -480,7 +480,7 @@ uart0: serial@80520000 {
 
 		uart1: serial@805a0000 {
 			compatible = "axiado,ax3000-uart", "cdns,uart-r1p12";
-			reg = <0x00 0x805A0000 0x00 0x100>;
+			reg = <0x00 0x805a0000 0x00 0x100>;
 			interrupt-parent = <&gic500>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clock-names = "uart_clk", "pclk";
-- 
2.34.1


