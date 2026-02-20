Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DF6C531E4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1Jk26V/qr0RsBx9lcdU4i9vzjwt2pf8AJ8KlRR+qv8=; b=sHvcmDcD9s5GQRu9bhPvY7RJie
	4eJV8lTyVrGQGTS++0jCS/7VVieGUcWz9VAazyUZO/sJa2BGbirI3zgn1vCYaa5Vxgx+EgKahQBTm
	oCLbAVddIvV4DxApN5N3naEORaMtvB1XshYl8n+3cupjn/uepxFwbR0j2nXanC9XFjO4klyvQVVMK
	FmPj4usIAuRG0z2VeWdTTl6Usibw+vfInPwKtI9DUG9389y8GBO2wG3UwAqjzhs3BnvmXvkqw6f8L
	VG5pSHvo7WEF1emtamVXS1FKcsPps2W9zb1DvA9MyBlVGeEbwoC4H06zeJ9EwOhVQQ5RMr2dNEC/u
	IFTe/nCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIQ0-0000000DG3p-1n8H;
	Fri, 20 Feb 2026 04:47:10 +0000
Received: from mail-westcentralusazon11023107.outbound.protection.outlook.com ([40.93.201.107] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtIPx-0000000DG2f-3Jkk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 04:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CV8OIwDzD5I/QaHB780IK/o1vc76BLJ+t5m9UAUi448XmzNM7fLLmGiHL6IpEzI+wXd1rtbPdDEdW9cOvDMc5a6Ic20nC5tThaUd/ryt1qNMiwn1h2WGvCwFK+UMugeBpIh9+ydVC8To0IROfMDItqBNyiaIVDiam24dWUXlwQ9L7y1jEzGHv3iHrtPXmY1MBOmLAEpAJO2QN0jiEnh4ILSqqwU9ETFpULapw2v6ZSRTuv97TQkzJ07ARx4dGEID+vUgh9GVYw/ztWmRcZ0r8nCwmiuWAS7cYH0KvZCLhLt9f/KVRMed7mBkMM89kzzgjrPTDYAhCvsZlfgeSORX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X1Jk26V/qr0RsBx9lcdU4i9vzjwt2pf8AJ8KlRR+qv8=;
 b=sQ4mN0pb3h8STQrZPgWIe6nrVfdj6PhtDCPIvlPluWlRvtebazTmiKEGdmK/d/8Y0d52ROLq/30Vw8hDa77GD9B4S3uJ2QCcMpa1G2vwMoEFedp+SFxAMY+IF8hM4f+WhZlh34NJlhrEYMgK4KRYCO/vN4aptdb8sP07opnhHcU/ozh5TU65gihp7BX5cXWp6MzXYOEPXaYLeezW7vp8DYQ40YNy5SGjCyFA0KTMJjHZcCjdCuBHVdUF4onNaCRTtEVWSKskVjtSGEAiCLOrUHc/kT/9u1/Kct54QI2XUegcQHqVzzmyYtio5vYSWHU9VFICfkZMgMOGBwQycP5Jaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=arndb.de smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X1Jk26V/qr0RsBx9lcdU4i9vzjwt2pf8AJ8KlRR+qv8=;
 b=VTb8SP4FNxkBfkOKZLIiXm5nLFUeOOm2CXwezJt+2Cf+MUjx5Y4FVbUMsjrP7gq3zayfRkfvqkll4JD4GbNiAKH2O9mJo3HGscOC6O7Kq9ibuF3EDZtHmPNFuluPXJ0pqFrhZGIRfSRSBQEkyFWaA9p6pIAyMgjLOS+04Jj19doXG4I0OK/w7VLXriz5qAmxW/ikhoLCp8bS9gRcLPyPVU9TqjdUOktQXoSoFWbkttekSQKe3LrC+sS1tC+OMHjr8cTkyQM13SwvnM2MmmXuuFZW1fz1PC7qDH3BfF5OA0g21me7Cangaoqp5OIgHcB3hP3FBlNLVElXKXHxJh7Nlg==
Received: from CH0PR03CA0255.namprd03.prod.outlook.com (2603:10b6:610:e5::20)
 by IA0PPF52624EC29.namprd18.prod.outlook.com (2603:10b6:20f:fc04::c1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 20 Feb
 2026 04:46:57 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::c7) by CH0PR03CA0255.outlook.office365.com
 (2603:10b6:610:e5::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.17 via Frontend Transport; Fri,
 20 Feb 2026 04:46:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Fri, 20 Feb 2026 04:46:51 +0000
Received: from vm-swbuild02.axiadord (unknown [10.4.1.182])
	by smtp.corp.axiado.com (Postfix) with ESMTP id DA0054157BE1;
	Thu, 19 Feb 2026 20:46:49 -0800 (PST)
From: Karthikeyan Mitran <kmitran@axiado.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pbolisetty@axiado.com,
	twei@axiado.com,
	kmitran@axiado.com
Subject: [PATCH v2 0/2] axiado-ax3000-soc-maintainers-change and dtsi fixes
Date: Thu, 19 Feb 2026 20:45:48 -0800
Message-Id: <20260220044550.4152148-1-kmitran@axiado.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206-axiado-ax3000-soc-maintainers-change-v1-1-a39ad47eb185@axiado.com>
References: <20260206-axiado-ax3000-soc-maintainers-change-v1-1-a39ad47eb185@axiado.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA0PPF52624EC29:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f4fd3678-8c23-4ffe-72e9-08de703b1090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+iVOU+j/oGSw+cXTa93J0BnIwTMKnsywMEMd+ZYB9isUUZ2ofZies2LG8++Z?=
 =?us-ascii?Q?jUFjxdMUrGNOUOieGVDL2OEkbZmPCHmbpr/8IiD8kCFH0jZkRGba2OvpcaKv?=
 =?us-ascii?Q?z3Msfdfs1lKvlP1lBi0aa9YPacVmJ663EVUNrrj4wJEyN1/PcWKGoIHlvnT8?=
 =?us-ascii?Q?tnnGa8DDNboDg0jILmRBQLcf5337AroAbjqsXy3FnH59svNBCjbybRavgye1?=
 =?us-ascii?Q?cLi9x6i8zS8wjomx01nHBQ6YBcjcxUN/p5IqahybZfusK8ciB15DS/tVmTt2?=
 =?us-ascii?Q?HcqBhs65nQ60gYFbHlMFgwkULejY3tzmWDfioNH3zTDofEDApoNXmjRYjybf?=
 =?us-ascii?Q?oYw9zAd11/2AVO56RzM0Yphu2Et1MXm0PcBRqwycx+LWdeiJ7zZNK0b/eSNT?=
 =?us-ascii?Q?OEJwrpzH/43lg7eZU189JwepM6S7GbJExORZo1dygDMVNR/LSgo8lFZxhJQQ?=
 =?us-ascii?Q?wID6O4rysGAME0RqWwswiv/L5/nIlYGOOYvzg+0ERbNrBwO41RqfReNh71g1?=
 =?us-ascii?Q?/qutc3NPHYDPkoN0AZ0QJ2fefRqg+5JLDqPEvnAlFwvSOHsDD8UH1LEV1URy?=
 =?us-ascii?Q?eDOg8mBlNuGaXwPKfZUFSNZufIRjOtUKzxnhHcBl+HGUiQQUiv1myFvS+epm?=
 =?us-ascii?Q?13/TIeh4dI4e5PqEL4mpdiYhR/VmXquupBQE+2uHP0dzmP1hrUEpmYWPdtIu?=
 =?us-ascii?Q?1ku+MYTI1fj8u7VJJDqa1Z1pI2wIksGJDWeOiinZSfg9sXHOiciaoR3UV7iR?=
 =?us-ascii?Q?wmN6pzNNJYZeWwiSjer6vQh39cvw0LNvmtBrSTOqTU9MFbmb+Z3oPbsaoBwO?=
 =?us-ascii?Q?RK2s7ImX3gmsDPiM81i2h62/XB1koJvTRv40wG+RSKOMLTDuklerp3IphZ3o?=
 =?us-ascii?Q?5FZ4ApXOjY+gQK4dDZe60elbpDW81JVX7WSxtISBZyCJCpTE/8MrJ/ayKKQs?=
 =?us-ascii?Q?smIa/S+0ESDvTWswoU751twK+7N5wmMQ3AFXZjWEqTKCr1Eyw9+cuz6hAhIh?=
 =?us-ascii?Q?ZdDtV7yIUjsq5ocCtWSuj2lEHuSMiSofnX2dLPWzide2rPNiwOU99ILdIwr5?=
 =?us-ascii?Q?QZxEOSPGmY0O8XsW5vsf3cjZYbOAtwJmMpdE/ql3ibzLEkdMSYkaLg6xpS8w?=
 =?us-ascii?Q?OtIb0nisSa15Mqz6Re1x6vjdL8x+cvrIooqaMcvHsMqZvnA/xp1BdUpOgH7x?=
 =?us-ascii?Q?ilrM5WY2x2bdw2203F3yjOaCPQjAKt+oaAOiy0V9SwGdcBvlP90rdq2tD2rj?=
 =?us-ascii?Q?zBnzRgGESNZNscK7ytej9VJrkIycgKqSuGdTn7nHG5917GlzGqE+uPqRh40+?=
 =?us-ascii?Q?yO0l0PyHijFl+5klQ2q3B+EdO6hDXdfqJK2R9dnWZd4SpGCaB2778YqKcPBc?=
 =?us-ascii?Q?6XBQFywlYz1rGrjAAAELgBGwS3PxxWKhAJZyKMwPiaFqjieFj/wlcxvoysSm?=
 =?us-ascii?Q?tGrOOR/PfULL20aDT1TxTCByj/QxbduqCWcUdD1MuDVo/LSoX/z3AdOur2sy?=
 =?us-ascii?Q?V6QMwyMnUXBBjFcnZTr+C4+viCovOHN6LSSt54WCg5RUeUXrdhfEcCW9kzDL?=
 =?us-ascii?Q?Kyknu3QCI78NfZmm9klbl8QvHtvLmhgN0UZsEb/3004i4gWL01PAQThkh31c?=
 =?us-ascii?Q?EPZMvMyiAF+BACi4X7lGimZtP7rer0OMolXas9nq962hX1gAclGqEHEbuPyI?=
 =?us-ascii?Q?IsX1gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UZ2aIG6OdVOkz1qiZum5V6ELmKaj5OkrJl8Kk7UyvMMHKoVmBlf+tOO2IIHpWRvi5Fjr+8thzuQMYffSklpmXJSPvKV0I0wOfrsvmK/GerGHjlKRM+uIEFZvMPzIwHCMSXwlvX/UYPIPlIK95bRUmFjjcpa2nqiF1AuXxk3w701/3TONzcEXmRCtShPIsRemMo0QDcYDijq3Sk9uk319np3euTmZWHMJzVck1YpjhbWYtUKq4UmFMOPH4AiZML6HAj1z85Q3fr4JKNbGrS66TUCx0nQs5rs1BJP3mwHei1In7VtAhuCzM8jiKo0aIy+bhJsQViY5aDAMeGgWlwAJspU5kiyMF4DVVOLt/P6IRETd/A7ocs8zSh+UFSXLHqCpKk2rzXX3jfGGqpzdnToqrYKyWheWNia+l2BO7pFiiLtVFW/OXvb7s6xbduozhlkf
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 04:46:51.5026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fd3678-8c23-4ffe-72e9-08de703b1090
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52624EC29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_204705_829046_AECFD5A1 
X-CRM114-Status: GOOD (  12.47  )
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

Hi Arnd,
 We have the following patches for SoC tree merge:

1)Addition of new maintainers for Axiado SoC (platform maintainers).
2)'dtsi' change to lowercase hex for values - reviewed by krzysztof kozlowski.

Also mentioned in root/Documentation/process/maintainer-soc.rst we like to request you to provide us with an Axiado branch for the SoC tree
to be able to submit the pull requests for our future SoC changes. We have also created a submaintainers tree to stage patches, and kept in https://github.com/axiado/linux-axiado-dev.git
The above two patches are ready for merge to your next. Please let us know if you would like to pick up the above two patches, or you want us to create a pull request after you create the branch.
Thanks,
Regards,
Karthikeyan Mitran

Krzysztof Kozlowski (1):
  arm64: dts: axiado: Use lowercase hex

Prasad Bolisetty (1):
  MAINTAINERS: Update Axiado reviewer

 MAINTAINERS                            | 5 ++++-
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1


