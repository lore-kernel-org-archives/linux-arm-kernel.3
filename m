Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55090C9EC8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=; b=jjtFXSKFSdfRG9cMmVpu59ospv
	zCFm1GO5rPjbCKJ7b3SzGAVo/ICXeGcSuhPJ0i2+n7o1YEPNHzUC97nXeTKHqeLfxJdMtl8zSzfOH
	gPU8ksAN+BoLUwpOuyOyNXelXhYogOwRBB8E02pxEYFoP5YQuhAJZMiF9ZbIz4y/5LjV9Pb6aWiUk
	2/biHFGaADcMEZCdIY5qWLO5OQ9Ki+lwmE+5anJNltaMi7NlVCbjYWaDwBLrNdR3oy3IygEmY96Br
	kRpoGXe3yIjKwXzTPmmtBp4NO5ZpmQc9E87ID1KvPWOlnT0tcKsXKAeT0rFa8Tqjf+H901HHOsgQq
	nGXzNWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHfP-00000005NfM-0TYS;
	Mon, 12 Jan 2026 13:09:07 +0000
Received: from mail-southcentralusazon11012066.outbound.protection.outlook.com ([40.93.195.66] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHfM-00000005NdZ-3BTJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgBmoMkCYg2c4bvNvPMNN754DV/fVgaUe0biPNIa3FaAymyPn5YEDOLl78AXgqI2nIiXOeJzjYI02omxrj/A4vkyE+WiGA6+X5lrahIR7G62ZHa3OwMDb1Ygn0hI1SUvtYd2Or8CKN7HGMkdxdLiTQ3zSPlUoi9zCP4IUb8FtU4Rht3tJGwBnE8iuAxt1IrLoZDtDOF6quBg1RTQBQc5rDzbHWo3EJuJsVlqbdF1jURiC6iA8FjT1o60bhweJfJx+rMoj3JiELtToEf4hethmrCnQJpa0XcRJR1VDqvlbSdpjzatIMEzoawHSJPtachuW1+RMlqfe5qn/EM+bYUAhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=;
 b=AKLYRjxAtccZcAPOBjsKJno4O+Ds1r05fXcRkKxG01g/WPiLQyGWI3x1nBvpi8pG1oTbFpL3LhmKirqyv4yweUQ5R5NdNzteLtttTa4fF7peb5WK3Ct7xyqybGGq2X4COt8Ff7PhuWnHhLJ9cEdTxztdtnZ0x/vJGVJnBjmKZ0TCWg1qNNbFMw513Vk5qGJY4pfwAx2robOIGe32ffiPAjVCiyg6riPWlPxO+0EmI1S+TzCu63McDuoRTMKUNUmHLeKvc+Xn6UKpB+uBT74fbZGRGqXwhnU3W8yjDQkKKjc6vje6ysyg0yGq2H9qMWJJMNhc3uqL6uUrNFAnXw56Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdJNVNKqgoywKxX+caU2tb93BEWDj+Xp0sbPXmc1yQk=;
 b=Pl78TWWtpJvrhKT682dBGI6uF6ueTgSK/+13O0MfKe+ZhAoMReMyrwoerZiCLW3/sWDg9G03UnKkt78wdzLnEjS53wixI5ezb6cUXUC1GJOR7GqoJ+Nh7a82hxB2lyeIm5urPCswwqTprJ0zabmprNp0D69IeTxZ2vyDiM2IxUCBmTrVwbZz0H/oBxK9LujQv4AaEV81QnjrWIzJ1xT0NzFsXJLBStQEjLCusIqXedPF4gT/H9VxdLVMtkEPo8bOctv91H8A5TMy+c9OOKFtUalYrHv+iZh/T2OOXVkGchIt1X2X1ovUIppLoveLjMzyBDXLNS4M3xlaXaQ+/efUDQ==
Received: from PH7P221CA0082.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::21)
 by DS0PR22MB6078.namprd22.prod.outlook.com (2603:10b6:8:294::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Mon, 12 Jan
 2026 13:08:59 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::cc) by PH7P221CA0082.outlook.office365.com
 (2603:10b6:510:328::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:08:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:59 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id C8BD3F2E6C;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] watchdog: imx2_wdt: Allow to run in low power mode
