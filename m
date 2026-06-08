Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95C0CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 02:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SHDL9A0p+qg/zY9viVxZG48KToWrqbvzPRgHfU+dGGE=; b=adjCM5iRcabh9Wh6qRSflbyDN6
	P2bUgt4yHJvtMYypBnQoYFwmcIXRLkxQ5KZFuOqK6WNenwdIDESuCkpYrEVi34M5D4G9b9XJ69ppe
	5sLidS80Mgcz09cQ3MdG3mhX4YjVecaXyY6w+2cNHxznj6Zdx7Q8FVK0SdZ01AgwR18FhtudVxVOD
	0Qbktq5wIiKTzt2ZwCMpylskAyXOnmMjGcz8+O4O4/cnavfYZE4pi3hP678QcqxPOga9Vrm6UUE16
	EjxYh5YvvvcI5JSu44OyJYsM+ZJDsAa1UzQX+DBVMdBrM8G8nQe3hX3lrQa3w2/jIoz+Z30vB02j/
	9m7KaNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPYN-00000002iIU-2w8C;
	Mon, 08 Jun 2026 02:17:27 +0000
Received: from mail-japaneastazon11023114.outbound.protection.outlook.com ([52.101.127.114] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWPYK-00000002iI5-1Plu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 02:17:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dyk9n+7bwFv2DdUDqj5r7g7YiFs1UryXI5agE5KrsgI9tWUdYnthGRnoyTRkjbyS02JyEqMd4XdiKwUtGmNJ0KhOc+p2FP/OMQrTLdVcbmgSR3ktUdvtgeXNrVYIt++8ocz8Dmx5K3riSIpRXbkj4F0IA5q+mNfLhJih26aU7QXz9KuyhZyjSCRponGdbg/MpGEEeNO3Oa2KU1o5r1DXyxMWW0BmYRQBzHvRHwBv7JgOjM+dQel7Mk1bK3dNTa1NxlCVCsOf1pXTfQdNdeuxkaZqwR5A1WWvrzYXWuxufSTcbll4cryH6lnJsxkq6EEFXzO0vex6j+8eRsy2jBMn2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHDL9A0p+qg/zY9viVxZG48KToWrqbvzPRgHfU+dGGE=;
 b=kYp3I2vFehDk4b6E4N2gE+JXCY3SuVX5oS1Q5FkjiA1hL62uAdRopTvrHNJuHusPJCA2U4P/tkcmAKFLyfpoDnsykRnBqf4/TmDWFY6KGZdfhiH8kaLfIBzHFGAcLV7P47aRIDn4O6GHaCr1UYAq/2guZRF5XiOMGQTkSwxnnNY+uKFzSnkfDTD+/L+0DzCFCQZyFS5R0qhrB8jcJK4rxsDzV7e6fSxLVLMLeYWlZdd0CcqsmwziLTVjW2tgi6oy6rZgR7hiUTWvLER4s5NtdSR90Nvq5gQieSR5hgOp0wfaU/UKwhrpEpssTzYdn8Lt+6noiMiXgLW60ALfC39k9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0006.KORP216.PROD.OUTLOOK.COM (2603:1096:301:16f::17)
 by SG2PR06MB5430.apcprd06.prod.outlook.com (2603:1096:4:1ba::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 02:17:15 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:301:16f:cafe::3b) by PUVP216CA0006.outlook.office365.com
 (2603:1096:301:16f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.12 via Frontend Transport; Mon, 8
 Jun 2026 02:17:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 02:17:13 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0AC984084260;
	Mon,  8 Jun 2026 10:17:13 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: arnd@arndb.de
Cc: fugang.duan@cixtech.com,
	cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	peter.chen@kernel.org,
	Peter Chen <peter.chen@cixtech.com>
Subject: [PATCH 1/1] MAINTAINERS: remove my name from CIX Maintainer
Date: Mon,  8 Jun 2026 10:17:12 +0800
Message-ID: <20260608021712.1313733-1-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|SG2PR06MB5430:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec23b57c-75b4-40ee-c939-08dec5040e0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: KFa2uK1ekuwN8c6K2D0EJUQ+goMYWxH92ScyZWI/bXCk6XnaMh8gTXRUyYNgGf7UIdwMFjXB/8DNgTsnavA83HyaD6cn+aNRXdHifNo1C0pGPrlvLV4qtU+JbTWZBAG8gN67NYeiU3DA+aECI/cVm3YpNZQubmI6i+ZcuFCJdcrSV1WQsv6oOcQ6gNwM78sYKvMYhzuClMqLnyLox8oNMAcLM1JabdqPcDEAwU0mIGkMbtFwjdEBVXQ+uyPiNbwG0ase0t4Fd0Wtr3F5MrrS3a+pVkNQGboBm9JTos/QNCwpVxkMJqppC2bb99x9xaxUb9/Nru8OpQzPRUDHvkBL1VZPJFbrUhueSZxAOZEkbq/HpRiWVow7LTqKYEz9l4m7gpg7mCIUKkH8zMPq0izvW62pR1iqoGsihisPfdp1g5caw2LkJy9Ee566394FdIIXaFSTiNFlN+Rk0y0XM4s7JleK2jVDZqgslFBjpR034foKm2/AdxUn8SATtZf145bQIn7O2G1q5qRelLfA0LFMqAmWlwRzNnuOx0IUPDW3rSFxwWBvS/YlY4qwA6xxb8i+5j/H6GGFQXliHu/sxvoVaOhYm0Hv+PiDoyobIhiPisKvQIF47wTc7OE1Q1dvH0oodNgz4B+2C/woqJmHGHEz+vvb8JPY+DE+G6QRxeszluc9znXwWHEkrNL5G6FPUIWP4Id9vP4159bOj4oYKQVxehQvQ8yc6liQlLfD1azcdN4=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XOi8uauHcm/1GyyKCT8VUqGwrPxL2sbynNxVGAKzjZy5H5R51SJONSSBo0QLHwDOAdVDX+miA1ek1axKuzrObp0eXpHd74qnxEmjNXvcHSbmrUHibBrGxsLs6/u+ETIrIRtAZS1J3pd6xIiO3ZDyfCuewZwngxa7gCXrHXSG0oM1fD3YS7CsDWK35ZDGuYR/pGrMf5oiJ2SmttOusmoKydgwTezC/M6oUvW8Kp631CxKoSHMgtah0guD+ewzdkFzq1bFNdp7YZ6s9CaarECefIQHVAYyR7vMsatRrAassELiJVQYrNvfFf4TgZocY9Aakdd3xO+K1OQ+U6GojMCt5VHdBVjHw+bFtxr86sY9El6om8jpFGFi2GPUspfoaXEIms9Y4tJ2P6FL6NWbCuFCr+nhp+RYELT36FUyWzNrkwQcdeVAdQyTf7kk/rD6P3Yr
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 02:17:13.7596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec23b57c-75b4-40ee-c939-08dec5040e0f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_191724_400530_23E1103F 
X-CRM114-Status: UNSURE (   9.29  )
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

Since I am going to leave CIX, and could not maintain it any more.

Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..ca7d0f090906 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2692,12 +2692,11 @@ F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
 
 ARM/CIX SOC SUPPORT
-M:	Peter Chen <peter.chen@cixtech.com>
 M:	Fugang Duan <fugang.duan@cixtech.com>
 R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
+T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	arch/arm64/boot/dts/cix/
-- 
2.50.1


