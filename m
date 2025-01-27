Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D997CC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 20:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M3DdCOn3oSvE/VK/AAXp38B1jTB4PoHl0ndv8qV09hs=; b=4UgWTz7QuQeg2N0ZBdx11C/JLs
	U4TCjTLHXrJ1rZ7RP4eYDgqt/VyYwR/8mEnvhISrtxdsGPc/Ba0yysms9J+dSmoYxfMDGpIClrnjO
	24ynQsYSYPx1o0Hn/YBA5UeORx8L9J1bcU/rgrLvgVvD5+Y+CNbZLR4OHrlnHhlwrHAyCKXfHbsjP
	MyVcgYRPlviKF3EFLPXfDNZTYqJUb53WXwUiq4PhH3QzYx54riBB+S418xnLmdYhj8agkVhEBUcYK
	rNz39M+Q0l0v5ABJyqUGrOXGRmYRRE8ysuqZXmdMa+eW6p16Bw9fDqVY9tySiUI7tIuD8ZvQqgr48
	sF0EojjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcVaa-00000003Bpo-1M5J;
	Mon, 27 Jan 2025 20:20:08 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcVZF-00000003BjJ-49Ye
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 20:18:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HxqJhbJe1jPytYXhD6dvE1VPjOJADfQbFHQbJ0yUhFoDmhIWtWzAwelFH34n4gh02E/cXMrE2e8YQov+zu+hvX4Z/HJmzTLabhvrNMkhizfFcVB7KgySeoeYsOfN7E3zgB18wirSx0aBzuMJ7DYcp+yH16mlNWX0h4+dKLWmtX37zHTH04gV8QuUw/j13/Hl6i1kl+aKmjLZw/6IqEjJZNIzME1XzCR4g3E4b7xxLW5G7jwjPZoq8uneQPNEVbmQiKHL4aNrMkw89o04bFYFp9CPTE7hB4/5HXQRrhcfPrmZwBIThVj8U6ISy+yIaTzpDvX3xj68LCQ3Jd8DjqTwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3DdCOn3oSvE/VK/AAXp38B1jTB4PoHl0ndv8qV09hs=;
 b=tkXOsr6QKGz2AsQ252T3dokBjkbiq1lXP9/M8ppgbFWc2Avy3TrhweipGHE5jj9KsIQae/16luSqqjlSKHDTkZfUx3sY+6luGyPn6BgjjUKtdugvv7UH7EA7JKjRy1kfn5jCav2kLWGm24zoUUyQZygU/CyQjmg+9swAWkwc6AlHq/m2dV/vg4zyvQ79HhDIUM62Lnj0K1zzPqqIRXZuettD1X75hVngRa5XUS6nGLcnNMo6iWJ+QkaFBTfBuhWfyRtm7TVEuYWktEK/koBWXozBPMrFMqqKPTDRyZRuodxEkmynn1K3oNNC4fvFZWdcC3HdY4m7qihmm/aQOIElsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3DdCOn3oSvE/VK/AAXp38B1jTB4PoHl0ndv8qV09hs=;
 b=X0I61slUHM7yIfJ71fZgiWWI2Lb/mnkmjQ+1uW9eD0LiADfBjCmF0+0XVj7/FI3waiHYIxDnu4to9aCBaOWH3ugC8/u5ViHR9yqj9uYdg9xK8aKMeiYuwUA8e0jGtXvcFzCKequ5UHg0CGN4RTBeMjPRMVsuz8ZCw0Y2QDdGI4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from SN7PR01MB7903.prod.exchangelabs.com (2603:10b6:806:34f::17) by
 BL3PR01MB6897.prod.exchangelabs.com (2603:10b6:208:354::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.15; Mon, 27 Jan 2025 20:18:40 +0000
Received: from SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f]) by SN7PR01MB7903.prod.exchangelabs.com
 ([fe80::cf45:9855:a64e:382f%6]) with mapi id 15.20.8398.005; Mon, 27 Jan 2025
 20:18:40 +0000
From: Zaid Alali <zaidal@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	puranjay@kernel.org,
	broonie@kernel.org,
	zaidal@os.amperecomputing.com,
	mbenes@suse.cz,
	mark.rutland@arm.com,
	ruanjinjie@huawei.com,
	oliver.upton@linux.dev,
	robh@kernel.org,
	anshuman.khandual@arm.com,
	james.morse@arm.com,
	shiqiliu@hust.edu.cn,
	eahariha@linux.microsoft.com,
	scott@os.amperecomputing.com,
	joey.gouly@arm.com,
	ardb@kernel.org,
	yangyicong@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: errata: Add Ampere erratum AC04_CPU_50 workaround alternative