Date: Mon, 12 Jan 2026 15:08:47 +0200
Message-Id: <20260112130849.3748465-1-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DS0PR22MB6078:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f2cbcc9-c333-40f4-3879-08de51dbbfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?onM05JrQJuvhXdMFSt3lmB2oiihlMJPIgUiXLerGpDlNrErI+58LxL8TNKpx?=
 =?us-ascii?Q?OhnH6ncvoVbFOhdu4UGwZAYviUeky1JpndGpOvCo+Ry+Qdq29EPEQkbnIHvP?=
 =?us-ascii?Q?fqXTqdAzNZJ8OuJrDW3DwS2+pkixQLPpKxgGYRMRvmuFpwFpAbwFF7y2isjs?=
 =?us-ascii?Q?Ku9E8R0Z4OVdsD/osrOK27+9Pg50nm7tfTZuY5K7OaP9UikbMV6iEdRB+Y6C?=
 =?us-ascii?Q?qk0HKcodjEEPom359XLyi9ESCFShpGXXOIXF7RJeMx+UIFLBnGHrJj9ybptg?=
 =?us-ascii?Q?7h+DkF3t+kpQBvvOBZ6jl5YZLzgpsRH4wCrBywFJpS0aHAI4D9QHcVClghh2?=
 =?us-ascii?Q?4ns6VuyvhV+MhnC00rylqMF9mVIuEb/J9iAtp0XCKNsOaxKh93w/IaBeJo/D?=
 =?us-ascii?Q?MEejhsVbFvmpDLQAtQFqVNz2GKTwluahRIpRwarHdIVd7aGQHPGb1zO3SXfm?=
 =?us-ascii?Q?xzX/Kl1huQiFOENIhVcPh6bPrXxJ2Q/HlHrP0ju+YFekomfcQ8ITma6esHbQ?=
 =?us-ascii?Q?SK3+t/Udl8C9V0dI9m2wvYab0W7rj5f99x29OzmQoFLFxu2BPhu8b0zy5a/4?=
 =?us-ascii?Q?2V/OMVylvjV9fvKoXbcvAy/dPPINRb2Lpd7uWR6RMU/vlf6+h+89v0gAgp6g?=
 =?us-ascii?Q?vuX5KGifwM3YpfLHiiBbcIe72/QQcAj9FJRbGCuVZQol6QpXSkl4Xa5+ScVh?=
 =?us-ascii?Q?k2VnoLomiQnkP2f4tE0EFgl/L1cmNXfwGq+HiRM74n6KMXKoqu34lkZyFowt?=
 =?us-ascii?Q?2klrNPurgw6cwng4aIpaSaa1OiiKg9ZHzhgZHY/J6+DlAbOpwcSiaW7D9nla?=
 =?us-ascii?Q?c/nl62aD6sXqrI4qRFi37JdIDDOoCOHphjMeuD/bn90rwdxFu35o67aEB6xK?=
 =?us-ascii?Q?+VRZQ9Qx5vzQ2zU4XUIKvTw2yw+uZGFhUbm9SNHpdCLRw3ITVR/GaI/lcuYR?=
 =?us-ascii?Q?Z39RVipzlRGbvziNPC85da27sserV+2rq+yr/yMAA6oBfNTDeoyYW1qR1Ll1?=
 =?us-ascii?Q?fCu/m5JI1/V6xRloqCYJq3yIYjpGx8LzFNoDjmOpel67krh0hRAqson6oOm8?=
 =?us-ascii?Q?k9GyVmQg+jnPH9GkiBgs+C2+QTG/pmD/RW4G/Ek1ZwJgG3STth0BHuqrXTTx?=
 =?us-ascii?Q?3SnD5kHs5URxnB53MZJbbb5RBAFAV8XaMELClNKD1rVtx4FljkOy/M3UZxvf?=
 =?us-ascii?Q?UDZRmFXc3psrvTYtshDjTC9HIynE7T19u8kaxSqHfxVqJ+YdbifY2yXvDYA3?=
 =?us-ascii?Q?dygsGe5r6vYPRd9owVIAzjTU2YHjhYWMrBmib13dKHSbz2fqwJEVxQLOyxKy?=
 =?us-ascii?Q?AlkKciKaAJPOvKwo4nXKlpEJyNxJdYlrR5z5WWLDn4E1ktnWxJpNtpAnffGD?=
 =?us-ascii?Q?tLBNqRog43W8YXwZpjkPr85dHIQUBlxgB0L70S8IuE1r9+9ehDL4AXStmSLI?=
 =?us-ascii?Q?vcLfI+kkgFtEDQoZN+liRXuZNNv5H2LdJ+xEZnBdfLn+4sTzY2q7vu4FhwUs?=
 =?us-ascii?Q?/N47MvzDryVnsInBHskH/lIkh96c3yPTIi3Le/NAobmp9OSJtaD3D8E8VFbm?=
 =?us-ascii?Q?qJ6vJrNlurgAwpqffUQ=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:59.0726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2cbcc9-c333-40f4-3879-08de51dbbfe7
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR22MB6078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_050904_823636_E2009919 
X-CRM114-Status: UNSURE (   9.84  )
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

Description
-----------
Add the possibility for the user to allow the configuration of watchdog
in low power mode.

Testing
-------
It was verified on a i.MX7D based system that once enabled the watchdog
will reset the device when the system enter in low power mode.


Changes in V2:
-------------
- Order the dt-bindings commit before using it.
- Small documentation update.


Nandor Han (2):
  dt-bindings: watchdog: fsl-imx: document continue in low power mode
  watchdog: imx2_wdt: Allow to continue in low power mode

 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml          | 6 ++++++
 drivers/watchdog/imx2_wdt.c                                | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.5


