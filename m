Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E16C79F83
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ud9AuYrSZIlA8fbE+3cZRtFPxkS3jMvrRI4u6YJqIso=; b=2UHsKvQm6QihvpydeTuJ8pR/0w
	TPZO+hfnz1A3vG0F3GAeAq6WqNjfkkBF7YpM6acWNS1BE7mJbqXImEvJdLeqwtRWrZGQ9McdRGWyt
	1ML+7zZJjo9KDh/kamhvkpOcaRS9Cval6fxbByfbdcyFOmpQnb+hcNLdP8dIdK/X9o4d6F9JMn+jj
	oLPODMG995SwFP4PUDtRjlQnCoR4q0jS4DwLtW8NhItgKpnf2816zWTg3mXF74d/AudjF0kuD/+84
	luT6rPh76GltHSMII5DpFCnKVuk9yyXLzkztypH9uwGOtYmdRAQ6AjbLSpooqhSpcGi/poTqza2tc
	fIGUAMeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q4I-00000001VE1-2jQf;
	Fri, 04 Sep 2026 09:18:42 +0000
Received: from mail-eastusazon11012057.outbound.protection.outlook.com ([52.101.53.57] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Q4F-00000001VDM-0zo7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju8EPP0XwdfgXbl0UtLTcemvM2rkd5J4cCNVAn3V9313p3eXDLOEG6IRqJv1T8UnTfIzggWJbcmt0q1GK/H1nnuE0amAL4CRWpLsi9OC0pD6eieLqYV4HaqBXfn2hU4wm2pwffxSzUDjV1sZnltI66v3MM3NCtu3o7qmRTgQkSehu1r6e+9aRr8NpFYku7fOTcZU0Tby7VYouDLXK0PNgGAgeLVmBqYRD+7kI8NSW3tDMrY3aZB7uiB/mkOW8Sd5UBvwc9OqwC7ZKRDdJDGDn7cZ9LYis5+5b2toEhoLJSyRnhnsEOBuzJg9ZOOHYr+YIWI/nOQMfkGngMnTWW9b9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud9AuYrSZIlA8fbE+3cZRtFPxkS3jMvrRI4u6YJqIso=;
 b=w2I2AjH1o/eRylOSy3Tjz5UMITlaUzeOYM0P0AyKkxxMpWWycj9jQ4Ht9qVDoZUZhakdCwbh1UvPRd3eGulXVdj9DrX+a2c9rLjxHJNkCbfojtrCQcKcTllvAXcrczTA/d4u4dBD9igU614KnbEVYtsfJxj1SwU3qlwu/lwTEC6ftrnm4Spu+6eWUVmfDBXxppbAm36hVgenCJPo+/PplrvO97l0sm2UuG3NzTsokSkD5/CuYw3lfoznkafyXJlAOmfG+G1s8AWlhmXfatO6LDcUVFIU1FpwNV9C7NQtqsVbfHCVDWVUoDpMlzjGa4qH0zO5teHmSzVo39iMlVnJQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud9AuYrSZIlA8fbE+3cZRtFPxkS3jMvrRI4u6YJqIso=;
 b=p2ikxaIn5YYz28XBKI7v60eEaDRx4EmrkKn683dO0DpMeAm68m4Igocfj9PlNDPjsQrOgaHSmisLYuY4xMCeFfs45DJlpe0jmli6e3X2VpLN5RNgg+K9DE50NjFdWzNFWjcYG/5B5aR3vjmUAOaXChuv0VDvPUvQJRMXOtMNkXdvHCfy3NyppGJpWHCtYTXxxOKt+fax48H0mty0MLHBwI4CduAWg4k28oCGRICv5tgbxzLK1Zwm5PSAtezw0n5squLVcFvvYohwyboYVGlPzlUm7yvZMZEHR6C6n/A0KXLjWJMNfmfXivtgGGaPdE8Q3qB71XRVKc22vjAY06pGKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 CO1PR03MB5874.namprd03.prod.outlook.com (2603:10b6:303:9c::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 09:18:33 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 09:18:33 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: maz@kernel.org,
	tglx@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4] irqchip/gic-v3: Add Altera SoCFPGA Agilex5 GIC600 DMA32 erratum workaround
Date: Fri,  4 Sep 2026 17:11:14 +0800
Message-ID: <20260904091114.2259616-1-adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|CO1PR03MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 613362fe-45a7-4f67-785c-08df0a657e3b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|5023799004|6133799003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: K+6HlAOfzP7AhsU2yzoshJCKllCPtFLCMxTF/jmXHFLuygQMr9EbKp20724cHp72pWAzhYqcqilQiYBXLyCO0Kh7rE0n6l49mmAjX69XeptD2rpPi0WRSyRpstUMjHqfWbFUL4xCaQtGblKXFKk0MNqJr/dHoPvj7NBIgAHofyk/1MG7eQJLHTUdY5qRLOGICUJR4AoDtdLXGcE9HaMFtH8HQ6hoi0Foe5P15lsYviJ5l026wXdnkX+vW5f/CfCCns4Ty0KIMhOqfe0m9K/C+8zgs9ftdO9rrR4yWTxVvp5QZ7CvOdrOSSr/XyloCNeQZzvuFB2NUYyPawOqjLHJYzD1kcKUQR++vMKXSAGUD7EDzV1GLVyJ5P5XvBAa9MhLH4SCeK80nhV15tgRTkWisfPspi9+o1J24mW5bbvFn10k3gwx0ulcPSxmiBsGopCf6CS70WlmKOpzzOuL4qjKY/kdXS+zUBfuU8tL2S3gTrBF8glDMF1XjsdQkCCPQWWYOMYFO/o2SzCTYDzsOPJBNbRcj2me2fpPYedtDEA2QXehCYOTbAuG7y0M2+XXPphmaVGCZXGTSle0p3URFARJiMKGBdQI8du6aAnu5iHDmIQlhPPjs92eNrkPSOMCcIDWBQB1ajGRce5CyoUNgX9YSAIzlx0FbHuqnL+8AdTfBQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2hPmvyYDt6pyt+DCnWxF99uGgYPQxKBUapRAhyxJz7TNI+0Hdy+QwNBST7el?=
 =?us-ascii?Q?ZYnk5eg73yOhX+pV7CvWwDsl/3ypeYI8uAc/VyOl1poGRxiD/js7Uz2xpSHi?=
 =?us-ascii?Q?9Cqo1H7EGFEjJ9rGGL496wqEYZw8IHGtMuTLE2o5NcFuUAXet+qxufoFbMOB?=
 =?us-ascii?Q?4J8/5VsF3GRTjfQ16AUH8PGiDXMk2wa59g8u48TG54OIwA3E79XK8YlylBeg?=
 =?us-ascii?Q?E5qb9vBa7na1QNThDEFpNgA77H/mbF4nwT0BDjTD+F0Pm7OpUJgmqNDZB0Pl?=
 =?us-ascii?Q?37gz4gXU7knDWDGS8FMKRvG3W3ZtpeO8QFmBgj3BMOLsn636hiu2oGJFCbAu?=
 =?us-ascii?Q?Bsb2z3exZd347oKcwxi0RNHZfcefl4fwNcoI9AR1JzcrLFEzoCZyiwVR7acP?=
 =?us-ascii?Q?WYIS6g17jgVg8w+Adx8c3QuwC6w8HHtb0YTrisC0ABfxZYjGqTymhhot2IWh?=
 =?us-ascii?Q?5PRhAm2YCReyXJVzWl9AuN2S3ewuKSj/88/UnLLRnNTROGORLF5o7KX+vT/W?=
 =?us-ascii?Q?VuQuF2NBQX32dvM/GqcDn2SfoOs5UXrUKYq6APJkfAJQ3QUTSK8w2dG+57+q?=
 =?us-ascii?Q?drn3NLDqbRvTB1AFMbMOQr7scN66YkQf/qnmMr33F6k2QR9HeukU2Z/ZOHPD?=
 =?us-ascii?Q?90G/yXfspZ35puPuHWkybiKbEonc4Zt/SPOWdDESQLDNnOEXUxOwDc8RY+dF?=
 =?us-ascii?Q?v4TOwNv21JolydjL/aryfxtzlmCG2B5tUKel6ZN85BB6LG8vXwx0bnIRxKVi?=
 =?us-ascii?Q?DGessak5Gq/Rlt6xXlgMEpmnaGnZPV+FmOrd0d6HScjZUqbYLVS7LHVqXo8W?=
 =?us-ascii?Q?bSPVgMDmD3i4GTgyQSoqBjuk77r1IGkgSUCCoUqDu6C9Gsmdwb2olnl2tYpA?=
 =?us-ascii?Q?h27sKK+q5q4UA9x6NqtiJyvxW8OuqrC1aepNipzpgSVyGyecuXNuNPrFP1eF?=
 =?us-ascii?Q?azTl1Lj9wxW21yZYxYZr9VPcsU+MrvoUAp9yZVb61Wk8dXUk23slOTgLTSgu?=
 =?us-ascii?Q?o/E/kMFzji47kTVMwDrtc6MSWp/QhuMB4tPYyyhGCXF9dFANNLyF8ULOxS/s?=
 =?us-ascii?Q?LXVqQz1SnIzMOpJI+fFr0UAiMbDmnpIyQuzr2Gjn7Vff5jAPosxQxNHdJfs+?=
 =?us-ascii?Q?/jW9r+8sbXPOUIFd7EhCV8w9Hrvb4tkLDgk4Uwyiz5tUiDRQCeFHegJODNuD?=
 =?us-ascii?Q?VQJXb34E9SYNy+NcxRpZDCzW2M0Rg9pIzDfDVnQrhtsAxhhrZ42LknhrcL7h?=
 =?us-ascii?Q?33guMRxX11PmLrdgHPDFgtsPeBbTfMAne3tZ0sGc4QFs3nSggSQbyZirEUAe?=
 =?us-ascii?Q?LwLOuiQGQpJ+tmYAdlMt+NTr8fniwi5MEkRrGdoZWtKoDquKZCvewfSL4L4y?=
 =?us-ascii?Q?cIOPFkixiX8ELoj4t+ffwJImTv+KleTj3OCoPZHfcXMvOHtjb0OUykjGJBG8?=
 =?us-ascii?Q?KzMEBk00fv343fYCb2ta7VD+6e9K5NWT7DMmdLJpJSS+yeVLUErQJNlV/JMz?=
 =?us-ascii?Q?TnK++xX9Uga8uDOtJDjpiJIK6BPdpQOseSRDjYnoCB7xRXOfPjrbn2FccRPa?=
 =?us-ascii?Q?Fh5EOWpCjwebkvjANbXBKIDi5rj2bRUqVB5n05dAFU2cBMdoXS13S75wVPMR?=
 =?us-ascii?Q?5BHLN5e1J7AzTmpKv0d8h4rFtl8UZN1kNQ/WvM3+1HdVdP2LdqJBMvuadZZn?=
 =?us-ascii?Q?b1JZGQWirDw+PlqTfRGnEdM+z1PGKozWbyyeyLWrTcSB4gUBI7JVOFaMkylr?=
 =?us-ascii?Q?hDj8Rz2agCQvQirS/o9HpMIth9oUwDg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613362fe-45a7-4f67-785c-08df0a657e3b
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:18:33.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eT4NdwLa9cw9jlE/RABPIX68TvVdonAHnTK32g8EuWdpvua1Y/fCe3B7SFmqEB7KKeqfMwdUyLthtakR3Dz9/l6yuSL+UHyAy2lF8Ej84rI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5874
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_021839_303858_44669A1B 
X-CRM114-Status: GOOD (  10.29  )
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

Agilex5 integrates GIC600 with an ACE-lite interface limited to a 32-bit
address bus, so the ITS can only access the first 4 GB of physical address
space. Add ALTERA_ERRATUM_AGILEX5 and register intel,socfpga-agilex5 on the
existing dma_32bit_impaired_platforms list.

This limitation is documented as Agilex 5 ES Device Errata 2.1.23 (825514).

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
Link: https://docs.altera.com/r/docs/825514/current/agilex-5-es-device-errata-and-user-guidelines/hps-gicv3-its-and-lpi-unable-to-access-physical-memory-larger-than-32-bits-causing-msi-x-interrupt-failure
Link: https://lore.kernel.org/linux-arm-kernel/372f059069a5551ea1096015f855cc306dbd7cd4.1747368554.git.adrianhoyin.ng@altera.com/ # v1
Link: https://lore.kernel.org/linux-arm-kernel/6a44509ca0edaabc17e59d2e27fef1c782183456.1751618484.git.adrianhoyin.ng@altera.com/ # v2
Link: https://lore.kernel.org/linux-arm-kernel/20260622024945.21354-1-muhammad.nazim.amirul.nazle.asmade@altera.com/ # v3 (untagged)

Changes in v4:
- Rebase onto dma_32bit_impaired_platforms shared quirk (post Renesas)
- Add ALTERA_ERRATUM_AGILEX5 Kconfig and silicon-errata entry
- Cite Agilex 5 ES Device Errata 2.1.23

Changes in v3:
- Extend existing Rockchip dma32 quirk path for Agilex5

Changes in v2:
- Drop DT binding quirk; use IIDR + of_machine_is_compatible()

 Documentation/arch/arm64/silicon-errata.rst |  3 +++
 arch/arm64/Kconfig                          | 10 ++++++++++
 drivers/irqchip/irq-gic-v3-its.c            |  3 +++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index ac3248b9f2f3..8522ba072040 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -53,6 +53,9 @@ stable kernels.
 | Allwinner      | A64/R18         | UNKNOWN1        | SUN50I_ERRATUM_UNKNOWN1     |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
+| Altera         | SoCFPGA Agilex5 | 2.1.23          | ALTERA_ERRATUM_AGILEX5      |
++----------------+-----------------+-----------------+-----------------------------+
++----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne       | AC03_CPU_38     | AMPERE_ERRATUM_AC03_CPU_38  |
 +----------------+-----------------+-----------------+-----------------------------+
 | Ampere         | AmpereOne       | AC03_CPU_57     | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..e3afb591db68 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -418,6 +418,16 @@ menu "Kernel Features"
 
 menu "ARM errata workarounds via the alternatives framework"
 
+config ALTERA_ERRATUM_AGILEX5
+	bool "Altera Agilex5: GIC600 can not access physical addresses higher than 4GB"
+	default y
+	help
+	  The Altera SoCFPGA Agilex5 GIC600 SoC integration has ACE-lite
+	  addressing limited to the first 32bit of physical address space.
+	  This is documented as Agilex 5 ES Device Errata 2.1.23 (825514).
+
+	  If unsure, say Y.
+
 config AMPERE_ERRATUM_AC03_CPU_38
         bool "AmpereOne: AC03_CPU_38: Certain bits in the Virtualization Translation Control Register and Translation Control Registers do not follow RES0 semantics"
 	default y
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..111cbe484de9 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -4895,6 +4895,9 @@ static bool __maybe_unused its_enable_quirk_hip09_162100801(void *data)
 }
 
 static const char * const dma_32bit_impaired_platforms[] = {
+#ifdef CONFIG_ALTERA_ERRATUM_AGILEX5
+	"intel,socfpga-agilex5",
+#endif
 #ifdef CONFIG_RENESAS_ERRATUM_GEN4GICITS1
 	"renesas,r8a779f0",
 	"renesas,r8a779g0",
-- 
2.49.GIT


