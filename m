Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C10ECC83F04
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:To:From:Message-ID:Reply-To:Cc:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ENYija67nYKzF88wY+ApFyoB6lh9ldm/03zlH0/EzHw=; b=QhBsndEM9yCmmGBmTDsiwn0d3/
	e4pXVpnpeGapRLlInzy3Gxq41tx9Nv1R987pSG0j93xd386PJTWzzH+n5jtM0KaOgiOlZR6rfig4O
	LCzWCe3sC9ZYFUGSuPdV3IQndUAqHMbd/VZMvg5gY1FKaUwQFV7DkGAIUM3zxfGxjk2Mm0uVwzKT2
	2Ux+WA3AsIOshXQYRPnmf/CBSc2QIPfalC3mHCcD5g1QDY0ERLY2q526h4+O6ffa7fW6gzSE976IZ
	5JWHzYrkt3Zgc0GFSHkYl/f2oc07w/qt++hsWaujJA0FeKSGV645WoySMzMIjdctDtgYDSAewykFU
	s+mQT9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWcV-0000000D7CN-37uA;
	Fri, 04 Jul 2025 02:57:47 +0000
Received: from mail-japanwestazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c406::1] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWSC-0000000D6Dq-3714
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 02:47:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MikBxEskAirAdzt1QFEwzl7FZ+sGbWWhHC4APVLqpT5nJj83KFpYfbdCU351h5Zj0H8gIcYajB76lQ0ZprEpuWBulIZK9p83g/Uhil7o/UUcJFRsVhXJf5COkxZ/+Eoes6UnNG/ftxySOBy96i/1GybHLfs2BaAL62xp4LCmpGeUvY9Ik/AM1mJ/6/MN5OHoeBfXVo6pwQKm/7Vj4pJ1lDCxpqYgVkoRL0POPNEP4CdfShHWnb2nBLkd0izxxbS6CtebJUvtgValf1w1bQpphKTfy3g2cJdlXB5DljnVvQ9MmC819Vdk0Akcww2bWLZ3MKn1AH4GzZOQncqiTVkijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENYija67nYKzF88wY+ApFyoB6lh9ldm/03zlH0/EzHw=;
 b=Es+JlMa3wGexPgwJ+47epCVc5E6ceu9QRIYWqO+WQBe8QY6pZh0oP2f9LUm/sHc3c/A6KB7L5s50aToQvYjGwBjJYfgCyjDZ3kaXtF56hWigOl6890nAbOhtDzfq92RscvYZyD25gBYL0nd/X8tQHM2ueQQ9CJG+yZXTku5pg1jK7UzkfbuBHy3eJV3i5dPZC/kQSfE6YqPNrwdZ+hpOkuRbPu0kT8bUehA3RiTiarxRgC+yn8lU8i2eWG2gr4g1Pk2Ns6RTPMlO1bGrGvFajwBiFZgU4nTEZs7YbStA0ZHRthLsOEm6aMOmRq3R8tIUlSI0jgZZ4shKEjPd+o4cdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENYija67nYKzF88wY+ApFyoB6lh9ldm/03zlH0/EzHw=;
 b=fyy5T4nZ04iQCI4q8qk5mU6rbW+eLNu9pvvicY6myqjKQq6DQNoh7JzlmSrcw+IcypmUbHBcuOzjz1GtFSbJSihgpAhCa+/BBIXz8ryZFZuo/jpOmPGxQsj1V5SV9AOPu1By+RI+QgqaWOam0pa5rMr9y5sh2PmwrSIwFGYH8Gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12880.jpnprd01.prod.outlook.com
 (2603:1096:604:340::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 02:46:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Fri, 4 Jul 2025
 02:46:57 +0000
Message-ID: <87bjq0u0ym.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 resend] arm: mm: fault: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 4 Jul 2025 02:46:57 +0000
X-ClientProxiedBy: TYCP286CA0129.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12880:EE_
X-MS-Office365-Filtering-Correlation-Id: b720a08e-7e16-4eed-ca33-08ddbaa50b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xZhkSS6IC8qV3juckXQ9Nq52IPFYWZF6mKpsGOdR4mr4IJWz8HRxT+7Ut3OC?=
 =?us-ascii?Q?5YP//ffrfuLhLMtJxkWjS1lVeNbeOD4fJosQ/X8a4h/3ue5Ulan8FyIXSNfv?=
 =?us-ascii?Q?THYD1NOcfQG3iCaQSSUEl8saFr994MlEfnNKv89xpz6aUwTDMn77WcAPiPZ5?=
 =?us-ascii?Q?zRC8ea92tT4EZBk6A8HI0XXGpzyJ6DUTrFR2AFupmwIHVfkNWVmxvJUcZORB?=
 =?us-ascii?Q?U/CvRdZlIGhanHIzMqobWcgR6wLR+WNUKBv1k6AeKFmM0wcH8oN7Bq05AbUE?=
 =?us-ascii?Q?axoryLJHTbVx9rI6u89HkcD38MGsJMhXq/PQG1aW/FtHBQMAIoTaQ/S3mEyL?=
 =?us-ascii?Q?eN3WhA0lhuevPolsRqo6NdWUtuf3ljC8oQlAGvvURGAGcmbwlGLz5ZRDff8v?=
 =?us-ascii?Q?mIFZva/0xQ/5LpVWwsSCHLsGbj9et81oXnCZKT70H9OYy5t5EczMKx3BEMLI?=
 =?us-ascii?Q?IsBU+1UXuXg86oKxakBkv0Nhvu5hnQnaf0Cy2VCdsYXafTANylwGwv1+XUCI?=
 =?us-ascii?Q?U7R+56+foU1ndekqwZbpJEHuqsgLSq1QMo2bNa+Y6Q/rJejBdi7DJtVAc/qX?=
 =?us-ascii?Q?dIqCcwUhlWfcYyq9cP81Y62Uc0xxIFdd//PLU3kjpIuxNi2sAk1c52ifAkFi?=
 =?us-ascii?Q?GRAtdQwCrsqZHNmG9taFHJni5+Fqu56tLhMQjbkgSAjLvpQqqXIVdGkHJD7v?=
 =?us-ascii?Q?xvPXeFGZKyYnAVTkHHf41l1MJ0nMd7TdnfKoz7z/3jwHoXb7ydAm9pWAQ38K?=
 =?us-ascii?Q?C99Hme4Z2WkWsNOIkP9sBTAkYKftTh34agds+WGSAvlsNDn1U5nqGGrKDjg9?=
 =?us-ascii?Q?5DGK5cqsk9CzezTCT+QF+NjHudQeXmRGWMfYXqHQRA6O86uD1/AKQByK5LNj?=
 =?us-ascii?Q?Yf3GhYjGEiqLeK6zRNP4J59MnDQVDdKTkPNXgm5mPaAwZzjee2bYFyVIRPqb?=
 =?us-ascii?Q?jLHH4SJgxW30vX30hiRUzPoTyiRcXAv+LhlDzfcE+4g/f3mhR9pxcwvIkV1w?=
 =?us-ascii?Q?WtT24wTr0E9loJ+2ojtvZFqhBPdokduPTft3bW0uQ2RAW0TCZfHCRmXs6PKT?=
 =?us-ascii?Q?aRZPKeu/82S8QTXoMaODJNKwQo8zli0NeKV1VMlFSIsoWYp3vrSA2Kbhl7BY?=
 =?us-ascii?Q?eUt/b11l3U94aRyA8VVRDOJyPZRcuDsTOxfPY4AlsPpqqNQHZtmNhBLbAAMo?=
 =?us-ascii?Q?5Xw4iCWe5WYaGKMBxjZZsgDyoVh/r4XnugNZRs+Nc/jCem8JUCWlGRRAbxAR?=
 =?us-ascii?Q?EejSoLZ3v7pcqduntubBUD4BzyIvUUkfww0HMfbbTtiN2XDEnCItKzGPydgu?=
 =?us-ascii?Q?MrqZcjhrzSCUDi6nRHdl5MHK0EgmXcS8bU5UVX7ClMFL7I7rdopTf9nLCpMQ?=
 =?us-ascii?Q?WsloScGV8U+WZfsBx6UcgNq9uwYk+mfEVKAgAS4g+qsfoeFjczoShWdBzzwa?=
 =?us-ascii?Q?62INGqJjTKLSoj2oGL/XwTu0VWQQciQkSQuwm/AXh19GDuGohNikCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BwzuUUi7Gulh8Y6fR8yD2ZAy1qc1BcowBNH2MMEHPGgBTsWxPYPrmwmD6qnk?=
 =?us-ascii?Q?wluRA0AsVPMG0773BP7K8ickFTz0uks2jsCkznYEjKlUEgBftWPV43HJdrp4?=
 =?us-ascii?Q?JsrpoN+FLH+BcOItxCZnzWcenLJ1l2ICQ9Ur8uXcCpQWhHrq7/zG32BwO+0m?=
 =?us-ascii?Q?VJY7HGH1crWKlE227bNw0IQUHCkDkg7TUZXu6yz4YfVGgWMql/Ivwj9niOyP?=
 =?us-ascii?Q?AYtUZEwR9DdHXSyZQRWL6jnr/jLlpPuqWZM4tVUmeBdvcBPXtG5pApZKVIEG?=
 =?us-ascii?Q?lMgES3ugFZ69A5jXCybfbKEPyEwapMcu/MgxoNXael50UOsssMNf6gcXkwFK?=
 =?us-ascii?Q?PjN7gc6Jznm9uIjVISjN3olNHB4V1/GYS7QoanKQ6BIN8wqNY9n74R3etAF/?=
 =?us-ascii?Q?uJET6ys/mIKA379ZvyuzdNZScMYVSTknIvV8IGjI6mdhda6ZwirkHG45jeor?=
 =?us-ascii?Q?DKrM2SOS629EA9jZWirtW+eovv0FRIbt5PeiKBZX9FWxtJM/nnheGPt44BL2?=
 =?us-ascii?Q?MrolyDKTKxxmveFZLEE4YLrMVMuInXEQNZuz9lfWCCuWEljuuifHTxGOiiq2?=
 =?us-ascii?Q?wnXFwKuz0zBPX3pSB9xKyoirbCiOEDf+o1n4UuYJKcQrZLCE2RHa9i0GDcZf?=
 =?us-ascii?Q?8BEWBQ/jQRdd45WtWFKDGeeMoarVll4fGpPCo9lCj1FZP0BnDJkByxBMjpwa?=
 =?us-ascii?Q?X5oWMoSqe4a85zfdUxjvy41OGyV+nUkfKoarnhLHt6bF6KfJigDi/8wC0ct7?=
 =?us-ascii?Q?lyT+vTyRYlMEGmFXme/cke82sSf+9BfzNkJ2krWJbXj1Rdnaiv0GRINEc9wU?=
 =?us-ascii?Q?IkA8XftsD+9dzLNCm9HN+l7/tVjDRsU8K8fG3mUTBsMjWijELmodRyW1Rw7H?=
 =?us-ascii?Q?s/sRBrNYPS/k4/Pn1y0TpVkLP4XovKfGCWDPlTkhcGkzNbm/UO/hRDcv2mc8?=
 =?us-ascii?Q?3EJloIfkKLe/G0drR2M7EM4DXzM1bv4kSbepC7vLanSBi/w2DWnEuFfTwmIJ?=
 =?us-ascii?Q?JFPXPZ33gy/NP8xtqpSX7oNOLL7cFTYEcu4Sibp6EAC8AiQwUIFK3gLTEKfP?=
 =?us-ascii?Q?dnI4GrdpO0SxpfssPZf0ASsFsTQQ1AQsw4TfMRHR7zGQCwIUXJcrnvSzgoA6?=
 =?us-ascii?Q?7YUvLrf8BWh+gRtCz9t56EVhkUXqpEecHB0263BUTCxjtaLf7dtuUj+cTj+9?=
 =?us-ascii?Q?VkNXjhHd9V2ZoI4NB3aiLsliTddeeIcF9F0OknTJhmjabPzJ2SZA6FoOXIWE?=
 =?us-ascii?Q?GhHrYX6+Ljq1fBlyiHh3qv3gVOa+TYxy/n+lxyPBw0kA6WnoxaCc3emCUCas?=
 =?us-ascii?Q?s9P1L/o805HnyWeSlmthEKdDiAaEvq+ggWZJeQDw9pHMpM2oxYqr4Hq86bsN?=
 =?us-ascii?Q?2e0B9/k3bxnqb/6uUhEkZ0a/L3rRinhg/gdxFvocIePMMcLGcP3YJUobsQfS?=
 =?us-ascii?Q?KSRFaYFQIv/u6+K5jjuQNHLUqtoV3MJrtkMiwHZU+Zc8AWRquDntoCYq2Lva?=
 =?us-ascii?Q?rstTXxQYpvTCa4gYZFIzpnGNwWJrSCkgL01vcZEXjKVO/iNmGJyCsbr1YVV0?=
 =?us-ascii?Q?/KCj9AiVQGpyomNJcEe9tHve0EI3F6tZf3iZV+6QNOD51QLHQJx4yAnffJuR?=
 =?us-ascii?Q?39tZRoS9DfbTeKTAktJ5P6E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b720a08e-7e16-4eed-ca33-08ddbaa50b15
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:46:57.5857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEs4tFymN9nEjZZ3xdNXBdLrG7wMOheeY1HM3lGjj4E0ZfdW3ceXl+jTu1+3EMjn/aM2PPIz5jwv9Lw3Ng4WM82rWs9J8TQTK01Q/QptZHyGOehtCXaw6bs8mSOi0OoX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194708_779551_05F8A35E 
X-CRM114-Status: GOOD (  10.49  )
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

We can use string choices helper, let's use it.
It makes one line code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- add commit message
	- makes it 1 line

 arch/arm/mm/fault.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..825054b21e0a 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -135,8 +135,7 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	bust_spinlocks(1);
 	pr_alert("8<--- cut here ---\n");
 	pr_alert("Unable to handle kernel %s at virtual address %08lx when %s\n",
-		 msg, addr, fsr & FSR_LNX_PF ? "execute" :
-		 fsr & FSR_WRITE ? "write" : "read");
+		 msg, addr, fsr & FSR_LNX_PF ? "execute" : str_write_read(fsr & FSR_WRITE));
 
 	show_pte(KERN_ALERT, mm, addr);
 	die("Oops", regs, fsr);
-- 
2.43.0


