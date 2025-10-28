Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F8DCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5Iejxv9Gr2idrK8Z1eYw0jd3gqjl02BkBgc+md6e5+0=; b=GI9/QHUAaePIsNsFsJnwXrlepJ
	0BEl84S/+A285zRf/tjWJDvs5wr++VbDW8QuRKdO0J7LTv6mNBmIYvUo9Z5Mg1QHj2XEo4A4hc4x5
	MoznUZ/SR1NEzMpWQ+qGhb68CFYYHjEDBD4jO9Fp+/nawHBNf/LVGRljGSjvTkEiOaUSfEX3TLEjs
	HrfUaLWABtBD4rN6SVQF7WMITs2TgGH4lc+Vue3LR0bQzaqgj9EJrVImQzWOtMC/AtwZFR8BgA4F1
	YK7jZ/1RDQ7Is9co3gnAwdwGk5kHqsZtPFBgjMUoyS65afDKYQvgincY9SjzgzKL33zbkIoFcO7NW
	6FVAs1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcxx-0000000FJsw-0dPv;
	Tue, 28 Oct 2025 06:13:57 +0000
Received: from mail-japanwestazon11022106.outbound.protection.outlook.com ([40.107.75.106] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDcxv-0000000FJsX-23aL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:13:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5Bq51TQVWZ21n/+8Tv/BwWi/C/5IxKqq+NHGsMU0aIa2iJ0T5NSyp6X+zOek9eIgGf49vjvPWZ+HUjyhZRpvmSR8CYZ0WCx3P6fr9abZmhSD5fSbbMMECUYzbQxJQPcTXUfAziBM9HBYvkkJbCrJwSnzKLT0gdZhujqfXD/A6oJJnObuZ/xZr6t0EnozGZaVZtv0V4RJWvVIMJNKTt/ZfxSuIrmg+cJL89pHur6i1ZW8lw22vALQ8ViO2WStxP3qRUGtVjGcyO8zQNhbcVrk0LFP0K1SZbeSrLDCX5sxVjmh+6Haq5w4K1UoQifISoaQh4ArLiv5QvoPNBcPwKAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Iejxv9Gr2idrK8Z1eYw0jd3gqjl02BkBgc+md6e5+0=;
 b=mwilTIO8L+AOJiLx2715yOcfLJWHCGzk9/sXl74beUuvGJetZj7ODt4MtMUp+VGTYUbMQ27523cyn3T53CDVa+VQ4YVZYjT7q5hj3tXN8Xq+6CL/qw3748iYhs+r3sw1TUveVv6NPdWRe105avLUFKauenmyDKdrhMZ0bkYgbBy1y0l3ZcEnfw1QP6dmzr8DZx9eVCDnd9kTsJWG1qUm+yOWsBxuCRqdErZO2k6bTnK2x+GY+kEo2eX+1cFzTXhOnIFLB4cxAhxtWjjq7cy8O15sXs4I2wf1Q5D80CYiJ46REHfNcdjlDxIN0isfq4Bj4DM3TqIoiCqQ7z6i6FBSOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33) by
 SEYPR06MB7995.apcprd06.prod.outlook.com (2603:1096:101:2d0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Tue, 28 Oct 2025 06:13:48 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:0:cafe::4a) by SG2PR04CA0171.outlook.office365.com
 (2603:1096:4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Tue,
 28 Oct 2025 06:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Tue, 28 Oct 2025 06:13:46 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8EE2E40A5A13;
	Tue, 28 Oct 2025 14:13:45 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	sfr@canb.auug.org.au,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH] Pinctrl: core: export pinctrl_provide_dummies() to fix build error
