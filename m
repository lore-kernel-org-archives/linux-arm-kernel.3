Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADB3C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1M5GadUZKXY9W8vqg0VE21Y0LqugxKtmkZYprS1L6Fc=; b=rdXjc7qnjtyYEn1ins97cwI9cz
	kyhhE1eTuHJ3LJ5A19hiEBHCOYZqcVbgJyHzwePglXoC1p4ByHNKarr9GPbKYRk8KlDmEVRXDJXl3
	hpc31d8E0e9en2l/n9ypoFUyqVMof2y55cslolFGxovG0unsbxvYFXEj+cg22kcaxN7ewdOLzKc4+
	Py98JndfTewmO0V0UIuo1V6yIbrM+O2WpsaCUGNHpl3h5xyiR43tkdh+CkLLoWrT+pBP9crZG3PTL
	OHkC8OGLqOvn+yEbk4j/JT2DyDqzr93Xz2c1drWeBgdGAno/2DAoDDUzXDlBzd83xjn4jT07BguHs
	ZGZkOhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRK9N-00000005t9E-3UV1;
	Tue, 17 Jun 2025 00:26:05 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRJrw-00000005rYx-2dGm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 00:08:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYEvjdvFr3HRR+xTfnoQeUIiQYn6JkCCXMApmjAz1lSBxIGHbyHGi6OZ+7ACFi2V7pgfZpV4dEVUh6QwJGnFqhPsTM+ZnF7cTBjpQnnSAMcdoAi4HOqQAkqYrYb33hAolzjbRFnLenFhxl+TwqKmK48jiLgXLg4kzXDEqt6trMZj0a2CSMp4WIuWhpgx4GvDVK+M2FEr5uaHhSAd+vL2Qz2v5RtbJgLg5YZzINmM05nllyoEUhlAsC0F2iV8NVEzpqHNZ0j1EwP4pSqJ94Jzm+MEup4N5vWoqlLZ924V4uuSdT0IB9tdhEQ3295VrgtPLYyo/20q612x6GsFupGN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1M5GadUZKXY9W8vqg0VE21Y0LqugxKtmkZYprS1L6Fc=;
 b=umk/aQpfu+bc4nOhv+el79GDIs/dNJzn2NvIJamu2a7ssW7tAKBUlRG3RX4Wx0lPiBPasXl6Cbdw8uDw3sQ9tpa1cMafOnfGyaSXlMCc1+/cqKl4nD3+ReLTRZ/J7C55D7c2V81jteBqtbEihFNvAU4AWxCrn0Tg5ydcECR3bG+VUxvqPrl6V9iGHBcBg8z/osxoFadb1Bq6XxTyM3JmP/FhNjKOL4TJXmHqkOE8H/5j8g2Qqr5vM543tpNmUvsKLkROkug25bLps84YI9R/I1TGABxiJbofZJy2uMU8/t3OKybfoVOUuNzZI1kZFTb31Lcwxhs+hQmBJHRl6j1OBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M5GadUZKXY9W8vqg0VE21Y0LqugxKtmkZYprS1L6Fc=;
 b=dupPHHcK2bFYztzGP5bhJZk9BmT7W2HPUbfAcbLgwPN9XDEqjroclHYeSD1rRFWAehbxwYH+KrWqJkaGeDPGCJUIPUOh4tA3im3WOiHl7EnZI+6+bmhGhgHeChADy57rbbhDV9IrD0H+lWK73AyA4i8NCbFTXgncxcq6TtcCFjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9929.jpnprd01.prod.outlook.com
 (2603:1096:604:1ef::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 00:07:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 00:07:59 +0000
Message-ID: <87jz5bnsbk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Andy Shevchenko <andy@kernel.org>, Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: kernel: bios32: use string choices helper
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 00:07:59 +0000
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9929:EE_
X-MS-Office365-Filtering-Correlation-Id: 78c4e137-c1be-4fdc-ffd5-08ddad3304eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mATWd5CE9aqSHptQHXmj/gF83qOSlKPUOsNRHCwM1xL4Nn4wNmojPWkVYO3f?=
 =?us-ascii?Q?XAx/3RqjgYVqt49zN+fIMHIPZVZdQiFZC0EvfupF+lRrLoyHqQzZ7rlkoUmQ?=
 =?us-ascii?Q?yp8On3AmyUnK0kS5IXrAN9NlQySixxe0f/q4FwspICCZJHDWwVD4O9zWTtXF?=
 =?us-ascii?Q?mXRV4p7bTZRDcw19jrJDMYhrbS4qmCBpXt0YxR13xsBidRzEcyQ8vGt0GMKu?=
 =?us-ascii?Q?LnHACK2fOsk96WJaemFW1BZVCwdwmpkqU9izbSD1yljwvqFJJD+T3zh2xpnL?=
 =?us-ascii?Q?2qRDJr+R2I3tFhhX++TELyNM5M0r7d2SH6O5yFTI6t5iTu7SEov56BcV/YVF?=
 =?us-ascii?Q?QwqUs3jj/n+skj1Ybu5sLZ2Rtk1FaFnhe17RuxoWO62tO5P9Sn0RSyI5QPGu?=
 =?us-ascii?Q?z5UCAAOP/Yzlr8LoXoWEByuO0j+2yEj2bZrHTNExsGS3Wvi/e9oVOiZabIDv?=
 =?us-ascii?Q?AelAkaBBfSSWRn0Nb3bWvPtIEOvI3yV9CQ//3T5OybpK7a9+kxxFVSAjJ0mT?=
 =?us-ascii?Q?Nrh4cokbvBAqyUdfrxmh2u/psX6d+o/sh1YJH5qPpeiuHwUoN/SxiLWTTfEi?=
 =?us-ascii?Q?nk7W2A45b1sFoucDfAO9STTDw4qGLNzLYF8sPw9HYQSoZTlUMx8d9JPDelyD?=
 =?us-ascii?Q?xaMqW3Lfyme/+yFJg4rSiMnL4jbcqEG8wq+9ZM6xpY4hT7pSIfgUJMlNuTF8?=
 =?us-ascii?Q?qrkEV3C2Ui7gZ4mRByrVJ3fxVvgtN83sx04KUggOPeGCBBAw2etNA2wzy7TC?=
 =?us-ascii?Q?YHF7CThWksUpgFXdCOsMMQCxnDZfPRKlKPvesWaudYsDAhnFQ4RGp6uGqKwd?=
 =?us-ascii?Q?Ya8c5HxvlEzx2ZMxZdLODhSPKkAGAwI/fFtv0yUfav0QLia0yQhilZyuQBQ7?=
 =?us-ascii?Q?eY1PuyjBZAT5+Xeb5MDeNQiIsFQjuz24E1ekemQnRGoOeJ3OJ2XjM4rs6DPv?=
 =?us-ascii?Q?njMPBrZoLh+mIP4CKNDhN5T4L19sGdobHx2ER7kQTAU2Iq5RZEnLxpDsksNS?=
 =?us-ascii?Q?JmeVyEB6nDj8uS7DEUnCHwq6nn/aTIbKHU9ZRiZiKExcH1meOV/Lp57lCZXF?=
 =?us-ascii?Q?HjktGAG56wfg5l57neDJ7/q8Q1AUrh/Fqzbum6hDH/dIxnXhMm8EV1iDgigg?=
 =?us-ascii?Q?bxaX0irj0cJMIUslhGOVY9ZpcS0162dKKaF1CZISk5mJhiwUyw7yVeprsqDD?=
 =?us-ascii?Q?akWzdCuXKgxFiV39cDyzQju/pZbjoEncuxneI4QIJfN2Zlmdb0UMA1ndscIy?=
 =?us-ascii?Q?JgEDQkBbL99FT/+YRiP1yAVWibXASHsQSAA0cuM7IY/8H2l7AuzEybJP6joH?=
 =?us-ascii?Q?n8VWLp+o6RZpcGNhO8ygCZDg3wKKA33rrFOh1M83+MnL9QfOcVeC6KXZebGO?=
 =?us-ascii?Q?6aP3ds+F+TgbF+0kuR5QDec8T4OP4xrv3lznUMSOoO5CsQhdUes/Ab19f8kH?=
 =?us-ascii?Q?lvbmbQkuOEfdEcyWbWaSu2AeUf9pEL/IBweSQpLOscck0V4JYXIkkw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jzg+u1Midjmxvy4QvBxzZxTfcv6rZKMl0pWPivgC8ASDBZLLYdxH21Xy84Sh?=
 =?us-ascii?Q?LtUGZnnNZWYETKrfPW5nMWVAhDoMlH1e3qLQPpoA4b7Jr4Uktwh6toONUuQX?=
 =?us-ascii?Q?WSjZUhcdlL4Amo/BHqjmJghJF5wExVqClzj6F6VY6ZhC1vve6NOOZRqysHmQ?=
 =?us-ascii?Q?sSLDuv9ZPyS5CnFtQrEBxnxGJeEMJDnojqCwVHfX29RYd7Bf4vvvIOyv3PVW?=
 =?us-ascii?Q?zQCxvyXrUos0138zQaykHaVXnO6OK3iwzW2V8nRcb+dmDVrfN0jZh2hWoIqN?=
 =?us-ascii?Q?t1Ktabbbs2S/0/DbvhIXyLkVRHNUeDyDmbVRz5y2oXlPYiwTGzlAPwzKuRwo?=
 =?us-ascii?Q?QEfzS7fJNQy4eLtgMY45wRq9EWf3Fj60px4LyHDKcYFaeMHrMmRaX+iH8cOx?=
 =?us-ascii?Q?rNECCEEKpSKPkWXg13YQZXhDV5k5D1JXqZ+KlVmZS7ptwNZJfPffeIdl/AWB?=
 =?us-ascii?Q?Cl898Rf1i3eeZ3jIDVt+93cXqmufe2Yus0GUU7HVBe3clmjkK6Y7pekNz80K?=
 =?us-ascii?Q?tv9NPk7JWSnxrcxlSelSFZ5s+n0UXfOnULCqpLm6ASNozfnd6IvDMN1tGQCH?=
 =?us-ascii?Q?ZDPqU1HuAwPDDoHBHYXrdrDKDxuULvtZH9icEIVDU20ZJ5wORWSJKysmlNWx?=
 =?us-ascii?Q?CenAdMAJjQwo6ngpWJRD61mdjb9V2EA1hKdK1n+ziUNTrjqn6U7IOA7S3TqR?=
 =?us-ascii?Q?iquN8/dc+Zi0vxcDs4MG4r6gGuGJZVMuubs7UCOPv7j6Rhc7T86t9AHlqhGK?=
 =?us-ascii?Q?UYB38FKVGcsFeH4nykAxaVp+Ft+D4hEWwBY1AYQsYHLSKy/R0eTPZGOs7RnW?=
 =?us-ascii?Q?BCiEOUUxwr7m5D4Ng8tY/O5wONKLVU4y//VIKqZzTZHNf29QosasW2XGocGY?=
 =?us-ascii?Q?B15egKe00Lkzfx72nR+/CJ/6n2OREhzwyt9UOeQoDX7rFRCXt/HPmlC3IGDY?=
 =?us-ascii?Q?0oOIoJCkxGs8NG6uloOJS8CzZc7jRkVO/RiIm+YeV5XzaLEn1gEW07Nzv0df?=
 =?us-ascii?Q?NaN3VxejEl2MXRXHxKlNBp1jDh7R6Lwb7GAAI1JJIFe+vqUDBP4mN+gg3BAH?=
 =?us-ascii?Q?Asol4kSm/Aw8pvy5R0LS5eHp/JPycrGYuMYnKUc1xQr9Pez2I3/ZfpMoG1aU?=
 =?us-ascii?Q?P4OIptjDxp4W5tQ32k2CLAThpUfNVdMeKSLck654uFpV6susqz1mjANrxy2k?=
 =?us-ascii?Q?M9GFelUdXACVNYbJlmg0oG7dRVAgeAxq0uAwm0v3Awkhxyg6ZjgMGUzyIZnP?=
 =?us-ascii?Q?0MbBHU4uRxRDviC0P8F/mgdFwa/OV4DRPpACoKIhsV9YqZ3IoTDdQtikHA17?=
 =?us-ascii?Q?5f6XQ4rNYnECp+jeYuTpl/erwx1llApLQ5zJgBBtP8YwEz3OXxEYWmo3l1lw?=
 =?us-ascii?Q?YB40IFv4uuRvUTPoGt3Y8xh/CRQF3DRcnKynEfSd0ltw2nscGRLzQ118f6UF?=
 =?us-ascii?Q?jmo08TanAzlR4qbXshkWtORzEtl6xk1iEC7kZ1+2OwTUdbbQ2u8laBdAAQ+l?=
 =?us-ascii?Q?H0YfYE2kNWpQD48ZjXqnWIKCZF2ug64PTDonoDEq8sNkClo/yFtuU5mKJDIB?=
 =?us-ascii?Q?Cx0lTI5ZMlxXPfdlbqTfZBxEen4DMCH3w1SxvDBRkLwDYDlR6hOTCMA5kclH?=
 =?us-ascii?Q?d9LuIexiKHxMPJgDf8VeII4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c4e137-c1be-4fdc-ffd5-08ddad3304eb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 00:07:59.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qttFYfIuArWkB2E9qGQW1OcxwMaZ4iijSDT3VbV13cYmJ8jTstpYjKngby3m++6pj0WbomY3biUHYntrS0V3w9b1qy4BarKnJjhhb7luBF5cqtboBnWvTV+PEvIrfoZ5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9929
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_170804_672533_B8233E11 
X-CRM114-Status: UNSURE (   9.51  )
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

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm/kernel/bios32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index d334c7fb672b..674b7f4c5a3e 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/map.h>
@@ -337,8 +338,8 @@ void pcibios_fixup_bus(struct pci_bus *bus)
 	/*
 	 * Report what we did for this bus
 	 */
-	pr_info("PCI: bus%d: Fast back to back transfers %sabled\n",
-		bus->number, (features & PCI_COMMAND_FAST_BACK) ? "en" : "dis");
+	pr_info("PCI: bus%d: Fast back to back transfers %s\n",
+		bus->number, str_enabled_disabled(features & PCI_COMMAND_FAST_BACK));
 }
 EXPORT_SYMBOL(pcibios_fixup_bus);
 
-- 
2.43.0


