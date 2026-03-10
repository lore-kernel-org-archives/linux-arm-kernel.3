Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383B4FCC9D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sfPvKaAnqS8BmcFERN0vvPN2n/ae23HRb2weTAPYoYk=; b=RvUNGMlRtz6Ior8xWliO33KjX1
	66VP+tPtVERr0hgcmvw0Aw2vTsgBoqx5C5E3zo0YoDSzeucz68NbKwtdJF0Z1ARGrz3+y/wq66VbV
	GqAOXMgVNny9W9mNghpbXVaMucqk4bDIseYunpRWn7vsZTiV7jrXZOeboHdcxRvLHpmgHvyNU9XY0
	dDwdQ35vEyRC4OzXON8kMcOvTT8l8IoejH3N7n0Q3a5qXsN5LsAO4FxRNsjXeq4J5nrl+c63KG7uV
	D3gTTctgHwhfnFusCz8iW6imghQ0nDbC1dWMYeM8zqATJSI3a1zM0orB2Dwd4LRbPayOrEuXVVFoG
	s4PN5Yvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqyV-00000008oZg-0r70;
	Tue, 10 Mar 2026 06:53:51 +0000
Received: from mail-koreacentralazon11023102.outbound.protection.outlook.com ([40.107.44.102] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzqyR-00000008oYY-35la
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 06:53:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQ+IJJxS2vDnrAsuSYPm15+UhjfGQ7qWZgYOwVv4UZ6NDwp7wEMDuv6tjS51TnmfspGNeukTcqpBvsPll2nxs4FDnbNSq08pBeE2ZHurLeq26VAvWdM5v15jSjPANk17orWVO5HO+htDGqFHl21JjRE5cKQXl9074Bd1dC8k3XWuisjmqqz9uPDB6ImFLqjbQDraz0vQ55ywb5HMCG3lJUoyeRrL+N1q/X9Hggy6t1O3GWZOaIX7Rux+dNyDLhgmaCI7p0xiulELnBVjifBwbRL86sSotTlkjYfqLS+Sg75Aq6HhgMYM3tVdL7XLgV/ZeHw8gO5BzlYGgSxl7lUHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfPvKaAnqS8BmcFERN0vvPN2n/ae23HRb2weTAPYoYk=;
 b=SJ9XHXr1GWqqAfawAiVaQDfWzQSMoEzCrvSgBxZeo4qHgMeFH38nDRPMHH+PgMPVqBTKl8w8drdBtp2ngR5FS7zq3PxliEFDQolYTOYhtE6OHMCldAq5W2VB1hxq5wd1X22b2XEuRyrjvYNfqH1pmECCHiytyhl2tsZuJPwXSgkMpyAtEdmsB/IQKlYS+r7aFPHcaHSvlqQR5wOXg8sqeulUULIs3x0SO428YMwOO13ExHGEm5s3gjrD6hMU3ztHFOnhJmtOFyhAbzAoBClOAlM5u+QRkaO7CdSenVZCRPtRH26e1N0jXQFr1Dv5zdIUoZFmRX29DpmW4Sr4xicmIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) by SEZPR06MB5811.apcprd06.prod.outlook.com
 (2603:1096:101:aa::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 06:53:40 +0000
Received: from OSA0EPF000000C6.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::e5) by SI2PR01CA0042.outlook.office365.com
 (2603:1096:4:193::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Tue,
 10 Mar 2026 06:53:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C6.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Tue, 10 Mar 2026 06:53:39 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8F25041604E7;
	Tue, 10 Mar 2026 14:53:38 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v2 0/2] Add scmi powerdomain for sky1
Date: Tue, 10 Mar 2026 14:53:36 +0800
Message-ID: <20260310065338.2337761-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C6:EE_|SEZPR06MB5811:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: f5d507d2-2446-49c9-469c-08de7e71c2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info: f3GOZDbANMrTxM5wdUneH4MIV3efd9M0DA9nbikyon+JHmZzHODNA13gNZQ//s5CrpBMbfzAquZ2F8Qh2wTs88VEL9gDQ7Atpeyw+QrpP3DFSMrLhIzp6KFJ8m5IKvDFtsZgdEutKC1XKGse89xHk21uFJQTmF+edskXJINOJ0zdYrIyrEhTueUHsAfPMJURun5Domen4blBRKJ4rQUJSYguUtQT3aZ65LBXez/yFbIS5Qr8SDvIVRW5NAHv50Wc4XwOwhnPI9RCL1l4ME9SyIQI3ZIvPGCsjr4B9kD7cycc1jL8veWdCx8MoeLbNwkmGWQypT/lwiqPrbvgIejCRvBLm51yId1n7+i4ZfbUbtCenjbs6s1tnP+VYQuEZkIEE6UIes1DOnoZjs+ZnTw/ioavCoS2tLgW3IOciqMgcaxPO//r7/0tazA+p0txWvXKoEB4JUtjnvcHP8DeGNbEivPPehhFxRe5v2HGpfOMXCdrgXVrqxOoQLQRkHiBzvrszGz+1i4AlW/POK7aUW7SRImTxd3IZ9HPaqlZJz91pMkUxlNZbf6OuIqjg+jHs6HbNqVkMeXy6u00z4ZFWAfF1QHJKX8hBxPzrERrnkbqMH69P7m0567ywBec2mzDl77ObYTl+/rXZ5d5urTsxqxQV4QTlorb8CulH8Er8291IkVVsuvfxy2+Mzj4B14M/uvkDb2ZI1u/uFYtSRQxbaoYwGw4C/K0S3IgEXvWuhgKqXrFEpvLjsn36Ap7j9gvzaXtr4TURMiCyR0diYFG63dE1w==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OCPTuF6oquXzFQSMKWCiKcbiTRtBTBwPqQ1WBiUZYkxUNT8PxVkBuuVWFoCqCTiTXjxqIyJ2apC8PjP8lL7gwRqSb8EViN8Szwh+2Uwf6Y817MD46Js0GubzMBd9KHObz0VgOzQAVa8GvWheoeTHcJEEb/9isjfVwnAOLe9EYA9qd8TG5qDjDpaPkKao2q9sThvlmsW6VWPQOGOATjjGAauhlPc8wcif1Nb+T6kgrvlGiCICTPVGkzyIXHEkNXCNazDOzNgKvzc5C7hOR3LDgJjdf7CxoE0UQkFRe/uIXG5UhBNtIF9IiymD9ahVGDPnsqgGEIiTtv5NouSM2w9RnDMkNuE+HDqnUPG8aZ+qvv5bT+DDq4HB96dTpsWpWFv6mjP5j5Ys+zP8p+YKcpuaNi+frWFdhgcVovPUUHqFHIzIHpaAHPHo//t+FQYk0+EU
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:53:39.5107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5d507d2-2446-49c9-469c-08de7e71c2c9
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_235347_776279_5EFB4439 
X-CRM114-Status: UNSURE (   7.61  )
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

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-pci-host.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- update dt-bindings

Gary Yang (2):
  dt-bindings: PCI: update CIX Sky1 PCIe Root Complex bindings
  arm64: dts: cix: Add scmi powerdomain nodes for sky1

 .../bindings/pci/cix,sky1-pcie-host.yaml      |  6 ++++
 arch/arm64/boot/dts/cix/sky1-power.h          | 34 +++++++++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi             | 22 ++++++++++++
 3 files changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/cix/sky1-power.h

-- 
2.49.0


