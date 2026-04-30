Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1943FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrIkToKGTmr+Zay7YKQD63KJhn/YaIVFulQebV6jPh0=; b=aX0KRwzagongW+AVICSYAqWhZJ
	BO+pf3vjNloWSzH28BqsHM3AggvpOaz/U2XYJfYvtKk44Sww7HUFWVrU0h5bZbdP6ZDkhu5+jJfMd
	nnsBIJovKpIGI+KCXvjKZ8xPoocDKV7rkF1E2mpIEaLp3RsUDpI8yWdSY8NZxhJWkOb5159ZQrosB
	CfwuPnW+csLoQWRxs9UN1aYZPWU7fVCeUpeky9z6Jm9cOUkOinJRfWksTeWMh1GotdFHGGPU1DbFk
	+ehnxQR80fmfvLezMSfTKMqut4WvwjxeZB2KzL597cwDcUK4xU8xGZjkSbEWEUz8cuBXM1dd0Up7A
	4XDcsRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO2Q-000000058Bn-3jGF;
	Thu, 30 Apr 2026 09:50:30 +0000
Received: from mail-eastus2azon11011040.outbound.protection.outlook.com ([52.101.57.40] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO2I-0000000586q-3vQF;
	Thu, 30 Apr 2026 09:50:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZvDUaMiYz8hxexPeLOiCvqXKrLDwXS89sRYlq32fRaozuLwyEG650SqyNzZ8zzrbz2m7mpHPMnkwPjBtw/vP5KKeVFSaEJYdoSvBFCNle5/7jdbIjzeNw7xs572vMkVmeFgbZGRm6xBsesSEC32BdOlWYJxLehPcjW8nRvkTZObAB6tHwk9v77GfpmQUB39UZXcZIUZWuBGlON0l523aXluWoVPpB7NOjL2PdS9SCUohcsgGCZRZx06C8k/cwHidz4hV8x459zBbZY7Q+e5kTMLbBFhB/dR50UPXxKnStXjCvLD2g0ziCmzejCI78i2tImMKe05awMzqx0lLxzoQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrIkToKGTmr+Zay7YKQD63KJhn/YaIVFulQebV6jPh0=;
 b=YS3h5PO2+r84K5RrHy5x6053ebVB9LlBTJYO0LagSt4/Nxbnn4jfGeh0wv7X+MLxXB8cH4QVoQ26nymKw+MfdaylW0mvn/XvFTs6QaljjBLAPhKOnbZkwJ58oVeFWLoIQCc/oCH7oWQUxxjfy5sKw7A8621qzHabIJCA2n7ZSWf0ogM2f+CtDxmiGpNfbeey7SD0XeJTAjGuyLnFyJlUyKDMF6ceHNoLUUkS9ao1E3DYrSZMK2Lhf+8JjD2BQzxVLlHhHpaHUKZgMzdx0QDfbETTczG55mQ1kCaRJb6qFyoPK4h3NND4G2rUd524m/0UvEGm3XIQ5EJEQ95cakNsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrIkToKGTmr+Zay7YKQD63KJhn/YaIVFulQebV6jPh0=;
 b=13YRDoQK9w2rzX5hxxFRy6lN0FP5hqX+hFZeikukfD/C1tj+seU4wMl8pfwHEPmW9chyjPFSkqlmUsWff/H9Ug8vhy8fuE/fiyU15RlrQTk45d3BHioPFLC6QeXkugaOgXTTcPeT0GiG3aWzViDDM1My2tN246d3Eg/CGL5ewo8=
Received: from CH0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:610:cc::18)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 09:50:11 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::62) by CH0PR03CA0073.outlook.office365.com
 (2603:10b6:610:cc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.31 via Frontend Transport; Thu,
 30 Apr 2026 09:50:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:50:11 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 04:50:05 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>
Subject: [PATCH v4 7/8] asm-generic/runtime-const: Add dummy runtime_const_mask_32()
Date: Thu, 30 Apr 2026 09:47:29 +0000
Message-ID: <20260430094730.31624-8-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430094730.31624-1-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 635a39a5-8cd8-4c28-8992-08dea69ddf3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700016|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: NtTKV7HhXkxccMQcABt8Et6KLukB1XJlA7OpqzQtCNRyT58sWxeKKPh9KD8kSHW1IknporJARb4pjw+khJJT3Kn1f3HxlJ5Jpid3mlm7nsqNI2MVG2+BUzmlMiHnuOgAZzMgEve8SGQi0tqn/ZS0LB+pMz2VuetEx4KdR59alTim1T+3+Gg+cWHHgGlHSLp8ZbohYK4xyjL6ixcpOv4RzbEDCZA0pR8Ewo/TOyWXlnHbjfOdeDeUJVMDO9TjW6ov0REAqS0D5df7cZy48lgSDeE+Ugr1pUbXXeqPa8grVZ0Rsjy0jj1iPo6/nUUroyixfRHX0bm3l+N3Zmf2iLIwSqlZxkjuWYuinLdKLFnRpTlcUg9bzoOAVQAKQ+Q8z23ns1VhxIb3R1mubQ38tUVisN6MNIxiK1ZMTWdta62+a2nousdbm5b4f7LWywUK2dgsZL01hrm/gYno2kquEciuXeI48oPOSznrclX2UpHQV1hdm09QKkMHdg/qbxGbj/G7oevvqBTZ+mUZk8Ch+AsOCDs/aS84G7N11hnkUfKGx/sgdxmYzALJva9Pl6L1CgiOhRnqbScPxdK/P2GINJr2UbbbM39HGwQqpd3DxVd578LYeqqHdlhKbIgR0DMAgiVVGfi76kn8XbJrslJ4PSGpRF//N0lA+lPKdtYxpjl6po1TFDg+ZQTRMbxq52zzsOgXCbtGcXHYwAUAcMQPrZ+Ba1QDqtn1ozCW71H8AuyZmH0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700016)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QiVOjlbNM+ocuLQKcbs7cFVj7w3X+V36Ojvd6FCTRYv8+Fa9qwgNRGutEm/AcYyjCU3HG1L7Nty6r75uPHkg86d/Fo84/A6roBDoSiGKaLwAopNTxadNMJtXugTYFKVskvGXt/dghtT2bK5nn6LN2nT4IdjAj4+qed8ZjZfGph2rWWCCEU8k+7dAOkmupfFFbC9h1AP3dsJ0y5/Lxp2GPJKuvpe5/KdKqfzh0lMY/VDGtSDL/tYj5Di/89vqAjG+uS2AbKz0eSZSCpZNfPoFgIucH33LjPe3yXc8Z79gCttUSZginfIdaJ8lj1ysPRl87y6yY2qgzh3pqKhy+1iE7kCiT1CN9Z2YVoHK6lSKKhWwvX1enQNu7iq5V1WT6gDqR6J2eUE+IIZS8z0hxvtKofIqYS0Tvz93xtsnA+yPCCtiF48zqS8cXmOBmscP0fs1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:50:11.7870
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 635a39a5-8cd8-4c28-8992-08dea69ddf3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_025023_700377_157D8662 
X-CRM114-Status: GOOD (  10.23  )
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

From: Peter Zijlstra <peterz@infradead.org>

Add a dummy runtime_const_mask_32() for all the architectures that do
not support runtime-const.

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v3..v4:

o No changes.
---
 include/asm-generic/runtime-const.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/runtime-const.h b/include/asm-generic/runtime-const.h
index 6704994595145..03e6e3e02401e 100644
--- a/include/asm-generic/runtime-const.h
+++ b/include/asm-generic/runtime-const.h
@@ -10,6 +10,7 @@
  */
 #define runtime_const_ptr(sym) (sym)
 #define runtime_const_shift_right_32(val, sym) ((u32)(val)>>(sym))
+#define runtime_const_mask_32(val, sym) ((u32)(val)&(sym))
 #define runtime_const_init(type,sym) do { } while (0)
 
 #endif
-- 
2.34.1


