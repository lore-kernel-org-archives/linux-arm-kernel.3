Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3636ECAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 02:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:Cc:To:Subject:From:Message-ID:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y1a2DtVd4yfvlh7cpy2nmHvO51IfgEJMErMR9zLbF9s=; b=u7m70Laj1AuD8plBsNY1QbVLL3
	7/qq7Gm9wyAIgBsiTiGI2Isw9DOTgCC452yNdMi2J5SDCqENSfeqOtx27o07+4t5mWKf5M3hCkJz1
	EojmzCn8MbTwmu03wm3oSvKxMAb37/6Y2WmjxhLmqvSsIsQOpaXEH1Mh+BazjDd58FL2j7usnVe+Q
	z7Wr2/qXNkGQNoDiVwZQFMFhKjfc1B7U5d7v447PI+VEFxECPR3RX9fOLfZvJGOCZjK4OiEtbwfHJ
	Fc+edcohJYr78WkalmgJariQuC6MEmVOkxN8FOufhAQBz+i+PBniciPOkcdJ0eCXmvOIsRTtu9YZx
	GOlwQcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Fb6-0000000FOJb-1Oqj;
	Wed, 24 Sep 2025 02:51:12 +0000
Received: from mail-japanwestazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c407::1] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Fb2-0000000FOI7-05N0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 02:51:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiiBvDVwy8fx/Sc0zYG8qB/xofPhrSPTJHfpAplzRtmCXVsM0JCvl7OpWpcJmAMj+Y0czVi++CdByYvol1du1/d+2T4DGtCnBMFA9LKGftU93isLQrEiV1JdGcBBdqL/w7N1mSuUkrZi1R1SaxB7Nus3MNt3GZZJpptwvhqzZs4iwApp6kyk9XAaptH1OHl0MMfqPQdQP4xBrVrFmjn6CExhlhtGjD6t7XWXSD2wKJfaGJVVFXe+6gsoAmdy2F9P+1iVElpZZK6nT4W1K3g/fiHMfrgY/c9uv/9zpXFx27yZu2x8SfybCN+H4qnmKp4+uCRLvBHrp3/Wh5iYV2XVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1a2DtVd4yfvlh7cpy2nmHvO51IfgEJMErMR9zLbF9s=;
 b=GhRpuP7WC5fzl2NTFmiCM1KIepvfRX1lc8ujMS10W227XXUNpAt1DqBTxcL7ney0DON2XSdYMpPhvL7sUs20sb9xYh4zZOThc60wWcb8QuSp0HK67c1NMfdxFzDO/pfvYSvhfekAfpLeM9ftcl5/Oq5WDttrMVstjhb+GNouRZJlQFmkoM1fKwSfOz1DI7YIgP3bJh2ae0y2Ba875kSB/TkaXSjgrhGKMn2C70amN0hJaWfSVYmN1LYOIJPaQo4ewZqWeomIqSueiO8mAGDUPlSujsjT0mvp4iBFKErL/c+q1Wdt6BNHtgytxcNTA2cZUadjOMv4PfWtTZO/vMsiZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1a2DtVd4yfvlh7cpy2nmHvO51IfgEJMErMR9zLbF9s=;
 b=LnWEuo0ukujm6uWv/Vx7mMK7FCE98NglRkVS6BGH6vvjgpnqPiFzw3xKDTHr08Nrme+hqqSxZHX5R4Vdtq2u0Vn3BPKLZGBGCN88GLX3Ueo8xZ04iVnfLEzq46XCp0VAbVzaS1d6fag3PSkecIDIFlY1ugcceMGlnAGRJxuqkRA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8825.jpnprd01.prod.outlook.com
 (2603:1096:604:155::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 02:50:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 02:50:52 +0000
Message-ID: <87ldm4a7hw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] tools: arm64: Add Cortex-A720AE definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 02:50:52 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 642e3dca-9d8d-45a8-277c-08ddfb152cfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gAR/ix2alZoL4Tmqs2WGMBqwnEC33T9gMAKjUVX+bN5Fw0xTHyr+Geh3bwfD?=
 =?us-ascii?Q?Yqo4JMKK1gfSosF+Li+UTra5DMFbSZfL3iky8azkA215aD8+lz/EfZt/VtB+?=
 =?us-ascii?Q?+ilydhvhJsfpouHwaEfvL8u++cCaas1eKEetdyVCxiVkHVAyOGgw4vjIjTj2?=
 =?us-ascii?Q?9QeRN7ShvJptekpa8jHJPQqrAEcV89pfQXcm/4MAPJubZS5JufoQrZzwgDqK?=
 =?us-ascii?Q?UZznaY7M3uTZ3h+WnoNAxNJjNccmIrOfF9sOLzkNSCZbOKnyI2p6bSgyQdmX?=
 =?us-ascii?Q?z0nNBX+urSGsWid6eWnr4XL3YJG9gJmQ5zN8LosI/q8PQURGv8PxNpEItO6R?=
 =?us-ascii?Q?RA7fuTSWwPqNTZfOGPdQoeDi9iyuN2/CNPVSy4jzmfCHmTlvjEgd3bwuNATd?=
 =?us-ascii?Q?jKEDWYULSdzq9uE+o9X37yORs2Do5OJ6k1Ox5b3DusaborvgQf2bkRhceQQZ?=
 =?us-ascii?Q?DNsXq6WpIZrm29KpF4eTF0sl7oHJk23Vw/LoUpgIhKzWk7MqvGUO3tDgoHRh?=
 =?us-ascii?Q?E7zaPOuTBXdB3rn9w/G5hZAHOofrnnvYI3sxMl1vY6LVTDJpKsH2d9tMeo1A?=
 =?us-ascii?Q?vR6YKHsV1/xs35mtnVLEMPdhb9w+uTOjNjy+KIqyk2N4l0bes65emoJg+7OA?=
 =?us-ascii?Q?eseP3YZjPf+D0cB3aR+XxHI44bdHd/VYPAQH1mPHHl7Ik2nz3w1a1WYRUDrv?=
 =?us-ascii?Q?fuOtJEXnTehG2VqmP25jral5LMw4ZovcyPKqn+PZ2F22uqXvazS1hjfvErCr?=
 =?us-ascii?Q?IzOeY7CknYvmyUHeZ5Cs5abc4dKN8jrRgwReWl31Qqelj5Myq+h8sGMzNbK0?=
 =?us-ascii?Q?38B/RZ16XR6xeHyG1CKv8AiOOjpwUHcWKjlTaBIUbZSNMx70UQO07HPTtscm?=
 =?us-ascii?Q?VGNsl1cabm3zKTRqBIkyKTg+90sK32vIBA5CtHXkAE8lsp8wVbCx2Mr1QNOU?=
 =?us-ascii?Q?mfbWFuu+Wew0ivPYoVAsKeX5D+w+E5W6j3B5fsv9Hr82+SZZKWhsazvivPsI?=
 =?us-ascii?Q?kTNw6hggyeWpiylIQWvobglqPQPpc5E73SaQPvitCU4l0ydfgwDt+ynFcdvZ?=
 =?us-ascii?Q?VGgombJIPHkoJSfF54dKaq1ulWMLOqaAdvrQwucRVe0+iB8Yqlmkorr2PYw2?=
 =?us-ascii?Q?4V5K74Tl1sr2Eardodf6ZOh8yj1ptQBJqLFClvd6ARL4nIv8Wk4JCqFquffl?=
 =?us-ascii?Q?psXDL0cLHfa3nocWyEx4odmYGl8vKipZ4pgw0qQ7kVfpRZWE8lV3ZEy9K5Jj?=
 =?us-ascii?Q?cDZNulX7cSWSB/1FiuR2n3/vn+PaRtGEhZNKlNcbv5Oc/ONVhobFRECc5/TW?=
 =?us-ascii?Q?hu7oAugRZaudqSAN2Z3n3MFjBJOQxVFaXv6Sl2ABgmYJmY2471PUCMzEN5vc?=
 =?us-ascii?Q?JsHXvC5l2PimCZWOHu5YOUOi/MFGf8N8nGWsR6TH3O9AAqh3KaBTCnRtOkX0?=
 =?us-ascii?Q?F0xyqSH0l+K9S4H84vHXS0AZuv2g74qiHde9kHrH0MMwneGKZMfgSp+LjeAy?=
 =?us-ascii?Q?A2Y2FhUYCrns2dM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s7UiOP+v6yleY6hWU8wxc/CZ5AzNOxfE5M+56BI2JFAiAchtesMgAITaG2S7?=
 =?us-ascii?Q?ah56l3homCPwF057FAzuZ3J/z7ESobWyXWsDhSQiVAn6dJD1U/C2zNqQ2LMb?=
 =?us-ascii?Q?AMN183pUSKV7N8jbWL/gX90NdqOpO7CJjHmopu+SgFS1DEfL4F57FOHKgqPU?=
 =?us-ascii?Q?697kAj8eoQkq9Y+PYojdGMzpSw+0FEd3pNx/fyeRgTGB/mD9xku77uU+VPQx?=
 =?us-ascii?Q?rjI5lJIY3QTE2cl61/XNxtyler0NIuj28Dm0FL4iiMFizz/vLcD0TLbGqbMI?=
 =?us-ascii?Q?PNNvAq8xHpUl5s04tKkCIDXIA7nzHYd9xOLAKRsxUd7DGav0ja6IhYbg4FWN?=
 =?us-ascii?Q?zYvSCWoz3c4CsP4jPETGpSDoa9B6oyHzlyF7NTIBavHtPvzKme/xNgYMtWn+?=
 =?us-ascii?Q?C2taZL+pt+gWCSPSSpmjYqEvstoLr+e8uQ2bYqSW4CdFvenaM1kgTBGFlONx?=
 =?us-ascii?Q?eDmJGy8uwc30aUVezmxzOoo81WIcPfEqVeHLdPhLlEY3y5bYBoFkEk9IV4yw?=
 =?us-ascii?Q?MK0qgy1H4DMi40gSD7JEj0aN3I6Ip79BgZEbWJhxFFtgf5uLjKyRP+GaNfQi?=
 =?us-ascii?Q?12MYOjcH5HP9uSQ5Tfd82ld5PBhBagcC3qfWzZ0tfgaNKDAtNnZobGJgJgPA?=
 =?us-ascii?Q?4dreR9g4xUq/9h9rEDSQSY3Z62JZRkozrBPtaTX6LSTiV072kptxZH7X9rbe?=
 =?us-ascii?Q?z3uckg/iSbdm7jwRBY3SM5wuTmbDk05L3xwZy8F+KGA0EpP2WG1cl6MIFQjh?=
 =?us-ascii?Q?eF0usPV+DUtlCzaRTWd+TjjyI1wH2Tmv9fZyvY/1YJd3YkDAHWQYhj+ACaoL?=
 =?us-ascii?Q?1R+opZSMPzIeotMIo50YsIpY/xlyWfhJKJTGS4XHSHbRy94iq38AVmPpcHj+?=
 =?us-ascii?Q?FDjzumr4aiC6vS50V6yLLWwiN1HKTLksodFrjFn/nFY2Z88EQ36vFnpcg5JH?=
 =?us-ascii?Q?rSBoH8M8lt/58W3QZaonWZzKjtpndjqqct/FzrvERYMrQsHwqKZWuONRBb0t?=
 =?us-ascii?Q?QCYwvkgvs8MG33kaKgrEh72/HZK2Vy03HCm32Zn+VPhN5b+LknLWomJAPUdp?=
 =?us-ascii?Q?Hgfh+wBQ8ACjPt9xnypYvGi0L8Yb2CQRCRxxi94YGtn80w1oFgvRGzJQzDMH?=
 =?us-ascii?Q?qllwaL2o7Pwa69nRtnUEKBBPptDRai7cL0wQwIFnG0WnEcDPr+Ht71kpHCNY?=
 =?us-ascii?Q?rtrytFDSzXfLjVX3+oL8okgHHYtQnffHsD3D0scYkZN52PYOPkC820SaE4CS?=
 =?us-ascii?Q?6iQPC/Lh9I8bLN46QmC9EIWbfJInvxSngs3k/tlcSqahEgHtHhXhxSLMBMPq?=
 =?us-ascii?Q?2JOcWfar8tNbZS94rf/DfykNQfOFAR8xrMXPJrrhwuSkRc1QMGrHzheZ7bMC?=
 =?us-ascii?Q?0zBWCvo25jJCv1e+lnIPDhUPzQ92ositO9o8tUJYqDB7ZPJFugP+4qAuTM+5?=
 =?us-ascii?Q?PXb+kBXUxeROcDAR7rdur+EmlQ6ryh6JBLheOipYAEvfIg8dXMVOIGILjZLd?=
 =?us-ascii?Q?SLEtcJwUtlRqXwLyrfsD107FFVAVwpMPz03ewPrOaYxEo6HpOtSmh8G5SiQ/?=
 =?us-ascii?Q?yuwjwfp3w8/AkBeoIooRKdaWdIEX91LBKFgjxm3LI3ztxZv1o43sC07ZQK02?=
 =?us-ascii?Q?IqJLbO0SZMs5ApxXa1/AuVM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642e3dca-9d8d-45a8-277c-08ddfb152cfc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 02:50:52.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TXO0alBKRpqDwa6rizgyDt+o7SWMrO3Koja+wI9AEuMOG8rNHHSmESQfIW9h5rMKOq2JvojsRzmOqlJIhUvE0Pk4YykU5xmKIvnUnHevmKWbN/64B7hB3x+sZYyOpKMk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_195108_297689_97E7E682 