Date: Tue, 28 Oct 2025 14:13:45 +0800
Message-ID: <20251028061345.3885632-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|SEYPR06MB7995:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cb72fdf5-c086-4b01-45f0-08de15e9276d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FS1pXUg2YH7OfIjKVnhGVR9rBxQJGeqL6WYxCezMzYYiI/o2PcP4kGXfx6sj?=
 =?us-ascii?Q?v9DM89Cnv6c7qeUNO+mE4wIQUXALYSM25x2r6npVAIUgNftJPslAVbskzPEn?=
 =?us-ascii?Q?vZFDcIXGBJNUTOPymUpd5SW/+bK8hIbfIz/MeLsm5ZO2pVRA12R/bEkJaApI?=
 =?us-ascii?Q?JrLEAM17J1DzMlA4trCdCKTJ4vD/cFCkkBOnhirdHJNDiSmsHWicvn+Vj3JG?=
 =?us-ascii?Q?dg6bT4MdM+cMp84pMPrTgsz7RA/Kxb6exgk9J2b4VL06nSRJYWdPFO9FlEUn?=
 =?us-ascii?Q?0bPoVy4RsW5gN5IAX/DMS4I5yT07nEQwqCLo6kBDBRzJKP5iE72h0XC0LD//?=
 =?us-ascii?Q?Kwu2veKp/iEzbyQbFVYHLPTEKP7H38imSSW+l6SW2BTUASQ+Kh2YHneJrHBj?=
 =?us-ascii?Q?QwLA/y+AYApz2D/FPZz3L/a3vHTiGujLmlTYFMhGQ7rgjGtbKbjypx8HRioV?=
 =?us-ascii?Q?gjLjJrMXfGc+rz4LbSk4kwL9mEXIXxrH5kAhUpAIII4SdO8an8+aDDIYtGwY?=
 =?us-ascii?Q?aKxQExd2mcwokhkZTXpwjzTVexQD5vunho9oFF67GWzbLW2hy3fj8FzmIyL4?=
 =?us-ascii?Q?uL0UUzsUXwD57GU7lF3/YG+n/5G1rHP9gFcxSz+/ydQFl8Tcj1L0aMHXoLT5?=
 =?us-ascii?Q?9gQuUDfoXeq+VB4L7arngZYYGDsuFOyxLO/2YYE3CH914ppnYmNf3aw2YzMI?=
 =?us-ascii?Q?o2HQzsvfI2rNJaX/JaNr0VSNOiUu2zR+H/DZsDmCdtKW4fDYvdbath11lo28?=
 =?us-ascii?Q?ctHi7LZRr/YHn8YFYl9mOAkU655n77lQjiGmY7O1xq5o50hRKikqI1wwYc27?=
 =?us-ascii?Q?8AdOzVPcvVlN2RZ75Ub0a/LOl50FeyMCSxmnDJeOjjWvbFvl+5InK1Ql6ku/?=
 =?us-ascii?Q?6OaCxQc2h+325rF/RlepNjMZaVwQlNIst7TyV7LO85z9j5LgC/663e8MSvDl?=
 =?us-ascii?Q?mOewmOkSKNFITI2NiNKUrP3ine9SWsHCepZ5bplSKTlUWAVVUzrVSQ2p5iSU?=
 =?us-ascii?Q?+KpQS+3tKLvkryTzWaW7Qi2ParYYO2nPMY/ZtfhmKDt8IrfCS2zv7c5mUinZ?=
 =?us-ascii?Q?bsxmUYhCfTqKhFyMRyZ/pk3gR/tO2VbGD74WPbr1bR7FLGO+WJN8OQiDc/qW?=
 =?us-ascii?Q?GcxVME+IPnlgJxpz4WlB2YoridVR8DMr+dYBxTaEDoc6tpMZl++pZUujkLcM?=
 =?us-ascii?Q?GnNejqTQ+74QvJ5tRwMjaUA7ZQI5RVJIxrho3hGSwc1fLDzXukCmtrzqCyK4?=
 =?us-ascii?Q?QJokPJtYF11dsVf27sZgk+gpUe0di62RHn1uOM5d2KrEd2GWruZlzfWJ7NLI?=
 =?us-ascii?Q?Cwp3jpRUt14MmUKh2R0S2m+Z8SrZ0W3tjMWrY6f91JXk+ugMbKgfDqmoYthQ?=
 =?us-ascii?Q?6Zy1KAFcZlPD7MoFet+F0It0leypXuELDFgTuOTD/oq6j6jtWBRlRWsX3Woi?=
 =?us-ascii?Q?2R0zrUtf7iR45G3eQJ+WDDQbntRmUdNtCFOPkvYjAPYPPcMVN5YGrydq+yla?=
 =?us-ascii?Q?GbgubOWcDFtcnBHtpFe8v4TgdEgHEiijYKgj447nWEEXcaZqRWoiw7b1G+yf?=
 =?us-ascii?Q?0FQNU+Fhy4wbk1b05zU=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 06:13:46.4510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb72fdf5-c086-4b01-45f0-08de15e9276d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB7995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_231355_532937_2FBE402F 
X-CRM114-Status: UNSURE (   9.15  )
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

If a pinctrl driver uses pinctrl_provide_dummies() interface, and

is built as a module, then an error occur as follow:

ERROR: modpost: "pinctrl_provide_dummies" [drivers/pinctrl/cix/pinctrl-sky1-base.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
make[1]: *** [/home/gary/workspace/upstream/kernel_upstream/Makefile:1960: modpost] Error 2
make: *** [Makefile:248: __sub-make] Error 2

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 drivers/pinctrl/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index c5dbf4e9db84..acf4a86fb5cd 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -70,6 +70,7 @@ void pinctrl_provide_dummies(void)
 {
 	pinctrl_dummy_state = true;
 }
+EXPORT_SYMBOL_GPL(pinctrl_provide_dummies);
 
 const char *pinctrl_dev_get_name(struct pinctrl_dev *pctldev)
 {
-- 
2.49.0


