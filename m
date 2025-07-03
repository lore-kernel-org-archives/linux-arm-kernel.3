Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA52C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=; b=jXTLB3nyBV1dsAgZcsa9vwP3VU
	S06IeeRlrKofzJHeQmhHIorLU8MOFacnEnpBn8SWUtRUO5msBIFscApn1mU89/X4a6yKuL7dfhrEv
	CZcaShyZnh9lFt9O6p12gHTz7Ua0ne2zN0Da8fivByWKD4BUmF8y2NQj0zMMb/ruqi5RLre7FIJw+
	FCsyZZPQd1/BxUiYTYQwH+BFeFgfKNo3XxHk/LQlFtkcNjXjREoUF32J7+Nia3/xZmEBlg52Mryjl
	0pWNyiF5uIyjqc0cwtIktCd/F5Bu6xtJsD+uArRT567Ddz2P2ny7ZNos4Ldn9HlNZs9DcBNGnIDpp
	ssZAjKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRU0-0000000CcQU-3jv0;
	Thu, 03 Jul 2025 21:28:40 +0000
Received: from mail-dm6nam12on2070b.outbound.protection.outlook.com ([2a01:111:f403:2417::70b] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXOYO-0000000CDbn-3zYf;
	Thu, 03 Jul 2025 18:21:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faGJXrOzKUiqitCRbX4kXaHhCIKghYLBC0DuV2OHaz357ddXoBCqoIHp/cMBW3e1BbvCit5RYX7gedVFAyE4IyAis+/g2r3GHQsbNiMUXiXlK9CpfaPYXjXpWoo/tbO47vuVRiG8/67+j5TdLaQTvIh8fw038Xtj+x/Y4CwoZ9BX7cebkA7IjbPFnoFndN1BETtAfrkX+A7jMyWmev2XNZfGvyngjpjnOp+uLDE3U2bHjVB09Q4iDIg7WsrvQgmlrOhNgplV5J05nt+Vbmy0B4W7rzZGkgW1ONb1Y8n2G6eye674oePcZ88qM+yD+AWSRM43bQ6KIq2fOzApbQbafw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=c31blTbSLQVdRKklwnGEaBxJZ7j6/vZw7owP3k9I7QeihoUzfiuOivOmHYFUJDL5m0XgAKhmz6EAUO45WEmwz7vQY1yEQZpl79m40v0s6F+IFFQP1Qnk+kqAhjfVt9aLHmjcDWmgcF5n9CEvMhelDxqcKJTjjq6jigWFGbEk1fnB5F0xL4NO4OnsrbKSMeORAGW3RhFZWmaK9DAyw4/BxLjp/UNuB+vjhpsbpNtDH6zwd8D3QA9p0k30rf7GMNO+kR8bdkFZlxBuKfYJjUrkH/82KVGkqXR71S2NCXQtKvkZu46vwvkBajWCNQ43qwR8KCwItujTKjTNRPYXzuTQ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fC1wGXkjTgm9sdaH+SO0MwS6z+c/SPQ7G2aTB/7FYSg=;
 b=XGZQd+Og826qBVZa9egLYTiTrVhbsc3rLrA1TlIyPEOas3XGLIRrHtijFnyq7vXYoxQ05Y4ZzFlh1oF4TQBT1oIkf3TAxspIsmvCJ8bA0eyWqIR4IVUAJVL7dHJIjL9w8nFjGog4acGRLuUC8un2Vc2s+vNWawQUA03XMMMZcnuDG7b56yl+IkA8a5tmWe+PXEkW2/KLvMIaW/x24rmPNcpbVyda67zt9hLaYMeVRO1wKkBCDy7g3T12LpQlH68lKiIxoiUSRZ13yEnf2AF0cBIrR2pt8I8TSeXd04Y3k2Ba8Io5z8JRJEsdFRBmPBqf3HvJRFKZKVusH6uoFr1Jyg==
Received: from BL1PR13CA0319.namprd13.prod.outlook.com (2603:10b6:208:2c1::24)
 by BN9PR18MB4185.namprd18.prod.outlook.com (2603:10b6:408:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 18:20:53 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::a2) by BL1PR13CA0319.outlook.office365.com
 (2603:10b6:208:2c1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Thu,
 3 Jul 2025 18:20:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.1.1];
Received: from [127.0.1.1] (50.233.182.194) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Thu, 3 Jul 2025 18:20:51 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Thu, 03 Jul 2025 11:20:43 -0700
Subject: [PATCH v6 01/10] dt-bindings: vendor-prefixes: Add Axiado
 Corporation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-1-cebd810e7e26@axiado.com>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
In-Reply-To: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 linux-serial@vger.kernel.org, linux-i3c@lists.infradead.org, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; i=hshah@axiado.com;
 h=from:subject:message-id; bh=76okLidoJP6XC526Dh0oE+YzQ6GEuPrslK8PDO1ML0M=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoZsn+EumHAiTylLiINBxXoKElRs3bnVrSjX4n5
 DBPnA4G7W+JAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaGbJ/gAKCRDxWHMRoTLV
 +yduC/43AnBIEnkYdyOJb0vb/f6uxIB1ELlScXdoXlsznYC5s7M3VsayOtzTHZfadVGGYdCzEGu
 JQ1b1LlQF97yMpEAJHH/D0aFhLoWiOIqQVJYEWcoJ99Mc1nuF3vHUddmv32QcxijVLKAbRZvbXj
 KJxEsblfmjMWCTYf4iRLFx5hsA+1Gld5bdv1TuA8Sc6z9a+n+s4VicZxJ765FUqtCKiTYy2tlXd
 Bkc+Dyjf5v9KhfflXvrp0NhTGUehJjh2ClP2mcJMffCQFjkVoqir9WLRumOwXAttVe/M1z654qL
 ZVeH2TSDmTkE8p4/sMJq3FDaUb/bkcAeHSlxNjCGn3DItMj5iaK03kZCFSQ6V0JpZKocFshqEEp
 BOaW3Kmjk71wEC0kem/6nAQlNXG9c212wvnI25cOKL8p7P50mEhwxSgz0FK2MSbtmcl8aepgcjz
 3Iwjx1TbXMpLnfpoE7hZ0P6W93ThPhE5Bc+ktT1XATtNxF+MVDVcw2b4yAqyBceOUXQk8=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|BN9PR18MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b0bbed-8df9-47cc-c02d-08ddba5e58e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnVhSnhRNWtNSjZOdUkzcm5sUVV6OU94cU9kR3FOWnV1ODB2VVp5MmRBdEF1?=
 =?utf-8?B?WTVOYm5sUTVZVjZOc3RDMWZkcERGSGJxVk5nbEhZVWxWT1JIZTJZZFpQejFM?=
 =?utf-8?B?elRTMXpETzVYU1MvajBZSDZURW1XbVFhWThjL0NFcVk5OG1GL0lFRm1zd1lN?=
 =?utf-8?B?VEpIWXdMUTFkTHhZazM2TXFRN0JxTGRWV2tvcmgyMmNQdWwrSXZuTE1UemZu?=
 =?utf-8?B?YmtCMk4xZ3dwaUVSZ2VSckhxUW9pK3lsQkxWZ1c1bDlUYjlEWW50b3FKdEpE?=
 =?utf-8?B?MzJXV3FtNGNuUjlsR3pzZ2FEWkJkb3pNK21Xd3FmMk5sUmZtRCs2VVRHMEpY?=
 =?utf-8?B?TTNOcWh3N3ZyTEQ4VlRPdHNzVHB0U1hDcG5WTEFiZ3dYNVhDVXhKRkFKOHBv?=
 =?utf-8?B?Q0dJT2NNMDZoSkErenVTNnRyOHNuaklKRUJRUGk0eGg5aEdGRFdPclRVaTVH?=
 =?utf-8?B?R0xFa3BEQS9Bdy9rWm9ueGZzcjZrbURlbHlYcEJVVHQ5dVN6bE5DbHBIOC94?=
 =?utf-8?B?eW8zTzU4UVdraEJCVlJFa2p3cEtSVEp4RDEzSlNDczg3a0xCbC94anJiVytL?=
 =?utf-8?B?QkFyeGIyamVWMVZBc0FLVUtPZ2kxLytqNldvUVZSUU9iUUJRcmFPMXNWemRi?=
 =?utf-8?B?ZlA2WFpHTndQejY2V2RzQXU3Uis2Uk1ERjZVc255T2JNWUM5MTBqMXRyV0FU?=
 =?utf-8?B?S3JWcFVLc1d1U2JGVGErQ3ovZWZ3SVhhU29IUUlNOGJZellTK21pQTBvazlV?=
 =?utf-8?B?WjhtaEhLZmo3cUQ1dEhLYWZEMEFzK3kySXRRaXZpbUlHaklmQklkSXVMVVpM?=
 =?utf-8?B?dDRRN2NSbUptVmJ0UDBWRmlva1dVdE9YbWFESS9KWWJMeDdYR3dQbDlUUFd4?=
 =?utf-8?B?WVJpclArTzFBaGJxYnJiRTU5M083QkVIbTlPUnRPakllYU8xY05wOG0vWCs2?=
 =?utf-8?B?dTQ4eTllMWxKUlpkWURDQmo5N3YyQWQ5SHBoRHJRVE1HVTV6NkRESUJjMGRC?=
 =?utf-8?B?NWpsWVRjMUg3WlA2VzcrM213ckowKzVkdnFWdWs4Q2NJb0EvVklGSXRQRGht?=
 =?utf-8?B?czhmVnBOcitETnQxdlk3S0JldFBSV21EWjRQZzlVd2Y3MTQ2MWVjSWxFSXVQ?=
 =?utf-8?B?cS9xZHowNnZ2QmhyR1dxS1RmMHcwSGpXbXRRNVgrQ1NCaFZNZ00ydVdTS29r?=
 =?utf-8?B?ajFGZGhOMW9yT1VxVHZybTNXQU5UQi91bk1DcFhRYmM3OVVSLzNJSkRVdk4w?=
 =?utf-8?B?WG5HSnp2QmV3QTRvRFlVU0lrdjMyN1c5QlJmZ3JGZnBNTEFRdDVERWJXa1RC?=
 =?utf-8?B?WFFLd0RjV0M2SnlOYVNHQ0FaL3JmL1ZjSDhFZjZodWR1OW1ZM2JPY2VKcTB4?=
 =?utf-8?B?SWp0NGgyZzZ4dGYwTXpQbEtvbm0yVGxrQTdZSHRZY0FPaEMxak14bTZWK1NC?=
 =?utf-8?B?aldCTHpFejU4aHEzbXJ5MWxCc1BQVjRvaS9MZm1JdzFYQ1EzM25iN1Uxb05G?=
 =?utf-8?B?ZU8rTlNIQzNnTzN1RW9OS3ZLOFlaemx6VndxKzAyZU4vR21UTUZIdU5meXBC?=
 =?utf-8?B?MFkrU1NOMTdPM0JxdzBuWG1RZWEvMWtTbUpxVk5nL2pnaU0ycUljZ2lwWkRN?=
 =?utf-8?B?NjZjK0NGNmhZQzNXZUNmK2J2V1pDZGZKM2pZTHptLytZMWxZUEphSFhjUjlq?=
 =?utf-8?B?RzhmRTdwOVI1NTNCTmZtZTgwT3RPSFNuc1pjSjhHdlQ0dXRwYVF4V2kwdklS?=
 =?utf-8?B?d0hCaWx2S2lRaHZVWmFRYmlIRjJRU0hERi90QWl6WTFUVkp4eWRFUmQydHpl?=
 =?utf-8?B?dUpzeVhxTHhsNU0wMDhldlpqdlpkeTU5NmMxYy9SYk85RC85UnBGNGppUEdQ?=
 =?utf-8?B?L1JBTk4yc0czZlFCSWlENHpJWHBjQnFJcmtSckxQRE1aZEx3TkRmeUI4Q0w4?=
 =?utf-8?B?V1RTUEVTSkllcXU5N1RuYUd0OTZleitPUk94V3JIQ1ZxcEMwNUt1NTRXdUNp?=
 =?utf-8?B?MGxiQVRmbWVBPT0=?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.1.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 18:20:51.9914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b0bbed-8df9-47cc-c02d-08ddba5e58e2
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.1.1]]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_112100_998564_3C267EF2 
X-CRM114-Status: UNSURE (   7.73  )
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

Link: https://axiado.com
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6c666c8b557c2ef385918e5e97bf9..5ada930c79e3b32ff1bf194ee66bb4bdb08d539e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -200,6 +200,8 @@ patternProperties:
     description: Shanghai Awinic Technology Co., Ltd.
   "^axentia,.*":
     description: Axentia Technologies AB
+  "^axiado,.*":
+    description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
   "^azoteq,.*":

-- 
2.25.1