X-CRM114-Status: GOOD (  12.19  )
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

Add cputype definitions for Cortex-A720AE. These will be used for errata
detection in subsequent patches.

These values can be found in the Cortex-A720AE TRM:

https://developer.arm.com/documentation/102828/0001/

... in Table A-187

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Will Deacon <will@kernel.org>
---
- Originally it was included on other patch-set, but separated

 tools/arch/arm64/include/asm/cputype.h | 2 ++
 tools/perf/util/arm-spe.c              | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
index 139d5e87dc95..0192dc7ec9ca 100644
--- a/tools/arch/arm64/include/asm/cputype.h
+++ b/tools/arch/arm64/include/asm/cputype.h
@@ -96,6 +96,7 @@
 #define ARM_CPU_PART_NEOVERSE_V3	0xD84
 #define ARM_CPU_PART_CORTEX_X925	0xD85
 #define ARM_CPU_PART_CORTEX_A725	0xD87
+#define ARM_CPU_PART_CORTEX_A720AE	0xD89
 #define ARM_CPU_PART_NEOVERSE_N3	0xD8E
 
 #define APM_CPU_PART_XGENE		0x000
@@ -185,6 +186,7 @@
 #define MIDR_NEOVERSE_V3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_V3)
 #define MIDR_CORTEX_X925 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_X925)
 #define MIDR_CORTEX_A725 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A725)
+#define MIDR_CORTEX_A720AE MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A720AE)
 #define MIDR_NEOVERSE_N3 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_NEOVERSE_N3)
 #define MIDR_THUNDERX	MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX)
 #define MIDR_THUNDERX_81XX MIDR_CPU_MODEL(ARM_CPU_IMP_CAVIUM, CAVIUM_CPU_PART_THUNDERX_81XX)
diff --git a/tools/perf/util/arm-spe.c b/tools/perf/util/arm-spe.c
index 71be979f5077..9561951a0055 100644
--- a/tools/perf/util/arm-spe.c
+++ b/tools/perf/util/arm-spe.c
@@ -571,6 +571,7 @@ static int arm_spe__synth_instruction_sample(struct arm_spe_queue *speq,
 
 static const struct midr_range common_ds_encoding_cpus[] = {
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720),
+	MIDR_ALL_VERSIONS(MIDR_CORTEX_A720AE),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_A725),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X1C),
 	MIDR_ALL_VERSIONS(MIDR_CORTEX_X3),
-- 
2.43.0


