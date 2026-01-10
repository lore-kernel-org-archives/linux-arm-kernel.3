Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2205D277D9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 09:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCuffUYjG0g2KlVDXY1xoPPVxCe5Iy0gp08VGzYsu/g=; b=s+vxix8ueJteWvAKSCjy60lUEa
	nCfHJQY1+1vndPoMDTctXQAD318TesD6s4ZqTksK6nV0leYi145UuW7NnOSP++UdSCqUBWo8CytBs
	UBBT3qhoIEcMPd06aDthk+6G9nivnVIZ3CQxc7y3sdlinjcS2S89IvnUVRRXady90ELNrgapNZ7Ok
	hzE6IzgJGERTSjoBxo2KX9nQEOaU4m+a4VzrsNJUyVZvqeZL+ksSr6x9JRbVaDj24MZMltEjMjFH4
	YceXtKy1iMypN6MlC0DoHZ71brClWCcDkOgVCQHmKpQRGIUOJnR3Xl2cGzqY0FrkESW5r9NTeaKtx
	Rku6Ttnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVMQ-00000003MsF-2NLy;
	Sat, 10 Jan 2026 09:34:18 +0000
Received: from mail-japaneastazon11023142.outbound.protection.outlook.com ([52.101.127.142] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veVMO-00000003MrE-1W8H
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 09:34:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5ggzPSXj16WLBDVvXGNlVhgmKhFgFVstjrJUF56juVFH3QOGiD+FgC8vxyp+UKP8M3bA9lhdAT3NlnbiqWfremAq/bQOa96gf5i63fBwoC9qxhPAgjxY6PDvmSi8xr5fJ33FswsInzgBY4hgJ/zNJWxMLESwOJQwowmGOSFlyeZmA8/8M61qIC1Kq4T3nDNwoh/lv+bsVZ7C+dyijq82Y6cU1T3/eQ+OkDdjh2QshjNtCY+PXUQ5Jbbzn0fpD9aw6Vf5d45xBTkHbaXp3Mr7ZZ9p6/93Lp1RmLBbn8WUXXuE5NB8S8eJn0/uAvH6KrPG+7Bp7M/1YhPvA+sa4fj4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCuffUYjG0g2KlVDXY1xoPPVxCe5Iy0gp08VGzYsu/g=;
 b=ouP8YLAsd9xOXJ11fnFnnjOUucW4htart0T/EXb/5ZXIwJPMR9l2tpt48ssHnkCzCgBg51Lbi/0psh9hkNvo935kzV+EOOQPeoGTmLccPwWl1xYwXuEYXXUMlx3yY5BlO440MflMSy/IWu4CCI3ygiPbqWgVZi26tNy66jUSZFRB4+YhXlukNQXNuw9c+Rd5NMCyebof+hXiolwfZwePsJBCg+4JZt+SOHOCrkf/goEfFZJk6ltsf54wh9khNQ6GjgG6z8uxUroGV9/YICbpVLsCrCsgNbBa/LLTnsVEtddfdqFd4TqNp7zscmS/owfl7ZtJid3btEe6x1UnTidPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0070.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::34) by TY1PPFF38CE2865.apcprd06.prod.outlook.com
 (2603:1096:408::930) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Sat, 10 Jan
 2026 09:34:08 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::9e) by PS2PR01CA0070.outlook.office365.com
 (2603:1096:300:57::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.6 via Frontend Transport; Sat,
 10 Jan 2026 09:34:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Sat, 10 Jan 2026 09:34:07 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9A3F540A5BFA;
	Sat, 10 Jan 2026 17:34:06 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: cix: add OrangePi 6 Plus board
Date: Sat, 10 Jan 2026 17:34:05 +0800
Message-ID: <20260110093406.2700505-2-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260110093406.2700505-1-gary.yang@cixtech.com>
References: <20260110093406.2700505-1-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|TY1PPFF38CE2865:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 96b15c3a-d6fd-446f-165d-08de502b6728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JrG6KC3+ksl98BCXIFFYPwPRZ+HPm0CWAduCXw43Vk2NE4B2/mJNPkvSBTHV?=
 =?us-ascii?Q?bws+Y8fhTfFrTB2Awc+No9pkYECJQWLc1okrW/Cc3wYH8cKScJqPvFCs1zlZ?=
 =?us-ascii?Q?W0MrJo8zylK47H0jXaenuaYfNgTvU8AD64ZdS35oxPjj8hUu4Zp9aPkxJQ8z?=
 =?us-ascii?Q?2QoSS87fFHOYFSkRddc3yQ2W+9qq+6YUxKToJzr34POzKYWkOj5Ps6v0uZwu?=
 =?us-ascii?Q?Fe8G4AVt+xPDO5j06GOK2Kqet8UFrgj9moEM0xwJP0F0FH2JhsrCXHOL9X9U?=
 =?us-ascii?Q?GxvzA++y/bMzDE4N+ZCKZWqAwwPej6f2J1p+VVQ4+rkh7feQbsrueouTgfz2?=
 =?us-ascii?Q?x+Jnua6E09Xd4z+l2lGEb9VyPaz+7C2I6frkTDJJtHD+/CZwFquStEieBjkZ?=
 =?us-ascii?Q?ig1XQfh/a36UDmYjMrJM28kZq/exznDdKzUe0iMyO3KwJaDavmna8d9VlQkZ?=
 =?us-ascii?Q?Nf/uKPNoANBBRxfc+AoGQxFx59WwV6M7X+XUOpz3hq6oxuMGTziaG7wincOq?=
 =?us-ascii?Q?L3iLjsAi9cBIDVAzkuJ5m9ezLOEFnkRHmfLGBBzq33cbLN/8hYjigCap7hLB?=
 =?us-ascii?Q?q7G8CdLOCZZbb1PsPYUmjkUgE9gMZhkedQAuhzUqmBbo8EXc0PUVeVu9lKvR?=
 =?us-ascii?Q?DnuH4vK91ct6+uVOtp6q93GPjrsedRz7+LYqZDE1/b4x7YaHTgCpZtWLJLEk?=
 =?us-ascii?Q?8oDoCaEPShPob+fNGh5vI2VBApw6KE8MFvV6pG7F0oUcdcFreXZ32Wm6yWV4?=
 =?us-ascii?Q?RVmt8gAzw+4AR4c0aIJWpAtaFjqEVgDoAdrNR7ozTLsLiCFxQlXVRs2XqrNh?=
 =?us-ascii?Q?Nl0jpgrJD1a1/1/0ifcb2oMsl4KQFXJWcZaRX/IP7b5LRQroiAyWID+D3hgY?=
 =?us-ascii?Q?usqF96vCFUjOY+aejZTLYfA+uKbwEvRJauYLKKPdyfF7zm+E1aWafIhubWBD?=
 =?us-ascii?Q?reM8Nn4OCSbxzDutC+q9aMMz1KcJhjnUOTb3JqkX4HtHtdOGPsXJpbAbs31f?=
 =?us-ascii?Q?LHQwHlADE19p5vQBuiKYUESrEJwFxJcC58sZELLmHNXVhOmjcV+QwNzCWaSD?=
 =?us-ascii?Q?G5PZXV8xaipzq+akfTIHQsbF0e/59wN3d3Vz79MivN7RKZkAzOsfmW/5Ou9v?=
 =?us-ascii?Q?R0qVJYL3sBENw26fdrJxFglyMkLAdgZR+p+QCVxa1CiT7kKxjw/jh9805KOY?=
 =?us-ascii?Q?Xr0mggy99QwnpYhrdrnhOhnDnOiyCZUBbscQBsYcNSi+scdwd3KJbJX6O79A?=
 =?us-ascii?Q?0J+LRuxCsfsAWM1RHAxoP5IXCM1LqiNbPkxwswbv0ErQusvzLM9Q2j+pzKDe?=
 =?us-ascii?Q?p+hcm39fCzKJ3pfeweHAcxxttsv522ltguKEfhJ3zMxResHBy31ktFJKKein?=
 =?us-ascii?Q?kdKMI2TnKD09kS4jihpEyZmpCzdZ/EclBzknkppAhcSr4TctfeAYX8pV7wGx?=
 =?us-ascii?Q?IA/krIXMlcONHc61/oORt612AaJDYGm9RW3GURPwjkzYlbCIdeUza7nOz5F6?=
 =?us-ascii?Q?/IjiUk/UTHUewIosUXBvENZvfHrTtRcUshUp9bNBugvdoTYJTuoUhO9eaqRt?=
 =?us-ascii?Q?1jg52ao0e2tQQFM/GMc=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 09:34:07.5355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b15c3a-d6fd-446f-165d-08de502b6728
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFF38CE2865
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_013416_404261_2EE35649 
X-CRM114-Status: UNSURE (   8.31  )
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

OrangePi 6 Plus adopts CIX CD8180/CD8160 SoC, built-in 12-core 64-bit
processor + NPU processor,integrated graphics processor, equipped with
16GB/32GB/64GB LPDDR5, and provides two M.2 KEY-M interfaces 2280 for NVMe
SSD,as well as SPI FLASH and TF slots to meet the needs of fast read/write
and high-capacity storage

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 Documentation/devicetree/bindings/arm/cix.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
index 114dab4bc4d2..21e66df7f696 100644
--- a/Documentation/devicetree/bindings/arm/cix.yaml
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -16,9 +16,11 @@ properties:
   compatible:
     oneOf:
 
-      - description: Radxa Orion O6
+      - description: Sky1 based boards
         items:
-          - const: radxa,orion-o6
+          - enum:
+              - radxa,orion-o6 # Radxa Orion O6 board
+              - xunlong,orangepi-6-plus # Xunlong orangepi 6 plus board
           - const: cix,sky1
 
 additionalProperties: true
-- 
2.49.0