Date: Mon, 27 Jan 2025 12:18:29 -0800
Message-Id: <20250127201829.209258-1-zaidal@os.amperecomputing.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0297.namprd03.prod.outlook.com
 (2603:10b6:303:b5::32) To SN7PR01MB7903.prod.exchangelabs.com
 (2603:10b6:806:34f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR01MB7903:EE_|BL3PR01MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 765c850e-6dc5-475c-c3af-08dd3f0fca03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CbwWPy4PUE7ag/DPLfrA2BIumuD/WiqYdggoEWJR7oqVoT2V8+/1PAcAfwLr?=
 =?us-ascii?Q?jX1TU+RlTq5niAADfGoTLogGx8xcOwc+MFICsZl1Rb6e6Jv64hdaAasQC8bZ?=
 =?us-ascii?Q?eqg2lfchvEtSwPtqrxBRXhvn1UYvV/QlcbrnFUxow9RvVEHPo2gO+XypABSv?=
 =?us-ascii?Q?nl8k7OlC0ErLMHAWigtjm+y9aJdFDlrGJ7BuJAfKvgnfjV+8Tppq+jBuQs+K?=
 =?us-ascii?Q?bMQjf0MMNBnP6ftuvYFXcz8vy+VJ5sjB/iSDERr25zZVp9bIYOo43P2vACDi?=
 =?us-ascii?Q?UfeM255x+J40S6eT6D6HL2AAe6Mui8+eB8VG54kth19QgDusJw9VO7eeEvNT?=
 =?us-ascii?Q?elZwI1oGYoIEnoWKGgVdIW9YsjCwmEc+X9BVj/+/6ECwOYh+68nMXhNP38KS?=
 =?us-ascii?Q?vERCIWF2xi/Oy/ocWuymBYHAFzi+QuQ/WZJhgOg2o9pEYQhEKQYWUfQjNqv5?=
 =?us-ascii?Q?H9YNCg50Q393Qywo6katLPpAlN7+A+AU2VayMmRVNbx4IjXsEy/+oufMhYyQ?=
 =?us-ascii?Q?sv37GaL+wpYcOjdix08FacEks4IabgjRnMoe8hqETCTFzqBu1ogoqD9t0Jx3?=
 =?us-ascii?Q?aWldWITfgH+jW4IrTAo1YokgvV2bYJLbZHo7RzCVTuhYKXOJFBhRMLQl7K1K?=
 =?us-ascii?Q?Y4i+Wgpod9oEED1h05mgXPT54YlX1JfIVMWMr+SZwYXDKPV3onEl79JaAUSn?=
 =?us-ascii?Q?iO7UtRaZFp7WPiVunqojNXAHuhoHd6VRtES9QUb+ZsD5eYnY2BBZ/69TzBeO?=
 =?us-ascii?Q?qc4ZZ4Ee+W/tP5Rx+OamO4gjh8MKeZi5PUBQ9Rtlv/Au6vc+k0skeqqK+tLc?=
 =?us-ascii?Q?lY3DUa2r35lpDyAn58CGUjAPI/zZW/T3of039uFZWt7Y5Mixrz+D+rDLaAno?=
 =?us-ascii?Q?MmJ6Xkvy+dgTZnBkAkjeCyK9grB5sVe3yRNjjztSzOudnrQCIGIdOEjs/Obm?=
 =?us-ascii?Q?bhT6NEgShTuBCw/5SNDjILNt+yl2kRKbSBc1h1VZHJuLWJnLi0zNYi6VZB6N?=
 =?us-ascii?Q?800lOg+KW8z1sJ5/fpcxCHh5iCmQ1w99Sgp8hqFQQA/k6wXrUxtPb8vWKtwn?=
 =?us-ascii?Q?59n2AahLkzGjlsFfSE75P+Szp8+E3Y1Ya1VoYKySM0Vk2A1wGktyKvjMBZyp?=
 =?us-ascii?Q?3xggfzskTKiucj5l/p5QG5NyM5wfRSKsMOGupGq6PR29++DDXtK/8hR3nrEb?=
 =?us-ascii?Q?HceyCjFdNUF7LE8+59NZed+cDP9bDMKAGNLNpFtuRemvKfxjXMpm6Ibwl01o?=
 =?us-ascii?Q?2ZWP3f0kbDecwH4Puik0SfPrJoJMF+5jTwY5gaXVQlxseA5PZ0yWlgyO+Fqb?=
 =?us-ascii?Q?BewKm7kmm+Zujytfzt3q3RXTl6dQhUyst6DMlIdbkVqUALAuIalwcPNUIBux?=
 =?us-ascii?Q?56QjcvgME9DRJrVDAtaeGCjzDn/EhFrMkMvYfOYyIV8vWicp1FwfTAIb+D9J?=
 =?us-ascii?Q?bYgfAVyynVH8kPwQjpxDhTl86uGl7EHN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR01MB7903.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YHILLyC94fsnY9aDK2pIyJx3Lw+1fTAQvbwGyueXnz0d1Jd05Ooype+DAhxa?=
 =?us-ascii?Q?w1Hgn8rc67q3d4tsSw6XEXsopHI7zNsIoryCaQxPPjH8k0qI5Ur0MMjsx3rE?=
 =?us-ascii?Q?xwKK/harhDyva47cQRvWvpzzmcUHQBVgtufgpH4raiQUsbybeIFEc+RE7jfP?=
 =?us-ascii?Q?BlgLQyfXdZRr61YWmk0HiGXDNq7IygcwJ6Xo1cDiA+RJLJ+q8cBcaDsrvNlN?=
 =?us-ascii?Q?S/Mc209okfMDj4pM7cs4G73X2ITm2yTFZitiOtNFrV1NhJ7BuRKjZuJ5EOgH?=
 =?us-ascii?Q?ShQWQ/XIArEeP+gbc/JInRVBFcPEwHKTiitgN6h9LssRH8YQO5JLAjmgCpAQ?=
 =?us-ascii?Q?8uuphV/QoPC+1fVZ3lKKVHUA8ewN2wgexwulSDdn2GS1Nw+TLPWf+W2/FguG?=
 =?us-ascii?Q?bPHLehdKbew+4lNhmlaPtZKGmGgUMH89LWtXNDQRdsFTv4bTKtM9GKwRf7w5?=
 =?us-ascii?Q?ndXDeOgXJgiUZBF2902wy60GUNB2QsRvLqLrRlU81dAVwR/uuO9JfuyszzHW?=
 =?us-ascii?Q?k32ruJp1HnibXTaTfo4bdMSeC5w48ufsQhgVsRJpFTomaOY705lsUbfhX+6S?=
 =?us-ascii?Q?0nW2gIu4dTrdh3F7xgfD/QyfBabwofAtCDm1aQXTXUUs3/WsWf+JZGtCKhrQ?=
 =?us-ascii?Q?Axo8DbBs10wnoZZAf9GVVOZ9oXv+OuGB4XmBSJPLWbTlS0FGayZe73RiBzdX?=
 =?us-ascii?Q?memb1eOtW4Nitz+gh0ZBiAvpO4r0j1QvtLf5oqsjXqQuQBMGl1P+s5Jzh4JC?=
 =?us-ascii?Q?LuZkoQ5Psgt+jLVNPAJRw5kMF5kFYdER8pOZyJImvF2t2bFIneq+jAUP0V+C?=
 =?us-ascii?Q?8UUVC1iYcBlFRveC2Vkb0R9Qd0k8mnRGVei8kVXYAjK8HyeR3VPMiMgKGvut?=
 =?us-ascii?Q?psibggEmeN+kHAGrULbDL6/xIjMgMlJeqKPEqW8hfvgozPihG/dLzTk+8xfJ?=
 =?us-ascii?Q?7QHS1l8X5+FTyD6G9cpNodVt7LCX6jmeEDgV/RVFjS3UX5xjvgUkD0zEEuMh?=
 =?us-ascii?Q?uJasvEZ2M08gGOh8baJhxr3IQqspyDP0TrQMFHyr2+Ooo1k36II0/ZAcT7EO?=
 =?us-ascii?Q?cJg/SyNZyflrMUneKvzH+8u7JQvsKId/pCmipSl4GypmJvq1yHGAQbGUSGAj?=
 =?us-ascii?Q?Z7MKV6RypVIMk5WE1eoqFZr5kf/4NU3Rk3tLZ/Mg6M5HqsNeUPwrFA6tKImc?=
 =?us-ascii?Q?eQpiKl4WRvGgqJsT3LzoemjERFRxDX+daF80KwBpsxTt0xJ356hq6xE57YRN?=
 =?us-ascii?Q?YEJTbsXtmi1KR//dYMdGSvdBNXdUBdEAsyVa7q927AFTztvfXZKb+ACrh98b?=
 =?us-ascii?Q?9lG2fmr/OrmrhEe3crB1Ma0EX7KXiVRH0OOAQvIee0lRBWwEVVyui2wH7kPX?=
 =?us-ascii?Q?RQy3D3eEB3tr0QToz6yn4kos9ZosO5+OCKUI0eQMpduip2dY0rA0u55hdBKC?=
 =?us-ascii?Q?vxd67jqUQHhbngqzod3JRClqGU15Y/Zf3Y+Yor9EyuWUqky5JFOMYOU7fis+?=
 =?us-ascii?Q?iECwF/ess7xph2D27ve++zT1Klwqf0TxKBxp6BCMb8qRY2zaeLPeGC6QbF00?=
 =?us-ascii?Q?fg8o1rwDmbaHpS27M13VWJRoIzYVa2ywdwoJK6WN1kOPusNEYlVjVKL26c8h?=
 =?us-ascii?Q?zEsS+HvEeBgYQf3s6bxcINk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 765c850e-6dc5-475c-c3af-08dd3f0fca03
X-MS-Exchange-CrossTenant-AuthSource: SN7PR01MB7903.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 20:18:40.5095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqs11l2dawNgcxRxY+Ew4EtaPBdEHSY0IQvMxuy994nHBLKBh6gaG2VZglEY91XyKkZbipqLzu1DlLht+ukLaupE4pdXhN7tmxOF/A4O/LYUBHPsYFXjpHdF1j/2Qzfm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR01MB6897
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_121846_050876_61A1D1D4 
X-CRM114-Status: GOOD (  17.88  )
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

Add an alternative code sequence to work around Ampere erratum
AC03_CPU_50 on AmpereOne and Ampere1A.

Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
direct read of the register will return a value of 0xf8. An incorrect
value from a direct read can only happen with the value 0xf0.

Note: Currently there are no checks against a value of 0xf0, and that
save restore of 0xf8 -> 0xf0 is fine, so this is all future proofing.

Signed-off-by: Zaid Alali <zaidal@os.amperecomputing.com>
---
 arch/arm64/Kconfig                  | 16 ++++++++++++++++
 arch/arm64/include/asm/arch_gicv3.h |  2 +-
 arch/arm64/include/asm/daifflags.h  |  4 ++--
 arch/arm64/include/asm/irqflags.h   |  6 +++---
 arch/arm64/include/asm/sysreg.h     |  9 +++++++++
 arch/arm64/kernel/cpu_errata.c      | 15 +++++++++++++++
 arch/arm64/kernel/entry.S           |  4 ++++
 arch/arm64/tools/cpucaps            |  1 +
 8 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcdd0ed3eca8..8d6e263d66c7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -461,6 +461,22 @@ config AMPERE_ERRATUM_AC03_CPU_38
 
 	  If unsure, say Y.
 
+config AMPERE_ERRATUM_AC03_CPU_50
+	bool "AmpereOne: AC03_CPU_50: Certain checks for ICC_PMR_EL1 that expects the value 0xf0 may read 0xf8 instead"
+	default y
+	help
+	  This option adds an alternative code sequence to work around Ampere
+	  erratum AC03_CPU_50 on AmpereOne and Ampere1A.
+
+	  Due to AC03_CPU_50, when ICC_PMR_EL1 should have a value of 0xf0 a
+	  direct read of the register will return a value of 0xf8. An incorrect
+	  value from a direct read can only happen with the value 0xf0.
+
+	  The workaround for the erratum will do logical AND 0xf0 to the
+	  value read from ICC_PMR_EL1 register before returning the value.
+
+	  If unsure, say Y.
+
 config ARM64_WORKAROUND_CLEAN_CACHE
 	bool
 
diff --git a/arch/arm64/include/asm/arch_gicv3.h b/arch/arm64/include/asm/arch_gicv3.h
index 9e96f024b2f1..299d7e17abdf 100644
--- a/arch/arm64/include/asm/arch_gicv3.h
+++ b/arch/arm64/include/asm/arch_gicv3.h
@@ -127,7 +127,7 @@ static inline void gic_write_bpr1(u32 val)
 
 static inline u32 gic_read_pmr(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	return read_sysreg_pmr();
 }
 
 static __always_inline void gic_write_pmr(u32 val)
diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index fbb5c99eb2f9..2abea378ebd8 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -22,7 +22,7 @@
 static inline void local_daif_mask(void)
 {
 	WARN_ON(system_has_prio_mask_debugging() &&
-		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
+		(read_sysreg_pmr() == (GIC_PRIO_IRQOFF |
 						    GIC_PRIO_PSR_I_SET)));
 
 	asm volatile(
@@ -46,7 +46,7 @@ static inline unsigned long local_daif_save_flags(void)
 
 	if (system_uses_irq_prio_masking()) {
 		/* If IRQs are masked with PMR, reflect it in the flags */
-		if (read_sysreg_s(SYS_ICC_PMR_EL1) != GIC_PRIO_IRQON)
+		if (read_sysreg_pmr() != GIC_PRIO_IRQON)
 			flags |= PSR_I_BIT | PSR_F_BIT;
 	}
 
diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index d4d7451c2c12..757e7e837992 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -30,7 +30,7 @@ static __always_inline void __daif_local_irq_enable(void)
 static __always_inline void __pmr_local_irq_enable(void)
 {
 	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
-		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+		u32 pmr = read_sysreg_pmr();
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
 
@@ -59,7 +59,7 @@ static __always_inline void __daif_local_irq_disable(void)
 static __always_inline void __pmr_local_irq_disable(void)
 {
 	if (IS_ENABLED(CONFIG_ARM64_DEBUG_PRIORITY_MASKING)) {
-		u32 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+		u32 pmr = read_sysreg_pmr();
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
 
@@ -84,7 +84,7 @@ static __always_inline unsigned long __daif_local_save_flags(void)
 
 static __always_inline unsigned long __pmr_local_save_flags(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	return read_sysreg_pmr();
 }
 
 /*
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index b8303a83c0bf..190409fff3b3 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1226,6 +1226,15 @@
 	par;								\
 })
 
+#define read_sysreg_pmr() ({						\
+	u64 pmr = read_sysreg_s(SYS_ICC_PMR_EL1);			\
+	asm(ALTERNATIVE("nop", "and %0, %0, #0xf0",			\
+			ARM64_WORKAROUND_AMPERE_AC03_CPU_50)		\
+			: "+r" (pmr)					\
+			);						\
+	pmr;								\
+})
+
 #define SYS_FIELD_VALUE(reg, field, val)	reg##_##field##_##val
 
 #define SYS_FIELD_GET(reg, field, val)		\
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index a78f247029ae..469f778228c8 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -467,6 +467,14 @@ static const struct midr_range erratum_ac03_cpu_38_list[] = {
 };
 #endif
 
+#ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_50
+static const struct midr_range erratum_ac03_cpu_50_list[] = {
+	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+	MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
+	{},
+};
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -785,6 +793,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.capability = ARM64_WORKAROUND_AMPERE_AC03_CPU_38,
 		ERRATA_MIDR_RANGE_LIST(erratum_ac03_cpu_38_list),
 	},
+#endif
+#ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_50
+	{
+		.desc = "AmpereOne erratum AC03_CPU_50",
+		.capability = ARM64_WORKAROUND_AMPERE_AC03_CPU_50,
+		ERRATA_MIDR_RANGE_LIST(erratum_ac03_cpu_50_list),
+	},
 #endif
 	{
 	}
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 5ae2a34b50bd..aed01144a351 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -318,6 +318,10 @@ alternative_else_nop_endif
 
 	mrs_s	x20, SYS_ICC_PMR_EL1
 	str	w20, [sp, #S_PMR]
+alternative_if ARM64_WORKAROUND_AMPERE_AC03_CPU_50
+	and	x20, x20, #0xf0
+alternative_else_nop_endif
+	str	x20, [sp, #S_PMR_SAVE]
 	mov	x20, #GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET
 	msr_s	SYS_ICC_PMR_EL1, x20
 
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index eb17f59e543c..9e0776bb8c3b 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -93,6 +93,7 @@ WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
 WORKAROUND_AMPERE_AC03_CPU_38
+WORKAROUND_AMPERE_AC03_CPU_50
 WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 WORKAROUND_TSB_FLUSH_FAILURE
 WORKAROUND_TRBE_WRITE_OUT_OF_RANGE
-- 
2.34.1


