Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD87C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 02:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zO2D+Y3wiH+BxldobfoeAVOEeAvC/bzLWtUwTK5S0gs=; b=opVmMVd3F6vJ7hSyT1tujhKtPE
	dTYCUUqZHAZC3CP9nem+v/nSQSGF5lKEVdXvtIJx6m/S0QtFVplCJGCT8xUb2u5tsepqRBEYRIo31
	dq6TLovkjyv7MBjTF/aqjjO9BLo42iNtwLjxgQj/8nX+LyQcVoLML8j45/dSROTU+D9G0k3BLz6Mw
	9eBNJW2/ThPWYeGUBqRx+0xvXcCKjZz/OgNhSR6cT/YEWQClSPROwE9wqZpmLEPidgINRb4cMvFVI
	zH1byEZuP6bbU3/JoZn3qxk3bFE9UqD/aRKfTkI479s0IsjYGxJpvx4QQINeUBXDbtjZXU+UebFL/
	uIyNCdJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkY5w-00000000wtz-1fTe;
	Fri, 17 Jul 2026 02:14:32 +0000
Received: from mail-southcentralusazon11012067.outbound.protection.outlook.com ([40.93.195.67] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkY5t-00000000wtE-2jjj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 02:14:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EN7lll0nbzL7HhYVXvUj9A+/x0tsMdP1/K7pZQ0/f/rhLF33rnOXGQssAs+aN0+dQ6u0b5OuCXOdt6yaSqwCzl50aaZyPzB+idpctNe1q7eilVLCixl9c9K3O5/7gLm5PXyXkNcR0BA9iL8YBELnEYO2D1oYEVMor5zkcbCzfRnK3OD6pXiXKdADmFbZuGvTN+4aagrlZ3T59SoeNNVwV7iSqpalc4FKJkiKbGof+/dyM4zaAGFikzF+yLbUDfkgyWWogzg1+vAgZ4o+mT0nMwcVOTkEYaSC0u4NFAG+qxzzw1XEODIwduhj8d9YXbm+knzCIa0tqVzkmwnS3gDuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zO2D+Y3wiH+BxldobfoeAVOEeAvC/bzLWtUwTK5S0gs=;
 b=okVvUBgf+8B1hOGGzm35w6ITEzqtl74BZfuYe0aw8aCadVIObrenMXx16M5rDnlTvdfFQgU65Zp6N020uIGMqsSJ8Yu4m6AtUm3HtknR4coJk6vbxHU2Y2CLj+xm7Oc1t9UZk9noCJICvqggJSD5IbLad+/a6eICkQnpTZMnv6NKK8cbatQZyT+REJf5Ge+BIyPsbxgIAin9Nn67EbaTDAttRbZIXvTBq6SmCE0f1TCM5GSB8D0feZ3wWtbliXCOxqtIW9jeQ1ZVMoYiS4wsQStDwlsbTzBgnRr51l6O8NvDODHzdYIcxaOZnJLXu8Un4kKhg3BZ/SshxOZYHJ5zXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zO2D+Y3wiH+BxldobfoeAVOEeAvC/bzLWtUwTK5S0gs=;
 b=rtwKExXshi4Icqb13gsRqjnRmac8QU4ZMlVrnnJzIqWQ/VyMYbIa4ABbEJuPcMk5c31XAdqbMTMkJlXQ8l2oUS3/3/7Lbn+9VIGmXP8TvpsVAP5U7Lo8YKU1jBQ8m/z4GdRMyDT6sMRFRpmfuXfcsA0DqMZbgMJE/o6vL6Ktwik=
Received: from BYAPR21CA0020.namprd21.prod.outlook.com (2603:10b6:a03:114::30)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 02:14:20 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::46) by BYAPR21CA0020.outlook.office365.com
 (2603:10b6:a03:114::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5 via Frontend Transport; Fri, 17
 Jul 2026 02:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 02:14:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 21:14:18 -0500
Received: from xhdappanad40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 16 Jul 2026 21:14:15 -0500
From: Harini T <harini.t@amd.com>
To: <mkl@pengutronix.de>, <mailhol@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>,
	<appana.durga.kedareswara.rao@amd.com>
CC: <linux-can@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] dt-bindings: can: xilinx_can: Document phys and update maintainer
Date: Fri, 17 Jul 2026 07:44:13 +0530
Message-ID: <20260717021415.2234865-1-harini.t@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: 027c25b4-643d-49ee-8d0f-08dee3a91c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: qu9FtrUzltv9OgofV67tlCa4T2+7q8bqReYQnZXr7ZISoJaHVRudCHYV0fPtSrfELR3D4OuzyrKsgCda67qvVHDpAgI76NZb0/9a4v4GM7yDE7Ycs1Nj+OI8qEh7Ijn5AXhaq0rMEW91m8A8Vl2nneFFWl4CeuS7JCJS+NJ5xfvc3m3ReYemDGhrUlhyrQ/eysAsI/9svsufHWda6Z2i5wshLakrM57xW066dnS3JGHW6XE62x3WTj1tobwNcAQoHiueK8E6Kn6375/SHlGOi7KSbxrSwmGO71witC9pJGkoavH5PxYY56KdbGeWk+kguMI8B+IAdgMqfdbCXlZlLRXcVGwDuUi2HTBeTt5Ntq7K9lBR5vjf3mz7IYoWtQdxm8OI2R+s9ulHyB6VsfHBM/cGpmLstxHYP93YQuTbmSwGkp8XBTT7UgsnxHZ6P1QNpNfLxc9MIETkrAjLrn4mDytFYMh9gsuF1hd4IRost47zcCCCKECSn0N8BN9J0Upj4zXozl8FBuppB+z9R9RsUp9X50SfnA1r/50/l3XS2dgPuuQagduFiUyHs2X9ujFc2kFA5uP+Zn089PyDNgDDhcp9oyHjO9mi8Ah8xK4u3WXOeablN0nSs7gvQN341LeVz0GKNxMDv7AJrE2xSIHaPzKzMNPLmMkaeb91D26wfB6oRSS/pbRTrc3h8Ri5BeUdC5AMLocIQba/QXX99GLeQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1CFJuiUShuitPp+RLktOeGwNWhQ6AjgV80Ll7J5KlfNzIeYb10nbgOtYseio/2fs+xN1p2eY3dy7uAiMqufZfE05Kzsf5rxfh7mjpCw1gZYogXZdqvGQK7NXmJqZ5uZEJqHdgBL380kPDu7ddKGSX5TP+xv+12V5jhKLnR63fAQCDK/T3HbHBaAoi9w/H4UNthcqf1e5NQg0FJxMDr4p+F8sPTEdy4f5MF84+GAarLi8eMijnRqHh2hDfJE92zt47FUZVoAM0JZzIE4u0w5kzUeUENLXflKi5JZa5+ixnt836nJGpyV5qjJExeiRfxotnwee9pjqdd3LyAJqU+y0dwCPFTGwQbACFWHN3ssv7jZEpNdi63VkTBARDIJZgW4yW4+YHES7z91DbGiTPwea1m5GYaKiVuxn4XwV9OJUvRKKI4hjVsoEjaie3gtaLnZ6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 02:14:19.4840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027c25b4-643d-49ee-8d0f-08dee3a91c3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_191429_731453_19BCF369 
X-CRM114-Status: GOOD (  10.42  )
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

The Xilinx CAN and CANFD controllers can be connected to an external
CAN transceiver on the board, described from the controller node via
the standard "phys" property. This binding-only series documents that
property and updates the Xilinx CAN driver maintainer.

Patch 1 replaces the maintainer of the Xilinx CAN driver in both the
MAINTAINERS entry and the binding's maintainers list.

Patch 2 documents the optional "phys" property (a single transceiver
PHY).

Harini T (2):
  MAINTAINERS: Replace maintainer for Xilinx CAN driver
  dt-bindings: can: xilinx_can: Document phys property

 Documentation/devicetree/bindings/net/can/xilinx,can.yaml | 5 ++++-
 MAINTAINERS                                               | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1


