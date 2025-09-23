Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B27CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 05:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jd64pchD3p12kAYCbTEn1Q825S4p8Ch9Dfz4Ek10t44=; b=4XgiRmeM9JxQH1QgJkV95j4lmZ
	8bKJ8hDQGjxHaMaBXXkhu8V/2s/780/ok4eUzlmaBF+qzp5Q2IVaVQnqMpQbB8EA4lv1s546L6slP
	/pAsdgHwsz95pcNC95zZ/X7hVBm9mwYkrDaR6KwiG++Dph+bL98/YBeUaPfg0jNV0cXeO0vo4KH26
	l6zpinWuQ7POUWURVOO52aDr+I3qM1icPMLakwLSZJyCWJbLsjie5aQIbAf12FF6FMWdA5As3FwOG
	FsOdXduAQqMQnj1eoXsugqbD7nQKoY+b1chst+qh0+bSabZBZgNaEWAmGxwmMuNXwSVl3U06vpVno
	zEMDYNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vkr-0000000CTiJ-37Fm;
	Tue, 23 Sep 2025 05:39:57 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0vkp-0000000CTgb-09i8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 05:39:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=At/4bS/nfmFWmWZXhnaVzRnvSdeYR6r+aWCpwLydlg8xO4ENKn0PZpNY1dRBGqAcdLCSz28NICvOuEVsNzXfdpfHwuLhT2ypRO7udqAdXSa+hjSR8kT3dbYnIk4j+Hog3dJ+9ChrMfhJnTqYeImzpnL7nLzOmD/7GPgnHTdNql/flmBxn3ioTLTZMERNX23XHSEoW1lFfACEd5L9ppqNs85Ev18tKbvk8W8PPjM8gh9X4kOMGvjV+iElAKjRS1XHoLhdHRS9UxMBdK5r8jLhD1wyOzPfAtXaKwDNIqPO1M1X97YQujhhMVXHfEh9XerHEdq7GxE47vf6Pldplz1FJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd64pchD3p12kAYCbTEn1Q825S4p8Ch9Dfz4Ek10t44=;
 b=X2nIJtjjfdZ0S0aNalOJCCJf6ed4V6AQjx5utpVO5jiQCspvgSlMzIF7KK6eUyebyRP5mefz8ZpxMPr4cRBh6UwvemkVPvlkNh57fICnQuMRhH95+BkypZ+xpA14FA/veZmeH3Zjf1T8UGsbwvt7no0A0IA3q3la3LOtx9TgI3rqxEkXQl8iBHhatOR+dgQXzL0LXewD1TY+2Z6MK7GleLswhjxT6RfkGNd+nX/F/UL6kp1kZ8ib40t1Wm6FjWca9hNdC+fdBSl/CrBbl0x6CYiJHY8Up8S6w9MvSPAxbIcoamcsi+8hMJX2bT6u8pS9MzjScfeDuWRctTbWC0hwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::22) by SE2PPFDCBF4279B.apcprd06.prod.outlook.com
 (2603:1096:108:1::7f0) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 05:39:26 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:100:41:cafe::ab) by SL2PR01CA0010.outlook.office365.com
 (2603:1096:100:41::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 05:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 05:39:25 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3BA9A40A5A1B;
	Tue, 23 Sep 2025 13:39:24 +0800 (CST)
Date: Tue, 23 Sep 2025 13:39:16 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL] CIX device tree changes for v6.18-rc1
Message-ID: <aNIyhPSV6lJaZIvR@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SE2PPFDCBF4279B:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cba69d-965a-4f54-c2d4-08ddfa638ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qd1OTJrPFiBj5+hq1zEWCbBQsbzeNeRa92v88Enr9yxN+S24NagExol0hfc7?=
 =?us-ascii?Q?iT5qn5ebrsdu4efRYERLCqEUY9eu73TtUxn3kiSuSyz5eaW7mNNw2cgZR7r1?=
 =?us-ascii?Q?cXY3QreIg926bhsZcM+3npCzPlaRjiUTc2Ey6h7Fgs5eXzCeK6j0DVVkoZjc?=
 =?us-ascii?Q?AAKFSu9469bIMyLsvabIQ4QcC4uILndYc9UGdYF87FKuYyvnQANA7dZb4Yas?=
 =?us-ascii?Q?rSsY4c8glfySzSjItrlucfOpqxbFh9RsH7jd0g8aA3LkDV/8UzBfXXkZI8hM?=
 =?us-ascii?Q?1ztqMWeQtKlYCHy25qptKdYgA+1Eb4zA1554Yz/eNv1NJJH5FrKmxX8iXlJm?=
 =?us-ascii?Q?ynlutgvkOkfRuqv8k+D8DdmX63Z9sDEq3w7CuN0ZiOIkhldqbSOJw6TTscNi?=
 =?us-ascii?Q?KWuzXzMI24O0Bx3Eeku5IXdQOcSbdmKdSzWkPO/mIYLGJrZPLm3dIkmLkPXv?=
 =?us-ascii?Q?eEZoJr+7OIeYetCD0tyyRB94U9f7kwIB2+69AcjmV3kUQmGXJ/rSd2mQjvbw?=
 =?us-ascii?Q?MjKmtrUcuV5g4nYDWFZJFLQeWP0RsdttjYw/CqWTQJ0aFX4MEAOXcv7wy3po?=
 =?us-ascii?Q?hAOhECC4/3ruXvpUNSrdOuyB/2YYd3T/rR+LK08bKy6to//mi49wDuQP9Nx+?=
 =?us-ascii?Q?PfHgAkGJnFHkB8+43K5hmuhrwt47AUzzZUeZFGg7mIgTHr3XMh5sRGkGuaog?=
 =?us-ascii?Q?a9Oi1kBYFH5ctVt2Ua5v/W70etPxIPwIQxREG0K+/xnsK8h6HI8KrKua42yx?=
 =?us-ascii?Q?TFxwfSOXGJEJlwVLn4b7aTasu/D4DHGzItZ5O/axGyibB23mU7lK67qWc1Wv?=
 =?us-ascii?Q?S/FY1VIdZUX5TEfcXAhtygACdiSVNmR9uJ1cwWRkOEeNPTzEbykyBcpKNG4U?=
 =?us-ascii?Q?n62N3RgHEGNz3Nt1ANDwwfsaKXJ69MJUOiL/Szd6miv5b0P4eTXn+rjMWZal?=
 =?us-ascii?Q?D9RbT12BwmIamlJQMSIhL0Hux24t4T0RZ2sBrms+bxnPKwEFhU/SzprOzKG5?=
 =?us-ascii?Q?IpQo4iAGOu7ihjUeLkWj0e9fafKYlYvO8NZeVxhUBvHX0+ojLUiX1DZ2kCTo?=
 =?us-ascii?Q?WqhmJP5LkSe5LDlc0TErUu/SK9PiLOzOGi9/IxG85S3yL6oAlMTT+Y9I6UQ6?=
 =?us-ascii?Q?aDCGRSaoaJlOtWjmxAPq3kz7eH5z5rDY2bJhKYemtDN8BtqVsvCc4vmL0biZ?=
 =?us-ascii?Q?qEj8hJTYmcH9VfHgMee1W6qNZ2Xqjdm6v9NmQ6buSzCbt26edQynGhXdwxgb?=
 =?us-ascii?Q?Ntm75dYnYzGZsoZrOETScX+d0T8Zp+b0yjNBDYifdnR1o5dwvvffc0Jd6u9U?=
 =?us-ascii?Q?iJPXqMBZ5L7AnW8N8BLarKIeOQcbIBO2z/Q7ruyHzV3lZY0t+W5ja7XX1vHb?=
 =?us-ascii?Q?H7Qb+eAGq2b+ni2jl1v0I/1CaI0tcZptCgiLcmcf3VH84TrXSQvdhcU1+Mnf?=
 =?us-ascii?Q?ZQ5o1ob6PW3BmrdlAkkNLPBwZkdsWDUuwLNuiwCW50Q61JIl3cBGmEs1kXuT?=
 =?us-ascii?Q?dRGb90GjO4ENpTOzSAVGi3M/Odpzt2f9ljUb?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 05:39:25.7950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cba69d-965a-4f54-c2d4-08ddfa638ec0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPFDCBF4279B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_223955_075219_20E13F21 
X-CRM114-Status: UNSURE (   6.38  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-v6.18-rc1

for you to fetch changes up to fad32e8ac460198d086c6468dafe47ecbd9d03e8:

  arm64: dts: cix: add DT nodes for all I2C and I3C ports for sky1 (2025-09-08 18:45:52 +0800)

----------------------------------------------------------------
CIX device tree changes for v6.18-rc1:
- arm64: dts: cix: add DT nodes for all I2C and I3C ports for sky1

----------------------------------------------------------------
Hongliang Yang (1):
      arm64: dts: cix: add DT nodes for all I2C and I3C ports for sky1

 arch/arm64/boot/dts/cix/sky1.dtsi | 100 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

-- 

Best regards,
Peter

